// Translated from upstream Tutorial/Vectors.ml; edit this file directly.

///|
/// Tutorial/Vectors.ml:5
fn step_1() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("orthogonal((A : Cart[Real, _]) - (B : Cart[Real, _]), (C : Cart[Real, _]) - B) → pow(norm(C - A), 2) == pow(norm(B - A), 2) + pow(norm(C - B), 2)")))
}

///|
/// Tutorial/Vectors.ml:8
fn step_2() -> Unit raise {
  ignore(@rqe_tactics_ext.e(@solovay.solovay_vector_tac))
}

///|
/// Tutorial/Vectors.ml:9
fn step_3() -> Unit raise {
  ignore(@rqe_tactics_ext.e(@tactics.conv_tac(@calc_rat.real_ring)))
}

///|
/// Tutorial/Vectors.ml:11
fn step_4() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], dot(x, y) <= norm(x) * norm(y)")))
}

///|
/// Tutorial/Vectors.ml:12
fn step_5() -> Unit raise {
  ignore(@rqe_tactics_ext.e(@solovay.solovay_vector_tac))
}

///|
/// FORALL_3
fn step_6() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (i : Num) && i <= 3) == (i == 1 || i == 2 || i == 3)"))]))
  forall_3_c.set(@tactics.prove(@term_syntax.parse_term("(∀ i : Num, 1 <= i && i <= 3 → (P : (Num) -> Bool)(i)) == (P(1) && P(2) && P(3))"), t1))
}

///|
let forall_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_3")

///|
/// `FORALL_3`
pub fn forall_3() -> @kernel.Thm {
  forall_3_c.get()
}

///|
/// SUM_3
fn step_7() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@iterate.sum_sing_numseg(), @calc_num.arith(), @realax.real_add_assoc()]))
  let t2 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), t2, @iterate.sum_clauses_numseg()])), t3)
  sum_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (Num) -> Real, sum(op_dot_dot(1, 3), t) == t(1) + (t(2) + t(3))"), t4))
}

///|
let sum_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_3")

///|
/// `SUM_3`
pub fn sum_3() -> @kernel.Thm {
  sum_3_c.get()
}

///|
/// VECTOR_3
fn step_8() -> Unit raise {
  let t5 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t6 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t5, @lists.el(), @lists.hd(), @lists.tl()]))
  let t7 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.vector(), @cart.lambda_beta(), @cart.dimindex_3(), @lists.length(), @calc_num.arith()])), t6)
  vector_3_c.set(@tactics.prove(@term_syntax.parse_term("(op_dollar : (Cart[Real, 3], Num) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([(x : Real), (y : Real), (z : Real)]), 1) == x && (op_dollar : (Cart[Real, 3], Num) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([x, y, z]), 2) == y && (op_dollar : (Cart[Real, 3], Num) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([x, y, z]), 3) == z"), t7))
}

///|
let vector_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_3")

///|
/// `VECTOR_3`
pub fn vector_3() -> @kernel.Thm {
  vector_3_c.get()
}

///|
/// DOT_VECTOR
fn step_9() -> Unit raise {
  let t8 = @simp.rewrite_tac(@list.List([@vectors.dot(), @cart.dimindex_3(), sum_3(), vector_3()]))
  dot_vector_c.set(@tactics.prove(@term_syntax.parse_term("(dot : (Cart[Real, 3], Cart[Real, 3]) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (y1 : Real), (z1 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(x2 : Real), (y2 : Real), (z2 : Real)])) == x1 * x2 + (y1 * y2 + z1 * z2)"), t8))
}

///|
let dot_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_VECTOR")

///|
/// `DOT_VECTOR`
pub fn dot_vector() -> @kernel.Thm {
  dot_vector_c.get()
}

///|
/// VECTOR_ZERO
fn step_10() -> Unit raise {
  let t9 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), forall_3(), @vectors.vec_component(), vector_3(), @calc_num.arith()]))
  vector_zero_c.set(@tactics.prove(@term_syntax.parse_term("((vector : (List[Real]) -> Cart[Real, 3])([(x : Real), (y : Real), (z : Real)]) == (vec : (Num) -> Cart[Real, 3])(0)) == (x == real_of_num(0) && y == real_of_num(0) && z == real_of_num(0))"), t9))
}

///|
let vector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ZERO")

///|
/// `VECTOR_ZERO`
pub fn vector_zero() -> @kernel.Thm {
  vector_zero_c.get()
}

///|
/// ORTHOGONAL_VECTOR
fn step_11() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), dot_vector()]))
  orthogonal_vector_c.set(@tactics.prove(@term_syntax.parse_term("(orthogonal : (Cart[Real, 3], Cart[Real, 3]) -> Bool)((vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (y1 : Real), (z1 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(x2 : Real), (y2 : Real), (z2 : Real)])) == (x1 * x2 + (y1 * y2 + z1 * z2) == real_of_num(0))"), t10))
}

///|
let orthogonal_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_VECTOR")

///|
/// `ORTHOGONAL_VECTOR`
pub fn orthogonal_vector() -> @kernel.Thm {
  orthogonal_vector_c.get()
}

///|
/// Tutorial/Vectors.ml:68
fn step_12() -> Unit raise {
  @printer.parse_as_infix("cross", (20L, "right"))
}

///|
/// cross
fn step_13() -> Unit raise {
  cross_c.set(@pair.new_definition(@term_syntax.parse_term("(cross : (Cart[Real, 3], Cart[Real, 3]) -> Cart[Real, 3])((a : Cart[Real, 3]), (b : Cart[Real, 3])) == vector([op_dollar(a, 2) * op_dollar(b, 3) - op_dollar(a, 3) * op_dollar(b, 2), op_dollar(a, 3) * op_dollar(b, 1) - op_dollar(a, 1) * op_dollar(b, 3), op_dollar(a, 1) * op_dollar(b, 2) - op_dollar(a, 2) * op_dollar(b, 1)])")))
}

///|
let cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cross")

///|
/// `cross`
pub fn cross() -> @kernel.Thm {
  cross_c.get()
}

///|
/// VEC3_TAC
fn step_14() -> Unit raise {
  let t11 = @tactics.conv_tac(@calc_rat.real_ring)
  vec3_tac_c.set(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), forall_3(), sum_3(), @cart.dimindex_3(), vector_3(), @vectors.vector_add(), @vectors.vec(), @vectors.dot(), cross(), @vectors.orthogonal(), @vectors.basis(), @calc_num.arith()])), t11))
}

///|
let vec3_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VEC3_TAC")

///|
/// `VEC3_TAC`
pub fn vec3_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vec3_tac_c.get())(x)
}

///|
/// `VEC3_RULE`
pub fn vec3_rule(x12 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x12
  @tactics.prove(tm, vec3_tac)
}

///|
/// ORTHOGONAL_CROSS
fn step_15() -> Unit raise {
  orthogonal_cross_c.set(vec3_rule(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], orthogonal(cross(x, y), x) && orthogonal(cross(x, y), y) && orthogonal(x, cross(x, y)) && orthogonal(y, cross(x, y))")))
}

///|
let orthogonal_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_CROSS")

///|
/// `ORTHOGONAL_CROSS`
pub fn orthogonal_cross() -> @kernel.Thm {
  orthogonal_cross_c.get()
}

///|
/// LEMMA_0
fn step_16() -> Unit raise {
  lemma_0_c.set(vec3_rule(@term_syntax.parse_term("!((basis : (Num) -> Cart[Real, 3])(1) == (vec : (Num) -> Cart[Real, 3])(0)) && !((basis : (Num) -> Cart[Real, 3])(2) == (vec : (Num) -> Cart[Real, 3])(0)) && !((basis : (Num) -> Cart[Real, 3])(3) == (vec : (Num) -> Cart[Real, 3])(0))")))
}

///|
let lemma_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_0")

///|
/// `LEMMA_0`
pub fn lemma_0() -> @kernel.Thm {
  lemma_0_c.get()
}

///|
/// LEMMA_1
fn step_17() -> Unit raise {
  lemma_1_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], dot(u, cross(u, v)) == real_of_num(0)")))
}

///|
let lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_1")

///|
/// `LEMMA_1`
pub fn lemma_1() -> @kernel.Thm {
  lemma_1_c.get()
}

///|
/// LEMMA_2
fn step_18() -> Unit raise {
  lemma_2_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], dot(v, cross(u, v)) == real_of_num(0)")))
}

///|
let lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2")

///|
/// `LEMMA_2`
pub fn lemma_2() -> @kernel.Thm {
  lemma_2_c.get()
}

///|
/// LEMMA_3
fn step_19() -> Unit raise {
  lemma_3_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], dot(vec(0), u) == real_of_num(0)")))
}

///|
let lemma_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_3")

///|
/// `LEMMA_3`
pub fn lemma_3() -> @kernel.Thm {
  lemma_3_c.get()
}

///|
/// LEMMA_4
fn step_20() -> Unit raise {
  lemma_4_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], dot(u, vec(0)) == real_of_num(0)")))
}

///|
let lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_4")

///|
/// `LEMMA_4`
pub fn lemma_4() -> @kernel.Thm {
  lemma_4_c.get()
}

///|
/// LEMMA_5
fn step_21() -> Unit raise {
  lemma_5_c.set(vec3_rule(@term_syntax.parse_term("∀ x : Cart[Real, 3], cross(x, x) == vec(0)")))
}

///|
let lemma_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_5")

///|
/// `LEMMA_5`
pub fn lemma_5() -> @kernel.Thm {
  lemma_5_c.get()
}

///|
/// LEMMA_6
fn step_22() -> Unit raise {
  lemma_6_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], !(u == vec(0)) → !(cross(u, basis(1)) == vec(0)) || !(cross(u, basis(2)) == vec(0)) || !(cross(u, basis(3)) == vec(0))")))
}

///|
let lemma_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_6")

///|
/// `LEMMA_6`
pub fn lemma_6() -> @kernel.Thm {
  lemma_6_c.get()
}

///|
/// LEMMA_7
fn step_23() -> Unit raise {
  lemma_7_c.set(vec3_rule(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∀ w : Cart[Real, 3], cross(u, v) == vec(0) → dot(u, cross(v, w)) == real_of_num(0)")))
}

///|
let lemma_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_7")

///|
/// `LEMMA_7`
pub fn lemma_7() -> @kernel.Thm {
  lemma_7_c.get()
}

///|
/// NORMAL_EXISTS
fn step_24() -> Unit raise {
  let t17 = @meson.asm_meson_tac(@list.List([lemma_0(), lemma_1(), lemma_2(), lemma_3(), lemma_4(), lemma_5(), lemma_6(), lemma_7()]))
  let t16 = @simp.asm_rewrite_tac(@list.List([@vectors.orthogonal()]))
  let t13 = @term_syntax.parse_term("cross((u : Cart[Real, 3]), (v : Cart[Real, 3])) == vec(0)")
  let t14 = @term_syntax.parse_term("(v : Cart[Real, 3]) == vec(0)")
  let t15 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 3]) == vec(0)"), t14, t13]))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t15), t16), t17)
  normal_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∃ w : Cart[Real, 3], !(w == vec(0)) && orthogonal(u, w) && orthogonal(v, w)"), t18))
}

///|
let normal_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORMAL_EXISTS")

///|
/// `NORMAL_EXISTS`
pub fn normal_exists() -> @kernel.Thm {
  normal_exists_c.get()
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
}
