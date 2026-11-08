// Translated from upstream Quaternions/qisom.hl; edit this file directly.

///|
/// HIM_DEF
fn step_1() -> Unit raise {
  him_def_c.set(@pair.new_definition(@term_syntax.parse_term("(HIm : (Cart[Real, 4]) -> Cart[Real, 3])((q : Cart[Real, 4])) == vector([op_dollar(q, 2), op_dollar(q, 3), op_dollar(q, 4)])")))
}

///|
let him_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_DEF")

///|
/// `HIM_DEF`
pub fn him_def() -> @kernel.Thm {
  him_def_c.get()
}

///|
/// HIM
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([him_def(), @quaternion.quat(), @vectors.vector_4()]))
  him_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, HIm(quat((x, y, z, w))) == vector([y, z, w])"), t1))
}

///|
let him_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM")

///|
/// `HIM`
pub fn him() -> @kernel.Thm {
  him_c.get()
}

///|
/// HIM_COMPONENT
fn step_3() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([@quaternion.forall_quat(), him(), @quaternion.quat_components(), @vectors.vector_3()]))
  him_component_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], op_dollar(HIm(q), 1) == Im1(q)) && (∀ q : Cart[Real, 4], op_dollar(HIm(q), 2) == Im2(q)) && (∀ q : Cart[Real, 4], op_dollar(HIm(q), 3) == Im3(q))"), t2))
}

///|
let him_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_COMPONENT")

///|
/// `HIM_COMPONENT`
pub fn him_component() -> @kernel.Thm {
  him_component_c.get()
}

///|
/// HIM_EQ
fn step_4() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), him_component()]))
  him_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], (HIm(p) == HIm(q)) == (Im1(p) == Im1(q) && Im2(p) == Im2(q) && Im3(p) == Im3(q))"), t3))
}

///|
let him_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_EQ")

///|
/// `HIM_EQ`
pub fn him_eq() -> @kernel.Thm {
  him_eq_c.get()
}

///|
/// HIM_HX
fn step_5() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([@quaternion.hx_def(), him(), @cart.cart_eq(), @cart.dimindex_3(), @vectors.vec_component(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3()]))
  him_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, HIm(Hx(a)) == vec(0)"), t4))
}

///|
let him_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_HX")

///|
/// `HIM_HX`
pub fn him_hx() -> @kernel.Thm {
  him_hx_c.get()
}

///|
/// HIM_CNJ
fn step_6() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @quaternion.quat_cnj_components(), him_component(), @vectors.vector_neg_component(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3()]))
  him_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], HIm(cnj(q)) == -HIm(q)"), t5))
}

///|
let him_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_CNJ")

///|
/// `HIM_CNJ`
pub fn him_cnj() -> @kernel.Thm {
  him_cnj_c.get()
}

///|
/// HIM_MUL_HX
fn step_7() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([@realax.real_mul_sym()]))
  let t7 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.vector_mul_component(), him_component(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3(), @quaternion.mul_hx_components()])), t6)
  him_mul_hx_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Real, ∀ q : Cart[Real, 4], HIm(Hx(a) * q) == op_pct(a, HIm(q))) && (∀ a : Real, ∀ q : Cart[Real, 4], HIm(q * Hx(a)) == op_pct(a, HIm(q)))"), t7))
}

///|
let him_mul_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_MUL_HX")

///|
/// `HIM_MUL_HX`
pub fn him_mul_hx() -> @kernel.Thm {
  him_mul_hx_c.get()
}

///|
/// HIM_ADD
fn step_8() -> Unit raise {
  let t8 = @simp.rewrite_tac(@list.List([@vectors.forall_3(), him_component(), @quaternion.quat_add_components()]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.vector_add_component(), @cart.dimindex_3()])), t8)
  him_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], HIm(p + q) == HIm(p) + HIm(q)"), t9))
}

///|
let him_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_ADD")

///|
/// `HIM_ADD`
pub fn him_add() -> @kernel.Thm {
  him_add_c.get()
}

///|
/// HIM_NEG
fn step_9() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([@vectors.forall_3(), him_component(), @quaternion.quat_neg_components()]))
  let t11 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.vector_neg_component(), @cart.dimindex_3()])), t10)
  him_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], HIm(-q) == -HIm(q)"), t11))
}

///|
let him_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_NEG")

///|
/// `HIM_NEG`
pub fn him_neg() -> @kernel.Thm {
  him_neg_c.get()
}

///|
/// HIM_SUB
fn step_10() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@vectors.forall_3(), him_component(), @quaternion.quat_sub_components()]))
  let t13 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.vector_sub_component(), @cart.dimindex_3()])), t12)
  him_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], HIm(p - q) == HIm(p) - HIm(q)"), t13))
}

///|
let him_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_SUB")

///|
/// `HIM_SUB`
pub fn him_sub() -> @kernel.Thm {
  him_sub_c.get()
}

///|
/// HIM_VSUM
fn step_11() -> Unit raise {
  let t17 = @simp.asm_simp_tac(@list.List([@quaternion.quat_vsum_components()]))
  let t16 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3(), him_component()]))
  let t15 = @simp.asm_simp_tac(@list.List([@vectors.vsum_component()]))
  let t14 = @simp.rewrite_tac(@list.List([@cart.cart_eq()]))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t14), t15), t16), t17)
  him_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → HIm(vsum(s, f)) == vsum(s, (x : A) => HIm(f(x)))"), t18))
}

///|
let him_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_VSUM")

///|
/// `HIM_VSUM`
pub fn him_vsum() -> @kernel.Thm {
  him_vsum_c.get()
}

///|
/// CMUL_HIM
fn step_12() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_cmul()), @quaternions_misc.vector_eq_3(), him_def(), @vectors.vector_3(), @vectors.vector_mul_component()]))
  cmul_him_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ q : Cart[Real, 4], op_pct(c, HIm(q)) == HIm(Hx(c) * q)"), t19))
}

///|
let cmul_him_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CMUL_HIM")

///|
/// `CMUL_HIM`
pub fn cmul_him() -> @kernel.Thm {
  cmul_him_c.get()
}

///|
/// LINEAR_HIM
fn step_13() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@vectors.linear(), him_add(), cmul_him(), @quaternion.quat_cmul()]))
  linear_him_c.set(@tactics.prove(@term_syntax.parse_term("linear(HIm)"), t20))
}

///|
let linear_him_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_HIM")

///|
/// `LINEAR_HIM`
pub fn linear_him() -> @kernel.Thm {
  linear_him_c.get()
}

///|
/// HV
fn step_14() -> Unit raise {
  hv_c.set(@pair.new_definition(@term_syntax.parse_term("(Hv : (Cart[Real, 3]) -> Cart[Real, 4])((x : Cart[Real, 3])) == quat((real_of_num(0), op_dollar(x, 1), op_dollar(x, 2), op_dollar(x, 3)))")))
}

///|
let hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV")

///|
/// `HV`
pub fn hv() -> @kernel.Thm {
  hv_c.get()
}

///|
/// HV_COMPONENTS
fn step_15() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([hv(), @quaternion.quat_components(), @vectors.vector_4()]))
  hv_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 3], Re(Hv(x)) == real_of_num(0)) && (∀ x : Cart[Real, 3], Im1(Hv(x)) == op_dollar(x, 1)) && (∀ x : Cart[Real, 3], Im2(Hv(x)) == op_dollar(x, 2)) && (∀ x : Cart[Real, 3], Im3(Hv(x)) == op_dollar(x, 3))"), t21))
}

///|
let hv_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_COMPONENTS")

///|
/// `HV_COMPONENTS`
pub fn hv_components() -> @kernel.Thm {
  hv_components_c.get()
}

///|
/// HV_VEC
fn step_16() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_components(), @vectors.vec_component()]))
  hv_vec_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, Hv(vec(n)) == quat((real_of_num(0), real_of_num(n), real_of_num(n), real_of_num(n)))"), t22))
}

///|
let hv_vec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_VEC")

///|
/// `HV_VEC`
pub fn hv_vec() -> @kernel.Thm {
  hv_vec_c.get()
}

///|
/// HV_EQ_ZERO
fn step_17() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([@quaternions_misc.vector_eq_3(), @vectors.vec_component()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.hx_components()]))), t23)
  hv_eq_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 3], (Hv(v) == Hx(real_of_num(0))) == (v == vec(0))"), t24))
}

///|
let hv_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_EQ_ZERO")

///|
/// `HV_EQ_ZERO`
pub fn hv_eq_zero() -> @kernel.Thm {
  hv_eq_zero_c.get()
}

///|
/// HV_ZERO
fn step_18() -> Unit raise {
  let t25 = @simp.rewrite_tac(@list.List([hv_eq_zero()]))
  hv_zero_c.set(@tactics.prove(@term_syntax.parse_term("Hv(vec(0)) == Hx(real_of_num(0))"), t25))
}

///|
let hv_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_ZERO")

///|
/// `HV_ZERO`
pub fn hv_zero() -> @kernel.Thm {
  hv_zero_c.get()
}

///|
/// HV_VECTOR
fn step_19() -> Unit raise {
  let t26 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_components(), @vectors.vector_3()]))
  hv_vector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, Hv(vector([x, y, z])) == quat((real_of_num(0), x, y, z))"), t26))
}

///|
let hv_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_VECTOR")

///|
/// `HV_VECTOR`
pub fn hv_vector() -> @kernel.Thm {
  hv_vector_c.get()
}

///|
/// HV_BASIS
fn step_20() -> Unit raise {
  let t27 = @simp.simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_3(), @calc_num.arith_le(), @calc_num.arith_lt(), @calc_num.arith_eq()]))
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_units_components()])), t27)
  hv_basis_c.set(@tactics.prove(@term_syntax.parse_term("Hv(basis(1)) == ii && Hv(basis(2)) == jj && Hv(basis(3)) == kk"), t28))
}

///|
let hv_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_BASIS")

///|
/// `HV_BASIS`
pub fn hv_basis() -> @kernel.Thm {
  hv_basis_c.get()
}

///|
/// HV_ADD
fn step_21() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_add_components(), @vectors.vector_add_component(), @realax.real_add_lid()]))
  hv_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], Hv(x + y) == Hv(x) + Hv(y)"), t29))
}

///|
let hv_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_ADD")

///|
/// `HV_ADD`
pub fn hv_add() -> @kernel.Thm {
  hv_add_c.get()
}

///|
/// HV_NEG
fn step_22() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_neg_components(), @vectors.vector_neg_component(), @calc_int.real_neg_0()]))
  hv_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], Hv(-x) == -Hv(x)"), t30))
}

///|
let hv_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_NEG")

///|
/// `HV_NEG`
pub fn hv_neg() -> @kernel.Thm {
  hv_neg_c.get()
}

///|
/// HV_SUB
fn step_23() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.quat_sub_components(), @vectors.vector_sub_component(), @real.real_sub_rzero()]))
  hv_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], Hv(x - y) == Hv(x) - Hv(y)"), t31))
}

///|
let hv_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_SUB")

///|
/// `HV_SUB`
pub fn hv_sub() -> @kernel.Thm {
  hv_sub_c.get()
}

///|
/// HV_CMUL
fn step_24() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), @quaternion.mul_hx_components(), @calc_int.real_mul_rzero(), @vectors.vector_mul_component()]))
  hv_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, 3], Hv(op_pct(a, x)) == Hx(a) * Hv(x)"), t32))
}

///|
let hv_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_CMUL")

///|
/// `HV_CMUL`
pub fn hv_cmul() -> @kernel.Thm {
  hv_cmul_c.get()
}

///|
/// HV_VSUM
fn step_25() -> Unit raise {
  let t35 = @simp.asm_simp_tac(@list.List([@vectors.vsum_component(), @cart.dimindex_3(), @calc_num.arith()]))
  let t34 = @simp.asm_simp_tac(@list.List([hv_components(), @quaternion.quat_vsum_components(), @iterate.sum_0()]))
  let t33 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq()]))
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t33), t34), t35)
  hv_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 3], ∀ s : (A) -> Bool, FINITE(s) → Hv(vsum(s, f)) == vsum(s, (x : A) => Hv(f(x)))"), t36))
}

///|
let hv_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_VSUM")

///|
/// `HV_VSUM`
pub fn hv_vsum() -> @kernel.Thm {
  hv_vsum_c.get()
}

///|
/// HV_INJ
fn step_26() -> Unit raise {
  let t37 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t38 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components()])), t37)
  hv_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (Hv(x) == Hv(y)) == (x == y)"), t38))
}

///|
let hv_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_INJ")

///|
/// `HV_INJ`
pub fn hv_inj() -> @kernel.Thm {
  hv_inj_c.get()
}

///|
/// LINEAR_HV
fn step_27() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([@vectors.linear(), hv_add(), hv_cmul(), @quaternion.quat_cmul()]))
  linear_hv_c.set(@tactics.prove(@term_syntax.parse_term("linear(Hv)"), t39))
}

///|
let linear_hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_HV")

///|
/// `LINEAR_HV`
pub fn linear_hv() -> @kernel.Thm {
  linear_hv_c.get()
}

///|
/// HIM_HV
fn step_28() -> Unit raise {
  let t40 = @simp.rewrite_tac(@list.List([him(), hv(), @cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_mul_component(), @vectors.vector_3()]))
  him_hv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], HIm(Hv(x)) == x"), t40))
}

///|
let him_hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIM_HV")

///|
/// `HIM_HV`
pub fn him_hv() -> @kernel.Thm {
  him_hv_c.get()
}

///|
/// CNJ_HV
fn step_29() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), @quaternion.quat_cnj_components(), hv_components(), @quaternion.quat_neg_components(), @calc_int.real_neg_0()]))
  cnj_hv_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 3], cnj(Hv(v)) == -Hv(v)"), t41))
}

///|
let cnj_hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_HV")

///|
/// `CNJ_HV`
pub fn cnj_hv() -> @kernel.Thm {
  cnj_hv_c.get()
}

///|
/// HV_HIM
fn step_30() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([@quaternion.forall_quat(), him(), hv(), @quaternion.quat_components(), @vectors.vector_3()]))
  hv_him_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], Hv(HIm(q)) == quat((real_of_num(0), Im1(q), Im2(q), Im3(q)))"), t42))
}

///|
let hv_him_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_HIM")

///|
/// `HV_HIM`
pub fn hv_him() -> @kernel.Thm {
  hv_him_c.get()
}

///|
/// HV_HIM_EQ
fn step_31() -> Unit raise {
  let t43 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), hv_components(), him_component()]))), @tactics.eq_tac), @tactics.disch_tac), t43)
  hv_him_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], (Hv(HIm(q)) == q) == (Re(q) == real_of_num(0))"), t44))
}

///|
let hv_him_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HV_HIM_EQ")

///|
/// `HV_HIM_EQ`
pub fn hv_him_eq() -> @kernel.Thm {
  hv_him_eq_c.get()
}

///|
/// DOT_HV
fn step_32() -> Unit raise {
  let t45 = @simp.rewrite_tac(@list.List([@vectors.dot_3(), @quaternion.quat_dot(), hv_components(), @calc_int.real_mul_lzero(), @realax.real_add_lid()]))
  dot_hv_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], dot(Hv(u), Hv(v)) == dot(u, v)"), t45))
}

///|
let dot_hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_HV")

///|
/// `DOT_HV`
pub fn dot_hv() -> @kernel.Thm {
  dot_hv_c.get()
}

///|
/// NORM_HV
fn step_33() -> Unit raise {
  let t46 = @simp.rewrite_tac(@list.List([@vectors.vector_norm(), dot_hv()]))
  norm_hv_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 3], norm(Hv(v)) == norm(v)"), t46))
}

///|
let norm_hv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_HV")

///|
/// `NORM_HV`
pub fn norm_hv() -> @kernel.Thm {
  norm_hv_c.get()
}

///|
/// MUL_HV_EQ_CROSS_DOT
fn step_34() -> Unit raise {
  let t47 = @tactics.conv_tac(@calc_rat.real_ring)
  let t48 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_eq(), @quaternion.quat_sub_components(), hv_components(), @quaternion.hx_components(), @quaternion.quat_mul(), @quaternion.quat_components(), @cross.cross_components(), @vectors.dot_3()])), t47)
  mul_hv_eq_cross_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], Hv(x) * Hv(y) == Hv(cross(x, y)) - Hx(dot(x, y))"), t48))
}

///|
let mul_hv_eq_cross_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_HV_EQ_CROSS_DOT")

///|
/// `MUL_HV_EQ_CROSS_DOT`
pub fn mul_hv_eq_cross_dot() -> @kernel.Thm {
  mul_hv_eq_cross_dot_c.get()
}

///|
/// ORTHOGONAL_TRANSFORMATION_QUAT_CONGRUENCE
fn step_35() -> Unit raise {
  let t63 = @tactics.conv_tac(@calc_rat.real_ring)
  let t62 = @simp.rewrite_tac(@list.List([@quaternion.quat_sqnorm()]))
  let t61 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@quaternions_misc.vector_norm_sqnorm_unit())]))
  let t60 = @tactics.pop_assum(fn(x57 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s58 = @tactics.mp_tac(x57)
    fn(x59 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s58(x59)
    }
  })
  let t56 = @simp.rewrite_tac(@list.List([@vectors.dot_3(), him_component(), @quaternion.quat_mul(), hv_components(), @quaternion.quat_components(), @quaternion.quat_cnj_components()]))
  let t55 = @tactics.repeat_tac(@tactics.gen_tac)
  let t51 = @tactics.conv_tac(@qnormalizer.quat_poly)
  let t52 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cmul_him(), hv_cmul()])), @tactics.ap_term_tac), t51)
  let t53 = @list.List([@simp.rewrite_tac(@list.List([hv_add(), @quaternion.quat_add_ldistrib(), @quaternion.quat_add_rdistrib(), him_add()])), t52])
  let t54 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.conj_tac, @tactics.repeat_tac(@tactics.strip_tac)), t53), @tactics.all_tac])
  let t50 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation(), @vectors.linear()]))
  let t64 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall q; qnorm"), t50), @tactics.conj_tac), t54), t55), t56), t60), t61), t62), t63)
  orthogonal_transformation_quat_congruence_c.set(@lib.time(fn(x49 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x49.0, x49.1)
  }, (@term_syntax.parse_term("∀ q : Cart[Real, 4], norm(q) == real_of_num(1) → orthogonal_transformation((x : Cart[Real, 3]) => HIm(cnj(q) * (Hv(x) * q)))"), t64)))
}

///|
let orthogonal_transformation_quat_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_TRANSFORMATION_QUAT_CONGRUENCE")

///|
/// `ORTHOGONAL_TRANSFORMATION_QUAT_CONGRUENCE`
pub fn orthogonal_transformation_quat_congruence() -> @kernel.Thm {
  orthogonal_transformation_quat_congruence_c.get()
}

///|
/// ORTHOGONAL_TRANSFORMATION_QUAT_CONJUGATION
fn step_36() -> Unit raise {
  let t86 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), @quaternion.quat_mul_lid(), orthogonal_transformation_quat_congruence()]))
  let t85 = @tactics.conv_tac(@equal.once_depth_conv(@equal.changed_conv(@qnormalizer.quat_poly_conv)))
  let t84 = @simp.asm_simp_tac(@list.List([@quaternion.quat_inv_eq_cnj()]))
  let t83 = @simp.rewrite_tac(@list.List([@quaternion.quat_inv_mul(), @equal.gsym(@quaternion.hx_inv())]))
  let t79 = @simp.rewrite_rule(@list.List([@quaternion.quat_entire(), @quaternion.hx_inj(), @class.de_morgan_thm()]))
  let t80 = @theorems.destruct_tac("cnz pnz")
  let t82 = @tactics.remove_then("qnz", fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t80(t79(x81))
  })
  let t78 = @tactics.remove_then("qeq", fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s76 = @tactics.subst_all_tac(x75)
    fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s76(x77)
    }
  })
  let t73 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), @realax.real_mul_linv(), @quaternion.quat_norm_zero(), @quaternion.quat_mul_lid()]))
  let t71 = @equal.gsym(@quaternion.hx_mul())
  let t72 = @simp.rewrite_tac(@list.List([@quaternion.quat_norm_mul(), @quaternion.quat_norm_inv(), @vectors.real_abs_norm(), @quaternion.quat_mul_assoc(), @quaternion.norm_hx(), @equal.gsym(@quaternion.hx_inv()), t71]))
  let t70 = @term_syntax.parse_term("inv(Hx(norm((q : Cart[Real, 4])))) * q")
  let t74 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x67 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.exists_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  }, @list.List([@term_syntax.parse_term("norm((q : Cart[Real, 4]))"), t70])), t72), t73), @tactics.all_tac])
  let t65 = @theorems.destruct_tac("@c p. qeq pnorm")
  let t66 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Real, ∃ p : Cart[Real, 4], (q : Cart[Real, 4]) == Hx(c) * p && norm(p) == real_of_num(1)"), t65)
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@theorems.intro_tac("forall q; qnz"), t66), t74), t78), t82), t83), t84), t85), t86)
  orthogonal_transformation_quat_conjugation_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], !(q == Hx(real_of_num(0))) → orthogonal_transformation((x : Cart[Real, 3]) => HIm(inv(q) * (Hv(x) * q)))"), t87))
}

///|
let orthogonal_transformation_quat_conjugation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_TRANSFORMATION_QUAT_CONJUGATION")

///|
/// `ORTHOGONAL_TRANSFORMATION_QUAT_CONJUGATION`
pub fn orthogonal_transformation_quat_conjugation() -> @kernel.Thm {
  orthogonal_transformation_quat_conjugation_c.get()
}

///|
/// REFLECT_ALONG_EQ_QUAT_PRODUCT
fn step_37() -> Unit raise {
  let t102 = @tactics.conv_tac(@calc_rat.real_ring)
  let t101 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_1(), @vectors.dot_3()]))
  let t100 = @tactics.pop_assum(fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s98 = @tactics.mp_tac(x97)
    fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s98(x99)
    }
  })
  let t96 = @simp.rewrite_tac(@list.List([@quaternions_misc.vector_eq_3(), @vectors.vector_sub_component(), @vectors.vector_mul_component(), him_component(), @quaternion.quat_mul(), hv_components(), @quaternion.quat_components(), @vectors.dot_3()]))
  let t94 = @simp.rewrite_tac(@list.List([@real.real_div_1()]))
  let t95 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.norm_eq_1())])), t94])
  let t93 = @tactics.subgoal_then(@term_syntax.parse_term("dot((v : Cart[Real, 3]), v) == real_of_num(1)"), fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s91 = @tactics.subst1_tac(x90)
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s91(x92)
    }
  })
  let t89 = @simp.rewrite_tac(@list.List([@determinants.reflect_along()]))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall v x; vnorm"), t89), t93), t95), t96), t100), t101), t102)
  reflect_along_eq_quat_product_c.set(@lib.time(fn(x88 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x88.0, x88.1)
  }, (@term_syntax.parse_term("∀ v : Cart[Real, 3], ∀ x : Cart[Real, 3], norm(v) == real_of_num(1) → reflect_along(v, x) == HIm(Hv(v) * (Hv(x) * Hv(v)))"), t103)))
}

///|
let reflect_along_eq_quat_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ALONG_EQ_QUAT_PRODUCT")

///|
/// `REFLECT_ALONG_EQ_QUAT_PRODUCT`
pub fn reflect_along_eq_quat_product() -> @kernel.Thm {
  reflect_along_eq_quat_product_c.get()
}

///|
/// REFLECT_ALONG_EQ_QUAT_CONJUGATION
fn step_38() -> Unit raise {
  let t135 = @tactics.conv_tac(@qnormalizer.quat_poly)
  let t134 = @simp.asm_rewrite_tac(@list.List([cnj_hv(), norm_hv(), @real.real_pow_one(), @quaternion.quat_inv_1(), @quaternion.quat_mul_lid()]))
  let t136 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@quaternion.quat_inv_cnj()])), t134), t135])
  let t133 = @tactics.subgoal_then(@term_syntax.parse_term("inv(Hv((u : Cart[Real, 3]))) == -Hv(u)"), fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s131 = @tactics.subst1_tac(x130)
    fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s131(x132)
    }
  })
  let t129 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((c : Real) == real_of_num(0)) → -real_of_num(1) * (c * inv(c)) == -real_of_num(1)"))]))
  let t128 = @tactics.conv_tac(@equal.binop_conv(@qnormalizer.quat_poly_conv))
  let t126 = @equal.gsym(@quaternion.hx_inv())
  let t127 = @simp.rewrite_tac(@list.List([@equal.gsym(him_neg()), hv_cmul(), @quaternion.quat_inv_mul(), t126]))
  let t125 = @simp.asm_simp_tac(@list.List([reflect_along_eq_quat_product()]))
  let t124 = @simp.asm_simp_tac(@list.List([@determinants.reflect_along_scale()]))
  let t123 = @theorems.intro_tac("cnz unz")
  let t122 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @class.de_morgan_thm()]))
  let t121 = @tactics.remove_then("vnz", fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s119 = @tactics.mp_tac(x118)
    fn(x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s119(x120)
    }
  })
  let t117 = @tactics.remove_then("veq", fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s115 = @tactics.subst_all_tac(x114)
    fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s115(x116)
    }
  })
  let t112 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @real.real_mul_rinv(), @vectors.norm_eq_0(), @vectors.vector_mul_lid()]))
  let t111 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @vectors.norm_mul(), @real.real_abs_inv(), @vectors.real_abs_norm()]))
  let t110 = @term_syntax.parse_term("op_pct(inv(norm((v : Cart[Real, 3]))), v)")
  let t113 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x107 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.exists_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  }, @list.List([@term_syntax.parse_term("norm((v : Cart[Real, 3]))"), t110])), t111), t112), @tactics.all_tac])
  let t105 = @theorems.destruct_tac("@c u. veq unorm")
  let t106 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Real, ∃ u : Cart[Real, 3], (v : Cart[Real, 3]) == op_pct(c, u) && norm(u) == real_of_num(1)"), t105)
  let t104 = @theorems.intro_tac("forall v; vnz; forall x")
  let t137 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t104), t106), t113), t117), t121), t122), t123), t124), t125), t127), @tactics.ap_term_tac), t128), t129), t133), t136)
  reflect_along_eq_quat_conjugation_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 3], !(v == vec(0)) → reflect_along(v) == ((x : Cart[Real, 3]) => -HIm(inv(Hv(v)) * (Hv(x) * Hv(v))))"), t137))
}

///|
let reflect_along_eq_quat_conjugation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ALONG_EQ_QUAT_CONJUGATION")

///|
/// `REFLECT_ALONG_EQ_QUAT_CONJUGATION`
pub fn reflect_along_eq_quat_conjugation() -> @kernel.Thm {
  reflect_along_eq_quat_conjugation_c.get()
}

///|
/// ORTHOGONAL_TRANSFORMATION_AS_QUAT_CONJUGATION
fn step_39() -> Unit raise {
  let t236 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @vectors.norm_eq_0(), @quaternion.quat_mul_lid(), @quaternion.quat_mul_assoc()]))
  let t235 = @tactics.conv_tac(@equal.binop_conv(@qnormalizer.quat_poly_conv))
  let t234 = @simp.rewrite_tac(@list.List([@quaternion.quat_inv_mul(), @equal.gsym(@quaternion.hx_inv()), @real.real_inv_inv()]))
  let t233 = @tactics.remove_then("p", fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s230 = @tactics.subst1_tac(x229)
      fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s230(x231)
      }
    })(@equal.gsym(x232))
  })
  let t228 = @tactics.map_every(fn(x225 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s = x225
    @tactics.remove_then(s, fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })
  }, @list.List(["feq", "tnz", "hp"]))
  let t224 = @tactics.try_tac(@tactics.ap_term_tac)
  let t223 = @simp.rewrite_tac(@list.List([hv_neg(), @quaternion.quat_mul_lneg(), @quaternion.quat_mul_rneg(), him_neg(), @vectors.vector_neg_neg()]))
  let t222 = @tactics.hyp_tac(@simp.rewrite_tac, "hp")(@list.List([]))
  let t221 = @tactics.remove_then("hp", @theorems.destruct_tac("hp|hp"))
  let t220 = @tactics.hyp_tac(@simp.simp_tac, "hnz")(@list.List([reflect_along_eq_quat_conjugation()]))
  let t218 = @tactics.hyp_tac(@simp.simp_tac, "hnz")(@list.List([@realax.real_mul_linv(), @vectors.norm_eq_0()]))
  let t217 = @simp.rewrite_tac(@list.List([@quaternion.quat_norm_mul(), @quaternion.norm_hx(), @real.real_abs_inv(), @vectors.real_abs_norm(), norm_hv()]))
  let t216 = @simp.expand_tac("p")
  let t219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@quaternion.quat_norm_mul(), @realax.real_mul_lid()])), t216), t217), t218), @tactics.all_tac])
  let t215 = @simp.rewrite_tac(@list.List([@lists.itlist(), @trivia.o_thm()]))
  let t214 = @tactics.pop_assum(fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = ((x210 : @kernel.Thm) => @tactics.label_tac("p", x210))(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  })
  let t209 = @tactics.exists_tac(@term_syntax.parse_term("(q : Cart[Real, 4]) * (p : Cart[Real, 4])"))
  let t208 = @simp.abbrev_tac(@term_syntax.parse_term("(p : Cart[Real, 4]) == Hx(inv(norm((h : Cart[Real, 3])))) * Hv(h)"))
  let t206 = @tactics.conv_tac(@calc_rat.real_ring)
  let t205 = @simp.rewrite_tac(@list.List([hv_him_eq(), @quaternion.quat_mul(), @quaternion.quat_components(), @quaternion.quat_cnj_components(), hv_components()]))
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.asm_simp_tac(@list.List([@quaternion.quat_inv_eq_cnj()]))), t205), t206), @tactics.all_tac])
  let t204 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 3], Hv(HIm(inv((q : Cart[Real, 4])) * Hv(x) * q)) == inv(q) * Hv(x) * q"), fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s202 = ((x200 : @kernel.Thm) => @tactics.label_tac("rel", x200))(x201)
    fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s202(x203)
    }
  })
  let t199 = @theorems.intro_tac("@q. qnorm hp")
  let t198 = @tactics.disch_then(fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let ant = x191
    let t196 = @drule.match_mp(ant)
    @tactics.pop_assum(fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s194 = @tactics.mp_tac(x193)
        fn(x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s194(x195)
        }
      })(t196(x197))
    })
  })
  let t190 = @simp.abbrev_tac(@term_syntax.parse_term("(g : (Cart[Real, 3]) -> Cart[Real, 3]) == ITLIST((v : Cart[Real, 3]) => (h : (Cart[Real, 3]) -> Cart[Real, 3]) => o(reflect_along(v), h), (t : List[Cart[Real, 3]]), I)"))
  let t189 = @simp.asm_rewrite_tac(@list.List([]))
  let t188 = @theorems.intro_tac("hnz tnz")
  let t187 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t186 = @tactics.remove_then("all", fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s184 = @tactics.mp_tac(x183)
    fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s184(x185)
    }
  })
  let t182 = @tactics.remove_then("leq", fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s180 = @tactics.subst_all_tac(x179)
    fn(x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s180(x181)
    }
  })
  let t178 = @tactics.remove_then("ind_n", fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let ind_n = x171
    let t176 = @drule.match_mp(ind_n)
    @tactics.remove_then("len", fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s174 = @tactics.mp_tac(x173)
        fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s174(x175)
        }
      })(t176(x177))
    })
  })
  let t170 = @theorems.intro_tac("@h t. leq len; all feq")
  let t169 = @simp.rewrite_tac(@list.List([@lists.length_eq_cons()]))
  let t168 = @tactics.repeat_tac(@tactics.gen_tac)
  let t166 = @simp.rewrite_tac(@list.List([@quaternion.norm_hx(), @real.real_abs_1(), @trivia.i_thm(), @quaternion.quat_inv_1(), @quaternion.quat_mul_lid(), @quaternion.quat_mul_rid(), him_hv()]))
  let t165 = @tactics.exists_tac(@term_syntax.parse_term("Hx(real_of_num(1))"))
  let t164 = @tactics.disch_then(fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s162 = @tactics.subst1_tac(x161)
    fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s162(x163)
    }
  })
  let t160 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.itlist()]))
  let t159 = @tactics.disch_then(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.subst1_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  })
  let t155 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t155), t159), t160), t164), t165), t166), @tactics.all_tac])
  let t152 = @term_syntax.parse_term("(n : Num)")
  let t153 = @term_syntax.parse_term("(l : List[Cart[Real, 3]])")
  let t154 = @tactics.map_every(fn(x150 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x150
    @tactics.spec_tac(t, t)
  }, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Cart[Real, 3])"), t153, t152]))
  let t149 = @tactics.pop_assum(fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s147 = @tactics.mp_tac(x146)
    fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s147(x148)
    }
  })
  let t145 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == LENGTH((l : List[Cart[Real, 3]]))"))
  let t144 = @tactics.pop_assum_list(fn(x143 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t142 = @tactics.hyp_tac(@quaternions_misc.mp_list_tac, "hp feq")(@list.List([]))
  let t141 = @theorems.intro_tac("@l. len hp feq")
  let t140 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@cart.dimindex_3()])), @int.arith_tac), @tactics.all_tac])
  let t138 = @term_syntax.parse_term("3")
  let t139 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Cart[Real, 3])"), t138]), @determinants.orthogonal_transformation_generated_by_reflections()))
  let t237 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall f; orth"), t139), @tactics.ants_tac), t140), t141), t142), t144), t145), t149), t154), @quaternions_misc.induct_tac), t167), t168), t169), t170), t178), t182), t186), t187), t188), t189), t190), t198), t199), t204), t207), t208), t209), t214), t215), @tactics.conj_tac), t219), t220), t221), @list.List([@tactics.disj2_tac, @tactics.disj1_tac])), @tactics.gen_tac), t222), t223), @tactics.ap_term_tac), t224), t228), t233), t234), t235), t236)
  orthogonal_transformation_as_quat_conjugation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 3], orthogonal_transformation(f) → (∃ q : Cart[Real, 4], norm(q) == real_of_num(1) && ((∀ x : Cart[Real, 3], f(x) == HIm(inv(q) * (Hv(x) * q))) || (∀ x : Cart[Real, 3], f(x) == -HIm(inv(q) * (Hv(x) * q)))))"), t237))
}

///|
let orthogonal_transformation_as_quat_conjugation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_TRANSFORMATION_AS_QUAT_CONJUGATION")

///|
/// `ORTHOGONAL_TRANSFORMATION_AS_QUAT_CONJUGATION`
pub fn orthogonal_transformation_as_quat_conjugation() -> @kernel.Thm {
  orthogonal_transformation_as_quat_conjugation_c.get()
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
}
