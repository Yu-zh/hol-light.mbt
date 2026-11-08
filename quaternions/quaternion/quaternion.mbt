// Translated from upstream Quaternions/quaternion.hl; edit this file directly.

///|
/// Quaternions/quaternion.hl:7
fn step_1() -> Unit raise {
  @preterm.new_type_abbrev("quat", @term_syntax.parse_type("Cart[Real, 4]"))
}

///|
/// Quaternions/quaternion.hl:9
fn step_2() -> Unit raise {
  @preterm.make_overloadable("Re", @term_syntax.parse_type("(Cart[Real, N]) -> Real"))
}

///|
/// Quaternions/quaternion.hl:10
fn step_3() -> Unit raise {
  @preterm.make_overloadable("ii", @term_syntax.parse_type("Cart[Real, N]"))
}

///|
/// Quaternions/quaternion.hl:11
fn step_4() -> Unit raise {
  @preterm.make_overloadable("cnj", @term_syntax.parse_type("(Cart[Real, N]) -> Cart[Real, N]"))
}

///|
/// Quaternions/quaternion.hl:12
fn step_5() -> Unit raise {
  @preterm.make_overloadable("real", @term_syntax.parse_type("(Cart[Real, N]) -> Bool"))
}

///|
/// Quaternions/quaternion.hl:13
fn step_6() -> Unit raise {
  @preterm.overload_interface("Re", @basics.mk_mconst("Re", @term_syntax.parse_type("(Complex) -> Real")))
}

///|
/// Quaternions/quaternion.hl:14
fn step_7() -> Unit raise {
  @preterm.overload_interface("ii", @basics.mk_mconst("ii", @term_syntax.parse_type("Complex")))
}

///|
/// Quaternions/quaternion.hl:15
fn step_8() -> Unit raise {
  @preterm.overload_interface("cnj", @basics.mk_mconst("cnj", @term_syntax.parse_type("(Complex) -> Complex")))
}

///|
/// Quaternions/quaternion.hl:16
fn step_9() -> Unit raise {
  @preterm.overload_interface("real", @basics.mk_mconst("real", @term_syntax.parse_type("(Complex) -> Bool")))
}

///|
/// `prioritize_quat`
pub fn prioritize_quat(x1 : Unit) -> Unit raise {
  let _ = x1
  @preterm.overload_interface("--", @term_syntax.parse_term("(op_minus_minus : (Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("+", @term_syntax.parse_term("(op_plus : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("-", @term_syntax.parse_term("(op_minus : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("*", @term_syntax.parse_term("(quat_mul : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("pow", @term_syntax.parse_term("(quat_pow : (Cart[Real, 4], Num) -> Cart[Real, 4])"))
  @preterm.overload_interface("inv", @term_syntax.parse_term("(quat_inv : (Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("Re", @term_syntax.parse_term("(quat_Re : (Cart[Real, 4]) -> Real)"))
  @preterm.overload_interface("ii", @term_syntax.parse_term("(quat_ii : Cart[Real, 4])"))
  @preterm.overload_interface("cnj", @term_syntax.parse_term("(quat_cnj : (Cart[Real, 4]) -> Cart[Real, 4])"))
  @preterm.overload_interface("real", @term_syntax.parse_term("(quat_real : (Cart[Real, 4]) -> Bool)"))
}

///|
/// Quaternions/quaternion.hl:30
fn step_10() -> Unit raise {
  prioritize_quat(())
}

///|
/// QUAT_RE_DEF
fn step_11() -> Unit raise {
  quat_re_def_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_Re : (Cart[Real, 4]) -> Real)((x : Cart[Real, 4])) == op_dollar(x, 1)")))
}

///|
let quat_re_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_RE_DEF")

///|
/// `QUAT_RE_DEF`
pub fn quat_re_def() -> @kernel.Thm {
  quat_re_def_c.get()
}

///|
/// QUAT_IM1_DEF
fn step_12() -> Unit raise {
  quat_im1_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Im1 : (Cart[Real, 4]) -> Real)((x : Cart[Real, 4])) == op_dollar(x, 2)")))
}

///|
let quat_im1_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_IM1_DEF")

///|
/// `QUAT_IM1_DEF`
pub fn quat_im1_def() -> @kernel.Thm {
  quat_im1_def_c.get()
}

///|
/// QUAT_IM2_DEF
fn step_13() -> Unit raise {
  quat_im2_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Im2 : (Cart[Real, 4]) -> Real)((x : Cart[Real, 4])) == op_dollar(x, 3)")))
}

///|
let quat_im2_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_IM2_DEF")

///|
/// `QUAT_IM2_DEF`
pub fn quat_im2_def() -> @kernel.Thm {
  quat_im2_def_c.get()
}

///|
/// QUAT_IM3_DEF
fn step_14() -> Unit raise {
  quat_im3_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Im3 : (Cart[Real, 4]) -> Real)((x : Cart[Real, 4])) == op_dollar(x, 4)")))
}

///|
let quat_im3_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_IM3_DEF")

///|
/// `QUAT_IM3_DEF`
pub fn quat_im3_def() -> @kernel.Thm {
  quat_im3_def_c.get()
}

///|
/// QUAT_COMPONENTS_DEF
fn step_15() -> Unit raise {
  quat_components_def_c.set(@lib.end_itlist(@bool.conj, @list.List([quat_re_def(), quat_im1_def(), quat_im2_def(), quat_im3_def()])))
}

///|
let quat_components_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_COMPONENTS_DEF")

///|
/// `QUAT_COMPONENTS_DEF`
pub fn quat_components_def() -> @kernel.Thm {
  quat_components_def_c.get()
}

///|
/// quat
fn step_16() -> Unit raise {
  quat_c.set(@pair.new_definition(@term_syntax.parse_term("(quat : ((Real, Real, Real, Real)) -> Cart[Real, 4])(((x : Real), (y : Real), (z : Real), (w : Real))) == vector([x, y, z, w])")))
}

///|
let quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat")

///|
/// `quat`
pub fn quat() -> @kernel.Thm {
  quat_c.get()
}

///|
/// HX_DEF
fn step_17() -> Unit raise {
  hx_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Hx : (Real) -> Cart[Real, 4])((a : Real)) == quat((a, real_of_num(0), real_of_num(0), real_of_num(0)))")))
}

///|
let hx_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_DEF")

///|
/// `HX_DEF`
pub fn hx_def() -> @kernel.Thm {
  hx_def_c.get()
}

///|
/// quat_ii
fn step_18() -> Unit raise {
  quat_ii_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_ii : Cart[Real, 4]) == quat((real_of_num(0), real_of_num(1), real_of_num(0), real_of_num(0)))")))
}

///|
let quat_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_ii")

///|
/// `quat_ii`
pub fn quat_ii() -> @kernel.Thm {
  quat_ii_c.get()
}

///|
/// quat_jj
fn step_19() -> Unit raise {
  quat_jj_c.set(@pair.new_definition(@term_syntax.parse_term("(jj : Cart[Real, 4]) == quat((real_of_num(0), real_of_num(0), real_of_num(1), real_of_num(0)))")))
}

///|
let quat_jj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_jj")

///|
/// `quat_jj`
pub fn quat_jj() -> @kernel.Thm {
  quat_jj_c.get()
}

///|
/// quat_kk
fn step_20() -> Unit raise {
  quat_kk_c.set(@pair.new_definition(@term_syntax.parse_term("(kk : Cart[Real, 4]) == quat((real_of_num(0), real_of_num(0), real_of_num(0), real_of_num(1)))")))
}

///|
let quat_kk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_kk")

///|
/// `quat_kk`
pub fn quat_kk() -> @kernel.Thm {
  quat_kk_c.get()
}

///|
/// quat_mul
fn step_21() -> Unit raise {
  quat_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_mul : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])((p : Cart[Real, 4]), (q : Cart[Real, 4])) == quat((quat_Re(p) * quat_Re(q) - Im1(p) * Im1(q) - Im2(p) * Im2(q) - Im3(p) * Im3(q), quat_Re(p) * Im1(q) + (Im1(p) * quat_Re(q) + (Im2(p) * Im3(q) - Im3(p) * Im2(q))), quat_Re(p) * Im2(q) - Im1(p) * Im3(q) + (Im2(p) * quat_Re(q) + Im3(p) * Im1(q)), quat_Re(p) * Im3(q) + (Im1(p) * Im2(q) - Im2(p) * Im1(q) + Im3(p) * quat_Re(q))))")))
}

///|
let quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_mul")

///|
/// `quat_mul`
pub fn quat_mul() -> @kernel.Thm {
  quat_mul_c.get()
}

///|
/// quat_inv
fn step_22() -> Unit raise {
  quat_inv_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_inv : (Cart[Real, 4]) -> Cart[Real, 4])((q : Cart[Real, 4])) == quat((quat_Re(q) / (pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2)))), -Im1(q) / (pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2)))), -Im2(q) / (pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2)))), -Im3(q) / (pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2))))))")))
}

///|
let quat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_inv")

///|
/// `quat_inv`
pub fn quat_inv() -> @kernel.Thm {
  quat_inv_c.get()
}

///|
/// quat_pow
fn step_23() -> Unit raise {
  quat_pow_c.set(@define.define_(@term_syntax.parse_term("(quat_pow : (Cart[Real, 4], Num) -> Cart[Real, 4])((q : Cart[Real, 4]), 0) == Hx(real_of_num(1)) && (∀ n : Num, quat_pow(q, SUC(n)) == quat_mul(q, quat_pow(q, n)))")))
}

///|
let quat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_pow")

///|
/// `quat_pow`
pub fn quat_pow() -> @kernel.Thm {
  quat_pow_c.get()
}

///|
/// QUAT_COMPONENTS
fn step_24() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([quat_components_def(), quat(), @vectors.vector_4()]))
  quat_components_c.set(@tactics.prove(@term_syntax.parse_term("quat_Re(quat(((x : Real), (y : Real), (z : Real), (w : Real)))) == x && Im1(quat((x, y, z, w))) == y && Im2(quat((x, y, z, w))) == z && Im3(quat((x, y, z, w))) == w"), t2))
}

///|
let quat_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_COMPONENTS")

///|
/// `QUAT_COMPONENTS`
pub fn quat_components() -> @kernel.Thm {
  quat_components_c.get()
}

///|
/// HX_COMPONENTS
fn step_25() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([hx_def(), quat_components()]))
  hx_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Real, quat_Re(Hx(a)) == a) && (∀ a : Real, Im1(Hx(a)) == real_of_num(0)) && (∀ a : Real, Im2(Hx(a)) == real_of_num(0)) && (∀ a : Real, Im3(Hx(a)) == real_of_num(0))"), t3))
}

///|
let hx_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_COMPONENTS")

///|
/// `HX_COMPONENTS`
pub fn hx_components() -> @kernel.Thm {
  hx_components_c.get()
}

///|
/// QUAT_UNITS_COMPONENTS
fn step_26() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([quat_ii(), quat_jj(), quat_kk(), quat_components()]))
  quat_units_components_c.set(@tactics.prove(@term_syntax.parse_term("quat_Re(quat_ii) == real_of_num(0) && Im1(quat_ii) == real_of_num(1) && Im2(quat_ii) == real_of_num(0) && Im3(quat_ii) == real_of_num(0) && quat_Re(jj) == real_of_num(0) && Im1(jj) == real_of_num(0) && Im2(jj) == real_of_num(1) && Im3(jj) == real_of_num(0) && quat_Re(kk) == real_of_num(0) && Im1(kk) == real_of_num(0) && Im2(kk) == real_of_num(0) && Im3(kk) == real_of_num(1)"), t4))
}

///|
let quat_units_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_UNITS_COMPONENTS")

///|
/// `QUAT_UNITS_COMPONENTS`
pub fn quat_units_components() -> @kernel.Thm {
  quat_units_components_c.get()
}

///|
/// QUAT_EQ
fn step_27() -> Unit raise {
  let t5 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_4(), @cart.dimindex_4(), quat_components_def()]))
  quat_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], (p == q) == (quat_Re(p) == quat_Re(q) && Im1(p) == Im1(q) && Im2(p) == Im2(q) && Im3(p) == Im3(q))"), t5))
}

///|
let quat_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ")

///|
/// `QUAT_EQ`
pub fn quat_eq() -> @kernel.Thm {
  quat_eq_c.get()
}

///|
/// QUAT
fn step_28() -> Unit raise {
  let t6 = @simp.rewrite_tac(@list.List([quat_eq(), quat_components()]))
  quat_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat((quat_Re(q), Im1(q), Im2(q), Im3(q))) == q"), t6))
}

///|
let quat_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT")

///|
/// `QUAT`
pub fn quat_v1() -> @kernel.Thm {
  quat_v1_c.get()
}

///|
/// QUAT_EQ_0
fn step_29() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square(), @realarith.real_entire()]))
  let t12 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, x + (y + (z + w)) == real_of_num(0) → real_of_num(0) <= x && real_of_num(0) <= y && real_of_num(0) <= z && real_of_num(0) <= w → x == real_of_num(0) && y == real_of_num(0) && z == real_of_num(0) && w == real_of_num(0)")))
  let t14 = @tactics.disch_then(fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s10 = @tactics.mp_tac(x9)
      fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s10(x11)
      }
    })(t12(x13))
  })
  let t8 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t7 = @simp.simp_tac(@list.List([]))
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), hx_def(), quat_components()])), @tactics.eq_tac), t7), t8), t14), t15)
  quat_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("((q : Cart[Real, 4]) == Hx(real_of_num(0))) == (pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2))) == real_of_num(0))"), t16))
}

///|
let quat_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_0")

///|
/// `QUAT_EQ_0`
pub fn quat_eq_0() -> @kernel.Thm {
  quat_eq_0_c.get()
}

///|
/// FORALL_QUAT
fn step_30() -> Unit raise {
  let t17 = @meson.meson_tac(@list.List([quat_v1()]))
  forall_quat_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], (P : (Cart[Real, 4]) -> Bool)(q)) == (∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, P(quat((x, y, z, w))))"), t17))
}

///|
let forall_quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_QUAT")

///|
/// `FORALL_QUAT`
pub fn forall_quat() -> @kernel.Thm {
  forall_quat_c.get()
}

///|
/// EXISTS_QUAT
fn step_31() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([quat_v1()]))
  exists_quat_c.set(@tactics.prove(@term_syntax.parse_term("(∃ q : Cart[Real, 4], (P : (Cart[Real, 4]) -> Bool)(q)) == (∃ x : Real, ∃ y : Real, ∃ z : Real, ∃ w : Real, P(quat((x, y, z, w))))"), t18))
}

///|
let exists_quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_QUAT")

///|
/// `EXISTS_QUAT`
pub fn exists_quat() -> @kernel.Thm {
  exists_quat_c.get()
}

///|
/// quat_neg
fn step_32() -> Unit raise {
  let t20 = @simp.simp_tac(@list.List([@vectors.vector_neg_component(), @cart.dimindex_4(), @calc_num.arith()]))
  let t19 = @simp.rewrite_tac(@list.List([quat_components_def()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_components()])), t19), t20)
  quat_neg_c.set(@tactics.prove(@term_syntax.parse_term("-(q : Cart[Real, 4]) == quat((-quat_Re(q), -Im1(q), -Im2(q), -Im3(q)))"), t21))
}

///|
let quat_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_neg")

///|
/// `quat_neg`
pub fn quat_neg() -> @kernel.Thm {
  quat_neg_c.get()
}

///|
/// quat_add
fn step_33() -> Unit raise {
  let t23 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @cart.dimindex_4(), @calc_num.arith()]))
  let t22 = @simp.rewrite_tac(@list.List([quat_components_def()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_components()])), t22), t23)
  quat_add_c.set(@tactics.prove(@term_syntax.parse_term("(p : Cart[Real, 4]) + (q : Cart[Real, 4]) == quat((quat_Re(p) + quat_Re(q), Im1(p) + Im1(q), Im2(p) + Im2(q), Im3(p) + Im3(q)))"), t24))
}

///|
let quat_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_add")

///|
/// `quat_add`
pub fn quat_add() -> @kernel.Thm {
  quat_add_c.get()
}

///|
/// quat_sub
fn step_34() -> Unit raise {
  quat_sub_c.set(@vectors.vector_arith(@term_syntax.parse_term("(p : Cart[Real, 4]) - (q : Cart[Real, 4]) == p + -q")))
}

///|
let quat_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_sub")

///|
/// `quat_sub`
pub fn quat_sub() -> @kernel.Thm {
  quat_sub_c.get()
}

///|
/// quat_norm
fn step_35() -> Unit raise {
  let t25 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_norm(), @vectors.dot(), quat_components_def(), @vectors.sum_4(), @cart.dimindex_4()])), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  quat_norm_c.set(@tactics.prove(@term_syntax.parse_term("norm((q : Cart[Real, 4])) == sqrt(pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2))))"), t25))
}

///|
let quat_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_norm")

///|
/// `quat_norm`
pub fn quat_norm() -> @kernel.Thm {
  quat_norm_c.get()
}

///|
/// QUAT_SQNORM
fn step_36() -> Unit raise {
  let t26 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot(), quat_components_def(), @vectors.sum_4(), @cart.dimindex_4()])), @calc_rat.real_arith_tac)
  quat_sqnorm_c.set(@tactics.prove(@term_syntax.parse_term("pow(norm((q : Cart[Real, 4])), 2) == pow(quat_Re(q), 2) + (pow(Im1(q), 2) + (pow(Im2(q), 2) + pow(Im3(q), 2)))"), t26))
}

///|
let quat_sqnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SQNORM")

///|
/// `QUAT_SQNORM`
pub fn quat_sqnorm() -> @kernel.Thm {
  quat_sqnorm_c.get()
}

///|
/// NORM_HX
fn step_37() -> Unit raise {
  let t28 = @simp.rewrite_tac(@list.List([@real.pow_2_sqrt_abs()]))
  let t27 = @tactics.conv_tac(@equal.once_depth_conv(@equal.changed_conv(@calc_rat.real_poly_conv)))
  let t29 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_norm(), hx_components()])), t27), t28)
  norm_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, norm(Hx(a)) == abs(a)"), t29))
}

///|
let norm_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_HX")

///|
/// `NORM_HX`
pub fn norm_hx() -> @kernel.Thm {
  norm_hx_c.get()
}

///|
/// QUAT_NORM_UNITS
fn step_38() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([@real.sqrt_1()]))
  let t30 = @tactics.conv_tac(@equal.once_depth_conv(@equal.changed_conv(@calc_rat.real_poly_conv)))
  let t32 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_norm(), quat_units_components()])), t30), t31)
  quat_norm_units_c.set(@tactics.prove(@term_syntax.parse_term("norm(quat_ii) == real_of_num(1) && norm(jj) == real_of_num(1) && norm(kk) == real_of_num(1)"), t32))
}

///|
let quat_norm_units_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_UNITS")

///|
/// `QUAT_NORM_UNITS`
pub fn quat_norm_units() -> @kernel.Thm {
  quat_norm_units_c.get()
}

///|
/// SIMPLE_QUAT_ARITH_TAC
fn step_39() -> Unit raise {
  let t33 = @tactics.conv_tac(@calc_rat.real_field)
  simple_quat_arith_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_components(), hx_def(), quat_add(), quat_neg(), quat_sub(), quat_mul(), quat_inv()])), t33))
}

///|
let simple_quat_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SIMPLE_QUAT_ARITH_TAC")

///|
/// `SIMPLE_QUAT_ARITH_TAC`
pub fn simple_quat_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (simple_quat_arith_tac_c.get())(x)
}

///|
/// `SIMPLE_QUAT_ARITH`
pub fn simple_quat_arith(x34 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x34
  @tactics.prove(tm, simple_quat_arith_tac)
}

///|
/// QUAT_ADD_SYM
fn step_40() -> Unit raise {
  quat_add_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x + y == y + x"), simple_quat_arith_tac))
}

///|
let quat_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_SYM")

///|
/// `QUAT_ADD_SYM`
pub fn quat_add_sym() -> @kernel.Thm {
  quat_add_sym_c.get()
}

///|
/// QUAT_ADD_ASSOC
fn step_41() -> Unit raise {
  quat_add_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], x + (y + z) == x + y + z"), simple_quat_arith_tac))
}

///|
let quat_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_ASSOC")

///|
/// `QUAT_ADD_ASSOC`
pub fn quat_add_assoc() -> @kernel.Thm {
  quat_add_assoc_c.get()
}

///|
/// QUAT_ADD_LID
fn step_42() -> Unit raise {
  quat_add_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], Hx(real_of_num(0)) + x == x"), simple_quat_arith_tac))
}

///|
let quat_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_LID")

///|
/// `QUAT_ADD_LID`
pub fn quat_add_lid() -> @kernel.Thm {
  quat_add_lid_c.get()
}

///|
/// QUAT_ADD_LINV
fn step_43() -> Unit raise {
  quat_add_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], -x + x == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_add_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_LINV")

///|
/// `QUAT_ADD_LINV`
pub fn quat_add_linv() -> @kernel.Thm {
  quat_add_linv_c.get()
}

///|
/// QUAT_MUL_HX_SYM
fn step_44() -> Unit raise {
  quat_mul_hx_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], ∀ a : Real, quat_mul(q, Hx(a)) == quat_mul(Hx(a), q)"), simple_quat_arith_tac))
}

///|
let quat_mul_hx_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_HX_SYM")

///|
/// `QUAT_MUL_HX_SYM`
pub fn quat_mul_hx_sym() -> @kernel.Thm {
  quat_mul_hx_sym_c.get()
}

///|
/// QUAT_MUL_ASSOC
fn step_45() -> Unit raise {
  quat_mul_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x, quat_mul(y, z)) == quat_mul(quat_mul(x, y), z)"), simple_quat_arith_tac))
}

///|
let quat_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_ASSOC")

///|
/// `QUAT_MUL_ASSOC`
pub fn quat_mul_assoc() -> @kernel.Thm {
  quat_mul_assoc_c.get()
}

///|
/// QUAT_MUL_LID
fn step_46() -> Unit raise {
  quat_mul_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(1)), x) == x"), simple_quat_arith_tac))
}

///|
let quat_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_LID")

///|
/// `QUAT_MUL_LID`
pub fn quat_mul_lid() -> @kernel.Thm {
  quat_mul_lid_c.get()
}

///|
/// QUAT_ADD_LDISTRIB
fn step_47() -> Unit raise {
  quat_add_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x, y + z) == quat_mul(x, y) + quat_mul(x, z)"), simple_quat_arith_tac))
}

///|
let quat_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_LDISTRIB")

///|
/// `QUAT_ADD_LDISTRIB`
pub fn quat_add_ldistrib() -> @kernel.Thm {
  quat_add_ldistrib_c.get()
}

///|
/// QUAT_ADD_AC
fn step_48() -> Unit raise {
  quat_add_ac_c.set(@tactics.prove(@term_syntax.parse_term("(p : Cart[Real, 4]) + (q : Cart[Real, 4]) == q + p && p + q + (r : Cart[Real, 4]) == p + (q + r) && p + (q + r) == q + (p + r)"), simple_quat_arith_tac))
}

///|
let quat_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_AC")

///|
/// `QUAT_ADD_AC`
pub fn quat_add_ac() -> @kernel.Thm {
  quat_add_ac_c.get()
}

///|
/// QUAT_ADD_RID
fn step_49() -> Unit raise {
  quat_add_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], x + Hx(real_of_num(0)) == x"), simple_quat_arith_tac))
}

///|
let quat_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_RID")

///|
/// `QUAT_ADD_RID`
pub fn quat_add_rid() -> @kernel.Thm {
  quat_add_rid_c.get()
}

///|
/// QUAT_MUL_RID
fn step_50() -> Unit raise {
  quat_mul_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(1))) == x"), simple_quat_arith_tac))
}

///|
let quat_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_RID")

///|
/// `QUAT_MUL_RID`
pub fn quat_mul_rid() -> @kernel.Thm {
  quat_mul_rid_c.get()
}

///|
/// QUAT_ADD_RINV
fn step_51() -> Unit raise {
  quat_add_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], x + -x == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_add_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_RINV")

///|
/// `QUAT_ADD_RINV`
pub fn quat_add_rinv() -> @kernel.Thm {
  quat_add_rinv_c.get()
}

///|
/// QUAT_ADD_RDISTRIB
fn step_52() -> Unit raise {
  quat_add_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x + y, z) == quat_mul(x, z) + quat_mul(y, z)"), simple_quat_arith_tac))
}

///|
let quat_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_RDISTRIB")

///|
/// `QUAT_ADD_RDISTRIB`
pub fn quat_add_rdistrib() -> @kernel.Thm {
  quat_add_rdistrib_c.get()
}

///|
/// QUAT_EQ_ADD_LCANCEL
fn step_53() -> Unit raise {
  quat_eq_add_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (x + y == x + z) == (y == z)"), simple_quat_arith_tac))
}

///|
let quat_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_ADD_LCANCEL")

///|
/// `QUAT_EQ_ADD_LCANCEL`
pub fn quat_eq_add_lcancel() -> @kernel.Thm {
  quat_eq_add_lcancel_c.get()
}

///|
/// QUAT_EQ_ADD_RCANCEL
fn step_54() -> Unit raise {
  quat_eq_add_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (x + z == y + z) == (x == y)"), simple_quat_arith_tac))
}

///|
let quat_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_ADD_RCANCEL")

///|
/// `QUAT_EQ_ADD_RCANCEL`
pub fn quat_eq_add_rcancel() -> @kernel.Thm {
  quat_eq_add_rcancel_c.get()
}

///|
/// QUAT_MUL_RZERO
fn step_55() -> Unit raise {
  quat_mul_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(0))) == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_RZERO")

///|
/// `QUAT_MUL_RZERO`
pub fn quat_mul_rzero() -> @kernel.Thm {
  quat_mul_rzero_c.get()
}

///|
/// QUAT_MUL_LZERO
fn step_56() -> Unit raise {
  quat_mul_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(0)), x) == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_LZERO")

///|
/// `QUAT_MUL_LZERO`
pub fn quat_mul_lzero() -> @kernel.Thm {
  quat_mul_lzero_c.get()
}

///|
/// QUAT_NEG_NEG
fn step_57() -> Unit raise {
  quat_neg_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], --x == x"), simple_quat_arith_tac))
}

///|
let quat_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_NEG")

///|
/// `QUAT_NEG_NEG`
pub fn quat_neg_neg() -> @kernel.Thm {
  quat_neg_neg_c.get()
}

///|
/// QUAT_MUL_RNEG
fn step_58() -> Unit raise {
  quat_mul_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(x, -y) == -quat_mul(x, y)"), simple_quat_arith_tac))
}

///|
let quat_mul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_RNEG")

///|
/// `QUAT_MUL_RNEG`
pub fn quat_mul_rneg() -> @kernel.Thm {
  quat_mul_rneg_c.get()
}

///|
/// QUAT_MUL_LNEG
fn step_59() -> Unit raise {
  quat_mul_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(-x, y) == -quat_mul(x, y)"), simple_quat_arith_tac))
}

///|
let quat_mul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_LNEG")

///|
/// `QUAT_MUL_LNEG`
pub fn quat_mul_lneg() -> @kernel.Thm {
  quat_mul_lneg_c.get()
}

///|
/// QUAT_NEG_ADD
fn step_60() -> Unit raise {
  quat_neg_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -(x + y) == -x + -y"), simple_quat_arith_tac))
}

///|
let quat_neg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_ADD")

///|
/// `QUAT_NEG_ADD`
pub fn quat_neg_add() -> @kernel.Thm {
  quat_neg_add_c.get()
}

///|
/// QUAT_NEG_0
fn step_61() -> Unit raise {
  quat_neg_0_c.set(@tactics.prove(@term_syntax.parse_term("-Hx(real_of_num(0)) == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_neg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_0")

///|
/// `QUAT_NEG_0`
pub fn quat_neg_0() -> @kernel.Thm {
  quat_neg_0_c.get()
}

///|
/// QUAT_EQ_ADD_LCANCEL_0
fn step_62() -> Unit raise {
  quat_eq_add_lcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (x + y == x) == (y == Hx(real_of_num(0)))"), simple_quat_arith_tac))
}

///|
let quat_eq_add_lcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_ADD_LCANCEL_0")

///|
/// `QUAT_EQ_ADD_LCANCEL_0`
pub fn quat_eq_add_lcancel_0() -> @kernel.Thm {
  quat_eq_add_lcancel_0_c.get()
}

///|
/// QUAT_EQ_ADD_RCANCEL_0
fn step_63() -> Unit raise {
  quat_eq_add_rcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (x + y == y) == (x == Hx(real_of_num(0)))"), simple_quat_arith_tac))
}

///|
let quat_eq_add_rcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_ADD_RCANCEL_0")

///|
/// `QUAT_EQ_ADD_RCANCEL_0`
pub fn quat_eq_add_rcancel_0() -> @kernel.Thm {
  quat_eq_add_rcancel_0_c.get()
}

///|
/// QUAT_LNEG_UNIQ
fn step_64() -> Unit raise {
  quat_lneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (x + y == Hx(real_of_num(0))) == (x == -y)"), simple_quat_arith_tac))
}

///|
let quat_lneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_LNEG_UNIQ")

///|
/// `QUAT_LNEG_UNIQ`
pub fn quat_lneg_uniq() -> @kernel.Thm {
  quat_lneg_uniq_c.get()
}

///|
/// QUAT_RNEG_UNIQ
fn step_65() -> Unit raise {
  quat_rneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (x + y == Hx(real_of_num(0))) == (y == -x)"), simple_quat_arith_tac))
}

///|
let quat_rneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_RNEG_UNIQ")

///|
/// `QUAT_RNEG_UNIQ`
pub fn quat_rneg_uniq() -> @kernel.Thm {
  quat_rneg_uniq_c.get()
}

///|
/// QUAT_NEG_LMUL
fn step_66() -> Unit raise {
  quat_neg_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -quat_mul(x, y) == quat_mul(-x, y)"), simple_quat_arith_tac))
}

///|
let quat_neg_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_LMUL")

///|
/// `QUAT_NEG_LMUL`
pub fn quat_neg_lmul() -> @kernel.Thm {
  quat_neg_lmul_c.get()
}

///|
/// QUAT_NEG_RMUL
fn step_67() -> Unit raise {
  quat_neg_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -quat_mul(x, y) == quat_mul(x, -y)"), simple_quat_arith_tac))
}

///|
let quat_neg_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_RMUL")

///|
/// `QUAT_NEG_RMUL`
pub fn quat_neg_rmul() -> @kernel.Thm {
  quat_neg_rmul_c.get()
}

///|
/// QUAT_NEG_MUL2
fn step_68() -> Unit raise {
  quat_neg_mul2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(-x, -y) == quat_mul(x, y)"), simple_quat_arith_tac))
}

///|
let quat_neg_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_MUL2")

///|
/// `QUAT_NEG_MUL2`
pub fn quat_neg_mul2() -> @kernel.Thm {
  quat_neg_mul2_c.get()
}

///|
/// QUAT_SUB_ADD
fn step_69() -> Unit raise {
  quat_sub_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - y + y == x"), simple_quat_arith_tac))
}

///|
let quat_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_ADD")

///|
/// `QUAT_SUB_ADD`
pub fn quat_sub_add() -> @kernel.Thm {
  quat_sub_add_c.get()
}

///|
/// QUAT_SUB_ADD2
fn step_70() -> Unit raise {
  quat_sub_add2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], y + (x - y) == x"), simple_quat_arith_tac))
}

///|
let quat_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_ADD2")

///|
/// `QUAT_SUB_ADD2`
pub fn quat_sub_add2() -> @kernel.Thm {
  quat_sub_add2_c.get()
}

///|
/// QUAT_SUB_REFL
fn step_71() -> Unit raise {
  quat_sub_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], x - x == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_REFL")

///|
/// `QUAT_SUB_REFL`
pub fn quat_sub_refl() -> @kernel.Thm {
  quat_sub_refl_c.get()
}

///|
/// QUAT_SUB_0
fn step_72() -> Unit raise {
  quat_sub_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (x - y == Hx(real_of_num(0))) == (x == y)"), simple_quat_arith_tac))
}

///|
let quat_sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_0")

///|
/// `QUAT_SUB_0`
pub fn quat_sub_0() -> @kernel.Thm {
  quat_sub_0_c.get()
}

///|
/// QUAT_NEG_EQ_0
fn step_73() -> Unit raise {
  quat_neg_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], (-x == Hx(real_of_num(0))) == (x == Hx(real_of_num(0)))"), simple_quat_arith_tac))
}

///|
let quat_neg_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_EQ_0")

///|
/// `QUAT_NEG_EQ_0`
pub fn quat_neg_eq_0() -> @kernel.Thm {
  quat_neg_eq_0_c.get()
}

///|
/// QUAT_NEG_SUB
fn step_74() -> Unit raise {
  quat_neg_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -(x - y) == y - x"), simple_quat_arith_tac))
}

///|
let quat_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_SUB")

///|
/// `QUAT_NEG_SUB`
pub fn quat_neg_sub() -> @kernel.Thm {
  quat_neg_sub_c.get()
}

///|
/// QUAT_ADD_SUB
fn step_75() -> Unit raise {
  quat_add_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x + y - x == y"), simple_quat_arith_tac))
}

///|
let quat_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_SUB")

///|
/// `QUAT_ADD_SUB`
pub fn quat_add_sub() -> @kernel.Thm {
  quat_add_sub_c.get()
}

///|
/// QUAT_NEG_EQ
fn step_76() -> Unit raise {
  quat_neg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (-x == y) == (x == -y)"), simple_quat_arith_tac))
}

///|
let quat_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_EQ")

///|
/// `QUAT_NEG_EQ`
pub fn quat_neg_eq() -> @kernel.Thm {
  quat_neg_eq_c.get()
}

///|
/// QUAT_NEG_MINUS1
fn step_77() -> Unit raise {
  quat_neg_minus1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], -x == quat_mul(-Hx(real_of_num(1)), x)"), simple_quat_arith_tac))
}

///|
let quat_neg_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_MINUS1")

///|
/// `QUAT_NEG_MINUS1`
pub fn quat_neg_minus1() -> @kernel.Thm {
  quat_neg_minus1_c.get()
}

///|
/// QUAT_SUB_SUB
fn step_78() -> Unit raise {
  quat_sub_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - y - x == -y"), simple_quat_arith_tac))
}

///|
let quat_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_SUB")

///|
/// `QUAT_SUB_SUB`
pub fn quat_sub_sub() -> @kernel.Thm {
  quat_sub_sub_c.get()
}

///|
/// QUAT_ADD2_SUB2
fn step_79() -> Unit raise {
  quat_add2_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 4], ∀ b : Cart[Real, 4], ∀ c : Cart[Real, 4], ∀ d : Cart[Real, 4], a + b - (c + d) == a - c + (b - d)"), simple_quat_arith_tac))
}

///|
let quat_add2_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD2_SUB2")

///|
/// `QUAT_ADD2_SUB2`
pub fn quat_add2_sub2() -> @kernel.Thm {
  quat_add2_sub2_c.get()
}

///|
/// QUAT_SUB_LZERO
fn step_80() -> Unit raise {
  quat_sub_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], Hx(real_of_num(0)) - x == -x"), simple_quat_arith_tac))
}

///|
let quat_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_LZERO")

///|
/// `QUAT_SUB_LZERO`
pub fn quat_sub_lzero() -> @kernel.Thm {
  quat_sub_lzero_c.get()
}

///|
/// QUAT_SUB_RZERO
fn step_81() -> Unit raise {
  quat_sub_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], x - Hx(real_of_num(0)) == x"), simple_quat_arith_tac))
}

///|
let quat_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_RZERO")

///|
/// `QUAT_SUB_RZERO`
pub fn quat_sub_rzero() -> @kernel.Thm {
  quat_sub_rzero_c.get()
}

///|
/// QUAT_SUB_LNEG
fn step_82() -> Unit raise {
  quat_sub_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -x - y == -(x + y)"), simple_quat_arith_tac))
}

///|
let quat_sub_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_LNEG")

///|
/// `QUAT_SUB_LNEG`
pub fn quat_sub_lneg() -> @kernel.Thm {
  quat_sub_lneg_c.get()
}

///|
/// QUAT_SUB_RNEG
fn step_83() -> Unit raise {
  quat_sub_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - -y == x + y"), simple_quat_arith_tac))
}

///|
let quat_sub_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_RNEG")

///|
/// `QUAT_SUB_RNEG`
pub fn quat_sub_rneg() -> @kernel.Thm {
  quat_sub_rneg_c.get()
}

///|
/// QUAT_SUB_NEG2
fn step_84() -> Unit raise {
  quat_sub_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], -x - -y == y - x"), simple_quat_arith_tac))
}

///|
let quat_sub_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_NEG2")

///|
/// `QUAT_SUB_NEG2`
pub fn quat_sub_neg2() -> @kernel.Thm {
  quat_sub_neg2_c.get()
}

///|
/// QUAT_SUB_TRIANGLE
fn step_85() -> Unit raise {
  quat_sub_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 4], ∀ b : Cart[Real, 4], ∀ c : Cart[Real, 4], a - b + (b - c) == a - c"), simple_quat_arith_tac))
}

///|
let quat_sub_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_TRIANGLE")

///|
/// `QUAT_SUB_TRIANGLE`
pub fn quat_sub_triangle() -> @kernel.Thm {
  quat_sub_triangle_c.get()
}

///|
/// QUAT_EQ_SUB_LADD
fn step_86() -> Unit raise {
  quat_eq_sub_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (x == y - z) == (x + z == y)"), simple_quat_arith_tac))
}

///|
let quat_eq_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_SUB_LADD")

///|
/// `QUAT_EQ_SUB_LADD`
pub fn quat_eq_sub_ladd() -> @kernel.Thm {
  quat_eq_sub_ladd_c.get()
}

///|
/// QUAT_EQ_SUB_RADD
fn step_87() -> Unit raise {
  quat_eq_sub_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (x - y == z) == (x == z + y)"), simple_quat_arith_tac))
}

///|
let quat_eq_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_SUB_RADD")

///|
/// `QUAT_EQ_SUB_RADD`
pub fn quat_eq_sub_radd() -> @kernel.Thm {
  quat_eq_sub_radd_c.get()
}

///|
/// QUAT_SUB_SUB2
fn step_88() -> Unit raise {
  quat_sub_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - (x - y) == y"), simple_quat_arith_tac))
}

///|
let quat_sub_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_SUB2")

///|
/// `QUAT_SUB_SUB2`
pub fn quat_sub_sub2() -> @kernel.Thm {
  quat_sub_sub2_c.get()
}

///|
/// QUAT_ADD_SUB2
fn step_89() -> Unit raise {
  quat_add_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - (x + y) == -y"), simple_quat_arith_tac))
}

///|
let quat_add_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_SUB2")

///|
/// `QUAT_ADD_SUB2`
pub fn quat_add_sub2() -> @kernel.Thm {
  quat_add_sub2_c.get()
}

///|
/// QUAT_EQ_NEG2
fn step_90() -> Unit raise {
  quat_eq_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (-x == -y) == (x == y)"), simple_quat_arith_tac))
}

///|
let quat_eq_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_NEG2")

///|
/// `QUAT_EQ_NEG2`
pub fn quat_eq_neg2() -> @kernel.Thm {
  quat_eq_neg2_c.get()
}

///|
/// QUAT_SUB_LDISTRIB
fn step_91() -> Unit raise {
  quat_sub_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x, y - z) == quat_mul(x, y) - quat_mul(x, z)"), simple_quat_arith_tac))
}

///|
let quat_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_LDISTRIB")

///|
/// `QUAT_SUB_LDISTRIB`
pub fn quat_sub_ldistrib() -> @kernel.Thm {
  quat_sub_ldistrib_c.get()
}

///|
/// QUAT_SUB_RDISTRIB
fn step_92() -> Unit raise {
  quat_sub_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x - y, z) == quat_mul(x, z) - quat_mul(y, z)"), simple_quat_arith_tac))
}

///|
let quat_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_RDISTRIB")

///|
/// `QUAT_SUB_RDISTRIB`
pub fn quat_sub_rdistrib() -> @kernel.Thm {
  quat_sub_rdistrib_c.get()
}

///|
/// QUAT_MUL_2
fn step_93() -> Unit raise {
  quat_mul_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(2)), x) == x + x"), simple_quat_arith_tac))
}

///|
let quat_mul_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_2")

///|
/// `QUAT_MUL_2`
pub fn quat_mul_2() -> @kernel.Thm {
  quat_mul_2_c.get()
}

///|
/// QUAT_II_NZ
fn step_94() -> Unit raise {
  let t35 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_ii()])), simple_quat_arith_tac)
  quat_ii_nz_c.set(@tactics.prove(@term_syntax.parse_term("!(quat_ii == Hx(real_of_num(0)))"), t35))
}

///|
let quat_ii_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_II_NZ")

///|
/// `QUAT_II_NZ`
pub fn quat_ii_nz() -> @kernel.Thm {
  quat_ii_nz_c.get()
}

///|
/// QUAT_JJ_NZ
fn step_95() -> Unit raise {
  let t36 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_jj()])), simple_quat_arith_tac)
  quat_jj_nz_c.set(@tactics.prove(@term_syntax.parse_term("!(jj == Hx(real_of_num(0)))"), t36))
}

///|
let quat_jj_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_JJ_NZ")

///|
/// `QUAT_JJ_NZ`
pub fn quat_jj_nz() -> @kernel.Thm {
  quat_jj_nz_c.get()
}

///|
/// QUAT_KK_NZ
fn step_96() -> Unit raise {
  let t37 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_kk()])), simple_quat_arith_tac)
  quat_kk_nz_c.set(@tactics.prove(@term_syntax.parse_term("!(kk == Hx(real_of_num(0)))"), t37))
}

///|
let quat_kk_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_KK_NZ")

///|
/// `QUAT_KK_NZ`
pub fn quat_kk_nz() -> @kernel.Thm {
  quat_kk_nz_c.get()
}

///|
/// QUAT_MUL_LINV
fn step_97() -> Unit raise {
  let t38 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq_0()])), simple_quat_arith_tac)
  quat_mul_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], !(q == Hx(real_of_num(0))) → quat_mul(quat_inv(q), q) == Hx(real_of_num(1))"), t38))
}

///|
let quat_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_LINV")

///|
/// `QUAT_MUL_LINV`
pub fn quat_mul_linv() -> @kernel.Thm {
  quat_mul_linv_c.get()
}

///|
/// QUAT_ENTIRE
fn step_98() -> Unit raise {
  let t39 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq_0()])), simple_quat_arith_tac)
  quat_entire_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], (quat_mul(x, y) == Hx(real_of_num(0))) == (x == Hx(real_of_num(0)) || y == Hx(real_of_num(0)))"), t39))
}

///|
let quat_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ENTIRE")

///|
/// `QUAT_ENTIRE`
pub fn quat_entire() -> @kernel.Thm {
  quat_entire_c.get()
}

///|
/// QUAT_MUL_RINV
fn step_99() -> Unit raise {
  let t40 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq_0()])), simple_quat_arith_tac)
  quat_mul_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], !(q == Hx(real_of_num(0))) → quat_mul(q, quat_inv(q)) == Hx(real_of_num(1))"), t40))
}

///|
let quat_mul_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_RINV")

///|
/// `QUAT_MUL_RINV`
pub fn quat_mul_rinv() -> @kernel.Thm {
  quat_mul_rinv_c.get()
}

///|
/// HX_INJ
fn step_100() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([hx_def(), quat_eq(), quat_components()]))
  hx_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (Hx(x) == Hx(y)) == (x == y)"), t41))
}

///|
let hx_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_INJ")

///|
/// `HX_INJ`
pub fn hx_inj() -> @kernel.Thm {
  hx_inj_c.get()
}

///|
/// HX_NEG
fn step_101() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([hx_def(), quat_neg(), quat_components(), @calc_int.real_neg_0()]))
  hx_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Hx(-x) == -Hx(x)"), t42))
}

///|
let hx_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_NEG")

///|
/// `HX_NEG`
pub fn hx_neg() -> @kernel.Thm {
  hx_neg_c.get()
}

///|
/// HX_ADD
fn step_102() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([hx_def(), quat_add(), quat_components(), @realax.real_add_lid()]))
  hx_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Hx(x + y) == Hx(x) + Hx(y)"), t43))
}

///|
let hx_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_ADD")

///|
/// `HX_ADD`
pub fn hx_add() -> @kernel.Thm {
  hx_add_c.get()
}

///|
/// HX_SUB
fn step_103() -> Unit raise {
  let t44 = @simp.rewrite_tac(@list.List([quat_sub(), @realax.real_sub(), hx_add(), hx_neg()]))
  hx_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Hx(x - y) == Hx(x) - Hx(y)"), t44))
}

///|
let hx_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_SUB")

///|
/// `HX_SUB`
pub fn hx_sub() -> @kernel.Thm {
  hx_sub_c.get()
}

///|
/// HX_INV
fn step_104() -> Unit raise {
  let t52 = @tactics.conv_tac(@calc_rat.real_field)
  let t51 = @tactics.pop_assum(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s49 = @tactics.mp_tac(x48)
    fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s49(x50)
    }
  })
  let t47 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t46 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t53 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([hx_def(), quat_inv(), quat_components(), quat_eq()]))), t45), t46), t47), t51), t52)
  hx_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Hx(inv(x)) == quat_inv(Hx(x))"), t53))
}

///|
let hx_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_INV")

///|
/// `HX_INV`
pub fn hx_inv() -> @kernel.Thm {
  hx_inv_c.get()
}

///|
/// HX_MUL
fn step_105() -> Unit raise {
  let t54 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero(), @calc_int.real_add_rid()]))
  let t55 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hx_def(), quat_mul(), quat_components(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()])), t54)
  hx_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Hx(x * y) == quat_mul(Hx(x), Hx(y))"), t55))
}

///|
let hx_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_MUL")

///|
/// `HX_MUL`
pub fn hx_mul() -> @kernel.Thm {
  hx_mul_c.get()
}

///|
/// HX_POW
fn step_106() -> Unit raise {
  let t56 = @simp.asm_rewrite_tac(@list.List([quat_pow(), @realax.real_pow(), hx_mul()]))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t56)
  hx_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, Hx(pow(x, n)) == quat_pow(Hx(x), n)"), t57))
}

///|
let hx_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_POW")

///|
/// `HX_POW`
pub fn hx_pow() -> @kernel.Thm {
  hx_pow_c.get()
}

///|
/// HX_ABS
fn step_107() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.pow_2_sqrt_abs()]))
  let t58 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hx_def(), quat_norm(), quat_eq(), quat_components()])), t58), t59)
  hx_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Hx(abs(x)) == Hx(norm(Hx(x)))"), t60))
}

///|
let hx_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_ABS")

///|
/// `HX_ABS`
pub fn hx_abs() -> @kernel.Thm {
  hx_abs_c.get()
}

///|
/// QUAT_ADD_COMPONENTS
fn step_108() -> Unit raise {
  let t61 = @simp.rewrite_tac(@list.List([quat_add(), quat_components()]))
  quat_add_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_Re(x + y) == quat_Re(x) + quat_Re(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im1(x + y) == Im1(x) + Im1(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im2(x + y) == Im2(x) + Im2(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im3(x + y) == Im3(x) + Im3(y))"), t61))
}

///|
let quat_add_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_COMPONENTS")

///|
/// `QUAT_ADD_COMPONENTS`
pub fn quat_add_components() -> @kernel.Thm {
  quat_add_components_c.get()
}

///|
/// QUAT_NEG_COMPONENTS
fn step_109() -> Unit raise {
  let t62 = @simp.rewrite_tac(@list.List([quat_neg(), quat_components()]))
  quat_neg_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], quat_Re(-x) == -quat_Re(x)) && (∀ x : Cart[Real, 4], Im1(-x) == -Im1(x)) && (∀ x : Cart[Real, 4], Im2(-x) == -Im2(x)) && (∀ x : Cart[Real, 4], Im3(-x) == -Im3(x))"), t62))
}

///|
let quat_neg_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NEG_COMPONENTS")

///|
/// `QUAT_NEG_COMPONENTS`
pub fn quat_neg_components() -> @kernel.Thm {
  quat_neg_components_c.get()
}

///|
/// QUAT_SUB_COMPONENTS
fn step_110() -> Unit raise {
  let t63 = @simp.rewrite_tac(@list.List([quat_sub(), @realax.real_sub(), quat_add_components(), quat_neg_components()]))
  quat_sub_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_Re(x - y) == quat_Re(x) - quat_Re(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im1(x - y) == Im1(x) - Im1(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im2(x - y) == Im2(x) - Im2(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], Im3(x - y) == Im3(x) - Im3(y))"), t63))
}

///|
let quat_sub_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SUB_COMPONENTS")

///|
/// `QUAT_SUB_COMPONENTS`
pub fn quat_sub_components() -> @kernel.Thm {
  quat_sub_components_c.get()
}

///|
/// QUAT_EXPAND
fn step_111() -> Unit raise {
  let t65 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_ii(), quat_jj(), quat_kk()])), simple_quat_arith_tac)
  quat_expand_c.set(@lib.time(fn(x64 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x64.0, x64.1)
  }, (@term_syntax.parse_term("∀ q : Cart[Real, 4], q == Hx(quat_Re(q)) + (quat_mul(quat_ii, Hx(Im1(q))) + (quat_mul(jj, Hx(Im2(q))) + quat_mul(kk, Hx(Im3(q)))))"), t65)))
}

///|
let quat_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EXPAND")

///|
/// `QUAT_EXPAND`
pub fn quat_expand() -> @kernel.Thm {
  quat_expand_c.get()
}

///|
/// QUAT_TRAD
fn step_112() -> Unit raise {
  let t67 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_ii(), quat_jj(), quat_kk()])), simple_quat_arith_tac)
  quat_trad_c.set(@lib.time(fn(x66 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x66.0, x66.1)
  }, (@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, quat((x, y, z, w)) == Hx(x) + (quat_mul(quat_ii, Hx(y)) + (quat_mul(jj, Hx(z)) + quat_mul(kk, Hx(w))))"), t67)))
}

///|
let quat_trad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_TRAD")

///|
/// `QUAT_TRAD`
pub fn quat_trad() -> @kernel.Thm {
  quat_trad_c.get()
}

///|
/// QUAT_MUL_UNITS_COMPONENTS
fn step_113() -> Unit raise {
  let t68 = @tactics.conv_tac(@calc_rat.real_arith)
  let t69 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_mul(), quat_components(), quat_units_components()])), t68)
  quat_mul_units_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], quat_Re(quat_mul(q, quat_ii)) == -Im1(q) && quat_Re(quat_mul(quat_ii, q)) == -Im1(q)) && (∀ q : Cart[Real, 4], Im1(quat_mul(q, quat_ii)) == quat_Re(q) && Im1(quat_mul(quat_ii, q)) == quat_Re(q)) && (∀ q : Cart[Real, 4], Im2(quat_mul(q, quat_ii)) == Im3(q) && Im2(quat_mul(quat_ii, q)) == -Im3(q)) && (∀ q : Cart[Real, 4], Im3(quat_mul(q, quat_ii)) == -Im2(q) && Im3(quat_mul(quat_ii, q)) == Im2(q)) && (∀ q : Cart[Real, 4], quat_Re(quat_mul(q, jj)) == -Im2(q) && quat_Re(quat_mul(jj, q)) == -Im2(q)) && (∀ q : Cart[Real, 4], Im1(quat_mul(q, jj)) == -Im3(q) && Im1(quat_mul(jj, q)) == Im3(q)) && (∀ q : Cart[Real, 4], Im2(quat_mul(q, jj)) == quat_Re(q) && Im2(quat_mul(jj, q)) == quat_Re(q)) && (∀ q : Cart[Real, 4], Im3(quat_mul(q, jj)) == Im1(q) && Im3(quat_mul(jj, q)) == -Im1(q)) && (∀ q : Cart[Real, 4], quat_Re(quat_mul(q, kk)) == -Im3(q) && quat_Re(quat_mul(kk, q)) == -Im3(q)) && (∀ q : Cart[Real, 4], Im1(quat_mul(q, kk)) == Im2(q) && Im1(quat_mul(kk, q)) == -Im2(q)) && (∀ q : Cart[Real, 4], Im2(quat_mul(q, kk)) == -Im1(q) && Im2(quat_mul(kk, q)) == Im1(q)) && (∀ q : Cart[Real, 4], Im3(quat_mul(q, kk)) == quat_Re(q) && Im3(quat_mul(kk, q)) == quat_Re(q))"), t69))
}

///|
let quat_mul_units_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_UNITS_COMPONENTS")

///|
/// `QUAT_MUL_UNITS_COMPONENTS`
pub fn quat_mul_units_components() -> @kernel.Thm {
  quat_mul_units_components_c.get()
}

///|
/// QUAT_CMUL_COMPONENTS
fn step_114() -> Unit raise {
  let t70 = @simp.rewrite_tac(@list.List([quat_components_def(), @vectors.vector_mul_component()]))
  quat_cmul_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Real, ∀ q : Cart[Real, 4], quat_Re(op_pct(a, q)) == a * quat_Re(q)) && (∀ a : Real, ∀ q : Cart[Real, 4], Im1(op_pct(a, q)) == a * Im1(q)) && (∀ a : Real, ∀ q : Cart[Real, 4], Im2(op_pct(a, q)) == a * Im2(q)) && (∀ a : Real, ∀ q : Cart[Real, 4], Im3(op_pct(a, q)) == a * Im3(q))"), t70))
}

///|
let quat_cmul_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CMUL_COMPONENTS")

///|
/// `QUAT_CMUL_COMPONENTS`
pub fn quat_cmul_components() -> @kernel.Thm {
  quat_cmul_components_c.get()
}

///|
/// MUL_HX_COMPONENTS
fn step_115() -> Unit raise {
  mul_hx_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Real, ∀ q : Cart[Real, 4], quat_Re(quat_mul(Hx(x), q)) == x * quat_Re(q)) && (∀ x : Real, ∀ q : Cart[Real, 4], quat_Re(quat_mul(q, Hx(x))) == quat_Re(q) * x) && (∀ x : Real, ∀ q : Cart[Real, 4], Im1(quat_mul(Hx(x), q)) == x * Im1(q)) && (∀ x : Real, ∀ q : Cart[Real, 4], Im1(quat_mul(q, Hx(x))) == Im1(q) * x) && (∀ x : Real, ∀ q : Cart[Real, 4], Im2(quat_mul(Hx(x), q)) == x * Im2(q)) && (∀ x : Real, ∀ q : Cart[Real, 4], Im2(quat_mul(q, Hx(x))) == Im2(q) * x) && (∀ x : Real, ∀ q : Cart[Real, 4], Im3(quat_mul(Hx(x), q)) == x * Im3(q)) && (∀ x : Real, ∀ q : Cart[Real, 4], Im3(quat_mul(q, Hx(x))) == Im3(q) * x)"), simple_quat_arith_tac))
}

///|
let mul_hx_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_HX_COMPONENTS")

///|
/// `MUL_HX_COMPONENTS`
pub fn mul_hx_components() -> @kernel.Thm {
  mul_hx_components_c.get()
}

///|
/// is_quat_const
fn step_116() -> Unit raise {
  let hx_tm = @term_syntax.parse_term("Hx")
  is_quat_const_c.set(fn(x71 : @kernel.Term) -> Bool raise {
    let tm = x71
    if @kernel.is_comb(tm) {
      let (l, r) = @kernel.dest_comb(tm)
      ((l == hx_tm) && @calc_int.is_ratconst(r))
    } else {
      false
    }
  })
}

///|
let is_quat_const_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_quat_const")

///|
/// `is_quat_const`
pub fn is_quat_const(x : @kernel.Term) -> Bool raise {
  (is_quat_const_c.get())(x)
}

///|
/// dest_quat_const
fn step_117() -> Unit raise {
  let hx_tm = @term_syntax.parse_term("Hx")
  dest_quat_const_c.set(fn(x72 : @kernel.Term) -> @num.Num raise {
    let tm = x72
    let (l, r) = @kernel.dest_comb(tm)
    if (l == hx_tm) {
      @calc_int.rat_of_term(r)
    } else {
      raise Failure("dest_quat_const")
    }
  })
}

///|
let dest_quat_const_c : @lib.Cell[(@kernel.Term) -> @num.Num raise] = @lib.Cell::new("dest_quat_const")

///|
/// `dest_quat_const`
pub fn dest_quat_const(x : @kernel.Term) -> @num.Num raise {
  (dest_quat_const_c.get())(x)
}

///|
/// mk_quat_const
fn step_118() -> Unit raise {
  let hx_tm = @term_syntax.parse_term("Hx")
  mk_quat_const_c.set(fn(x73 : @num.Num) -> @kernel.Term raise {
    let r = x73
    @kernel.mk_comb(hx_tm, @calc_int.term_of_rat(r))
  })
}

///|
let mk_quat_const_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_quat_const")

///|
/// `mk_quat_const`
pub fn mk_quat_const(x : @num.Num) -> @kernel.Term raise {
  (mk_quat_const_c.get())(x)
}

///|
/// QUAT_RAT_EQ_CONV
fn step_119() -> Unit raise {
  quat_rat_eq_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x74 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x74
  }, @list.List([hx_inj()])), @calc_rat.real_rat_eq_conv))
}

///|
let quat_rat_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_RAT_EQ_CONV")

///|
/// `QUAT_RAT_EQ_CONV`
pub fn quat_rat_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_rat_eq_conv_c.get())(x)
}

///|
/// QUAT_RAT_MUL_CONV
fn step_120() -> Unit raise {
  let t76 = @equal.rand_conv(@calc_rat.real_rat_mul_conv)
  quat_rat_mul_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x75 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x75
  }, @list.List([@equal.gsym(hx_mul())])), t76))
}

///|
let quat_rat_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_RAT_MUL_CONV")

///|
/// `QUAT_RAT_MUL_CONV`
pub fn quat_rat_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_rat_mul_conv_c.get())(x)
}

///|
/// QUAT_RAT_ADD_CONV
fn step_121() -> Unit raise {
  let t78 = @equal.rand_conv(@calc_rat.real_rat_add_conv)
  quat_rat_add_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x77 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x77
  }, @list.List([@equal.gsym(hx_add())])), t78))
}

///|
let quat_rat_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_RAT_ADD_CONV")

///|
/// `QUAT_RAT_ADD_CONV`
pub fn quat_rat_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_rat_add_conv_c.get())(x)
}

///|
/// QUAT_RAT_POW_CONV
fn step_122() -> Unit raise {
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let pth = @equal.sym(@bool.specl(@list.List([x_tm, n_tm]), hx_pow()))
  quat_rat_pow_conv_c.set(fn(x79 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x79
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, bod) = @kernel.dest_comb(lop)
    let th1 = @kernel.inst_rule(@list.List([(@kernel.rand(bod), x_tm), (r, n_tm)]), pth)
    let (tm1, tm2) = @kernel.dest_comb(@kernel.concl(th1))
    if (@kernel.rand(tm1) != tm) {
      raise Failure("QUAT_RAT_POW_CONV")
    } else {
      let (tm3, tm4) = @kernel.dest_comb(tm2)
      @kernel.trans(th1, @equal.ap_term(tm3, @calc_rat.real_rat_reduce_conv(tm4)))
    }
  })
}

///|
let quat_rat_pow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("QUAT_RAT_POW_CONV")

///|
/// `QUAT_RAT_POW_CONV`
pub fn quat_rat_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_rat_pow_conv_c.get())(x)
}

///|
/// QUAT_POW_SUC_ALT
fn step_123() -> Unit raise {
  let t80 = @simp.asm_rewrite_tac(@list.List([]))
  let t81 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([quat_pow()])), t80), simple_quat_arith_tac)
  let t82 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_pow()])), simple_quat_arith_tac), t81])
  let t83 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t82)
  quat_pow_suc_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(x, SUC(n)) == quat_mul(quat_pow(x, n), x)"), t83))
}

///|
let quat_pow_suc_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_SUC_ALT")

///|
/// `QUAT_POW_SUC_ALT`
pub fn quat_pow_suc_alt() -> @kernel.Thm {
  quat_pow_suc_alt_c.get()
}

///|
/// QUAT_POW_LMUL_SYM
fn step_124() -> Unit raise {
  let t86 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(quat_mul_assoc())]))
  let t85 = @simp.asm_rewrite_tac(@list.List([quat_pow(), quat_mul_lid(), quat_mul_rid(), quat_mul_assoc()]))
  let t84 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t84), @tactics.disch_tac), @quaternions_misc.induct_tac), t85), t86)
  quat_pow_lmul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ n : Num, quat_mul(p, q) == quat_mul(q, p) → quat_mul(p, quat_pow(q, n)) == quat_mul(quat_pow(q, n), p)"), t87))
}

///|
let quat_pow_lmul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_LMUL_SYM")

///|
/// `QUAT_POW_LMUL_SYM`
pub fn quat_pow_lmul_sym() -> @kernel.Thm {
  quat_pow_lmul_sym_c.get()
}

///|
/// QUAT_POW_RMUL_SYM
fn step_125() -> Unit raise {
  let t91 = @simp.asm_rewrite_tac(@list.List([quat_mul_assoc()]))
  let t90 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(quat_mul_assoc())]))
  let t89 = @simp.rewrite_tac(@list.List([quat_pow(), quat_mul_lid(), quat_mul_rid()]))
  let t88 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t92 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t88), @tactics.disch_tac), @quaternions_misc.induct_tac), t89), t90), t91)
  quat_pow_rmul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ m : Num, quat_mul(p, q) == quat_mul(q, p) → quat_mul(quat_pow(p, m), q) == quat_mul(q, quat_pow(p, m))"), t92))
}

///|
let quat_pow_rmul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_RMUL_SYM")

///|
/// `QUAT_POW_RMUL_SYM`
pub fn quat_pow_rmul_sym() -> @kernel.Thm {
  quat_pow_rmul_sym_c.get()
}

///|
/// QUAT_POW_MUL_SYM
fn step_126() -> Unit raise {
  let t96 = @simp.asm_simp_tac(@list.List([quat_pow_lmul_sym()]))
  let t95 = @simp.rewrite_tac(@list.List([quat_mul_assoc()]))
  let t94 = @simp.asm_rewrite_tac(@list.List([quat_pow(), quat_mul_lid(), quat_mul_rid(), @equal.gsym(quat_mul_assoc())]))
  let t93 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t97 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t93), @tactics.disch_tac), @quaternions_misc.induct_tac), t94), @tactics.gen_tac), t95), t96)
  quat_pow_mul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ m : Num, ∀ n : Num, quat_mul(p, q) == quat_mul(q, p) → quat_mul(quat_pow(p, m), quat_pow(q, n)) == quat_mul(quat_pow(q, n), quat_pow(p, m))"), t97))
}

///|
let quat_pow_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_MUL_SYM")

///|
/// `QUAT_POW_MUL_SYM`
pub fn quat_pow_mul_sym() -> @kernel.Thm {
  quat_pow_mul_sym_c.get()
}

///|
/// QUAT_POLY_CLAUSES
fn step_127() -> Unit raise {
  let t99 = @simp.rewrite_tac(@list.List([quat_pow()]))
  let t98 = @equal.gsym(quat_pow_suc_alt())
  let t100 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(quat_pow())), t98])), t99), simple_quat_arith_tac)
  quat_poly_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], x + (y + z) == x + y + z) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x + y == y + x) && (∀ x : Cart[Real, 4], Hx(real_of_num(0)) + x == x) && (∀ x : Cart[Real, 4], -x == quat_mul(Hx(-real_of_num(1)), x)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - y == x + quat_mul(Hx(-real_of_num(1)), y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x, quat_mul(y, z)) == quat_mul(quat_mul(x, y), z)) && (∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(1)), x) == x) && (∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(1))) == x) && (∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(0)), x) == Hx(real_of_num(0))) && (∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(0))) == Hx(real_of_num(0))) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(x, y + z) == quat_mul(x, y) + quat_mul(x, z)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], quat_mul(y + z, x) == quat_mul(y, x) + quat_mul(z, x)) && (∀ x : Cart[Real, 4], quat_pow(x, 0) == Hx(real_of_num(1))) && (∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(x, SUC(n)) == quat_mul(x, quat_pow(x, n))) && (∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(x, SUC(n)) == quat_mul(quat_pow(x, n), x))"), t100))
}

///|
let quat_poly_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POLY_CLAUSES")

///|
/// `QUAT_POLY_CLAUSES`
pub fn quat_poly_clauses() -> @kernel.Thm {
  quat_poly_clauses_c.get()
}

///|
/// QUAT_INV_0
fn step_128() -> Unit raise {
  quat_inv_0_c.set(@tactics.prove(@term_syntax.parse_term("quat_inv(Hx(real_of_num(0))) == Hx(real_of_num(0))"), simple_quat_arith_tac))
}

///|
let quat_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_0")

///|
/// `QUAT_INV_0`
pub fn quat_inv_0() -> @kernel.Thm {
  quat_inv_0_c.get()
}

///|
/// QUAT_INV_1
fn step_129() -> Unit raise {
  quat_inv_1_c.set(@tactics.prove(@term_syntax.parse_term("quat_inv(Hx(real_of_num(1))) == Hx(real_of_num(1))"), simple_quat_arith_tac))
}

///|
let quat_inv_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_1")

///|
/// `QUAT_INV_1`
pub fn quat_inv_1() -> @kernel.Thm {
  quat_inv_1_c.get()
}

///|
/// QUAT_EQ_MUL_LCANCEL
fn step_130() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([quat_entire(), quat_sub_0()]))
  let t107 = @list.List([@simp.asm_rewrite_tac(@list.List([quat_sub_ldistrib(), quat_sub_refl()])), t106])
  let t105 = @tactics.subgoal_then(@term_syntax.parse_term("quat_mul((x : Cart[Real, 4]), (y : Cart[Real, 4]) - (z : Cart[Real, 4])) == Hx(real_of_num(0))"), fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s103 = @tactics.mp_tac(x102)
    fn(x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s103(x104)
    }
  })
  let t101 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([quat_mul_lzero()])))])
  let t108 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t101), @tactics.strip_tac), t105), t107)
  quat_eq_mul_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (quat_mul(x, y) == quat_mul(x, z)) == (x == Hx(real_of_num(0)) || y == z)"), t108))
}

///|
let quat_eq_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_MUL_LCANCEL")

///|
/// `QUAT_EQ_MUL_LCANCEL`
pub fn quat_eq_mul_lcancel() -> @kernel.Thm {
  quat_eq_mul_lcancel_c.get()
}

///|
/// QUAT_EQ_MUL_RCANCEL
fn step_131() -> Unit raise {
  let t114 = @simp.rewrite_tac(@list.List([quat_entire(), quat_sub_0()]))
  let t115 = @list.List([@simp.asm_rewrite_tac(@list.List([quat_sub_rdistrib(), quat_sub_refl()])), t114])
  let t113 = @tactics.subgoal_then(@term_syntax.parse_term("quat_mul((x : Cart[Real, 4]) - (y : Cart[Real, 4]), (z : Cart[Real, 4])) == Hx(real_of_num(0))"), fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s111 = @tactics.mp_tac(x110)
    fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s111(x112)
    }
  })
  let t109 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([quat_mul_rzero()])))])
  let t116 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t109), @tactics.strip_tac), t113), t115)
  quat_eq_mul_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], (quat_mul(x, z) == quat_mul(y, z)) == (x == y || z == Hx(real_of_num(0)))"), t116))
}

///|
let quat_eq_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EQ_MUL_RCANCEL")

///|
/// `QUAT_EQ_MUL_RCANCEL`
pub fn quat_eq_mul_rcancel() -> @kernel.Thm {
  quat_eq_mul_rcancel_c.get()
}

///|
/// QUAT_MUL_LCANCEL
fn step_132() -> Unit raise {
  let t119 = @simp.asm_simp_tac(@list.List([quat_mul_assoc(), quat_mul_linv(), quat_mul_lid()]))
  let t120 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(quat_mul_assoc())])), t119)
  let t121 = @list.List([@simp.asm_simp_tac(@list.List([quat_mul_linv(), quat_mul_lid()])), t120])
  let t118 = @tactics.exists_tac(@term_syntax.parse_term("quat_mul(quat_mul(quat_inv((x : Cart[Real, 4])), x), (y : Cart[Real, 4]))"))
  let t117 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t122 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t117), t118), @tactics.conj_tac), t121)
  quat_mul_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], !(x == Hx(real_of_num(0))) && quat_mul(x, y) == quat_mul(x, z) → y == z"), t122))
}

///|
let quat_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_LCANCEL")

///|
/// `QUAT_MUL_LCANCEL`
pub fn quat_mul_lcancel() -> @kernel.Thm {
  quat_mul_lcancel_c.get()
}

///|
/// QUAT_MUL_RCANCEL
fn step_133() -> Unit raise {
  let t125 = @simp.asm_simp_tac(@list.List([@equal.gsym(quat_mul_assoc()), quat_mul_rinv(), quat_mul_rid()]))
  let t126 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([quat_mul_assoc()])), t125)
  let t127 = @list.List([@simp.asm_simp_tac(@list.List([quat_mul_rinv(), quat_mul_rid()])), t126])
  let t124 = @tactics.exists_tac(@term_syntax.parse_term("quat_mul((y : Cart[Real, 4]), quat_mul((x : Cart[Real, 4]), quat_inv(x)))"))
  let t123 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t128 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t123), t124), @tactics.conj_tac), t127)
  quat_mul_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ z : Cart[Real, 4], !(x == Hx(real_of_num(0))) && quat_mul(y, x) == quat_mul(z, x) → y == z"), t128))
}

///|
let quat_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_RCANCEL")

///|
/// `QUAT_MUL_RCANCEL`
pub fn quat_mul_rcancel() -> @kernel.Thm {
  quat_mul_rcancel_c.get()
}

///|
/// QUAT_INV_MUL
fn step_134() -> Unit raise {
  let t137 = @simp.asm_simp_tac(@list.List([quat_mul_assoc(), quat_mul_rinv(), quat_mul_lid(), quat_entire()]))
  let t136 = @tactics.exists_tac(@term_syntax.parse_term("(p : Cart[Real, 4])"))
  let t135 = @tactics.match_mp_tac(quat_mul_lcancel())
  let t134 = @simp.asm_simp_tac(@list.List([quat_mul_assoc(), quat_mul_rinv(), quat_mul_lid()]))
  let t133 = @tactics.exists_tac(@term_syntax.parse_term("(q : Cart[Real, 4])"))
  let t132 = @tactics.match_mp_tac(quat_mul_lcancel())
  let t131 = @simp.asm_rewrite_tac(@list.List([quat_inv_0(), quat_mul_lzero(), quat_mul_rzero()]))
  let t129 = @term_syntax.parse_term("(q : Cart[Real, 4]) == Hx(real_of_num(0))")
  let t130 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(p : Cart[Real, 4]) == Hx(real_of_num(0))"), t129]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t130), t131), t132), t133), t134), t135), t136), t137)
  quat_inv_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_inv(quat_mul(p, q)) == quat_mul(quat_inv(q), quat_inv(p))"), t138))
}

///|
let quat_inv_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_MUL")

///|
/// `QUAT_INV_MUL`
pub fn quat_inv_mul() -> @kernel.Thm {
  quat_inv_mul_c.get()
}

///|
/// QUAT_POW_INV
fn step_135() -> Unit raise {
  let t142 = @simp.asm_rewrite_tac(@list.List([quat_pow_suc_alt(), quat_inv_mul()]))
  let t143 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x139 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s140 = @equal.land_conv(x139)
    fn(x141 : @kernel.Term) -> @kernel.Thm raise {
      s140(x141)
    }
  }, @list.List([quat_pow()])), t142)
  let t144 = @list.List([@simp.rewrite_tac(@list.List([quat_pow(), quat_inv_1()])), t143])
  let t145 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t144)
  quat_pow_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(quat_inv(x), n) == quat_inv(quat_pow(x, n))"), t145))
}

///|
let quat_pow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_INV")

///|
/// `QUAT_POW_INV`
pub fn quat_pow_inv() -> @kernel.Thm {
  quat_pow_inv_c.get()
}

///|
/// QUAT_INV_0_EQ
fn step_136() -> Unit raise {
  let t152 = @simp.asm_simp_tac(@list.List([quat_mul_linv(), hx_inj(), @realax.real_of_num_eq()]))
  let t151 = @list.List([@simp.asm_rewrite_tac(@list.List([quat_mul_lzero()])), @tactics.all_tac])
  let t150 = @tactics.subgoal_then(@term_syntax.parse_term("quat_mul(quat_inv((q : Cart[Real, 4])), q) == Hx(real_of_num(0))"), fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s148 = @tactics.mp_tac(x147)
    fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s148(x149)
    }
  })
  let t146 = @simp.asm_rewrite_tac(@list.List([quat_inv_0()]))
  let t153 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(q : Cart[Real, 4]) == Hx(real_of_num(0))"))), t146), @tactics.strip_tac), t150), t151), t152), @int.arith_tac)
  quat_inv_0_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], (quat_inv(q) == Hx(real_of_num(0))) == (q == Hx(real_of_num(0)))"), t153))
}

///|
let quat_inv_0_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_0_EQ")

///|
/// `QUAT_INV_0_EQ`
pub fn quat_inv_0_eq() -> @kernel.Thm {
  quat_inv_0_eq_c.get()
}

///|
/// QUAT_INV_INV
fn step_137() -> Unit raise {
  let t157 = @simp.asm_simp_tac(@list.List([quat_inv_0_eq(), quat_mul_linv(), quat_mul_rinv()]))
  let t156 = @tactics.exists_tac(@term_syntax.parse_term("quat_inv((q : Cart[Real, 4]))"))
  let t155 = @tactics.match_mp_tac(quat_mul_lcancel())
  let t154 = @simp.asm_rewrite_tac(@list.List([quat_inv_0()]))
  let t158 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(q : Cart[Real, 4]) == Hx(real_of_num(0))"))), t154), t155), t156), t157)
  quat_inv_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_inv(quat_inv(q)) == q"), t158))
}

///|
let quat_inv_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_INV")

///|
/// `QUAT_INV_INV`
pub fn quat_inv_inv() -> @kernel.Thm {
  quat_inv_inv_c.get()
}

///|
/// QUAT_POW_ADD
fn step_138() -> Unit raise {
  let t159 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), quat_pow(), quat_mul_lid(), quat_mul_assoc()]))
  let t160 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t159)
  quat_pow_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ m : Num, ∀ n : Num, quat_pow(x, m + n) == quat_mul(quat_pow(x, m), quat_pow(x, n))"), t160))
}

///|
let quat_pow_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_ADD")

///|
/// `QUAT_POW_ADD`
pub fn quat_pow_add() -> @kernel.Thm {
  quat_pow_add_c.get()
}

///|
/// QUAT_POW_POW
fn step_139() -> Unit raise {
  let t161 = @simp.asm_rewrite_tac(@list.List([quat_pow(), @arith.mult_clauses(), quat_pow_add()]))
  let t162 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @quaternions_misc.induct_tac), t161)
  quat_pow_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ m : Num, ∀ n : Num, quat_pow(quat_pow(x, m), n) == quat_pow(x, m * n)"), t162))
}

///|
let quat_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_POW")

///|
/// `QUAT_POW_POW`
pub fn quat_pow_pow() -> @kernel.Thm {
  quat_pow_pow_c.get()
}

///|
/// QUAT_POW_1
fn step_140() -> Unit raise {
  let t163 = @simp.rewrite_tac(@list.List([quat_pow(), quat_mul_rid()]))
  let t164 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))])), t163)
  quat_pow_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_pow(x, 1) == x"), t164))
}

///|
let quat_pow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_1")

///|
/// `QUAT_POW_1`
pub fn quat_pow_1() -> @kernel.Thm {
  quat_pow_1_c.get()
}

///|
/// QUAT_POW_2
fn step_141() -> Unit raise {
  let t165 = @simp.rewrite_tac(@list.List([quat_pow(), quat_pow_1()]))
  let t166 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2"))])), t165)
  quat_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_pow(x, 2) == quat_mul(x, x)"), t166))
}

///|
let quat_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_2")

///|
/// `QUAT_POW_2`
pub fn quat_pow_2() -> @kernel.Thm {
  quat_pow_2_c.get()
}

///|
/// QUAT_POW_NEG
fn step_142() -> Unit raise {
  let t169 = @simp.asm_rewrite_tac(@list.List([quat_mul_rneg(), quat_mul_lneg(), quat_neg_neg()]))
  let t168 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t167 = @simp.asm_rewrite_tac(@list.List([quat_pow(), @arith.even()]))
  let t170 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t167), t168), t169)
  quat_pow_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(-x, n) == (if EVEN(n) { quat_pow(x, n) } else { -quat_pow(x, n) })"), t170))
}

///|
let quat_pow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_NEG")

///|
/// `QUAT_POW_NEG`
pub fn quat_pow_neg() -> @kernel.Thm {
  quat_pow_neg_c.get()
}

///|
/// QUAT_POW_ONE
fn step_143() -> Unit raise {
  let t171 = @tactics.then_tac(@quaternions_misc.induct_tac, @simp.asm_rewrite_tac(@list.List([quat_pow(), quat_mul_lid()])))
  quat_pow_one_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, quat_pow(Hx(real_of_num(1)), n) == Hx(real_of_num(1))"), t171))
}

///|
let quat_pow_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_ONE")

///|
/// `QUAT_POW_ONE`
pub fn quat_pow_one() -> @kernel.Thm {
  quat_pow_one_c.get()
}

///|
/// QUAT_MUL_POW_SYM
fn step_144() -> Unit raise {
  let t173 = @simp.simp_tac(@list.List([@equal.gsym(quat_mul_assoc())]))
  let t172 = @simp.asm_simp_tac(@list.List([quat_mul_assoc()]))
  let t174 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@quaternions_misc.induct_tac, @simp.rewrite_tac(@list.List([quat_pow(), quat_mul_lid(), quat_mul_rid()]))), t172), t173)
  quat_mul_pow_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(x, y) == quat_mul(y, x) → quat_mul(x, quat_pow(y, n)) == quat_mul(quat_pow(y, n), x)"), t174))
}

///|
let quat_mul_pow_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_POW_SYM")

///|
/// `QUAT_MUL_POW_SYM`
pub fn quat_mul_pow_sym() -> @kernel.Thm {
  quat_mul_pow_sym_c.get()
}

///|
/// QUAT_POW_MUL
fn step_145() -> Unit raise {
  let t178 = @simp.asm_simp_tac(@list.List([quat_mul_pow_sym()]))
  let t177 = @simp.asm_simp_tac(@list.List([quat_mul_assoc()]))
  let t176 = @simp.asm_simp_tac(@list.List([@equal.gsym(quat_mul_assoc())]))
  let t175 = @tactics.repeat_tac(@tactics.strip_tac)
  let t179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@quaternions_misc.induct_tac, @simp.rewrite_tac(@list.List([quat_pow(), quat_mul_lid()]))), t175), t176), @tactics.ap_term_tac), t177), @tactics.ap_thm_tac), @tactics.ap_term_tac), t178)
  quat_pow_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(x, y) == quat_mul(y, x) → quat_pow(quat_mul(x, y), n) == quat_mul(quat_pow(x, n), quat_pow(y, n))"), t179))
}

///|
let quat_pow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_MUL")

///|
/// `QUAT_POW_MUL`
pub fn quat_pow_mul() -> @kernel.Thm {
  quat_pow_mul_c.get()
}

///|
/// QUAT_POW_UNITS_2
fn step_146() -> Unit raise {
  let t180 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t181 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_ii(), quat_jj(), quat_kk(), quat_pow_2(), quat_mul(), hx_def(), quat_components(), quat_neg()])), t180)
  quat_pow_units_2_c.set(@tactics.prove(@term_syntax.parse_term("quat_pow(quat_ii, 2) == -Hx(real_of_num(1)) && quat_pow(jj, 2) == -Hx(real_of_num(1)) && quat_pow(kk, 2) == -Hx(real_of_num(1))"), t181))
}

///|
let quat_pow_units_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_UNITS_2")

///|
/// `QUAT_POW_UNITS_2`
pub fn quat_pow_units_2() -> @kernel.Thm {
  quat_pow_units_2_c.get()
}

///|
/// QUAT_POW_EQ_0
fn step_147() -> Unit raise {
  let t183 = @list.List([simple_quat_arith_tac, @tactics.conv_tac(@class.taut)])
  let t182 = @simp.asm_rewrite_tac(@list.List([@nums.not_suc(), quat_pow(), quat_entire()]))
  let t184 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t182), t183)
  quat_pow_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, (quat_pow(x, n) == Hx(real_of_num(0))) == (x == Hx(real_of_num(0)) && !(n == 0))"), t184))
}

///|
let quat_pow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_EQ_0")

///|
/// `QUAT_POW_EQ_0`
pub fn quat_pow_eq_0() -> @kernel.Thm {
  quat_pow_eq_0_c.get()
}

///|
/// QUAT_POW_ZERO
fn step_148() -> Unit raise {
  let t185 = @tactics.then_tac(@quaternions_misc.induct_tac, @simp.rewrite_tac(@list.List([quat_pow(), quat_mul_lzero(), @nums.not_suc()])))
  quat_pow_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, quat_pow(Hx(real_of_num(0)), n) == (if n == 0 { Hx(real_of_num(1)) } else { Hx(real_of_num(0)) })"), t185))
}

///|
let quat_pow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_ZERO")

///|
/// `QUAT_POW_ZERO`
pub fn quat_pow_zero() -> @kernel.Thm {
  quat_pow_zero_c.get()
}

///|
/// QUAT_INV_UNITS
fn step_149() -> Unit raise {
  let t186 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t187 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_ii(), quat_jj(), quat_kk(), quat_inv(), quat_components(), quat_neg()])), t186)
  quat_inv_units_c.set(@tactics.prove(@term_syntax.parse_term("quat_inv(quat_ii) == -quat_ii && quat_inv(jj) == -jj && quat_inv(kk) == -kk"), t187))
}

///|
let quat_inv_units_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_UNITS")

///|
/// `QUAT_INV_UNITS`
pub fn quat_inv_units() -> @kernel.Thm {
  quat_inv_units_c.get()
}

///|
/// QUAT_VEC_0
fn step_150() -> Unit raise {
  let t188 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vec_component(), hx_def(), quat(), @cart.dimindex_4(), @vectors.forall_4(), @vectors.vector_4()]))
  quat_vec_0_c.set(@tactics.prove(@term_syntax.parse_term("vec(0) == Hx(real_of_num(0))"), t188))
}

///|
let quat_vec_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_VEC_0")

///|
/// `QUAT_VEC_0`
pub fn quat_vec_0() -> @kernel.Thm {
  quat_vec_0_c.get()
}

///|
/// QUAT_NORM_ZERO
fn step_151() -> Unit raise {
  let t189 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_0(), quat_vec_0()]))
  quat_norm_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], (norm(q) == real_of_num(0)) == (q == Hx(real_of_num(0)))"), t189))
}

///|
let quat_norm_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_ZERO")

///|
/// `QUAT_NORM_ZERO`
pub fn quat_norm_zero() -> @kernel.Thm {
  quat_norm_zero_c.get()
}

///|
/// QUAT_NORM_NUM
fn step_152() -> Unit raise {
  let t190 = @simp.rewrite_tac(@list.List([norm_hx(), @calc_int.real_abs_num()]))
  quat_norm_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, norm(Hx(real_of_num(n))) == real_of_num(n)"), t190))
}

///|
let quat_norm_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_NUM")

///|
/// `QUAT_NORM_NUM`
pub fn quat_norm_num() -> @kernel.Thm {
  quat_norm_num_c.get()
}

///|
/// QUAT_NORM_0
fn step_153() -> Unit raise {
  let t191 = @meson.meson_tac(@list.List([quat_norm_zero()]))
  quat_norm_0_c.set(@tactics.prove(@term_syntax.parse_term("norm(Hx(real_of_num(0))) == real_of_num(0)"), t191))
}

///|
let quat_norm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_0")

///|
/// `QUAT_NORM_0`
pub fn quat_norm_0() -> @kernel.Thm {
  quat_norm_0_c.get()
}

///|
/// QUAT_NORM_NZ
fn step_154() -> Unit raise {
  let t192 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_lt(), quat_vec_0()]))
  quat_norm_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], (real_of_num(0) < norm(q)) == !(q == Hx(real_of_num(0)))"), t192))
}

///|
let quat_norm_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_NZ")

///|
/// `QUAT_NORM_NZ`
pub fn quat_norm_nz() -> @kernel.Thm {
  quat_norm_nz_c.get()
}

///|
/// QUAT_NORM_MUL
fn step_155() -> Unit raise {
  let t193 = @simp.rewrite_tac(@list.List([quat_norm(), quat_mul(), quat_components(), @equal.gsym(@real.sqrt_mul())]))
  let t194 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t193), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  quat_norm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], norm(quat_mul(p, q)) == norm(p) * norm(q)"), t194))
}

///|
let quat_norm_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_MUL")

///|
/// `QUAT_NORM_MUL`
pub fn quat_norm_mul() -> @kernel.Thm {
  quat_norm_mul_c.get()
}

///|
/// QUAT_NORM_POW
fn step_156() -> Unit raise {
  let t195 = @simp.asm_rewrite_tac(@list.List([quat_pow(), @realax.real_pow(), quat_norm_num(), quat_norm_mul()]))
  let t196 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t195)
  quat_norm_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], ∀ n : Num, norm(quat_pow(q, n)) == pow(norm(q), n)"), t196))
}

///|
let quat_norm_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_POW")

///|
/// `QUAT_NORM_POW`
pub fn quat_norm_pow() -> @kernel.Thm {
  quat_norm_pow_c.get()
}

///|
/// QUAT_NORM_INV
fn step_157() -> Unit raise {
  let t205 = @tactics.conv_tac(@calc_rat.real_field)
  let t204 = @tactics.pop_assum(fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s202 = @tactics.mp_tac(x201)
    fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s202(x203)
    }
  })
  let t206 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@equal.gsym(@real.real_mul_rinv_uniq())), t204), t205)
  let t207 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_inv_0(), @calc_int.real_mul_rzero(), @realax.real_add_lid()])), t206])
  let t200 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) * x + ((y : Real) * y + ((z : Real) * z + (w : Real) * w)) == real_of_num(0)"))
  let t199 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realarith.real_pow_2()]))
  let t198 = @simp.rewrite_tac(@list.List([quat_norm(), quat_inv(), quat_components(), @equal.gsym(@real.sqrt_inv())]))
  let t197 = @tactics.repeat_tac(@tactics.gen_tac)
  let t208 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_quat()])), t197), t198), @tactics.ap_term_tac), t199), t200), t207)
  quat_norm_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], norm(quat_inv(q)) == inv(norm(q))"), t208))
}

///|
let quat_norm_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_INV")

///|
/// `QUAT_NORM_INV`
pub fn quat_norm_inv() -> @kernel.Thm {
  quat_norm_inv_c.get()
}

///|
/// QUAT_NORM_TRIANGLE_SUB
fn step_158() -> Unit raise {
  let t209 = @meson.meson_tac(@list.List([@vectors.norm_triangle(), @vectors.norm_neg(), quat_add_assoc(), quat_add_rinv(), quat_add_rid()]))
  quat_norm_triangle_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], norm(p) <= norm(p + q) + norm(q)"), t209))
}

///|
let quat_norm_triangle_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_TRIANGLE_SUB")

///|
/// `QUAT_NORM_TRIANGLE_SUB`
pub fn quat_norm_triangle_sub() -> @kernel.Thm {
  quat_norm_triangle_sub_c.get()
}

///|
/// QUAT_NORM_ABS_NORM
fn step_159() -> Unit raise {
  let t211 = @meson.meson_tac(@list.List([quat_neg_sub(), @vectors.norm_neg(), @real.real_le_sub_radd(), quat_sub(), quat_norm_triangle_sub()]))
  let t210 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) <= (x : Real) && b - a <= x → abs(a - b) <= x")))
  let t212 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t210), t211)
  quat_norm_abs_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], abs(norm(p) - norm(q)) <= norm(p - q)"), t212))
}

///|
let quat_norm_abs_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_ABS_NORM")

///|
/// `QUAT_NORM_ABS_NORM`
pub fn quat_norm_abs_norm() -> @kernel.Thm {
  quat_norm_abs_norm_c.get()
}

///|
/// QUAT_POW_EQ_1
fn step_160() -> Unit raise {
  let t222 = @tactics.conv_tac(@class.taut)
  let t221 = @simp.simp_tac(@list.List([@vectors.real_abs_norm()]))
  let t220 = @simp.simp_tac(@list.List([quat_norm_pow(), norm_hx(), @real.real_pow_eq_1(), @calc_int.real_abs_num()]))
  let t216 = @term_syntax.parse_term("(norm : (Cart[Real, 4]) -> Real)")
  let t219 = @tactics.disch_then(fn(x218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s214 = @tactics.mp_tac(x213)
      fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s214(x215)
      }
    })(((x217 : @kernel.Thm) => @equal.ap_term(t216, x217))(x218))
  })
  let t223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t219), t220), t221), t222)
  quat_pow_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], ∀ n : Num, quat_pow(q, n) == Hx(real_of_num(1)) → norm(q) == real_of_num(1) || n == 0"), t223))
}

///|
let quat_pow_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_POW_EQ_1")

///|
/// `QUAT_POW_EQ_1`
pub fn quat_pow_eq_1() -> @kernel.Thm {
  quat_pow_eq_1_c.get()
}

///|
/// quat_cnj
fn step_161() -> Unit raise {
  quat_cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_cnj : (Cart[Real, 4]) -> Cart[Real, 4])((q : Cart[Real, 4])) == quat((quat_Re(q), -Im1(q), -Im2(q), -Im3(q)))")))
}

///|
let quat_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_cnj")

///|
/// `quat_cnj`
pub fn quat_cnj() -> @kernel.Thm {
  quat_cnj_c.get()
}

///|
/// QUAT_CNJ_INJ
fn step_162() -> Unit raise {
  let t224 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_eq(), quat_components(), @real.real_eq_neg2()]))
  quat_cnj_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], (quat_cnj(p) == quat_cnj(q)) == (p == q)"), t224))
}

///|
let quat_cnj_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_INJ")

///|
/// `QUAT_CNJ_INJ`
pub fn quat_cnj_inj() -> @kernel.Thm {
  quat_cnj_inj_c.get()
}

///|
/// QUAT_CNJ_CNJ
fn step_163() -> Unit raise {
  let t225 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_eq(), quat_components(), @calc_int.real_neg_neg()]))
  quat_cnj_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_cnj(quat_cnj(q)) == q"), t225))
}

///|
let quat_cnj_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_CNJ")

///|
/// `QUAT_CNJ_CNJ`
pub fn quat_cnj_cnj() -> @kernel.Thm {
  quat_cnj_cnj_c.get()
}

///|
/// CNJ_HX
fn step_164() -> Unit raise {
  let t226 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_eq(), hx_def(), @calc_int.real_neg_0(), quat_components()]))
  cnj_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, quat_cnj(Hx(x)) == Hx(x)"), t226))
}

///|
let cnj_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_HX")

///|
/// `CNJ_HX`
pub fn cnj_hx() -> @kernel.Thm {
  cnj_hx_c.get()
}

///|
/// QUAT_NORM_CNJ
fn step_165() -> Unit raise {
  let t227 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), quat_components(), @calc_int.real_neg_neg()]))
  let t228 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_norm(), quat_cnj(), @realarith.real_pow_2()])), t227)
  quat_norm_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], norm(quat_cnj(q)) == norm(q)"), t228))
}

///|
let quat_norm_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_CNJ")

///|
/// `QUAT_NORM_CNJ`
pub fn quat_norm_cnj() -> @kernel.Thm {
  quat_norm_cnj_c.get()
}

///|
/// QUAT_CNJ_NEG
fn step_166() -> Unit raise {
  let t229 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_neg(), quat_eq(), quat_components()]))
  quat_cnj_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_cnj(-q) == -quat_cnj(q)"), t229))
}

///|
let quat_cnj_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_NEG")

///|
/// `QUAT_CNJ_NEG`
pub fn quat_cnj_neg() -> @kernel.Thm {
  quat_cnj_neg_c.get()
}

///|
/// QUAT_CNJ_INV
fn step_167() -> Unit raise {
  let t230 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_neg_neg(), @realarith.real_pow_2(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t231 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_cnj(), quat_inv(), quat_eq(), quat_components()])), t230)
  quat_cnj_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_cnj(quat_inv(q)) == quat_inv(quat_cnj(q))"), t231))
}

///|
let quat_cnj_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_INV")

///|
/// `QUAT_CNJ_INV`
pub fn quat_cnj_inv() -> @kernel.Thm {
  quat_cnj_inv_c.get()
}

///|
/// QUAT_CNJ_ADD
fn step_168() -> Unit raise {
  let t233 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @calc_int.real_neg_neg()]))
  let t232 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_add(), quat_eq(), quat_components()]))
  let t234 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t232), t233)
  quat_cnj_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_cnj(p + q) == quat_cnj(p) + quat_cnj(q)"), t234))
}

///|
let quat_cnj_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_ADD")

///|
/// `QUAT_CNJ_ADD`
pub fn quat_cnj_add() -> @kernel.Thm {
  quat_cnj_add_c.get()
}

///|
/// QUAT_CNJ_SUB
fn step_169() -> Unit raise {
  let t235 = @simp.rewrite_tac(@list.List([quat_sub(), quat_cnj_add(), quat_cnj_neg()]))
  let t236 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t235)
  quat_cnj_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_cnj(p - q) == quat_cnj(p) - quat_cnj(q)"), t236))
}

///|
let quat_cnj_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_SUB")

///|
/// `QUAT_CNJ_SUB`
pub fn quat_cnj_sub() -> @kernel.Thm {
  quat_cnj_sub_c.get()
}

///|
/// QUAT_CNJ_MUL
fn step_170() -> Unit raise {
  let t237 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_mul(), quat_eq(), quat_components()]))
  let t238 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t237), @calc_rat.real_arith_tac)
  quat_cnj_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_cnj(quat_mul(p, q)) == quat_mul(quat_cnj(q), quat_cnj(p))"), t238))
}

///|
let quat_cnj_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_MUL")

///|
/// `QUAT_CNJ_MUL`
pub fn quat_cnj_mul() -> @kernel.Thm {
  quat_cnj_mul_c.get()
}

///|
/// QUAT_CNJ_POW
fn step_171() -> Unit raise {
  let t242 = @simp.asm_rewrite_tac(@list.List([quat_pow(), quat_cnj_mul(), cnj_hx()]))
  let t243 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x239 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s240 = @equal.rand_conv(x239)
    fn(x241 : @kernel.Term) -> @kernel.Thm raise {
      s240(x241)
    }
  }, @list.List([quat_pow_suc_alt()])), t242)
  let t244 = @list.List([@simp.rewrite_tac(@list.List([quat_pow(), cnj_hx()])), t243])
  let t245 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t244)
  quat_cnj_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], ∀ n : Num, quat_cnj(quat_pow(q, n)) == quat_pow(quat_cnj(q), n)"), t245))
}

///|
let quat_cnj_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_POW")

///|
/// `QUAT_CNJ_POW`
pub fn quat_cnj_pow() -> @kernel.Thm {
  quat_cnj_pow_c.get()
}

///|
/// QUAT_CNJ_COMPONENTS
fn step_172() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_components()]))
  quat_cnj_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], quat_Re(quat_cnj(q)) == quat_Re(q)) && (∀ q : Cart[Real, 4], Im1(quat_cnj(q)) == -Im1(q)) && (∀ q : Cart[Real, 4], Im2(quat_cnj(q)) == -Im2(q)) && (∀ q : Cart[Real, 4], Im3(quat_cnj(q)) == -Im3(q))"), t246))
}

///|
let quat_cnj_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_COMPONENTS")

///|
/// `QUAT_CNJ_COMPONENTS`
pub fn quat_cnj_components() -> @kernel.Thm {
  quat_cnj_components_c.get()
}

///|
/// QUAT_CNJ_UNITS
fn step_173() -> Unit raise {
  let t247 = @simp.rewrite_tac(@list.List([quat_eq(), quat_cnj_components(), quat_neg_components(), quat_units_components(), @calc_int.real_neg_0()]))
  quat_cnj_units_c.set(@tactics.prove(@term_syntax.parse_term("quat_cnj(quat_ii) == -quat_ii && quat_cnj(jj) == -jj && quat_cnj(kk) == -kk"), t247))
}

///|
let quat_cnj_units_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_UNITS")

///|
/// `QUAT_CNJ_UNITS`
pub fn quat_cnj_units() -> @kernel.Thm {
  quat_cnj_units_c.get()
}

///|
/// CNJ_EQ_HX
fn step_174() -> Unit raise {
  let t248 = @simp.rewrite_tac(@list.List([quat_eq(), quat_cnj_components(), hx_components(), @real.real_neg_eq_0()]))
  cnj_eq_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ q : Cart[Real, 4], (quat_cnj(q) == Hx(x)) == (q == Hx(x))"), t248))
}

///|
let cnj_eq_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_EQ_HX")

///|
/// `CNJ_EQ_HX`
pub fn cnj_eq_hx() -> @kernel.Thm {
  cnj_eq_hx_c.get()
}

///|
/// QUAT_CNJ_EQ_0
fn step_175() -> Unit raise {
  let t249 = @simp.rewrite_tac(@list.List([cnj_eq_hx()]))
  quat_cnj_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], (quat_cnj(q) == Hx(real_of_num(0))) == (q == Hx(real_of_num(0)))"), t249))
}

///|
let quat_cnj_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_EQ_0")

///|
/// `QUAT_CNJ_EQ_0`
pub fn quat_cnj_eq_0() -> @kernel.Thm {
  quat_cnj_eq_0_c.get()
}

///|
/// QUAT_ADD_CNJ
fn step_176() -> Unit raise {
  let t250 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_add_components(), quat_cnj_components(), hx_components()])), @calc_rat.real_arith_tac)
  quat_add_cnj_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], q + quat_cnj(q) == Hx(real_of_num(2) * quat_Re(q))) && (∀ q : Cart[Real, 4], quat_cnj(q) + q == Hx(real_of_num(2) * quat_Re(q)))"), t250))
}

///|
let quat_add_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_ADD_CNJ")

///|
/// `QUAT_ADD_CNJ`
pub fn quat_add_cnj() -> @kernel.Thm {
  quat_add_cnj_c.get()
}

///|
/// HX_QUAT_RE_CNJ
fn step_177() -> Unit raise {
  let t251 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), hx_components(), quat_mul(), quat_inv(), quat_components(), quat_add_components(), quat_cnj_components()])), @calc_rat.real_arith_tac)
  hx_quat_re_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], Hx(quat_Re(q)) == quat_mul(quat_inv(Hx(real_of_num(2))), q + quat_cnj(q))"), t251))
}

///|
let hx_quat_re_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HX_QUAT_RE_CNJ")

///|
/// `HX_QUAT_RE_CNJ`
pub fn hx_quat_re_cnj() -> @kernel.Thm {
  hx_quat_re_cnj_c.get()
}

///|
/// QUAT_MUL_CNJ_SYM
fn step_178() -> Unit raise {
  let t252 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_mul(), quat_components(), quat_cnj_components()])), @calc_rat.real_arith_tac)
  quat_mul_cnj_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_mul(quat_cnj(q), q) == quat_mul(q, quat_cnj(q))"), t252))
}

///|
let quat_mul_cnj_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_CNJ_SYM")

///|
/// `QUAT_MUL_CNJ_SYM`
pub fn quat_mul_cnj_sym() -> @kernel.Thm {
  quat_mul_cnj_sym_c.get()
}

///|
/// QUAT_NORM_POW_2
fn step_179() -> Unit raise {
  let t253 = @simp.rewrite_tac(@list.List([quat_cnj(), quat_mul(), hx_def(), quat_components(), quat_eq()]))
  let t254 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(hx_pow()), quat_sqnorm()])), t253), @calc_rat.real_arith_tac)
  quat_norm_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_pow(Hx(norm(q)), 2) == quat_mul(q, quat_cnj(q))"), t254))
}

///|
let quat_norm_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_POW_2")

///|
/// `QUAT_NORM_POW_2`
pub fn quat_norm_pow_2() -> @kernel.Thm {
  quat_norm_pow_2_c.get()
}

///|
/// QUAT_NORM_POW_2_ALT
fn step_180() -> Unit raise {
  let t255 = @simp.rewrite_tac(@list.List([quat_norm_pow_2(), quat_mul_cnj_sym()]))
  quat_norm_pow_2_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_pow(Hx(norm(q)), 2) == quat_mul(quat_cnj(q), q)"), t255))
}

///|
let quat_norm_pow_2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_POW_2_ALT")

///|
/// `QUAT_NORM_POW_2_ALT`
pub fn quat_norm_pow_2_alt() -> @kernel.Thm {
  quat_norm_pow_2_alt_c.get()
}

///|
/// QUAT_MUL_CNJ
fn step_181() -> Unit raise {
  let t256 = @simp.rewrite_tac(@list.List([quat_norm_pow_2()]))
  let t257 = @list.List([@simp.rewrite_tac(@list.List([quat_norm_pow_2_alt()])), t256])
  let t258 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.conj_tac), t257)
  quat_mul_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_mul(quat_cnj(q), q) == quat_pow(Hx(norm(q)), 2) && quat_mul(q, quat_cnj(q)) == quat_pow(Hx(norm(q)), 2)"), t258))
}

///|
let quat_mul_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_CNJ")

///|
/// `QUAT_MUL_CNJ`
pub fn quat_mul_cnj() -> @kernel.Thm {
  quat_mul_cnj_c.get()
}

///|
/// QUAT_INV_CNJ
fn step_182() -> Unit raise {
  let t259 = @simp.rewrite_tac(@list.List([quat_inv(), quat_components(), quat_cnj_components()]))
  let t260 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(hx_inv()), quat_sqnorm(), quat_eq(), mul_hx_components()])), t259), @calc_rat.real_arith_tac)
  quat_inv_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_inv(q) == quat_mul(quat_inv(Hx(pow(norm(q), 2))), quat_cnj(q))"), t260))
}

///|
let quat_inv_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_CNJ")

///|
/// `QUAT_INV_CNJ`
pub fn quat_inv_cnj() -> @kernel.Thm {
  quat_inv_cnj_c.get()
}

///|
/// QUAT_INV_EQ_CNJ
fn step_183() -> Unit raise {
  let t266 = @simp.rewrite_tac(@list.List([quat_norm_units(), @real.real_pow_one(), @real.real_abs_1(), @real.real_inv_1(), quat_inv_1(), quat_mul_lid()]))
  let t265 = @tactics.pop_assum(fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s263 = @tactics.subst1_tac(x262)
    fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s263(x264)
    }
  })
  let t261 = @simp.once_rewrite_tac(@list.List([quat_inv_cnj()]))
  let t267 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t261), t265), t266)
  quat_inv_eq_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], norm(q) == real_of_num(1) → quat_inv(q) == quat_cnj(q)"), t267))
}

///|
let quat_inv_eq_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_EQ_CNJ")

///|
/// `QUAT_INV_EQ_CNJ`
pub fn quat_inv_eq_cnj() -> @kernel.Thm {
  quat_inv_eq_cnj_c.get()
}

///|
/// QUAT_CMUL
fn step_184() -> Unit raise {
  let t268 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vector_mul_component(), hx_def(), quat(), quat_mul(), @cart.dimindex_4(), @vectors.forall_4(), quat_components_def(), @vectors.vector_4()])), @calc_rat.real_arith_tac)
  quat_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, 4], op_pct(c, x) == quat_mul(Hx(c), x)"), t268))
}

///|
let quat_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CMUL")

///|
/// `QUAT_CMUL`
pub fn quat_cmul() -> @kernel.Thm {
  quat_cmul_c.get()
}

///|
/// LINEAR_QUAT_LMUL
fn step_185() -> Unit raise {
  let t269 = @simp.rewrite_tac(@list.List([@vectors.linear(), quat_cmul(), quat_add_ldistrib(), quat_mul_assoc(), quat_mul_hx_sym()]))
  linear_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 4], linear((x : Cart[Real, 4]) => quat_mul(c, x))"), t269))
}

///|
let linear_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_QUAT_LMUL")

///|
/// `LINEAR_QUAT_LMUL`
pub fn linear_quat_lmul() -> @kernel.Thm {
  linear_quat_lmul_c.get()
}

///|
/// LINEAR_QUAT_RMUL
fn step_186() -> Unit raise {
  let t270 = @simp.rewrite_tac(@list.List([@vectors.linear(), quat_cmul(), quat_add_rdistrib(), quat_mul_assoc(), quat_mul_hx_sym()]))
  linear_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 4], linear((x : Cart[Real, 4]) => quat_mul(x, c))"), t270))
}

///|
let linear_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_QUAT_RMUL")

///|
/// `LINEAR_QUAT_RMUL`
pub fn linear_quat_rmul() -> @kernel.Thm {
  linear_quat_rmul_c.get()
}

///|
/// BILINEAR_QUAT_MUL
fn step_187() -> Unit raise {
  let t271 = @simp.rewrite_tac(@list.List([@vectors.bilinear(), @vectors.linear(), quat_cmul(), quat_add_ldistrib(), quat_add_rdistrib(), quat_mul_assoc(), quat_mul_hx_sym()]))
  bilinear_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("bilinear(quat_mul)"), t271))
}

///|
let bilinear_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_QUAT_MUL")

///|
/// `BILINEAR_QUAT_MUL`
pub fn bilinear_quat_mul() -> @kernel.Thm {
  bilinear_quat_mul_c.get()
}

///|
/// QUAT_CMUL_RID
fn step_188() -> Unit raise {
  let t272 = @simp.rewrite_tac(@list.List([quat_cmul(), quat_mul_rid()]))
  quat_cmul_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, op_pct(x, Hx(real_of_num(1))) == Hx(x)"), t272))
}

///|
let quat_cmul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CMUL_RID")

///|
/// `QUAT_CMUL_RID`
pub fn quat_cmul_rid() -> @kernel.Thm {
  quat_cmul_rid_c.get()
}

///|
/// QUAT_CMUL_LID
fn step_189() -> Unit raise {
  let t273 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  quat_cmul_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], op_pct(real_of_num(1), q) == q"), t273))
}

///|
let quat_cmul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CMUL_LID")

///|
/// `QUAT_CMUL_LID`
pub fn quat_cmul_lid() -> @kernel.Thm {
  quat_cmul_lid_c.get()
}

///|
/// QUAT_DOT
fn step_190() -> Unit raise {
  let t274 = @simp.rewrite_tac(@list.List([quat(), @vectors.dot_4(), @vectors.vector_4()]))
  let t275 = @tactics.then_tac(@simp.rewrite_tac(@list.List([forall_quat(), quat_components()])), t274)
  quat_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], dot(p, q) == quat_Re(p) * quat_Re(q) + (Im1(p) * Im1(q) + (Im2(p) * Im2(q) + Im3(p) * Im3(q)))"), t275))
}

///|
let quat_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_DOT")

///|
/// `QUAT_DOT`
pub fn quat_dot() -> @kernel.Thm {
  quat_dot_c.get()
}

///|
/// QUAT_VSUM_COMPONENTS
fn step_191() -> Unit raise {
  let t276 = @simp.simp_tac(@list.List([quat_components_def(), @vectors.vsum_component(), @cart.dimindex_4(), @calc_num.arith()]))
  quat_vsum_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → quat_Re(vsum(s, f)) == sum(s, (x : A) => quat_Re(f(x)))) && (∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → Im1(vsum(s, f)) == sum(s, (x : A) => Im1(f(x)))) && (∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → Im2(vsum(s, f)) == sum(s, (x : A) => Im2(f(x)))) && (∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → Im3(vsum(s, f)) == sum(s, (x : A) => Im3(f(x))))"), t276))
}

///|
let quat_vsum_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_VSUM_COMPONENTS")

///|
/// `QUAT_VSUM_COMPONENTS`
pub fn quat_vsum_components() -> @kernel.Thm {
  quat_vsum_components_c.get()
}

///|
/// VSUM_QUAT_LMUL
fn step_192() -> Unit raise {
  let t278 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), quat_vec_0(), quat_mul_rzero()]))
  let t277 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t279 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t277), t278), simple_quat_arith_tac)
  vsum_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 4], ∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → vsum(s, (x : A) => quat_mul(c, f(x))) == quat_mul(c, vsum(s, f))"), t279))
}

///|
let vsum_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_QUAT_LMUL")

///|
/// `VSUM_QUAT_LMUL`
pub fn vsum_quat_lmul() -> @kernel.Thm {
  vsum_quat_lmul_c.get()
}

///|
/// VSUM_QUAT_RMUL
fn step_193() -> Unit raise {
  let t281 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), quat_vec_0(), quat_mul_lzero()]))
  let t280 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t282 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t280), t281), simple_quat_arith_tac)
  vsum_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 4], ∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → vsum(s, (x : A) => quat_mul(f(x), c)) == quat_mul(vsum(s, f), c)"), t282))
}

///|
let vsum_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_QUAT_RMUL")

///|
/// `VSUM_QUAT_RMUL`
pub fn vsum_quat_rmul() -> @kernel.Thm {
  vsum_quat_rmul_c.get()
}

///|
/// VSUM_HX
fn step_194() -> Unit raise {
  let t283 = @simp.simp_tac(@list.List([@iterate.sum_clauses(), @vectors.vsum_clauses(), quat_vec_0(), hx_add()]))
  let t284 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t283)
  vsum_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → vsum(s, (a : A) => Hx(f(a))) == Hx(sum(s, f))"), t284))
}

///|
let vsum_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_HX")

///|
/// `VSUM_HX`
pub fn vsum_hx() -> @kernel.Thm {
  vsum_hx_c.get()
}

///|
/// QUAT_CNJ_VSUM
fn step_195() -> Unit raise {
  let t285 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), quat_cnj_add(), cnj_hx(), quat_vec_0()]))
  let t286 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t285)
  quat_cnj_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) → quat_cnj(vsum(s, f)) == vsum(s, (x : A) => quat_cnj(f(x)))"), t286))
}

///|
let quat_cnj_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CNJ_VSUM")

///|
/// `QUAT_CNJ_VSUM`
pub fn quat_cnj_vsum() -> @kernel.Thm {
  quat_cnj_vsum_c.get()
}

///|
/// VSUM_HX_NUMSEG
fn step_196() -> Unit raise {
  let t287 = @simp.simp_tac(@list.List([vsum_hx(), @iterate.finite_numseg()]))
  vsum_hx_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, vsum(op_dot_dot(m, n), (a : Num) => Hx(f(a))) == Hx(sum(op_dot_dot(m, n), f))"), t287))
}

///|
let vsum_hx_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_HX_NUMSEG")

///|
/// `VSUM_HX_NUMSEG`
pub fn vsum_hx_numseg() -> @kernel.Thm {
  vsum_hx_numseg_c.get()
}

///|
/// quat_real
fn step_197() -> Unit raise {
  quat_real_c.set(@pair.new_definition(@term_syntax.parse_term("(quat_real : (Cart[Real, 4]) -> Bool)((q : Cart[Real, 4])) == (Im1(q) == real_of_num(0) && Im2(q) == real_of_num(0) && Im3(q) == real_of_num(0))")))
}

///|
let quat_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_real")

///|
/// `quat_real`
pub fn quat_real() -> @kernel.Thm {
  quat_real_c.get()
}

///|
/// QUAT_REAL
fn step_198() -> Unit raise {
  let t288 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_eq(), quat_real(), hx_def(), quat_components()])), @calc_rat.real_arith_tac)
  quat_real_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) == (Hx(quat_Re(q)) == q)"), t288))
}

///|
let quat_real_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL")

///|
/// `QUAT_REAL`
pub fn quat_real_v1() -> @kernel.Thm {
  quat_real_v1_c.get()
}

///|
/// QUAT_REAL_CNJ
fn step_199() -> Unit raise {
  let t289 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_real(), quat_cnj(), quat_eq(), quat_components()])), @calc_rat.real_arith_tac)
  quat_real_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) == (quat_cnj(q) == q)"), t289))
}

///|
let quat_real_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_CNJ")

///|
/// `QUAT_REAL_CNJ`
pub fn quat_real_cnj() -> @kernel.Thm {
  quat_real_cnj_c.get()
}

///|
/// QUAT_REAL_EXISTS
fn step_200() -> Unit raise {
  let t290 = @meson.meson_tac(@list.List([quat_real_v1(), quat_real(), hx_components()]))
  quat_real_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) == (∃ x : Real, q == Hx(x))"), t290))
}

///|
let quat_real_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_EXISTS")

///|
/// `QUAT_REAL_EXISTS`
pub fn quat_real_exists() -> @kernel.Thm {
  quat_real_exists_c.get()
}

///|
/// QUAT_FORALL_REAL
fn step_201() -> Unit raise {
  let t291 = @meson.meson_tac(@list.List([quat_real_exists()]))
  quat_forall_real_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], quat_real(q) → (P : (Cart[Real, 4]) -> Bool)(q)) == (∀ x : Real, P(Hx(x)))"), t291))
}

///|
let quat_forall_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_FORALL_REAL")

///|
/// `QUAT_FORALL_REAL`
pub fn quat_forall_real() -> @kernel.Thm {
  quat_forall_real_c.get()
}

///|
/// QUAT_EXISTS_REAL
fn step_202() -> Unit raise {
  let t292 = @meson.meson_tac(@list.List([quat_real_exists()]))
  quat_exists_real_c.set(@tactics.prove(@term_syntax.parse_term("(∃ q : Cart[Real, 4], quat_real(q) && (P : (Cart[Real, 4]) -> Bool)(q)) == (∃ x : Real, P(Hx(x)))"), t292))
}

///|
let quat_exists_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_EXISTS_REAL")

///|
/// `QUAT_EXISTS_REAL`
pub fn quat_exists_real() -> @kernel.Thm {
  quat_exists_real_c.get()
}

///|
/// REAL_HX
fn step_203() -> Unit raise {
  let t293 = @simp.rewrite_tac(@list.List([quat_real_cnj(), cnj_hx()]))
  real_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, quat_real(Hx(x))"), t293))
}

///|
let real_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_HX")

///|
/// `REAL_HX`
pub fn real_hx() -> @kernel.Thm {
  real_hx_c.get()
}

///|
/// REAL_MUL_HX
fn step_204() -> Unit raise {
  let t295 = @simp.asm_simp_tac(@list.List([]))
  let t294 = @tactics.repeat_tac(@tactics.gen_tac)
  let t296 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([quat_real(), mul_hx_components(), @realarith.real_entire()])), t294), @tactics.eq_tac), @tactics.strip_tac), t295)
  real_mul_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ q : Cart[Real, 4], quat_real(quat_mul(Hx(x), q)) == (x == real_of_num(0) || quat_real(q))"), t296))
}

///|
let real_mul_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_HX")

///|
/// `REAL_MUL_HX`
pub fn real_mul_hx() -> @kernel.Thm {
  real_mul_hx_c.get()
}

///|
/// QUAT_REAL_ADD
fn step_205() -> Unit raise {
  let t297 = @simp.simp_tac(@list.List([quat_real_cnj(), quat_cnj_add()]))
  quat_real_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_real(p) && quat_real(q) → quat_real(p + q)"), t297))
}

///|
let quat_real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_ADD")

///|
/// `QUAT_REAL_ADD`
pub fn quat_real_add() -> @kernel.Thm {
  quat_real_add_c.get()
}

///|
/// QUAT_REAL_NEG
fn step_206() -> Unit raise {
  let t298 = @simp.simp_tac(@list.List([quat_real_cnj(), quat_cnj_neg()]))
  quat_real_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) → quat_real(-q)"), t298))
}

///|
let quat_real_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_NEG")

///|
/// `QUAT_REAL_NEG`
pub fn quat_real_neg() -> @kernel.Thm {
  quat_real_neg_c.get()
}

///|
/// QUAT_REAL_SUB
fn step_207() -> Unit raise {
  let t299 = @simp.simp_tac(@list.List([quat_real_cnj(), quat_cnj_sub()]))
  quat_real_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_real(p) && quat_real(q) → quat_real(p - q)"), t299))
}

///|
let quat_real_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_SUB")

///|
/// `QUAT_REAL_SUB`
pub fn quat_real_sub() -> @kernel.Thm {
  quat_real_sub_c.get()
}

///|
/// QUAT_REAL_MUL
fn step_208() -> Unit raise {
  let t300 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_real()])), simple_quat_arith_tac)
  quat_real_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], quat_real(p) && quat_real(q) → quat_real(quat_mul(p, q))"), t300))
}

///|
let quat_real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_MUL")

///|
/// `QUAT_REAL_MUL`
pub fn quat_real_mul() -> @kernel.Thm {
  quat_real_mul_c.get()
}

///|
/// QUAT_REAL_POW
fn step_209() -> Unit raise {
  let t301 = @simp.simp_tac(@list.List([quat_real_cnj(), quat_cnj_pow()]))
  quat_real_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], ∀ n : Num, quat_real(q) → quat_real(quat_pow(q, n))"), t301))
}

///|
let quat_real_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_POW")

///|
/// `QUAT_REAL_POW`
pub fn quat_real_pow() -> @kernel.Thm {
  quat_real_pow_c.get()
}

///|
/// QUAT_REAL_INV
fn step_210() -> Unit raise {
  let t302 = @simp.simp_tac(@list.List([quat_real_cnj(), quat_cnj_inv()]))
  quat_real_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) → quat_real(quat_inv(q))"), t302))
}

///|
let quat_real_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_INV")

///|
/// `QUAT_REAL_INV`
pub fn quat_real_inv() -> @kernel.Thm {
  quat_real_inv_c.get()
}

///|
/// QUAT_REAL_INV_EQ
fn step_211() -> Unit raise {
  let t303 = @meson.meson_tac(@list.List([quat_real_inv(), quat_inv_inv()]))
  quat_real_inv_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(quat_inv(q)) == quat_real(q)"), t303))
}

///|
let quat_real_inv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_INV_EQ")

///|
/// `QUAT_REAL_INV_EQ`
pub fn quat_real_inv_eq() -> @kernel.Thm {
  quat_real_inv_eq_c.get()
}

///|
/// QUAT_REAL_VSUM
fn step_212() -> Unit raise {
  let t304 = @simp.simp_tac(@list.List([quat_cnj_vsum(), quat_real_cnj()]))
  quat_real_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) && (∀ a : A, IN(a, s) → quat_real(f(a))) → quat_real(vsum(s, f))"), t304))
}

///|
let quat_real_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_VSUM")

///|
/// `QUAT_REAL_VSUM`
pub fn quat_real_vsum() -> @kernel.Thm {
  quat_real_vsum_c.get()
}

///|
/// QUAT_REAL_SEGMENT
fn step_213() -> Unit raise {
  let t305 = @tactics.then_tac(@simp.simp_tac(@list.List([@topology.segment(), @sets.in_elim_thm(), quat_real(), quat_eq(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm(), quat_add_components(), quat_cmul_components()])), @calc_rat.real_arith_tac)
  quat_real_segment_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 4], ∀ b : Cart[Real, 4], ∀ x : Cart[Real, 4], IN(x, segment([(a, b)])) && quat_real(a) && quat_real(b) → quat_real(x)"), t305))
}

///|
let quat_real_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_SEGMENT")

///|
/// `QUAT_REAL_SEGMENT`
pub fn quat_real_segment() -> @kernel.Thm {
  quat_real_segment_c.get()
}

///|
/// IN_SEGMENT_HX
fn step_214() -> Unit raise {
  let t338 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t336 = @tactics.conv_tac(@calc_rat.real_field)
  let t337 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((a : Real) == (b : Real))")), t336)]))
  let t333 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.exists_tac(@term_syntax.parse_term("((a : Real) - (x : Real)) / (a - (b : Real))"))])
  let t334 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real) - (b : Real)"), fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s331 = @tactics.assume_tac(x330)
    fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s331(x332)
    }
  }), t333)
  let t329 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.exists_tac(@term_syntax.parse_term("((x : Real) - (a : Real)) / ((b : Real) - a)"))])
  let t335 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (b : Real) - (a : Real)"), fn(x326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s327 = @tactics.assume_tac(x326)
    fn(x328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s327(x328)
    }
  }), t329), t334])
  let t324 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t323 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) || b <= a")))
  let t319 = @calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real)) * (a : Real) + u * (b : Real) <= b) == (real_of_num(0) <= (real_of_num(1) - u) * (b - a))"))
  let t320 = @calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real)) * (a : Real) + u * (b : Real) <= a) == (real_of_num(0) <= u * (a - b))"))
  let t321 = @calc_rat.real_arith(@term_syntax.parse_term("((b : Real) <= (real_of_num(1) - (u : Real)) * (a : Real) + u * b) == (real_of_num(0) <= (real_of_num(1) - u) * (a - b))"))
  let t322 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (real_of_num(1) - (u : Real)) * a + u * (b : Real)) == (real_of_num(0) <= u * (b - a))")), t321, t320, t319]))
  let t318 = @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s316 = @tactics.subst1_tac(x315)
    fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s316(x317)
    }
  })
  let t325 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(t318)), t322), t323), @list.List([@tactics.disj1_tac, @tactics.disj2_tac])), @tactics.conj_tac), t324), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t313 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t312 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t311 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_antisym()]))
  let t310 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (b : Real)"))
  let t314 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (b : Real) + u * b == b"))])), t310), t311), t312), t313), @tactics.all_tac])
  let t309 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == (b : Real)"))
  let t307 = @equal.gsym(hx_mul())
  let t308 = @simp.rewrite_tac(@list.List([quat_cmul(), @equal.gsym(hx_add()), hx_inj(), t307]))
  let t306 = @simp.rewrite_tac(@list.List([@topology.segment(), @sets.in_elim_thm()]))
  let t339 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t306), t308), t309), t314), @tactics.eq_tac), t325), @tactics.strip_tac), t335), t337), t338), @calc_rat.asm_real_arith_tac)
  in_segment_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Real, IN(Hx(x), segment([(Hx(a), Hx(b))])) == (a <= x && x <= b || b <= x && x <= a)"), t339))
}

///|
let in_segment_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SEGMENT_HX")

///|
/// `IN_SEGMENT_HX`
pub fn in_segment_hx() -> @kernel.Thm {
  in_segment_hx_c.get()
}

///|
/// IN_SEGMENT_HX_GEN
fn step_215() -> Unit raise {
  let t348 = @meson.asm_meson_tac(@list.List([quat_real_segment(), real_hx()]))
  let t347 = @simp.rewrite_tac(@list.List([in_segment_hx(), real_hx(), hx_components()]))
  let t345 = @simp.rewrite_rule(@list.List([quat_real_v1()]))
  let t349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s342 = @tactics.subst1_tac(x341)
        fn(x343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s342(x343)
        }
      })(@equal.sym(x344))
    })(t345(x346))
  }), t347), @calc_rat.real_arith_tac), t348])
  let t340 = @class.asm_cases_tac(@term_syntax.parse_term("quat_real((x : Cart[Real, 4]))"))
  let t350 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t340), t349)
  in_segment_hx_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Cart[Real, 4], IN(x, segment([(Hx(a), Hx(b))])) == (quat_real(x) && (a <= quat_Re(x) && quat_Re(x) <= b || b <= quat_Re(x) && quat_Re(x) <= a))"), t350))
}

///|
let in_segment_hx_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SEGMENT_HX_GEN")

///|
/// `IN_SEGMENT_HX_GEN`
pub fn in_segment_hx_gen() -> @kernel.Thm {
  in_segment_hx_gen_c.get()
}

///|
/// QUAT_RE_POS_SEGMENT
fn step_216() -> Unit raise {
  let t353 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_sub_le(), @realarith.real_lt_imp_le(), @realarith.real_entire()]))
  let t352 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && !(x == real_of_num(0) && y == real_of_num(0)) → real_of_num(0) < x + y")))
  let t351 = @tactics.repeat_tac(@tactics.strip_tac)
  let t354 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@topology.segment(), @sets.in_elim_thm(), quat_real(), quat_eq(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm(), quat_add_components(), quat_cmul_components()])), t351), t352), t353), @calc_rat.asm_real_arith_tac)
  quat_re_pos_segment_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 4], ∀ b : Cart[Real, 4], ∀ x : Cart[Real, 4], IN(x, segment([(a, b)])) && real_of_num(0) < quat_Re(a) && real_of_num(0) < quat_Re(b) → real_of_num(0) < quat_Re(x)"), t354))
}

///|
let quat_re_pos_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_RE_POS_SEGMENT")

///|
/// `QUAT_RE_POS_SEGMENT`
pub fn quat_re_pos_segment() -> @kernel.Thm {
  quat_re_pos_segment_c.get()
}

///|
/// QUAT_CONVEX_REAL
fn step_217() -> Unit raise {
  let t355 = @simp.simp_tac(@list.List([quat_real_add(), quat_real_mul(), real_hx()]))
  let t356 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex(), @sets.in_(), quat_cmul()])), t355)
  quat_convex_real_c.set(@tactics.prove(@term_syntax.parse_term("convex(quat_real)"), t356))
}

///|
let quat_convex_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_CONVEX_REAL")

///|
/// `QUAT_CONVEX_REAL`
pub fn quat_convex_real() -> @kernel.Thm {
  quat_convex_real_c.get()
}

///|
/// IMAGE_HX
fn step_218() -> Unit raise {
  let t357 = @meson.meson_tac(@list.List([hx_components(), quat_real_v1()]))
  let t358 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image()])), t357)
  image_hx_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, IMAGE(Hx, s) == {(q : Cart[Real, 4]) | quat_real(q) && IN(quat_Re(q), s)}"), t358))
}

///|
let image_hx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_HX")

///|
/// `IMAGE_HX`
pub fn image_hx() -> @kernel.Thm {
  image_hx_c.get()
}

///|
/// QUAT_REAL_NORM
fn step_219() -> Unit raise {
  let t360 = @simp.rewrite_tac(@list.List([@real.pow_2_sqrt_abs(), @calc_int.real_add_rid()]))
  let t359 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t361 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([quat_real(), quat_norm()])), t359), t360)
  quat_real_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) → norm(q) == abs(quat_Re(q))"), t361))
}

///|
let quat_real_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_NORM")

///|
/// `QUAT_REAL_NORM`
pub fn quat_real_norm() -> @kernel.Thm {
  quat_real_norm_c.get()
}

///|
/// QUAT_REAL_NORM_POS
fn step_220() -> Unit raise {
  let t362 = @tactics.then_tac(@simp.simp_tac(@list.List([quat_real_norm()])), @calc_rat.real_arith_tac)
  quat_real_norm_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], quat_real(q) && real_of_num(0) <= quat_Re(q) → norm(q) == quat_Re(q)"), t362))
}

///|
let quat_real_norm_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_REAL_NORM_POS")

///|
/// `QUAT_REAL_NORM_POS`
pub fn quat_real_norm_pos() -> @kernel.Thm {
  quat_real_norm_pos_c.get()
}

///|
/// QUAT_NORM_VSUM_SUM_RE
fn step_221() -> Unit raise {
  let t365 = @simp.asm_simp_tac(@list.List([quat_real_vsum(), quat_vsum_components(), @iterate.sum_pos_le()]))
  let t364 = @tactics.match_mp_tac(quat_real_norm_pos())
  let t363 = @tactics.repeat_tac(@tactics.strip_tac)
  let t366 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(quat_vsum_components())])), t363), t364), t365)
  quat_norm_vsum_sum_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → quat_real(f(x)) && real_of_num(0) <= quat_Re(f(x))) → norm(vsum(s, f)) == sum(s, (x : A) => quat_Re(f(x)))"), t366))
}

///|
let quat_norm_vsum_sum_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_VSUM_SUM_RE")

///|
/// `QUAT_NORM_VSUM_SUM_RE`
pub fn quat_norm_vsum_sum_re() -> @kernel.Thm {
  quat_norm_vsum_sum_re_c.get()
}

///|
/// QUAT_NORM_VSUM_BOUND
fn step_222() -> Unit raise {
  let t375 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @vectors.norm_pos_le()]))
  let t374 = @tactics.match_mp_tac(quat_norm_vsum_sum_re())
  let t373 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) → y <= x")))
  let t372 = @simp.asm_simp_tac(@list.List([@iterate.sum_le()]))
  let t371 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => quat_Re((g : (A) -> Cart[Real, 4])(x)))"))
  let t370 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t369 = @simp.asm_simp_tac(@list.List([@vectors.vsum_norm()]))
  let t368 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => norm((f : (A) -> Cart[Real, 4])(x)))"))
  let t367 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t376 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t367), t368), t369), t370), t371), t372), t373), t374), t375)
  quat_norm_vsum_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], FINITE(s) && (∀ x : A, IN(x, s) → quat_real(g(x)) && norm(f(x)) <= quat_Re(g(x))) → norm(vsum(s, f)) <= norm(vsum(s, g))"), t376))
}

///|
let quat_norm_vsum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_VSUM_BOUND")

///|
/// `QUAT_NORM_VSUM_BOUND`
pub fn quat_norm_vsum_bound() -> @kernel.Thm {
  quat_norm_vsum_bound_c.get()
}

///|
/// QUAT_NORM_VSUM_BOUND_SUBSET
fn step_223() -> Unit raise {
  let t388 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @vectors.norm_pos_le(), @sets.finite_subset(), @sets.subset()]))
  let t385 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t386 = @tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset()), t385)
  let t387 = @list.List([@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(quat_norm_vsum_sum_re())), t386])
  let t383 = @tactics.conjuncts_then(fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s381 = @tactics.subst1_tac(x380)
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s381(x382)
    }
  })
  let t384 = @tactics.subgoal_then(@term_syntax.parse_term("norm(vsum((t : (A) -> Bool), (g : (A) -> Cart[Real, 4]))) == sum(t, (x : A) => quat_Re(g(x))) && norm(vsum((s : (A) -> Bool), g)) == sum(s, (x : A) => quat_Re(g(x)))"), t383)
  let t379 = @list.List([@meson.asm_meson_tac(@list.List([quat_norm_vsum_bound(), @sets.subset(), @sets.finite_subset()])), @tactics.all_tac])
  let t378 = @tactics.exists_tac(@term_syntax.parse_term("norm(vsum((t : (A) -> Bool), (g : (A) -> Cart[Real, 4])))"))
  let t377 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t389 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t377), t378), @tactics.conj_tac), t379), t384), t387), t388)
  quat_norm_vsum_bound_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) && (∀ x : A, IN(x, s) → quat_real(g(x)) && norm(f(x)) <= quat_Re(g(x))) → norm(vsum(t, f)) <= norm(vsum(s, g))"), t389))
}

///|
let quat_norm_vsum_bound_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_VSUM_BOUND_SUBSET")

///|
/// `QUAT_NORM_VSUM_BOUND_SUBSET`
pub fn quat_norm_vsum_bound_subset() -> @kernel.Thm {
  quat_norm_vsum_bound_subset_c.get()
}

///|
/// Quaternions/quaternion.hl:1282
fn step_224() -> Unit raise {
  let t390 = @tactics.then_tac(@simp.rewrite_tac(@list.List([quat_sqnorm(), quat_cnj()])), simple_quat_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_Re(x) == quat_Re(y) && pow(norm(x), 2) == pow(norm(y), 2) → quat_mul(y, y - x) == quat_mul(y - x, quat_cnj(x))"), t390)
  let t404 = @simp.asm_rewrite_tac(@list.List([]))
  let t403 = @tactics.match_mp_tac(lemma)
  let t402 = @simp.asm_simp_tac(@list.List([quat_mul_assoc(), quat_mul_rinv(), quat_mul_lid()]))
  let t401 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 4]) - (x : Cart[Real, 4])"))
  let t400 = @tactics.match_mp_tac(quat_mul_lcancel())
  let t399 = @list.List([@tactics.then_tac(@tactics.remove_then("neq", fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s397 = @tactics.mp_tac(x396)
    fn(x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s397(x398)
    }
  }), simple_quat_arith_tac), @tactics.all_tac])
  let t395 = @tactics.subgoal_then(@term_syntax.parse_term("!((y : Cart[Real, 4]) - (x : Cart[Real, 4]) == Hx(real_of_num(0)))"), fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s393 = @tactics.assume_tac(x392)
    fn(x394 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s393(x394)
    }
  })
  let t391 = @theorems.intro_tac("neq re_eq norm_eq")
  let t405 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t391), t395), t399), t400), t401), t402), t403), t404)
  ignore(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], !(x == y) && quat_Re(x) == quat_Re(y) && pow(norm(x), 2) == pow(norm(y), 2) → quat_mul(quat_inv(y - x), quat_mul(y, y - x)) == quat_cnj(x)"), t405))
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
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
}
