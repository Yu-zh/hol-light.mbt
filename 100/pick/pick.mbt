// Translated from upstream 100/pick.ml; edit this file directly.

///|
/// 100/pick.ml:9
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// COLLINEAR_IMP_NEGLIGIBLE
fn step_2() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@measure.negligible_affine_hull_2(), @integration.negligible_subset()]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.collinear_affine_hull()])), t1)
  collinear_imp_negligible_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, collinear(s) → negligible(s)"), t2))
}

///|
let collinear_imp_negligible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_IMP_NEGLIGIBLE")

///|
/// `COLLINEAR_IMP_NEGLIGIBLE`
pub fn collinear_imp_negligible() -> @kernel.Thm {
  collinear_imp_negligible_c.get()
}

///|
/// CONVEX_HULL_3_0
fn step_3() -> Unit raise {
  let t12 = @list.List([@int.asm_arith_tac, @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - (x : Real) - (y : Real)")), @int.asm_arith_tac)])
  let t11 = @simp.asm_rewrite_tac(@list.List([]))
  let t10 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_rid()]))
  let t9 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t8 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t7 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t6 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t5 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t4 = @simp.rewrite_tac(@list.List([@convex.convex_hull_3(), @sets.extension(), @sets.in_elim_thm()]))
  let t3 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(c : _), (a : _), (b : _)} == {a, b, c}"))]))
  let t13 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3), t4), t5), @tactics.ap_term_tac), t6), t7), @tactics.ap_term_tac), t8), t9), t10), @tactics.eq_tac), @tactics.strip_tac), t11), t12)
  convex_hull_3_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], hull(convex, {vec(0), a, b}) == {op_pct((x : Real), a) + op_pct((y : Real), b) | real_of_num(0) <= x && real_of_num(0) <= y && x + y <= real_of_num(1)}"), t13))
}

///|
let convex_hull_3_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HULL_3_0")

///|
/// `CONVEX_HULL_3_0`
pub fn convex_hull_3_0() -> @kernel.Thm {
  convex_hull_3_0_c.get()
}

///|
/// INTERIOR_CONVEX_HULL_3_0
fn step_4() -> Unit raise {
  let t21 = @simp.asm_rewrite_tac(@list.List([]))
  let t20 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac))
  let t19 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t18 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + ((y : Real) + (z : Real)) == real_of_num(1)) == (real_of_num(1) - x - y == z)")), @theorems.unwind_thm1()]))
  let t17 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_rid()]))
  let t16 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (x : Real) == real_of_num(1) && (b : Bool)) == (x == real_of_num(1) && a && b)"))]))
  let t15 = @simp.asm_simp_tac(@list.List([@convex.interior_convex_hull_3()]))
  let t14 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(c : _), (a : _), (b : _)} == {a, b, c}"))]))
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t14), @tactics.strip_tac), t15), t16), t17), t18), t19), @tactics.gen_tac), t20), @tactics.eq_tac), @tactics.strip_tac), t21), @calc_rat.asm_real_arith_tac)
  interior_convex_hull_3_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], !collinear({vec(0), a, b}) → interior(hull(convex, {vec(0), a, b})) == {op_pct((x : Real), a) + op_pct((y : Real), b) | real_of_num(0) < x && real_of_num(0) < y && x + y < real_of_num(1)}"), t22))
}

///|
let interior_convex_hull_3_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CONVEX_HULL_3_0")

///|
/// `INTERIOR_CONVEX_HULL_3_0`
pub fn interior_convex_hull_3_0() -> @kernel.Thm {
  interior_convex_hull_3_0_c.get()
}

///|
/// MEASURE_CONVEX_HULL_2_TRIVIAL
fn step_5() -> Unit raise {
  let t26 = @simp.rewrite_tac(@list.List([@vectors.collinear_sing(), @convex.collinear_segment()]))
  let t25 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), @convex.convex_hull_sing()]))
  let t24 = @tactics.match_mp_tac(collinear_imp_negligible())
  let t23 = @tactics.match_mp_tac(@measure.measure_eq_0())
  let t27 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t23), t24), t25), t26)
  measure_convex_hull_2_trivial_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Cart[Real, 2], measure(hull(convex, {a})) == real_of_num(0)) && (∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], measure(hull(convex, {a, b})) == real_of_num(0))"), t27))
}

///|
let measure_convex_hull_2_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURE_CONVEX_HULL_2_TRIVIAL")

///|
/// `MEASURE_CONVEX_HULL_2_TRIVIAL`
pub fn measure_convex_hull_2_trivial() -> @kernel.Thm {
  measure_convex_hull_2_trivial_c.get()
}

///|
/// NEGLIGIBLE_SEGMENT_2
fn step_6() -> Unit raise {
  let t28 = @simp.simp_tac(@list.List([collinear_imp_negligible(), @convex.collinear_segment()]))
  negligible_segment_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], negligible(segment([(a, b)]))"), t28))
}

///|
let negligible_segment_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEGLIGIBLE_SEGMENT_2")

///|
/// `NEGLIGIBLE_SEGMENT_2`
pub fn negligible_segment_2() -> @kernel.Thm {
  negligible_segment_2_c.get()
}

///|
/// TRIANGLE_DECOMPOSITION
fn step_7() -> Unit raise {
  let t43 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t42 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t44 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@misc.subset_hull(), @convex.convex_convex_hull()])), t42), t43)
  let t41 = @sets.set_tac(@list.List([]))
  let t40 = @tactics.match_mp_tac(@misc.hull_mono())
  let t39 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t37 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t38 = @tactics.spec_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"), t37)
  let t36 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_or()), @tactics.conj_tac))
  let t35 = @simp.asm_rewrite_tac(@list.List([@sets.exists_in_insert(), @sets.not_in_empty(), @sets.in_union()]))
  let t32 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t33 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t34 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"), t33, t32]), @convex.in_convex_hull_exchange()))
  let t31 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t45 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t31), @tactics.disch_tac), t34), t35), t36), t38), t39), t40), t41), t44])
  let t30 = @simp.rewrite_tac(@list.List([@sets.union_subset()]))
  let t29 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t46 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t29), t30), @tactics.conj_tac), t45)
  triangle_decomposition_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], IN(d, hull(convex, {a, b, c})) → hull(convex, {a, b, c}) == UNION(hull(convex, {d, b, c}), UNION(hull(convex, {d, a, c}), hull(convex, {d, a, b})))"), t46))
}

///|
let triangle_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIANGLE_DECOMPOSITION")

///|
/// `TRIANGLE_DECOMPOSITION`
pub fn triangle_decomposition() -> @kernel.Thm {
  triangle_decomposition_c.get()
}

///|
/// TRIANGLE_ADDITIVE_DECOMPOSITION
fn step_8() -> Unit raise {
  let t65 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t64 = @simp.asm_rewrite_tac(@list.List([@sets.insert_inter(), @sets.in_insert(), @sets.not_in_empty(), @sets.inter_empty()]))
  let t63 = @simp.simp_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_insert(), @sets.not_in_empty(), @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (u : (_) -> Bool)) && SUBSET((t : (_) -> Bool), u) → SUBSET(INTER(s, t), u)"))]))
  let t62 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t61 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"), t60]), @convex.convex_hull_exchange_inter()))
  let t56 = @simp.basic_ss(@list.List([]))
  let t59 = @tactics.asm_tac(fn(x58 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s54 = @tactics.conv_tac(x53)
      fn(x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s54(x55)
      }
    })(((x57 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t56, 5, x57))(x58))
  })(@list.List([@topology.compact_union(), @topology.compact_inter(), @convex.compact_convex_hull(), @topology.finite_imp_compact(), @sets.finite_insert(), @sets.finite_empty(), @sets.union_over_inter()]))
  let t50 = @drule.match_mp(triangle_decomposition())
  let t52 = @tactics.first_assum(fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s48 = @tactics.subst1_tac(x47)
      fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s48(x49)
      }
    })(t50(x51))
  })
  let t66 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t52), t59), t61), t62), t63), t64), @tactics.disch_tac), t65), @calc_rat.real_arith_tac)
  triangle_additive_decomposition_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((Cart[Real, 2]) -> Bool) -> Real, ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], (∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, compact(s) && compact(t) → f(UNION(s, t)) == f(s) + (f(t) - f(INTER(s, t)))) && !(a == b) && !(a == c) && !(b == c) && !affine_dependent({a, b, c}) && IN(d, hull(convex, {a, b, c})) → f(hull(convex, {a, b, c})) == f(hull(convex, {a, b, d})) + (f(hull(convex, {a, c, d})) + f(hull(convex, {b, c, d}))) - (f(hull(convex, {a, d})) + (f(hull(convex, {b, d})) + f(hull(convex, {c, d})))) + f(hull(convex, {d}))"), t66))
}

///|
let triangle_additive_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIANGLE_ADDITIVE_DECOMPOSITION")

///|
/// `TRIANGLE_ADDITIVE_DECOMPOSITION`
pub fn triangle_additive_decomposition() -> @kernel.Thm {
  triangle_additive_decomposition_c.get()
}

///|
/// integral_vector
fn step_9() -> Unit raise {
  integral_vector_c.set(@define.define_(@term_syntax.parse_term("(integral_vector : (Cart[Real, N]) -> Bool)((x : Cart[Real, N])) == (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)(x, i)))")))
}

///|
let integral_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("integral_vector")

///|
/// `integral_vector`
pub fn integral_vector() -> @kernel.Thm {
  integral_vector_c.get()
}

///|
/// INTEGRAL_VECTOR_VEC
fn step_10() -> Unit raise {
  let t67 = @simp.rewrite_tac(@list.List([integral_vector(), @vectors.vec_component(), @floor.integer_closed()]))
  integral_vector_vec_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (integral_vector : (Cart[Real, _]) -> Bool)((vec : (Num) -> Cart[Real, _])(n))"), t67))
}

///|
let integral_vector_vec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_VECTOR_VEC")

///|
/// `INTEGRAL_VECTOR_VEC`
pub fn integral_vector_vec() -> @kernel.Thm {
  integral_vector_vec_c.get()
}

///|
/// INTEGRAL_VECTOR_STDBASIS
fn step_11() -> Unit raise {
  let t70 = @simp.rewrite_tac(@list.List([@floor.integer_closed()]))
  let t69 = @simp.asm_simp_tac(@list.List([@vectors.basis_component()]))
  let t68 = @tactics.repeat_tac(@tactics.strip_tac)
  let t71 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([integral_vector()])), t68), t69), @class.cond_cases_tac), t70)
  integral_vector_stdbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (integral_vector : (Cart[Real, N]) -> Bool)((basis : (Num) -> Cart[Real, N])(i))"), t71))
}

///|
let integral_vector_stdbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_VECTOR_STDBASIS")

///|
/// `INTEGRAL_VECTOR_STDBASIS`
pub fn integral_vector_stdbasis() -> @kernel.Thm {
  integral_vector_stdbasis_c.get()
}

///|
/// INTEGRAL_VECTOR_ADD
fn step_12() -> Unit raise {
  let t72 = @simp.simp_tac(@list.List([integral_vector(), @vectors.vector_add_component(), @floor.integer_closed()]))
  integral_vector_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], integral_vector(x) && integral_vector(y) → integral_vector(x + y)"), t72))
}

///|
let integral_vector_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_VECTOR_ADD")

///|
/// `INTEGRAL_VECTOR_ADD`
pub fn integral_vector_add() -> @kernel.Thm {
  integral_vector_add_c.get()
}

///|
/// INTEGRAL_VECTOR_SUB
fn step_13() -> Unit raise {
  let t73 = @simp.simp_tac(@list.List([integral_vector(), @vectors.vector_sub_component(), @floor.integer_closed()]))
  integral_vector_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], integral_vector(x) && integral_vector(y) → integral_vector(x - y)"), t73))
}

///|
let integral_vector_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_VECTOR_SUB")

///|
/// `INTEGRAL_VECTOR_SUB`
pub fn integral_vector_sub() -> @kernel.Thm {
  integral_vector_sub_c.get()
}

///|
/// INTEGRAL_VECTOR_ADD_LCANCEL
fn step_14() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([integral_vector_add(), integral_vector_sub(), @vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + (y : Cart[Real, N]) - x == y"))]))
  integral_vector_add_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], integral_vector(x) → integral_vector(x + y) == integral_vector(y)"), t74))
}

///|
let integral_vector_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_VECTOR_ADD_LCANCEL")

///|
/// `INTEGRAL_VECTOR_ADD_LCANCEL`
pub fn integral_vector_add_lcancel() -> @kernel.Thm {
  integral_vector_add_lcancel_c.get()
}

///|
/// FINITE_BOUNDED_INTEGER_POINTS
fn step_15() -> Unit raise {
  let t88 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t87 = @simp.rewrite_tac(@list.List([@floor.finite_intseg()]))
  let t89 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@cart.finite_cart()), t87), t88])
  let t86 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)(x, i)) && (op_dollar : (Cart[Real, N], Num) -> Real)((a : Cart[Real, N]), i) <= (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) && (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) <= (op_dollar : (Cart[Real, N], Num) -> Real)((b : Cart[Real, N]), i)}"))
  let t85 = @tactics.match_mp_tac(@sets.finite_subset())
  let t84 = @simp.rewrite_tac(@list.List([@sets.subset(), @vectors.in_interval(), integral_vector()]))
  let t82 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t83 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t82]))
  let t81 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t78 = @drule.match_mp(@topology.bounded_subset_closed_interval())
  let t80 = @tactics.first_assum(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s76 = @tactics.mp_tac(x75)
      fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s76(x77)
      }
    })(t78(x79))
  })
  let t90 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t80), t81), t83), t84), @tactics.disch_tac), t85), t86), @tactics.conj_tac), t89)
  finite_bounded_integer_points_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, bounded(s) → FINITE({(x : Cart[Real, N]) | IN(x, s) && integral_vector(x)})"), t90))
}

///|
let finite_bounded_integer_points_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_BOUNDED_INTEGER_POINTS")

///|
/// `FINITE_BOUNDED_INTEGER_POINTS`
pub fn finite_bounded_integer_points() -> @kernel.Thm {
  finite_bounded_integer_points_c.get()
}

///|
/// FINITE_TRIANGLE_INTEGER_POINTS
fn step_16() -> Unit raise {
  let t92 = @simp.simp_tac(@list.List([@convex.finite_imp_bounded_convex_hull(), @sets.finite_insert(), @sets.finite_empty()]))
  let t91 = @tactics.match_mp_tac(finite_bounded_integer_points())
  let t93 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t91), t92)
  finite_triangle_integer_points_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], FINITE({(x : Cart[Real, N]) | IN(x, hull(convex, {a, b, c})) && integral_vector(x)})"), t93))
}

///|
let finite_triangle_integer_points_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_TRIANGLE_INTEGER_POINTS")

///|
/// `FINITE_TRIANGLE_INTEGER_POINTS`
pub fn finite_triangle_integer_points() -> @kernel.Thm {
  finite_triangle_integer_points_c.get()
}

///|
/// LINEAR_INTEGRAL_VECTOR
fn step_17() -> Unit raise {
  let t121 = @simp.asm_simp_tac(@list.List([@floor.integer_closed(), @iterate.in_numseg()]))
  let t120 = @tactics.match_mp_tac(@floor.integer_sum())
  let t119 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t122 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), @tactics.disch_tac), t119), @tactics.strip_tac), t120), t121)
  let t118 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @iterate.sum_delta(), @iterate.in_numseg(), @realarith.real_mul_rid()]))
  let t117 = @simp.asm_simp_tac(@list.List([@vectors.basis_component(), @class.cond_rand(), @class.cond_rator()]))
  let t116 = @simp.asm_rewrite_tac(@list.List([]))
  let t112 = @term_syntax.parse_term("(i : Num)")
  let t115 = @tactics.disch_then(fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s110 = @tactics.mp_tac(x109)
      fn(x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s110(x111)
      }
    })(((x113 : @kernel.Thm) => @bool.spec(t112, x113))(x114))
  })
  let t108 = @simp.rewrite_tac(@list.List([@equal.gsym(integral_vector()), integral_vector_stdbasis()]))
  let t104 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])((j : Num))")
  let t107 = @tactics.first_x_assum(fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s102 = @tactics.mp_tac(x101)
      fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s102(x103)
      }
    })(((x105 : @kernel.Thm) => @bool.spec(t104, x105))(x106))
  })
  let t100 = @term_syntax.parse_term("(j : Num)")
  let t123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : Num)"), t100])), @tactics.strip_tac), t107), t108), t115), t116), t117), t118), t122])
  let t99 = @tactics.repeat_tac(@tactics.gen_tac)
  let t98 = @simp.simp_tac(@list.List([integral_vector(), @vectors.matrix_vector_mul(), @cart.lambda_beta()]))
  let t97 = @simp.abbrev_tac(@term_syntax.parse_term("(M : Cart[Cart[Real, N], N]) == matrix((f : (Cart[Real, N]) -> Cart[Real, N]))"))
  let t96 = @tactics.first_assum(fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x94
    @simp.once_rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@vectors.matrix_works())(th))]))
  })
  let t124 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t96), t97), t98), @tactics.eq_tac), t99), @tactics.disch_tac), t123)
  linear_integral_vector_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], (linear : ((Cart[Real, N]) -> Cart[Real, N]) -> Bool)(f) → (∀ x : Cart[Real, N], (integral_vector : (Cart[Real, N]) -> Bool)(x) → (integral_vector : (Cart[Real, N]) -> Bool)(f(x))) == (∀ i : Num, ∀ j : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && 1 <= j && j <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)((op_dollar : (Cart[Cart[Real, N], N], Num) -> Cart[Real, N])((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])(f), i), j)))"), t124))
}

///|
let linear_integral_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_INTEGRAL_VECTOR")

///|
/// `LINEAR_INTEGRAL_VECTOR`
pub fn linear_integral_vector() -> @kernel.Thm {
  linear_integral_vector_c.get()
}

///|
/// INTEGRAL_BASIS_UNIMODULAR
fn step_18() -> Unit raise {
  let t177 = @simp.asm_simp_tac(@list.List([@determinants.integer_det(), @floor.integer_abs_mul_eq_1()]))
  let t176 = @simp.rewrite_tac(@list.List([@vectors.matrix_i(), @determinants.det_i(), @calc_int.real_abs_num()]))
  let t172 = @term_syntax.parse_term("real_abs")
  let t175 = @tactics.disch_then(fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s170 = @tactics.mp_tac(x169)
      fn(x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s170(x171)
      }
    })(((x173 : @kernel.Thm) => @equal.ap_term(t172, x173))(x174))
  })
  let t167 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]))
  let t166 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t165 = @equal.gsym(@vectors.matrix_compose())
  let t168 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@determinants.det_mul()), t165])), t166), t167), @tactics.all_tac])
  let t164 = @tactics.subgoal_then(@term_syntax.parse_term("(det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])((f : (Cart[Real, N]) -> Cart[Real, N]))) * (det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])((g : (Cart[Real, N]) -> Cart[Real, N]))) == (det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])((I : (Cart[Real, N]) -> Cart[Real, N])))"), fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s162 = @tactics.mp_tac(x161)
    fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s162(x163)
    }
  })
  let t159 = @meson.asm_meson_tac(@list.List([]))
  let t160 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(linear_integral_vector())])), t159), @tactics.all_tac])
  let t158 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && 1 <= j && j <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)((op_dollar : (Cart[Cart[Real, N], N], Num) -> Cart[Real, N])((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])((g : (Cart[Real, N]) -> Cart[Real, N])), i), j))"), fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s156 = @tactics.assume_tac(x155)
    fn(x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s156(x157)
    }
  })
  let t153 = @meson.asm_meson_tac(@list.List([integral_vector_stdbasis()]))
  let t152 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_univ()]))
  let t151 = @tactics.match_mp_tac(@vectors.span_superset())
  let t150 = @tactics.match_mp_tac(@vectors.span_mul())
  let t149 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t148 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t147 = @tactics.match_mp_tac(@vectors.span_vsum())
  let t146 = @simp.gen_rewrite_tac(fn(x143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s144 = @equal.land_conv(x143)
    fn(x145 : @kernel.Term) -> @kernel.Thm raise {
      s144(x145)
    }
  }, @list.List([@equal.gsym(@vectors.basis_expansion())]))
  let t141 = @sets.set_tac(@list.List([]))
  let t142 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.span_linear_image(), @vectors.span_univ()])), t141)])
  let t140 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, N], IN(y, span(IMAGE((f : (Cart[Real, N]) -> Cart[Real, N]), UNIV)))"), fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s138 = @tactics.mp_tac(x137)
    fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s138(x139)
    }
  })
  let t136 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.linear_surjective_imp_injective()])), @tactics.all_tac])
  let t135 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) && b → a && b")))
  let t134 = @simp.asm_simp_tac(@list.List([]))
  let t154 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.linear_bijective_left_right_inverse()), t134), t135), @tactics.conj_tac), t136), t140), t142), @tactics.gen_tac), t146), t147), t148), t149), @tactics.strip_tac), t150), t151), t152), t153), @tactics.all_tac])
  let t133 = @tactics.subgoal_then(@term_syntax.parse_term("∃ g : (Cart[Real, N]) -> Cart[Real, N], linear(g) && (∀ x : Cart[Real, N], g((f : (Cart[Real, N]) -> Cart[Real, N])(x)) == x) && (∀ y : Cart[Real, N], f(g(y)) == y)"), @tactics.strip_assume_tac)
  let t132 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(linear_integral_vector())])), @tactics.all_tac])
  let t131 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && 1 <= j && j <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)((op_dollar : (Cart[Cart[Real, N], N], Num) -> Cart[Real, N])((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])((f : (Cart[Real, N]) -> Cart[Real, N])), i), j))"), fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.assume_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  })
  let t127 = @tactics.repeat_tac(@tactics.strip_tac)
  let t126 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t125 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t178 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq()), @sets.subset(), @sets.forall_in_image()])), t125), t126), t127), t131), t132), t133), t154), t158), t160), t164), t168), t175), t176), t177)
  integral_basis_unimodular_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], linear(f) && IMAGE(f, integral_vector) == integral_vector → abs(det(matrix(f))) == real_of_num(1)"), t178))
}

///|
let integral_basis_unimodular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_BASIS_UNIMODULAR")

///|
/// `INTEGRAL_BASIS_UNIMODULAR`
pub fn integral_basis_unimodular() -> @kernel.Thm {
  integral_basis_unimodular_c.get()
}

///|
/// PICK_ELEMENTARY_TRIANGLE_0
fn step_19() -> Unit raise {
  let t299 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : Real)"), @floor.floor_frac()))
  let t298 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(u : Real)"), @floor.floor_frac()))
  let t297 = @simp.asm_simp_tac(@list.List([@vectors.independent_2(), @equal.gsym(@floor.real_frac_eq_0())]))
  let t296 = @vectors.vector_arith(@term_syntax.parse_term("(op_pct((x : Real), (a : Cart[Real, 2])) + op_pct((y : Real), (b : Cart[Real, 2])) == b) == (op_pct(x, a) + op_pct(y - real_of_num(1), b) == vec(0))"))
  let t300 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(op_pct((x : Real), (a : Cart[Real, 2])) + op_pct((y : Real), (b : Cart[Real, 2])) == a) == (op_pct(x - real_of_num(1), a) + op_pct(y, b) == vec(0))")), t296])), t297), t298), t299), @calc_rat.real_arith_tac)
  let t294 = @meson.meson_tac(@list.List([]))
  let t293 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : Real)"), @floor.floor_frac()))
  let t295 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(u : Real)"), @floor.floor_frac())), t293), @calc_rat.real_arith_tac), t294])
  let t292 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= frac((u : Real)) && real_of_num(0) <= frac((v : Real)) && frac(u) + frac(v) <= real_of_num(1) || real_of_num(0) <= real_of_num(1) - frac(u) && real_of_num(0) <= real_of_num(1) - frac(v) && real_of_num(1) - frac(u) + (real_of_num(1) - frac(v)) <= real_of_num(1)"), fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s290 = @tactics.mp_tac(x289)
    fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s290(x291)
    }
  })
  let t301 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([convex_hull_3_0(), @sets.in_elim_thm()])), t292), t295)
  let t288 = @simp.asm_simp_tac(@list.List([integral_vector_add(), integral_vector_sub()]))
  let t302 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (a : Cart[Real, 2])) + op_pct(real_of_num(1) - (v : Real), (b : Cart[Real, 2])) == a + b - (op_pct(u, a) + op_pct(v, b))"))])), t288)
  let t285 = @simp.rewrite_tac(@list.List([@equal.gsym(@floor.floor_frac())]))
  let t284 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((u : Real) - (x : Real) == (y : Real)) == (u == x + y)"))]))
  let t283 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t282 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((x : Real), (a : Cart[Real, 2])) + op_pct((y : Real), (b : Cart[Real, 2])) - (op_pct((u : Real), a) + op_pct((v : Real), b)) == op_pct(x - u, a) + op_pct(y - v, b)"))]))
  let t279 = @drule.match_mp(integral_vector_sub())
  let t281 = @tactics.disch_then(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s277 = @tactics.mp_tac(x276)
      fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s277(x278)
      }
    })(t279(x280))
  })
  let t275 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t286 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("integral_vector((x : Cart[Real, 2]))")), t275), t281), t282), t283), @tactics.ap_term_tac), @tactics.binop_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t284), t285)
  let t274 = @simp.simp_tac(@list.List([@floor.floor(), @floor.integer_closed()]))
  let t273 = @simp.simp_tac(@list.List([integral_vector(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t272 = @term_syntax.parse_term("integral_vector((b : Cart[Real, 2]))")
  let t287 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x269 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s270 = @tactics.undisch_tac(x269)
    fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s270(x271)
    }
  }, @list.List([@term_syntax.parse_term("integral_vector((a : Cart[Real, 2]))"), t272])), t273), t274), t286])
  let t303 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integral_vector(op_pct(floor((u : Real)), (a : Cart[Real, 2])) + op_pct(floor((v : Real)), (b : Cart[Real, 2])))"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s267 = @tactics.mp_tac(x266)
    fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s267(x268)
    }
  }), t287), t302, t301, t300])
  let t265 = @tactics.repeat_tac(@tactics.conj_tac)
  let t264 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b' : Bool) && (b' → (b : Bool)) && ((a : Bool) || (a' : Bool)) && ((c : Bool) || (c' : Bool) → (x : Bool)) → (a && b → c) → (a' && b' → c') → x")))
  let t260 = @term_syntax.parse_term("op_pct(real_of_num(1) - frac((u : Real)), (a : Cart[Real, 2])) + op_pct(real_of_num(1) - frac((v : Real)), (b : Cart[Real, 2]))")
  let t263 = @tactics.first_x_assum(fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s258 = @tactics.mp_tac(x257)
      fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s258(x259)
      }
    })(((x261 : @kernel.Thm) => @bool.spec(t260, x261))(x262))
  })
  let t253 = @term_syntax.parse_term("op_pct(frac((u : Real)), (a : Cart[Real, 2])) + op_pct(frac((v : Real)), (b : Cart[Real, 2]))")
  let t256 = @tactics.first_assum(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s251 = @tactics.mp_tac(x250)
      fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s251(x252)
      }
    })(((x254 : @kernel.Thm) => @bool.spec(t253, x254))(x255))
  })
  let t249 = @simp.asm_rewrite_tac(@list.List([]))
  let t248 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Real)"))
  let t247 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t246 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Real)"))
  let t245 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t244 = @simp.rewrite_tac(@list.List([@vectors.span_2(), @sets.in_univ(), @sets.in_elim_thm()]))
  let t243 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.in_univ()])), @tactics.all_tac])
  let t242 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), span({(a : Cart[Real, 2]), (b : Cart[Real, 2])}))"), fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s240 = @tactics.mp_tac(x239)
    fn(x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s240(x241)
    }
  })
  let t238 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.vsum_2(), @vectors.vector_2(), integral_vector(), @vectors.forall_2()]))
  let t237 = @simp.rewrite_tac(@list.List([@vectors.matrix_vector_column(), @vectors.transp_transp()]))
  let t236 = @simp.rewrite_tac(@list.List([@vectors.exists_vector_2()]))
  let t235 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t234 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t233 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t231 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t230 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @vectors.forall_2(), @cart.dimindex_2(), @vectors.vector_2()]))
  let t229 = @simp.rewrite_tac(@list.List([integral_vector(), @theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t227 = @term_syntax.parse_term("integral_vector((b : Cart[Real, 2]))")
  let t228 = @tactics.map_every(fn(x224 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s225 = @tactics.undisch_tac(x224)
    fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s225(x226)
    }
  }, @list.List([@term_syntax.parse_term("integral_vector((a : Cart[Real, 2]))"), t227]))
  let t223 = @simp.simp_tac(@list.List([linear_integral_vector(), @vectors.matrix_vector_mul_linear(), @cart.lambda_beta(), @vectors.matrix_of_matrix_vector_mul(), @vectors.transp(), @cart.dimindex_2(), @calc_num.arith()]))
  let t232 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_()])), t223), t228), t229), t230), t231), @tactics.all_tac])
  let t222 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()]))
  let t221 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t220 = @simp.rewrite_tac(@list.List([@determinants.det_2(), @measure.measure_triangle(), @vectors.vector_2(), @determinants.det_transp(), @vectors.vec_component()]))
  let t219 = @simp.rewrite_tac(@list.List([@vectors.matrix_of_matrix_vector_mul(), @vectors.matrix_vector_mul_linear()]))
  let t218 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Cart[Real, 2]) => matrix_vector_mul(transp(vector([(a : Cart[Real, 2]), (b : Cart[Real, 2])])), x)"), integral_basis_unimodular()))
  let t217 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_insert()]))
  let t216 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq()), @sets.subset(), @sets.forall_in_insert(), @sets.forall_in_gspec()]))
  let t214 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty(), @vectors.dim_univ(), @cart.dimindex_2(), @calc_num.arith()]))
  let t213 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty(), @sets.in_insert()]))
  let t212 = @simp.rewrite_tac(@list.List([@sets.has_size(), @sets.finite_insert(), @sets.finite_empty()]))
  let t211 = @tactics.disch_then(@tactics.match_mp_tac)
  let t210 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ(), @sets.subset(), @sets.extension(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t209 = @term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2])}")
  let t215 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"), t209]), @vectors.card_eq_dim())), t210), t211), t212), t213), t214), @tactics.all_tac])
  let t208 = @tactics.subgoal_then(@term_syntax.parse_term("span({(a : Cart[Real, 2]), (b : Cart[Real, 2])}) == UNIV"), fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s206 = @tactics.assume_tac(x205)
    fn(x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s206(x207)
    }
  })
  let t203 = @sets.set_tac(@list.List([]))
  let t202 = @tactics.match_mp_tac(@vectors.span_mono())
  let t199 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(a, t)")))
  let t201 = @tactics.first_x_assum(fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t199(x200))
  })
  let t198 = @simp.asm_simp_tac(@list.List([@convex.affine_hull_eq_span(), @misc.hull_inc(), @sets.in_insert()]))
  let t197 = @simp.asm_simp_tac(@list.List([@convex.collinear_3_affine_hull()]))
  let t196 = @list.List([@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(c : _), (a : _), (b : _)} == {c, b, a}"))])), @tactics.all_tac])
  let t195 = @simp.rewrite_tac(@list.List([@vectors.dependent(), @sets.exists_in_insert(), @sets.not_in_empty()]))
  let t194 = @simp.rewrite_tac(@list.List([@vectors.independent(), @class.contrapos_thm()]))
  let t204 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({vec(0), (a : Cart[Real, 2]), (b : Cart[Real, 2])})")), t194), t195), @tactics.strip_tac), t196), t197), t198), t201), t202), t203), @tactics.all_tac])
  let t193 = @tactics.subgoal_then(@term_syntax.parse_term("independent({(a : Cart[Real, 2]), (b : Cart[Real, 2])})"), fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s191 = @tactics.assume_tac(x190)
    fn(x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s191(x192)
    }
  })
  let t187 = @term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2])")
  let t188 = @term_syntax.parse_term("(b : Cart[Real, 2]) == vec(0)")
  let t189 = @tactics.map_every(fn(x184 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x184
    let t186 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()])), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t186)
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2]) == vec(0)"), t188, t187]))
  let t183 = @tactics.pop_assum(fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s181 = @tactics.mp_tac(x180)
    fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s181(x182)
    }
  })
  let t179 = @simp.asm_simp_tac(@list.List([@measure.measure_eq_0(), collinear_imp_negligible(), @convex.collinear_convex_hull_collinear()]))
  let t304 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t179), t183), t189), @tactics.disch_tac), t193), t204), t208), t215), t216), t217), @tactics.strip_tac), t218), t219), t220), @tactics.ants_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t221), t222), @tactics.conj_tac), t232), t233), t234), t235), @tactics.disch_tac), t236), t237), t238), t242), t243), t244), t245), t246), t247), t248), @tactics.disch_tac), t249), t256), t263), t264), t265), t303)
  pick_elementary_triangle_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], {(x : Cart[Real, 2]) | IN(x, hull(convex, {vec(0), a, b})) && integral_vector(x)} == {vec(0), a, b} → measure(hull(convex, {vec(0), a, b})) == (if collinear({vec(0), a, b}) { real_of_num(0) } else { real_of_num(1) / real_of_num(2) })"), t304))
}

///|
let pick_elementary_triangle_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK_ELEMENTARY_TRIANGLE_0")

///|
/// `PICK_ELEMENTARY_TRIANGLE_0`
pub fn pick_elementary_triangle_0() -> @kernel.Thm {
  pick_elementary_triangle_0_c.get()
}

///|
/// PICK_ELEMENTARY_TRIANGLE
fn step_20() -> Unit raise {
  let t322 = @simp.rewrite_tac(@list.List([pick_elementary_triangle_0()]))
  let t321 = @simp.simp_tac(@list.List([integral_vector_add_lcancel(), @vectors.vector_add_rid()]))
  let t320 = @determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t319 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_elim_thm()]))
  let t315 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t318 = @tactics.disch_then(fn(x317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s313 = @tactics.mp_tac(x312)
      fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s313(x314)
      }
    })(((x316 : @kernel.Thm) => @bool.spec(t315, x316))(x317))
  })
  let t311 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t308 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → (∀ x : _, IN(x, s) == IN(x, t)) && s == t")))
  let t310 = @tactics.disch_then(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s306 = @tactics.mp_tac(x305)
      fn(x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s306(x307)
      }
    })(t308(x309))
  })
  let t323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t310), t311), t318), t319), t320), t321), t322)
  pick_elementary_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], {(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b, c})) && integral_vector(x)} == {a, b, c} → measure(hull(convex, {a, b, c})) == (if collinear({a, b, c}) { real_of_num(0) } else { real_of_num(1) / real_of_num(2) })"), t323))
}

///|
let pick_elementary_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK_ELEMENTARY_TRIANGLE")

///|
/// `PICK_ELEMENTARY_TRIANGLE`
pub fn pick_elementary_triangle() -> @kernel.Thm {
  pick_elementary_triangle_c.get()
}

///|
/// PICK_TRIANGLE_FLAT
fn step_21() -> Unit raise {
  let t362 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_empty(), @calc_num.arith(), @sets.not_in_empty()]))
  let t361 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t360 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, 2]) | IN(x, {(c : Cart[Real, 2])}) && integral_vector(x)} == {c}"), fn(x357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s358 = @tactics.subst1_tac(x357)
    fn(x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s358(x359)
    }
  })
  let t356 = @list.List([@meson.asm_meson_tac(@list.List([@convex.inter_segment(), @topology.segment_sym()])), @tactics.all_tac])
  let t355 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), segment([((a : Cart[Real, 2]), c)])) == {c}"), fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s353 = @tactics.subst1_tac(x352)
    fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s353(x354)
    }
  })
  let t363 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, (t : (_) -> Bool)) && P(x)}) == {(x : _) | IN(x, INTER(s, t)) && P(x)}"))])), t355), t356), t360), t361), t362)
  let t351 = @sets.set_tac(@list.List([]))
  let t350 = @simp.simp_tac(@list.List([finite_bounded_integer_points(), @convex.bounded_segment()]))
  let t364 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t350), t351), t363])
  let t349 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(z : Num) <= (x : Num) && z == 1 → x + (y : Num) == x + y - z + 1")))
  let t348 = @simp.simp_tac(@list.List([@sets.card_union_gen(), finite_bounded_integer_points(), @convex.bounded_segment()]))
  let t347 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == UNION({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))]))
  let t346 = @list.List([@meson.asm_meson_tac(@list.List([@topology.segment_sym(), @convex.union_segment()])), @tactics.all_tac])
  let t345 = @tactics.subgoal_then(@term_syntax.parse_term("segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]) == UNION(segment([(b, (c : Cart[Real, 2]))]), segment([(a, c)]))"), fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.subst1_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  })
  let t341 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t340 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) == (c : Real) - ((a : Real) + ((b : Real) + c)) / real_of_num(2) + real_of_num(1) / real_of_num(2)) == (a + b == c + real_of_num(1))"))]))
  let t338 = @simp.rewrite_tac(@list.List([@convex.collinear_segment()]))
  let t337 = @tactics.match_mp_tac(collinear_imp_negligible())
  let t339 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_eq_0()), t337), t338), @tactics.all_tac])
  let t336 = @tactics.subgoal_then(@term_syntax.parse_term("measure(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])) == real_of_num(0)"), fn(x333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s334 = @tactics.subst1_tac(x333)
    fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s334(x335)
    }
  })
  let t331 = @simp.simp_tac(@list.List([@topology.ends_in_segment(), @misc.hull_inc(), @sets.in_insert()]))
  let t330 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), @sets.insert_subset(), @sets.empty_subset()]))
  let t329 = @tactics.match_mp_tac(@convex.convex_hulls_eq())
  let t332 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.segment_convex_hull()])), t329), t330), t331), @tactics.all_tac])
  let t328 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}) == segment([(a, b)])"), fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s326 = @tactics.subst1_tac(x325)
    fn(x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s326(x327)
    }
  })
  let t324 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull())]))
  let t365 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t324), t328), t332), t336), t339), t340), t341), t345), t346), t347), t348), t349), @tactics.conj_tac), t364)
  pick_triangle_flat_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], integral_vector(a) && integral_vector(b) && integral_vector(c) && IN(c, segment([(a, b)])) → measure(hull(convex, {a, b, c})) == real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b, c})) && integral_vector(x)})) - (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {b, c})) && integral_vector(x)})) + (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, c})) && integral_vector(x)})) + real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b})) && integral_vector(x)})))) / real_of_num(2) + real_of_num(1) / real_of_num(2)"), t365))
}

///|
let pick_triangle_flat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK_TRIANGLE_FLAT")

///|
/// `PICK_TRIANGLE_FLAT`
pub fn pick_triangle_flat() -> @kernel.Thm {
  pick_triangle_flat_c.get()
}

///|
/// PICK_TRIANGLE_ALT
fn step_22() -> Unit raise {
  let tac : (@kernel.Term) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x366 : @kernel.Term) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let a = x366
    fn(x367 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let bc = x367
      let t397 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
      let t394 = @drule.match_mp(@polytope.extreme_point_of_convex_hull())
      let t396 = @tactics.disch_then(fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s392 = @tactics.mp_tac(x391)
          fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s392(x393)
          }
        })(t394(x395))
      })
      let t390 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert()]))
      let t389 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"), a]), @polytope.extreme_point_of_convex_hull_affine_independent()))
      let t386 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
      let t387 = @list.List([@simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()])), t386])
      let t381 = @term_syntax.parse_term("IN((x : Cart[Real, 2]), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))")
      let t385 = @tactics.subgoal_then(@basics.subst(@list.List([(a, @term_syntax.parse_term("(x : Cart[Real, 2])"))]), t381), fn(x382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s383 = @tactics.mp_tac(x382)
        fn(x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s383(x384)
        }
      })
      let t380 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert(), @sets.insert_subset(), @sets.empty_subset()]))
      let t388 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_hulls_eq()), t380), t385), t387), @tactics.all_tac])
      let t375 = @term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}) == hull(convex, (bc : (Cart[Real, 2]) -> Bool))")
      let t379 = @tactics.subgoal_then(@basics.subst(@list.List([(bc, @term_syntax.parse_term("(bc : (Cart[Real, 2]) -> Bool)"))]), t375), fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s377 = @tactics.assume_tac(x376)
        fn(x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s377(x378)
        }
      })
      let t373 = @simp.asm_simp_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_insert(), @misc.hull_inc()]))
      let t372 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
      let t371 = @tactics.match_mp_tac(@misc.hull_minimal())
      let t374 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET({(x : _) | IN(x, s) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, t) && P(x)})"))), t371), t372), t373), @tactics.disch_tac])
      let t370 = @simp.rewrite_tac(@list.List([@sets.psubset()]))
      let t369 = @simp.rewrite_tac(@list.List([finite_triangle_integer_points()]))
      @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t369), t370), @tactics.conj_tac), t374), t379), t388), t389), t390), t396), t397)
    }
  }
  let t552 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t551 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)} == INTER(s, P)"))]))
  let t550 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t549 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t547 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t548 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex_hull_sing()])), t547), @tactics.all_tac])
  let t546 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, 2]) | IN(x, hull(convex, {(d : Cart[Real, 2])})) && integral_vector(x)} == {d}"), fn(x543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s544 = @tactics.subst1_tac(x543)
    fn(x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s544(x545)
    }
  })
  let t541 = @tactics.disch_then(fn(x538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s539 = @tactics.subst1_tac(x538)
    fn(x540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s539(x540)
    }
  })
  let t537 = @term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (d : Cart[Real, 2])}")
  let t542 = @list.List([tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))(t537), t541])
  let t535 = @tactics.disch_then(fn(x532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s533 = @tactics.subst1_tac(x532)
    fn(x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s533(x534)
    }
  })
  let t531 = @term_syntax.parse_term("{(a : Cart[Real, 2]), (c : Cart[Real, 2]), (d : Cart[Real, 2])}")
  let t536 = @list.List([tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))(t531), t535])
  let t529 = @tactics.disch_then(fn(x526 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s527 = @tactics.subst1_tac(x526)
    fn(x528 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s527(x528)
    }
  })
  let t525 = @term_syntax.parse_term("{(b : Cart[Real, 2]), (c : Cart[Real, 2]), (d : Cart[Real, 2])}")
  let t530 = @list.List([tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))(t525), t529])
  let t524 = @simp.asm_rewrite_tac(@list.List([]))
  let t523 = @tactics.first_x_assum(fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x513
    let t520 = @term_syntax.parse_term("(d : Cart[Real, 2])")
    let t521 = @term_syntax.parse_term("(c : Cart[Real, 2])")
    let t522 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t521, t520]), th))
    let t517 = @term_syntax.parse_term("(d : Cart[Real, 2])")
    let t518 = @term_syntax.parse_term("(c : Cart[Real, 2])")
    let t519 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t518, t517]), th))
    let t515 = @term_syntax.parse_term("(d : Cart[Real, 2])")
    let t516 = @term_syntax.parse_term("(b : Cart[Real, 2])")
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t516, t515]), th)), t519), t522)
  })
  let t511 = @tactics.disch_then(fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s509 = @tactics.subst1_tac(x508)
    fn(x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s509(x510)
    }
  })
  let t507 = @simp.asm_simp_tac(@list.List([finite_bounded_integer_points(), @topology.compact_imp_bounded()]))
  let t504 = @simp.rewrite_tac(@list.List([@sets.inter_subset()]))
  let t505 = @tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t504)
  let t506 = @list.List([@tactics.match_mp_tac(@sets.card_union_gen()), t505])
  let t503 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) == (y : Num) + (z : Num) - (w : Num) && w <= z → x + w == y + z")))
  let t502 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t501 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real) + ((z : Real) - (w : Real))) == (x + w == y + z)"))]))
  let t500 = @tactics.repeat_tac(@tactics.strip_tac)
  let t499 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, INTER((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == INTER({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))
  let t512 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == UNION({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})")), t499])), t500), t501), t502), t503), @tactics.conj_tac), t506), t507), t511])
  let t498 = @simp.asm_rewrite_tac(@list.List([]))
  let t493 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t494 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t495 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t496 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t497 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool) => real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, s) && integral_vector(x)}))"), t496, t495, t494, t493]), triangle_additive_decomposition()))
  let t492 = @simp.rewrite_tac(@list.List([measure_convex_hull_2_trivial(), @calc_int.real_add_rid(), @real.real_sub_rzero()]))
  let t491 = @tactics.disch_then(fn(x488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s489 = @tactics.subst1_tac(x488)
    fn(x490 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s489(x490)
    }
  })
  let t487 = @simp.asm_rewrite_tac(@list.List([]))
  let t486 = @simp.simp_tac(@list.List([@measure.measure_union(), @measure.measurable_compact()]))
  let t481 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t482 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t483 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t484 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t485 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(measure : ((Cart[Real, 2]) -> Bool) -> Real)"), t484, t483, t482, t481]), triangle_additive_decomposition()))
  let t480 = @simp.asm_rewrite_tac(@list.List([]))
  let t477 = @simp.gen_rewrite_rule(fn(x474 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s475 = @equal.rand_conv(x474)
    fn(x476 : @kernel.Term) -> @kernel.Thm raise {
      s475(x476)
    }
  }, @list.List([@convex.collinear_3_eq_affine_dependent()]))
  let t479 = @tactics.first_assum(fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s472 = @tactics.mp_tac(x471)
      fn(x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s472(x473)
      }
    })(t477(x478))
  })
  let t469 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t468 = @tactics.disch_then(@tactics.match_mp_tac)
  let t467 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t466 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_insert(), @sets.in_elim_thm()]))
  let t464 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!((s : (_) -> Bool) == (t : (_) -> Bool)) → SUBSET(t, s) → (∃ d : _, IN(d, s) && !IN(d, t))")))
  let t470 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s462 = @tactics.mp_tac(x461)
      fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s462(x463)
      }
    })(t464(x465))
  }), t466), t467), t468), t469), @tactics.all_tac])
  let t460 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Cart[Real, 2], IN(d, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) && integral_vector(d) && !(d == a) && !(d == b) && !(d == c)"), @tactics.strip_assume_tac)
  let t456 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t455 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t454 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t457 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()])), t454), t455), t456)
  let t448 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t447 = @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t444 = @drule.match_mp(@vectors.between_imp_collinear())
  let t446 = @tactics.disch_then(fn(x445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s442 = @tactics.mp_tac(x441)
      fn(x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s442(x443)
      }
    })(t444(x445))
  })
  let t439 = @equal.gsym(@topology.between_in_segment())
  let t440 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), t439]))
  let t438 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : _), (s : (_) -> Bool)) → INTER({x}, s) == {}")))
  let t449 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.insert_diff(), @sets.in_insert(), @sets.not_in_empty(), @sets.empty_diff()])), t438), t440), t446), t447), t448)
  let t437 = @sets.set_tac(@list.List([]))
  let t450 = @tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t437)
  let t451 = @tactics.match_accept_tac(@misc.hull_subset())
  let t452 = @list.List([@sets.set_tac(@list.List([])), t451, t450, t449])
  let t436 = @tactics.repeat_tac(@tactics.conj_tac)
  let t434 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (cs : (_) -> Bool)) && (P : (_) -> Bool)(x)} == (s : (_) -> Bool) → SUBSET((t : (_) -> Bool), s) && SUBSET(t, (ct : (_) -> Bool)) && SUBSET(ct, cs) && INTER(DIFF(s, t), ct) == {} → {(x : _) | IN(x, ct) && P(x)} == t")))
  let t453 = @tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t434(x435))
  }), t436), t452)
  let t458 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t453), t457])
  let t432 = @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s430 = @tactics.subst1_tac(x429)
    fn(x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s430(x431)
    }
  })
  let t433 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, 2]) | IN(x, hull(convex, {(b : Cart[Real, 2]), (c : Cart[Real, 2])})) && integral_vector(x)} == {b, c} && {(x : Cart[Real, 2]) | IN(x, hull(convex, {(a : Cart[Real, 2]), c})) && integral_vector(x)} == {a, c} && {(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b})) && integral_vector(x)} == {a, b}"), t432)
  let t459 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([pick_elementary_triangle()])), t433), t458), @tactics.all_tac])
  let t428 = @class.asm_cases_tac(@term_syntax.parse_term("{(x : Cart[Real, 2]) | IN(x, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) && integral_vector(x)} == {a, b, c}"))
  let t425 = @term_syntax.parse_term("(b : Cart[Real, 2]) == (c : Cart[Real, 2])")
  let t426 = @term_syntax.parse_term("(a : Cart[Real, 2]) == (c : Cart[Real, 2])")
  let t427 = @tactics.map_every(fn(x422 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x422
    let t424 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()])), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t424)
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2])"), t426, t425]))
  let t421 = @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t418 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @calc_int.real_add_ac()]))
  let t417 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)} == INTER(s, P)"))]))
  let t419 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@meson.asm_meson_tac(@list.List([@topology.segment_sym()])), @tactics.all_tac])), t417), t418)
  let t412 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t413 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t414 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t413, t412]), pick_triangle_flat()))
  let t410 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t411 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t415 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t411, t410]), pick_triangle_flat()))
  let t408 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t409 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t416 = @list.List([@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t409, t408]), pick_triangle_flat())), t415, t414])
  let t407 = @tactics.repeat_tac(@tactics.strip_tac)
  let t406 = @simp.rewrite_tac(@list.List([@topology.between_in_segment()]))
  let t404 = @simp.gen_rewrite_rule(fn(x403 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x403
  }, @list.List([@vectors.collinear_between_cases()]))
  let t420 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s401 = @tactics.mp_tac(x400)
      fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s401(x402)
      }
    })(t404(x405))
  }), t406), t407), t416), t419), @tactics.all_tac])
  let t399 = @class.asm_cases_tac(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t398 = @wf.wf_induct_tac(@term_syntax.parse_term("CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) && integral_vector(x)})"))
  let t553 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t398), t399), t420), t421), t427), @tactics.disch_tac), @tactics.strip_tac), t428), t459), t460), t470), t479), t480), @tactics.disch_tac), t485), t486), t487), t491), t492), t497), t498), @tactics.ants_tac), t512), t523), t524), @tactics.ants_tac), t530), @tactics.ants_tac), t536), @tactics.ants_tac), t542), t546), t548), t549), t550), t551), t552), @calc_rat.real_arith_tac)
  pick_triangle_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], integral_vector(a) && integral_vector(b) && integral_vector(c) → measure(hull(convex, {a, b, c})) == real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b, c})) && integral_vector(x)})) - (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {b, c})) && integral_vector(x)})) + (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, c})) && integral_vector(x)})) + real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, hull(convex, {a, b})) && integral_vector(x)})))) / real_of_num(2) + real_of_num(1) / real_of_num(2)"), t553))
}

///|
let pick_triangle_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK_TRIANGLE_ALT")

///|
/// `PICK_TRIANGLE_ALT`
pub fn pick_triangle_alt() -> @kernel.Thm {
  pick_triangle_alt_c.get()
}

///|
/// PICK_TRIANGLE
fn step_23() -> Unit raise {
  let t587 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull(), @sets.insert_ac()]))
  let t586 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)} == INTER(s, P)"))]))
  let t585 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t584 = @simp.simp_tac(@list.List([@sets.not_in_empty(), @sets.empty_gspec(), @sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t583 = @simp.asm_simp_tac(@list.List([@sets.card_subset(), @sets.sing_subset(), @sets.in_elim_thm(), @topology.ends_in_segment(), finite_bounded_integer_points(), @convex.bounded_segment()]))
  let t582 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(c : Num) <= (ca : Num) && (a : Num) <= (ab : Num) && (b : Num) <= (bc : Num) && (bc' : Num) + ((ac' : Num) + ((ab' : Num) + (a + (b + c)))) == ab + (bc + (ca + 3)) → bc' + (ac' + ab') == ab + (bc + ca - c) - (b + a) + 3")))
  let t581 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.empty_gspec(), @sets.card_clauses(), @arith.sub_0()]))
  let t580 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t579 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!((a : _) == (b : _)) → INTER({b}, {a}) == {}"))]))
  let t578 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.collinear_2(), @sets.insert_ac()])), @tactics.all_tac])
  let t577 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == (a : Cart[Real, 2])"))
  let t576 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(P : (_) -> Bool)((a : _)) → {(x : _) | IN(x, {a}) && P(x)} == {a}"))]))
  let t575 = @list.List([@meson.asm_meson_tac(@list.List([@convex.inter_segment(), @topology.segment_sym(), @sets.insert_ac()])), @tactics.all_tac])
  let t573 = @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s571 = @tactics.subst1_tac(x570)
    fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s571(x572)
    }
  })
  let t574 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), segment([(c, (a : Cart[Real, 2]))])) == {c} && INTER(segment([(a, b)]), segment([(b, c)])) == {b} && INTER(segment([(a, b)]), segment([(c, a)])) == {a}"), t573)
  let t569 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, (t : (_) -> Bool)) && P(x)}) == {(x : _) | IN(x, INTER(s, t)) && P(x)}"))]))
  let t568 = @simp.simp_tac(@list.List([@sets.card_union_gen(), finite_bounded_integer_points(), @sets.finite_inter(), @sets.finite_union(), @convex.bounded_segment(), @sets.union_over_inter()]))
  let t588 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == UNION({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))])), t568), t569), t574), t575), t576), t577), t578), t579), t580), t581), t582), t583), t584), t585), t586), t587), @int.arith_tac)
  let t567 = @sets.set_tac(@list.List([]))
  let t566 = @tactics.match_mp_tac(@misc.hull_mono())
  let t565 = @tactics.repeat_tac(@tactics.conj_tac)
  let t564 = @simp.rewrite_tac(@list.List([@sets.union_subset(), @convex.segment_convex_hull()]))
  let t563 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET({(x : _) | IN(x, s) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, t) && P(x)})")))
  let t562 = @simp.asm_simp_tac(@list.List([finite_bounded_integer_points(), @convex.finite_imp_bounded_convex_hull(), @sets.finite_insert(), @sets.finite_empty()]))
  let t560 = @tactics.match_mp_tac(@equal.gsym(@sets.card_diff()))
  let t561 = @list.List([@tactics.match_mp_tac(@sets.card_subset()), t560])
  let t559 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(y : Num) <= (x : Num) && x - y == (z : Num) → z + y == x")))
  let t589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()])), t559), @tactics.conj_tac), t561), t562), t563), t564), t565), t566), t567), t588])
  let t558 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(i : Real) + (c : Real) == (s : Real) && (ccc : Real) == c + real_of_num(3) → s - ccc / real_of_num(2) + real_of_num(1) / real_of_num(2) == i + (c / real_of_num(2) - real_of_num(1))")))
  let t557 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, DIFF((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == DIFF({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))]))
  let t556 = @simp.rewrite_tac(@list.List([@polytope.interior_of_triangle(), @polytope.frontier_of_triangle()]))
  let t555 = @simp.asm_simp_tac(@list.List([pick_triangle_alt()]))
  let t554 = @simp.asm_simp_tac(@list.List([@measure.measure_eq_0(), collinear_imp_negligible(), @convex.collinear_convex_hull_collinear()]))
  let t590 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t554), t555), t556), t557), t558), @tactics.conj_tac), t589)
  pick_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], integral_vector(a) && integral_vector(b) && integral_vector(c) → measure(hull(convex, {a, b, c})) == (if collinear({a, b, c}) { real_of_num(0) } else { real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, interior(hull(convex, {a, b, c}))) && integral_vector(x)})) + (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, frontier(hull(convex, {a, b, c}))) && integral_vector(x)})) / real_of_num(2) - real_of_num(1)) })"), t590))
}

///|
let pick_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK_TRIANGLE")

///|
/// `PICK_TRIANGLE`
pub fn pick_triangle() -> @kernel.Thm {
  pick_triangle_c.get()
}

///|
/// PARITY_LEMMA
fn step_24() -> Unit raise {
  let t597 = @simp.rewrite_tac(@list.List([@vectors.between(), @vectors.dist_sym()]))
  let t596 = @tactics.repeat_tac(@tactics.pop_assum(fn(x593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s594 = @tactics.mp_tac(x593)
    fn(x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s594(x595)
    }
  }))
  let t592 = @simp.asm_rewrite_tac(@list.List([]))
  let t591 = @tactics.match_mp_tac(@topology.collinear_dist_in_open_segment())
  let t598 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t591), t592), t596), t597), @vectors.norm_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], collinear({y, a, b}) && between(x, (a, b)) && distance((y, x)) < distance((x, b)) && distance((y, x)) < distance((x, a)) → IN(y, segment((a, b)))"), t598)
  let t601 = @meson.asm_meson_tac(@list.List([]))
  let t600 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_lneg())]))
  let t599 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) == (real_of_num(0) < x || real_of_num(0) < -x)"))]))
  let t602 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.gen_tac), t599), t600), t601)
  let symlemma = @tactics.prove(@term_syntax.parse_term("(∀ n : Cart[Real, N], (P : (Cart[Real, N]) -> Bool)(-n) == P(n)) && (∀ n : Cart[Real, N], real_of_num(0) < dot(n, (x : Cart[Real, N])) → P(n)) → (∀ n : Cart[Real, N], !(dot(n, x) == real_of_num(0)) → P(n))"), t602)
  let t1056 = @simp.asm_rewrite_tac(@list.List([]))
  let t1055 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t1057 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball(), @sets.in_inter(), @sets.in_elim_thm()])), t1055), t1056)
  let t1052 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq(), @real.real_lt_01()]))
  let t1051 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < -(x : Real)) == (x < real_of_num(0))"))]))
  let t1050 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t1049 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1053 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dot_rmul(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) * (y : Real) < real_of_num(0)) == (real_of_num(0) < x * -y)"))])), t1049), t1050), t1051), t1052)
  let t1048 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq(), @real.real_lt_div2_eq()]))
  let t1047 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < (e : Real) → abs(min(real_of_num(1) / real_of_num(2), x)) < e")))
  let t1054 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@real.real_lt_rdiv_eq()), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()])), t1047), t1048), @calc_rat.asm_real_arith_tac), t1053])
  let t1046 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + (a : Cart[Real, N]) - x == a"))]))
  let t1045 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, N]) - (x + (a : Cart[Real, N]))) == norm(a)"))]))
  let t1058 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball(), @sets.in_inter(), @sets.in_elim_thm(), @vectors.dist()])), t1045), t1046), @tactics.conj_tac), t1054)
  let t1042 = @simp.asm_rewrite_tac(@list.List([]))
  let t1041 = @tactics.match_mp_tac(@vectors.between_imp_collinear())
  let t1040 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _), (b : _), (a : _)} == {a, x, b}"))]))
  let t1039 = @simp.asm_simp_tac(@list.List([@equal.gsym(@convex.collinear_3_affine_hull())]))
  let t1038 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t1037 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t1036 = @simp.simp_tac(@list.List([@misc.subset_hull(), @convex.affine_imp_convex(), @convex.affine_affine_hull()]))
  let t1043 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @convex.segment_convex_hull()])), t1036), t1037), t1038), t1039), t1040), t1041), t1042)
  let t1035 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realarith.real_lt_refl()]))
  let t1034 = @simp.once_rewrite_tac(@list.List([@vectors.dot_sym()]))
  let t1033 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.orthogonal()])))
  let t1032 = @simp.rewrite_tac(@list.List([@vectors.dot_rmul(), @vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (v : Real), (x : Cart[Real, N])) + op_pct(v, (b : Cart[Real, N])) - x == op_pct(v, b - x)"))]))
  let t1031 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((u : Real) + (v : Real) == real_of_num(1)) == (u == real_of_num(1) - v)"))]))
  let t1030 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1044 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.affine_hull_2(), @sets.forall_in_gspec(), @sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == (∀ x : _, IN(x, s) → !IN(x, t))"))])), t1030), t1031), t1032), t1033), t1034), t1035), t1043])
  let t1029 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, {(x : Cart[Real, 2]), (b : Cart[Real, 2])})"))
  let t1028 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, INTER(t, (u : (_) -> Bool)) == {} && SUBSET((s : (_) -> Bool), t) → INTER(s, u) == {}")))
  let t1027 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_univ(), @topology.in_ball(), @realarith.real_not_lt()]))
  let t1026 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), DIFF(UNIV, (b : (_) -> Bool))) && INTER((l : (_) -> Bool), (w : (_) -> Bool)) == {} → SUBSET(INTER(b, w), DIFF(UNIV, UNION(p, l)))")))
  let t1059 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.pathstart_linepath(), @paths.path_image_join(), @paths.path_linepath()])), t1026), t1027), t1028), t1029), @tactics.conj_tac), t1044)
  let t1025 = @simp.rewrite_tac(@list.List([@convex.convex_ball(), @vectors.dot_rsub(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) < real_of_num(0)) == (a < b)")), @convex.convex_halfspace_lt()]))
  let t1024 = @tactics.match_mp_tac(@convex.convex_inter())
  let t1060 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_connected()), t1024), t1025), t1059, t1058, t1057])
  let t1023 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1061 = @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("INTER(ball(((x : Cart[Real, 2]), (e : Real))), {(w : Cart[Real, 2]) | dot((n : Cart[Real, 2]), w - x) < real_of_num(0)})")), t1023), t1060)
  let t1019 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t1018 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1017 = @tactics.match_mp_tac(@real.real_lt_div())
  let t1016 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → !(min(real_of_num(1) / real_of_num(2), x) == real_of_num(0))")))
  let t1020 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_sub_eq(), @vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, N]) + (a : Cart[Real, N]) == x) == (a == vec(0))"))])), t1016), t1017), t1018), t1019)
  let t1015 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t1014 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1013 = @simp.rewrite_tac(@list.List([@real.real_le_min()]))
  let t1012 = @simp.rewrite_tac(@list.List([]))
  let t1011 = @tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((c : Cart[Real, 2]) - (x : Cart[Real, 2])))"))
  let t1021 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment(), @vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + op_pct((a : Real), (y : Cart[Real, N]) - x) == op_pct(real_of_num(1) - a, x) + op_pct(a, y)"))])), t1011), t1012), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t1013), t1014), t1015)
  let t1010 = @sets.set_tac(@list.List([]))
  let t1009 = @simp.rewrite_tac(@list.List([@topology.open_segment()]))
  let t1008 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), segment(((c : Cart[Real, 2]), (d : Cart[Real, 2])))) == {(x : Cart[Real, 2])}"))
  let t1007 = @simp.rewrite_tac(@list.List([@convex.subset_segment(), @topology.ends_in_segment()]))
  let t1005 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER((cd : (_) -> Bool), (p : (_) -> Bool)) == {(x : _)} → SUBSET((xd : (_) -> Bool), cd) → SUBSET(DELETE(xd, x), DIFF(UNIV, p))")))
  let t1022 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1006 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1005(x1006))
  }), t1007), t1008), t1009), t1010), t1021, t1020])
  let t1004 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1003 = @simp.asm_rewrite_tac(@list.List([@sets.in_delete(), @topology.ends_in_segment()]))
  let t1002 = @simp.simp_tac(@list.List([@convex.convex_semiopen_segment(), @convex.convex_connected()]))
  let t1062 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("DELETE(segment([((x : Cart[Real, 2]), (c : Cart[Real, 2]))]), x)")), t1002), t1003), t1004), t1022), t1061])
  let t1001 = @simp.rewrite_tac(@list.List([@topology.connected_component()]))
  let t1000 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) + op_pct(min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((c : Cart[Real, 2]) - x)), c - x)"))
  let t1063 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(@topology.connected_component_trans())), t1000), t1001), @tactics.conj_tac), t1062)
  let t993 = @simp.asm_rewrite_tac(@list.List([]))
  let t992 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t994 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball(), @sets.in_inter(), @sets.in_elim_thm()])), t992), t993)
  let t989 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq(), @real.real_lt_01()]))
  let t988 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t987 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t990 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dot_rmul()])), t987), t988), t989)
  let t986 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq(), @real.real_lt_div2_eq()]))
  let t985 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < (e : Real) → abs(min(real_of_num(1) / real_of_num(2), x)) < e")))
  let t991 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@real.real_lt_rdiv_eq()), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()])), t985), t986), @calc_rat.asm_real_arith_tac), t990])
  let t984 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + (a : Cart[Real, N]) - x == a"))]))
  let t983 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, N]) - (x + (a : Cart[Real, N]))) == norm(a)"))]))
  let t995 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball(), @sets.in_inter(), @sets.in_elim_thm(), @vectors.dist()])), t983), t984), @tactics.conj_tac), t991)
  let t980 = @simp.asm_rewrite_tac(@list.List([]))
  let t979 = @tactics.match_mp_tac(@vectors.between_imp_collinear())
  let t978 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _), (b : _), (a : _)} == {a, x, b}"))]))
  let t977 = @simp.asm_simp_tac(@list.List([@equal.gsym(@convex.collinear_3_affine_hull())]))
  let t976 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t975 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t974 = @simp.simp_tac(@list.List([@misc.subset_hull(), @convex.affine_imp_convex(), @convex.affine_affine_hull()]))
  let t981 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @convex.segment_convex_hull()])), t974), t975), t976), t977), t978), t979), t980)
  let t973 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realarith.real_lt_refl()]))
  let t972 = @simp.once_rewrite_tac(@list.List([@vectors.dot_sym()]))
  let t971 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.orthogonal()])))
  let t970 = @simp.rewrite_tac(@list.List([@vectors.dot_rmul(), @vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (v : Real), (x : Cart[Real, N])) + op_pct(v, (b : Cart[Real, N])) - x == op_pct(v, b - x)"))]))
  let t969 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((u : Real) + (v : Real) == real_of_num(1)) == (u == real_of_num(1) - v)"))]))
  let t968 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t982 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.affine_hull_2(), @sets.forall_in_gspec(), @sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == (∀ x : _, IN(x, s) → !IN(x, t))"))])), t968), t969), t970), t971), t972), t973), t981])
  let t967 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, {(x : Cart[Real, 2]), (b : Cart[Real, 2])})"))
  let t966 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, INTER(t, (u : (_) -> Bool)) == {} && SUBSET((s : (_) -> Bool), t) → INTER(s, u) == {}")))
  let t965 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_univ(), @topology.in_ball(), @realarith.real_not_lt()]))
  let t964 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), DIFF(UNIV, (b : (_) -> Bool))) && INTER((l : (_) -> Bool), (w : (_) -> Bool)) == {} → SUBSET(INTER(b, w), DIFF(UNIV, UNION(p, l)))")))
  let t996 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.pathstart_linepath(), @paths.path_image_join(), @paths.path_linepath()])), t964), t965), t966), t967), @tactics.conj_tac), t982)
  let t963 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_gt()), @convex.convex_halfspace_gt()]))
  let t962 = @simp.rewrite_tac(@list.List([@convex.convex_ball(), @vectors.dot_rsub(), @realarith.real_sub_lt()]))
  let t961 = @tactics.match_mp_tac(@convex.convex_inter())
  let t997 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_connected()), t961), t962), t963), t996, t995, t994])
  let t960 = @tactics.repeat_tac(@tactics.conj_tac)
  let t998 = @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("INTER(ball(((x : Cart[Real, 2]), (e : Real))), {(w : Cart[Real, 2]) | real_of_num(0) < dot((n : Cart[Real, 2]), w - x)})")), t960), t997)
  let t956 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t955 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t954 = @tactics.match_mp_tac(@real.real_lt_div())
  let t953 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → !(min(real_of_num(1) / real_of_num(2), x) == real_of_num(0))")))
  let t957 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_sub_eq(), @vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, N]) + (a : Cart[Real, N]) == x) == (a == vec(0))"))])), t953), t954), t955), t956)
  let t952 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t951 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t950 = @simp.rewrite_tac(@list.List([@real.real_le_min()]))
  let t949 = @simp.rewrite_tac(@list.List([]))
  let t948 = @tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((d : Cart[Real, 2]) - (x : Cart[Real, 2])))"))
  let t958 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment(), @vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + op_pct((a : Real), (y : Cart[Real, N]) - x) == op_pct(real_of_num(1) - a, x) + op_pct(a, y)"))])), t948), t949), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t950), t951), t952)
  let t947 = @sets.set_tac(@list.List([]))
  let t946 = @simp.rewrite_tac(@list.List([@topology.open_segment()]))
  let t945 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), segment(((c : Cart[Real, 2]), (d : Cart[Real, 2])))) == {(x : Cart[Real, 2])}"))
  let t944 = @simp.rewrite_tac(@list.List([@convex.subset_segment(), @topology.ends_in_segment()]))
  let t942 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER((cd : (_) -> Bool), (p : (_) -> Bool)) == {(x : _)} → SUBSET((xd : (_) -> Bool), cd) → SUBSET(DELETE(xd, x), DIFF(UNIV, p))")))
  let t959 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t942(x943))
  }), t944), t945), t946), t947), t958, t957])
  let t941 = @tactics.repeat_tac(@tactics.conj_tac)
  let t940 = @simp.asm_rewrite_tac(@list.List([@sets.in_delete(), @topology.ends_in_segment()]))
  let t939 = @simp.simp_tac(@list.List([@convex.convex_semiopen_segment(), @convex.convex_connected()]))
  let t999 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("DELETE(segment([((x : Cart[Real, 2]), (d : Cart[Real, 2]))]), x)")), t939), t940), t941), t959), t998])
  let t938 = @simp.rewrite_tac(@list.List([@topology.connected_component()]))
  let t937 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) + op_pct(min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((d : Cart[Real, 2]) - x)), d - x)"))
  let t936 = @tactics.match_mp_tac(@topology.connected_component_trans())
  let t935 = @simp.asm_rewrite_tac(@list.List([]))
  let t934 = @tactics.exists_tac(@term_syntax.parse_term("(d : Cart[Real, 2])"))
  let t1064 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(@topology.connected_component_trans())), t934), t935), t936), t937), t938), @tactics.conj_tac), t999)
  let t933 = @simp.simp_tac(@list.List([@class.contrapos_thm(), @topology.open_segment(), @sets.in_diff(), @sets.in_union(), @paths.path_image_linepath()]))
  let t932 = @simp.asm_simp_tac(@list.List([@paths.pathstart_linepath(), @paths.path_image_join(), @paths.path_linepath()]))
  let t931 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((y : Cart[Real, 2]), path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"))
  let t1065 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)"))), t931), t932), t933), t1064, t1063])
  let t930 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s928 = @tactics.mp_tac(x927)
    fn(x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s928(x929)
    }
  }))
  let t926 = @simp.asm_rewrite_tac(@list.List([]))
  let t925 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t924 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t920 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t923 = @tactics.undisch_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, ball(((x : Cart[Real, 2]), (e : Real)))) → IN(y, segment(((a : Cart[Real, 2]), (b : Cart[Real, 2])))) || real_of_num(0) < dot((n : Cart[Real, 2]), y - x) || dot(n, y - x) < real_of_num(0)"), fn(x922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s918 = @tactics.mp_tac(x917)
      fn(x919 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s918(x919)
      }
    })(((x921 : @kernel.Thm) => @bool.spec(t920, x921))(x922))
  })
  let t915 = @simp.rewrite_tac(@list.List([@topology.open_segment()]))
  let t914 = @simp.asm_rewrite_tac(@list.List([]))
  let t913 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((a : Cart[Real, _]), segment([((c : Cart[Real, _]), (d : Cart[Real, _]))])) && !IN((b : Cart[Real, _]), segment([(c, d)])) && INTER(segment((a, b)), segment((c, d))) == {(x : Cart[Real, _])} && segment((a, b)) == DIFF(segment([(a, b)]), {a, b}) && segment((c, d)) == DIFF(segment([(c, d)]), {c, d}) → INTER(segment([(a, b)]), segment((c, d))) == {x}")))
  let t912 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.open_segment()), @paths.path_image_linepath()]))
  let t911 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER((cd : (_) -> Bool), (p : (_) -> Bool)) == {} && INTER((l : (_) -> Bool), DIFF(cd, {(c : _), (d : _)})) == {(x : _)} → INTER(DIFF(cd, {c, d}), UNION(p, l)) == {x}")))
  let t910 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_linepath(), @paths.path_linepath()]))
  let t916 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER({(c : Cart[Real, _]), (d : Cart[Real, _])}, (p : (Cart[Real, _]) -> Bool)) == {} && INTER(DIFF(segment([(c, d)]), {c, d}), p) == {(x : Cart[Real, _])} → INTER(segment([(c, d)]), p) == {x}"))), t910), t911), t912), t913), t914), t915), @tactics.all_tac])
  let t909 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((c : Cart[Real, 2]), (d : Cart[Real, 2]))]), path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))) == {(x : Cart[Real, 2])}"), fn(x906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s907 = @tactics.assume_tac(x906)
    fn(x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s907(x908)
    }
  })
  let t905 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t903 = @meson.asm_meson_tac(@list.List([@paths.inside_no_overlap(), @paths.outside_no_overlap(), @sets.in_inter(), @sets.not_in_empty()]))
  let t902 = @simp.asm_rewrite_tac(@list.List([]))
  let t901 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t900 = @list.List([@tactics.match_mp_tac(@topology.connected_component_sym()), @tactics.all_tac])
  let t899 = @tactics.exists_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))
  let t904 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_component_trans()), t899), @tactics.conj_tac), t900), t901), t902), t903)])
  let t898 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], distance((y, (x : Cart[Real, 2]))) < (e : Real) && !IN(y, path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))) → connected_component(DIFF(UNIV, path_image(op_plus_plus(p, linepath((a, b))))), (c : Cart[Real, 2]), y)"), fn(x895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s896 = @tactics.assume_tac(x895)
    fn(x897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s896(x897)
    }
  })
  let t893 = @simp.rewrite_tac(@list.List([@paths.outside_no_overlap()]))
  let t892 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), DIFF(UNIV, (t : (_) -> Bool))) == (INTER(s, t) == {})"))]))
  let t891 = @tactics.exists_tac(@term_syntax.parse_term("outside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"))
  let t894 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t891), t892), t893)])
  let t890 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t889 = @tactics.match_mp_tac(@topology.connected_component_trans())
  let t888 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t887 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t882 = @term_syntax.parse_term("(e : Real)")
  let t886 = @tactics.disch_then(fn(x885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s880 = @tactics.mp_tac(x879)
        fn(x881 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s880(x881)
        }
      })(((x883 : @kernel.Thm) => @bool.spec(t882, x883))(x884))
    })(@bool.conjunct1(x885))
  })
  let t878 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @topology.closure_approachable()]))
  let t877 = @simp.asm_rewrite_tac(@list.List([@topology.frontier()]))
  let t873 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t876 = @tactics.disch_then(fn(x875 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s871 = @tactics.mp_tac(x870)
      fn(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s871(x872)
      }
    })(((x874 : @kernel.Thm) => @bool.spec(t873, x874))(x875))
  })
  let t869 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t868 = @tactics.undisch_tac(@term_syntax.parse_term("frontier(outside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))) == path_image(op_plus_plus(p, linepath((a, b))))"))
  let t866 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t865 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), DIFF(UNIV, (t : (_) -> Bool))) == (INTER(s, t) == {})"))]))
  let t864 = @tactics.exists_tac(@term_syntax.parse_term("inside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"))
  let t867 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t864), t865), t866), @tactics.all_tac])
  let t863 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t862 = @tactics.match_mp_tac(@topology.connected_component_trans())
  let t861 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t860 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t855 = @term_syntax.parse_term("(e : Real)")
  let t859 = @tactics.disch_then(fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s853 = @tactics.mp_tac(x852)
        fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s853(x854)
        }
      })(((x856 : @kernel.Thm) => @bool.spec(t855, x856))(x857))
    })(@bool.conjunct1(x858))
  })
  let t851 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @topology.closure_approachable()]))
  let t850 = @simp.asm_rewrite_tac(@list.List([@topology.frontier()]))
  let t846 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t849 = @tactics.disch_then(fn(x848 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s844 = @tactics.mp_tac(x843)
      fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s844(x845)
      }
    })(((x847 : @kernel.Thm) => @bool.spec(t846, x847))(x848))
  })
  let t842 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t841 = @tactics.undisch_tac(@term_syntax.parse_term("frontier(inside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))) == path_image(op_plus_plus(p, linepath((a, b))))"))
  let t839 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t840 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 2])"), t839]))
  let t837 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t836 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.open_segment()])))
  let t835 = @simp.rewrite_tac(@list.List([@sets.in_union(), @paths.path_image_linepath()]))
  let t838 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.pathstart_linepath(), @paths.path_image_join(), @paths.path_linepath()])), t835), @tactics.disj2_tac), t836), t837), @tactics.all_tac])
  let t834 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"), fn(x831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s832 = @tactics.assume_tac(x831)
    fn(x833 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s832(x833)
    }
  })
  let t829 = @simp.rewrite_tac(@list.List([@paths.outside_no_overlap(), @paths.inside_no_overlap()]))
  let t828 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), DIFF(UNIV, (t : (_) -> Bool))) == (INTER(s, t) == {})"))]))
  let t823 = @tactics.exists_tac(@term_syntax.parse_term("outside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"))
  let t824 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t823)
  let t825 = @meson.asm_meson_tac(@list.List([@topology.connected_component_sym()]))
  let t826 = @meson.asm_meson_tac(@list.List([]))
  let t822 = @tactics.exists_tac(@term_syntax.parse_term("inside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))"))
  let t827 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t822), t826, t825, t824])
  let t821 = @simp.rewrite_tac(@list.List([@sets.in_union(), @topology.connected_iff_connected_component()]))
  let t820 = @simp.gen_rewrite_tac(fn(x819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s814 = @equal.land_conv(x813)
      fn(x815 : @kernel.Term) -> @kernel.Thm raise {
        s814(x815)
      }
    })((fn(x816 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s817 = @equal.once_depth_conv(x816)
      fn(x818 : @kernel.Term) -> @kernel.Thm raise {
        s817(x818)
      }
    })(x819))
  }, @list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("UNION(inside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))), outside(path_image(op_plus_plus(p, linepath((a, b)))))) == DIFF(UNIV, path_image(op_plus_plus(p, linepath((a, b)))))")))]))
  let t812 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t830 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 2])"), t812])), t820), t821), @tactics.strip_tac), t827), t828), t829)])
  let t811 = @tactics.subgoal_then(@term_syntax.parse_term("∀ u : Cart[Real, 2], ∀ v : Cart[Real, 2], IN(u, inside(path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))))) && IN(v, outside(path_image(op_plus_plus(p, linepath((a, b)))))) → connected_component(DIFF(UNIV, path_image(op_plus_plus(p, linepath((a, b))))), u, v)"), fn(x808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s809 = @tactics.assume_tac(x808)
    fn(x810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s809(x810)
    }
  })
  let t807 = @simp.rewrite_tac(@list.List([@topology.connected_iff_connected_component()]))
  let t806 = @simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathstart_join(), @paths.pathfinish_linepath()]))
  let t805 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))"), @paths.jordan_disconnected()))
  let t803 = @meson.asm_meson_tac(@list.List([@paths.inside_no_overlap(), @paths.outside_no_overlap()]))
  let t802 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), DIFF(UNIV, (s : (_) -> Bool))) == (INTER(t, s) == {})"))]))
  let t801 = @simp.asm_rewrite_tac(@list.List([@topology.connected_component()]))
  let t798 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!(IN((x : Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool)) == IN((y : Cart[Real, 2]), (t : (Cart[Real, 2]) -> Bool))) → (∀ p : (Cart[Real, 2]) -> Bool, UNION(s, t) == DIFF(UNIV, p) && INTER({x, y}, p) == {} → IN(x, s) && IN(y, s) || IN(x, t) && IN(y, t))")))
  let t795 = @term_syntax.parse_term("path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))")
  let t800 = @tactics.disch_then(fn(x799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x792 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s793 = @tactics.mp_tac(x792)
        fn(x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s793(x794)
        }
      })(((x796 : @kernel.Thm) => @bool.spec(t795, x796))(x797))
    })(t798(x799))
  })
  let t804 = @list.List([@tactics.disch_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())])), t800), t801), t802), t803)])
  let t791 = @tactics.subgoal_then(@term_syntax.parse_term("!connected_component(DIFF(UNIV, path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))), (c : Cart[Real, 2]), (d : Cart[Real, 2]))"), fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s789 = @tactics.mp_tac(x788)
    fn(x790 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s789(x790)
    }
  })
  let t787 = @simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathstart_join(), @paths.pathfinish_linepath()]))
  let t786 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))"), @paths.jordan_inside_outside()))
  let t784 = @simp.simp_tac(@list.List([@sets.insert_ac()]))
  let t782 = @kernel.assume_rule(@term_syntax.parse_term("between((x : Cart[Real, 2]), ((a : Cart[Real, 2]), (b : Cart[Real, 2])))"))
  let t783 = @tactics.mp_tac(@drule.match_mp(@vectors.between_imp_collinear())(t782))
  let t781 = @tactics.undisch_tac(@term_syntax.parse_term("collinear({(y : Cart[Real, 2]), (x : Cart[Real, 2]), (b : Cart[Real, 2])})"))
  let t780 = @simp.asm_rewrite_tac(@list.List([]))
  let t779 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t778 = @tactics.match_mp_tac(@vectors.collinear_3_trans())
  let t777 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(y : _), (a : _), (b : _)} == {a, b, y}"))]))
  let t776 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@realarith.real_lte_trans(), @vectors.dist_sym()]))])
  let t775 = @simp.asm_rewrite_tac(@list.List([]))
  let t774 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t773 = @tactics.match_mp_tac(lemma)
  let t772 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.collinear_3())]))
  let t771 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.orthogonal_sym()])), @tactics.all_tac])
  let t768 = @term_syntax.parse_term("(b : Cart[Real, 2]) - (x : Cart[Real, 2])")
  let t769 = @term_syntax.parse_term("(y : Cart[Real, 2]) - (x : Cart[Real, 2])")
  let t770 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 2])"), t769, t768]), @vectors.orthogonal_to_orthogonal_2d()))
  let t767 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.orthogonal())]))
  let t766 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(!((x : Real) < real_of_num(0)) && !(real_of_num(0) < x)) == (x == real_of_num(0))"))]))
  let t765 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(c : Bool) && !(b : Bool) → (a : Bool)) → a || b || c")))
  let t764 = @tactics.repeat_tac(@tactics.strip_tac)
  let t785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball()])), t764), t765), t766), t767), @tactics.disch_tac), t770), @tactics.ants_tac), t771), t772), @tactics.disch_tac), t773), t774), t775), @tactics.conj_tac), t776), t777), t778), t779), t780), t781), t783), t784), @tactics.all_tac])
  let t763 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, ball(((x : Cart[Real, 2]), (e : Real)))) → IN(y, segment(((a : Cart[Real, 2]), (b : Cart[Real, 2])))) || real_of_num(0) < dot((n : Cart[Real, 2]), y - x) || dot(n, y - x) < real_of_num(0)"), fn(x760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s761 = @tactics.assume_tac(x760)
    fn(x762 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s761(x762)
    }
  })
  let t758 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul_eq(), @realarith.real_sub_lt()]))
  let t757 = @simp.rewrite_tac(@list.List([@vectors.dot_rmul(), @calc_int.real_mul_lneg(), @calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) < real_of_num(0)) == (real_of_num(0) < x)"))]))
  let t756 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(d : Cart[Real, N]) - (op_pct(real_of_num(1) - (u : Real), (c : Cart[Real, N])) + op_pct(u, d)) == op_pct(real_of_num(1) - u, d - c) && c - (op_pct(real_of_num(1) - u, c) + op_pct(u, d)) == op_pct(-u, d - c)"))]))
  let t755 = @simp.asm_rewrite_tac(@list.List([]))
  let t754 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment()]))
  let t753 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t752 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), segment(((c : Cart[Real, 2]), (d : Cart[Real, 2]))))"), fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s750 = @tactics.mp_tac(x749)
    fn(x751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s750(x751)
    }
  })
  let t759 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < dot((n : Cart[Real, 2]), (d : Cart[Real, 2]) - (x : Cart[Real, 2]))")), t752), t753), t754), @tactics.strip_tac), t755), t756), t757), t758), @tactics.all_tac])
  let t748 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (c : Cart[Real, 2]) - (x : Cart[Real, 2])) < real_of_num(0)"), fn(x745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s746 = @tactics.assume_tac(x745)
    fn(x747 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s746(x747)
    }
  })
  let t744 = @list.List([@simp.rewrite_tac(@list.List([@vectors.orthogonal_rneg(), @vectors.vector_neg_eq_0()])), @tactics.all_tac])
  let t743 = @tactics.match_mp_tac(symlemma)
  let t741 = @term_syntax.parse_term("(n : Cart[Real, 2])")
  let t742 = @tactics.spec_tac(@term_syntax.parse_term("(n : Cart[Real, 2])"), t741)
  let t740 = @tactics.disch_then(fn(x732 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x732
    let t739 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.pop_assum_list(fn(x738 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s735 = @tactics.mp_tac(x734)
        fn(x736 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s735(x736)
        }
      })(((x737 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x737))(x738))
    }), t739)
  })
  let t728 = @simp.asm_simp_tac(@list.List([@vectors.between_imp_collinear()]))
  let t727 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {c, b, a}"))]))
  let t725 = @sets.set_tac(@list.List([]))
  let t726 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.collinear_4_3()])), t725])
  let t724 = @tactics.exists_tac(@term_syntax.parse_term("{(d : Cart[Real, 2]), (x : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"))
  let t729 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_subset()), t724), @tactics.conj_tac), t726), t727), t728)
  let t723 = @simp.asm_simp_tac(@list.List([@vectors.between_imp_collinear()]))
  let t722 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {c, b, a}"))]))
  let t720 = @sets.set_tac(@list.List([]))
  let t721 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.collinear_4_3()])), t720])
  let t719 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Cart[Real, 2]), (x : Cart[Real, 2]), (a : Cart[Real, 2]), (d : Cart[Real, 2])}"))
  let t730 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_subset()), t719), @tactics.conj_tac), t721), t722), t723), t729])
  let t718 = @simp.asm_simp_tac(@list.List([@vectors.collinear_4_3()]))
  let t717 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _), (d : _)} == {b, d, a, c}"))]))
  let t716 = @simp.asm_rewrite_tac(@list.List([]))
  let t715 = @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2]), (d : Cart[Real, 2])})"))
  let t714 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.collinear_3())]))
  let t713 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.orthogonal_sym()])), @tactics.all_tac])
  let t710 = @term_syntax.parse_term("(b : Cart[Real, 2]) - (x : Cart[Real, 2])")
  let t711 = @term_syntax.parse_term("(d : Cart[Real, 2]) - (x : Cart[Real, 2])")
  let t712 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 2])"), t711, t710]), @vectors.orthogonal_to_orthogonal_2d()))
  let t731 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.orthogonal())])), @tactics.disch_tac), t712), @tactics.ants_tac), t713), t714), @tactics.disch_tac), t715), t716), t717), t718), @tactics.conj_tac), t730), @tactics.all_tac])
  let t709 = @tactics.subgoal_then(@term_syntax.parse_term("!(dot((n : Cart[Real, 2]), (d : Cart[Real, 2]) - (x : Cart[Real, 2])) == real_of_num(0))"), fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s707 = @tactics.mp_tac(x706)
    fn(x708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s707(x708)
    }
  })
  let t704 = @sets.set_tac(@list.List([]))
  let t703 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@vectors.collinear_subset()))
  let t702 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t705 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")), t702), t703), t704), @tactics.all_tac])
  let t701 = @tactics.subgoal_then(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2]), (d : Cart[Real, 2])})"), fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s699 = @tactics.assume_tac(x698)
    fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s699(x700)
    }
  })
  let t696 = @tactics.then_tac(@simp.simp_tac(@list.List([@topology.in_open_segment_alt(), @equal.gsym(@topology.between_in_segment())])), @tactics.strip_tac)
  let t697 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t696])
  let t695 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (b : Cart[Real, 2])))) && IN(x, segment(((c : Cart[Real, 2]), (d : Cart[Real, 2]))))"), fn(x692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s693 = @tactics.mp_tac(x692)
    fn(x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s693(x694)
    }
  })
  let t691 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Cart[Real, 2])"))
  let t690 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @arith.le_refl(), @theorems.left_imp_exists_thm()]))
  let t689 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(b : Cart[Real, 2]) - (x : Cart[Real, 2])"), @vectors.orthogonal_to_vector_exists()))
  let t685 = @meson.asm_meson_tac(@list.List([]))
  let t684 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.insert_ac()])))
  let t681 = @drule.match_mp(@vectors.between_imp_collinear())
  let t683 = @tactics.disch_then(fn(x682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s679 = @tactics.assume_tac(x678)
      fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s679(x680)
      }
    })(t681(x682))
  })
  let t686 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @equal.gsym(@topology.between_in_segment())])), @tactics.conj_tac), t683), t684), t685)
  let t687 = @list.List([@meson.asm_meson_tac(@list.List([@topology.ends_in_segment(), @sets.in_inter(), @sets.not_in_empty()])), t686])
  let t677 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER({(c : _), (d : _)}, UNION((s : (_) -> Bool), (t : (_) -> Bool))) == {}) == ((!IN(c, s) && !IN(d, s)) && !IN(c, t) && !IN(d, t))"))]))
  let t688 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_linepath(), @paths.pathstart_linepath()])), t677), @tactics.conj_tac), t687), @tactics.all_tac])
  let t676 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(c : Cart[Real, 2]), (d : Cart[Real, 2])}, path_image(op_plus_plus((p : (Cart[Real, Unit]) -> Cart[Real, 2]), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))))) == {}"), fn(x673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s674 = @tactics.assume_tac(x673)
    fn(x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s674(x675)
    }
  })
  let t672 = @simp.rewrite_tac(@list.List([@topology.in_open_segment_alt()]))
  let t671 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t670 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (b : Cart[Real, 2])))) && IN(x, segment(((c : Cart[Real, 2]), (d : Cart[Real, 2]))))"), fn(x667 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s668 = @tactics.mp_tac(x667)
    fn(x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s668(x669)
    }
  })
  let t666 = @list.List([@meson.asm_meson_tac(@list.List([@topology.ends_in_segment()])), @tactics.all_tac])
  let t665 = @tactics.subgoal_then(@term_syntax.parse_term("!((c : Cart[Real, 2]) == (a : Cart[Real, 2])) && !(c == (b : Cart[Real, 2])) && !((d : Cart[Real, 2]) == a) && !(d == b)"), @tactics.strip_assume_tac)
  let t664 = @list.List([@meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image(), @sets.in_inter(), @sets.not_in_empty()])), @tactics.all_tac])
  let t663 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((a : Cart[Real, 2]), segment([((c : Cart[Real, 2]), (d : Cart[Real, 2]))])) && !IN((b : Cart[Real, 2]), segment([(c, d)]))"), @tactics.strip_assume_tac)
  let t662 = @tactics.repeat_tac(@tactics.disch_tac)
  let t661 = @simp.asm_rewrite_tac(@list.List([@sets.finite_sing(), @sets.not_insert_empty()]))
  let t660 = @tactics.subst1_tac(@meson.meson(@list.List([@topology.segment_sym()]), @term_syntax.parse_term("segment(((d : Cart[Real, 2]), (c : Cart[Real, 2]))) == segment((c, d))")))
  let t656 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t657 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t658 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t659 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t658, t657, t656]), @topology.finite_inter_collinear_open_segments()))
  let t652 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t653 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t654 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t655 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t654, t653, t652]), @topology.finite_inter_collinear_open_segments()))
  let t651 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@paths.arc_linepath_eq()])))
  let t650 = @tactics.disch_then(fn(x649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@bool.conjunct2(x649))
  })
  let t648 = @tactics.first_x_assum(fn(x647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(@equal.sym(x647))
  })
  let t645 = @simp.abbrev_tac(@term_syntax.parse_term("(e : Real) == distance(((x : Cart[Real, 2]), (cp : Cart[Real, 2])))"))
  let t643 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @paths.path_image_linepath()]))
  let t640 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((p : (_) -> Bool), (s : (_) -> Bool)), (u : (_) -> Bool)) → IN((x : _), DIFF(s, u)) → !IN(x, p)")))
  let t642 = @tactics.first_x_assum(fn(x641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t640(x641))
  })
  let t639 = @simp.asm_rewrite_tac(@list.List([]))
  let t638 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty(), @sets.in_inter(), @class.de_morgan_thm()]))
  let t635 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(a : (_) -> Bool) == {(x : _)} → IN(x, a)")))
  let t637 = @tactics.first_assum(fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s633 = @tactics.mp_tac(x632)
      fn(x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s633(x634)
      }
    })(t635(x636))
  })
  let t631 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a && (b : Bool) → (c : Bool)")))
  let t644 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s629 = @tactics.subst_all_tac(x628)
    fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s629(x630)
    }
  }), t631), t637), t638), @tactics.strip_tac), t639), t642), t643), @tactics.all_tac])
  let t627 = @tactics.disj_cases_tac(@vectors.norm_arith(@term_syntax.parse_term("(cp : Cart[Real, 2]) == (x : Cart[Real, 2]) || real_of_num(0) < distance((x, cp))")))
  let t626 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(cp : Cart[Real, 2])"))(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s624 = @tactics.mp_tac(x623)
    fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s624(x625)
    }
  }))
  let t622 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t621 = @simp.asm_simp_tac(@list.List([@topology.closed_union(), @topology.finite_imp_closed(), @paths.closed_path_image(), @sets.finite_insert(), @sets.finite_empty()]))
  let t620 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), INSERT((b : _), INSERT((c : _), INSERT((d : _), (s : (_) -> Bool))))) == UNION({a, b, c, d}, s)"))]))
  let t619 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert()]))
  let t617 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t618 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("INSERT((a : Cart[Real, 2]), INSERT((b : Cart[Real, 2]), INSERT((c : Cart[Real, 2]), INSERT((d : Cart[Real, 2]), path_image((p : (Cart[Real, Unit]) -> Cart[Real, 2]))))))"), t617]), @topology.distance_attains_inf()))
  let t616 = @tactics.disch_then(fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s613 = @tactics.assume_tac(x612)
      fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s613(x614)
      }
    })(@bool.conjunct1(x615))
  })
  let t611 = @simp.asm_simp_tac(@list.List([@paths.path_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t608 = @drule.match_mp(@paths.simple_path_imp_path())
  let t610 = @tactics.first_assum(fn(x609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s606 = @tactics.mp_tac(x605)
      fn(x607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s606(x607)
      }
    })(t608(x609))
  })
  let t603 = @term_syntax.parse_term("linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))")
  let t604 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : (Cart[Real, Unit]) -> Cart[Real, 2])"), t603]), @paths.simple_path_join_loop_eq()))
  let t1066 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t604), t610), t611), t616), @tactics.strip_tac), t618), t619), t620), t621), @tactics.ants_tac), t622), t626), t627), t644), t645), t648), t650), t651), t655), t659), t660), t661), t662), t663), t664), t665), t666), t670), t671), t672), @tactics.strip_tac), t676), t688), t689), t690), t691), @tactics.strip_tac), t695), t697), t701), t705), t709), t731), t740), t742), t743), @tactics.conj_tac), t744), @tactics.gen_tac), @tactics.disch_tac), @tactics.strip_tac), t748), t759), t763), t785), t786), t787), @tactics.strip_tac), t791), t804), t805), t806), t807), t811), t830), t834), t838), t840), @tactics.strip_tac), t841), t842), t849), t850), t851), t859), t860), t861), @tactics.strip_tac), t862), t863), @tactics.conj_tac), t867), t868), t869), t876), t877), t878), t886), t887), t888), @tactics.strip_tac), t889), t890), @tactics.conj_tac), t894), t898), t904), t905), @tactics.strip_tac), t909), t916), t923), t924), t925), t926), t930), t1065)
  parity_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ p : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], simple_path(op_plus_plus(p, linepath((a, b)))) && pathstart(p) == b && pathfinish(p) == a && INTER(segment((a, b)), segment((c, d))) == {x} && INTER(segment([(c, d)]), path_image(p)) == {} → IN(c, inside(path_image(op_plus_plus(p, linepath((a, b)))))) == IN(d, outside(path_image(op_plus_plus(p, linepath((a, b))))))"), t1066))
}

///|
let parity_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARITY_LEMMA")

///|
/// `PARITY_LEMMA`
pub fn parity_lemma() -> @kernel.Thm {
  parity_lemma_c.get()
}

///|
/// polygonal_path
fn step_25() -> Unit raise {
  polygonal_path_c.set(@define.define_(@term_syntax.parse_term("(polygonal_path : (List[Cart[Real, _]], Cart[Real, Unit]) -> Cart[Real, _])(NIL) == linepath((vec(0), vec(0))) && polygonal_path([(a : Cart[Real, _])]) == linepath((a, a)) && polygonal_path([a, (b : Cart[Real, _])]) == linepath((a, b)) && polygonal_path(CONS(a, CONS(b, CONS((c : Cart[Real, _]), (l : List[Cart[Real, _]]))))) == op_plus_plus(linepath((a, b)), polygonal_path(CONS(b, CONS(c, l))))")))
}

///|
let polygonal_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("polygonal_path")

///|
/// `polygonal_path`
pub fn polygonal_path() -> @kernel.Thm {
  polygonal_path_c.get()
}

///|
/// POLYGONAL_PATH_CONS_CONS
fn step_26() -> Unit raise {
  let t1067 = @simp.rewrite_tac(@list.List([polygonal_path()]))
  let t1068 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t1067)
  polygonal_path_cons_cons_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ p : List[Cart[Real, _]], !(p == NIL) → polygonal_path(CONS(a, CONS(b, p))) == op_plus_plus(linepath((a, b)), polygonal_path(CONS(b, p)))"), t1068))
}

///|
let polygonal_path_cons_cons_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYGONAL_PATH_CONS_CONS")

///|
/// `POLYGONAL_PATH_CONS_CONS`
pub fn polygonal_path_cons_cons() -> @kernel.Thm {
  polygonal_path_cons_cons_c.get()
}

///|
/// POLYGONAL_PATH_TRANSLATION
fn step_27() -> Unit raise {
  let t1074 = @simp.rewrite_tac(@list.List([@paths.joinpaths_translation()]))
  let t1073 = @simp.asm_simp_tac(@list.List([@lists.map(), polygonal_path(), @paths.linepath_translation()]))
  let t1072 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1071 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1070 = @simp.rewrite_tac(@list.List([@lists.map(), polygonal_path(), @paths.linepath_translation()]))
  let t1069 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1075 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))), t1069), t1070), t1071), t1072), t1073), t1074)
  polygonal_path_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ p : List[Cart[Real, 2]], polygonal_path(MAP((x : Cart[Real, 2]) => a + x, CONS(b, p))) == o((x : Cart[Real, 2]) => a + x, polygonal_path(CONS(b, p)))"), t1075))
}

///|
let polygonal_path_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYGONAL_PATH_TRANSLATION")

///|
/// `POLYGONAL_PATH_TRANSLATION`
pub fn polygonal_path_translation() -> @kernel.Thm {
  polygonal_path_translation_c.get()
}

///|
/// 100/pick.ml:1053
fn step_28() -> Unit raise {
  @vectors.add_translation_invariants(@list.List([polygonal_path_translation()]))
}

///|
/// POLYGONAL_PATH_LINEAR_IMAGE
fn step_29() -> Unit raise {
  let t1087 = @equal.gsym(@paths.linepath_linear_image())
  let t1088 = @simp.asm_simp_tac(@list.List([@equal.gsym(@paths.joinpaths_linear_image()), t1087]))
  let t1086 = @simp.rewrite_tac(@list.List([polygonal_path(), @lists.map()]))
  let t1085 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1083 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1084 = @list.List([@meson.asm_meson_tac(@list.List([@paths.linepath_linear_image()])), t1083])
  let t1082 = @simp.rewrite_tac(@list.List([polygonal_path(), @lists.map()]))
  let t1081 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1079 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1078 = @meson.asm_meson_tac(@list.List([@vectors.linear_0()]))
  let t1080 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.linepath_refl(), @trivia.o_def(), @class.fun_eq_thm()])), t1078), t1079])
  let t1077 = @simp.rewrite_tac(@list.List([polygonal_path(), @lists.map()]))
  let t1076 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1089 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), t1076), t1077), @tactics.conj_tac), t1080), t1081), t1082), @tactics.conj_tac), t1084), t1085), t1086), t1088)
  polygonal_path_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ p : List[Cart[Real, _]], linear(f) → polygonal_path(MAP(f, p)) == o(f, polygonal_path(p))"), t1089))
}

///|
let polygonal_path_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYGONAL_PATH_LINEAR_IMAGE")

///|
/// `POLYGONAL_PATH_LINEAR_IMAGE`
pub fn polygonal_path_linear_image() -> @kernel.Thm {
  polygonal_path_linear_image_c.get()
}

///|
/// 100/pick.ml:1069
fn step_30() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([polygonal_path_linear_image()]))
}

///|
/// PATHSTART_POLYGONAL_PATH
fn step_31() -> Unit raise {
  let t1094 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath(), @lists.hd(), @paths.pathstart_join()]))
  let t1093 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1092 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath(), @lists.not_cons_nil(), @lists.hd()]))
  let t1091 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1090 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath()]))
  let t1095 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1090), @tactics.gen_tac), t1091), t1092), @tactics.gen_tac), t1093), t1094)
  pathstart_polygonal_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, _]], pathstart(polygonal_path(p)) == (if p == NIL { vec(0) } else { HD(p) })"), t1095))
}

///|
let pathstart_polygonal_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATHSTART_POLYGONAL_PATH")

///|
/// `PATHSTART_POLYGONAL_PATH`
pub fn pathstart_polygonal_path() -> @kernel.Thm {
  pathstart_polygonal_path_c.get()
}

///|
/// PATHFINISH_POLYGONAL_PATH
fn step_32() -> Unit raise {
  let t1100 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathfinish_linepath(), @paths.pathfinish_join()]))
  let t1099 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1098 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathfinish_linepath(), @lists.not_cons_nil(), @lists.last()]))
  let t1097 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1096 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathfinish_linepath()]))
  let t1101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1096), @tactics.gen_tac), t1097), t1098), @tactics.gen_tac), t1099), t1100)
  pathfinish_polygonal_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, _]], pathfinish(polygonal_path(p)) == (if p == NIL { vec(0) } else { LAST(p) })"), t1101))
}

///|
let pathfinish_polygonal_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATHFINISH_POLYGONAL_PATH")

///|
/// `PATHFINISH_POLYGONAL_PATH`
pub fn pathfinish_polygonal_path() -> @kernel.Thm {
  pathfinish_polygonal_path_c.get()
}

///|
/// VERTICES_IN_PATH_IMAGE_POLYGONAL_PATH
fn step_33() -> Unit raise {
  let t1112 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1111 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil(), @sets.in_union(), @topology.ends_in_segment(), @paths.path_image_linepath()]))
  let t1110 = @simp.once_rewrite_tac(@list.List([@sets.insert_subset()]))
  let t1109 = @tactics.replicate_tac(3, @tactics.disch_tac)
  let t1113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1109), t1110), t1111), t1112)
  let t1108 = @simp.rewrite_tac(@list.List([@sets.empty_subset()]))
  let t1114 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @sets.insert_subset(), @topology.ends_in_segment()])), t1108), t1113])
  let t1107 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), polygonal_path()]))
  let t1106 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1105 = @simp.rewrite_tac(@list.List([@topology.segment_refl(), @sets.insert_ac(), @sets.subset_refl()]))
  let t1104 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), polygonal_path(), @paths.path_image_linepath()]))
  let t1103 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1102 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.empty_subset()]))
  let t1115 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1102), @tactics.gen_tac), t1103), t1104), t1105), @tactics.gen_tac), t1106), t1107), @tactics.conj_tac), t1114)
  vertices_in_path_image_polygonal_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], SUBSET(set_of_list(p), path_image(polygonal_path(p)))"), t1115))
}

///|
let vertices_in_path_image_polygonal_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VERTICES_IN_PATH_IMAGE_POLYGONAL_PATH")

///|
/// `VERTICES_IN_PATH_IMAGE_POLYGONAL_PATH`
pub fn vertices_in_path_image_polygonal_path() -> @kernel.Thm {
  vertices_in_path_image_polygonal_path_c.get()
}

///|
/// ARC_POLYGONAL_PATH_IMP_DISTINCT
fn step_34() -> Unit raise {
  let t1154 = @meson.meson_tac(@list.List([]))
  let t1153 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem(), @class.de_morgan_thm(), @equal.gsym(@lists.all_mem())]))
  let t1149 = @simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path())
  let t1150 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@equal.gsym(@class.contrapos_thm())]))(t1149))
  let t1152 = @tactics.disch_then(fn(x1151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1147 = @tactics.mp_tac(x1146)
      fn(x1148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1147(x1148)
      }
    })(t1150(x1151))
  })
  let t1145 = @simp.asm_rewrite_tac(@list.List([@sets.in_inter(), @sets.in_sing(), @topology.ends_in_segment(), @paths.path_image_linepath()]))
  let t1141 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t1144 = @tactics.disch_then(fn(x1143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1139 = @tactics.mp_tac(x1138)
      fn(x1140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1139(x1140)
      }
    })(((x1142 : @kernel.Thm) => @bool.spec(t1141, x1142))(x1143))
  })
  let t1135 = @simp.gen_rewrite_rule(fn(x1134 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1134
  }, @list.List([@sets.subset()]))
  let t1137 = @tactics.first_x_assum(fn(x1136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1132 = @tactics.mp_tac(x1131)
      fn(x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1132(x1133)
      }
    })(t1135(x1136))
  })
  let t1130 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t1129 = @simp.asm_simp_tac(@list.List([]))
  let t1128 = @simp.once_rewrite_tac(@list.List([@lists.pairwise()]))
  let t1127 = @simp.simp_tac(@list.List([@paths.arc_join_eq(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil(), @paths.arc_linepath_eq()]))
  let t1126 = @tactics.replicate_tac(3, @tactics.disch_tac)
  let t1124 = @term_syntax.parse_term("(p : List[Cart[Real, N]])")
  let t1125 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Cart[Real, N])"), t1124]))
  let t1123 = @list.List([@simp.rewrite_tac(@list.List([@lists.pairwise(), @lists.all()])), @tactics.all_tac])
  let t1122 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.arc_linepath_eq()]))
  let t1121 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1120 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, N])"))
  let t1119 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.arc_linepath_eq()]))
  let t1118 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1117 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1116 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.arc_linepath_eq()]))
  let t1155 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1116), t1117), t1118), t1119), t1120), t1121), t1122), @tactics.conj_tac), t1123), t1125), t1126), t1127), @tactics.strip_tac), t1128), t1129), t1130), t1137), t1144), t1145), t1152), t1153), t1154)
  arc_polygonal_path_imp_distinct_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], arc(polygonal_path(p)) → PAIRWISE((x : Cart[Real, N]) => (y : Cart[Real, N]) => !(x == y), p)"), t1155))
}

///|
let arc_polygonal_path_imp_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARC_POLYGONAL_PATH_IMP_DISTINCT")

///|
/// `ARC_POLYGONAL_PATH_IMP_DISTINCT`
pub fn arc_polygonal_path_imp_distinct() -> @kernel.Thm {
  arc_polygonal_path_imp_distinct_c.get()
}

///|
/// PATH_POLYGONAL_PATH
fn step_35() -> Unit raise {
  let t1161 = @simp.simp_tac(@list.List([@paths.path_join(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd(), @paths.path_linepath()]))
  let t1160 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.path_linepath()]))
  let t1159 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1158 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.path_linepath()]))
  let t1157 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1156 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.path_linepath()]))
  let t1162 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1156), @tactics.gen_tac), t1157), t1158), @tactics.gen_tac), t1159), t1160), t1161)
  path_polygonal_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], path(polygonal_path(p))"), t1162))
}

///|
let path_polygonal_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_POLYGONAL_PATH")

///|
/// `PATH_POLYGONAL_PATH`
pub fn path_polygonal_path() -> @kernel.Thm {
  path_polygonal_path_c.get()
}

///|
/// PATH_IMAGE_POLYGONAL_PATH_SUBSET_CONVEX_HULL
fn step_36() -> Unit raise {
  let t1178 = @sets.set_tac(@list.List([]))
  let t1177 = @simp.rewrite_tac(@list.List([@sets.set_of_list()]))
  let t1176 = @tactics.match_mp_tac(@misc.hull_mono())
  let t1173 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.subset_trans()))
  let t1175 = @tactics.first_x_assum(fn(x1174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1173(x1174))
  })
  let t1172 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.insert_subset(), @sets.empty_subset(), @sets.in_insert()]))
  let t1171 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @convex.segment_convex_hull(), @sets.set_of_list()]))
  let t1170 = @tactics.match_mp_tac(@paths.subset_path_image_join())
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1170), t1171), t1172), t1175), t1176), t1177), t1178)
  let t1169 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull(), @sets.subset_refl()]))
  let t1180 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([polygonal_path(), @paths.path_image_linepath(), @sets.set_of_list()])), t1169), t1179])
  let t1168 = @simp.rewrite_tac(@list.List([polygonal_path()]))
  let t1181 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@ind_types.list_induct())), t1168), @tactics.conj_tac), t1180)
  let t1167 = @sets.set_tac(@list.List([]))
  let t1166 = @simp.rewrite_tac(@list.List([@topology.segment_refl(), @convex.convex_hull_sing()]))
  let t1182 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([polygonal_path(), @paths.path_image_linepath(), @sets.set_of_list()])), t1166), t1167), t1181])
  let t1165 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1164 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1163 = @simp.rewrite_tac(@list.List([]))
  let t1183 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1163), @tactics.gen_tac), t1164), t1165), @tactics.conj_tac), t1182)
  path_image_polygonal_path_subset_convex_hull_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, _]], !(p == NIL) → SUBSET(path_image(polygonal_path(p)), hull(convex, set_of_list(p)))"), t1183))
}

///|
let path_image_polygonal_path_subset_convex_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_IMAGE_POLYGONAL_PATH_SUBSET_CONVEX_HULL")

///|
/// `PATH_IMAGE_POLYGONAL_PATH_SUBSET_CONVEX_HULL`
pub fn path_image_polygonal_path_subset_convex_hull() -> @kernel.Thm {
  path_image_polygonal_path_subset_convex_hull_c.get()
}

///|
/// PATH_IMAGE_POLYGONAL_PATH_SUBSET_SEGMENTS
fn step_37() -> Unit raise {
  let t1295 = @meson.asm_meson_tac(@list.List([]))
  let t1294 = @simp.asm_rewrite_tac(@list.List([@topology.ends_in_segment()]))
  let t1292 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t1293 = @tactics.map_every(fn(x1289 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1290 = @tactics.exists_tac(x1289)
    fn(x1291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1290(x1291)
    }
  }, @list.List([@term_syntax.parse_term("segment([((d : Cart[Real, N]), (e : Cart[Real, N]))])"), t1292]))
  let t1284 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((sab : (_) -> Bool), (p : (_) -> Bool)), {(b : _)}) → (∀ sde : (_) -> Bool, ∀ a : _, SUBSET(sde, p) && !IN(b, sde) && IN((d : _), sde) && IN(a, sde) && IN(a, sab) → false)")))
  let t1296 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1287 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.match_mp_tac(t1284(x1285))
      })(((x1286 : @list.List[@kernel.Thm]) => @lib.el(2, x1286))(x1287))
    })(@bool.conjuncts_rule(x1288))
  }), t1293), t1294), t1295)
  let t1297 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1298 = @simp.asm_rewrite_tac(@list.List([]))
  let t1299 = @meson.asm_meson_tac(@list.List([@lists.mem()]))
  let t1300 = @list.List([@meson.asm_meson_tac(@list.List([@lists.mem()])), t1299, t1298, t1297, t1296])
  let t1283 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1282 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t1281 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Cart[Real, N])"))
  let t1280 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1279 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Cart[Real, N])"))
  let t1278 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1301 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.length_eq_nil()])), t1278), t1279), t1280), t1281), t1282), t1283), t1300)
  let t1277 = @sets.set_tac(@list.List([]))
  let t1276 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t1273 = @drule.match_mp(@paths.arc_distinct_ends())
  let t1275 = @tactics.first_assum(fn(x1274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1271 = @tactics.mp_tac(x1270)
      fn(x1272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1271(x1272)
      }
    })(t1273(x1274))
  })
  let t1268 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t1269 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t1268]), @topology.ends_in_segment()))
  let t1267 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t1266 = @simp.asm_rewrite_tac(@list.List([polygonal_path(), @paths.path_image_linepath()]))
  let t1265 = @tactics.first_x_assum(@tactics.conjuncts_then2(fn(x1259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1260 = @tactics.assume_tac(x1259)
    fn(x1261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1260(x1261)
    }
  }, fn(x1262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1263 = @tactics.mp_tac(x1262)
    fn(x1264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1263(x1264)
    }
  }))
  let t1258 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @sets.subset_union(), @topology.ends_in_segment()]))
  let t1256 = @term_syntax.parse_term("(c : Cart[Real, N])")
  let t1257 = @tactics.map_every(fn(x1253 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1254 = @tactics.exists_tac(x1253)
    fn(x1255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1254(x1255)
    }
  }, @list.List([@term_syntax.parse_term("(b : Cart[Real, N])"), t1256]))
  let t1252 = @simp.asm_rewrite_tac(@list.List([polygonal_path(), @paths.path_image_linepath()]))
  let t1251 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, N]), path_image(polygonal_path(CONS((b : Cart[Real, N]), CONS((c : Cart[Real, N]), (p : List[Cart[Real, N]]))))))"))
  let t1250 = @simp.rewrite_tac(@list.List([@paths.pathfinish_linepath(), @paths.path_image_linepath()]))
  let t1302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.length(), polygonal_path()])), t1250), t1251), t1252), @tactics.disch_tac), t1257), t1258), t1265), t1266), t1267), t1269), t1275), t1276), t1277), t1301])
  let t1249 = @class.asm_cases_tac(@term_syntax.parse_term("(p : List[Cart[Real, N]]) == NIL"))
  let t1248 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t1247 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(3 <= SUC(SUC((p : Num)))) == !(p == 0)"))]))
  let t1244 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t1303 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1242 = @tactics.mp_tac(x1241)
      fn(x1243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1242(x1243)
      }
    })(((x1245 : @kernel.Thm) => @bool.spec(t1244, x1245))(x1246))
  }), t1247), t1248), t1249), t1302)
  let t1240 = @simp.asm_rewrite_tac(@list.List([@topology.ends_in_segment(), @paths.pathfinish_in_path_image()]))
  let t1238 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t1239 = @tactics.map_every(fn(x1235 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1236 = @tactics.exists_tac(x1235)
    fn(x1237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1236(x1237)
    }
  }, @list.List([@term_syntax.parse_term("path_image(polygonal_path(CONS((b : Cart[Real, N]), CONS((c : Cart[Real, N]), (p : List[Cart[Real, N]])))))"), t1238]))
  let t1234 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ b : _, SUBSET(INTER((s : (_) -> Bool), p), {b}) && IN((x : _), p) && IN(b, s) && !(x == b) → !IN(x, s)")))
  let t1233 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t1232 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t1229 = @drule.match_mp(@paths.arc_distinct_ends())
  let t1231 = @tactics.disch_then(fn(x1230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1227 = @tactics.mp_tac(x1226)
      fn(x1228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1227(x1228)
      }
    })(t1229(x1230))
  })
  let t1225 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1220 = @tactics.mp_tac(x1219)
    fn(x1221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1220(x1221)
    }
  }, fn(x1222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1223 = @tactics.assume_tac(x1222)
    fn(x1224 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1223(x1224)
    }
  }))
  let t1218 = @tactics.first_x_assum(@tactics.conjuncts_then(fn(x1215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1216 = @tactics.mp_tac(x1215)
    fn(x1217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1216(x1217)
    }
  }))
  let t1214 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @sets.subset_union(), @topology.ends_in_segment()]))
  let t1213 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t1304 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1210 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1211 = @tactics.exists_tac(x1210)
    fn(x1212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1211(x1212)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t1213])), t1214), t1218), t1225), t1231), t1232), @tactics.disch_tac), t1233), @tactics.disch_tac), t1234), t1239), t1240), t1303])
  let t1209 = @simp.gen_rewrite_tac(fn(x1206 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1207 = @equal.land_conv(x1206)
    fn(x1208 : @kernel.Term) -> @kernel.Thm raise {
      s1207(x1208)
    }
  }, @list.List([@sets.in_union()]))
  let t1205 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1200 = @tactics.assume_tac(x1199)
    fn(x1201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1200(x1201)
    }
  }, fn(x1202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1203 = @tactics.mp_tac(x1202)
    fn(x1204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1203(x1204)
    }
  })))
  let t1198 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.path_image_linepath(), @paths.arc_linepath()]))
  let t1197 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @paths.arc_join_eq(), @lists.not_cons_nil(), @lists.hd()]))
  let t1196 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t1195 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1194 = @simp.rewrite_tac(@list.List([polygonal_path()]))
  let t1193 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1192 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : List[Cart[Real, N]])"))
  let t1191 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Cart[Real, N])"))
  let t1190 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1189 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1188 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, N])"))
  let t1187 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1186 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1185 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1184 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1305 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1184), t1185), t1186), t1187), t1188), t1189), t1190), t1191), t1192), t1193), t1194), t1195), t1196), t1197), t1198), t1205), t1209), @tactics.strip_tac), t1304)
  path_image_polygonal_path_subset_segments_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], ∀ x : Cart[Real, N], arc(polygonal_path(p)) && 3 <= LENGTH(p) && IN(x, path_image(polygonal_path(p))) → (∃ a : Cart[Real, N], ∃ b : Cart[Real, N], MEM(a, p) && MEM(b, p) && IN(x, segment([(a, b)])) && SUBSET(segment([(a, b)]), path_image(polygonal_path(p))) && !(IN(pathstart(polygonal_path(p)), segment([(a, b)])) && IN(pathfinish(polygonal_path(p)), segment([(a, b)]))))"), t1305))
}

///|
let path_image_polygonal_path_subset_segments_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_IMAGE_POLYGONAL_PATH_SUBSET_SEGMENTS")

///|
/// `PATH_IMAGE_POLYGONAL_PATH_SUBSET_SEGMENTS`
pub fn path_image_polygonal_path_subset_segments() -> @kernel.Thm {
  path_image_polygonal_path_subset_segments_c.get()
}

///|
/// SET_OF_LIST_POLYGONAL_PATH_ROTATE
fn step_38() -> Unit raise {
  let t1317 = @sets.set_tac(@list.List([]))
  let t1316 = @simp.rewrite_tac(@list.List([@sets.set_of_list_append(), @sets.set_of_list()]))
  let t1315 = @tactics.first_x_assum(fn(x1306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1306
    @simp.gen_rewrite_tac(fn(x1314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1308 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1309 = @equal.rand_conv(x1308)
        fn(x1310 : @kernel.Term) -> @kernel.Thm raise {
          s1309(x1310)
        }
      })((fn(x1311 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1312 = @equal.rand_conv(x1311)
        fn(x1313 : @kernel.Term) -> @kernel.Thm raise {
          s1312(x1313)
        }
      })(x1314))
    }, @list.List([@equal.gsym(@drule.match_mp(@lists.append_butlast_last())(th))]))
  })
  let t1318 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1315), t1316), t1317)
  set_of_list_polygonal_path_rotate_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[_], !(p == NIL) → set_of_list(CONS(LAST(p), BUTLAST(p))) == set_of_list(p)"), t1318))
}

///|
let set_of_list_polygonal_path_rotate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_OF_LIST_POLYGONAL_PATH_ROTATE")

///|
/// `SET_OF_LIST_POLYGONAL_PATH_ROTATE`
pub fn set_of_list_polygonal_path_rotate() -> @kernel.Thm {
  set_of_list_polygonal_path_rotate_c.get()
}

///|
/// PROPERTIES_POLYGONAL_PATH_SNOC
fn step_39() -> Unit raise {
  let t1430 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t1429 = @simp.asm_rewrite_tac(@list.List([]))
  let t1427 = @tactics.disch_then(fn(x1424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1425 = @tactics.subst1_tac(x1424)
    fn(x1426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1425(x1426)
    }
  })
  let t1428 = @list.List([@simp.simp_tac(@list.List([pathstart_polygonal_path(), @paths.pathfinish_linepath(), @paths.pathstart_join(), @lists.not_cons_nil(), @lists.hd()])), t1427])
  let t1418 = @drule.part_match(fn(x1417 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1417))
  }, @paths.arc_join_eq())
  let t1412 = @tactics.disch_then(fn(x1409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1410 = @tactics.subst1_tac(x1409)
    fn(x1411 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1410(x1411)
    }
  })
  let t1408 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd()]))
  let t1413 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @paths.pathfinish_linepath()])), t1408), t1412])
  let t1402 = @drule.part_match(fn(x1401 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1401))
  }, @paths.arc_join_eq())
  let t1396 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.last(), @lists.last_append(), @lists.append_eq_nil()]))
  let t1395 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path()]))
  let t1397 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@paths.simple_path_eq_arc())), t1395), t1396), @tactics.all_tac])
  let t1431 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((q : Bool) == (p : Bool) && (q' : Bool) == (p' : Bool)) && p == p' → p == p' && q == q'"))), @tactics.conj_tac), t1397), fn(x1407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1404 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1403 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1399 = @tactics.mp_tac(x1398)
            fn(x1400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1399(x1400)
            }
          })(t1402(x1403))
        })(@equal.lhs(x1404))
      })((fn(x1405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1405.1
      })(x1406))
    })(x1407)(x1407)
  }), @tactics.ants_tac), t1413), fn(x1423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1420 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1419 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1415 = @tactics.mp_tac(x1414)
            fn(x1416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1415(x1416)
            }
          })(t1418(x1419))
        })(@equal.rhs(x1420))
      })((fn(x1421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1421.1
      })(x1422))
    })(x1423)(x1423)
  }), @tactics.ants_tac), t1428), t1429), t1430)
  let t1394 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t1393 = @simp.asm_rewrite_tac(@list.List([]))
  let t1391 = @tactics.disch_then(fn(x1388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1389 = @tactics.subst1_tac(x1388)
    fn(x1390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1389(x1390)
    }
  })
  let t1387 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.last(), @lists.last_append(), @lists.append_eq_nil()]))
  let t1392 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path()])), t1387), t1391])
  let t1381 = @drule.part_match(fn(x1380 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1380))
  }, @paths.simple_path_join_loop_eq())
  let t1375 = @tactics.disch_then(fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1373 = @tactics.subst1_tac(x1372)
    fn(x1374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1373(x1374)
    }
  })
  let t1371 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.last(), @lists.last_append(), @lists.append_eq_nil()]))
  let t1370 = @simp.rewrite_tac(@list.List([pathfinish_polygonal_path(), @paths.pathstart_linepath()]))
  let t1376 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @paths.pathfinish_linepath()])), t1370), t1371), t1375])
  let t1364 = @drule.part_match(fn(x1363 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1363))
  }, @paths.simple_path_join_loop_eq())
  let t1359 = @simp.asm_rewrite_tac(@list.List([]))
  let t1357 = @simp.asm_rewrite_tac(@list.List([pathfinish_polygonal_path(), @lists.not_cons_nil(), @lists.last(), @lists.append_eq_nil(), @lists.last_append()]))
  let t1356 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t1358 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.arc_simple_path(), @paths.pathstart_join(), @paths.pathfinish_join()])), t1356), t1357), @tactics.all_tac])
  let t1432 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) && !(p' : Bool)) && (q : Bool) == (q' : Bool) → p == p' && q == q'"))), @tactics.conj_tac), t1358), t1359), fn(x1369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1366 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1365 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1361 = @tactics.mp_tac(x1360)
            fn(x1362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1361(x1362)
            }
          })(t1364(x1365))
        })(@equal.lhs(x1366))
      })((fn(x1367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1367.1
      })(x1368))
    })(x1369)(x1369)
  }), @tactics.ants_tac), t1376), fn(x1386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1383 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1382 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1378 = @tactics.mp_tac(x1377)
            fn(x1379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1378(x1379)
            }
          })(t1381(x1382))
        })(@equal.rhs(x1383))
      })((fn(x1384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1384.1
      })(x1385))
    })(x1386)(x1386)
  }), @tactics.ants_tac), t1392), t1393), t1394), t1431])
  let t1355 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, N]) == (d : Cart[Real, N])"))
  let t1353 = @simp.rewrite_tac(@list.List([@sets.union_aci()]))
  let t1354 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_join(), @paths.pathfinish_join(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), @lists.not_cons_nil(), @lists.hd()])), t1353), @tactics.all_tac])
  let t1351 = @equal.gsym(@paths.simple_path_assoc())
  let t1352 = @simp.simp_tac(@list.List([@equal.gsym(@paths.arc_assoc()), t1351, @paths.pathstart_join(), @paths.pathfinish_join(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), @lists.not_cons_nil(), @lists.hd()]))
  let t1350 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1345 = @tactics.assume_tac(x1344)
    fn(x1346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1345(x1346)
    }
  }, fn(x1347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1348 = @tactics.mp_tac(x1347)
    fn(x1349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1348(x1349)
    }
  }))
  let t1343 = @simp.rewrite_tac(@list.List([@lists.append(), @lists.length(), @int.arith_rule(@term_syntax.parse_term("2 <= SUC(SUC((n : Num)))"))]))
  let t1342 = @tactics.pop_assum_list(fn(x1341 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1337 = @term_syntax.parse_term("(d : Cart[Real, N])")
  let t1340 = @tactics.first_x_assum(fn(x1339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1335 = @tactics.mp_tac(x1334)
      fn(x1336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1335(x1336)
      }
    })(((x1338 : @kernel.Thm) => @bool.spec(t1337, x1338))(x1339))
  })
  let t1333 = @simp.once_rewrite_tac(@list.List([polygonal_path()]))
  let t1332 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1331 = @simp.once_rewrite_tac(@list.List([@lists.last()]))
  let t1330 = @simp.rewrite_tac(@list.List([@lists.append()]))
  let t1329 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Cart[Real, N])"))
  let t1328 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1326 = @term_syntax.parse_term("(p : List[Cart[Real, N]])")
  let t1327 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Cart[Real, N])"), t1326]))
  let t1325 = @list.List([@simp.rewrite_tac(@list.List([@lists.append(), polygonal_path(), @lists.last(), @lists.not_cons_nil()])), @tactics.all_tac])
  let t1324 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1323 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, N])"))
  let t1322 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1321 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1320 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1319 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1433 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1319), t1320), t1321), t1322), t1323), t1324), @tactics.conj_tac), t1325), t1327), t1328), t1329), @tactics.disch_tac), t1330), t1331), t1332), t1333), t1340), t1342), t1343), t1350), t1352), @tactics.disch_tac), @tactics.conj_tac), t1354), t1355), t1432)
  properties_polygonal_path_snoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], ∀ d : Cart[Real, N], 2 <= LENGTH(p) → path_image(polygonal_path(APPEND(p, [d]))) == path_image(op_plus_plus(polygonal_path(p), linepath((LAST(p), d)))) && arc(polygonal_path(APPEND(p, [d]))) == arc(op_plus_plus(polygonal_path(p), linepath((LAST(p), d)))) && simple_path(polygonal_path(APPEND(p, [d]))) == simple_path(op_plus_plus(polygonal_path(p), linepath((LAST(p), d))))"), t1433))
}

///|
let properties_polygonal_path_snoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROPERTIES_POLYGONAL_PATH_SNOC")

///|
/// `PROPERTIES_POLYGONAL_PATH_SNOC`
pub fn properties_polygonal_path_snoc() -> @kernel.Thm {
  properties_polygonal_path_snoc_c.get()
}

///|
/// PATH_IMAGE_POLYGONAL_PATH_ROTATE
fn step_40() -> Unit raise {
  let t1468 = @simp.rewrite_tac(@list.List([@sets.union_aci()]))
  let t1467 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @lists.last(), @lists.not_cons_nil(), @lists.hd()]))
  let t1466 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@lists.last()])))
  let t1465 = @simp.gen_rewrite_tac(fn(x1464 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1458 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1459 = @equal.rand_conv(x1458)
      fn(x1460 : @kernel.Term) -> @kernel.Thm raise {
        s1459(x1460)
      }
    })((fn(x1461 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1462 = @equal.rand_conv(x1461)
      fn(x1463 : @kernel.Term) -> @kernel.Thm raise {
        s1462(x1463)
      }
    })(x1464))
  }, @list.List([polygonal_path()]))
  let t1457 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1456 = @simp.once_rewrite_tac(@list.List([@lists.last()]))
  let t1455 = @simp.simp_tac(@list.List([properties_polygonal_path_snoc(), @lists.length(), @int.arith_rule(@term_syntax.parse_term("2 <= SUC(SUC((n : Num)))"))]))
  let t1454 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@lists.last())]))
  let t1453 = @simp.rewrite_tac(@list.List([@lists.last(), @lists.not_cons_nil()]))
  let t1452 = @tactics.disch_then(fn(x1451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1449 = @tactics.mp_tac(x1448)
      fn(x1450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1449(x1450)
      }
    })(@bool.conjunct2(x1451))
  })
  let t1447 = @tactics.replicate_tac(3, @tactics.disch_then(fn(x1446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t1444 = @term_syntax.parse_term("(p : List[Cart[Real, N]])")
  let t1445 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Cart[Real, N])"), t1444]))
  let t1442 = @meson.meson_tac(@list.List([]))
  let t1443 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.last(), @lists.append(), @lists.not_cons_nil()])), t1442), @tactics.all_tac])
  let t1441 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1440 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1439 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl()]))
  let t1438 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, N])"))
  let t1437 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1436 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1435 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1434 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1469 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1434), t1435), t1436), t1437), t1438), t1439), t1440), t1441), @tactics.conj_tac), t1443), t1445), t1447), t1452), t1453), t1454), @tactics.disch_tac), t1455), t1456), t1457), t1465), t1466), t1467), t1468)
  path_image_polygonal_path_rotate_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], 2 <= LENGTH(p) && LAST(p) == HD(p) → path_image(polygonal_path(APPEND(TL(p), [HD(TL(p))]))) == path_image(polygonal_path(p))"), t1469))
}

///|
let path_image_polygonal_path_rotate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_IMAGE_POLYGONAL_PATH_ROTATE")

///|
/// `PATH_IMAGE_POLYGONAL_PATH_ROTATE`
pub fn path_image_polygonal_path_rotate() -> @kernel.Thm {
  path_image_polygonal_path_rotate_c.get()
}

///|
/// SIMPLE_PATH_POLYGONAL_PATH_ROTATE
fn step_41() -> Unit raise {
  let t1504 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @sets.inter_aci(), @theorems.conj_aci()]))
  let t1503 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @lists.last(), @lists.not_cons_nil(), @lists.hd()]))
  let t1502 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@lists.last()])))
  let t1501 = @simp.gen_rewrite_tac(fn(x1500 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1494 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1495 = @equal.rand_conv(x1494)
      fn(x1496 : @kernel.Term) -> @kernel.Thm raise {
        s1495(x1496)
      }
    })((fn(x1497 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1498 = @equal.rand_conv(x1497)
      fn(x1499 : @kernel.Term) -> @kernel.Thm raise {
        s1498(x1499)
      }
    })(x1500))
  }, @list.List([polygonal_path()]))
  let t1493 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1492 = @simp.once_rewrite_tac(@list.List([@lists.last()]))
  let t1491 = @simp.simp_tac(@list.List([properties_polygonal_path_snoc(), @lists.length(), @int.arith_rule(@term_syntax.parse_term("2 <= SUC(SUC((n : Num)))"))]))
  let t1490 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@lists.last())]))
  let t1489 = @simp.rewrite_tac(@list.List([@lists.last(), @lists.not_cons_nil()]))
  let t1488 = @tactics.disch_then(fn(x1487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1485 = @tactics.mp_tac(x1484)
      fn(x1486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1485(x1486)
      }
    })(@bool.conjunct2(x1487))
  })
  let t1483 = @tactics.replicate_tac(3, @tactics.disch_then(fn(x1482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t1480 = @term_syntax.parse_term("(p : List[Cart[Real, N]])")
  let t1481 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Cart[Real, N])"), t1480]))
  let t1478 = @meson.meson_tac(@list.List([]))
  let t1479 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.last(), @lists.append(), @lists.not_cons_nil()])), t1478), @tactics.all_tac])
  let t1477 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1476 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1475 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl()]))
  let t1474 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, N])"))
  let t1473 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1472 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1471 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1470 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1505 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t1470), t1471), t1472), t1473), t1474), t1475), t1476), t1477), @tactics.conj_tac), t1479), t1481), t1483), t1488), t1489), t1490), @tactics.disch_tac), t1491), t1492), t1493), t1501), t1502), t1503), t1504)
  simple_path_polygonal_path_rotate_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, N]], 2 <= LENGTH(p) && LAST(p) == HD(p) → simple_path(polygonal_path(APPEND(TL(p), [HD(TL(p))]))) == simple_path(polygonal_path(p))"), t1505))
}

///|
let simple_path_polygonal_path_rotate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIMPLE_PATH_POLYGONAL_PATH_ROTATE")

///|
/// `SIMPLE_PATH_POLYGONAL_PATH_ROTATE`
pub fn simple_path_polygonal_path_rotate() -> @kernel.Thm {
  simple_path_polygonal_path_rotate_c.get()
}

///|
/// ROTATE_LIST_TO_FRONT_1
fn step_42() -> Unit raise {
  let t1519 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (k : Num) → k - 1 < k && k - (k - 1) == 1"))]))
  let t1516 = @term_syntax.parse_term("(k : Num) - 1")
  let t1520 = @tactics.then_tac(@tactics.disch_then(fn(x1518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1514 = @tactics.mp_tac(x1513)
      fn(x1515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1514(x1515)
      }
    })(((x1517 : @kernel.Thm) => @bool.spec(t1516, x1517))(x1518))
  }), t1519)
  let t1512 = @tactics.try_tac(@tactics.first_x_assum(@tactics.match_mp_tac))
  let t1511 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1510 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) - SUC((i : Num)) == k - i - 1"))]))
  let t1521 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@arith.sub_0()]))), @tactics.disch_tac), t1510), t1511), @tactics.conj_tac), t1512), @int.asm_arith_tac), t1520])
  let t1509 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, i < (k : Num) → (P : (Num) -> Bool)(k - i)"), fn(x1506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1507 = @tactics.mp_tac(x1506)
    fn(x1508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1507(x1508)
    }
  })
  let t1522 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1509), t1521)
  let lemma0 = @tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ i : Num, P(i) && 0 < i → P(i - 1)) && (∃ k : Num, 0 < k && P(k)) → P(1)"), t1522)
  let t1590 = @simp.asm_simp_tac(@list.List([@lists.el_tl(), @int.arith_rule(@term_syntax.parse_term("0 < (k : Num) → k - 1 + 1 == k"))]))
  let t1589 = @simp.asm_rewrite_tac(@list.List([@lists.length()]))
  let t1588 = @simp.asm_simp_tac(@list.List([@lists.length_append(), @lists.length_tl(), @lists.el_append()]))
  let t1587 = @list.List([@meson.asm_meson_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("!(3 <= 0)"))])), @tactics.all_tac])
  let t1586 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : List[A]) == NIL)"), fn(x1583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1584 = @tactics.assume_tac(x1583)
    fn(x1585 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1584(x1585)
    }
  })
  let t1582 = @tactics.exists_tac(@term_syntax.parse_term("APPEND(TL((m : List[A])), [HD(TL(m))])"))
  let t1581 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : List[A])"))(@tactics.strip_assume_tac))
  let t1580 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1575 = @tactics.mp_tac(x1574)
    fn(x1576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1575(x1576)
    }
  }, fn(x1577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1578 = @tactics.assume_tac(x1577)
    fn(x1579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1578(x1579)
    }
  }))
  let t1573 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1572 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t1569 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(lemma0))
  let t1571 = @tactics.disch_then(fn(x1570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1567 = @tactics.mp_tac(x1566)
      fn(x1568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1567(x1568)
      }
    })(t1569(x1570))
  })
  let t1591 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()])), t1571), @tactics.ants_tac), t1572), t1573), t1580), t1581), t1582), t1586), t1587), t1588), t1589), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), @class.cond_cases_tac), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t1590)
  let t1563 = @simp.asm_rewrite_tac(@list.List([]))
  let t1562 = @term_syntax.parse_term("(l : List[A])")
  let t1564 = @tactics.then_tac(@tactics.map_every(fn(x1559 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1560 = @tactics.exists_tac(x1559)
    fn(x1561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1560(x1561)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num)"), t1562])), t1563)
  let t1558 = @meson.asm_meson_tac(@list.List([@lists.last_el()]))
  let t1557 = @simp.asm_simp_tac(@list.List([@lists.el_tl(), @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → n - 2 + 1 == n - 1"))]))
  let t1556 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → n - 2 < n - 1"))]))
  let t1555 = @tactics.replicate_tac(2, @tactics.thenl(@tactics.conj_tac, @list.List([@int.asm_arith_tac, @tactics.all_tac])))
  let t1554 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1553 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= LENGTH((l : List[A]))"), fn(x1550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1551 = @tactics.assume_tac(x1550)
    fn(x1552 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1551(x1552)
    }
  })
  let t1549 = @simp.rewrite_tac(@list.List([@arith.lt_refl(), @lists.length(), @arith.sub_refl(), @lists.el(), @lists.hd()]))
  let t1548 = @simp.asm_simp_tac(@list.List([@lists.length_append(), @lists.length_tl(), @lists.el_append()]))
  let t1547 = @tactics.exists_tac(@term_syntax.parse_term("APPEND(TL((l : List[A])), [HD(TL(l))])"))
  let t1565 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("LENGTH((l : List[A])) - 2")), t1547), t1548), t1549), t1553), t1554), t1555), t1556), t1557), t1558), t1564])
  let t1545 = @int.arith_rule(@term_syntax.parse_term("(i : Num) == 0 || 0 < i"))
  let t1546 = @tactics.disj_cases_then2(fn(x1539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1540 = @tactics.subst_all_tac(x1539)
    fn(x1541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1540(x1541)
    }
  }, fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1543 = @tactics.assume_tac(x1542)
    fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1543(x1544)
    }
  })(t1545)
  let t1538 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(@tactics.strip_assume_tac))
  let t1535 = @simp.gen_rewrite_rule(fn(x1534 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1534
  }, @list.List([@lists.mem_exists_el()]))
  let t1537 = @tactics.first_x_assum(fn(x1536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1532 = @tactics.mp_tac(x1531)
      fn(x1533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1532(x1533)
      }
    })(t1535(x1536))
  })
  let t1530 = @list.List([@meson.asm_meson_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("!(3 <= 0)"))])), @tactics.all_tac])
  let t1592 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((l : List[A]) == NIL)"), fn(x1527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1528 = @tactics.assume_tac(x1527)
    fn(x1529 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1528(x1529)
    }
  }), t1530), t1537), t1538), t1546), t1565), t1591])
  let t1526 = @tactics.subgoal_then(@term_syntax.parse_term("∃ i : Num, ∃ l' : List[A], 0 < i && i < LENGTH(l') && (P : (List[A]) -> Bool)(l') && EL(i, l') == (a : A)"), fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1524 = @tactics.mp_tac(x1523)
    fn(x1525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1524(x1525)
    }
  })
  let t1593 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1526), t1592)
  rotate_list_to_front_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (List[A]) -> Bool, ∀ l : List[A], ∀ a : A, (∀ l : List[A], P(l) → 3 <= LENGTH(l) && LAST(l) == HD(l)) && (∀ l : List[A], P(l) → P(APPEND(TL(l), [HD(TL(l))]))) && P(l) && MEM(a, l) → (∃ l' : List[A], EL(1, l') == a && P(l'))"), t1593))
}

///|
let rotate_list_to_front_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATE_LIST_TO_FRONT_1")

///|
/// `ROTATE_LIST_TO_FRONT_1`
pub fn rotate_list_to_front_1() -> @kernel.Thm {
  rotate_list_to_front_1_c.get()
}

///|
/// ROTATE_LIST_TO_FRONT_0
fn step_43() -> Unit raise {
  let t1613 = @simp.rewrite_tac(@list.List([@lists.append(), @lists.hd(), @lists.tl(), @calc_num.num_conv(@term_syntax.parse_term("1")), @lists.el()]))
  let t1612 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1611 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1610 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1609 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1607 = @term_syntax.parse_term("(p : List[A])")
  let t1608 = @tactics.spec_tac(@term_syntax.parse_term("(l' : List[A])"), t1607)
  let t1606 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1605 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= LENGTH((l' : List[A]))"), fn(x1602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1603 = @tactics.mp_tac(x1602)
    fn(x1604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1603(x1604)
    }
  })
  let t1601 = @tactics.undisch_tac(@term_syntax.parse_term("EL(1, (l' : List[A])) == (a : A)"))
  let t1600 = @simp.asm_simp_tac(@list.List([]))
  let t1599 = @tactics.exists_tac(@term_syntax.parse_term("APPEND(TL((l' : List[A])), [HD(TL(l'))])"))
  let t1598 = @tactics.x_gen_tac(@term_syntax.parse_term("(l' : List[A])"))
  let t1597 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1594 = @term_syntax.parse_term("(a : A)")
  let t1595 = @term_syntax.parse_term("(l : List[A])")
  let t1596 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(P : (List[A]) -> Bool)"), t1595, t1594]), rotate_list_to_front_1()))
  let t1614 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1596), t1597), t1598), @tactics.strip_tac), t1599), t1600), t1601), t1605), t1606), t1608), t1609), t1610), @tactics.gen_tac), t1611), t1612), t1613)
  rotate_list_to_front_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (List[A]) -> Bool, ∀ l : List[A], ∀ a : A, (∀ l : List[A], P(l) → 3 <= LENGTH(l) && LAST(l) == HD(l)) && (∀ l : List[A], P(l) → P(APPEND(TL(l), [HD(TL(l))]))) && P(l) && MEM(a, l) → (∃ l' : List[A], HD(l') == a && P(l'))"), t1614))
}

///|
let rotate_list_to_front_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATE_LIST_TO_FRONT_0")

///|
/// `ROTATE_LIST_TO_FRONT_0`
pub fn rotate_list_to_front_0() -> @kernel.Thm {
  rotate_list_to_front_0_c.get()
}

///|
/// DISTINGUISHING_ROTATION_EXISTS_PAIR
fn step_44() -> Unit raise {
  let t1628 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_0()]))
  let t1627 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) - (y : Cart[Real, 2])"))
  let t1626 = @tactics.match_mp_tac(@transcendentals.arg_rotate2d_unique_2pi())
  let t1625 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1624 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1623 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, ∀ y : _, IN(x, (s : (_) -> Bool)) && IN(y, s) → x == y) → (∃ a : _, SUBSET(s, {a}))")))
  let t1622 = @tactics.match_mp_tac(@meson.meson(@list.List([@sets.finite_sing(), @sets.finite_subset()]), @term_syntax.parse_term("(∃ a : _, SUBSET((s : (_) -> Bool), {a})) → FINITE(s)")))
  let t1621 = @simp.rewrite_tac(@list.List([@sets.finite_union(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | (p : (_) -> Bool)(x) && (q : (_) -> Bool)(x) && ((r : (_) -> Bool)(x) || (s : (_) -> Bool)(x))} == UNION({(x : _) | p(x) && q(x) && r(x)}, {(x : _) | p(x) && q(x) && s(x)})"))]))
  let t1618 = @equal.gsym(@transcendentals.arg_eq_0_pi())
  let t1619 = @equal.gsym(@complexes.real())
  let t1620 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.im_def()), t1619, t1618]))
  let t1617 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.rotate2d_sub())]))
  let t1616 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_component())]))
  let t1615 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t1629 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1615), t1616), t1617), t1620), t1621), @tactics.conj_tac), t1622), t1623), t1624), t1625), t1626), t1627), t1628)
  distinguishing_rotation_exists_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], !(x == y) → FINITE({(t : Real) | real_of_num(0) <= t && t < real_of_num(2) * pi && op_dollar(rotate2d(t, x), 2) == op_dollar(rotate2d(t, y), 2)})"), t1629))
}

///|
let distinguishing_rotation_exists_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISTINGUISHING_ROTATION_EXISTS_PAIR")

///|
/// `DISTINGUISHING_ROTATION_EXISTS_PAIR`
pub fn distinguishing_rotation_exists_pair() -> @kernel.Thm {
  distinguishing_rotation_exists_pair_c.get()
}

///|
/// DISTINGUISHING_ROTATION_EXISTS
fn step_45() -> Unit raise {
  let t1660 = @meson.meson_tac(@list.List([]))
  let t1659 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rotate2d_eq()]))
  let t1658 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_image()]))
  let t1657 = @simp.rewrite_tac(@list.List([@sets.pairwise(), @sets.in_elim_thm()]))
  let t1656 = @simp.rewrite_tac(@list.List([@sets.unions_image(), @sets.exists_in_gspec()]))
  let t1655 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1653 = @tactics.mp_tac(x1652)
    fn(x1654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1653(x1654)
    }
  }))
  let t1651 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t1650 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1649 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_diff(), @sets.in_elim_thm()]))
  let t1647 = @drule.match_mp(@meson.meson(@list.List([@sets.finite_empty(), @sets.infinite()]), @term_syntax.parse_term("INFINITE((s : (_) -> Bool)) → !(s == {})")))
  let t1661 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1645 = @tactics.mp_tac(x1644)
      fn(x1646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1645(x1646)
      }
    })(t1647(x1648))
  }), t1649), t1650), t1651), t1655), t1656), t1657), t1658), t1659), t1660)
  let t1641 = @simp.asm_simp_tac(@list.List([distinguishing_rotation_exists_pair()]))
  let t1642 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.forall_in_gspec()])), t1641)
  let t1640 = @sets.set_tac(@list.List([]))
  let t1639 = @simp.asm_simp_tac(@list.List([@sets.finite_product_dependent()]))
  let t1638 = @tactics.exists_tac(@term_syntax.parse_term("{((x : Cart[Real, 2]), (y : Cart[Real, 2])) | IN(x, (s : (Cart[Real, 2]) -> Bool)) && IN(y, s)}"))
  let t1637 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1643 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image()), t1637), t1638), t1639), t1640), t1642])
  let t1636 = @simp.rewrite_tac(@list.List([@sets.finite_unions()]))
  let t1635 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1634 = @simp.rewrite_tac(@list.List([@sets.infinite(), @sets.finite_real_interval(), @real.real_not_le()]))
  let t1662 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.infinite_diff_finite()), t1634), @tactics.conj_tac), t1635), t1636), @tactics.conj_tac), t1643), t1661])
  let t1633 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE(DIFF({(t : Real) | real_of_num(0) <= t && t < real_of_num(2) * pi}, UNIONS(IMAGE(GABS((f : ((Cart[Real, 2], Cart[Real, 2]), Real) -> Bool) => ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], GEQ(f((x, y)), {(t : Real) | real_of_num(0) <= t && t < real_of_num(2) * pi && op_dollar(rotate2d(t, x), 2) == op_dollar(rotate2d(t, y), 2)})), {((x : Cart[Real, 2]), (y : Cart[Real, 2])) | IN(x, (s : (Cart[Real, 2]) -> Bool)) && IN(y, s) && !(x == y)}))))"), fn(x1630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1631 = @tactics.mp_tac(x1630)
    fn(x1632 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1631(x1632)
    }
  })
  let t1663 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1633), t1662)
  distinguishing_rotation_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, FINITE(s) → (∃ t : Real, pairwise((x : Cart[Real, 2]) => (y : Cart[Real, 2]) => !(op_dollar(x, 2) == op_dollar(y, 2)), IMAGE(rotate2d(t), s)))"), t1663))
}

///|
let distinguishing_rotation_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISTINGUISHING_ROTATION_EXISTS")

///|
/// `DISTINGUISHING_ROTATION_EXISTS`
pub fn distinguishing_rotation_exists() -> @kernel.Thm {
  distinguishing_rotation_exists_c.get()
}

///|
/// DISTINGUISHING_ROTATION_EXISTS_POLYGON
fn step_46() -> Unit raise {
  let t1678 = @meson.asm_meson_tac(@list.List([]))
  let t1677 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list(), @transcendentals.rotate2d_eq()]))
  let t1676 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_image()]))
  let t1675 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), @sets.set_of_list_map()]))
  let t1674 = @list.List([@meson.meson_tac(@list.List([@transcendentals.orthogonal_transformation_rotate2d()])), @tactics.all_tac])
  let t1673 = @simp.rewrite_tac(@list.List([@realax.real_add_linv(), @transcendentals.rotate2d_zero(), @lists.map_id()]))
  let t1671 = @equal.gsym(@transcendentals.rotate2d_add())
  let t1672 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o()), @trivia.o_def(), t1671]))
  let t1670 = @tactics.exists_tac(@term_syntax.parse_term("MAP(rotate2d((t : Real)), (p : List[Cart[Real, 2]]))"))
  let t1669 = @tactics.exists_tac(@term_syntax.parse_term("MAP(rotate2d(-(t : Real)))"))
  let t1668 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(@tactics.strip_assume_tac))
  let t1667 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t1666 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list(), @transcendentals.rotate2d_eq()]))
  let t1665 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_image()]))
  let t1664 = @simp.rewrite_tac(@list.List([@sets.finite_set_of_list(), @sets.pairwise()]))
  let t1679 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("set_of_list((p : List[Cart[Real, 2]]))"), distinguishing_rotation_exists()))), t1664), t1665), t1666), t1667), t1668), t1669), t1670), t1672), t1673), @tactics.conj_tac), t1674), t1675), t1676), t1677), t1678)
  distinguishing_rotation_exists_polygon_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, 2]], ∃ f : (List[Cart[Real, 2]]) -> List[Cart[Real, 2]], ∃ q : List[Cart[Real, 2]], (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], orthogonal_transformation(g) && f == MAP(g)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], MEM(x, q) && MEM(y, q) && !(x == y) → !(op_dollar(x, 2) == op_dollar(y, 2))) && f(q) == p"), t1679))
}

///|
let distinguishing_rotation_exists_polygon_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISTINGUISHING_ROTATION_EXISTS_POLYGON")

///|
/// `DISTINGUISHING_ROTATION_EXISTS_POLYGON`
pub fn distinguishing_rotation_exists_polygon() -> @kernel.Thm {
  distinguishing_rotation_exists_polygon_c.get()
}

///|
/// POLYGON_CHOP_IN_TWO
fn step_47() -> Unit raise {
  let wlog_lemma = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : A, ∃ f : (A) -> A, ∃ y : A, (transform : ((A) -> A) -> Bool)(f) && (nice : (A) -> Bool)(y) && f(y) == x) → (∀ P : (A) -> Bool, (∀ f : (A) -> A, ∀ x : A, transform(f) → P(f(x)) == P(x)) && (∀ x : A, nice(x) → P(x)) → (∀ x : A, P(x)))"))
  let t1695 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(@theorems.unwind_thm1())]))
  let t1694 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_rcancel()]))
  let t1693 = @simp.asm_simp_tac(@list.List([@topology.segment_scalar_multiple(), @sets.in_elim_thm()]))
  let t1692 = @simp.rewrite_tac(@list.List([@convex.subset_segment()]))
  let t1691 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @topology.segment_refl(), @sets.subset_refl()])), @tactics.all_tac])
  let t1690 = @class.asm_cases_tac(@term_syntax.parse_term("(dir : Cart[Real, N]) == vec(0)"))
  let t1689 = @simp.asm_rewrite_tac(@list.List([]))
  let t1688 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1687 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1686 = @simp.rewrite_tac(@list.List([@convex.affine_hull_2(), @vectors.vector_mul_rzero(), @vectors.vector_add_lid()]))
  let t1685 = @determinants.geom_origin_tac(@term_syntax.parse_term("(origin : Cart[Real, N])"))
  let t1683 = @term_syntax.parse_term("(dir : Cart[Real, N])")
  let t1684 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(origin : Cart[Real, N])"), t1683]))
  let t1682 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @theorems.left_imp_exists_thm(), @sets.empty_subset()]))
  let t1681 = @simp.rewrite_tac(@list.List([@convex.collinear_affine_hull()]))
  let t1680 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1696 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1680), t1681), t1682), t1684), t1685), t1686), t1687), t1688), @tactics.strip_tac), t1689), t1690), t1691), t1692), t1693), t1694), t1695), @calc_rat.real_arith_tac)
  let between_lemma = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ c : Cart[Real, N], ∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ m : Cart[Real, N], collinear({a, c, u, v, m}) && IN(m, segment([(u, v)])) && IN(m, segment((a, c))) → IN(u, segment((a, c))) || IN(v, segment((a, c))) || SUBSET(segment([(a, c)]), segment([(u, v)]))"), t1696)
  let t3659 = @simp.asm_rewrite_tac(@list.List([@convex.subset_segment()]))
  let t3660 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment([((a : Cart[Real, 2]), (c : Cart[Real, 2]))]), segment([((u : Cart[Real, 2]), (v : Cart[Real, 2]))]))")), t3659)
  let t3656 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @equal.gsym(@real.real_add_rdistrib()), @realax.real_mul_lid()]))
  let t3655 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul(), @real.real_sub_refl()]))
  let t3654 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((u : Real), (a : Cart[Real, N])) + op_pct((v : Real), (c : Cart[Real, N])) - (b : Cart[Real, N]) == op_pct(u, a - b) + (op_pct(v, c - b) + op_pct(u + v - real_of_num(1), b))"))]))
  let t3653 = @simp.asm_rewrite_tac(@list.List([]))
  let t3652 = @simp.rewrite_tac(@list.List([@convex.affine_hull_2(), @sets.in_elim_thm()]))
  let t3651 = @simp.asm_simp_tac(@list.List([@convex.collinear_3_affine_hull()]))
  let t3650 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (v : _), (c : _)} == {a, c, v}"))]))
  let t3657 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (v : Cart[Real, 2]), (c : Cart[Real, 2])})")), t3650), t3651), t3652), @tactics.strip_tac), t3653), t3654), t3655), t3656)
  let t3649 = @sets.set_tac(@list.List([]))
  let t3648 = @tactics.match_mp_tac(@misc.hull_mono())
  let t3647 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t3645 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t3646 = @tactics.spec_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"), t3645)
  let t3644 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t3658 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment([((a : Cart[Real, 2]), (c : Cart[Real, 2]))]))")), t3644), t3646), t3647), t3648), t3649), t3657])
  let t3643 = @simp.asm_rewrite_tac(@list.List([]))
  let t3642 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t3641 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((v : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"))
  let t3640 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t3639 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t3638 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (c : Cart[Real, 2]))))")))
  let t3661 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, 2])")), t3638), t3639), t3640), @tactics.strip_tac), t3641), t3642), @tactics.disch_tac), t3643), @tactics.conj_tac), t3658)
  let t3637 = @sets.set_tac(@list.List([]))
  let t3636 = @tactics.match_mp_tac(@misc.hull_mono())
  let t3635 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t3633 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t3634 = @tactics.spec_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"), t3633)
  let t3632 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t3631 = @tactics.undisch_tac(@term_syntax.parse_term("IN((u : Cart[Real, 2]), segment([((a : Cart[Real, 2]), (c : Cart[Real, 2]))]))"))
  let t3630 = @simp.asm_rewrite_tac(@list.List([]))
  let t3629 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t3628 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((u : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"))
  let t3627 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t3626 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t3625 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("IN((u : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (c : Cart[Real, 2]))))")))
  let t3662 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), t3625), t3626), t3627), @tactics.strip_tac), t3628), t3629), @tactics.disch_tac), t3630), t3631), t3632), t3634), t3635), t3636), t3637), t3661, t3660])
  let t3622 = @sets.set_tac(@list.List([]))
  let t3621 = @simp.asm_rewrite_tac(@list.List([]))
  let t3620 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Cart[Real, 2]), (c : Cart[Real, 2]), (mx : Cart[Real, 2]), (u : Cart[Real, 2])}"))
  let t3619 = @tactics.match_mp_tac(@vectors.collinear_subset())
  let t3618 = @simp.asm_simp_tac(@list.List([@equal.gsym(@convex.collinear_3_affine_hull())]))
  let t3617 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t3616 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t3614 = @tactics.disch_then(fn(x3611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3612 = @tactics.subst1_tac(x3611)
    fn(x3613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3612(x3613)
    }
  })
  let t3615 = @list.List([@sets.set_tac(@list.List([])), t3614])
  let t3610 = @simp.asm_rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t3608 = @term_syntax.parse_term("{(a : Cart[Real, 2]), (c : Cart[Real, 2])}")
  let t3609 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"), t3608]), @convex.affine_independent_convex_affine_hull()))
  let t3623 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()])), t3609), t3610), @tactics.ants_tac), t3615), t3616), @tactics.conj_tac), t3617), t3618), t3619), t3620), t3621), t3622)
  let t3607 = @simp.asm_rewrite_tac(@list.List([]))
  let t3606 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {a, c, b}"))]))
  let t3605 = @tactics.disch_then(fn(x3602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3603 = @tactics.subst1_tac(x3602)
    fn(x3604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3603(x3604)
    }
  })
  let t3601 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t3596 = @drule.part_match(fn(x3595 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x3595))
  }, @vectors.collinear_triples())
  let t3624 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x3600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3597 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s3593 = @tactics.mp_tac(x3592)
          fn(x3594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s3593(x3594)
          }
        })(t3596(x3597))
      })((fn(x3598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3598.1
      })(x3599))
    })(x3600)(x3600)
  }, t3601), t3605), t3606), t3607), t3623])), @tactics.all_tac])
  let t3591 = @simp.asm_rewrite_tac(@list.List([]))
  let t3586 = @term_syntax.parse_term("(mx : Cart[Real, 2])")
  let t3587 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t3588 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t3589 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t3590 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t3589, t3588, t3587, t3586]), between_lemma))
  let t3584 = @simp.asm_rewrite_tac(@list.List([@sets.insert_ac()]))
  let t3583 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.insert_ac()])))
  let t3582 = @tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t3585 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_3_trans()), t3582), t3583), t3584), @tactics.all_tac])
  let t3581 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (v : Cart[Real, 2]), (c : Cart[Real, 2])})"), fn(x3578 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3579 = @tactics.assume_tac(x3578)
    fn(x3580 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3579(x3580)
    }
  })
  let t3576 = @meson.asm_meson_tac(@list.List([@topology.segment_refl(), @sets.in_sing()]))
  let t3577 = @list.List([@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(u : Cart[Real, 2]) == (v : Cart[Real, 2])"), fn(x3573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3574 = @tactics.subst_all_tac(x3573)
    fn(x3575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3574(x3575)
    }
  }), t3576), @tactics.all_tac])
  let t3572 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Cart[Real, 2]) == (v : Cart[Real, 2])"))
  let t3568 = @simp.asm_rewrite_tac(@list.List([@topology.between_in_segment()]))
  let t3569 = @tactics.then_tac(@tactics.match_mp_tac(@vectors.between_imp_collinear()), t3568)
  let t3567 = @sets.set_tac(@list.List([]))
  let t3566 = @simp.asm_rewrite_tac(@list.List([]))
  let t3565 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Cart[Real, 2]), (c : Cart[Real, 2]), (mx : Cart[Real, 2]), (u : Cart[Real, 2])}"))
  let t3570 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_subset()), t3565), t3566), t3567), t3569])
  let t3564 = @simp.asm_rewrite_tac(@list.List([]))
  let t3563 = @tactics.exists_tac(@term_syntax.parse_term("(mx : Cart[Real, 2])"))
  let t3571 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_3_trans()), t3563), t3564), @tactics.conj_tac), t3570), @tactics.all_tac])
  let t3562 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(c : Cart[Real, 2]), (u : Cart[Real, 2]), (v : Cart[Real, 2])})"), fn(x3559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3560 = @tactics.assume_tac(x3559)
    fn(x3561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3560(x3561)
    }
  })
  let t3555 = @simp.asm_rewrite_tac(@list.List([@topology.between_in_segment()]))
  let t3556 = @tactics.then_tac(@tactics.match_mp_tac(@vectors.between_imp_collinear()), t3555)
  let t3554 = @sets.set_tac(@list.List([]))
  let t3553 = @simp.asm_rewrite_tac(@list.List([]))
  let t3552 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Cart[Real, 2]), (c : Cart[Real, 2]), (mx : Cart[Real, 2]), (u : Cart[Real, 2])}"))
  let t3557 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_subset()), t3552), t3553), t3554), t3556])
  let t3551 = @simp.asm_rewrite_tac(@list.List([]))
  let t3550 = @tactics.exists_tac(@term_syntax.parse_term("(mx : Cart[Real, 2])"))
  let t3558 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.collinear_3_trans()), t3550), t3551), @tactics.conj_tac), t3557), @tactics.all_tac])
  let t3549 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (u : Cart[Real, 2]), (v : Cart[Real, 2])})"), fn(x3546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3547 = @tactics.assume_tac(x3546)
    fn(x3548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3547(x3548)
    }
  })
  let t3544 = @simp.asm_rewrite_tac(@list.List([]))
  let t3543 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (c : _), (b : _)} == {a, b, c}"))]))
  let t3545 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.collinear_4_3()])), t3543), t3544), @tactics.all_tac])
  let t3542 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (c : Cart[Real, 2]), (mx : Cart[Real, 2]), (u : Cart[Real, 2])})"), fn(x3539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3540 = @tactics.assume_tac(x3539)
    fn(x3541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3540(x3541)
    }
  })
  let t3537 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3536 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t3535 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"))
  let t3534 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t3533 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((v : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"))
  let t3538 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(mx : Cart[Real, 2]) == (v : Cart[Real, 2])"), fn(x3530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3531 = @tactics.subst_all_tac(x3530)
    fn(x3532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3531(x3532)
    }
  }), t3533), t3534), @tactics.disch_tac), t3535), t3536), t3537), @tactics.all_tac])
  let t3529 = @class.asm_cases_tac(@term_syntax.parse_term("(mx : Cart[Real, 2]) == (v : Cart[Real, 2])"))
  let t3527 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3526 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t3525 = @tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t3524 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t3523 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((u : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"))
  let t3528 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(mx : Cart[Real, 2]) == (u : Cart[Real, 2])"), fn(x3520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3521 = @tactics.subst_all_tac(x3520)
    fn(x3522 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3521(x3522)
    }
  }), t3523), t3524), @tactics.disch_tac), t3525), t3526), t3527), @tactics.all_tac])
  let t3519 = @class.asm_cases_tac(@term_syntax.parse_term("(mx : Cart[Real, 2]) == (u : Cart[Real, 2])"))
  let t3517 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), @vectors.dot_rsub()]))
  let t3515 = @term_syntax.parse_term("dot((n : Cart[Real, 2]), (c : Cart[Real, 2]) - (b : Cart[Real, 2])) == (m : Real)")
  let t3516 = @tactics.map_every(fn(x3512 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3513 = @tactics.undisch_tac(x3512)
    fn(x3514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3513(x3514)
    }
  }, @list.List([@term_syntax.parse_term("dot((n : Cart[Real, 2]), (y : Cart[Real, 2]) - (b : Cart[Real, 2])) == (m : Real)"), t3515]))
  let t3511 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_sub()]))
  let t3510 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.orthogonal_rneg())]))
  let t3509 = @simp.asm_rewrite_tac(@list.List([]))
  let t3508 = @tactics.exists_tac(@term_syntax.parse_term("(n : Cart[Real, 2])"))
  let t3507 = @tactics.match_mp_tac(@vectors.orthogonal_to_orthogonal_2d())
  let t3506 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t3505 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {a, c, b}"))]))
  let t3504 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t3518 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], dot((n : Cart[Real, 2]), y - (b : Cart[Real, 2])) == (m : Real) → collinear({(a : Cart[Real, 2]), y, (c : Cart[Real, 2])})"), fn(x3501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x3501
    let t3503 = @simp.asm_rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(th_7)), t3503)
  }), t3504), @tactics.disch_tac), t3505), t3506), t3507), t3508), t3509), t3510), t3511), t3516), t3517), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3500 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(a : Cart[Real, 2]), (mx : Cart[Real, 2]), (c : Cart[Real, 2])}) && collinear({a, (u : Cart[Real, 2]), c})"), @tactics.strip_assume_tac)
  let t3498 = @term_syntax.parse_term("!((m : Real) < m)")
  let t3499 = @tactics.map_every(fn(x3497 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3492 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      fn(x3493 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3494 = @tactics.undisch_then(x3492, x3493)
        fn(x3495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3494(x3495)
        }
      }
    })(x3497)(fn(x3496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })
  }, @list.List([@term_syntax.parse_term("(m : Real) <= m"), t3498]))
  let t3491 = @tactics.disch_then(@tactics.conjuncts_then(fn(x3488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x3488
    let t3490 = @tactics.assume_tac(th_6)
    @tactics.then_tac(@tactics.subst_all_tac(th_6), t3490)
  }))
  let t3486 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t3485 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path()))
  let t3484 = @simp.simp_tac(@list.List([@sets.in_inter(), @misc.hull_inc(), @sets.in_insert()]))
  let t3483 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3482 = @simp.asm_rewrite_tac(@list.List([]))
  let t3481 = @tactics.exists_tac(@term_syntax.parse_term("(mx : Cart[Real, 2])"))
  let t3487 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ mx : Cart[Real, 2], dot((n : Cart[Real, 2]), (u : Cart[Real, 2]) - (b : Cart[Real, 2])) <= (m : Real) && !(dot(n, u - b) < dot(n, (c : Cart[Real, 2]) - b)) && dot(n, mx - b) == m && dot(n, mx - b) <= dot(n, c - b) → dot(n, u - b) == m && dot(n, c - b) == m"))), t3481), t3482), t3483), t3484), t3485), t3486), @tactics.all_tac])
  let t3480 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (u : Cart[Real, 2]) - (b : Cart[Real, 2])) == (m : Real) && dot(n, (c : Cart[Real, 2]) - b) == m"), fn(x3477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3478 = @tactics.mp_tac(x3477)
    fn(x3479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3478(x3479)
    }
  })
  let t3475 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul_eq()]))
  let t3474 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((r : Real) * (x : Real) + (s : Real) * x < x) == (real_of_num(0) < (real_of_num(1) - r - s) * x)"))]))
  let t3473 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t3472 = @simp.rewrite_tac(@list.List([@real.real_sub_refl(), @vectors.vector_mul_lzero(), @vectors.vector_add_rid()]))
  let t3471 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((r : Real), (a : Cart[Real, 2])) + (op_pct((s : Real), (b : Cart[Real, 2])) + op_pct((t : Real), (c : Cart[Real, 2]))) - b == op_pct(r, a - b) + (op_pct(t, c - b) + op_pct(r + (s + t) - real_of_num(1), b))"))]))
  let t3470 = @tactics.undisch_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (u : Cart[Real, 2]) - (b : Cart[Real, 2])) < dot(n, (c : Cart[Real, 2]) - b)"))
  let t3469 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t3468 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t3467 = @simp.asm_rewrite_tac(@list.List([]))
  let t3466 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (real_of_num(1) - (q : Real)) * (r : Real) + q * (s : Real)) == (q * (r - s) <= r)"))]))
  let t3465 = @simp.asm_rewrite_tac(@list.List([]))
  let t3464 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (q : Real)) * (rx : Real) + q * (r : Real) + (q * (s : Real) + ((real_of_num(1) - q) * (tx : Real) + q * (t : Real))) == rx + tx + q * (r + (s + t) - (rx + tx))"))]))
  let t3462 = @simp.asm_rewrite_tac(@list.List([]))
  let t3463 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(q : Real)")), t3462), @vectors.vector_arith_tac)])
  let t3461 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t3458 = @term_syntax.parse_term("(real_of_num(1) - (q : Real)) * (tx : Real) + q * (t : Real)")
  let t3459 = @term_syntax.parse_term("(q : Real) * (s : Real)")
  let t3460 = @tactics.map_every(fn(x3455 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3456 = @tactics.exists_tac(x3455)
    fn(x3457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3456(x3457)
    }
  }, @list.List([@term_syntax.parse_term("(real_of_num(1) - (q : Real)) * (rx : Real) + q * (r : Real)"), t3459, t3458]))
  let t3449 = @tactics.match_mp_tac(@real.real_lt_div())
  let t3450 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)), t3449), @calc_rat.asm_real_arith_tac)
  let t3448 = @tactics.match_mp_tac(@real.real_lt_div())
  let t3451 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)), t3448), @calc_rat.asm_real_arith_tac)
  let t3447 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3446 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @real.real_abs_pos()]))
  let t3445 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3444 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (a : Real) && real_of_num(0) <= (x : Real) && real_of_num(0) <= (b : Real) → abs(min(a, min(b, x))) <= x")))
  let t3442 = @calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == (y : Real)) → real_of_num(0) < abs(x - y)"))
  let t3443 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), t3442]))
  let t3441 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t3440 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → x <= a")))
  let t3439 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero()])), @tactics.all_tac])
  let t3452 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == (tx : Real)")), t3439), t3440), t3441), t3443), t3444), t3445), @class.cond_cases_tac), t3446), t3447)
  let t3438 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3437 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @real.real_abs_pos()]))
  let t3436 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3435 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (a : Real) && real_of_num(0) <= (x : Real) && real_of_num(0) <= (b : Real) → abs(min(a, min(x, b))) <= x")))
  let t3433 = @calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == (y : Real)) → real_of_num(0) < abs(x - y)"))
  let t3434 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), t3433]))
  let t3432 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t3431 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → x <= a")))
  let t3430 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero()])), @tactics.all_tac])
  let t3453 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(r : Real) == (rx : Real)")), t3430), t3431), t3432), t3434), t3435), t3436), @class.cond_cases_tac), t3437), t3438), t3452, t3451, t3450])
  let t3429 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3428 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3427 = @simp.rewrite_tac(@list.List([@real.real_lt_min(), @real.real_min_lt()]))
  let t3454 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), min(if (rx : Real) == (r : Real) { real_of_num(1) / real_of_num(2) } else { rx / abs(rx - r) }, if (tx : Real) == (t : Real) { real_of_num(1) / real_of_num(2) } else { tx / abs(tx - t) }))")), t3427), t3428), t3429), t3453), @tactics.all_tac])
  let t3426 = @tactics.subgoal_then(@term_syntax.parse_term("∃ q : Real, q * ((rx : Real) - (r : Real)) <= rx && q * ((tx : Real) - (t : Real)) <= tx && real_of_num(0) < q && q < real_of_num(1)"), @tactics.strip_assume_tac)
  let t3425 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment()]))
  let t3424 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (rx : Real) && rx < real_of_num(1) && real_of_num(0) < (tx : Real) && tx < real_of_num(1)"), @tactics.strip_assume_tac)
  let t3423 = @simp.rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t3422 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_add_lid(), @realax.real_le_refl()]))
  let t3421 = @tactics.undisch_then(@term_syntax.parse_term("(sx : Real) == real_of_num(0)"), fn(x3418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3419 = @tactics.subst_all_tac(x3418)
    fn(x3420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3419(x3420)
    }
  })
  let t3416 = @simp.rewrite_tac(@list.List([]))
  let t3413 = @term_syntax.parse_term("(tx : Real)")
  let t3414 = @term_syntax.parse_term("(sx : Real)")
  let t3415 = @tactics.map_every(fn(x3410 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3411 = @tactics.exists_tac(x3410)
    fn(x3412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3411(x3412)
    }
  }, @list.List([@term_syntax.parse_term("(rx : Real)"), t3414, t3413]))
  let t3409 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3408 = @simp.asm_simp_tac(@list.List([@convex.interior_convex_hull_3()]))
  let t3407 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) → !p → (q : Bool)")))
  let t3417 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.undisch_tac(@term_syntax.parse_term("!IN((mx : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))"))), t3407), t3408), t3409), t3415), t3416), @calc_rat.asm_real_arith_tac)])
  let t3406 = @class.asm_cases_tac(@term_syntax.parse_term("(sx : Real) == real_of_num(0)"))
  let t3404 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_refl(), @vectors.dot_rzero()]))
  let t3403 = @tactics.undisch_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (b : Cart[Real, 2]) - b) == (m : Real)"))
  let t3402 = @tactics.disch_then(fn(x3399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3400 = @tactics.subst_all_tac(x3399)
    fn(x3401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3400(x3401)
    }
  })
  let t3398 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_lid(), @vectors.vector_add_lid(), @vectors.vector_add_rid()]))
  let t3397 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t3396 = @tactics.subgoal_then(@term_syntax.parse_term("(rx : Real) == real_of_num(0) && (tx : Real) == real_of_num(0)"), fn(x3393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3394 = @tactics.assume_tac(x3393)
    fn(x3395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3394(x3395)
    }
  })
  let t3392 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3387 = @tactics.assume_tac(x3386)
    fn(x3388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3387(x3388)
    }
  }, fn(x3389 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3390 = @tactics.mp_tac(x3389)
    fn(x3391 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3390(x3391)
    }
  }))
  let t3405 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3392), t3396), t3397), t3398), t3402), t3403), t3404), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3385 = @class.asm_cases_tac(@term_syntax.parse_term("(sx : Real) == real_of_num(1)"))
  let t3383 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_lid(), @vectors.vector_add_lid()]))
  let t3382 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t3381 = @tactics.subgoal_then(@term_syntax.parse_term("(sx : Real) == real_of_num(0) && (rx : Real) == real_of_num(0)"), fn(x3378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3379 = @tactics.assume_tac(x3378)
    fn(x3380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3379(x3380)
    }
  })
  let t3377 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3372 = @tactics.assume_tac(x3371)
    fn(x3373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3372(x3373)
    }
  }, fn(x3374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3375 = @tactics.mp_tac(x3374)
    fn(x3376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3375(x3376)
    }
  }))
  let t3384 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3377), t3381), t3382), t3383), @tactics.all_tac])
  let t3370 = @class.asm_cases_tac(@term_syntax.parse_term("(tx : Real) == real_of_num(1)"))
  let t3368 = @meson.asm_meson_tac(@list.List([]))
  let t3367 = @simp.rewrite_tac(@list.List([@convex.convex_hull_2(), @sets.in_elim_thm()]))
  let t3366 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t3365 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @convex.segment_convex_hull()]))
  let t3363 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_refl(), @vectors.dot_rzero()]))
  let t3362 = @tactics.undisch_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (b : Cart[Real, 2]) - b) == (m : Real)"))
  let t3360 = @tactics.disch_then(fn(x3357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3358 = @tactics.subst_all_tac(x3357)
    fn(x3359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3358(x3359)
    }
  })
  let t3361 = @list.List([@meson.asm_meson_tac(@list.List([])), t3360])
  let t3364 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()])), @tactics.conj_tac), t3361), t3362), t3363), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3356 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) && (p : Bool) → (p → q) → (r : Bool)")))
  let t3352 = @term_syntax.parse_term("(mx : Cart[Real, 2])")
  let t3355 = @tactics.disch_then(fn(x3354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3350 = @tactics.mp_tac(x3349)
      fn(x3351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3350(x3351)
      }
    })(((x3353 : @kernel.Thm) => @bool.spec(t3352, x3353))(x3354))
  })
  let t3348 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t3347 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(INTER(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))), {a, b})"))
  let t3346 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_add_rid()]))
  let t3369 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @calc_int.real_add_rid()])), t3346), @tactics.strip_tac), t3347), t3348), t3355), t3356), @tactics.conj_tac), t3364), t3365), @tactics.conj_tac), t3366), t3367), t3368), @tactics.all_tac])
  let t3345 = @class.asm_cases_tac(@term_syntax.parse_term("(tx : Real) == real_of_num(0)"))
  let t3343 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_lid(), @vectors.vector_add_rid()]))
  let t3342 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t3341 = @tactics.subgoal_then(@term_syntax.parse_term("(sx : Real) == real_of_num(0) && (tx : Real) == real_of_num(0)"), fn(x3338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3339 = @tactics.assume_tac(x3338)
    fn(x3340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3339(x3340)
    }
  })
  let t3337 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3332 = @tactics.assume_tac(x3331)
    fn(x3333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3332(x3333)
    }
  }, fn(x3334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3335 = @tactics.mp_tac(x3334)
    fn(x3336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3335(x3336)
    }
  }))
  let t3344 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3337), t3341), t3342), t3343), @tactics.all_tac])
  let t3330 = @class.asm_cases_tac(@term_syntax.parse_term("(rx : Real) == real_of_num(1)"))
  let t3328 = @meson.asm_meson_tac(@list.List([]))
  let t3327 = @simp.rewrite_tac(@list.List([@convex.convex_hull_2(), @sets.in_elim_thm()]))
  let t3326 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t3325 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @convex.segment_convex_hull()]))
  let t3324 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t3323 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t3322 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) && (p : Bool) → (p → q) → (r : Bool)")))
  let t3318 = @term_syntax.parse_term("(mx : Cart[Real, 2])")
  let t3321 = @tactics.disch_then(fn(x3320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3316 = @tactics.mp_tac(x3315)
      fn(x3317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3316(x3317)
      }
    })(((x3319 : @kernel.Thm) => @bool.spec(t3318, x3319))(x3320))
  })
  let t3314 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t3313 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(INTER(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), path_image(polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))), {c})"))
  let t3312 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_add_lid()]))
  let t3329 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @realax.real_add_lid()])), t3312), @tactics.strip_tac), t3313), t3314), t3321), t3322), t3323), @tactics.conj_tac), t3324), t3325), @tactics.conj_tac), t3326), t3327), t3328), @tactics.all_tac])
  let t3311 = @class.asm_cases_tac(@term_syntax.parse_term("(rx : Real) == real_of_num(0)"))
  let t3308 = @term_syntax.parse_term("(tx : Real)")
  let t3309 = @term_syntax.parse_term("(sx : Real)")
  let t3310 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(rx : Real)"), t3309, t3308]))
  let t3307 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3306 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.exists_in_gspec()]))
  let t3305 = @simp.once_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t3304 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()]))
  let t3303 = @simp.rewrite_tac(@list.List([@convex.convex_hull_3()]))
  let t3302 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t3301 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t3300 = @tactics.subgoal_then(@term_syntax.parse_term("IN((mx : Cart[Real, 2]), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))"), fn(x3297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3298 = @tactics.mp_tac(x3297)
    fn(x3299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3298(x3299)
    }
  })
  let t3294 = @term_syntax.parse_term("(t : Real)")
  let t3295 = @term_syntax.parse_term("(s : Real)")
  let t3296 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Real)"), t3295, t3294]))
  let t3293 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t3289 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t3292 = @tactics.disch_then(fn(x3291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3287 = @tactics.mp_tac(x3286)
      fn(x3288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3287(x3288)
      }
    })(((x3290 : @kernel.Thm) => @bool.spec(t3289, x3290))(x3291))
  })
  let t3285 = @simp.rewrite_tac(@list.List([@convex.affine_hull_3(), @sets.in_univ()]))
  let t3284 = @simp.gen_rewrite_tac(fn(x3281 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3282 = @equal.land_conv(x3281)
    fn(x3283 : @kernel.Term) -> @kernel.Thm raise {
      s3282(x3283)
    }
  }, @list.List([@sets.extension()]))
  let t3279 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3278 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @cart.dimindex_2()]))
  let t3277 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t3280 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3277), t3278), t3279), @tactics.all_tac])
  let t3276 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}"), @convex.affine_independent_span_eq()))
  let t3272 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3271 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(min(real_of_num(1) / real_of_num(2), x)) <= x")))
  let t3270 = @simp.rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t3269 = @simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@real.real_le_rdiv_eq()), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3268 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) - (op_pct(real_of_num(1) - (u : Real), a) + op_pct(u, (b : Cart[Real, N]))) == op_pct(u, a - b)"))]))
  let t3273 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t3268), t3269), t3270), t3271), t3272)
  let t3267 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3274 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < min(real_of_num(1) / real_of_num(2), x)"))), t3267), @calc_rat.real_arith_tac, t3273])
  let t3266 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3265 = @tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (ee : Real) / norm((u : Cart[Real, 2]) - (mx : Cart[Real, 2])))"))
  let t3264 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, (∃ u : _, (P : (_) -> Bool)(u) && (Q : (_) -> Bool)(u) && x == (f : (_) -> _)(u)) && (R : (_) -> Bool)(x)) == (∃ u : _, P(u) && Q(u) && R(f(u)))"))]))
  let t3263 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment()]))
  let t3262 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t3261 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter()]))
  let t3260 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ee : Real)"))(@tactics.strip_assume_tac))
  let t3259 = @simp.rewrite_tac(@list.List([@topology.in_interior_cball(), @sets.subset(), @topology.in_cball()]))
  let t3275 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((mx : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))")), t3259), t3260), t3261), t3262), t3263), t3264), t3265), t3266), t3274), @tactics.all_tac])
  let t3258 = @class.asm_cases_tac(@term_syntax.parse_term("IN((mx : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))"))
  let t3253 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t3252 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path()))
  let t3251 = @simp.simp_tac(@list.List([@sets.in_inter(), @misc.hull_inc(), @sets.in_insert()]))
  let t3250 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.first_x_assum(@tactics.match_mp_tac)])
  let t3249 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3248 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul(), @realarith.real_sub_lt()]))
  let t3247 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (t : Real)) * (a : Real) < (real_of_num(1) - t) * (m : Real) && t * (b : Real) <= t * m → !((real_of_num(1) - (s : Real)) * m + s * m == (real_of_num(1) - t) * a + t * b)")))
  let t3246 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t3245 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (c : Cart[Real, 2])) + op_pct(u, (a : Cart[Real, 2])) - (b : Cart[Real, 2]) == op_pct(real_of_num(1) - u, c - b) + op_pct(u, a - b)"))]))
  let t3241 = @term_syntax.parse_term("(x : Cart[Real, 2]) => dot((n : Cart[Real, 2]), x - (b : Cart[Real, 2]))")
  let t3244 = @tactics.disch_then(fn(x3243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3239 = @tactics.mp_tac(x3238)
      fn(x3240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3239(x3240)
      }
    })(((x3242 : @kernel.Thm) => @equal.ap_term(t3241, x3242))(x3243))
  })
  let t3237 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x3231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3232 = @tactics.assume_tac(x3231)
    fn(x3233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3232(x3233)
    }
  }, fn(x3234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3235 = @tactics.mp_tac(x3234)
    fn(x3236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3235(x3236)
    }
  })))
  let t3230 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t3229 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t3228 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Real)"))(@tactics.strip_assume_tac))
  let t3227 = @tactics.disch_then(@tactics.conjuncts_then(fn(x3224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3225 = @tactics.mp_tac(x3224)
    fn(x3226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3225(x3226)
    }
  }))
  let t3223 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t3222 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t3254 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()])), t3222), t3223), t3227), t3228), t3229), t3230), t3237), t3244), t3245), t3246), t3247), t3248), t3249), @tactics.conj_tac), t3250), t3251), t3252), t3253)
  let t3221 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) >= (b : Real) + (e : Real)) == (e <= x - b)"))]))
  let t3220 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.set_of_list(), @sets.forall_in_insert(), @sets.in_elim_thm()]))
  let t3219 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_ge()), @convex.convex_halfspace_component_ge()]))
  let t3218 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t3217 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge(), @real.real_not_le(), @real.real_lt_addr()]))
  let t3216 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, 2]) | op_dollar(x, 2) >= op_dollar((b : Cart[Real, 2]), 2) + (e : Real)}"))
  let t3215 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, !IN((b : _), t) && SUBSET((s : (_) -> Bool), t) → !IN(b, s)")))
  let t3214 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : _), (t : (_) -> Bool)) → SUBSET((s : (_) -> Bool), t) → !IN(x, s)")))
  let t3213 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t3255 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))"), path_image_polygonal_path_subset_convex_hull())), t3213), t3214), t3215), t3216), t3217), t3218), t3219), t3220), t3221), t3254])
  let t3212 = @simp.asm_rewrite_tac(@list.List([@topology.ends_in_segment(), @convex.subset_segment()]))
  let t3207 = @term_syntax.parse_term("path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))")
  let t3208 = @term_syntax.parse_term("segment([((u : Cart[Real, 2]), (v : Cart[Real, 2]))])")
  let t3209 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t3210 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t3211 = @tactics.map_every(fn(x3204 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3205 = @tactics.exists_tac(x3204)
    fn(x3206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3205(x3206)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t3210, t3209, t3208, t3207]))
  let t3203 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ a : _, ∀ b : _, ∀ c : _, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET((s : (_) -> Bool), t) && SUBSET(t, u) && IN(a, (ca : (_) -> Bool)) && IN(c, ca) && SUBSET(INTER((ab : (_) -> Bool), u), {a, b}) && SUBSET(INTER((bc : (_) -> Bool), u), {c}) && !IN(b, u) && INTER(s, ca) == {} → INTER(s, UNION(ab, UNION(bc, ca))) == {}")))
  let t3256 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@polytope.frontier_of_triangle()])), t3203), t3211), t3212), @tactics.conj_tac), t3255)
  let t3200 = @simp.rewrite_tac(@list.List([@topology.ends_in_segment()]))
  let t3199 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3201 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.subset(), @convex.closure_segment()])), t3199), t3200)
  let t3198 = @simp.simp_tac(@list.List([@topology.finite_imp_compact(), @sets.finite_insert(), @sets.finite_empty()]))
  let t3197 = @tactics.match_mp_tac(@convex.compact_convex_hull())
  let t3196 = @tactics.match_mp_tac(@topology.compact_imp_closed())
  let t3195 = @simp.asm_rewrite_tac(@list.List([]))
  let t3202 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.closure_minimal()), t3195), t3196), t3197), t3198), t3201])
  let t3257 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(closure(segment(((u : Cart[Real, 2]), (mx : Cart[Real, 2])))), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))"), fn(x3192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3193 = @tactics.mp_tac(x3192)
    fn(x3194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3193(x3194)
    }
  })), t3202), t3256, @tactics.all_tac])
  let t3191 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3190 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(SUBSET((s : (_) -> Bool), (c : (_) -> Bool)) → IN((u : _), c)) && INTER(s, (f : (_) -> Bool)) == {} && !(INTER(s, c) == {}) → (!(INTER(s, c) == {}) && !(DIFF(s, c) == {}) → !(INTER(s, f) == {})) → IN(u, c)")))
  let t3189 = @simp.rewrite_tac(@list.List([@topology.connected_segment()]))
  let t3187 = @term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")
  let t3188 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("segment(((u : Cart[Real, 2]), (mx : Cart[Real, 2])))"), t3187]), @topology.connected_inter_frontier()))
  let t3185 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem()]))
  let t3184 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path()))
  let t3183 = @simp.asm_rewrite_tac(@list.List([@sets.in_inter()]))
  let t3182 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())]))), t3182), t3183), t3184), t3185), @tactics.all_tac])
  let t3181 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t3180 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t3179 = @class.asm_cases_tac(@term_syntax.parse_term("(mx : Cart[Real, 2]) == (u : Cart[Real, 2])"))
  let t3178 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t3177 = @tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t3176 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t3175 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((u : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"))
  let t3174 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()])), @tactics.all_tac])
  let t3476 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((u : Cart[Real, 2]) == (a : Cart[Real, 2])) && !(u == (c : Cart[Real, 2]))"), @tactics.strip_assume_tac), t3174), t3175), t3176), @tactics.disch_tac), t3177), t3178), t3179), t3180), t3181), @tactics.conj_tac), t3186), t3188), t3189), t3190), t3191), t3257), t3258), t3275), t3276), @tactics.ants_tac), t3280), t3284), t3285), t3292), t3293), t3296), @tactics.strip_tac), t3300), t3301), t3302), t3303), t3304), t3305), t3306), t3307), t3310), t3311), t3329), t3330), t3344), t3345), t3369), t3370), t3384), t3385), t3405), t3406), t3417), t3421), t3422), t3423), @tactics.strip_tac), t3424), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3425), t3426), t3454), t3460), t3461), @tactics.conj_tac), t3463), t3464), t3465), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t3466), t3467), t3468), t3469), t3470), t3471), t3472), t3473), t3474), t3475), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3173 = @class.asm_cases_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (u : Cart[Real, 2]) - (b : Cart[Real, 2])) < dot(n, (c : Cart[Real, 2]) - b)"))
  let t3168 = @simp.asm_rewrite_tac(@list.List([]))
  let t3167 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t3166 = @simp.asm_rewrite_tac(@list.List([]))
  let t3165 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t3164 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t3169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x3161 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3162 = @tactics.exists_tac(x3161)
    fn(x3163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3162(x3163)
    }
  }, @list.List([@term_syntax.parse_term("(v : Cart[Real, 2])"), t3164])), t3165), t3166), t3167), t3168)
  let t3160 = @simp.asm_rewrite_tac(@list.List([]))
  let t3159 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t3158 = @simp.asm_rewrite_tac(@list.List([]))
  let t3157 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t3170 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x3154 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3155 = @tactics.exists_tac(x3154)
    fn(x3156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3155(x3156)
    }
  }, @list.List([@term_syntax.parse_term("(u : Cart[Real, 2])"), t3157])), t3158), t3159), t3160)
  let t3153 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_lneg(), @real.real_lt_neg2()]))
  let t3152 = @tactics.match_mp_tac(@real.real_convex_bound_lt())
  let t3151 = @simp.rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t3150 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_lneg())]))
  let t3149 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) < -(m : Real) → !(x == m)")))
  let t3148 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (x : Cart[Real, N])) + op_pct(u, (y : Cart[Real, N])) - (a : Cart[Real, N]) == op_pct(real_of_num(1) - u, x - a) + op_pct(u, y - a)"))]))
  let t3147 = @simp.asm_rewrite_tac(@list.List([]))
  let t3146 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t3145 = @tactics.undisch_tac(@term_syntax.parse_term("IN((mx : Cart[Real, 2]), segment([((u : Cart[Real, 2]), (v : Cart[Real, 2]))]))"))
  let t3144 = @tactics.undisch_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (mx : Cart[Real, 2]) - (b : Cart[Real, 2])) == (m : Real)"))
  let t3143 = @equal.gsym(@class.de_morgan_thm())
  let t3171 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt()), t3143])), @tactics.strip_tac), t3144), t3145), t3146), @tactics.strip_tac), t3147), t3148), t3149), t3150), t3151), t3152), t3153), @calc_rat.asm_real_arith_tac), t3170, t3169])
  let t3142 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (u : Cart[Real, 2]) - (b : Cart[Real, 2])) <= (m : Real) || dot(n, (v : Cart[Real, 2]) - b) <= m"), @tactics.strip_assume_tac)
  let t3141 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.last(), @lists.hd()]))
  let t3140 = @simp.asm_rewrite_tac(@list.List([pathstart_polygonal_path(), pathfinish_polygonal_path()]))
  let t3138 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t3139 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 2])"), t3138]))
  let t3137 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3135 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3136 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("(3 <= SUC((n : Num))) == (2 <= n)"))])), t3135), @tactics.all_tac])
  let t3134 = @term_syntax.parse_term("(mx : Cart[Real, 2])")
  let t3172 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))"), t3134]), path_image_polygonal_path_subset_segments())), @tactics.ants_tac), t3136), t3137), t3139), t3140), t3141), @tactics.strip_tac), t3142), t3171), @tactics.all_tac])
  let t3133 = @tactics.subgoal_then(@term_syntax.parse_term("∃ u : Cart[Real, 2], ∃ v : Cart[Real, 2], MEM(u, CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))) && MEM(v, CONS(c, p)) && IN((mx : Cart[Real, 2]), segment([(u, v)])) && SUBSET(segment([(u, v)]), path_image(polygonal_path(CONS(c, p)))) && !(IN((a : Cart[Real, 2]), segment([(u, v)])) && IN(c, segment([(u, v)]))) && dot((n : Cart[Real, 2]), u - (b : Cart[Real, 2])) <= (m : Real)"), @tactics.strip_assume_tac)
  let t3129 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3128 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t3127 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t3126 = @simp.rewrite_tac(@list.List([@topology.connected_segment()]))
  let t3125 = @simp.asm_rewrite_tac(@list.List([]))
  let t3124 = @tactics.exists_tac(@term_syntax.parse_term("segment(((b : Cart[Real, 2]), (z : Cart[Real, 2])))"))
  let t3130 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t3124), t3125), t3126), t3127), t3128), t3129)
  let t3120 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_set_of_list(), @sets.in_elim_thm()]))
  let t3119 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.in_elim_thm()]))
  let t3118 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) >= (b : Real) + (e : Real)) == (e <= x - b)"))]))
  let t3117 = @simp.simp_tac(@list.List([@misc.subset_hull(), @convex.convex_halfspace_component_ge()]))
  let t3116 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((e : Real) <= (x : Real) - (b : Real)) == (x >= b + e)"))]))
  let t3115 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), {(x : _) | (P : (_) -> Bool)(x)}) → SUBSET((s : (_) -> Bool), t) → (∀ x : _, IN(x, s) → P(x))")))
  let t3114 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t3113 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))"), path_image_polygonal_path_subset_convex_hull()))
  let t3112 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_elim_thm(), @realarith.real_not_lt(), @sets.in_univ()]))
  let t3111 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == SUBSET(s, DIFF(UNIV, t))"))]))
  let t3110 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t3109 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, 2]) | op_dollar(x, 2) - op_dollar((b : Cart[Real, 2]), 2) < (e : Real)}"))
  let t3121 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET((s : (_) -> Bool), t) && INTER((u : (_) -> Bool), t) == {} → INTER(s, u) == {}"))), t3109), @tactics.conj_tac), t3110), t3111), t3112), t3113), t3114), t3115), t3116), t3117), t3118), t3119), t3120)
  let t3108 = @simp.rewrite_tac(@list.List([@topology.interior_subset(), @topology.closure_subset()]))
  let t3107 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t3106 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ s : (_) -> Bool, SUBSET((i : (_) -> Bool), s) && SUBSET(s, (c : (_) -> Bool)) → DIFF(c, i) == UNION((a : (_) -> Bool), UNION((b : (_) -> Bool), (d : (_) -> Bool))) → INTER(i, b) == {}")))
  let t3105 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @topology.frontier()]))
  let t3102 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t3103 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t3104 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t3103, t3102]), @polytope.frontier_of_triangle()))
  let t3101 = @simp.asm_simp_tac(@list.List([@topology.subset_interior()]))
  let t3100 = @tactics.exists_tac(@term_syntax.parse_term("interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))"))
  let t3122 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET((s : (_) -> Bool), t) && INTER(t, (u : (_) -> Bool)) == {} → INTER(s, u) == {}"))), t3100), t3101), t3104), t3105), t3106), t3107), t3108)
  let t3099 = @simp.rewrite_tac(@list.List([@topology.interior_subset(), @topology.closure_subset()]))
  let t3098 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t3097 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ s : (_) -> Bool, SUBSET((i : (_) -> Bool), s) && SUBSET(s, (c : (_) -> Bool)) → DIFF(c, i) == UNION((a : (_) -> Bool), (b : (_) -> Bool)) → INTER(i, a) == {}")))
  let t3096 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @topology.frontier()]))
  let t3093 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t3094 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t3095 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t3094, t3093]), @polytope.frontier_of_triangle()))
  let t3092 = @simp.asm_simp_tac(@list.List([@topology.subset_interior()]))
  let t3091 = @tactics.exists_tac(@term_syntax.parse_term("interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))"))
  let t3123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET((s : (_) -> Bool), t) && INTER(t, (u : (_) -> Bool)) == {} → INTER(s, u) == {}"))), t3091), t3092), t3095), t3096), t3097), t3098), t3099), t3122, t3121])
  let t3090 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3089 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), DIFF(UNIV, UNION((a : (_) -> Bool), UNION((b : (_) -> Bool), (c : (_) -> Bool))))) == (INTER(s, a) == {} && INTER(s, b) == {} && INTER(s, c) == {})"))]))
  let t3088 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t3087 = @simp.simp_tac(@list.List([@convex.convex_connected(), @convex.convex_interior(), @convex.convex_convex_hull()]))
  let t3086 = @simp.asm_rewrite_tac(@list.List([]))
  let t3085 = @tactics.exists_tac(@term_syntax.parse_term("interior(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}))"))
  let t3131 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_component()])), t3085), t3086), t3087), t3088), t3089), t3090), t3123), t3130])
  let t3084 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t3083 = @tactics.match_mp_tac(@topology.connected_component_trans())
  let t3079 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3078 = @tactics.match_mp_tac(@real.real_lt_div())
  let t3077 = @tactics.match_mp_tac(@realarith.real_lt_imp_le())
  let t3076 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(min(real_of_num(1) / real_of_num(2), x)) <= x")))
  let t3075 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3074 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul()]))
  let t3073 = @simp.simp_tac(@list.List([@vectors.component_le_norm(), @cart.dimindex_2(), @calc_num.arith()]))
  let t3072 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs(op_dollar((x : Cart[Real, _]), 2)) <= norm(x) && norm(x) <= (e : Real) / real_of_num(2) && real_of_num(0) < e → op_dollar(x, 2) < e")))
  let t3080 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @real.real_add_sub()])), t3072), t3073), t3074), t3075), t3076), t3077), t3078), t3079)
  let t3071 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @real.real_lt_div(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t3070 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3069 = @simp.rewrite_tac(@list.List([@real.real_lt_min()]))
  let t3068 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3081 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((z : Cart[Real, 2]) - (b : Cart[Real, 2])))")), t3068), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac, @vectors.vector_arith_tac])), t3069), t3070), t3071), t3080])
  let t3067 = @tactics.exists_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) + op_pct(min(real_of_num(1) / real_of_num(2), (e : Real) / real_of_num(2) / norm((z : Cart[Real, 2]) - b)), z - b)"))
  let t3066 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment()]))
  let t3065 = @simp.asm_rewrite_tac(@list.List([]))
  let t3064 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∃ y : _, IN(y, (s : (_) -> Bool)) && (P : (_) -> Bool)(y)) && SUBSET(s, (t : (_) -> Bool)) → (∃ y : _, IN(y, s) && IN(y, t) && P(y))")))
  let t3063 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3082 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.inter(), @equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("INTER(interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})), {(x : Cart[Real, 2]) | op_dollar(x, 2) - op_dollar(b, 2) < (e : Real)}) == interior(hull(convex, {(a' : Cart[Real, 2]), b, (c' : Cart[Real, 2])}))")))])), t3063), t3064), t3065), t3066), t3067), @tactics.conj_tac), t3081), @tactics.all_tac])
  let t3062 = @tactics.subgoal_then(@term_syntax.parse_term("∃ y : Cart[Real, 2], IN(y, segment(((b : Cart[Real, 2]), (z : Cart[Real, 2])))) && IN(y, interior(hull(convex, {(a' : Cart[Real, 2]), b, (c' : Cart[Real, 2])})))"), @tactics.strip_assume_tac)
  let t3060 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t3059 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path()))
  let t3058 = @simp.simp_tac(@list.List([@sets.in_inter(), @sets.in_insert(), @misc.hull_inc()]))
  let t3057 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3056 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @realarith.real_sub_lt()]))
  let t3055 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (m : Real) * (real_of_num(1) - (t : Real)) && m <= (x : Real) → !((real_of_num(1) - (s : Real)) * x + s * x == t * m)")))
  let t3054 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t3053 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_sub_refl(), @vectors.vector_add_lid(), @vectors.vector_mul_rzero()]))
  let t3052 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (c : Cart[Real, 2])) + op_pct(u, (a : Cart[Real, 2])) - (b : Cart[Real, 2]) == op_pct(real_of_num(1) - u, c - b) + op_pct(u, a - b)"))]))
  let t3048 = @term_syntax.parse_term("(x : Cart[Real, 2]) => dot((n : Cart[Real, 2]), x - (b : Cart[Real, 2]))")
  let t3051 = @tactics.disch_then(fn(x3050 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3046 = @tactics.mp_tac(x3045)
      fn(x3047 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3046(x3047)
      }
    })(((x3049 : @kernel.Thm) => @equal.ap_term(t3048, x3049))(x3050))
  })
  let t3044 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x3038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3039 = @tactics.assume_tac(x3038)
    fn(x3040 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3039(x3040)
    }
  }, fn(x3041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3042 = @tactics.mp_tac(x3041)
    fn(x3043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3042(x3043)
    }
  })))
  let t3037 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t3036 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t3035 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Real)"))(@tactics.strip_assume_tac))
  let t3034 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.conjuncts_then2(fn(x3025 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3026 = @tactics.assume_tac(x3025)
    fn(x3027 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3026(x3027)
    }
  }, fn(x3028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3029 = @tactics.mp_tac(x3028)
    fn(x3030 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3029(x3030)
    }
  }), fn(x3031 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3032 = @tactics.mp_tac(x3031)
    fn(x3033 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3032(x3033)
    }
  }))
  let t3024 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t3023 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"))
  let t3022 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t3021 = @simp.asm_rewrite_tac(@list.List([]))
  let t3020 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (a : (_) -> Bool)) == {} && INTER(s, (b : (_) -> Bool)) == {} && INTER(s, (c : (_) -> Bool)) == {} && SUBSET(s, (u : (_) -> Bool)) → SUBSET(s, DIFF(u, UNION(a, UNION(b, c))))")))
  let t3019 = @simp.rewrite_tac(@list.List([@polytope.frontier_of_triangle()]))
  let t3017 = @simp.rewrite_tac(@list.List([@topology.closure_subset()]))
  let t3016 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (u : (_) -> Bool)) → SUBSET(DIFF(s, DIFF(u, (t : (_) -> Bool))), t)")))
  let t3018 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.frontier()])), t3016), t3017)])
  let t3015 = @tactics.exists_tac(@term_syntax.parse_term("DIFF(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}), frontier(hull(convex, {a, b, c})))"))
  let t3061 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t3015), @tactics.conj_tac), t3018), t3019), t3020), t3021), t3022), t3023), t3024), t3034), t3035), t3036), t3037), t3044), t3051), t3052), t3053), t3054), t3055), t3056), t3057), t3058), t3059), t3060), @tactics.all_tac])
  let t3014 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))), interior(hull(convex, {(a : Cart[Real, 2]), b, (c : Cart[Real, 2])})))"), fn(x3011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3012 = @tactics.assume_tac(x3011)
    fn(x3013 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3012(x3013)
    }
  })
  let t3009 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t3008 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t3007 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((t : Real) * (m : Real) < m) == (real_of_num(0) < m * (real_of_num(1) - t))"))]))
  let t3006 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rmul(), @vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (t : Real), (a : Cart[Real, N])) + op_pct(t, (b : Cart[Real, N])) - a == op_pct(t, b - a)"))]))
  let t3005 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(@tactics.strip_assume_tac))
  let t3004 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2998 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2999 = @tactics.assume_tac(x2998)
    fn(x3000 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2999(x3000)
    }
  }, fn(x3001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3002 = @tactics.mp_tac(x3001)
    fn(x3003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3002(x3003)
    }
  }))
  let t2997 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t2996 = @tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))))"))
  let t2995 = @simp.rewrite_tac(@list.List([@real.real_not_le()]))
  let t2993 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2994 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2993), @tactics.all_tac])
  let t2992 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Real) <= dot((n : Cart[Real, 2]), (v : Cart[Real, 2]) - (b : Cart[Real, 2]))"), fn(x2989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2990 = @tactics.mp_tac(x2989)
    fn(x2991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2990(x2991)
    }
  })
  let t2988 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"))
  let t3010 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()])), t2988), @tactics.strip_tac), t2992), t2994), t2995), t2996), t2997), t3004), t3005), t3006), t3007), t3008), t3009), @tactics.all_tac])
  let t2987 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))), path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))) == {}"), fn(x2984 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2985 = @tactics.assume_tac(x2984)
    fn(x2986 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2985(x2986)
    }
  })
  let t2982 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2983 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.open_segment()])), t2982), @tactics.all_tac])
  let t2981 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))), hull(convex, {(a : Cart[Real, 2]), b, (c : Cart[Real, 2])}))"), fn(x2978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2979 = @tactics.assume_tac(x2978)
    fn(x2980 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2979(x2980)
    }
  })
  let t2976 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2975 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t2974 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull(), @sets.insert_subset(), @sets.empty_subset()]))
  let t2973 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2977 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.segment_convex_hull()])), t2973), t2974), t2975), t2976), @tactics.all_tac])
  let t2972 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(segment([((b : Cart[Real, 2]), (z : Cart[Real, 2]))]), hull(convex, {(a : Cart[Real, 2]), b, (c : Cart[Real, 2])}))"), fn(x2969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2970 = @tactics.assume_tac(x2969)
    fn(x2971 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2970(x2971)
    }
  })
  let t2967 = @simp.simp_tac(@list.List([]))
  let t2966 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t2963 = @drule.match_mp(@vectors.between_imp_collinear())
  let t2965 = @tactics.disch_then(@tactics.conjuncts_then(fn(x2964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2961 = @tactics.mp_tac(x2960)
      fn(x2962 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2961(x2962)
      }
    })(t2963(x2964))
  }))
  let t2959 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.between_in_segment())]))
  let t2958 = @simp.once_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t2956 = @tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]))"))
  let t2957 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]))")), t2956])
  let t2955 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @theorems.imp_conj()]))
  let t2954 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2953 = @tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))))"))
  let t2952 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"))
  let t2951 = @tactics.match_mp_tac(@vectors.collinear_3_trans())
  let t2950 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {b, a, c}"))]))
  let t2949 = @simp.rewrite_tac(@list.List([]))
  let t2947 = @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(b : Cart[Real, 2]), (c : Cart[Real, 2]), (z : Cart[Real, 2])})"))
  let t2948 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(b : Cart[Real, 2]), (a : Cart[Real, 2]), (z : Cart[Real, 2])})")), t2947])
  let t2946 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[Real, 2])"))
  let t2968 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()])), @tactics.conj_tac), t2946), @tactics.strip_tac), t2948), t2949), t2950), t2951), t2952), t2953), t2954), t2955), t2957), t2958), t2959), t2965), t2966), t2967), @tactics.all_tac])
  let t2945 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment(((b : Cart[Real, 2]), (z : Cart[Real, 2]))), segment([((a : Cart[Real, 2]), b)])) == {} && INTER(segment((b, z)), segment([(b, (c : Cart[Real, 2]))])) == {}"), @tactics.strip_assume_tac)
  let t2943 = @simp.asm_rewrite_tac(@list.List([]))
  let t2942 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t2941 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull())]))
  let t2940 = @simp.asm_simp_tac(@list.List([@equal.gsym(@convex.affine_independent_convex_affine_hull()), @sets.insert_subset(), @sets.empty_subset(), @sets.in_insert()]))
  let t2939 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2938 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"))
  let t2937 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ c : (_) -> Bool, IN((x : _), c) && !IN(x, INTER((a : (_) -> Bool), c)) && !IN(x, INTER((b : (_) -> Bool), c)) → !IN(x, a) && !IN(x, b)")))
  let t2944 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.collinear_3_affine_hull()])), t2937), t2938), @tactics.conj_tac), t2939), t2940), t2941), t2942), t2943), @tactics.all_tac])
  let t2936 = @tactics.subgoal_then(@term_syntax.parse_term("!collinear({(b : Cart[Real, 2]), (a : Cart[Real, 2]), (z : Cart[Real, 2])}) && !collinear({b, (c : Cart[Real, 2]), z})"), @tactics.strip_assume_tac)
  let t2935 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2934 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Cart[Real, 2]), segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])) && !IN(z, segment([(b, (c : Cart[Real, 2]))]))"), @tactics.strip_assume_tac)
  let t2932 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem()]))
  let t2933 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(vertices_in_path_image_polygonal_path()))), t2932), @tactics.all_tac])
  let t2931 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Cart[Real, 2]), path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))) && IN(z, path_image(polygonal_path(p)))"), @tactics.strip_assume_tac)
  let t2930 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2929 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == (a : Cart[Real, 2])) && !(z == (c : Cart[Real, 2]))"), @tactics.strip_assume_tac)
  let t2928 = @simp.asm_rewrite_tac(@list.List([]))
  let t2927 = @tactics.exists_tac(@term_syntax.parse_term("(d : Cart[Real, 2])"))
  let t2926 = @tactics.match_mp_tac(@paths.inside_same_component())
  let t2925 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t2924 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()])), @tactics.disch_tac])
  let t2923 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t2922 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t2921 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3132 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2918 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2919 = @tactics.exists_tac(x2918)
    fn(x2920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2919(x2920)
    }
  }, @list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t2921])), t2922), t2923), @tactics.conj_tac), t2924), t2925), @tactics.disch_tac), t2926), t2927), t2928), t2929), t2930), t2931), t2933), t2934), t2935), t2936), t2944), t2945), t2968), t2972), t2977), t2981), t2983), t2987), t3010), t3014), t3061), t3062), t3082), t3083), t3084), @tactics.conj_tac), t3131)])
  let t2917 = @tactics.subgoal_then(@term_syntax.parse_term("∃ z : Cart[Real, 2], MEM(z, (p : List[Cart[Real, 2]])) && IN(z, DIFF(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}), {a, c})) && dot((n : Cart[Real, 2]), z - b) == (m : Real)"), @tactics.strip_assume_tac)
  let t2915 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2914 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @topology.ends_in_segment()]))
  let t2910 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2913 = @tactics.disch_then(fn(x2912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2908 = @tactics.mp_tac(x2907)
      fn(x2909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2908(x2909)
      }
    })(((x2911 : @kernel.Thm) => @bool.spec(t2910, x2911))(x2912))
  })
  let t2906 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter()]))
  let t2905 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(INTER(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), path_image(polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))), {c})"))
  let t2903 = @tactics.disch_then(fn(x2900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2901 = @tactics.subst_all_tac(x2900)
    fn(x2902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2901(x2902)
    }
  })
  let t2904 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t2903])
  let t2899 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2916 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("m"), t2899), @tactics.conj_tac), t2904), t2905), t2906), t2913), t2914), t2915), @tactics.all_tac])
  let t2898 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (m : Real)"), fn(x2895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2896 = @tactics.assume_tac(x2895)
    fn(x2897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2896(x2897)
    }
  })
  let t2894 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Real) == dot((n : Cart[Real, 2]), (mx : Cart[Real, 2]) - (b : Cart[Real, 2]))"))
  let t2892 = @tactics.first_x_assum(@tactics.choose_then(fn(x2891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t2888 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2889 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2888)
  let t2887 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2886 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2890 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2886), t2887), t2889])
  let t2885 = @tactics.exists_tac(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (mx : Cart[Real, 2]) - (b : Cart[Real, 2]))"))
  let t2884 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2883 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t2882 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2881 = @simp.asm_rewrite_tac(@list.List([]))
  let t2880 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2879 = @tactics.x_gen_tac(@term_syntax.parse_term("(my : Cart[Real, 2])"))
  let t2878 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2877 = @simp.rewrite_tac(@list.List([@sets.subset(), @class.not_forall_thm(), @class.not_imp(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2876 = @tactics.undisch_tac(@term_syntax.parse_term("!SUBSET(INTER(path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), c})), {a, c})"))
  let t2874 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()]))
  let t2875 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(mx : Cart[Real, 2])")), t2874), @tactics.all_tac])
  let t2873 = @simp.gen_rewrite_tac(fn(x2870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2871 = @equal.land_conv(x2870)
    fn(x2872 : @kernel.Term) -> @kernel.Thm raise {
      s2871(x2872)
    }
  }, @list.List([@realarith.real_le_lt()]))
  let t2869 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2868 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (mx : Cart[Real, 2]) - (b : Cart[Real, 2])) <= dot(n, (c : Cart[Real, 2]) - b)"), fn(x2865 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2866 = @tactics.mp_tac(x2865)
    fn(x2867 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2866(x2867)
    }
  })
  let t2893 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(mx : Cart[Real, 2])"))(@tactics.strip_assume_tac)), t2868), t2869), t2873), @tactics.strip_tac), t2875), t2876), t2877), t2878), t2879), t2880), @tactics.strip_tac), t2881), t2882), t2883), @tactics.strip_tac), t2884), t2885), @tactics.conj_tac), t2890), t2892])
  let t2864 = @tactics.subgoal_then(@term_syntax.parse_term("∃ mx : Cart[Real, 2], !(mx == (a : Cart[Real, 2])) && !(mx == (c : Cart[Real, 2])) && IN(mx, INTER(path_image(polygonal_path(CONS(c, (p : List[Cart[Real, 2]])))), hull(convex, {a, (b : Cart[Real, 2]), c}))) && (∀ y : Cart[Real, 2], IN(y, INTER(path_image(polygonal_path(CONS(c, p))), hull(convex, {a, b, c}))) → dot((n : Cart[Real, 2]), mx - b) <= dot(n, y - b))"), @tactics.strip_assume_tac)
  let t2859 = @simp.simp_tac(@list.List([@topology.continuous_on_sub(), @topology.continuous_on_const(), @topology.continuous_on_id()]))
  let t2858 = @simp.rewrite_tac(@list.List([@topology.continuous_on_lift_dot()]))
  let t2857 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t2856 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t2855 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2860 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, 2]) => dot((n : Cart[Real, 2]), x - (b : Cart[Real, 2]))) == o((x : Cart[Real, 2]) => dot(n, x), (x : Cart[Real, 2]) => x - b)"), fn(x2852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2853 = @tactics.subst1_tac(x2852)
    fn(x2854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2853(x2854)
    }
  }), t2855), t2856), t2857), t2858), t2859)
  let t2861 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2851 = @simp.simp_tac(@list.List([@convex.compact_convex_hull(), @topology.finite_imp_compact(), @sets.finite_insert(), @sets.finite_empty()]))
  let t2850 = @simp.simp_tac(@list.List([@paths.compact_path_image(), path_polygonal_path()]))
  let t2862 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.compact_inter()), t2850), t2851), t2861, t2860])
  let t2863 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t2862), @tactics.all_tac])
  let t2849 = @simp.rewrite_tac(@list.List([]))
  let t2847 = @term_syntax.parse_term("INTER(path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), c}))")
  let t2848 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, 2]) => dot((n : Cart[Real, 2]), x - (b : Cart[Real, 2]))"), t2847]), @topology.continuous_attains_inf()))
  let t2845 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le()]))
  let t2844 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul(), @calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real) - (v : Real)) * (x : Real) + v * x <= x) == (real_of_num(0) <= u * x)"))]))
  let t2843 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) + (op_pct((u : Real), (b : Cart[Real, 2]) - a) + op_pct((v : Real), (c : Cart[Real, 2]) - a)) - b == op_pct(real_of_num(1) - u - v, a - b) + op_pct(v, c - b)"))]))
  let t2846 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex_hull_3_alt(), @sets.forall_in_gspec()])), t2843), t2844), t2845), @tactics.all_tac])
  let t2842 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) → dot((n : Cart[Real, 2]), y - b) <= dot(n, c - b)"), fn(x2839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2840 = @tactics.assume_tac(x2839)
    fn(x2841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2840(x2841)
    }
  })
  let t2837 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t2836 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_sub_refl(), @vectors.dot_rzero(), @realax.real_le_refl()]))
  let t2838 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (b : Cart[Real, 2])"))), t2836), t2837), @tactics.all_tac])
  let t2835 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) → real_of_num(0) <= dot((n : Cart[Real, 2]), y - b)"), fn(x2832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2833 = @tactics.assume_tac(x2832)
    fn(x2834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2833(x2834)
    }
  })
  let t2830 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl(), @realarith.real_sub_lt()]))
  let t2829 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Cart[Real, 2]) + (op_pct((r : Real), (b : Cart[Real, 2]) - a) + op_pct((s : Real), (c : Cart[Real, 2]) - a)) == b)"))
  let t2828 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Real) == real_of_num(1) && (s : Real) == real_of_num(0)"))
  let t2827 = @simp.asm_rewrite_tac(@list.List([]))
  let t2826 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t2825 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real) - (v : Real)) * (x : Real) + v * x == (real_of_num(1) - u) * x"))]))
  let t2824 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2822 = @term_syntax.parse_term("(s : Real)")
  let t2823 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Real)"), t2822]))
  let t2821 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t2820 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) + (op_pct((u : Real), (b : Cart[Real, 2]) - a) + op_pct((v : Real), (c : Cart[Real, 2]) - a)) - b == op_pct(real_of_num(1) - u - v, a - b) + op_pct(v, c - b)"))]))
  let t2831 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex_hull_3_alt(), @sets.forall_in_gspec(), @theorems.imp_conj()])), t2820), t2821), t2823), t2824), t2825), t2826), t2827), t2828), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t2829), t2830), @vectors.vector_arith_tac), @tactics.all_tac])
  let t2819 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})) && !(y == b) → real_of_num(0) < dot((n : Cart[Real, 2]), y - b)"), fn(x2816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2817 = @tactics.assume_tac(x2816)
    fn(x2818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2817(x2818)
    }
  })
  let t2813 = @equal.gsym(@vectors.orthogonal())
  let t2814 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dot_rsub()), t2813]))
  let t2812 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real)) == (y - x == real_of_num(0))"))]))
  let t2815 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dot_rsub(), @realax.real_sub(), @calc_int.real_eq_add_rcancel()])), t2812), t2814), @tactics.all_tac])
  let t2811 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 2]), (a : Cart[Real, 2]) - (b : Cart[Real, 2])) == dot(n, (c : Cart[Real, 2]) - b)"), fn(x2808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2809 = @tactics.assume_tac(x2808)
    fn(x2810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2809(x2810)
    }
  })
  let t2803 = @simp.asm_rewrite_tac(@list.List([@vectors.orthogonal()]))
  let t2802 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_sub()]))
  let t2801 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.orthogonal_rneg())]))
  let t2800 = @tactics.exists_tac(@term_syntax.parse_term("(n : Cart[Real, 2])"))
  let t2799 = @tactics.match_mp_tac(@vectors.orthogonal_to_orthogonal_2d())
  let t2798 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t2797 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) → !p → (q : Bool)")))
  let t2796 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {a, c, b}"))]))
  let t2804 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")), t2796), t2797), t2798), t2799), t2800), t2801), t2802), t2803)
  let t2795 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_eq_0(), @vectors.orthogonal_lneg()]))
  let t2794 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_lneg()]))
  let t2805 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("-(n : Cart[Real, 2])")), t2794), t2795)
  let t2793 = @simp.asm_rewrite_tac(@list.List([]))
  let t2806 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Cart[Real, 2])")), t2793), t2805, t2804])
  let t2791 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < dot((n : Cart[Real, 2]), (c : Cart[Real, 2]) - (b : Cart[Real, 2])) || real_of_num(0) < -dot(n, c - b) || dot(n, c - b) == real_of_num(0)"))
  let t2792 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x2788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2789 = @tactics.assume_tac(x2788)
    fn(x2790 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2789(x2790)
    }
  })(t2791)
  let t2786 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @arith.le_refl()]))
  let t2785 = @tactics.match_mp_tac(@vectors.orthogonal_to_vector_exists())
  let t2787 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@vectors.orthogonal_sym()])), t2785), t2786), @tactics.all_tac])
  let t2807 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ n : Cart[Real, 2], !(n == vec(0)) && orthogonal(n, (c : Cart[Real, 2]) - (a : Cart[Real, 2]))"), @tactics.strip_assume_tac), t2787), t2792), t2806), @tactics.all_tac])
  let t2784 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Cart[Real, 2], !(n == vec(0)) && orthogonal(n, (c : Cart[Real, 2]) - (a : Cart[Real, 2])) && real_of_num(0) < dot(n, c - (b : Cart[Real, 2]))"), @tactics.strip_assume_tac)
  let t2777 = @sets.set_tac(@list.List([]))
  let t2776 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Cart[Real, 2]), (c : Cart[Real, 2])}"))
  let t2775 = @simp.asm_simp_tac(@list.List([@polytope.face_of_convex_hull_affine_independent()]))
  let t2774 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) → p == ((q : Bool) && (r : Bool) && (s : Bool)) → r")))
  let t2773 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2772 = @term_syntax.parse_term("hull(convex, {(b : Cart[Real, 2]), (c : Cart[Real, 2])})")
  let t2778 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"), t2772]), @polytope.face_of_stillconvex())), t2773), t2774), t2775), t2776), t2777)
  let t2771 = @sets.set_tac(@list.List([]))
  let t2770 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2])}"))
  let t2769 = @simp.asm_simp_tac(@list.List([@polytope.face_of_convex_hull_affine_independent()]))
  let t2768 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) → p == ((q : Bool) && (r : Bool) && (s : Bool)) → r")))
  let t2767 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2766 = @term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2])})")
  let t2779 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"), t2766]), @polytope.face_of_stillconvex())), t2767), t2768), t2769), t2770), t2771), t2778])
  let t2765 = @tactics.match_mp_tac(@convex.convex_inter())
  let t2780 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DIFF((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == INTER(DIFF(s, t), DIFF(s, u))"))])), t2765), @tactics.conj_tac), t2779)
  let t2761 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @theorems.imp_imp()]))
  let t2758 = @drule.match_mp(@vectors.between_imp_collinear())
  let t2760 = @tactics.disch_then(@tactics.conjuncts_then(fn(x2759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2756 = @tactics.mp_tac(x2755)
      fn(x2757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2756(x2757)
      }
    })(t2758(x2759))
  }))
  let t2754 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@topology.between_in_segment())]))
  let t2753 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2751 = @tactics.mp_tac(x2750)
    fn(x2752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2751(x2752)
    }
  }, @tactics.strip_assume_tac))
  let t2749 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2748 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @equal.gsym(@convex.segment_convex_hull()), @sets.in_diff()]))
  let t2746 = @term_syntax.parse_term("IN((y : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (c : Cart[Real, 2]))))")
  let t2747 = @tactics.map_every(fn(x2743 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2744 = @tactics.undisch_tac(x2743)
    fn(x2745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2744(x2745)
    }
  }, @list.List([@term_syntax.parse_term("IN((y : Cart[Real, 2]), hull(convex, {(b : Cart[Real, 2]), (c : Cart[Real, 2])}))"), t2746]))
  let t2742 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2741 = @tactics.match_mp_tac(@vectors.collinear_3_trans())
  let t2740 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {b, c, a}"))]))
  let t2739 = @simp.rewrite_tac(@list.List([]))
  let t2762 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")), t2739), t2740), t2741), t2742), t2747), t2748), t2749), t2753), t2754), t2760), t2761)
  let t2738 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @theorems.imp_imp()]))
  let t2735 = @drule.match_mp(@vectors.between_imp_collinear())
  let t2737 = @tactics.disch_then(@tactics.conjuncts_then(fn(x2736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2732 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2733 = @tactics.mp_tac(x2732)
      fn(x2734 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2733(x2734)
      }
    })(t2735(x2736))
  }))
  let t2731 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@topology.between_in_segment())]))
  let t2730 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2728 = @tactics.mp_tac(x2727)
    fn(x2729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2728(x2729)
    }
  }, @tactics.strip_assume_tac))
  let t2726 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2725 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @equal.gsym(@convex.segment_convex_hull()), @sets.in_diff()]))
  let t2723 = @term_syntax.parse_term("IN((y : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (c : Cart[Real, 2]))))")
  let t2724 = @tactics.map_every(fn(x2720 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2721 = @tactics.undisch_tac(x2720)
    fn(x2722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2721(x2722)
    }
  }, @list.List([@term_syntax.parse_term("IN((y : Cart[Real, 2]), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2])}))"), t2723]))
  let t2719 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2718 = @tactics.match_mp_tac(@vectors.collinear_3_trans())
  let t2717 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {b, a, c}"))]))
  let t2716 = @simp.rewrite_tac(@list.List([]))
  let t2763 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")), t2716), t2717), t2718), t2719), t2724), t2725), t2726), t2730), t2731), t2737), t2738)
  let t2715 = @sets.set_tac(@list.List([]))
  let t2714 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2713 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → IN((x : _), s) && (P : (_) -> Bool)(x) → IN(x, t)")))
  let t2712 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @convex.segment_convex_hull()]))
  let t2764 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), segment(((a : Cart[Real, 2]), (c : Cart[Real, 2]))))")), t2712), t2713), t2714), t2715), t2763, t2762])
  let t2711 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2781 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_union()])), t2711), t2764)
  let t2708 = @sets.set_tac(@list.List([]))
  let t2709 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@polytope.frontier_of_triangle(), @convex.segment_convex_hull()])), t2708)
  let t2710 = @list.List([@simp.asm_rewrite_tac(@list.List([@topology.frontier(), @sets.in_diff()])), t2709])
  let t2707 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((d : Cart[Real, 2]), frontier(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))"), fn(x2704 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2705 = @tactics.mp_tac(x2704)
    fn(x2706 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2705(x2706)
    }
  })
  let t2703 = @list.List([@meson.asm_meson_tac(@list.List([@topology.interior_subset(), @sets.subset()])), @tactics.all_tac])
  let t2782 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_diff()])), @tactics.conj_tac), t2703), t2707), t2710), t2781, t2780])
  let t2702 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2701 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t2700 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2699 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2697 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_union(), @topology.ends_in_segment()]))
  let t2694 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((t : (_) -> Bool), (s : (_) -> Bool)), (c : (_) -> Bool)) → SUBSET(c, UNION((a : (_) -> Bool), (b : (_) -> Bool))) → SUBSET(DIFF(s, UNION(a, b)), DIFF(UNIV, UNION(a, UNION(b, t))))")))
  let t2696 = @tactics.first_x_assum(fn(x2695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2694(x2695))
  })
  let t2693 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t2698 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_join(), @paths.pathfinish_linepath(), @paths.pathstart_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()])), t2693), t2696), t2697)])
  let t2692 = @tactics.exists_tac(@term_syntax.parse_term("DIFF(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}), UNION(segment([(a, b)]), segment([(b, c)])))"))
  let t2691 = @tactics.match_mp_tac(@sets.subset_trans())
  let t2690 = @simp.rewrite_tac(@list.List([@topology.connected_segment(), @topology.ends_in_segment()]))
  let t2689 = @tactics.exists_tac(@term_syntax.parse_term("segment([((d : Cart[Real, 2]), (y : Cart[Real, 2]))])"))
  let t2688 = @simp.rewrite_tac(@list.List([@topology.connected_component()]))
  let t2687 = @simp.asm_rewrite_tac(@list.List([]))
  let t2686 = @tactics.exists_tac(@term_syntax.parse_term("(d : Cart[Real, 2])"))
  let t2685 = @tactics.match_mp_tac(@paths.inside_same_component())
  let t2684 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2683 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t2682 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t2783 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2679 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2680 = @tactics.exists_tac(x2679)
    fn(x2681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2680(x2681)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2682])), t2683), t2684), @tactics.disch_tac), t2685), t2686), t2687), t2688), t2689), t2690), t2691), t2692), @tactics.conj_tac), t2698), t2699), t2700), t2701), t2702), t2782), @tactics.all_tac])
  let t2678 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET(INTER(path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), c})), {a, c})"))
  let t2677 = @list.List([@meson.asm_meson_tac(@list.List([@convex.affine_dependent_imp_collinear_3()])), @tactics.all_tac])
  let t2676 = @tactics.subgoal_then(@term_syntax.parse_term("!affine_dependent({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"), fn(x2673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2674 = @tactics.assume_tac(x2673)
    fn(x2675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2674(x2675)
    }
  })
  let t2664 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2661 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t2662 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2663 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2662, t2661]), @degree.segment_vertical()))
  let t2660 = @tactics.undisch_then(@term_syntax.parse_term("(y : Cart[Real, 2]) == (a : Cart[Real, 2])"), fn(x2657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2658 = @tactics.subst_all_tac(x2657)
    fn(x2659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2658(x2659)
    }
  })
  let t2656 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t2655 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (a : Cart[Real, 2])"))
  let t2654 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t2650 = @bool.conjunct2(@topology.segment_sym())
  let t2649 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2651 = @list.List([@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2649]), t2650)])
  let t2653 = @tactics.rule_assum_tac((x2652 : @kernel.Thm) => @equal.subs(t2651, x2652))
  let t2648 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2647 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t2646 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2644 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2642 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t2643 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2645 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2643, t2642]), @degree.segment_vertical())), t2644), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2641 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((y : Cart[Real, 2]), 1) == op_dollar((d : Cart[Real, 2]), 1)"), fn(x2638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2639 = @tactics.assume_tac(x2638)
    fn(x2640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2639(x2640)
    }
  })
  let t2637 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2631 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2632 = @tactics.assume_tac(x2631)
    fn(x2633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2632(x2633)
    }
  }, fn(x2634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2635 = @tactics.mp_tac(x2634)
    fn(x2636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2635(x2636)
    }
  }))
  let t2630 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2629 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t2628 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == {}) == (INTER(s, t) == {} && INTER(s, u) == {})"))]))
  let t2665 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_linepath(), @lists.not_cons_nil(), @lists.hd(), @paths.path_image_linepath(), pathfinish_polygonal_path(), @lists.last()])), t2628), t2629), t2630), t2637), t2641), t2645), t2646), t2647), t2648), t2653), t2654), t2655), t2656), t2660), t2663), t2664), @calc_rat.asm_real_arith_tac)
  let t2627 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2626 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.segment_closed_open()])))
  let t2625 = @simp.asm_rewrite_tac(@list.List([]))
  let t2623 = @bool.conjunct2(@topology.segment_sym())
  let t2622 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2624 = @tactics.subst1_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2622]), t2623))
  let t2666 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) && IN(x, (t : (_) -> Bool)) && (∀ y : _, IN(y, s) && IN(y, t) → y == x) → INTER(s, t) == {x}"))), t2624), t2625), t2626), t2627)
  let t2667 = @simp.rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathfinish_linepath()]))
  let t2621 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd()]))
  let t2668 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.pathstart_join(), pathstart_polygonal_path()])), t2621)
  let t2620 = @simp.asm_simp_tac(@list.List([@equal.gsym(@paths.simple_path_assoc()), @paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @lists.not_cons_nil(), @lists.hd(), @lists.last()]))
  let t2617 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2616 = @simp.asm_rewrite_tac(@list.List([]))
  let t2611 = @drule.part_match(fn(x2610 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2610))
  }, @equal.gsym(@paths.simple_path_assoc()))
  let t2618 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2605 = @tactics.subst1_tac(x2604)
    fn(x2606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2605(x2606)
    }
  }), fn(x2615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2612 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2607 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2608 = @tactics.mp_tac(x2607)
          fn(x2609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2608(x2609)
          }
        })(t2611(x2612))
      })((fn(x2613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2613.1
      })(x2614))
    })(x2615)(x2615)
  }), t2616), t2617)])
  let t2599 = @drule.part_match(fn(x2598 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2598))
  }, @paths.simple_path_sym())
  let t2619 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2593 = @tactics.subst1_tac(x2592)
    fn(x2594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2593(x2594)
    }
  }), fn(x2603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2600 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2596 = @tactics.mp_tac(x2595)
          fn(x2597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2596(x2597)
          }
        })(t2599(x2600))
      })((fn(x2601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2601.1
      })(x2602))
    })(x2603)(x2603)
  }), @tactics.ants_tac), t2618)])
  let t2587 = @drule.part_match(fn(x2586 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2586))
  }, @equal.gsym(@paths.simple_path_assoc()))
  let t2669 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(fn(x2591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2588 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2584 = @tactics.mp_tac(x2583)
          fn(x2585 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2584(x2585)
          }
        })(t2587(x2588))
      })((fn(x2589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2589.1
      })(x2590))
    })(x2591)(x2591)
  }, @tactics.ants_tac), t2619), t2620), t2668, t2667, t2666, t2665])
  let t2582 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2581 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2580 = @simp.asm_rewrite_tac(@list.List([]))
  let t2578 = @simp.rewrite_tac(@list.List([@sets.union_aci()]))
  let t2579 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), pathfinish_polygonal_path(), @lists.not_cons_nil(), @lists.hd(), @lists.last()])), t2578), @tactics.all_tac])
  let t2577 = @tactics.subgoal_then(@term_syntax.parse_term("path_image(op_plus_plus(op_plus_plus(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))), linepath((b, c)))) == path_image(op_plus_plus(linepath((a, b)), op_plus_plus(linepath((b, c)), polygonal_path(CONS(c, p)))))"), fn(x2574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2575 = @tactics.subst1_tac(x2574)
    fn(x2576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2575(x2576)
    }
  })
  let t2569 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2570 = @term_syntax.parse_term("op_plus_plus(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))), linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))))")
  let t2571 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2572 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t2573 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t2670 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t2573, t2572, t2571, t2570, t2569]), parity_lemma())), t2577), t2579), t2580), t2581), t2582), t2669)
  let t2563 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2560 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t2561 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2562 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2561, t2560]), @degree.segment_vertical()))
  let t2559 = @tactics.undisch_then(@term_syntax.parse_term("(y : Cart[Real, 2]) == (c : Cart[Real, 2])"), fn(x2556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2557 = @tactics.subst_all_tac(x2556)
    fn(x2558 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2557(x2558)
    }
  })
  let t2555 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t2554 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (c : Cart[Real, 2])"))
  let t2550 = @bool.conjunct2(@topology.segment_sym())
  let t2549 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2551 = @list.List([@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2549]), t2550)])
  let t2553 = @tactics.rule_assum_tac((x2552 : @kernel.Thm) => @equal.subs(t2551, x2552))
  let t2548 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2547 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t2546 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2544 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2542 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t2543 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2545 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2543, t2542]), @degree.segment_vertical())), t2544), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2541 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((y : Cart[Real, 2]), 1) == op_dollar((d : Cart[Real, 2]), 1)"), fn(x2538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2539 = @tactics.assume_tac(x2538)
    fn(x2540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2539(x2540)
    }
  })
  let t2537 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2532 = @tactics.assume_tac(x2531)
    fn(x2533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2532(x2533)
    }
  }, fn(x2534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2535 = @tactics.mp_tac(x2534)
    fn(x2536 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2535(x2536)
    }
  }))
  let t2530 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2529 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t2528 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == {}) == (INTER(s, t) == {} && INTER(s, u) == {})"))]))
  let t2564 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_linepath(), @paths.path_image_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()])), t2528), t2529), t2530), t2537), t2541), t2545), t2546), t2547), t2548), t2553), t2554), t2555), t2559), t2562), t2563), @calc_rat.asm_real_arith_tac)
  let t2527 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2526 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.segment_closed_open()])))
  let t2525 = @simp.asm_rewrite_tac(@list.List([]))
  let t2523 = @bool.conjunct2(@topology.segment_sym())
  let t2522 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2524 = @tactics.subst1_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2522]), t2523))
  let t2565 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) && IN(x, (t : (_) -> Bool)) && (∀ y : _, IN(y, s) && IN(y, t) → y == x) → INTER(s, t) == {x}"))), t2524), t2525), t2526), t2527)
  let t2521 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.last()]))
  let t2566 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.pathfinish_join(), pathfinish_polygonal_path()])), t2521)
  let t2567 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathstart_linepath()]))
  let t2520 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.last()]))
  let t2519 = @simp.rewrite_tac(@list.List([pathfinish_polygonal_path()]))
  let t2518 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2517 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t2512 = @drule.part_match(fn(x2511 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2511))
  }, @paths.simple_path_sym())
  let t2568 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x2516 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2513 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2509 = @tactics.mp_tac(x2508)
          fn(x2510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2509(x2510)
          }
        })(t2512(x2513))
      })((fn(x2514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2514.1
      })(x2515))
    })(x2516)(x2516)
  }, t2517), t2518), t2519), t2520), t2567, t2566, t2565, t2564])
  let t2507 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2506 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2505 = @simp.asm_rewrite_tac(@list.List([]))
  let t2503 = @simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), pathfinish_polygonal_path()]))
  let t2502 = @tactics.undisch_tac(@term_syntax.parse_term("pathfinish(op_plus_plus(linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), op_plus_plus(linepath((b, (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]])))))) == a"))
  let t2501 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2500 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t2504 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.path_image_sym()), t2500), t2501), t2502), t2503), @tactics.all_tac])
  let t2499 = @tactics.subgoal_then(@term_syntax.parse_term("path_image(op_plus_plus(op_plus_plus(linepath(((b : Cart[Real, 2]), (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]])))), linepath(((a : Cart[Real, 2]), b)))) == path_image(op_plus_plus(linepath((a, b)), op_plus_plus(linepath((b, c)), polygonal_path(CONS(c, p)))))"), fn(x2496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2497 = @tactics.subst1_tac(x2496)
    fn(x2498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2497(x2498)
    }
  })
  let t2491 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2492 = @term_syntax.parse_term("op_plus_plus(linepath(((b : Cart[Real, 2]), (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))")
  let t2493 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2494 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t2495 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t2671 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t2495, t2494, t2493, t2492, t2491]), parity_lemma())), t2499), t2504), t2505), t2506), t2507), t2568), t2670])
  let t2490 = @simp.rewrite_tac(@list.List([@sets.in_union()]))
  let t2672 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, 2]), UNION(segment(((b : Cart[Real, 2]), (a : Cart[Real, 2]))), segment((b, (c : Cart[Real, 2])))))")), t2490), @tactics.strip_tac), t2671), @tactics.all_tac])
  let t2489 = @tactics.subgoal_then(@term_syntax.parse_term("IN((d : Cart[Real, 2]), inside(path_image(op_plus_plus(linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), op_plus_plus(linepath((b, (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))))))"), fn(x2486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2487 = @tactics.assume_tac(x2486)
    fn(x2488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2487(x2488)
    }
  })
  let t2484 = @meson.meson_tac(@list.List([]))
  let t2483 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2482 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2481 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t2485 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(INTER(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), segment([(b, (c : Cart[Real, 2]))])), {a, b})")), t2481), t2482), t2483), t2484), @tactics.all_tac])
  let t2480 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), segment((b, (c : Cart[Real, 2])))) == {}"), fn(x2477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2478 = @tactics.assume_tac(x2477)
    fn(x2479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2478(x2479)
    }
  })
  let t2476 = @list.List([@simp.asm_rewrite_tac(@list.List([pathfinish_polygonal_path()])), @tactics.all_tac])
  let t2475 = @tactics.subgoal_then(@term_syntax.parse_term("pathfinish(polygonal_path((p : List[Cart[Real, 2]]))) == (a : Cart[Real, 2])"), fn(x2472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2473 = @tactics.assume_tac(x2472)
    fn(x2474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2473(x2474)
    }
  })
  let t2467 = @simp.asm_rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2466 = @tactics.match_mp_tac(@convex.in_interior_closure_convex_segment())
  let t2465 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2463 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t2464 = @tactics.spec_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"), t2463)
  let t2462 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), segment(((d : Cart[Real, 2]), (x : Cart[Real, 2]))))"))
  let t2468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((y : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))")), t2462), t2464), t2465), t2466), t2467)
  let t2461 = @simp.asm_rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2460 = @tactics.match_mp_tac(@convex.in_interior_closure_convex_segment())
  let t2459 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t2458 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2456 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2457 = @tactics.spec_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"), t2456)
  let t2455 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, 2]), segment(((y : Cart[Real, 2]), (d : Cart[Real, 2]))))"))
  let t2469 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((x : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))")), t2455), t2457), t2458), t2459), t2460), t2461)
  let t2454 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t2453 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @realax.real_le_mul(), @realarith.real_lt_imp_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → (x + y == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))"))]))
  let t2452 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2447 = @tactics.assume_tac(x2446)
    fn(x2448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2447(x2448)
    }
  }, fn(x2449 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2450 = @tactics.mp_tac(x2449)
    fn(x2451 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2450(x2451)
    }
  })))
  let t2445 = @tactics.disch_then(@tactics.choose_then(fn(x2442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2443 = @tactics.mp_tac(x2442)
    fn(x2444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2443(x2444)
    }
  }))
  let t2441 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_sub_eq(), @vectors.vector_arith(@term_syntax.parse_term("((d : Cart[Real, 2]) == op_pct(real_of_num(1) - (w : Real), op_pct(real_of_num(1) - (u : Real), d) + op_pct(u, (d' : Cart[Real, 2]))) + op_pct(w, op_pct(real_of_num(1) - (v : Real), d) + op_pct(v, d'))) == (op_pct((real_of_num(1) - w) * u + w * v, d' - d) == vec(0))"))]))
  let t2440 = @tactics.replicate_tac(2, @tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t2439 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment()]))
  let t2437 = @term_syntax.parse_term("IN((x : Cart[Real, 2]), segment(((d : Cart[Real, 2]), (d' : Cart[Real, 2]))))")
  let t2438 = @term_syntax.parse_term("IN((y : Cart[Real, 2]), segment([((d : Cart[Real, 2]), (d' : Cart[Real, 2]))]))")
  let t2470 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2434 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2435 = @tactics.undisch_tac(x2434)
    fn(x2436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2435(x2436)
    }
  }, @list.List([@term_syntax.parse_term("IN((d : Cart[Real, 2]), segment(((x : Cart[Real, 2]), (y : Cart[Real, 2]))))"), t2438, t2437])), t2439), t2440), t2441), t2445), t2452), t2453), t2454), @calc_rat.asm_real_arith_tac), t2469, t2468])
  let t2433 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2432 = @simp.asm_rewrite_tac(@list.List([]))
  let t2431 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == (d : Cart[Real, 2])"))
  let t2429 = @simp.rewrite_tac(@list.List([@topology.frontier(), @sets.in_diff()]))
  let t2428 = @meson.asm_meson_tac(@list.List([@topology.segment_sym()]))
  let t2427 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.in_union()])))
  let t2426 = @simp.rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2430 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@polytope.frontier_of_triangle()])), t2426), t2427), t2428), t2429])
  let t2425 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), frontier(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))) && IN((y : Cart[Real, 2]), frontier(hull(convex, {a, b, c})))"), fn(x2422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2423 = @tactics.mp_tac(x2422)
    fn(x2424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2423(x2424)
    }
  })
  let t2421 = @simp.asm_rewrite_tac(@list.List([]))
  let t2420 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == (y : Cart[Real, 2])"))
  let t2419 = @simp.asm_simp_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2418 = @simp.rewrite_tac(@list.List([@vectors.collinear_between_cases(), @topology.between_in_segment()]))
  let t2416 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2415 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), @topology.ends_in_segment()]))
  let t2414 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(@convex.convex_hull_subset_affine_hull()))
  let t2413 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2412 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t2410 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2411 = @tactics.map_every(fn(x2407 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2408 = @tactics.exists_tac(x2407)
    fn(x2409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2408(x2409)
    }
  }, @list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2410]))
  let t2417 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.collinear_affine_hull()])), t2411), t2412), t2413), t2414), t2415), t2416), @tactics.all_tac])
  let t2406 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(d : Cart[Real, 2]), (x : Cart[Real, 2]), (y : Cart[Real, 2])})"), fn(x2403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2404 = @tactics.mp_tac(x2403)
    fn(x2405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2404(x2405)
    }
  })
  let t2471 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t2406), t2417), t2418), t2419), t2420), t2421), t2425), t2430), t2431), t2432), t2433), t2470), @tactics.all_tac])
  let t2402 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], IN(y, segment([((d : Cart[Real, 2]), (d' : Cart[Real, 2]))])) && IN(y, UNION(segment(((b : Cart[Real, 2]), (a : Cart[Real, 2]))), segment((b, (c : Cart[Real, 2]))))) → y == (x : Cart[Real, 2])"), fn(x2399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2400 = @tactics.assume_tac(x2399)
    fn(x2401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2400(x2401)
    }
  })
  let t2398 = @list.List([@meson.asm_meson_tac(@list.List([@topology.in_segment()])), @tactics.all_tac])
  let t2397 = @tactics.subgoal_then(@term_syntax.parse_term("!((d' : Cart[Real, 2]) == (d : Cart[Real, 2]))"), fn(x2394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2395 = @tactics.assume_tac(x2394)
    fn(x2396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2395(x2396)
    }
  })
  let t2392 = @simp.asm_rewrite_tac(@list.List([]))
  let t2391 = @tactics.match_mp_tac(@topology.subset_interior())
  let t2390 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2388 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t2389 = @tactics.spec_tac(@term_syntax.parse_term("(d : Cart[Real, 2])"), t2388)
  let t2393 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((d : Cart[Real, 2]), interior(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})))")), t2389), t2390), t2391), t2392), @tactics.all_tac])
  let t2387 = @tactics.subgoal_then(@term_syntax.parse_term("IN((d : Cart[Real, 2]), interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})))"), fn(x2384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2385 = @tactics.assume_tac(x2384)
    fn(x2386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2385(x2386)
    }
  })
  let t2380 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge()]))
  let t2377 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t2378 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2379 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2378, t2377]), @degree.segment_vertical()))
  let t2376 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == (∀ x : _, IN(x, s) → !IN(x, t))"))])), t2376), @tactics.disch_tac), t2379), t2380), @calc_rat.asm_real_arith_tac)
  let t2375 = @simp.asm_simp_tac(@list.List([@realax.real_ge(), @calc_rat.real_arith(@term_syntax.parse_term("((b : Real) + (e : Real) <= (x : Real)) == (e <= x - b)"))]))
  let t2374 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_set_of_list(), @sets.in_elim_thm()]))
  let t2373 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_component_ge(), @sets.set_of_list(), @sets.insert_subset()]))
  let t2372 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2371 = @simp.simp_tac(@list.List([path_image_polygonal_path_subset_convex_hull(), @lists.not_cons_nil()]))
  let t2370 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, set_of_list(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))"))
  let t2382 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t2370), t2371), t2372), t2373), t2374), t2375), t2381])
  let t2369 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, 2]) | op_dollar(x, 2) >= op_dollar((b : Cart[Real, 2]), 2) + (e : Real)}"))
  let t2383 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ u : (_) -> Bool, SUBSET((t : (_) -> Bool), u) && INTER((s : (_) -> Bool), u) == {} → INTER(s, t) == {}"))), t2369), @tactics.conj_tac), t2382), @tactics.all_tac])
  let t2368 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((d : Cart[Real, 2]), (d' : Cart[Real, 2]))]), path_image(polygonal_path(CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))) == {}"), fn(x2365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2366 = @tactics.assume_tac(x2365)
    fn(x2367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2366(x2367)
    }
  })
  let t2363 = @simp.asm_rewrite_tac(@list.List([]))
  let t2360 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2361 = @term_syntax.parse_term("(a' : Cart[Real, 2])")
  let t2362 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c' : Cart[Real, 2])"), t2361, t2360]), @degree.segment_horizontal()))
  let t2359 = @simp.asm_rewrite_tac(@list.List([@convex.subset_segment(), @topology.ends_in_segment()]))
  let t2358 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : _), (u : (_) -> Bool)) && SUBSET((s : (_) -> Bool), (s' : (_) -> Bool)) && SUBSET((t : (_) -> Bool), (t' : (_) -> Bool)) → IN(x, UNION(s, UNION(t, u))) → IN(x, s') || IN(x, t')")))
  let t2357 = @simp.rewrite_tac(@list.List([@polytope.frontier_of_triangle()]))
  let t2356 = @simp.asm_simp_tac(@list.List([@topology.open_segment(), @sets.in_union(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2364 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, 2]), frontier(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})))")), t2356), t2357), t2358), t2359), @tactics.disch_tac), t2362), t2363), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2355 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 2]), UNION(segment(((b : Cart[Real, 2]), (a : Cart[Real, 2]))), segment((b, (c : Cart[Real, 2])))))"), fn(x2352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2353 = @tactics.assume_tac(x2352)
    fn(x2354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2353(x2354)
    }
  })
  let t2351 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2350 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Cart[Real, 2]) == (a : Cart[Real, 2])) && !(x == (c : Cart[Real, 2]))"), @tactics.strip_assume_tac)
  let t2348 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2346 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2347 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2347, t2346]), @degree.segment_vertical())), t2348), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2345 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((x : Cart[Real, 2]), 2) < op_dollar((b : Cart[Real, 2]), 2) + (e : Real)"), fn(x2342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2343 = @tactics.assume_tac(x2342)
    fn(x2344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2343(x2344)
    }
  })
  let t2341 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2340 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Cart[Real, 2]) == (b : Cart[Real, 2]))"), fn(x2337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2338 = @tactics.assume_tac(x2337)
    fn(x2339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2338(x2339)
    }
  })
  let t2335 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2333 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2334 = @term_syntax.parse_term("(d' : Cart[Real, 2])")
  let t2336 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t2334, t2333]), @degree.segment_vertical())), t2335), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2332 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((x : Cart[Real, 2]), 1) == op_dollar((d : Cart[Real, 2]), 1)"), fn(x2329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2330 = @tactics.assume_tac(x2329)
    fn(x2331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2330(x2331)
    }
  })
  let t2327 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t2326 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_component()]))
  let t2328 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t2326), t2327), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2325 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((d' : Cart[Real, 2]), 1) == op_dollar((d : Cart[Real, 2]), 1)"), fn(x2322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2323 = @tactics.assume_tac(x2322)
    fn(x2324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2323(x2324)
    }
  })
  let t2321 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2319 = @meson.meson_tac(@list.List([@convex.compact_convex_hull(), @topology.finite_imp_compact(), @sets.finite_rules()]))
  let t2318 = @tactics.match_mp_tac(@topology.compact_imp_closed())
  let t2317 = @tactics.match_mp_tac(@topology.closure_closed())
  let t2316 = @tactics.subgoal_then(@term_syntax.parse_term("closure(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})) == hull(convex, {a', b, c'})"), fn(x2314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x2314
    @simp.asm_rewrite_tac(@list.List([th_5]))
  })
  let t2320 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @topology.frontier()])), t2316), t2317), t2318), t2319), @tactics.all_tac])
  let t2313 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == (d' : Cart[Real, 2])"))
  let t2312 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @topology.frontier()])), @tactics.all_tac])
  let t2311 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == (d : Cart[Real, 2])"))
  let t2310 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t2309 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, 2])"))(fn(x2306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2307 = @tactics.mp_tac(x2306)
    fn(x2308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2307(x2308)
    }
  }))
  let t2305 = @simp.gen_rewrite_tac(fn(x2302 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2303 = @equal.land_conv(x2302)
    fn(x2304 : @kernel.Term) -> @kernel.Thm raise {
      s2303(x2304)
    }
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t2298 = @simp.asm_rewrite_tac(@list.List([@topology.ends_in_segment(), @sets.in_diff()]))
  let t2299 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(d' : Cart[Real, 2])")), t2298)
  let t2297 = @meson.asm_meson_tac(@list.List([@topology.interior_subset(), @sets.subset()]))
  let t2296 = @simp.rewrite_tac(@list.List([@topology.ends_in_segment(), @sets.in_inter()]))
  let t2300 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(d : Cart[Real, 2])")), t2296), t2297), t2299])
  let t2295 = @simp.rewrite_tac(@list.List([@topology.connected_segment(), @equal.gsym(@sets.member_not_empty())]))
  let t2301 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_inter_frontier()), t2295), @tactics.conj_tac), t2300), @tactics.all_tac])
  let t2294 = @tactics.subgoal_then(@term_syntax.parse_term("!(INTER(segment([((d : Cart[Real, 2]), (d' : Cart[Real, 2]))]), frontier(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}))) == {})"), fn(x2291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2292 = @tactics.mp_tac(x2291)
    fn(x2293 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2292(x2293)
    }
  })
  let t2290 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2289 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((d' : Cart[Real, 2]), hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}))"), fn(x2286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2287 = @tactics.assume_tac(x2286)
    fn(x2288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2287(x2288)
    }
  })
  let t2284 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm(), @realax.real_ge()]))
  let t2283 = @simp.simp_tac(@list.List([@misc.subset_hull(), @convex.convex_halfspace_component_ge()]))
  let t2282 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, 2]) | op_dollar(x, 2) >= op_dollar((b : Cart[Real, 2]), 2)}"))
  let t2285 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET((s : (_) -> Bool), t) && !IN((x : _), t) → !IN(x, s)"))), t2282), t2283), t2284), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2281 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((d' : Cart[Real, 2]), hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}))"), fn(x2278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2279 = @tactics.assume_tac(x2278)
    fn(x2280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2279(x2280)
    }
  })
  let t2276 = @sets.set_tac(@list.List([]))
  let t2275 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2274 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2273 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2269 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2270 = @tactics.spec_tac(@term_syntax.parse_term("(c' : Cart[Real, 2])"), t2269)
  let t2271 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((c' : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]))")), t2270)
  let t2267 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2268 = @tactics.spec_tac(@term_syntax.parse_term("(a' : Cart[Real, 2])"), t2267)
  let t2272 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((a' : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (a : Cart[Real, 2]))]))")), t2268), t2271])
  let t2266 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t2265 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull(), @sets.insert_subset(), @sets.empty_subset()]))
  let t2277 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t2265), t2266), @tactics.conj_tac), t2272), t2273), t2274), t2275), t2276), @tactics.all_tac])
  let t2264 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}), hull(convex, {(a : Cart[Real, 2]), b, (c : Cart[Real, 2])}))"), fn(x2261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2262 = @tactics.assume_tac(x2261)
    fn(x2263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2262(x2263)
    }
  })
  let t2259 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t2258 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_component()]))
  let t2260 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t2258), t2259), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2257 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((d' : Cart[Real, 2]), 2) + real_of_num(1) == op_dollar((b : Cart[Real, 2]), 2)"), fn(x2254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2255 = @tactics.assume_tac(x2254)
    fn(x2256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2255(x2256)
    }
  })
  let t2252 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq(), @realarith.real_lt_add(), @real.real_lt_rmul_eq()]))
  let t2250 = @calc_rat.real_arith(@term_syntax.parse_term("((r : Real) * ((e : Real) + (b : Real)) + ((real_of_num(1) - (r + (t : Real))) * b + t * (e + b)) < b + e) == ((r + t) * e < real_of_num(1) * e)"))
  let t2251 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((b : Real) < (r : Real) * (x : Real) + ((real_of_num(1) - (r + (t : Real))) * b + t * x)) == ((r + t) * b < (r + t) * x)")), t2250]))
  let t2247 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(r : Real) + ((s : Real) + (t : Real)) == real_of_num(1) → s == real_of_num(1) - (r + t)")))
  let t2249 = @tactics.first_assum(fn(x2248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2244 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2245 = @tactics.subst1_tac(x2244)
      fn(x2246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2245(x2246)
      }
    })(t2247(x2248))
  })
  let t2243 = @simp.asm_rewrite_tac(@list.List([]))
  let t2242 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_eq_sub_radd()])))
  let t2241 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2240 = @tactics.disch_then(fn(x2239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2237 = @tactics.subst1_tac(x2236)
      fn(x2238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2237(x2238)
      }
    })(@equal.sym(x2239))
  })
  let t2235 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2230 = @tactics.assume_tac(x2229)
    fn(x2231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2230(x2231)
    }
  }, fn(x2232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2233 = @tactics.mp_tac(x2232)
    fn(x2234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2233(x2234)
    }
  })))
  let t2226 = @term_syntax.parse_term("(t : Real)")
  let t2227 = @term_syntax.parse_term("(s : Real)")
  let t2228 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Real)"), t2227, t2226]))
  let t2225 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t2224 = @simp.asm_simp_tac(@list.List([@convex.interior_convex_hull_3_minimal()]))
  let t2253 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((d : Cart[Real, 2]), interior(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})))")), t2224), t2225), t2228), t2235), t2240), t2241), t2242), t2243), t2249), t2251), t2252), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2223 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((b : Cart[Real, 2]), 2) < op_dollar((d : Cart[Real, 2]), 2) && op_dollar(d, 2) < op_dollar(b, 2) + (e : Real)"), @tactics.strip_assume_tac)
  let t2221 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @calc_rat.real_arith(@term_syntax.parse_term("(b : Real) < (a : Real) → !(a - b == real_of_num(0))"))]))
  let t2220 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (b : Real) + u * (a : Real) - b == u * (a - b)"))]))
  let t2219 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2216 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2217 = @simp.expand_tac(x2216)
    fn(x2218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2217(x2218)
    }
  }, @list.List(["a'", "c'"])), t2219), t2220), t2221), @tactics.all_tac])
  let t2215 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((a' : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2) == (e : Real) && op_dollar((c' : Cart[Real, 2]), 2) - op_dollar(b, 2) == e"), @tactics.strip_assume_tac)
  let t2213 = @simp.simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t2212 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_component(), @vectors.vector_mul_component()]))
  let t2211 = @simp.expand_tac("d'")
  let t2214 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2211), t2212), t2213), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2210 = @tactics.subgoal_then(@term_syntax.parse_term("IN((d' : Cart[Real, 2]), outside(path_image(op_plus_plus(linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), op_plus_plus(linepath((b, (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))))))"), fn(x2207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2208 = @tactics.assume_tac(x2207)
    fn(x2209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2208(x2209)
    }
  })
  let t2206 = @simp.abbrev_tac(@term_syntax.parse_term("(d' : Cart[Real, 2]) == (d : Cart[Real, 2]) - op_pct(real_of_num(1) + (op_dollar(d, 2) - op_dollar((b : Cart[Real, 2]), 2)), basis(2))"))
  let t2204 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @realax.real_ge(), @sets.in_elim_thm(), @sets.in_univ(), @sets.in_diff(), @real.real_not_le()])), @tactics.disch_tac)
  let t2203 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @realax.real_ge(), @sets.in_elim_thm()]))
  let t2202 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_component_ge()]))
  let t2205 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.outside_subset_convex()), t2202), t2203), t2204])
  let t2201 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(DIFF(UNIV, {(x : Cart[Real, 2]) | op_dollar(x, 2) >= op_dollar((b : Cart[Real, 2]), 2)}), outside(path_image(op_plus_plus(linepath(((a : Cart[Real, 2]), b)), op_plus_plus(linepath((b, (c : Cart[Real, 2]))), polygonal_path(CONS(c, (p : List[Cart[Real, 2]]))))))))"), fn(x2198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2199 = @tactics.mp_tac(x2198)
    fn(x2200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2199(x2200)
    }
  })
  let t2195 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge()]))
  let t2194 = @simp.asm_simp_tac(@list.List([polygonal_path_cons_cons(), @lists.not_cons_nil()]))
  let t2196 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2191 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2192 = @equal.land_conv(x2191)
    fn(x2193 : @kernel.Term) -> @kernel.Thm raise {
      s2192(x2193)
    }
  }, @list.List([@sets.subset()])), t2194), t2195), @tactics.disch_tac)
  let t2190 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_set_of_list(), @realax.real_ge(), @sets.in_elim_thm(), @realarith.real_lt_imp_le(), @realax.real_le_refl()]))
  let t2189 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.insert_subset(), @sets.in_elim_thm(), @sets.empty_subset()]))
  let t2188 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_component_ge()]))
  let t2187 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2186 = @simp.simp_tac(@list.List([path_image_polygonal_path_subset_convex_hull(), @lists.not_cons_nil()]))
  let t2185 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, set_of_list(CONS((a : Cart[Real, 2]), CONS((b : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))))"))
  let t2197 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t2185), t2186), t2187), t2188), t2189), t2190), t2196])
  let t2184 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(path_image(polygonal_path(CONS((a : Cart[Real, 2]), CONS((b : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))))), {(x : Cart[Real, 2]) | op_dollar(x, 2) >= op_dollar(b, 2)})"), fn(x2181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2182 = @tactics.mp_tac(x2181)
    fn(x2183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2182(x2183)
    }
  })
  let t2179 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (k : Real)"))
  let t2178 = @simp.simp_tac(@list.List([@vectors.norm_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t2177 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul()]))
  let t2176 = @tactics.exists_tac(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])((k : Real) / real_of_num(2), (basis : (Num) -> Cart[Real, 2])(1))"))
  let t2175 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("∀ a : Cart[Real, 2], distance(((x : Cart[Real, 2]) + a, (y : Cart[Real, 2]))) < (k : Real) / real_of_num(2) && norm(a) == k / real_of_num(2) → distance((x, y)) < k")))
  let t2174 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t2173 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2172 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t2171 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2170 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @sets.subset()]))
  let t2169 = @tactics.exists_tac(@term_syntax.parse_term("(k : Real) / real_of_num(2)"))
  let t2168 = @simp.rewrite_tac(@list.List([@topology.in_interior()]))
  let t2167 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (k : Real) → !((b : Real) + k / real_of_num(2) == b)"))]))
  let t2166 = @simp.asm_simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_ge_1(), @calc_num.arith(), @realarith.real_mul_rid()]))
  let t2165 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2164 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) + op_pct((k : Real) / real_of_num(2), basis(1))"))
  let t2162 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (k : Real)"))
  let t2161 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @cart.dimindex_ge_1(), @calc_num.arith()]))
  let t2163 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.norm_arith(@term_syntax.parse_term("distance(((x : Cart[Real, 2]), x + (e : Cart[Real, 2]))) == norm(e)"))])), t2161), t2162), @calc_rat.real_arith_tac), @tactics.disch_tac])
  let t2157 = @term_syntax.parse_term("(x : Cart[Real, 2]) + op_pct((k : Real) / real_of_num(2), basis(1))")
  let t2160 = @tactics.disch_then(fn(x2159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2155 = @tactics.mp_tac(x2154)
      fn(x2156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2155(x2156)
      }
    })(((x2158 : @kernel.Thm) => @bool.spec(t2157, x2158))(x2159))
  })
  let t2153 = @tactics.disch_then(fn(x2150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x2150
    let t2152 = @tactics.mp_tac(th_4)
    @tactics.then_tac(@tactics.assume_tac(th_4), t2152)
  })
  let t2149 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t2148 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2143 = @tactics.assume_tac(x2142)
    fn(x2144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2143(x2144)
    }
  }, fn(x2145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2146 = @tactics.mp_tac(x2145)
    fn(x2147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2146(x2147)
    }
  }))
  let t2141 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Real)"))(fn(x2138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2139 = @tactics.mp_tac(x2138)
    fn(x2140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2139(x2140)
    }
  }))
  let t2135 = @simp.gen_rewrite_rule(fn(x2134 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2134
  }, @list.List([@topology.in_interior()]))
  let t2137 = @tactics.first_x_assum(fn(x2136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2132 = @tactics.mp_tac(x2131)
      fn(x2133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2132(x2133)
      }
    })(t2135(x2136))
  })
  let t2129 = @simp.asm_rewrite_tac(@list.List([]))
  let t2130 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2])")), t2129)])
  let t2128 = @class.asm_cases_tac(@term_syntax.parse_term("op_dollar((x : Cart[Real, 2]), 1) == op_dollar((b : Cart[Real, 2]), 1)"))
  let t2127 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t2126 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @theorems.left_imp_exists_thm()]))
  let t2180 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(interior(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})) == {})")), t2126), t2127), @tactics.disch_tac), t2128), t2130), t2137), t2141), t2148), t2149), t2153), t2160), @tactics.ants_tac), t2163), t2164), t2165), t2166), t2167), t2168), t2169), t2170), t2171), t2172), @tactics.disch_tac), t2173), t2174), t2175), t2176), t2177), t2178), t2179), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2125 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Cart[Real, 2], IN(d, interior(hull(convex, {(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}))) && !(op_dollar(d, 1) == op_dollar(b, 1))"), @tactics.strip_assume_tac)
  let t2122 = @equal.gsym(@real.real_le_sub_radd())
  let t2123 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.interior_inter()), t2122]))
  let t2124 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_lt_sub_radd(), @equal.gsym(@topology.interior_halfspace_component_le())])), t2123), @tactics.all_tac])
  let t2121 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(interior(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})), {(x : Cart[Real, 2]) | op_dollar(x, 2) - op_dollar(b, 2) < (e : Real)}) == interior(hull(convex, {(a' : Cart[Real, 2]), b, (c' : Cart[Real, 2])}))"), fn(x2118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2119 = @tactics.assume_tac(x2118)
    fn(x2120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2119(x2120)
    }
  })
  let t2114 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t2113 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @real.real_lt_imp_nz(), @realarith.real_sub_lt()]))
  let t2112 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real)) * (b : Real) + u * (a : Real) <= (e : Real) + b) == ((a - b) * u <= e)"))]))
  let t2111 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2107 = @simp.expand_tac("c'")
  let t2106 = @sets.set_tac(@list.List([]))
  let t2105 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2104 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2103 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2101 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2102 = @tactics.spec_tac(@term_syntax.parse_term("(c' : Cart[Real, 2])"), t2101)
  let t2108 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((c' : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]))")), t2102), t2103), t2104), t2105), t2106)
  let t2109 = @simp.expand_tac("a'")
  let t2100 = @sets.set_tac(@list.List([]))
  let t2099 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2098 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2097 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2095 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t2096 = @tactics.spec_tac(@term_syntax.parse_term("(a' : Cart[Real, 2])"), t2095)
  let t2110 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((a' : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (a : Cart[Real, 2]))]))")), t2096), t2097), t2098), t2099), t2100), t2109, t2108, t2107])
  let t2094 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2093 = @simp.simp_tac(@list.List([@real.real_le_sub_radd(), @convex.convex_inter(), @convex.convex_halfspace_component_le(), @convex.convex_convex_hull()]))
  let t2092 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert(), @real.real_sub_refl(), @realarith.real_lt_imp_le()]))
  let t2091 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_inter(), @sets.in_elim_thm()]))
  let t2115 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t2091), t2092), t2093), t2094), t2110), t2111), t2112), t2113), t2114)
  let t2090 = @simp.asm_rewrite_tac(@list.List([]))
  let t2089 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("(y : Real) < (x : Real) && real_of_num(0) < (e : Real) → (s : Real) == s * (x - y) / e * (e / (x - y))")))
  let t2088 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t2087 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @realax.real_mul_lid()]))
  let t2086 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (e : Real) + (b : Real) / e == (a + b) / e"))]))
  let t2085 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realax.real_le_mul(), @realarith.real_sub_lt(), @realarith.real_lt_imp_le()]))
  let t2084 = @tactics.exists_tac(@term_syntax.parse_term("(t : Real) * (op_dollar((c : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2)) / (e : Real)"))
  let t2083 = @tactics.exists_tac(@term_syntax.parse_term("(s : Real) * (op_dollar((a : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2)) / (e : Real)"))
  let t2082 = @simp.rewrite_tac(@list.List([@real.real_add_sub(), @vectors.vector_sub_component()]))
  let t2081 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2080 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (b : Cart[Real, N])) + op_pct(u, (a : Cart[Real, N])) - b == op_pct(u, a - b)"))]))
  let t2079 = @tactics.map_every(fn(x2076 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2077 = @simp.expand_tac(x2076)
    fn(x2078 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2077(x2078)
    }
  }, @list.List(["a'", "c'"]))
  let t2075 = @tactics.replicate_tac(3, @tactics.disch_tac)
  let t2073 = @term_syntax.parse_term("(t : Real)")
  let t2074 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Real)"), t2073]))
  let t2072 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == a + (y : Cart[Real, N])) == (x == y)"))]))
  let t2071 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter(), @sets.forall_in_gspec(), @theorems.imp_conj()]))
  let t2070 = @simp.rewrite_tac(@list.List([@convex.convex_hull_3_alt()]))
  let t2116 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {b, a, c}"))])), t2070), t2071), t2072), t2074), t2075), t2079), t2080), t2081), t2082), @tactics.strip_tac), t2083), t2084), t2085), t2086), t2087), t2088), @tactics.binop_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2089), t2090), t2115])
  let t2117 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t2116), @tactics.all_tac])
  let t2069 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(hull(convex, {(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])}), {(x : Cart[Real, 2]) | op_dollar(x, 2) - op_dollar(b, 2) <= (e : Real)}) == hull(convex, {(a' : Cart[Real, 2]), b, (c' : Cart[Real, 2])})"), fn(x2066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2067 = @tactics.assume_tac(x2066)
    fn(x2068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2067(x2068)
    }
  })
  let t2065 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t2064 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t2063 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @sets.has_size(), @calc_num.arith(), @sets.finite_insert(), @sets.finite_empty()]))
  let t2062 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])}"), @convex.interior_convex_hull_eq_empty()))
  let t2061 = @list.List([@meson.asm_meson_tac(@list.List([@convex.affine_dependent_imp_collinear_3()])), @tactics.all_tac])
  let t2060 = @tactics.subgoal_then(@term_syntax.parse_term("!affine_dependent({(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})"), fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2058 = @tactics.assume_tac(x2057)
    fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2058(x2059)
    }
  })
  let t2055 = @simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()]))
  let t2056 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})"))), t2055), @tactics.all_tac])
  let t2054 = @tactics.subgoal_then(@term_syntax.parse_term("!((a' : Cart[Real, 2]) == (c' : Cart[Real, 2]))"), fn(x2051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2052 = @tactics.assume_tac(x2051)
    fn(x2053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2052(x2053)
    }
  })
  let t2049 = @simp.asm_simp_tac(@list.List([@calc_int.real_mul_lzero(), @real.real_lt_imp_nz()]))
  let t2048 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq(), @realarith.real_sub_lt()]))
  let t2047 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((a : Real) == real_of_num(0)) && !((c : Real) == real_of_num(0)) → pow(a * (c * (x : Real)), 2) == a * (a * (y : Real)) * (c * (c * (z : Real))) → pow(x, 2) == y * z")))
  let t2046 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_cauchy_schwarz_equal()), @vectors.dot_lmul(), @vectors.dot_rmul()]))
  let t2045 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (b : Cart[Real, 2])) + op_pct(u, (a : Cart[Real, 2])) - b == op_pct(u, a - b)"))]))
  let t2044 = @tactics.map_every(fn(x2041 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2042 = @simp.expand_tac(x2041)
    fn(x2043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2042(x2043)
    }
  }, @list.List(["a'", "c'"]))
  let t2040 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t2039 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t2050 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})")), t2039), t2040), t2044), t2045), t2046), t2047), t2048), t2049), @tactics.all_tac])
  let t2038 = @tactics.subgoal_then(@term_syntax.parse_term("!collinear({(a' : Cart[Real, 2]), (b : Cart[Real, 2]), (c' : Cart[Real, 2])})"), fn(x2035 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2036 = @tactics.assume_tac(x2035)
    fn(x2037 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2036(x2037)
    }
  })
  let t2033 = @simp.asm_simp_tac(@list.List([@calc_int.real_mul_lzero(), @real.real_lt_imp_nz()]))
  let t2032 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq(), @realarith.real_sub_lt()]))
  let t2031 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_sub_eq()]))
  let t2030 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(op_pct(real_of_num(1) - (u : Real), (a : Cart[Real, 2])) + op_pct(u, (b : Cart[Real, 2])) == a) == (op_pct(u, b - a) == vec(0))"))]))
  let t2034 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2027 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2028 = @simp.expand_tac(x2027)
    fn(x2029 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2028(x2029)
    }
  }, @list.List(["a'", "c'"])), t2030), t2031), t2032), t2033), @tactics.all_tac])
  let t2026 = @tactics.subgoal_then(@term_syntax.parse_term("!((a' : Cart[Real, 2]) == (b : Cart[Real, 2])) && !((c' : Cart[Real, 2]) == b)"), @tactics.strip_assume_tac)
  let t2024 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @real.real_le_div(), @realarith.real_sub_le(), @real.real_le_ldiv_eq(), @realarith.real_sub_lt(), @realax.real_mul_lid()]))
  let t2023 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t2022 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == (r && p && q)"))]))
  let t2021 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_sub_eq(), @realarith.real_sub_0()]))
  let t2020 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(op_pct(real_of_num(1) - (u : Real), (a : Cart[Real, 2])) + op_pct(u, (b : Cart[Real, 2])) == op_pct(real_of_num(1) - (v : Real), a) + op_pct(v, b)) == (op_pct(u - v, b - a) == vec(0))"))]))
  let t2019 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t2025 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2016 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2017 = @simp.expand_tac(x2016)
    fn(x2018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2017(x2018)
    }
  }, @list.List(["a'", "c'"])), t2019), t2020), t2021), t2022), t2023), t2024), @tactics.all_tac])
  let t2015 = @tactics.subgoal_then(@term_syntax.parse_term("IN((a' : Cart[Real, 2]), segment([((b : Cart[Real, 2]), (a : Cart[Real, 2]))])) && IN((c' : Cart[Real, 2]), segment([(b, (c : Cart[Real, 2]))]))"), @tactics.strip_assume_tac)
  let t2013 = @term_syntax.parse_term("(c' : Cart[Real, 2]) == op_pct(real_of_num(1) - (e : Real) / (op_dollar((c : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2)), b) + op_pct(e / (op_dollar(c, 2) - op_dollar(b, 2)), c)")
  let t2014 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(a' : Cart[Real, 2]) == op_pct(real_of_num(1) - (e : Real) / (op_dollar((a : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2)), b) + op_pct(e / (op_dollar(a, 2) - op_dollar(b, 2)), a)"), t2013]))
  let t2011 = @meson.asm_meson_tac(@list.List([]))
  let t2010 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.in_insert(), @sets.in_set_of_list()])))
  let t2009 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t2008 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((d : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2)"))
  let t2007 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t2006 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2004 = @tactics.subst1_tac(x2003)
    fn(x2005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2004(x2005)
    }
  }, @tactics.strip_assume_tac))
  let t2002 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Cart[Real, 2])"))(fn(x1999 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2000 = @tactics.mp_tac(x1999)
    fn(x2001 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2000(x2001)
    }
  }))
  let t1998 = @simp.asm_rewrite_tac(@list.List([@sets.set_of_list(), @sets.forall_in_insert(), @theorems.imp_conj(), @sets.in_delete()]))
  let t1997 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1996 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t1994 = @simp.asm_rewrite_tac(@list.List([@sets.in_delete(), @sets.in_insert()]))
  let t1993 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t1992 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @equal.gsym(@sets.member_not_empty())]))
  let t1995 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.image_eq_empty()])), t1992), t1993), t1994), @tactics.all_tac])
  let t1991 = @simp.asm_simp_tac(@list.List([@sets.finite_set_of_list(), @sets.finite_image(), @sets.finite_delete()]))
  let t2012 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("IMAGE((v : Cart[Real, 2]) => op_dollar(v, 2) - op_dollar((b : Cart[Real, 2]), 2), DELETE(set_of_list(CONS((a : Cart[Real, 2]), CONS(b, CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))), b))"), @sets.inf_finite())), t1991), @tactics.ants_tac), t1995), t1996), t1997), t1998), t2002), t2006), @tactics.disch_tac), @tactics.disch_tac), t2007), @tactics.disch_tac), t2008), t2009), t2010), t2011), @tactics.all_tac])
  let t1990 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : Real, real_of_num(0) < e && e <= op_dollar((a : Cart[Real, 2]), 2) - op_dollar((b : Cart[Real, 2]), 2) && e <= op_dollar((c : Cart[Real, 2]), 2) - op_dollar(b, 2) && (∀ v : Cart[Real, 2], MEM(v, (p : List[Cart[Real, 2]])) → e <= op_dollar(v, 2) - op_dollar(b, 2))"), @tactics.strip_assume_tac)
  let t1985 = @simp.asm_rewrite_tac(@list.List([@convex.subset_segment(), @topology.ends_in_segment()]))
  let t1984 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == t) == SUBSET(t, s)"))]))
  let t1986 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), segment([(b, (c : Cart[Real, 2]))])) == segment([(b, c)])"), fn(x1982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1982
    @simp.asm_rewrite_tac(@list.List([@convex.finite_segment(), th_3]))
  }), t1984), t1985)
  let t1981 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq(), @realarith.real_sub_lt()]))
  let t1980 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (b : Real) < (real_of_num(1) - u) * (c : Real) && u * b < u * (a : Real) → !(b == (real_of_num(1) - u) * c + u * a)")))
  let t1979 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t1975 = @term_syntax.parse_term("(x : Cart[Real, 2]) => op_dollar(x, 2)")
  let t1978 = @tactics.disch_then(fn(x1977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1973 = @tactics.mp_tac(x1972)
      fn(x1974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1973(x1974)
      }
    })(((x1976 : @kernel.Thm) => @equal.ap_term(t1975, x1976))(x1977))
  })
  let t1971 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1966 = @tactics.assume_tac(x1965)
    fn(x1967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1966(x1967)
    }
  }, fn(x1968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1969 = @tactics.mp_tac(x1968)
    fn(x1970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1969(x1970)
    }
  })))
  let t1964 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x1961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1962 = @tactics.mp_tac(x1961)
    fn(x1963 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1962(x1963)
    }
  }))
  let t1960 = @simp.asm_rewrite_tac(@list.List([@topology.in_segment(), @sets.not_in_empty()]))
  let t1959 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert()]))
  let t1987 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("IN((b : Cart[Real, 2]), segment([((c : Cart[Real, 2]), (a : Cart[Real, 2]))]))"))), t1959), t1960), t1964), t1971), t1978), t1979), t1980), t1981)
  let t1958 = @simp.asm_rewrite_tac(@list.List([@convex.subset_segment(), @topology.ends_in_segment()]))
  let t1957 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == s) == SUBSET(s, t)"))]))
  let t1988 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), segment([(b, (c : Cart[Real, 2]))])) == segment([(a, b)])"), fn(x1955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1955
    @simp.asm_rewrite_tac(@list.List([@convex.finite_segment(), th_2]))
  }), t1957), t1958), t1987, t1986])
  let t1954 = @simp.rewrite_tac(@list.List([]))
  let t1953 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t1951 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1950 = @simp.asm_rewrite_tac(@list.List([]))
  let t1949 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Cart[Real, 2]), (b : Cart[Real, 2])}"))
  let t1952 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1949), t1950), t1951), @tactics.all_tac])
  let t1948 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE(INTER(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), segment([(b, (c : Cart[Real, 2]))])))"), fn(x1945 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1946 = @tactics.mp_tac(x1945)
    fn(x1947 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1946(x1947)
    }
  })
  let t1989 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.collinear_between_cases(), @topology.between_in_segment()])), t1948), t1952), t1953), t1954), @tactics.strip_tac), t1988), @tactics.all_tac])
  let t1944 = @tactics.subgoal_then(@term_syntax.parse_term("!collinear({(a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])})"), fn(x1941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1942 = @tactics.assume_tac(x1941)
    fn(x1943 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1942(x1943)
    }
  })
  let t1939 = @meson.asm_meson_tac(@list.List([]))
  let t1938 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t1937 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1936 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t1935 = @simp.rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t1940 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1935), t1936), @tactics.conj_tac), t1937), t1938), t1939), @tactics.all_tac])
  let t1934 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((b : Cart[Real, 2]), 2) < op_dollar((a : Cart[Real, 2]), 2) && op_dollar(b, 2) < op_dollar((c : Cart[Real, 2]), 2) && (∀ v : Cart[Real, 2], MEM(v, (p : List[Cart[Real, 2]])) → op_dollar(b, 2) < op_dollar(v, 2))"), @tactics.strip_assume_tac)
  let t1933 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → !((a : _) == x)) == !P(a)"))]))
  let t1932 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1931 = @simp.rewrite_tac(@list.List([@lists.pairwise(), @lists.all()]))
  let t1930 = @simp.asm_simp_tac(@list.List([polygonal_path_cons_cons()]))
  let t1929 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CONS((b : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]])))"), arc_polygonal_path_imp_distinct()))
  let t1928 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t1926 = @meson.asm_meson_tac(@list.List([]))
  let t1925 = @simp.rewrite_tac(@list.List([@convex.finite_segment(), @sets.finite_insert(), @sets.finite_empty()]))
  let t1922 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1924 = @tactics.disch_then(fn(x1923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1920 = @tactics.mp_tac(x1919)
      fn(x1921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1920(x1921)
      }
    })(t1922(x1923))
  })
  let t1918 = @simp.asm_rewrite_tac(@list.List([@paths.path_image_linepath(), @topology.segment_sym(), @sets.inter_aci()]))
  let t1927 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1915 = @tactics.mp_tac(x1914)
      fn(x1916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1915(x1916)
      }
    })(@bool.conjunct1(x1917))
  }), t1918), t1924), t1925), t1926), @tactics.all_tac])
  let t1913 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == (c : Cart[Real, 2])"))
  let t1912 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))), (v : (_) -> Bool)) == (SUBSET(INTER(s, t), v) && SUBSET(INTER(s, u), v))"))]))
  let t1911 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t1910 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq(), @equal.gsym(@theorems.conj_assoc()), @paths.path_image_linepath()]))
  let t1909 = @simp.simp_tac(@list.List([@paths.arc_join_eq(), @paths.pathfinish_linepath(), pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t1908 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1902
    let t1904 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.assume_tac(th_1), t1904)
  }, fn(x1905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1906 = @tactics.mp_tac(x1905)
    fn(x1907 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1906(x1907)
    }
  }))
  let t1901 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1896 = @tactics.assume_tac(x1895)
    fn(x1897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1896(x1897)
    }
  }, fn(x1898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1899 = @tactics.mp_tac(x1898)
    fn(x1900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1899(x1900)
    }
  }))
  let t1894 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t1893 = @simp.rewrite_tac(@list.List([@paths.pathfinish_linepath(), @paths.pathstart_join(), @paths.pathstart_linepath()]))
  let t1892 = @simp.asm_simp_tac(@list.List([polygonal_path_cons_cons()]))
  let t1890 = @term_syntax.parse_term("polygonal_path(CONS((b : Cart[Real, 2]), CONS((c : Cart[Real, 2]), (p : List[Cart[Real, 2]]))))")
  let t1891 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))"), t1890]), @paths.simple_path_join_imp()))
  let t1889 = @tactics.disch_then(fn(x1888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1886 = @tactics.assume_tac(x1885)
      fn(x1887 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1886(x1887)
      }
    })(@equal.gsym(x1888))
  })
  let t1884 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@lists.mem()]), @term_syntax.parse_term("MEM((b : _), CONS((a : _), CONS(b, (l : List[_]))))"))]))
  let t1880 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1883 = @tactics.first_x_assum(fn(x1882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1878 = @tactics.mp_tac(x1877)
      fn(x1879 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1878(x1879)
      }
    })(((x1881 : @kernel.Thm) => @bool.spec(t1880, x1881))(x1882))
  })
  let t1876 = @tactics.replicate_tac(2, @tactics.disch_then(@tactics.conjuncts_then2(fn(x1870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1871 = @tactics.assume_tac(x1870)
    fn(x1872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1871(x1872)
    }
  }, fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1874 = @tactics.mp_tac(x1873)
    fn(x1875 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1874(x1875)
    }
  })))
  let t1869 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathstart_linepath()]))
  let t1868 = @simp.asm_simp_tac(@list.List([polygonal_path_cons_cons(), @lists.last(), @lists.not_cons_nil()]))
  let t1867 = @simp.asm_rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t1866 = @class.asm_cases_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]]) == NIL"))
  let t1865 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(5 <= SUC(SUC(SUC((n : Num))))) == (!(n == 0) && 2 <= n)"))]))
  let t1864 = @tactics.pop_assum(fn(x1863 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1862 = @simp.asm_rewrite_tac(@list.List([]))
  let t1861 = @class.asm_cases_tac(@term_syntax.parse_term("(b' : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t1860 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @lists.el(), @lists.hd(), @lists.tl()]))
  let t1859 = @tactics.replicate_tac(3, @tactics.disch_then(fn(x1858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t1857 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]])"))
  let t1856 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))
  let t1855 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1854 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1853 = @tactics.x_gen_tac(@term_syntax.parse_term("(b' : Cart[Real, 2])"))
  let t1852 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1851 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1850 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t1849 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1848 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1846 = @term_syntax.parse_term("(r : List[Cart[Real, 2]])")
  let t1847 = @tactics.spec_tac(@term_syntax.parse_term("(r : List[Cart[Real, 2]])"), t1846)
  let t1845 = @tactics.pop_assum_list(fn(x1844 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1842 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1839 = @tactics.mp_tac(x1838)
        fn(x1840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1839(x1840)
        }
      })(((x1841 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x1841))(x1842))
    })((fn(x1843 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      @lib.rev(x1843)
    })(x1844))
  })
  let t1837 = @tactics.undisch_then(@term_syntax.parse_term("MEM((b : Cart[Real, 2]), (r : List[Cart[Real, 2]]))"), fn(x1836 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1835 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1832 = @tactics.subst_all_tac(x1831)
      fn(x1833 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1832(x1833)
      }
    })(@equal.sym(x1834))
  }, @tactics.strip_assume_tac))
  let t1830 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1824
    let t1826 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(th)])))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(th)])), t1826)
  }, fn(x1827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1828 = @tactics.mp_tac(x1827)
    fn(x1829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1828(x1829)
    }
  }))
  let t1823 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t1822 = @simp.gen_rewrite_tac(fn(x1821 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1815 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1816 = @equal.land_conv(x1815)
      fn(x1817 : @kernel.Term) -> @kernel.Thm raise {
        s1816(x1817)
      }
    })((fn(x1818 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1819 = @equal.land_conv(x1818)
      fn(x1820 : @kernel.Term) -> @kernel.Thm raise {
        s1819(x1820)
      }
    })(x1821))
  }, @list.List([@sets.extension()]))
  let t1814 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1807 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1808 = @tactics.subst_all_tac(x1807)
      fn(x1809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1808(x1809)
      }
    })(@equal.sym(x1810))
  }, fn(x1811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1812 = @tactics.mp_tac(x1811)
    fn(x1813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1812(x1813)
    }
  }))
  let t1806 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1801 = @tactics.assume_tac(x1800)
    fn(x1802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1801(x1802)
    }
  }, fn(x1803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1804 = @tactics.mp_tac(x1803)
    fn(x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1804(x1805)
    }
  }))
  let t1799 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1794 = @tactics.assume_tac(x1793)
    fn(x1795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1794(x1795)
    }
  }, fn(x1796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1797 = @tactics.mp_tac(x1796)
    fn(x1798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1797(x1798)
    }
  }))
  let t1792 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : List[Cart[Real, 2]])"))(fn(x1789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1790 = @tactics.mp_tac(x1789)
    fn(x1791 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1790(x1791)
    }
  }))
  let t1788 = @tactics.undisch_then(@term_syntax.parse_term("simple_path(polygonal_path((q : List[Cart[Real, 2]])))"), fn(x1787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1786 = @tactics.undisch_then(@term_syntax.parse_term("pathfinish(polygonal_path((q : List[Cart[Real, 2]]))) == pathstart(polygonal_path(q))"), fn(x1785 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1780 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1779 = @simp.asm_rewrite_tac(@list.List([]))
  let t1781 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"), simple_path_polygonal_path_rotate())), t1779), t1780), @int.asm_arith_tac)
  let t1778 = @simp.asm_rewrite_tac(@list.List([]))
  let t1782 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(path_image_polygonal_path_rotate()), t1778), @int.asm_arith_tac)
  let t1775 = @simp.asm_simp_tac(@list.List([@lists.last_el()]))
  let t1776 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("LENGTH((t : List[Cart[Real, 2]])) - 1")), t1775), @int.asm_arith_tac)
  let t1774 = @simp.rewrite_tac(@list.List([@lists.el()]))
  let t1777 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1774), @int.asm_arith_tac), t1776])
  let t1773 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem_exists_el(), @lists.length()]))
  let t1772 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1771 = @tactics.undisch_tac(@term_syntax.parse_term("5 <= LENGTH(CONS((h : Cart[Real, 2]), (t : List[Cart[Real, 2]])))"))
  let t1770 = @simp.rewrite_tac(@list.List([@lists.last()]))
  let t1769 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t1768 = @simp.asm_rewrite_tac(@list.List([@lists.last()]))
  let t1767 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) && IN((b : _), s) → UNION(s, {a}) == INSERT(b, s)")))
  let t1766 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1765 = @simp.rewrite_tac(@list.List([@sets.set_of_list_append(), @sets.set_of_list()]))
  let t1764 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl(), @lists.append()]))
  let t1762 = @term_syntax.parse_term("(l : List[Cart[Real, 2]])")
  let t1763 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"), t1762)
  let t1761 = @simp.asm_rewrite_tac(@list.List([]))
  let t1759 = @term_syntax.parse_term("!((l : List[Cart[Real, 2]]) == NIL)")
  let t1760 = @term_syntax.parse_term("5 <= LENGTH((q : List[Cart[Real, 2]]))")
  let t1783 = @list.List([@int.asm_arith_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1756 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1757 = @tactics.undisch_tac(x1756)
    fn(x1758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1757(x1758)
    }
  }, @list.List([@term_syntax.parse_term("HD((l : List[Cart[Real, 2]])) == LAST(l)"), t1760, t1759])), t1761), t1763), @lists.list_induct_tac), t1764), t1765), t1766), t1767), t1768), t1769), t1770), t1771), @class.cond_cases_tac), t1772), t1773), @tactics.disch_tac), @tactics.conj_tac), t1777), t1782, t1781])
  let t1755 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1754 = @simp.asm_rewrite_tac(@list.List([@lists.last(), @lists.hd_append(), @lists.length()]))
  let t1753 = @simp.asm_simp_tac(@list.List([@lists.last_append(), @lists.length_append(), @lists.length_tl(), @lists.not_cons_nil()]))
  let t1751 = @simp.asm_simp_tac(@list.List([@lists.length(), @lists.length_tl()]))
  let t1748 = @term_syntax.parse_term("(LENGTH : (List[Cart[Real, 2]]) -> Num)")
  let t1752 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1746 = @tactics.mp_tac(x1745)
      fn(x1747 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1746(x1747)
      }
    })(((x1749 : @kernel.Thm) => @equal.ap_term(t1748, x1749))(x1750))
  }), t1751), @int.asm_arith_tac), @tactics.all_tac])
  let t1744 = @tactics.subgoal_then(@term_syntax.parse_term("!(TL((l : List[Cart[Real, 2]])) == NIL)"), fn(x1741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1742 = @tactics.assume_tac(x1741)
    fn(x1743 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1742(x1743)
    }
  })
  let t1740 = @simp.asm_rewrite_tac(@list.List([]))
  let t1739 = @tactics.disch_then(fn(x1738 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1738))
  })
  let t1737 = @simp.asm_rewrite_tac(@list.List([]))
  let t1736 = @list.List([@meson.asm_meson_tac(@list.List([@lists.length_eq_nil()])), @tactics.all_tac])
  let t1735 = @class.asm_cases_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]]) == NIL"))
  let t1734 = @simp.rewrite_tac(@list.List([@lists.append_eq_nil(), @lists.not_cons_nil()]))
  let t1733 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"))
  let t1732 = @simp.asm_rewrite_tac(@list.List([]))
  let t1731 = @simp.asm_rewrite_tac(@list.List([pathstart_polygonal_path(), pathfinish_polygonal_path()]))
  let t1730 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t1729 = @class.asm_cases_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]]) == NIL"))
  let t1727 = @term_syntax.parse_term("5 <= LENGTH((q : List[Cart[Real, 2]]))")
  let t1728 = @tactics.map_every(fn(x1724 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1725 = @tactics.undisch_tac(x1724)
    fn(x1726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1725(x1726)
    }
  }, @list.List([@term_syntax.parse_term("pathfinish(polygonal_path((q : List[Cart[Real, 2]]))) == pathstart(polygonal_path(q))"), t1727]))
  let t1722 = @simp.asm_rewrite_tac(@list.List([]))
  let t1723 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1722), @int.asm_arith_tac), @tactics.all_tac])
  let t1721 = @simp.asm_rewrite_tac(@list.List([]))
  let t1720 = @tactics.exists_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]])"))
  let t1784 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(rotate_list_to_front_1()), t1720), t1721), @tactics.conj_tac), t1723), t1728), t1729), t1730), t1731), @tactics.disch_tac), @tactics.disch_tac), t1732), t1733), t1734), t1735), t1736), t1737), t1739), t1740), t1744), t1752), t1753), t1754), t1755), t1783), @tactics.all_tac])
  let t1719 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p : List[Cart[Real, 2]], EL(1, p) == (b : Cart[Real, 2]) && LAST(p) == HD(p) && LENGTH(p) == LENGTH((q : List[Cart[Real, 2]])) && set_of_list(p) == set_of_list(q) && path_image(polygonal_path(p)) == path_image(polygonal_path(q)) && simple_path(polygonal_path(p)) && pathfinish(polygonal_path(p)) == pathstart(polygonal_path(p))"), fn(x1716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1717 = @tactics.mp_tac(x1716)
    fn(x1718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1717(x1718)
    }
  })
  let t1714 = @simp.asm_rewrite_tac(@list.List([]))
  let t1713 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1710 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1711 = @tactics.mp_tac(x1710)
    fn(x1712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1711(x1712)
    }
  }))
  let t1709 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))
  let t1708 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1707 = @simp.rewrite_tac(@list.List([@sets.in_image(), @theorems.left_and_exists_thm(), @sets.in_set_of_list()]))
  let t1706 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), @sets.forall_in_image()]))
  let t1705 = @class.asm_cases_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]]) == NIL"))
  let t1704 = @tactics.undisch_tac(@term_syntax.parse_term("5 <= LENGTH((q : List[Cart[Real, 2]]))"))
  let t1703 = @simp.rewrite_tac(@list.List([@sets.image_eq_empty(), @sets.set_of_list_eq_empty()]))
  let t1702 = @simp.simp_tac(@list.List([@sets.finite_set_of_list(), @sets.finite_image()]))
  let t1715 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("IMAGE((x : Cart[Real, 2]) => op_dollar(x, 2), set_of_list((q : List[Cart[Real, 2]])))"), @sets.inf_finite())), t1702), t1703), t1704), t1705), t1706), @tactics.disch_tac), t1707), t1708), t1709), t1713), t1714), @tactics.all_tac])
  let t1701 = @tactics.subgoal_then(@term_syntax.parse_term("∃ b : Cart[Real, 2], MEM(b, (q : List[Cart[Real, 2]])) && (∀ d : Cart[Real, 2], MEM(d, q) → op_dollar(b, 2) <= op_dollar(d, 2))"), @tactics.strip_assume_tac)
  let t1700 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]])"))
  let t1698 = @determinants.geom_transform_tac(@list.List([]))
  let t1697 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation_v1()]))
  let t1699 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (∃ z : _, (P : (_) -> Bool)(z) && x == (f : (_) -> _)(z)) → (Q : (_, _) -> Bool)(x, y)) == (∀ z : _, ∀ y : _, P(z) → Q(f(z), y))"))])), t1697), t1698), @tactics.all_tac])
  let t3663 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@drule.match_mp(wlog_lemma)(distinguishing_rotation_exists_polygon())), @tactics.conj_tac), t1699), t1700), @tactics.disch_tac), @tactics.strip_tac), t1701), t1715), t1719), t1784), t1786), t1788), t1792), t1799), t1806), t1814), t1822), t1823), t1830), t1835), t1837), t1845), t1847), t1848), t1849), t1850), t1851), t1852), t1853), t1854), t1855), t1856), t1857), t1859), t1860), t1861), t1862), t1864), t1865), t1866), t1867), t1868), t1869), t1876), t1883), t1884), t1889), @tactics.strip_tac), t1891), t1892), t1893), t1894), t1901), t1908), t1909), t1910), t1911), t1912), t1913), t1927), t1928), @tactics.strip_tac), @tactics.strip_tac), t1929), t1930), t1931), t1932), t1933), @tactics.strip_tac), t1934), t1940), t1944), t1989), t1990), t2012), t2014), t2015), t2025), t2026), t2034), t2038), t2050), t2054), t2056), t2060), t2061), t2062), t2063), t2064), t2065), @tactics.disch_tac), t2069), t2117), t2121), t2124), t2125), t2180), t2184), t2197), t2201), t2205), t2206), t2210), t2214), t2215), t2222), t2223), t2253), t2257), t2260), t2264), t2277), t2281), t2285), t2289), t2290), t2294), t2301), t2305), t2309), t2310), t2311), t2312), t2313), t2320), t2321), @tactics.strip_tac), t2325), t2328), t2332), t2336), t2340), t2341), t2345), t2349), t2350), t2351), t2355), t2364), t2368), t2383), t2387), t2393), t2397), t2398), t2402), t2471), t2475), t2476), t2480), t2485), t2489), t2672), t2676), t2677), t2678), t2783), t2784), t2807), t2811), t2815), t2819), t2831), t2835), t2838), t2842), t2846), t2848), t2849), @tactics.ants_tac), t2863), @tactics.disch_tac), t2864), t2893), t2894), t2898), t2916), t2917), t3132), t3133), t3172), t3173), t3476), t3480), t3487), t3491), t3499), t3500), t3518), t3519), t3528), t3529), t3538), t3542), t3545), t3549), t3558), t3562), t3571), t3572), t3577), t3581), t3585), t3590), t3591), @tactics.ants_tac), t3624), @tactics.strip_tac), t3662)
  polygon_chop_in_two_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, 2]], simple_path(polygonal_path(p)) && pathfinish(polygonal_path(p)) == pathstart(polygonal_path(p)) && 5 <= LENGTH(p) → (∃ a : Cart[Real, 2], ∃ b : Cart[Real, 2], !(a == b) && MEM(a, p) && MEM(b, p) && SUBSET(segment((a, b)), inside(path_image(polygonal_path(p)))))"), t3663))
}

///|
let polygon_chop_in_two_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYGON_CHOP_IN_TWO")

///|
/// `POLYGON_CHOP_IN_TWO`
pub fn polygon_chop_in_two() -> @kernel.Thm {
  polygon_chop_in_two_c.get()
}

///|
/// PICK
fn step_48() -> Unit raise {
  let t4393 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @int.arith_rule(@term_syntax.parse_term("SUC(SUC((n : Num))) == n + 2"))]))
  let t4392 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.in_elim_thm(), @topology.ends_not_in_segment()]))
  let t4391 = @simp.simp_tac(@list.List([@sets.card_clauses(), finite_bounded_integer_points(), @convex.bounded_segment(), @sets.finite_insert()]))
  let t4390 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(P : (_) -> Bool)((a : _)) && P((b : _)) → {(x : _) | IN(x, UNION((s : (_) -> Bool), {a, b})) && P(x)} == INSERT(a, INSERT(b, {(x : _) | IN(x, s) && P(x)}))"))]))
  let t4388 = @sets.set_tac(@list.List([]))
  let t4387 = @simp.rewrite_tac(@list.List([@topology.open_segment(), @sets.in_diff()]))
  let t4389 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) && !IN((b : _), s) → DIFF(UNION(s, {a, b}), {a, b}) == s"))), t4387), t4388), @tactics.all_tac])
  let t4386 = @tactics.subgoal_then(@term_syntax.parse_term("DIFF(UNION(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), {a, b}), {a, b}) == segment((a, b))"), fn(x4383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4384 = @tactics.subst1_tac(x4383)
    fn(x4385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4384(x4385)
    }
  })
  let t4382 = @simp.rewrite_tac(@list.List([@topology.segment_closed_open()]))
  let t4381 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) + real_of_num(2) → real_of_num(2) * x + real_of_num(2) == real_of_num(2) * y + (real_of_num(2) + (real_of_num(2) + real_of_num(2)))")))
  let t4380 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4379 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t4378 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t4376 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t4375 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(P : (_) -> Bool)((a : _)) && P((b : _)) && IN(a, (q : (_) -> Bool)) && IN(b, q) && IN(a, (r : (_) -> Bool)) && IN(b, r) → SUBSET(INTER(q, r), {a, b}) → INTER({(x : _) | IN(x, q) && P(x)}, {(x : _) | IN(x, r) && P(x)}) == {a, b}")))
  let t4374 = @tactics.disch_then(fn(x4373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4372 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4370 = @tactics.mp_tac(x4369)
        fn(x4371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4370(x4371)
        }
      })(@lib.last(x4372))
    })(@bool.conjuncts_rule(x4373))
  })
  let t4368 = @simp.asm_rewrite_tac(@list.List([]))
  let t4366 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@paths.simple_path_join_imp()))
  let t4377 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x4367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4364 = @tactics.mp_tac(x4363)
      fn(x4365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4364(x4365)
      }
    })(t4366(x4367))
  }), t4368), t4374), t4375), t4376), @tactics.all_tac])
  let t4362 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(x : Cart[Real, 2]) | IN(x, path_image(polygonal_path((q : List[Cart[Real, 2]])))) && integral_vector(x)}, {(x : Cart[Real, 2]) | IN(x, path_image(polygonal_path((r : List[Cart[Real, 2]])))) && integral_vector(x)}) == {(a : Cart[Real, 2]), (b : Cart[Real, 2])}"), fn(x4359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4360 = @tactics.subst1_tac(x4359)
    fn(x4361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4360(x4361)
    }
  })
  let t4357 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t4356 = @simp.asm_rewrite_tac(@list.List([@topology.open_segment(), @paths.inside_no_overlap(), @topology.ends_in_segment()]))
  let t4354 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (Cart[Real, _]) -> Bool), inside(UNION((q : (Cart[Real, _]) -> Bool), (r : (Cart[Real, _]) -> Bool)))) → s == DIFF((c : (Cart[Real, _]) -> Bool), {(a : Cart[Real, _]), (b : Cart[Real, _])}) && IN(a, q) && IN(b, q) && IN(a, r) && IN(b, r) && INTER(inside(UNION(q, r)), UNION(q, r)) == {} && (P : (Cart[Real, _]) -> Bool)(a) && P(b) && IN(a, c) && IN(b, c) → INTER({(x : Cart[Real, _]) | IN(x, c) && P(x)}, {(x : Cart[Real, _]) | IN(x, q) && P(x)}) == {a, b} && INTER({(x : Cart[Real, _]) | IN(x, c) && P(x)}, {(x : Cart[Real, _]) | IN(x, r) && P(x)}) == {a, b}")))
  let t4358 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x4355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4354(x4355))
  }), t4356), t4357), @tactics.all_tac])
  let t4352 = @tactics.conjuncts_then(fn(x4349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4350 = @tactics.subst1_tac(x4349)
    fn(x4351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4350(x4351)
    }
  })
  let t4353 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(x : Cart[Real, 2]) | IN(x, segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])) && integral_vector(x)}, {(x : Cart[Real, 2]) | IN(x, path_image(polygonal_path((q : List[Cart[Real, 2]])))) && integral_vector(x)}) == {a, b} && INTER({(x : Cart[Real, 2]) | IN(x, segment([(a, b)])) && integral_vector(x)}, {(x : Cart[Real, 2]) | IN(x, path_image(polygonal_path((r : List[Cart[Real, 2]])))) && integral_vector(x)}) == {a, b}"), t4352)
  let t4348 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (ab : Real) + (qr : Real) == real_of_num(2) * (x : Real) + ((qab : Real) + ((rab : Real) + real_of_num(2))) → ab + (q : Real) - qab + (ab + (r : Real) - rab) == real_of_num(2) * x + (q + r - qr + real_of_num(2))")))
  let t4347 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4344 = @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) → x <= y + (z : Num)"))
  let t4345 = @list.List([@sets.card_union_gen(), finite_bounded_integer_points(), @convex.bounded_segment(), @paths.bounded_path_image(), path_polygonal_path(), @equal.gsym(@real.real_of_num_sub()), @sets.inter_subset(), @sets.card_subset(), t4344])
  let t4342 = @simp.basic_ss(@list.List([]))
  let t4346 = (fn(x4339 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4340 = @tactics.conv_tac(x4339)
    fn(x4341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4340(x4341)
    }
  })(((x4343 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t4342, 5, x4343))(t4345))
  let t4338 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == UNION({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))]))
  let t4337 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(q : Real) + (r : Real) == real_of_num(2) * (x : Real) + ((y : Real) + real_of_num(2)) → (iq : Real) + (q / real_of_num(2) - real_of_num(1)) + ((ir : Real) + (r / real_of_num(2) - real_of_num(1))) == iq + (ir + x) + (y / real_of_num(2) - real_of_num(1))")))
  let t4336 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4334 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4333 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(inside(UNION((s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))), UNION(s, t)) == {} → {(x : Cart[Real, _]) | IN(x, INTER(inside(UNION(s, t)), DIFF(s, (ab : (Cart[Real, _]) -> Bool)))) && (P : (Cart[Real, _]) -> Bool)(x)} == {}")))
  let t4332 = @tactics.match_mp_tac(@meson.meson(@list.List([@sets.card_clauses()]), @term_syntax.parse_term("(s : (_) -> Bool) == {} → CARD(s) == 0")))
  let t4331 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty(), @sets.empty_gspec(), @sets.union_empty()]))
  let t4330 = @tactics.rule_assum_tac(@simp.once_rewrite_rule(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION((s : (Cart[Real, _]) -> Bool), segment([((a : Cart[Real, _]), (b : Cart[Real, _]))])) == UNION(segment([(a, b)]), s)"))])))
  let t4329 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, (t : (_) -> Bool)) && P(x)}) == {(x : _) | IN(x, INTER(s, t)) && P(x)}"))]))
  let t4328 = @simp.rewrite_tac(@list.List([@sets.union_over_inter()]))
  let t4327 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(pr : Num) == 0 && (qrp : Num) == 0 → (q : Num) + ((r : Num) + (p : Num) - pr) - qrp == q + (r + p)")))
  let t4325 = @simp.basic_ss(@list.List([]))
  let t4335 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x4322 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4323 = @tactics.conv_tac(x4322)
    fn(x4324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4323(x4324)
    }
  })(((x4326 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t4325, 5, x4326))(@list.List([@sets.card_union_gen(), finite_bounded_integer_points(), @sets.finite_union(), @paths.bounded_inside(), @topology.bounded_union(), @convex.bounded_segment(), @paths.bounded_path_image(), @topology.bounded_diff(), path_polygonal_path()]))), t4327), t4328), t4329), t4330), t4331), @tactics.conj_tac), t4332), t4333), t4334), @tactics.all_tac])
  let t4321 = @tactics.subgoal_then(@term_syntax.parse_term("CARD(UNION({(x : Cart[Real, 2]) | IN(x, inside(UNION(segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]), path_image(polygonal_path((q : List[Cart[Real, 2]])))))) && integral_vector(x)}, UNION({(x : Cart[Real, 2]) | IN(x, inside(UNION(segment([(a, b)]), path_image(polygonal_path((r : List[Cart[Real, 2]])))))) && integral_vector(x)}, {(x : Cart[Real, 2]) | IN(x, DIFF(segment([(a, b)]), {a, b})) && integral_vector(x)}))) == CARD({(x : Cart[Real, 2]) | IN(x, inside(UNION(segment([(a, b)]), path_image(polygonal_path(q))))) && integral_vector(x)}) + (CARD({(x : Cart[Real, 2]) | IN(x, inside(UNION(segment([(a, b)]), path_image(polygonal_path(r))))) && integral_vector(x)}) + CARD({(x : Cart[Real, 2]) | IN(x, DIFF(segment([(a, b)]), {a, b})) && integral_vector(x)}))"), fn(x4318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4319 = @tactics.subst1_tac(x4318)
    fn(x4320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4319(x4320)
    }
  })
  let t4317 = @simp.asm_rewrite_tac(@list.List([]))
  let t4316 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION((s : (Cart[Real, _]) -> Bool), segment([((a : Cart[Real, _]), (b : Cart[Real, _]))])) == UNION(segment([(a, b)]), s)"))]))
  let t4315 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4313 = @sets.set_tac(@list.List([]))
  let t4312 = @simp.rewrite_tac(@list.List([negligible_segment_2()]))
  let t4311 = @tactics.exists_tac(@term_syntax.parse_term("segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])"))
  let t4310 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t4314 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@measure.measure_negligible_symdiff())), t4310), t4311), t4312), t4313), @tactics.all_tac])
  let t4309 = @tactics.exists_tac(@term_syntax.parse_term("measure(inside(UNION(path_image(polygonal_path((q : List[Cart[Real, 2]]))), segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])))) + measure(inside(UNION(path_image(polygonal_path((r : List[Cart[Real, 2]]))), segment([(a, b)]))))"))
  let t4308 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t4303 = @sets.set_tac(@list.List([]))
  let t4302 = @simp.rewrite_tac(@list.List([negligible_segment_2()]))
  let t4301 = @tactics.exists_tac(@term_syntax.parse_term("segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])"))
  let t4300 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t4304 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.union_over_inter(), @sets.union_empty()])), t4300), t4301), t4302), t4303)
  let t4297 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t4296 = @tactics.match_mp_tac(@topology.finite_imp_compact())
  let t4295 = @simp.rewrite_tac(@list.List([@convex.compact_segment()]))
  let t4294 = @tactics.match_mp_tac(@measure.measurable_compact())
  let t4298 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_diff()), @tactics.conj_tac), t4294), t4295), t4296), t4297)
  let t4293 = @simp.simp_tac(@list.List([@paths.compact_path_image(), @convex.compact_segment(), path_polygonal_path()]))
  let t4292 = @tactics.match_mp_tac(@topology.compact_union())
  let t4299 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t4292), t4293), t4298])
  let t4305 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_union()), @tactics.conj_tac), t4299)
  let t4291 = @simp.simp_tac(@list.List([@paths.compact_path_image(), @convex.compact_segment(), path_polygonal_path()]))
  let t4290 = @tactics.match_mp_tac(@topology.compact_union())
  let t4306 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t4290), t4291), t4305, t4304])
  let t4289 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4307 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_negligible_union()), t4289), t4306), @tactics.all_tac])
  let t4288 = @tactics.exists_tac(@term_syntax.parse_term("measure(inside(UNION(path_image(polygonal_path((q : List[Cart[Real, 2]]))), segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))])))) + measure(UNION(inside(UNION(path_image(polygonal_path((r : List[Cart[Real, 2]]))), segment([(a, b)]))), DIFF(segment([(a, b)]), {a, b})))"))
  let t4287 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t4286 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_) -> Bool)(x)} == UNION({(x : _) | IN(x, s) && P(x)}, {(x : _) | IN(x, t) && P(x)})"))]))
  let t4285 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("UNION(inside(UNION(path_image(polygonal_path((q : List[Cart[Real, 2]]))), segment([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]))), UNION(inside(UNION(path_image(polygonal_path((r : List[Cart[Real, 2]]))), segment([(a, b)]))), DIFF(segment([(a, b)]), {a, b}))) == inside(UNION(path_image(polygonal_path(q)), path_image(polygonal_path(r))))"))))
  let t4284 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4282 = @bool.conjunct1(@topology.segment_sym())
  let t4281 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t4283 = @tactics.subst1_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t4281]), t4282))
  let t4280 = @simp.rewrite_tac(@list.List([@paths.path_image_reversepath(), @paths.path_image_linepath()]))
  let t4279 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t4278 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), inside(path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))))"))
  let t4270 = @term_syntax.parse_term("(measure : ((Cart[Real, 2]) -> Bool) -> Real)")
  let t4277 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x4276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4268 = @tactics.mp_tac(x4267)
      fn(x4269 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4268(x4269)
      }
    })(((x4275 : @kernel.Thm) => @lib.check(fn(x4274 : @kernel.Thm) -> Bool raise {
      (fn(x4272 : @kernel.Term) -> Bool raise {
        ((x4271 : @kernel.Term) => @basics.free_in(t4270, x4271))(x4272)
      })((fn(x4273 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x4273)
      })(x4274))
    }, x4275))(x4276))
  }))
  let t4261 = @simp.asm_simp_tac(@list.List([@paths.path_image_join()]))
  let t4260 = @simp.asm_rewrite_tac(@list.List([@paths.inside_no_overlap(), @convex.segment_eq_empty()]))
  let t4257 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (Cart[Real, _]) -> Bool), (i : (Cart[Real, _]) -> Bool)) → INTER(inside(UNION((q : (Cart[Real, _]) -> Bool), (r : (Cart[Real, _]) -> Bool))), UNION(q, r)) == {} && inside(UNION(q, r)) == i && !(s == {}) → !(INTER(UNION(s, {(a : Cart[Real, _]), (b : Cart[Real, _])}), inside(UNION(q, r))) == {})")))
  let t4259 = @tactics.first_x_assum(fn(x4258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4257(x4258))
  })
  let t4262 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.segment_closed_open()])), t4259), t4260), t4261)
  let t4256 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t4255 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4254 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : Cart[Real, _]), (u : (Cart[Real, _]) -> Bool)) && IN((b : Cart[Real, _]), u) && INTER(inside(UNION((t : (Cart[Real, _]) -> Bool), u)), UNION(t, u)) == {} → SUBSET((s : (Cart[Real, _]) -> Bool), inside(UNION(t, u))) → INTER(u, UNION(s, {a, b})) == {a, b}")))
  let t4253 = @simp.asm_simp_tac(@list.List([@paths.path_image_join()]))
  let t4252 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), inside(path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))))"))
  let t4263 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.segment_closed_open()])), t4252), t4253), t4254), t4255), t4256)
  let t4251 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t4250 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4249 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : Cart[Real, _]), (t : (Cart[Real, _]) -> Bool)) && IN((b : Cart[Real, _]), t) && INTER(inside(UNION(t, (u : (Cart[Real, _]) -> Bool))), UNION(t, u)) == {} → SUBSET((s : (Cart[Real, _]) -> Bool), inside(UNION(t, u))) → INTER(t, UNION(s, {a, b})) == {a, b}")))
  let t4248 = @simp.asm_simp_tac(@list.List([@paths.path_image_join()]))
  let t4247 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), inside(path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))))"))
  let t4264 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.segment_closed_open()])), t4247), t4248), t4249), t4250), t4251)
  let t4246 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t4265 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), {(a : _), (b : _)}) && IN(a, s) && IN(b, s) && IN(a, t) && IN(b, t) → INTER(s, t) == {a, b}"))), t4246), t4264, t4263, t4262])
  let t4245 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4244 = @simp.asm_simp_tac(@list.List([@paths.path_image_reversepath(), @paths.arc_imp_simple_path(), @paths.simple_path_reversepath()]))
  let t4243 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.path_image_linepath()]))
  let t4242 = @tactics.undisch_tac(@term_syntax.parse_term("simple_path(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))"))
  let t4266 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath(), @paths.simple_path_linepath_eq()])), t4242), t4243), t4244), @tactics.strip_tac), t4245), t4265), @tactics.all_tac])
  let t4241 = @simp.rewrite_tac(@list.List([]))
  let t4236 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t4237 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t4238 = @term_syntax.parse_term("linepath(((a : Cart[Real, 2]), (b : Cart[Real, 2])))")
  let t4239 = @term_syntax.parse_term("reversepath(polygonal_path((r : List[Cart[Real, 2]])))")
  let t4240 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("polygonal_path((q : List[Cart[Real, 2]]))"), t4239, t4238, t4237, t4236]), @moretop.split_inside_simple_closed_curve()))
  let t4234 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4233 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(inside(UNION((s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))), UNION(s, t)) == {} → INTER(t, inside(UNION(s, t))) == {}")))
  let t4232 = @simp.asm_simp_tac(@list.List([@paths.path_image_join()]))
  let t4229 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (i : (_) -> Bool)) → INTER((c : (_) -> Bool), i) == {} → SUBSET(INTER(UNION(s, {(a : _), (b : _)}), c), {a, b})")))
  let t4231 = @tactics.first_x_assum(fn(x4230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4229(x4230))
  })
  let t4228 = @simp.rewrite_tac(@list.List([@topology.segment_closed_open()]))
  let t4227 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t4226 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), @paths.arc_linepath_eq()]))
  let t4225 = @tactics.undisch_tac(@term_syntax.parse_term("simple_path(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))"))
  let t4223 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath()]))
  let t4224 = @list.List([@meson.asm_meson_tac(@list.List([])), t4223])
  let t4235 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.mem(), @paths.pathstart_join(), @paths.pathfinish_join()])), @tactics.conj_tac), t4224), t4225), t4226), @tactics.strip_tac), t4227), t4228), t4231), t4232), t4233), t4234), @tactics.strip_tac])
  let t4221 = @simp.simp_tac(@list.List([pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t4220 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), polygonal_path()]))
  let t4219 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4218 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4217 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4215 = @term_syntax.parse_term("(r : List[Cart[Real, 2]])")
  let t4216 = @tactics.spec_tac(@term_syntax.parse_term("(r : List[Cart[Real, 2]])"), t4215)
  let t4222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x4214 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4211 = @tactics.mp_tac(x4210)
      fn(x4212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4211(x4212)
      }
    })(((x4213 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x4213))(x4214))
  }), t4216), t4217), t4218), @tactics.gen_tac), t4219), t4220), t4221), @tactics.all_tac])
  let t4209 = @tactics.subgoal_then(@term_syntax.parse_term("polygonal_path(CONS((a : Cart[Real, 2]), (r : List[Cart[Real, 2]]))) == op_plus_plus(linepath((a, (b : Cart[Real, 2]))), polygonal_path(r))"), fn(x4206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4207 = @tactics.subst_all_tac(x4206)
    fn(x4208 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4207(x4208)
    }
  })
  let t4205 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t4203 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4202 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(inside(UNION((s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))), UNION(s, t)) == {} → INTER(s, inside(UNION(s, t))) == {}")))
  let t4201 = @simp.asm_simp_tac(@list.List([@paths.path_image_join()]))
  let t4198 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (i : (_) -> Bool)) → INTER((c : (_) -> Bool), i) == {} → SUBSET(INTER(UNION(s, {(a : _), (b : _)}), c), {b, a})")))
  let t4200 = @tactics.first_x_assum(fn(x4199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4198(x4199))
  })
  let t4197 = @simp.rewrite_tac(@list.List([@topology.segment_closed_open()]))
  let t4196 = @simp.once_rewrite_tac(@list.List([@topology.segment_sym()]))
  let t4195 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t4194 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), @paths.arc_linepath_eq()]))
  let t4193 = @tactics.undisch_tac(@term_syntax.parse_term("simple_path(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))"))
  let t4191 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath()]))
  let t4192 = @list.List([@meson.asm_meson_tac(@list.List([])), t4191])
  let t4204 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.mem(), @paths.pathstart_join(), @paths.pathfinish_join()])), @tactics.conj_tac), t4192), t4193), t4194), @tactics.strip_tac), t4195), t4196), t4197), t4200), t4201), t4202), t4203), @tactics.strip_tac])
  let t4189 = @simp.simp_tac(@list.List([pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t4188 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), polygonal_path()]))
  let t4187 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4186 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4185 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4183 = @term_syntax.parse_term("(q : List[Cart[Real, 2]])")
  let t4184 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]])"), t4183)
  let t4190 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x4182 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4179 = @tactics.mp_tac(x4178)
      fn(x4180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4179(x4180)
      }
    })(((x4181 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x4181))(x4182))
  }), t4184), t4185), t4186), @tactics.gen_tac), t4187), t4188), t4189), @tactics.all_tac])
  let t4177 = @tactics.subgoal_then(@term_syntax.parse_term("polygonal_path(CONS((b : Cart[Real, 2]), (q : List[Cart[Real, 2]]))) == op_plus_plus(linepath((b, (a : Cart[Real, 2]))), polygonal_path(q))"), fn(x4174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4175 = @tactics.subst_all_tac(x4174)
    fn(x4176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4175(x4176)
    }
  })
  let t4173 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t4172 = @tactics.first_x_assum(fn(x4169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x4169
    let t4171 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CONS((b : Cart[Real, 2]), (q : List[Cart[Real, 2]]))"), th_2))
    @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CONS((a : Cart[Real, 2]), (r : List[Cart[Real, 2]]))"), th_2)), t4171)
  })
  let t4167 = @tactics.undisch_then(@term_syntax.parse_term("2 <= LENGTH((r : List[Cart[Real, 2]]))"), fn(x4166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t4165 = @simp.asm_rewrite_tac(@list.List([@topology.segment_open_subset_closed(), @convex.segment_eq_empty()]))
  let t4164 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4163 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(inside(UNION((t : (Cart[Real, _]) -> Bool), (s' : (Cart[Real, _]) -> Bool))), UNION(t, s')) == {} && !((s : (Cart[Real, _]) -> Bool) == {}) && SUBSET(s, s') → !SUBSET(s, inside(UNION(t, s')))")))
  let t4162 = @simp.once_rewrite_tac(@list.List([@bool.conjunct1(@topology.segment_sym())]))
  let t4161 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_image_linepath(), @paths.pathstart_linepath()]))
  let t4160 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), inside(path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), linepath((b, a))))))"))
  let t4159 = @tactics.undisch_then(@term_syntax.parse_term("(a1 : Cart[Real, 2]) == (a : Cart[Real, 2])"), fn(x4156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4157 = @tactics.subst_all_tac(x4156)
    fn(x4158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4157(x4158)
    }
  })
  let t4155 = @tactics.undisch_then(@term_syntax.parse_term("(a0 : Cart[Real, 2]) == (b : Cart[Real, 2])"), fn(x4152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4153 = @tactics.subst_all_tac(x4152)
    fn(x4154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4153(x4154)
    }
  })
  let t4151 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4150 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t4149 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("3 <= SUC(SUC(SUC((n : Num))))"))]))
  let t4148 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4147 = @tactics.x_gen_tac(@term_syntax.parse_term("(a1 : Cart[Real, 2])"))
  let t4146 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4145 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4144 = @tactics.x_gen_tac(@term_syntax.parse_term("(a0 : Cart[Real, 2])"))
  let t4143 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4142 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4140 = @term_syntax.parse_term("(r : List[Cart[Real, 2]])")
  let t4141 = @tactics.spec_tac(@term_syntax.parse_term("(r : List[Cart[Real, 2]])"), t4140)
  let t4139 = @tactics.repeat_tac(@tactics.pop_assum(fn(x4136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4137 = @tactics.mp_tac(x4136)
    fn(x4138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4137(x4138)
    }
  }))
  let t4168 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x4135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4133 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4130 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.all_tac
      })(((x4132 : @kernel.Term) => @lib.check(fn(x4131 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x4131)
      }, x4132))(x4133))
    })((fn(x4134 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x4134)
    })(x4135))
  })), t4139), t4141), t4142), t4143), t4144), t4145), t4146), t4147), t4148), t4149), t4150), t4151), t4155), t4159), t4160), t4161), t4162), t4163), t4164), t4165), t4167])
  let t4129 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= LENGTH((r : List[Cart[Real, 2]]))"), fn(x4126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4127 = @tactics.assume_tac(x4126)
    fn(x4128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4127(x4128)
    }
  })
  let t4124 = @tactics.undisch_then(@term_syntax.parse_term("2 <= LENGTH((q : List[Cart[Real, 2]]))"), fn(x4123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t4122 = @simp.asm_rewrite_tac(@list.List([@topology.segment_open_subset_closed(), @convex.segment_eq_empty()]))
  let t4121 = @simp.rewrite_tac(@list.List([@paths.inside_no_overlap()]))
  let t4120 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(inside(UNION((s' : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))), UNION(s', t)) == {} && !((s : (Cart[Real, _]) -> Bool) == {}) && SUBSET(s, s') → !SUBSET(s, inside(UNION(s', t)))")))
  let t4119 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_image_linepath(), @paths.pathfinish_linepath()]))
  let t4118 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment(((a : Cart[Real, 2]), (b : Cart[Real, 2]))), inside(path_image(op_plus_plus(linepath((a, b)), polygonal_path((r : List[Cart[Real, 2]]))))))"))
  let t4117 = @tactics.undisch_then(@term_syntax.parse_term("(a1 : Cart[Real, 2]) == (b : Cart[Real, 2])"), fn(x4114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4115 = @tactics.subst_all_tac(x4114)
    fn(x4116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4115(x4116)
    }
  })
  let t4113 = @tactics.undisch_then(@term_syntax.parse_term("(a0 : Cart[Real, 2]) == (a : Cart[Real, 2])"), fn(x4110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4111 = @tactics.subst_all_tac(x4110)
    fn(x4112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4111(x4112)
    }
  })
  let t4109 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4108 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t4107 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("3 <= SUC(SUC(SUC((n : Num))))"))]))
  let t4106 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4105 = @tactics.x_gen_tac(@term_syntax.parse_term("(a1 : Cart[Real, 2])"))
  let t4104 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4103 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4102 = @tactics.x_gen_tac(@term_syntax.parse_term("(a0 : Cart[Real, 2])"))
  let t4101 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4100 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t4098 = @term_syntax.parse_term("(q : List[Cart[Real, 2]])")
  let t4099 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]])"), t4098)
  let t4097 = @tactics.repeat_tac(@tactics.pop_assum(fn(x4094 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4095 = @tactics.mp_tac(x4094)
    fn(x4096 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4095(x4096)
    }
  }))
  let t4125 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x4093 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4091 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4088 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.all_tac
      })(((x4090 : @kernel.Term) => @lib.check(fn(x4089 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x4089)
      }, x4090))(x4091))
    })((fn(x4092 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x4092)
    })(x4093))
  })), t4097), t4099), t4100), t4101), t4102), t4103), t4104), t4105), t4106), t4107), t4108), t4109), t4113), t4117), t4118), t4119), t4120), t4121), t4122), t4124])
  let t4087 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= LENGTH((q : List[Cart[Real, 2]]))"), fn(x4084 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4085 = @tactics.assume_tac(x4084)
    fn(x4086 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4085(x4086)
    }
  })
  let t4078 = @term_syntax.parse_term("simple_path(polygonal_path((p : List[Cart[Real, 2]])))")
  let t4079 = @term_syntax.parse_term("UNION(set_of_list((q : List[Cart[Real, 2]])), set_of_list((r : List[Cart[Real, 2]]))) == set_of_list((p : List[Cart[Real, 2]]))")
  let t4080 = @term_syntax.parse_term("HD((p : List[Cart[Real, 2]])) == (a : Cart[Real, 2])")
  let t4081 = @term_syntax.parse_term("MEM((b : Cart[Real, 2]), (p : List[Cart[Real, 2]]))")
  let t4082 = @term_syntax.parse_term("MEM((a : Cart[Real, 2]), (p : List[Cart[Real, 2]]))")
  let t4083 = @tactics.map_every(fn(x4077 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4072 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      fn(x4073 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4074 = @tactics.undisch_then(x4072, x4073)
        fn(x4075 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4074(x4075)
        }
      }
    })(x4077)(fn(x4076 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })
  }, @list.List([@term_syntax.parse_term("∀ x : Cart[Real, 2], MEM(x, (p : List[Cart[Real, 2]])) → integral_vector(x)"), t4082, t4081, t4080, t4079, t4078]))
  let t4071 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t4070 = @tactics.subgoal_then(@term_syntax.parse_term("integral_vector((a : Cart[Real, 2])) && integral_vector((b : Cart[Real, 2]))"), @tactics.strip_assume_tac)
  let t4069 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == LENGTH((p : List[Cart[Real, 2]]))"))
  let t4067 = @simp.asm_rewrite_tac(@list.List([@sets.in_union()]))
  let t4066 = @tactics.undisch_then(@term_syntax.parse_term("UNION(set_of_list((q : List[Cart[Real, 2]])), set_of_list((r : List[Cart[Real, 2]]))) == set_of_list((p : List[Cart[Real, 2]]))"), fn(x4065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4062 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4063 = @tactics.subst_all_tac(x4062)
      fn(x4064 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4063(x4064)
      }
    })(@equal.sym(x4065))
  })
  let t4061 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), @sets.in_union()]))
  let t4060 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4059 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4068 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list())])), t4059), t4060), t4061), t4066), t4067), @tactics.all_tac])
  let t4058 = @tactics.subgoal_then(@term_syntax.parse_term("(∀ x : Cart[Real, 2], MEM(x, (q : List[Cart[Real, 2]])) → integral_vector(x)) && (∀ x : Cart[Real, 2], MEM(x, (r : List[Cart[Real, 2]])) → integral_vector(x))"), @tactics.strip_assume_tac)
  let t4057 = @tactics.undisch_then(@term_syntax.parse_term("path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]])))) == path_image(polygonal_path((p : List[Cart[Real, 2]])))"), fn(x4056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4054 = @tactics.subst_all_tac(x4053)
      fn(x4055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4054(x4055)
      }
    })(@equal.sym(x4056))
  })
  let t4052 = @tactics.undisch_then(@term_syntax.parse_term("pathfinish(polygonal_path((p : List[Cart[Real, 2]]))) == (a : Cart[Real, 2])"), fn(x4049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4050 = @tactics.subst_all_tac(x4049)
    fn(x4051 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4050(x4051)
    }
  })
  let t4047 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t4046 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path()]))
  let t4048 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("5 <= LENGTH((p : List[Cart[Real, 2]]))")), t4046), @class.cond_cases_tac), t4047), @tactics.all_tac])
  let t4045 = @tactics.subgoal_then(@term_syntax.parse_term("pathstart(polygonal_path((p : List[Cart[Real, 2]]))) == (a : Cart[Real, 2])"), fn(x4042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4043 = @tactics.subst_all_tac(x4042)
    fn(x4044 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4043(x4044)
    }
  })
  let t4038 = @sets.set_tac(@list.List([]))
  let t4037 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_join(), @paths.pathfinish_linepath()]))
  let t4036 = @tactics.undisch_then(@term_syntax.parse_term("path_image(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]])))) == path_image(polygonal_path(CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]])))))"), fn(x4035 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4033 = @tactics.subst1_tac(x4032)
      fn(x4034 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4033(x4034)
      }
    })(@equal.sym(x4035))
  })
  let t4031 = @simp.simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_linepath(), @lists.not_cons_nil(), @lists.hd(), pathstart_polygonal_path()]))
  let t4039 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.pathfinish_join(), @paths.pathfinish_linepath()])), t4031), t4036), t4037), t4038)
  let t4028 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t4025 = @drule.match_mp(@paths.arc_distinct_ends())
  let t4027 = @tactics.first_x_assum(fn(x4026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4022 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4023 = @tactics.mp_tac(x4022)
      fn(x4024 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4023(x4024)
      }
    })(t4025(x4026))
  })
  let t4021 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t4020 = @tactics.match_mp_tac(@paths.simple_path_imp_arc())
  let t4019 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@paths.arc_join_eq(), @paths.pathfinish_linepath(), @paths.pathstart_join()]))])
  let t4018 = @tactics.subgoal_then(@term_syntax.parse_term("arc(op_plus_plus(polygonal_path((q : List[Cart[Real, 2]])), polygonal_path((r : List[Cart[Real, 2]]))))"), fn(x4015 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4016 = @tactics.mp_tac(x4015)
    fn(x4017 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4016(x4017)
    }
  })
  let t4014 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t4013 = @simp.asm_simp_tac(@list.List([@paths.arc_join_eq(), @paths.pathfinish_linepath(), @paths.pathstart_join()]))
  let t4012 = @simp.asm_simp_tac(@list.List([@paths.simple_path_eq_arc(), @paths.pathstart_join(), @paths.pathstart_linepath(), @paths.pathfinish_join()]))
  let t4011 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t4029 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(pathfinish(polygonal_path(CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]]))))) == (a : Cart[Real, 2]))"), fn(x4008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4009 = @tactics.assume_tac(x4008)
    fn(x4010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4009(x4010)
    }
  }), t4011), t4012), t4013), t4014), @tactics.strip_tac), t4018), t4019), t4020), t4021), t4027), t4028)
  let t4007 = @meson.asm_meson_tac(@list.List([@paths.arc_linepath_eq()]))
  let t4006 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t4005 = @tactics.match_mp_tac(@paths.simple_path_imp_arc())
  let t4004 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.pathfinish_linepath(), @paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath()]))
  let t4003 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t4030 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("pathfinish(polygonal_path(CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]]))))) == (a : Cart[Real, 2])"), fn(x4000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4001 = @tactics.assume_tac(x4000)
    fn(x4002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4001(x4002)
    }
  }), t4003), t4004), @tactics.strip_tac), t4005), t4006), t4007), t4029])
  let t3999 = @class.asm_cases_tac(@term_syntax.parse_term("pathfinish(polygonal_path((r : List[Cart[Real, 2]]))) == (a : Cart[Real, 2])"))
  let t3998 = @tactics.undisch_tac(@term_syntax.parse_term("simple_path(op_plus_plus(linepath(((a : Cart[Real, 2]), (x : Cart[Real, 2]))), polygonal_path(CONS(x, CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]]))))))"))
  let t3997 = @tactics.disch_then(fn(x3996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3993 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3994 = @tactics.subst1_tac(x3993)
      fn(x3995 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3994(x3995)
      }
    })(@equal.sym(x3996))
  })
  let t3992 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t3991 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3986 = @drule.part_match(fn(x3985 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x3985))
  }, @paths.simple_path_assoc())
  let t4040 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x3990 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3989 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3987 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s3983 = @tactics.mp_tac(x3982)
          fn(x3984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s3983(x3984)
          }
        })(t3986(x3987))
      })((fn(x3988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3988.1
      })(x3989))
    })(x3990)(x3990)
  }, t3991), t3992), t3997), t3998), t3999), t4030), t4039])
  let t3981 = @list.List([@simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()])), @tactics.all_tac])
  let t3980 = @tactics.subgoal_then(@term_syntax.parse_term("pathstart(polygonal_path(CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]]))))) == x"), fn(x3977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3977
    let t3979 = @tactics.assume_tac(th_1)
    @tactics.then_tac(@tactics.subst_all_tac(th_1), t3979)
  })
  let t3975 = @simp.simp_tac(@list.List([pathstart_polygonal_path(), @lists.hd(), @lists.not_cons_nil()]))
  let t3974 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith(), polygonal_path()]))
  let t3973 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3972 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3971 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3970 = @tactics.pop_assum_list(fn(x3969 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t3967 = @term_syntax.parse_term("(q : List[Cart[Real, 2]])")
  let t3968 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Cart[Real, 2]])"), t3967)
  let t3966 = @term_syntax.parse_term("2 <= LENGTH((q : List[Cart[Real, 2]]))")
  let t3976 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x3963 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3964 = @tactics.undisch_tac(x3963)
    fn(x3965 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3964(x3965)
    }
  }, @list.List([@term_syntax.parse_term("pathstart(polygonal_path((q : List[Cart[Real, 2]]))) == pathstart(polygonal_path(CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]])))))"), t3966])), t3968), t3970), t3971), t3972), @tactics.gen_tac), t3973), t3974), t3975), @tactics.all_tac])
  let t3962 = @tactics.subgoal_then(@term_syntax.parse_term("polygonal_path(CONS((a : Cart[Real, 2]), (q : List[Cart[Real, 2]]))) == op_plus_plus(linepath((a, (x : Cart[Real, 2]))), polygonal_path(q))"), fn(x3959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3960 = @tactics.subst1_tac(x3959)
    fn(x3961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3960(x3961)
    }
  })
  let t3957 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3956 = @tactics.undisch_tac(@term_syntax.parse_term("2 <= LENGTH((q : List[Cart[Real, 2]]))"))
  let t3955 = @simp.rewrite_tac(@list.List([pathfinish_polygonal_path(), @lists.last(), @lists.not_cons_nil()]))
  let t3958 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("pathfinish(polygonal_path((q : List[Cart[Real, 2]]))) == (b : Cart[Real, 2])")), t3955), t3956), @class.cond_cases_tac), t3957), @tactics.all_tac])
  let t3954 = @list.List([@simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()])), @tactics.all_tac])
  let t3953 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.set_of_list(), @sets.set_rule(@term_syntax.parse_term("UNION(INSERT((a : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == INSERT(a, UNION(s, t))"))])), @tactics.all_tac])
  let t3952 = @tactics.replicate_tac(2, @tactics.thenl(@tactics.conj_tac, @list.List([@int.asm_arith_tac, @tactics.all_tac])))
  let t3951 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @lists.not_cons_nil(), @lists.hd()]))
  let t3949 = @term_syntax.parse_term("(r : List[Cart[Real, 2]])")
  let t3950 = @tactics.map_every(fn(x3946 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3947 = @tactics.exists_tac(x3946)
    fn(x3948 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3947(x3948)
    }
  }, @list.List([@term_syntax.parse_term("CONS((a : Cart[Real, 2]), (q : List[Cart[Real, 2]]))"), t3949]))
  let t3944 = @term_syntax.parse_term("(r : List[Cart[Real, 2]])")
  let t3945 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : List[Cart[Real, 2]])"), t3944]))
  let t3943 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3941 = @simp.simp_tac(@list.List([@paths.pathfinish_linepath(), @paths.arc_imp_simple_path()]))
  let t3940 = @simp.asm_rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t3937 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@paths.simple_path_join_imp()))
  let t3939 = @tactics.first_assum(fn(x3938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3934 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3935 = @tactics.mp_tac(x3934)
      fn(x3936 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3935(x3936)
      }
    })(t3937(x3938))
  })
  let t3933 = @simp.asm_rewrite_tac(@list.List([]))
  let t3932 = @simp.once_rewrite_tac(@list.List([@lists.mem()]))
  let t3942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= SUC(SUC((n : Num)))"))])), t3932), t3933), t3939), t3940), t3941), @tactics.all_tac])
  let t3931 = @simp.rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)"))]))
  let t3927 = @term_syntax.parse_term("CONS((x : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]])))")
  let t3930 = @tactics.first_x_assum(fn(x3929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3925 = @tactics.mp_tac(x3924)
      fn(x3926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3925(x3926)
      }
    })(((x3928 : @kernel.Thm) => @bool.spec(t3927, x3928))(x3929))
  })
  let t3922 = @sets.set_tac(@list.List([]))
  let t3921 = @simp.rewrite_tac(@list.List([@sets.set_of_list()]))
  let t3920 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@int.arith_tac, @tactics.all_tac])))
  let t3919 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3918 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), @lists.not_cons_nil(), @lists.hd()]))
  let t3917 = @simp.asm_rewrite_tac(@list.List([polygonal_path(), @lists.length()]))
  let t3916 = @tactics.exists_tac(@term_syntax.parse_term("CONS((b : Cart[Real, 2]), CONS((y : Cart[Real, 2]), (l : List[Cart[Real, 2]])))"))
  let t3915 = @tactics.exists_tac(@term_syntax.parse_term("[(a : Cart[Real, 2]), (b : Cart[Real, 2])]"))
  let t3923 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3912 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3909 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.all_tac
      })(((x3911 : @kernel.Term) => @lib.check(fn(x3910 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x3910)
      }, x3911))(x3912))
    })((fn(x3913 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x3913)
    })(x3914))
  }), @tactics.strip_tac), t3915), t3916), t3917), t3918), t3919), t3920), t3921), t3922), @tactics.all_tac])
  let t3908 = @simp.asm_rewrite_tac(@list.List([]))
  let t3907 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t3906 = @simp.once_rewrite_tac(@list.List([@lists.mem()]))
  let t3905 = @simp.asm_rewrite_tac(@list.List([]))
  let t3904 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t3903 = @simp.once_rewrite_tac(@list.List([@lists.mem()]))
  let t3902 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3901 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join()]))
  let t3900 = @simp.rewrite_tac(@list.List([polygonal_path()]))
  let t3899 = @tactics.replicate_tac(3, @tactics.disch_then(fn(x3898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t3896 = @term_syntax.parse_term("(l : List[Cart[Real, 2]])")
  let t3897 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Cart[Real, 2])"), t3896]))
  let t3894 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3893 = @meson.meson_tac(@list.List([]))
  let t3895 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_linepath(), @paths.pathfinish_linepath(), @lists.mem()])), t3893), t3894])
  let t3892 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3891 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t3890 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3889 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3888 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t3887 = @simp.rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3886 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3884 = @term_syntax.parse_term("(p : List[Cart[Real, 2]])")
  let t3885 = @tactics.spec_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]])"), t3884)
  let t3883 = @tactics.pop_assum(fn(x3880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3881 = @tactics.mp_tac(x3880)
    fn(x3882 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3881(x3882)
    }
  })
  let t3879 = @wf.wf_induct_tac(@term_syntax.parse_term("LENGTH((p : List[Cart[Real, 2]]))"))
  let t3877 = @tactics.pop_assum_list(fn(x3876 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t3875 = @meson.asm_meson_tac(@list.List([@lists.mem()]))
  let t3874 = @simp.asm_rewrite_tac(@list.List([]))
  let t3873 = @simp.asm_rewrite_tac(@list.List([pathstart_polygonal_path(), @theorems.conj_assoc()]))
  let t3878 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("5 <= (p : Num) → 2 <= p"))])), t3873), @class.cond_cases_tac), t3874), t3875), t3877])
  let t4041 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("simple_path(polygonal_path((p : List[Cart[Real, 2]]))) && 2 <= LENGTH(p) && MEM((b : Cart[Real, 2]), p) && !(pathstart(polygonal_path(p)) == b) && !(pathfinish(polygonal_path(p)) == b)"), fn(x3870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3871 = @tactics.mp_tac(x3870)
    fn(x3872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3871(x3872)
    }
  }), t3878), t3879), t3883), t3885), t3886), t3887), t3888), t3889), t3890), t3891), t3892), @tactics.conj_tac), t3895), t3897), t3899), @tactics.disch_tac), t3900), t3901), t3902), t3903), t3904), t3905), t3906), t3907), t3908), t3923), @tactics.strip_tac), t3930), t3931), @tactics.ants_tac), t3942), t3943), t3945), @tactics.strip_tac), t3950), t3951), t3952), @tactics.conj_tac), t3953), @tactics.conj_tac), t3954), @tactics.conj_tac), t3958), t3962), t3976), t3980), t3981), @tactics.conj_tac), t4040), @tactics.all_tac])
  let t3869 = @tactics.subgoal_then(@term_syntax.parse_term("∃ q : List[Cart[Real, 2]], ∃ r : List[Cart[Real, 2]], 2 <= LENGTH(q) && 2 <= LENGTH(r) && LENGTH(q) + LENGTH(r) == LENGTH((p : List[Cart[Real, 2]])) + 1 && UNION(set_of_list(q), set_of_list(r)) == set_of_list(p) && pathstart(polygonal_path(q)) == pathstart(polygonal_path(p)) && pathfinish(polygonal_path(q)) == (b : Cart[Real, 2]) && pathstart(polygonal_path(r)) == b && pathfinish(polygonal_path(r)) == pathfinish(polygonal_path(p)) && simple_path(op_plus_plus(polygonal_path(q), polygonal_path(r))) && path_image(op_plus_plus(polygonal_path(q), polygonal_path(r))) == path_image(polygonal_path(p))"), @tactics.strip_assume_tac)
  let t3867 = @term_syntax.parse_term("(p : List[Cart[Real, 2]])")
  let t3868 = @tactics.spec_tac(@term_syntax.parse_term("(p' : List[Cart[Real, 2]])"), t3867)
  let t3866 = @tactics.pop_assum_list(fn(x3865 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3863 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3860 = @tactics.mp_tac(x3859)
        fn(x3861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3860(x3861)
        }
      })(((x3862 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x3862))(x3863))
    })((fn(x3864 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      @lib.rev(x3864)
    })(x3865))
  })
  let t3857 = @term_syntax.parse_term("pathfinish(polygonal_path((p : List[Cart[Real, 2]]))) == pathstart(polygonal_path(p))")
  let t3858 = @tactics.map_every(fn(x3856 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3851 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      fn(x3852 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3853 = @tactics.undisch_then(x3851, x3852)
        fn(x3854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3853(x3854)
        }
      }
    })(x3856)(fn(x3855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })
  }, @list.List([@term_syntax.parse_term("simple_path(polygonal_path((p : List[Cart[Real, 2]])))"), t3857]))
  let t3848 = @term_syntax.parse_term("LENGTH((p' : List[Cart[Real, 2]])) == LENGTH((p : List[Cart[Real, 2]]))")
  let t3849 = @term_syntax.parse_term("path_image(polygonal_path((p' : List[Cart[Real, 2]]))) == path_image(polygonal_path((p : List[Cart[Real, 2]])))")
  let t3850 = @tactics.map_every(fn(x3847 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3839 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      fn(x3840 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3841 = @tactics.undisch_then(x3839, x3840)
        fn(x3842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3841(x3842)
        }
      }
    })(x3847)(fn(x3846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3844 = @tactics.subst_all_tac(x3843)
        fn(x3845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3844(x3845)
        }
      })(@equal.sym(x3846))
    })
  }, @list.List([@term_syntax.parse_term("set_of_list((p' : List[Cart[Real, 2]])) == set_of_list((p : List[Cart[Real, 2]]))"), t3849, t3848]))
  let t3838 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list())])), @tactics.all_tac])
  let t3837 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], MEM(x, (p : List[Cart[Real, 2]])) == MEM(x, (p' : List[Cart[Real, 2]]))"), fn(x3834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3834
    let t3836 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th])))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([th])), t3836)
  })
  let t3829 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3828 = @simp.asm_rewrite_tac(@list.List([]))
  let t3830 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"), simple_path_polygonal_path_rotate())), t3828), t3829), @int.asm_arith_tac)
  let t3825 = @simp.asm_simp_tac(@list.List([@lists.last_el()]))
  let t3826 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("LENGTH((t : List[Cart[Real, 2]])) - 1")), t3825), @int.asm_arith_tac)
  let t3824 = @simp.rewrite_tac(@list.List([@lists.el()]))
  let t3827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t3824), @int.asm_arith_tac), t3826])
  let t3823 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem_exists_el(), @lists.length()]))
  let t3822 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3821 = @tactics.undisch_tac(@term_syntax.parse_term("5 <= LENGTH(CONS((h : Cart[Real, 2]), (t : List[Cart[Real, 2]])))"))
  let t3820 = @simp.rewrite_tac(@list.List([@lists.last()]))
  let t3819 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t3818 = @simp.asm_rewrite_tac(@list.List([@lists.last()]))
  let t3817 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) && IN((b : _), s) → UNION(s, {a}) == INSERT(b, s)")))
  let t3816 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3815 = @simp.rewrite_tac(@list.List([@sets.set_of_list_append(), @sets.set_of_list()]))
  let t3814 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl(), @lists.append()]))
  let t3812 = @term_syntax.parse_term("(l : List[Cart[Real, 2]])")
  let t3813 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"), t3812)
  let t3811 = @simp.asm_rewrite_tac(@list.List([]))
  let t3809 = @term_syntax.parse_term("!((l : List[Cart[Real, 2]]) == NIL)")
  let t3810 = @term_syntax.parse_term("5 <= LENGTH((p : List[Cart[Real, 2]]))")
  let t3831 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x3806 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3807 = @tactics.undisch_tac(x3806)
    fn(x3808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3807(x3808)
    }
  }, @list.List([@term_syntax.parse_term("HD((l : List[Cart[Real, 2]])) == LAST(l)"), t3810, t3809])), t3811), t3813), @lists.list_induct_tac), t3814), t3815), t3816), t3817), t3818), t3819), t3820), t3821), @class.cond_cases_tac), t3822), t3823), @tactics.disch_tac), @tactics.conj_tac), t3827)
  let t3805 = @simp.asm_rewrite_tac(@list.List([]))
  let t3832 = @list.List([@int.asm_arith_tac, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(path_image_polygonal_path_rotate()), t3805), @int.asm_arith_tac), t3831, t3830])
  let t3804 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3803 = @simp.asm_rewrite_tac(@list.List([@lists.last(), @lists.hd_append(), @lists.length()]))
  let t3802 = @simp.asm_simp_tac(@list.List([@lists.last_append(), @lists.length_append(), @lists.length_tl(), @lists.not_cons_nil()]))
  let t3800 = @simp.asm_simp_tac(@list.List([@lists.length(), @lists.length_tl()]))
  let t3797 = @term_syntax.parse_term("(LENGTH : (List[Cart[Real, 2]]) -> Num)")
  let t3801 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3795 = @tactics.mp_tac(x3794)
      fn(x3796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3795(x3796)
      }
    })(((x3798 : @kernel.Thm) => @equal.ap_term(t3797, x3798))(x3799))
  }), t3800), @int.asm_arith_tac), @tactics.all_tac])
  let t3793 = @tactics.subgoal_then(@term_syntax.parse_term("!(TL((l : List[Cart[Real, 2]])) == NIL)"), fn(x3790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3791 = @tactics.assume_tac(x3790)
    fn(x3792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3791(x3792)
    }
  })
  let t3789 = @simp.asm_rewrite_tac(@list.List([]))
  let t3788 = @tactics.disch_then(fn(x3787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x3787))
  })
  let t3786 = @simp.asm_rewrite_tac(@list.List([]))
  let t3785 = @list.List([@meson.asm_meson_tac(@list.List([@lists.length_eq_nil()])), @tactics.all_tac])
  let t3784 = @class.asm_cases_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]]) == NIL"))
  let t3783 = @simp.rewrite_tac(@list.List([@lists.append_eq_nil(), @lists.not_cons_nil()]))
  let t3782 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Cart[Real, 2]])"))
  let t3781 = @simp.asm_rewrite_tac(@list.List([]))
  let t3780 = @simp.asm_rewrite_tac(@list.List([pathstart_polygonal_path(), pathfinish_polygonal_path()]))
  let t3779 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @calc_num.arith()]))
  let t3778 = @class.asm_cases_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]]) == NIL"))
  let t3776 = @term_syntax.parse_term("5 <= LENGTH((p : List[Cart[Real, 2]]))")
  let t3777 = @tactics.map_every(fn(x3773 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3774 = @tactics.undisch_tac(x3773)
    fn(x3775 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3774(x3775)
    }
  }, @list.List([@term_syntax.parse_term("pathfinish(polygonal_path((p : List[Cart[Real, 2]]))) == pathstart(polygonal_path(p))"), t3776]))
  let t3771 = @simp.asm_simp_tac(@list.List([@lists.length()]))
  let t3770 = @simp.rewrite_tac(@list.List([pathstart_polygonal_path(), pathfinish_polygonal_path()]))
  let t3772 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("5 <= (p : Num) → 3 <= p"))])), t3770), @tactics.gen_tac), @class.cond_cases_tac), t3771), @int.asm_arith_tac), @tactics.all_tac])
  let t3769 = @simp.asm_rewrite_tac(@list.List([]))
  let t3768 = @tactics.exists_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]])"))
  let t3833 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(rotate_list_to_front_0()), t3768), t3769), @tactics.conj_tac), t3772), t3777), t3778), t3779), t3780), @tactics.disch_tac), @tactics.disch_tac), t3781), t3782), t3783), t3784), t3785), t3786), t3788), t3789), t3793), t3801), t3802), t3803), t3804), t3832), @tactics.all_tac])
  let t3767 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p' : List[Cart[Real, 2]], HD(p') == (a : Cart[Real, 2]) && LENGTH(p') == LENGTH((p : List[Cart[Real, 2]])) && path_image(polygonal_path(p')) == path_image(polygonal_path(p)) && set_of_list(p') == set_of_list(p) && simple_path(polygonal_path(p')) && pathfinish(polygonal_path(p')) == pathstart(polygonal_path(p'))"), @tactics.strip_assume_tac)
  let t3765 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t3766 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t3765]))
  let t3764 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3763 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : List[Cart[Real, 2]])"), polygon_chop_in_two()))
  let t3761 = @simp.asm_rewrite_tac(@list.List([@convex.finite_segment(), @sets.finite_insert(), @sets.finite_empty()]))
  let t3758 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t3760 = @tactics.disch_then(fn(x3759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3756 = @tactics.mp_tac(x3755)
      fn(x3757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3756(x3757)
      }
    })(t3758(x3759))
  })
  let t3751 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), {(a : Cart[Real, 2]), b})"))
  let t3752 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment([((c : Cart[Real, 2]), (a : Cart[Real, 2]))]), {c})"))
  let t3753 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), {c})"))
  let t3750 = @simp.rewrite_tac(@list.List([@topology.segment_sym(), @theorems.disj_aci()]))
  let t3749 = @simp.rewrite_tac(@list.List([@convex.subset_segment(), @topology.between_in_segment(), @topology.ends_in_segment()]))
  let t3746 = @simp.gen_rewrite_rule(fn(x3745 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3745
  }, @list.List([@vectors.collinear_between_cases()]))
  let t3748 = @tactics.first_x_assum(fn(x3747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3743 = @tactics.mp_tac(x3742)
      fn(x3744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3743(x3744)
      }
    })(t3746(x3747))
  })
  let t3741 = @sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == t) == SUBSET(t, s)"))
  let t3754 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == s) == SUBSET(s, t)")), t3741])), t3748), t3749), t3750), t3753, t3752, t3751])
  let t3739 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x3736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3737 = @tactics.subst_all_tac(x3736)
    fn(x3738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3737(x3738)
    }
  })
  let t3740 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(segment([((b : Cart[Real, 2]), (c : Cart[Real, 2]))]), segment([(c, (a : Cart[Real, 2]))])) == segment([(b, c)]) || INTER(segment([(b, c)]), segment([(c, a)])) == segment([(c, a)]) || INTER(segment([(a, b)]), segment([(b, c)])) == segment([(b, c)])"), t3739)
  let t3735 = @simp.rewrite_tac(@list.List([@sets.union_subset()]))
  let t3734 = @simp.rewrite_tac(@list.List([@sets.union_over_inter()]))
  let t3733 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t3732 = @simp.asm_rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t3731 = @simp.asm_simp_tac(@list.List([pick_triangle()]))
  let t3730 = @simp.simp_tac(@list.List([@measure.measure_interior(), @measure.negligible_convex_frontier(), @convex.convex_convex_hull(), @convex.finite_imp_bounded_convex_hull(), @sets.finite_insert(), @sets.finite_empty()]))
  let t3729 = @simp.rewrite_tac(@list.List([@equal.gsym(@polytope.frontier_of_triangle())]))
  let t3728 = @simp.rewrite_tac(@list.List([@polytope.inside_of_triangle()]))
  let t3727 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t3726 = @simp.simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.path_image_join(), @paths.pathstart_linepath(), @paths.arc_join_eq(), @paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathfinish_linepath()]))
  let t3725 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x3722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3723 = @tactics.mp_tac(x3722)
    fn(x3724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3723(x3724)
    }
  }))
  let t3721 = @tactics.first_x_assum(fn(x3718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3719 = @tactics.subst1_tac(x3718)
    fn(x3720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3719(x3720)
    }
  })
  let t3717 = @simp.asm_rewrite_tac(@list.List([]))
  let t3716 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Cart[Real, 2]) == (a : Cart[Real, 2])"))
  let t3715 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3714 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t3713 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), @sets.set_of_list()]))
  let t3712 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.pathstart_join(), @paths.pathfinish_join()]))
  let t3710 = @simp.rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("!(SUC(SUC(SUC(SUC(SUC((n : Num)))))) <= 4)"))]))
  let t3711 = @list.List([@tactics.replicate_tac(5, @tactics.disch_then(fn(x3709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })), t3710])
  let t3708 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3707 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Cart[Real, 2])"))
  let t3705 = @simp.asm_rewrite_tac(@list.List([@convex.finite_segment(), @sets.finite_insert(), @sets.finite_empty()]))
  let t3702 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t3704 = @tactics.disch_then(fn(x3703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3700 = @tactics.mp_tac(x3699)
      fn(x3701 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3700(x3701)
      }
    })(t3702(x3703))
  })
  let t3698 = @simp.rewrite_tac(@list.List([@sets.inter_idempot()]))
  let t3696 = @bool.conjunct1(@topology.segment_sym())
  let t3695 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t3697 = @tactics.subst1_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t3695]), t3696))
  let t3694 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath()]))
  let t3693 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x3687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3688 = @tactics.assume_tac(x3687)
    fn(x3689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3688(x3689)
    }
  }, fn(x3690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3691 = @tactics.mp_tac(x3690)
    fn(x3692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3691(x3692)
    }
  })))
  let t3686 = @simp.rewrite_tac(@list.List([@paths.arc_linepath_eq()]))
  let t3685 = @simp.asm_simp_tac(@list.List([@paths.simple_path_join_loop_eq(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3684 = @simp.asm_rewrite_tac(@list.List([]))
  let t3683 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Cart[Real, 2]) == (a : Cart[Real, 2])"))
  let t3682 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t3681 = @simp.rewrite_tac(@list.List([polygonal_path()]))
  let t3706 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(4, @tactics.disch_then(fn(x3680 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })), t3681), t3682), t3683), t3684), t3685), t3686), t3693), t3694), t3697), t3698), t3704), t3705), @tactics.all_tac])
  let t3679 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3678 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))
  let t3676 = @meson.meson_tac(@list.List([]))
  let t3677 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([polygonal_path(), @paths.simple_path_linepath_eq(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()])), t3676), @tactics.all_tac])
  let t3675 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3674 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))
  let t3673 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.simple_path_linepath_eq()]))
  let t3672 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3671 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t3670 = @simp.rewrite_tac(@list.List([polygonal_path(), @paths.simple_path_linepath_eq()]))
  let t3669 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t3667 = @term_syntax.parse_term("(p : List[Cart[Real, 2]])")
  let t3668 = @tactics.spec_tac(@term_syntax.parse_term("(p : List[Cart[Real, 2]])"), t3667)
  let t3666 = @tactics.pop_assum(fn(x3665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t3762 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("LENGTH((p : List[Cart[Real, 2]])) <= 4")), t3666), t3668), t3669), t3670), t3671), t3672), t3673), t3674), t3675), @tactics.conj_tac), t3677), t3678), t3679), @tactics.conj_tac), t3706), t3707), t3708), @tactics.conj_tac), t3711), t3712), t3713), t3714), t3715), t3716), t3717), t3721), t3725), t3726), t3727), t3728), t3729), t3730), t3731), @class.cond_cases_tac), t3732), t3733), t3734), t3735), @tactics.strip_tac), t3740), t3754), t3760), t3761), @tactics.strip_tac])
  let t3664 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("LENGTH((p : List[Cart[Real, 2]])) <= 4 || 5 <= LENGTH(p)")))
  let t4394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @wf.wf_induct_tac(@term_syntax.parse_term("LENGTH((p : List[Cart[Real, 2]]))"))), t3664), t3762), t3763), t3764), t3766), @tactics.strip_tac), t3767), t3833), t3837), t3838), t3850), t3858), t3866), t3868), @tactics.gen_tac), @tactics.strip_tac), t3869), t4041), t4045), t4048), t4052), t4057), t4058), t4068), t4069), t4070), t4071), t4083), t4087), t4125), t4129), t4168), t4172), t4173), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4177), t4190), @tactics.ants_tac), t4204), t4205), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4209), t4222), @tactics.ants_tac), t4235), t4240), t4241), @tactics.ants_tac), t4266), t4277), t4278), t4279), t4280), t4283), t4284), t4285), t4286), t4287), t4288), @tactics.conj_tac), t4307), t4308), t4309), @tactics.conj_tac), t4314), t4315), t4316), t4317), t4321), t4335), t4336), t4337), t4338), t4346), t4347), t4348), t4353), t4358), t4362), t4377), t4378), t4379), t4380), t4381), t4382), t4386), t4389), t4390), t4391), t4392), t4393)
  pick_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Cart[Real, 2]], (∀ x : Cart[Real, 2], MEM(x, p) → integral_vector(x)) && simple_path(polygonal_path(p)) && pathfinish(polygonal_path(p)) == pathstart(polygonal_path(p)) → measure(inside(path_image(polygonal_path(p)))) == real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, inside(path_image(polygonal_path(p)))) && integral_vector(x)})) + (real_of_num(CARD({(x : Cart[Real, 2]) | IN(x, path_image(polygonal_path(p))) && integral_vector(x)})) / real_of_num(2) - real_of_num(1))"), t4394))
}

///|
let pick_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PICK")

///|
/// `PICK`
pub fn pick() -> @kernel.Thm {
  pick_c.get()
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
}
