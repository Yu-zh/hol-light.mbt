// Translated from upstream Multivariate/complexes.ml; edit this file directly.

///|
/// Multivariate/complexes.ml:10
fn step_1() -> Unit raise {
  @preterm.new_type_abbrev("complex", @parser.parse_type("real^2"))
}

///|
/// `prioritize_complex`
pub fn prioritize_complex(x1 : Unit) -> Unit raise {
  let _ = x1
  @preterm.overload_interface("--", @term_syntax.parse_term("(op_minus_minus : (Cart[Real, 2]) -> Cart[Real, 2])"))
  @preterm.overload_interface("+", @term_syntax.parse_term("(op_plus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])"))
  @preterm.overload_interface("-", @term_syntax.parse_term("(op_minus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])"))
  @preterm.overload_interface("*", @term_syntax.parse_term("(complex_mul : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])"))
  @preterm.overload_interface("/", @term_syntax.parse_term("(complex_div : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])"))
  @preterm.overload_interface("pow", @term_syntax.parse_term("(complex_pow : (Cart[Real, 2], Num) -> Cart[Real, 2])"))
  @preterm.overload_interface("inv", @term_syntax.parse_term("(complex_inv : (Cart[Real, 2]) -> Cart[Real, 2])"))
}

///|
/// Multivariate/complexes.ml:21
fn step_2() -> Unit raise {
  prioritize_complex(())
}

///|
/// RE_DEF
fn step_3() -> Unit raise {
  re_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Re : (Cart[Real, 2]) -> Real)((z : Cart[Real, 2])) == op_dollar(z, 1)")))
}

///|
let re_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_DEF")

///|
/// `RE_DEF`
pub fn re_def() -> @kernel.Thm {
  re_def_c.get()
}

///|
/// IM_DEF
fn step_4() -> Unit raise {
  im_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Im : (Cart[Real, 2]) -> Real)((z : Cart[Real, 2])) == op_dollar(z, 2)")))
}

///|
let im_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_DEF")

///|
/// `IM_DEF`
pub fn im_def() -> @kernel.Thm {
  im_def_c.get()
}

///|
/// complex
fn step_5() -> Unit raise {
  complex_c.set(@pair.new_definition(@term_syntax.parse_term("(complex : ((Real, Real)) -> Cart[Real, 2])(((x : Real), (y : Real))) == vector([x, y])")))
}

///|
let complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex")

///|
/// `complex`
pub fn complex() -> @kernel.Thm {
  complex_c.get()
}

///|
/// CX_DEF
fn step_6() -> Unit raise {
  cx_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Cx : (Real) -> Cart[Real, 2])((a : Real)) == complex((a, real_of_num(0)))")))
}

///|
let cx_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_DEF")

///|
/// `CX_DEF`
pub fn cx_def() -> @kernel.Thm {
  cx_def_c.get()
}

///|
/// ii
fn step_7() -> Unit raise {
  ii_c.set(@pair.new_definition(@term_syntax.parse_term("(ii : Cart[Real, 2]) == complex((real_of_num(0), real_of_num(1)))")))
}

///|
let ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ii")

///|
/// `ii`
pub fn ii() -> @kernel.Thm {
  ii_c.get()
}

///|
/// complex_mul
fn step_8() -> Unit raise {
  complex_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_mul : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]), (z : Cart[Real, 2])) == complex((Re(w) * Re(z) - Im(w) * Im(z), Re(w) * Im(z) + Im(w) * Re(z)))")))
}

///|
let complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_mul")

///|
/// `complex_mul`
pub fn complex_mul() -> @kernel.Thm {
  complex_mul_c.get()
}

///|
/// complex_inv
fn step_9() -> Unit raise {
  complex_inv_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_inv : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == complex((Re(z) / (pow(Re(z), 2) + pow(Im(z), 2)), -Im(z) / (pow(Re(z), 2) + pow(Im(z), 2))))")))
}

///|
let complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_inv")

///|
/// `complex_inv`
pub fn complex_inv() -> @kernel.Thm {
  complex_inv_c.get()
}

///|
/// complex_div
fn step_10() -> Unit raise {
  complex_div_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_div : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]), (z : Cart[Real, 2])) == complex_mul(w, complex_inv(z))")))
}

///|
let complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_div")

///|
/// `complex_div`
pub fn complex_div() -> @kernel.Thm {
  complex_div_c.get()
}

///|
/// complex_pow
fn step_11() -> Unit raise {
  complex_pow_c.set(@define.define_(@term_syntax.parse_term("(complex_pow : (Cart[Real, 2], Num) -> Cart[Real, 2])((x : Cart[Real, 2]), 0) == Cx(real_of_num(1)) && (∀ n : Num, complex_pow(x, SUC(n)) == complex_mul(x, complex_pow(x, n)))")))
}

///|
let complex_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_pow")

///|
/// `complex_pow`
pub fn complex_pow() -> @kernel.Thm {
  complex_pow_c.get()
}

///|
/// RE
fn step_12() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([re_def(), complex(), @vectors.vector_2()]))
  re_c.set(@tactics.prove(@term_syntax.parse_term("Re(complex(((x : Real), (y : Real)))) == x"), t2))
}

///|
let re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE")

///|
/// `RE`
pub fn re() -> @kernel.Thm {
  re_c.get()
}

///|
/// IM
fn step_13() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([im_def(), complex(), @vectors.vector_2()]))
  im_c.set(@tactics.prove(@term_syntax.parse_term("Im(complex(((x : Real), (y : Real)))) == y"), t3))
}

///|
let im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM")

///|
/// `IM`
pub fn im() -> @kernel.Thm {
  im_c.get()
}

///|
/// COMPLEX_EQ
fn step_14() -> Unit raise {
  let t4 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @cart.dimindex_2(), re_def(), im_def()]))
  complex_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (w == z) == (Re(w) == Re(z) && Im(w) == Im(z))"), t4))
}

///|
let complex_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ")

///|
/// `COMPLEX_EQ`
pub fn complex_eq() -> @kernel.Thm {
  complex_eq_c.get()
}

///|
/// COMPLEX
fn step_15() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([complex_eq(), re(), im()]))
  complex_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex((Re(z), Im(z))) == z"), t5))
}

///|
let complex_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX")

///|
/// `COMPLEX`
pub fn complex_v1() -> @kernel.Thm {
  complex_v1_c.get()
}

///|
/// COMPLEX_EQ_0
fn step_16() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square(), @realarith.real_entire()]))
  let t11 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x + y == real_of_num(0) → real_of_num(0) <= x && real_of_num(0) <= y → x == real_of_num(0) && y == real_of_num(0)")))
  let t13 = @tactics.disch_then(fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x8 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s9 = @tactics.mp_tac(x8)
      fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s9(x10)
      }
    })(t11(x12))
  })
  let t7 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t6 = @simp.simp_tac(@list.List([]))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), cx_def(), re(), im()])), @tactics.eq_tac), t6), t7), t13), t14)
  complex_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("((z : Cart[Real, 2]) == Cx(real_of_num(0))) == (pow(Re(z), 2) + pow(Im(z), 2) == real_of_num(0))"), t15))
}

///|
let complex_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_0")

///|
/// `COMPLEX_EQ_0`
pub fn complex_eq_0() -> @kernel.Thm {
  complex_eq_0_c.get()
}

///|
/// FORALL_COMPLEX
fn step_17() -> Unit raise {
  let t16 = @meson.meson_tac(@list.List([complex_v1()]))
  forall_complex_c.set(@tactics.prove(@term_syntax.parse_term("(∀ z : Cart[Real, 2], (P : (Cart[Real, 2]) -> Bool)(z)) == (∀ x : Real, ∀ y : Real, P(complex((x, y))))"), t16))
}

///|
let forall_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_COMPLEX")

///|
/// `FORALL_COMPLEX`
pub fn forall_complex() -> @kernel.Thm {
  forall_complex_c.get()
}

///|
/// EXISTS_COMPLEX
fn step_18() -> Unit raise {
  let t17 = @meson.meson_tac(@list.List([complex_v1()]))
  exists_complex_c.set(@tactics.prove(@term_syntax.parse_term("(∃ z : Cart[Real, 2], (P : (Cart[Real, 2]) -> Bool)(z)) == (∃ x : Real, ∃ y : Real, P(complex((x, y))))"), t17))
}

///|
let exists_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_COMPLEX")

///|
/// `EXISTS_COMPLEX`
pub fn exists_complex() -> @kernel.Thm {
  exists_complex_c.get()
}

///|
/// complex_neg
fn step_19() -> Unit raise {
  let t19 = @simp.simp_tac(@list.List([@vectors.vector_neg_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t18 = @simp.rewrite_tac(@list.List([re_def(), im_def()]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re(), im()])), t18), t19)
  complex_neg_c.set(@tactics.prove(@term_syntax.parse_term("-(z : Cart[Real, 2]) == complex((-Re(z), -Im(z)))"), t20))
}

///|
let complex_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_neg")

///|
/// `complex_neg`
pub fn complex_neg() -> @kernel.Thm {
  complex_neg_c.get()
}

///|
/// complex_add
fn step_20() -> Unit raise {
  let t22 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t21 = @simp.rewrite_tac(@list.List([re_def(), im_def()]))
  let t23 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re(), im()])), t21), t22)
  complex_add_c.set(@tactics.prove(@term_syntax.parse_term("(w : Cart[Real, 2]) + (z : Cart[Real, 2]) == complex((Re(w) + Re(z), Im(w) + Im(z)))"), t23))
}

///|
let complex_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_add")

///|
/// `complex_add`
pub fn complex_add() -> @kernel.Thm {
  complex_add_c.get()
}

///|
/// complex_sub
fn step_21() -> Unit raise {
  complex_sub_c.set(@vectors.vector_arith(@term_syntax.parse_term("(w : Cart[Real, 2]) - (z : Cart[Real, 2]) == w + -z")))
}

///|
let complex_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_sub")

///|
/// `complex_sub`
pub fn complex_sub() -> @kernel.Thm {
  complex_sub_c.get()
}

///|
/// complex_norm
fn step_22() -> Unit raise {
  let t24 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_norm(), @vectors.dot(), re_def(), im_def(), @vectors.sum_2(), @cart.dimindex_2()])), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  complex_norm_c.set(@tactics.prove(@term_syntax.parse_term("norm((z : Cart[Real, 2])) == sqrt(pow(Re(z), 2) + pow(Im(z), 2))"), t24))
}

///|
let complex_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_norm")

///|
/// `complex_norm`
pub fn complex_norm() -> @kernel.Thm {
  complex_norm_c.get()
}

///|
/// COMPLEX_SQNORM
fn step_23() -> Unit raise {
  let t25 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot(), re_def(), im_def(), @vectors.sum_2(), @cart.dimindex_2()])), @calc_rat.real_arith_tac)
  complex_sqnorm_c.set(@tactics.prove(@term_syntax.parse_term("pow(norm((z : Cart[Real, 2])), 2) == pow(Re(z), 2) + pow(Im(z), 2)"), t25))
}

///|
let complex_sqnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SQNORM")

///|
/// `COMPLEX_SQNORM`
pub fn complex_sqnorm() -> @kernel.Thm {
  complex_sqnorm_c.get()
}

///|
/// SIMPLE_COMPLEX_ARITH_TAC
fn step_24() -> Unit raise {
  let t26 = @tactics.conv_tac(@calc_rat.real_field)
  simple_complex_arith_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re(), im(), cx_def(), complex_add(), complex_neg(), complex_sub(), complex_mul(), complex_inv(), complex_div()])), t26))
}

///|
let simple_complex_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SIMPLE_COMPLEX_ARITH_TAC")

///|
/// `SIMPLE_COMPLEX_ARITH_TAC`
pub fn simple_complex_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (simple_complex_arith_tac_c.get())(x)
}

///|
/// `SIMPLE_COMPLEX_ARITH`
pub fn simple_complex_arith(x27 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x27
  @tactics.prove(tm, simple_complex_arith_tac)
}

///|
/// COMPLEX_ADD_SYM
fn step_25() -> Unit raise {
  complex_add_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x + y == y + x"), simple_complex_arith_tac))
}

///|
let complex_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_SYM")

///|
/// `COMPLEX_ADD_SYM`
pub fn complex_add_sym() -> @kernel.Thm {
  complex_add_sym_c.get()
}

///|
/// COMPLEX_ADD_ASSOC
fn step_26() -> Unit raise {
  complex_add_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], x + (y + z) == x + y + z"), simple_complex_arith_tac))
}

///|
let complex_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_ASSOC")

///|
/// `COMPLEX_ADD_ASSOC`
pub fn complex_add_assoc() -> @kernel.Thm {
  complex_add_assoc_c.get()
}

///|
/// COMPLEX_ADD_LID
fn step_27() -> Unit raise {
  complex_add_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], Cx(real_of_num(0)) + x == x"), simple_complex_arith_tac))
}

///|
let complex_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_LID")

///|
/// `COMPLEX_ADD_LID`
pub fn complex_add_lid() -> @kernel.Thm {
  complex_add_lid_c.get()
}

///|
/// COMPLEX_ADD_LINV
fn step_28() -> Unit raise {
  complex_add_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], -x + x == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_add_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_LINV")

///|
/// `COMPLEX_ADD_LINV`
pub fn complex_add_linv() -> @kernel.Thm {
  complex_add_linv_c.get()
}

///|
/// COMPLEX_MUL_SYM
fn step_29() -> Unit raise {
  complex_mul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(x, y) == complex_mul(y, x)"), simple_complex_arith_tac))
}

///|
let complex_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_SYM")

///|
/// `COMPLEX_MUL_SYM`
pub fn complex_mul_sym() -> @kernel.Thm {
  complex_mul_sym_c.get()
}

///|
/// COMPLEX_MUL_ASSOC
fn step_30() -> Unit raise {
  complex_mul_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x, complex_mul(y, z)) == complex_mul(complex_mul(x, y), z)"), simple_complex_arith_tac))
}

///|
let complex_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_ASSOC")

///|
/// `COMPLEX_MUL_ASSOC`
pub fn complex_mul_assoc() -> @kernel.Thm {
  complex_mul_assoc_c.get()
}

///|
/// COMPLEX_MUL_LID
fn step_31() -> Unit raise {
  complex_mul_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(1)), x) == x"), simple_complex_arith_tac))
}

///|
let complex_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LID")

///|
/// `COMPLEX_MUL_LID`
pub fn complex_mul_lid() -> @kernel.Thm {
  complex_mul_lid_c.get()
}

///|
/// COMPLEX_ADD_LDISTRIB
fn step_32() -> Unit raise {
  complex_add_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x, y + z) == complex_mul(x, y) + complex_mul(x, z)"), simple_complex_arith_tac))
}

///|
let complex_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_LDISTRIB")

///|
/// `COMPLEX_ADD_LDISTRIB`
pub fn complex_add_ldistrib() -> @kernel.Thm {
  complex_add_ldistrib_c.get()
}

///|
/// COMPLEX_ADD_AC
fn step_33() -> Unit raise {
  complex_add_ac_c.set(@tactics.prove(@term_syntax.parse_term("(m : Cart[Real, 2]) + (n : Cart[Real, 2]) == n + m && m + n + (p : Cart[Real, 2]) == m + (n + p) && m + (n + p) == n + (m + p)"), simple_complex_arith_tac))
}

///|
let complex_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_AC")

///|
/// `COMPLEX_ADD_AC`
pub fn complex_add_ac() -> @kernel.Thm {
  complex_add_ac_c.get()
}

///|
/// COMPLEX_MUL_AC
fn step_34() -> Unit raise {
  complex_mul_ac_c.set(@tactics.prove(@term_syntax.parse_term("complex_mul((m : Cart[Real, 2]), (n : Cart[Real, 2])) == complex_mul(n, m) && complex_mul(complex_mul(m, n), (p : Cart[Real, 2])) == complex_mul(m, complex_mul(n, p)) && complex_mul(m, complex_mul(n, p)) == complex_mul(n, complex_mul(m, p))"), simple_complex_arith_tac))
}

///|
let complex_mul_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_AC")

///|
/// `COMPLEX_MUL_AC`
pub fn complex_mul_ac() -> @kernel.Thm {
  complex_mul_ac_c.get()
}

///|
/// COMPLEX_ADD_RID
fn step_35() -> Unit raise {
  complex_add_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], x + Cx(real_of_num(0)) == x"), simple_complex_arith_tac))
}

///|
let complex_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_RID")

///|
/// `COMPLEX_ADD_RID`
pub fn complex_add_rid() -> @kernel.Thm {
  complex_add_rid_c.get()
}

///|
/// COMPLEX_MUL_RID
fn step_36() -> Unit raise {
  complex_mul_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_mul(x, Cx(real_of_num(1))) == x"), simple_complex_arith_tac))
}

///|
let complex_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RID")

///|
/// `COMPLEX_MUL_RID`
pub fn complex_mul_rid() -> @kernel.Thm {
  complex_mul_rid_c.get()
}

///|
/// COMPLEX_ADD_RINV
fn step_37() -> Unit raise {
  complex_add_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], x + -x == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_add_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_RINV")

///|
/// `COMPLEX_ADD_RINV`
pub fn complex_add_rinv() -> @kernel.Thm {
  complex_add_rinv_c.get()
}

///|
/// COMPLEX_ADD_RDISTRIB
fn step_38() -> Unit raise {
  complex_add_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x + y, z) == complex_mul(x, z) + complex_mul(y, z)"), simple_complex_arith_tac))
}

///|
let complex_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_RDISTRIB")

///|
/// `COMPLEX_ADD_RDISTRIB`
pub fn complex_add_rdistrib() -> @kernel.Thm {
  complex_add_rdistrib_c.get()
}

///|
/// COMPLEX_EQ_ADD_LCANCEL
fn step_39() -> Unit raise {
  complex_eq_add_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (x + y == x + z) == (y == z)"), simple_complex_arith_tac))
}

///|
let complex_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_ADD_LCANCEL")

///|
/// `COMPLEX_EQ_ADD_LCANCEL`
pub fn complex_eq_add_lcancel() -> @kernel.Thm {
  complex_eq_add_lcancel_c.get()
}

///|
/// COMPLEX_EQ_ADD_RCANCEL
fn step_40() -> Unit raise {
  complex_eq_add_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (x + z == y + z) == (x == y)"), simple_complex_arith_tac))
}

///|
let complex_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_ADD_RCANCEL")

///|
/// `COMPLEX_EQ_ADD_RCANCEL`
pub fn complex_eq_add_rcancel() -> @kernel.Thm {
  complex_eq_add_rcancel_c.get()
}

///|
/// COMPLEX_MUL_RZERO
fn step_41() -> Unit raise {
  complex_mul_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_mul(x, Cx(real_of_num(0))) == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RZERO")

///|
/// `COMPLEX_MUL_RZERO`
pub fn complex_mul_rzero() -> @kernel.Thm {
  complex_mul_rzero_c.get()
}

///|
/// COMPLEX_MUL_LZERO
fn step_42() -> Unit raise {
  complex_mul_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LZERO")

///|
/// `COMPLEX_MUL_LZERO`
pub fn complex_mul_lzero() -> @kernel.Thm {
  complex_mul_lzero_c.get()
}

///|
/// COMPLEX_NEG_NEG
fn step_43() -> Unit raise {
  complex_neg_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], --x == x"), simple_complex_arith_tac))
}

///|
let complex_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_NEG")

///|
/// `COMPLEX_NEG_NEG`
pub fn complex_neg_neg() -> @kernel.Thm {
  complex_neg_neg_c.get()
}

///|
/// COMPLEX_MUL_RNEG
fn step_44() -> Unit raise {
  complex_mul_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(x, -y) == -complex_mul(x, y)"), simple_complex_arith_tac))
}

///|
let complex_mul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RNEG")

///|
/// `COMPLEX_MUL_RNEG`
pub fn complex_mul_rneg() -> @kernel.Thm {
  complex_mul_rneg_c.get()
}

///|
/// COMPLEX_MUL_LNEG
fn step_45() -> Unit raise {
  complex_mul_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(-x, y) == -complex_mul(x, y)"), simple_complex_arith_tac))
}

///|
let complex_mul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LNEG")

///|
/// `COMPLEX_MUL_LNEG`
pub fn complex_mul_lneg() -> @kernel.Thm {
  complex_mul_lneg_c.get()
}

///|
/// COMPLEX_NEG_ADD
fn step_46() -> Unit raise {
  complex_neg_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -(x + y) == -x + -y"), simple_complex_arith_tac))
}

///|
let complex_neg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_ADD")

///|
/// `COMPLEX_NEG_ADD`
pub fn complex_neg_add() -> @kernel.Thm {
  complex_neg_add_c.get()
}

///|
/// COMPLEX_NEG_0
fn step_47() -> Unit raise {
  complex_neg_0_c.set(@tactics.prove(@term_syntax.parse_term("-Cx(real_of_num(0)) == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_neg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_0")

///|
/// `COMPLEX_NEG_0`
pub fn complex_neg_0() -> @kernel.Thm {
  complex_neg_0_c.get()
}

///|
/// COMPLEX_EQ_ADD_LCANCEL_0
fn step_48() -> Unit raise {
  complex_eq_add_lcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (x + y == x) == (y == Cx(real_of_num(0)))"), simple_complex_arith_tac))
}

///|
let complex_eq_add_lcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_ADD_LCANCEL_0")

///|
/// `COMPLEX_EQ_ADD_LCANCEL_0`
pub fn complex_eq_add_lcancel_0() -> @kernel.Thm {
  complex_eq_add_lcancel_0_c.get()
}

///|
/// COMPLEX_EQ_ADD_RCANCEL_0
fn step_49() -> Unit raise {
  complex_eq_add_rcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (x + y == y) == (x == Cx(real_of_num(0)))"), simple_complex_arith_tac))
}

///|
let complex_eq_add_rcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_ADD_RCANCEL_0")

///|
/// `COMPLEX_EQ_ADD_RCANCEL_0`
pub fn complex_eq_add_rcancel_0() -> @kernel.Thm {
  complex_eq_add_rcancel_0_c.get()
}

///|
/// COMPLEX_LNEG_UNIQ
fn step_50() -> Unit raise {
  complex_lneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (x + y == Cx(real_of_num(0))) == (x == -y)"), simple_complex_arith_tac))
}

///|
let complex_lneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_LNEG_UNIQ")

///|
/// `COMPLEX_LNEG_UNIQ`
pub fn complex_lneg_uniq() -> @kernel.Thm {
  complex_lneg_uniq_c.get()
}

///|
/// COMPLEX_RNEG_UNIQ
fn step_51() -> Unit raise {
  complex_rneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (x + y == Cx(real_of_num(0))) == (y == -x)"), simple_complex_arith_tac))
}

///|
let complex_rneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_RNEG_UNIQ")

///|
/// `COMPLEX_RNEG_UNIQ`
pub fn complex_rneg_uniq() -> @kernel.Thm {
  complex_rneg_uniq_c.get()
}

///|
/// COMPLEX_NEG_LMUL
fn step_52() -> Unit raise {
  complex_neg_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -complex_mul(x, y) == complex_mul(-x, y)"), simple_complex_arith_tac))
}

///|
let complex_neg_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_LMUL")

///|
/// `COMPLEX_NEG_LMUL`
pub fn complex_neg_lmul() -> @kernel.Thm {
  complex_neg_lmul_c.get()
}

///|
/// COMPLEX_NEG_RMUL
fn step_53() -> Unit raise {
  complex_neg_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -complex_mul(x, y) == complex_mul(x, -y)"), simple_complex_arith_tac))
}

///|
let complex_neg_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_RMUL")

///|
/// `COMPLEX_NEG_RMUL`
pub fn complex_neg_rmul() -> @kernel.Thm {
  complex_neg_rmul_c.get()
}

///|
/// COMPLEX_NEG_MUL2
fn step_54() -> Unit raise {
  complex_neg_mul2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(-x, -y) == complex_mul(x, y)"), simple_complex_arith_tac))
}

///|
let complex_neg_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_MUL2")

///|
/// `COMPLEX_NEG_MUL2`
pub fn complex_neg_mul2() -> @kernel.Thm {
  complex_neg_mul2_c.get()
}

///|
/// COMPLEX_SUB_ADD
fn step_55() -> Unit raise {
  complex_sub_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - y + y == x"), simple_complex_arith_tac))
}

///|
let complex_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_ADD")

///|
/// `COMPLEX_SUB_ADD`
pub fn complex_sub_add() -> @kernel.Thm {
  complex_sub_add_c.get()
}

///|
/// COMPLEX_SUB_ADD2
fn step_56() -> Unit raise {
  complex_sub_add2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], y + (x - y) == x"), simple_complex_arith_tac))
}

///|
let complex_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_ADD2")

///|
/// `COMPLEX_SUB_ADD2`
pub fn complex_sub_add2() -> @kernel.Thm {
  complex_sub_add2_c.get()
}

///|
/// COMPLEX_SUB_REFL
fn step_57() -> Unit raise {
  complex_sub_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], x - x == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_REFL")

///|
/// `COMPLEX_SUB_REFL`
pub fn complex_sub_refl() -> @kernel.Thm {
  complex_sub_refl_c.get()
}

///|
/// COMPLEX_SUB_0
fn step_58() -> Unit raise {
  complex_sub_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (x - y == Cx(real_of_num(0))) == (x == y)"), simple_complex_arith_tac))
}

///|
let complex_sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_0")

///|
/// `COMPLEX_SUB_0`
pub fn complex_sub_0() -> @kernel.Thm {
  complex_sub_0_c.get()
}

///|
/// COMPLEX_NEG_EQ_0
fn step_59() -> Unit raise {
  complex_neg_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], (-x == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)))"), simple_complex_arith_tac))
}

///|
let complex_neg_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_EQ_0")

///|
/// `COMPLEX_NEG_EQ_0`
pub fn complex_neg_eq_0() -> @kernel.Thm {
  complex_neg_eq_0_c.get()
}

///|
/// COMPLEX_NEG_SUB
fn step_60() -> Unit raise {
  complex_neg_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -(x - y) == y - x"), simple_complex_arith_tac))
}

///|
let complex_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_SUB")

///|
/// `COMPLEX_NEG_SUB`
pub fn complex_neg_sub() -> @kernel.Thm {
  complex_neg_sub_c.get()
}

///|
/// COMPLEX_ADD_SUB
fn step_61() -> Unit raise {
  complex_add_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x + y - x == y"), simple_complex_arith_tac))
}

///|
let complex_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_SUB")

///|
/// `COMPLEX_ADD_SUB`
pub fn complex_add_sub() -> @kernel.Thm {
  complex_add_sub_c.get()
}

///|
/// COMPLEX_NEG_EQ
fn step_62() -> Unit raise {
  complex_neg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (-x == y) == (x == -y)"), simple_complex_arith_tac))
}

///|
let complex_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_EQ")

///|
/// `COMPLEX_NEG_EQ`
pub fn complex_neg_eq() -> @kernel.Thm {
  complex_neg_eq_c.get()
}

///|
/// COMPLEX_NEG_MINUS1
fn step_63() -> Unit raise {
  complex_neg_minus1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], -x == complex_mul(-Cx(real_of_num(1)), x)"), simple_complex_arith_tac))
}

///|
let complex_neg_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_MINUS1")

///|
/// `COMPLEX_NEG_MINUS1`
pub fn complex_neg_minus1() -> @kernel.Thm {
  complex_neg_minus1_c.get()
}

///|
/// COMPLEX_SUB_SUB
fn step_64() -> Unit raise {
  complex_sub_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - y - x == -y"), simple_complex_arith_tac))
}

///|
let complex_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_SUB")

///|
/// `COMPLEX_SUB_SUB`
pub fn complex_sub_sub() -> @kernel.Thm {
  complex_sub_sub_c.get()
}

///|
/// COMPLEX_ADD2_SUB2
fn step_65() -> Unit raise {
  complex_add2_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], a + b - (c + d) == a - c + (b - d)"), simple_complex_arith_tac))
}

///|
let complex_add2_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD2_SUB2")

///|
/// `COMPLEX_ADD2_SUB2`
pub fn complex_add2_sub2() -> @kernel.Thm {
  complex_add2_sub2_c.get()
}

///|
/// COMPLEX_SUB_LZERO
fn step_66() -> Unit raise {
  complex_sub_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], Cx(real_of_num(0)) - x == -x"), simple_complex_arith_tac))
}

///|
let complex_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_LZERO")

///|
/// `COMPLEX_SUB_LZERO`
pub fn complex_sub_lzero() -> @kernel.Thm {
  complex_sub_lzero_c.get()
}

///|
/// COMPLEX_SUB_RZERO
fn step_67() -> Unit raise {
  complex_sub_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], x - Cx(real_of_num(0)) == x"), simple_complex_arith_tac))
}

///|
let complex_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_RZERO")

///|
/// `COMPLEX_SUB_RZERO`
pub fn complex_sub_rzero() -> @kernel.Thm {
  complex_sub_rzero_c.get()
}

///|
/// COMPLEX_SUB_LNEG
fn step_68() -> Unit raise {
  complex_sub_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -x - y == -(x + y)"), simple_complex_arith_tac))
}

///|
let complex_sub_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_LNEG")

///|
/// `COMPLEX_SUB_LNEG`
pub fn complex_sub_lneg() -> @kernel.Thm {
  complex_sub_lneg_c.get()
}

///|
/// COMPLEX_SUB_RNEG
fn step_69() -> Unit raise {
  complex_sub_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - -y == x + y"), simple_complex_arith_tac))
}

///|
let complex_sub_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_RNEG")

///|
/// `COMPLEX_SUB_RNEG`
pub fn complex_sub_rneg() -> @kernel.Thm {
  complex_sub_rneg_c.get()
}

///|
/// COMPLEX_SUB_NEG2
fn step_70() -> Unit raise {
  complex_sub_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], -x - -y == y - x"), simple_complex_arith_tac))
}

///|
let complex_sub_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_NEG2")

///|
/// `COMPLEX_SUB_NEG2`
pub fn complex_sub_neg2() -> @kernel.Thm {
  complex_sub_neg2_c.get()
}

///|
/// COMPLEX_SUB_TRIANGLE
fn step_71() -> Unit raise {
  complex_sub_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], a - b + (b - c) == a - c"), simple_complex_arith_tac))
}

///|
let complex_sub_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_TRIANGLE")

///|
/// `COMPLEX_SUB_TRIANGLE`
pub fn complex_sub_triangle() -> @kernel.Thm {
  complex_sub_triangle_c.get()
}

///|
/// COMPLEX_EQ_SUB_LADD
fn step_72() -> Unit raise {
  complex_eq_sub_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (x == y - z) == (x + z == y)"), simple_complex_arith_tac))
}

///|
let complex_eq_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_SUB_LADD")

///|
/// `COMPLEX_EQ_SUB_LADD`
pub fn complex_eq_sub_ladd() -> @kernel.Thm {
  complex_eq_sub_ladd_c.get()
}

///|
/// COMPLEX_EQ_SUB_RADD
fn step_73() -> Unit raise {
  complex_eq_sub_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (x - y == z) == (x == z + y)"), simple_complex_arith_tac))
}

///|
let complex_eq_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_SUB_RADD")

///|
/// `COMPLEX_EQ_SUB_RADD`
pub fn complex_eq_sub_radd() -> @kernel.Thm {
  complex_eq_sub_radd_c.get()
}

///|
/// COMPLEX_SUB_SUB2
fn step_74() -> Unit raise {
  complex_sub_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - (x - y) == y"), simple_complex_arith_tac))
}

///|
let complex_sub_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_SUB2")

///|
/// `COMPLEX_SUB_SUB2`
pub fn complex_sub_sub2() -> @kernel.Thm {
  complex_sub_sub2_c.get()
}

///|
/// COMPLEX_ADD_SUB2
fn step_75() -> Unit raise {
  complex_add_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - (x + y) == -y"), simple_complex_arith_tac))
}

///|
let complex_add_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_SUB2")

///|
/// `COMPLEX_ADD_SUB2`
pub fn complex_add_sub2() -> @kernel.Thm {
  complex_add_sub2_c.get()
}

///|
/// COMPLEX_DIFFSQ
fn step_76() -> Unit raise {
  complex_diffsq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(x + y, x - y) == complex_mul(x, x) - complex_mul(y, y)"), simple_complex_arith_tac))
}

///|
let complex_diffsq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFSQ")

///|
/// `COMPLEX_DIFFSQ`
pub fn complex_diffsq() -> @kernel.Thm {
  complex_diffsq_c.get()
}

///|
/// COMPLEX_EQ_NEG2
fn step_77() -> Unit raise {
  complex_eq_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (-x == -y) == (x == y)"), simple_complex_arith_tac))
}

///|
let complex_eq_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_NEG2")

///|
/// `COMPLEX_EQ_NEG2`
pub fn complex_eq_neg2() -> @kernel.Thm {
  complex_eq_neg2_c.get()
}

///|
/// COMPLEX_SUB_LDISTRIB
fn step_78() -> Unit raise {
  complex_sub_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x, y - z) == complex_mul(x, y) - complex_mul(x, z)"), simple_complex_arith_tac))
}

///|
let complex_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_LDISTRIB")

///|
/// `COMPLEX_SUB_LDISTRIB`
pub fn complex_sub_ldistrib() -> @kernel.Thm {
  complex_sub_ldistrib_c.get()
}

///|
/// COMPLEX_SUB_RDISTRIB
fn step_79() -> Unit raise {
  complex_sub_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x - y, z) == complex_mul(x, z) - complex_mul(y, z)"), simple_complex_arith_tac))
}

///|
let complex_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_RDISTRIB")

///|
/// `COMPLEX_SUB_RDISTRIB`
pub fn complex_sub_rdistrib() -> @kernel.Thm {
  complex_sub_rdistrib_c.get()
}

///|
/// COMPLEX_MUL_2
fn step_80() -> Unit raise {
  complex_mul_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(2)), x) == x + x"), simple_complex_arith_tac))
}

///|
let complex_mul_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_2")

///|
/// `COMPLEX_MUL_2`
pub fn complex_mul_2() -> @kernel.Thm {
  complex_mul_2_c.get()
}

///|
/// II_NZ
fn step_81() -> Unit raise {
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  ii_nz_c.set(@tactics.prove(@term_syntax.parse_term("!(ii == Cx(real_of_num(0)))"), t28))
}

///|
let ii_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("II_NZ")

///|
/// `II_NZ`
pub fn ii_nz() -> @kernel.Thm {
  ii_nz_c.get()
}

///|
/// COMPLEX_MUL_LINV
fn step_82() -> Unit raise {
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq_0()])), simple_complex_arith_tac)
  complex_mul_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], !(z == Cx(real_of_num(0))) → complex_mul(complex_inv(z), z) == Cx(real_of_num(1))"), t29))
}

///|
let complex_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LINV")

///|
/// `COMPLEX_MUL_LINV`
pub fn complex_mul_linv() -> @kernel.Thm {
  complex_mul_linv_c.get()
}

///|
/// COMPLEX_ENTIRE
fn step_83() -> Unit raise {
  let t30 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq_0()])), simple_complex_arith_tac)
  complex_entire_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], (complex_mul(x, y) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)) || y == Cx(real_of_num(0)))"), t30))
}

///|
let complex_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ENTIRE")

///|
/// `COMPLEX_ENTIRE`
pub fn complex_entire() -> @kernel.Thm {
  complex_entire_c.get()
}

///|
/// COMPLEX_MUL_RINV
fn step_84() -> Unit raise {
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq_0()])), simple_complex_arith_tac)
  complex_mul_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], !(z == Cx(real_of_num(0))) → complex_mul(z, complex_inv(z)) == Cx(real_of_num(1))"), t31))
}

///|
let complex_mul_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RINV")

///|
/// `COMPLEX_MUL_RINV`
pub fn complex_mul_rinv() -> @kernel.Thm {
  complex_mul_rinv_c.get()
}

///|
/// COMPLEX_DIV_REFL
fn step_85() -> Unit raise {
  let t32 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq_0()])), simple_complex_arith_tac)
  complex_div_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], !(x == Cx(real_of_num(0))) → complex_div(x, x) == Cx(real_of_num(1))"), t32))
}

///|
let complex_div_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_REFL")

///|
/// `COMPLEX_DIV_REFL`
pub fn complex_div_refl() -> @kernel.Thm {
  complex_div_refl_c.get()
}

///|
/// COMPLEX_VEC_0
fn step_86() -> Unit raise {
  let t33 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vec_component(), cx_def(), complex(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()]))
  complex_vec_0_c.set(@tactics.prove(@term_syntax.parse_term("vec(0) == Cx(real_of_num(0))"), t33))
}

///|
let complex_vec_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_VEC_0")

///|
/// `COMPLEX_VEC_0`
pub fn complex_vec_0() -> @kernel.Thm {
  complex_vec_0_c.get()
}

///|
/// COMPLEX_CMUL
fn step_87() -> Unit raise {
  let t34 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vector_mul_component(), cx_def(), complex(), complex_mul(), @cart.dimindex_2(), @vectors.forall_2(), im_def(), re_def(), @vectors.vector_2()])), @calc_rat.real_arith_tac)
  complex_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, 2], op_pct(c, x) == complex_mul(Cx(c), x)"), t34))
}

///|
let complex_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_CMUL")

///|
/// `COMPLEX_CMUL`
pub fn complex_cmul() -> @kernel.Thm {
  complex_cmul_c.get()
}

///|
/// COMPLEX_POW_ADD
fn step_88() -> Unit raise {
  let t35 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), complex_pow(), complex_mul_lid(), complex_mul_assoc()]))
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t35)
  complex_pow_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ m : Num, ∀ n : Num, complex_pow(x, m + n) == complex_mul(complex_pow(x, m), complex_pow(x, n))"), t36))
}

///|
let complex_pow_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_ADD")

///|
/// `COMPLEX_POW_ADD`
pub fn complex_pow_add() -> @kernel.Thm {
  complex_pow_add_c.get()
}

///|
/// COMPLEX_POW_POW
fn step_89() -> Unit raise {
  let t37 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @arith.mult_clauses(), complex_pow_add()]))
  let t38 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t37)
  complex_pow_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ m : Num, ∀ n : Num, complex_pow(complex_pow(x, m), n) == complex_pow(x, m * n)"), t38))
}

///|
let complex_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_POW")

///|
/// `COMPLEX_POW_POW`
pub fn complex_pow_pow() -> @kernel.Thm {
  complex_pow_pow_c.get()
}

///|
/// COMPLEX_POW_1
fn step_90() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([complex_pow(), complex_mul_rid()]))
  let t40 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))])), t39)
  complex_pow_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_pow(x, 1) == x"), t40))
}

///|
let complex_pow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_1")

///|
/// `COMPLEX_POW_1`
pub fn complex_pow_1() -> @kernel.Thm {
  complex_pow_1_c.get()
}

///|
/// COMPLEX_POW_2
fn step_91() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([complex_pow(), complex_pow_1()]))
  let t42 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2"))])), t41)
  complex_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_pow(x, 2) == complex_mul(x, x)"), t42))
}

///|
let complex_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_2")

///|
/// `COMPLEX_POW_2`
pub fn complex_pow_2() -> @kernel.Thm {
  complex_pow_2_c.get()
}

///|
/// COMPLEX_POW_NEG
fn step_92() -> Unit raise {
  let t45 = @simp.asm_rewrite_tac(@list.List([complex_mul_rneg(), complex_mul_lneg(), complex_neg_neg()]))
  let t44 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t43 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @arith.even()]))
  let t46 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t43), t44), t45)
  complex_pow_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, complex_pow(-x, n) == (if EVEN(n) { complex_pow(x, n) } else { -complex_pow(x, n) })"), t46))
}

///|
let complex_pow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_NEG")

///|
/// `COMPLEX_POW_NEG`
pub fn complex_pow_neg() -> @kernel.Thm {
  complex_pow_neg_c.get()
}

///|
/// COMPLEX_POW_ONE
fn step_93() -> Unit raise {
  let t47 = @tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_mul_lid()])))
  complex_pow_one_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, complex_pow(Cx(real_of_num(1)), n) == Cx(real_of_num(1))"), t47))
}

///|
let complex_pow_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_ONE")

///|
/// `COMPLEX_POW_ONE`
pub fn complex_pow_one() -> @kernel.Thm {
  complex_pow_one_c.get()
}

///|
/// COMPLEX_POW_MUL
fn step_94() -> Unit raise {
  let t48 = @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_mul_lid(), complex_mul_ac()]))
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t48)
  complex_pow_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ n : Num, complex_pow(complex_mul(x, y), n) == complex_mul(complex_pow(x, n), complex_pow(y, n))"), t49))
}

///|
let complex_pow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_MUL")

///|
/// `COMPLEX_POW_MUL`
pub fn complex_pow_mul() -> @kernel.Thm {
  complex_pow_mul_c.get()
}

///|
/// COMPLEX_POW_II_2
fn step_95() -> Unit raise {
  let t50 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t51 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii(), complex_pow_2(), complex_mul(), cx_def(), re(), im(), complex_neg()])), t50)
  complex_pow_ii_2_c.set(@tactics.prove(@term_syntax.parse_term("complex_pow(ii, 2) == -Cx(real_of_num(1))"), t51))
}

///|
let complex_pow_ii_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_II_2")

///|
/// `COMPLEX_POW_II_2`
pub fn complex_pow_ii_2() -> @kernel.Thm {
  complex_pow_ii_2_c.get()
}

///|
/// COMPLEX_POW_EQ_0
fn step_96() -> Unit raise {
  let t53 = @list.List([simple_complex_arith_tac, @tactics.conv_tac(@class.taut)])
  let t52 = @simp.asm_rewrite_tac(@list.List([@nums.not_suc(), complex_pow(), complex_entire()]))
  let t54 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t52), t53)
  complex_pow_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, (complex_pow(x, n) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)) && !(n == 0))"), t54))
}

///|
let complex_pow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_EQ_0")

///|
/// `COMPLEX_POW_EQ_0`
pub fn complex_pow_eq_0() -> @kernel.Thm {
  complex_pow_eq_0_c.get()
}

///|
/// COMPLEX_POW_ZERO
fn step_97() -> Unit raise {
  let t55 = @tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([complex_pow(), complex_mul_lzero(), @nums.not_suc()])))
  complex_pow_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, complex_pow(Cx(real_of_num(0)), n) == (if n == 0 { Cx(real_of_num(1)) } else { Cx(real_of_num(0)) })"), t55))
}

///|
let complex_pow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_ZERO")

///|
/// `COMPLEX_POW_ZERO`
pub fn complex_pow_zero() -> @kernel.Thm {
  complex_pow_zero_c.get()
}

///|
/// CX_INJ
fn step_98() -> Unit raise {
  let t56 = @simp.rewrite_tac(@list.List([cx_def(), complex_eq(), re(), im()]))
  cx_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (Cx(x) == Cx(y)) == (x == y)"), t56))
}

///|
let cx_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_INJ")

///|
/// `CX_INJ`
pub fn cx_inj() -> @kernel.Thm {
  cx_inj_c.get()
}

///|
/// CX_NEG
fn step_99() -> Unit raise {
  let t57 = @simp.rewrite_tac(@list.List([cx_def(), complex_neg(), re(), im(), @calc_int.real_neg_0()]))
  cx_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(-x) == -Cx(x)"), t57))
}

///|
let cx_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_NEG")

///|
/// `CX_NEG`
pub fn cx_neg() -> @kernel.Thm {
  cx_neg_c.get()
}

///|
/// CX_ADD
fn step_100() -> Unit raise {
  let t58 = @simp.rewrite_tac(@list.List([cx_def(), complex_add(), re(), im(), @realax.real_add_lid()]))
  cx_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x + y) == Cx(x) + Cx(y)"), t58))
}

///|
let cx_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_ADD")

///|
/// `CX_ADD`
pub fn cx_add() -> @kernel.Thm {
  cx_add_c.get()
}

///|
/// CX_SUB
fn step_101() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([complex_sub(), @realax.real_sub(), cx_add(), cx_neg()]))
  cx_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x - y) == Cx(x) - Cx(y)"), t59))
}

///|
let cx_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_SUB")

///|
/// `CX_SUB`
pub fn cx_sub() -> @kernel.Thm {
  cx_sub_c.get()
}

///|
/// CX_INV
fn step_102() -> Unit raise {
  let t67 = @tactics.conv_tac(@calc_rat.real_field)
  let t66 = @tactics.pop_assum(fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.mp_tac(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  })
  let t62 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t61 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([cx_def(), complex_inv(), re(), im(), complex_eq()]))), t60), t61), t62), t66), t67)
  cx_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(inv(x)) == complex_inv(Cx(x))"), t68))
}

///|
let cx_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_INV")

///|
/// `CX_INV`
pub fn cx_inv() -> @kernel.Thm {
  cx_inv_c.get()
}

///|
/// CX_MUL
fn step_103() -> Unit raise {
  let t69 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero(), @calc_int.real_add_rid()]))
  let t70 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cx_def(), complex_mul(), re(), im(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()])), t69)
  cx_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x * y) == complex_mul(Cx(x), Cx(y))"), t70))
}

///|
let cx_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_MUL")

///|
/// `CX_MUL`
pub fn cx_mul() -> @kernel.Thm {
  cx_mul_c.get()
}

///|
/// CX_POW
fn step_104() -> Unit raise {
  let t71 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @realax.real_pow(), cx_mul()]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t71)
  cx_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, Cx(pow(x, n)) == complex_pow(Cx(x), n)"), t72))
}

///|
let cx_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_POW")

///|
/// `CX_POW`
pub fn cx_pow() -> @kernel.Thm {
  cx_pow_c.get()
}

///|
/// CX_DIV
fn step_105() -> Unit raise {
  let t73 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), cx_mul(), cx_inv()]))
  cx_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x / y) == complex_div(Cx(x), Cx(y))"), t73))
}

///|
let cx_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_DIV")

///|
/// `CX_DIV`
pub fn cx_div() -> @kernel.Thm {
  cx_div_c.get()
}

///|
/// CX_ABS
fn step_106() -> Unit raise {
  let t75 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.pow_2_sqrt_abs()]))
  let t74 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t76 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cx_def(), complex_norm(), complex_eq(), re(), im()])), t74), t75)
  cx_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(abs(x)) == Cx(norm(Cx(x)))"), t76))
}

///|
let cx_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_ABS")

///|
/// `CX_ABS`
pub fn cx_abs() -> @kernel.Thm {
  cx_abs_c.get()
}

///|
/// COMPLEX_NORM_CX
fn step_107() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([@equal.gsym(cx_inj()), cx_abs()]))
  complex_norm_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, norm(Cx(x)) == abs(x)"), t77))
}

///|
let complex_norm_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_CX")

///|
/// `COMPLEX_NORM_CX`
pub fn complex_norm_cx() -> @kernel.Thm {
  complex_norm_cx_c.get()
}

///|
/// DIST_CX
fn step_108() -> Unit raise {
  let t78 = @simp.rewrite_tac(@list.List([@vectors.dist(), @equal.gsym(cx_sub()), complex_norm_cx()]))
  dist_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, distance((Cx(x), Cx(y))) == abs(x - y)"), t78))
}

///|
let dist_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_CX")

///|
/// `DIST_CX`
pub fn dist_cx() -> @kernel.Thm {
  dist_cx_c.get()
}

///|
/// RE_CX
fn step_109() -> Unit raise {
  let t79 = @simp.rewrite_tac(@list.List([re(), cx_def()]))
  re_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Re(Cx(x)) == x"), t79))
}

///|
let re_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_CX")

///|
/// `RE_CX`
pub fn re_cx() -> @kernel.Thm {
  re_cx_c.get()
}

///|
/// RE_NEG
fn step_110() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([complex_neg(), re()]))
  re_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], Re(-x) == -Re(x)"), t80))
}

///|
let re_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_NEG")

///|
/// `RE_NEG`
pub fn re_neg() -> @kernel.Thm {
  re_neg_c.get()
}

///|
/// RE_ADD
fn step_111() -> Unit raise {
  let t81 = @simp.rewrite_tac(@list.List([complex_add(), re()]))
  re_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], Re(x + y) == Re(x) + Re(y)"), t81))
}

///|
let re_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_ADD")

///|
/// `RE_ADD`
pub fn re_add() -> @kernel.Thm {
  re_add_c.get()
}

///|
/// RE_SUB
fn step_112() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([complex_sub(), @realax.real_sub(), re_add(), re_neg()]))
  re_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], Re(x - y) == Re(x) - Re(y)"), t82))
}

///|
let re_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_SUB")

///|
/// `RE_SUB`
pub fn re_sub() -> @kernel.Thm {
  re_sub_c.get()
}

///|
/// IM_CX
fn step_113() -> Unit raise {
  let t83 = @simp.rewrite_tac(@list.List([im(), cx_def()]))
  im_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Im(Cx(x)) == real_of_num(0)"), t83))
}

///|
let im_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_CX")

///|
/// `IM_CX`
pub fn im_cx() -> @kernel.Thm {
  im_cx_c.get()
}

///|
/// IM_NEG
fn step_114() -> Unit raise {
  let t84 = @simp.rewrite_tac(@list.List([complex_neg(), im()]))
  im_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], Im(-x) == -Im(x)"), t84))
}

///|
let im_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_NEG")

///|
/// `IM_NEG`
pub fn im_neg() -> @kernel.Thm {
  im_neg_c.get()
}

///|
/// IM_ADD
fn step_115() -> Unit raise {
  let t85 = @simp.rewrite_tac(@list.List([complex_add(), im()]))
  im_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], Im(x + y) == Im(x) + Im(y)"), t85))
}

///|
let im_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_ADD")

///|
/// `IM_ADD`
pub fn im_add() -> @kernel.Thm {
  im_add_c.get()
}

///|
/// IM_SUB
fn step_116() -> Unit raise {
  let t86 = @simp.rewrite_tac(@list.List([complex_sub(), @realax.real_sub(), im_add(), im_neg()]))
  im_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], Im(x - y) == Im(x) - Im(y)"), t86))
}

///|
let im_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_SUB")

///|
/// `IM_SUB`
pub fn im_sub() -> @kernel.Thm {
  im_sub_c.get()
}

///|
/// COMPLEX_EXPAND
fn step_117() -> Unit raise {
  let t87 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  complex_expand_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], z == Cx(Re(z)) + complex_mul(ii, Cx(Im(z)))"), t87))
}

///|
let complex_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EXPAND")

///|
/// `COMPLEX_EXPAND`
pub fn complex_expand() -> @kernel.Thm {
  complex_expand_c.get()
}

///|
/// COMPLEX_TRAD
fn step_118() -> Unit raise {
  let t88 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  complex_trad_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, complex((x, y)) == Cx(x) + complex_mul(ii, Cx(y))"), t88))
}

///|
let complex_trad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_TRAD")

///|
/// `COMPLEX_TRAD`
pub fn complex_trad() -> @kernel.Thm {
  complex_trad_c.get()
}

///|
/// RE_II
fn step_119() -> Unit raise {
  let t89 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  re_ii_c.set(@tactics.prove(@term_syntax.parse_term("Re(ii) == real_of_num(0)"), t89))
}

///|
let re_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_II")

///|
/// `RE_II`
pub fn re_ii() -> @kernel.Thm {
  re_ii_c.get()
}

///|
/// IM_II
fn step_120() -> Unit raise {
  let t90 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  im_ii_c.set(@tactics.prove(@term_syntax.parse_term("Im(ii) == real_of_num(1)"), t90))
}

///|
let im_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_II")

///|
/// `IM_II`
pub fn im_ii() -> @kernel.Thm {
  im_ii_c.get()
}

///|
/// RE_MUL_II
fn step_121() -> Unit raise {
  let t91 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  re_mul_ii_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Re(complex_mul(z, ii)) == -Im(z) && Re(complex_mul(ii, z)) == -Im(z)"), t91))
}

///|
let re_mul_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_MUL_II")

///|
/// `RE_MUL_II`
pub fn re_mul_ii() -> @kernel.Thm {
  re_mul_ii_c.get()
}

///|
/// IM_MUL_II
fn step_122() -> Unit raise {
  let t92 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii()])), simple_complex_arith_tac)
  im_mul_ii_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Im(complex_mul(z, ii)) == Re(z) && Im(complex_mul(ii, z)) == Re(z)"), t92))
}

///|
let im_mul_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_MUL_II")

///|
/// `IM_MUL_II`
pub fn im_mul_ii() -> @kernel.Thm {
  im_mul_ii_c.get()
}

///|
/// COMPLEX_NORM_II
fn step_123() -> Unit raise {
  let t94 = @simp.rewrite_tac(@list.List([@real.sqrt_1()]))
  let t93 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t95 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_norm(), re_ii(), im_ii()])), t93), t94)
  complex_norm_ii_c.set(@tactics.prove(@term_syntax.parse_term("norm(ii) == real_of_num(1)"), t95))
}

///|
let complex_norm_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_II")

///|
/// `COMPLEX_NORM_II`
pub fn complex_norm_ii() -> @kernel.Thm {
  complex_norm_ii_c.get()
}

///|
/// RE_CMUL
fn step_124() -> Unit raise {
  let t96 = @simp.simp_tac(@list.List([re_def(), @vectors.vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  re_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ z : Cart[Real, 2], Re(op_pct(a, z)) == a * Re(z)"), t96))
}

///|
let re_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_CMUL")

///|
/// `RE_CMUL`
pub fn re_cmul() -> @kernel.Thm {
  re_cmul_c.get()
}

///|
/// IM_CMUL
fn step_125() -> Unit raise {
  let t97 = @simp.simp_tac(@list.List([im_def(), @vectors.vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  im_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ z : Cart[Real, 2], Im(op_pct(a, z)) == a * Im(z)"), t97))
}

///|
let im_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_CMUL")

///|
/// `IM_CMUL`
pub fn im_cmul() -> @kernel.Thm {
  im_cmul_c.get()
}

///|
/// RE_MUL_CX
fn step_126() -> Unit raise {
  re_mul_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ z : Cart[Real, 2], Re(complex_mul(Cx(x), z)) == x * Re(z) && Re(complex_mul(z, Cx(x))) == Re(z) * x"), simple_complex_arith_tac))
}

///|
let re_mul_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_MUL_CX")

///|
/// `RE_MUL_CX`
pub fn re_mul_cx() -> @kernel.Thm {
  re_mul_cx_c.get()
}

///|
/// IM_MUL_CX
fn step_127() -> Unit raise {
  im_mul_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ z : Cart[Real, 2], Im(complex_mul(Cx(x), z)) == x * Im(z) && Im(complex_mul(z, Cx(x))) == Im(z) * x"), simple_complex_arith_tac))
}

///|
let im_mul_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_MUL_CX")

///|
/// `IM_MUL_CX`
pub fn im_mul_cx() -> @kernel.Thm {
  im_mul_cx_c.get()
}

///|
/// RE_DIV_CX
fn step_128() -> Unit raise {
  let t98 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), @equal.gsym(cx_inv()), re_mul_cx()]))
  re_div_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ x : Real, Re(complex_div(z, Cx(x))) == Re(z) / x"), t98))
}

///|
let re_div_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_DIV_CX")

///|
/// `RE_DIV_CX`
pub fn re_div_cx() -> @kernel.Thm {
  re_div_cx_c.get()
}

///|
/// IM_DIV_CX
fn step_129() -> Unit raise {
  let t99 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), @equal.gsym(cx_inv()), im_mul_cx()]))
  im_div_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ x : Real, Im(complex_div(z, Cx(x))) == Im(z) / x"), t99))
}

///|
let im_div_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_DIV_CX")

///|
/// `IM_DIV_CX`
pub fn im_div_cx() -> @kernel.Thm {
  im_div_cx_c.get()
}

///|
/// is_complex_const
fn step_130() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  is_complex_const_c.set(fn(x100 : @kernel.Term) -> Bool raise {
    let tm = x100
    if @kernel.is_comb(tm) {
      let (l, r) = @kernel.dest_comb(tm)
      ((l == cx_tm) && @calc_int.is_ratconst(r))
    } else {
      false
    }
  })
}

///|
let is_complex_const_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_complex_const")

///|
/// `is_complex_const`
pub fn is_complex_const(x : @kernel.Term) -> Bool raise {
  (is_complex_const_c.get())(x)
}

///|
/// dest_complex_const
fn step_131() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  dest_complex_const_c.set(fn(x101 : @kernel.Term) -> @num.Num raise {
    let tm = x101
    let (l, r) = @kernel.dest_comb(tm)
    if (l == cx_tm) {
      @calc_int.rat_of_term(r)
    } else {
      raise Failure("dest_complex_const")
    }
  })
}

///|
let dest_complex_const_c : @lib.Cell[(@kernel.Term) -> @num.Num raise] = @lib.Cell::new("dest_complex_const")

///|
/// `dest_complex_const`
pub fn dest_complex_const(x : @kernel.Term) -> @num.Num raise {
  (dest_complex_const_c.get())(x)
}

///|
/// mk_complex_const
fn step_132() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  mk_complex_const_c.set(fn(x102 : @num.Num) -> @kernel.Term raise {
    let r = x102
    @kernel.mk_comb(cx_tm, @calc_int.term_of_rat(r))
  })
}

///|
let mk_complex_const_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_complex_const")

///|
/// `mk_complex_const`
pub fn mk_complex_const(x : @num.Num) -> @kernel.Term raise {
  (mk_complex_const_c.get())(x)
}

///|
/// COMPLEX_RAT_EQ_CONV
fn step_133() -> Unit raise {
  complex_rat_eq_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x103 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x103
  }, @list.List([cx_inj()])), @calc_rat.real_rat_eq_conv))
}

///|
let complex_rat_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COMPLEX_RAT_EQ_CONV")

///|
/// `COMPLEX_RAT_EQ_CONV`
pub fn complex_rat_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_eq_conv_c.get())(x)
}

///|
/// COMPLEX_RAT_MUL_CONV
fn step_134() -> Unit raise {
  let t105 = @equal.rand_conv(@calc_rat.real_rat_mul_conv)
  complex_rat_mul_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x104
  }, @list.List([@equal.gsym(cx_mul())])), t105))
}

///|
let complex_rat_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COMPLEX_RAT_MUL_CONV")

///|
/// `COMPLEX_RAT_MUL_CONV`
pub fn complex_rat_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_mul_conv_c.get())(x)
}

///|
/// COMPLEX_RAT_ADD_CONV
fn step_135() -> Unit raise {
  let t107 = @equal.rand_conv(@calc_rat.real_rat_add_conv)
  complex_rat_add_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x106
  }, @list.List([@equal.gsym(cx_add())])), t107))
}

///|
let complex_rat_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COMPLEX_RAT_ADD_CONV")

///|
/// `COMPLEX_RAT_ADD_CONV`
pub fn complex_rat_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_add_conv_c.get())(x)
}

///|
/// COMPLEX_RAT_POW_CONV
fn step_136() -> Unit raise {
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let pth = @equal.sym(@bool.specl(@list.List([x_tm, n_tm]), cx_pow()))
  complex_rat_pow_conv_c.set(fn(x108 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x108
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, bod) = @kernel.dest_comb(lop)
    let th1 = @kernel.inst_rule(@list.List([(@kernel.rand(bod), x_tm), (r, n_tm)]), pth)
    let (tm1, tm2) = @kernel.dest_comb(@kernel.concl(th1))
    if (@kernel.rand(tm1) != tm) {
      raise Failure("COMPLEX_RAT_POW_CONV")
    } else {
      let (tm3, tm4) = @kernel.dest_comb(tm2)
      @kernel.trans(th1, @equal.ap_term(tm3, @calc_rat.real_rat_reduce_conv(tm4)))
    }
  })
}

///|
let complex_rat_pow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_RAT_POW_CONV")

///|
/// `COMPLEX_RAT_POW_CONV`
pub fn complex_rat_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_pow_conv_c.get())(x)
}

///|
/// COMPLEX_POLY_CLAUSES
fn step_137() -> Unit raise {
  let t109 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_pow()])), simple_complex_arith_tac)
  complex_poly_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], x + (y + z) == x + y + z) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x + y == y + x) && (∀ x : Cart[Real, 2], Cx(real_of_num(0)) + x == x) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x, complex_mul(y, z)) == complex_mul(complex_mul(x, y), z)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], complex_mul(x, y) == complex_mul(y, x)) && (∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(1)), x) == x) && (∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_mul(x, y + z) == complex_mul(x, y) + complex_mul(x, z)) && (∀ x : Cart[Real, 2], complex_pow(x, 0) == Cx(real_of_num(1))) && (∀ x : Cart[Real, 2], ∀ n : Num, complex_pow(x, SUC(n)) == complex_mul(x, complex_pow(x, n)))"), t109))
}

///|
let complex_poly_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLY_CLAUSES")

///|
/// `COMPLEX_POLY_CLAUSES`
pub fn complex_poly_clauses() -> @kernel.Thm {
  complex_poly_clauses_c.get()
}

///|
/// COMPLEX_POLY_NEG_CLAUSES
fn step_138() -> Unit raise {
  complex_poly_neg_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 2], -x == complex_mul(Cx(-real_of_num(1)), x)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], x - y == x + complex_mul(Cx(-real_of_num(1)), y))"), simple_complex_arith_tac))
}

///|
let complex_poly_neg_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLY_NEG_CLAUSES")

///|
/// `COMPLEX_POLY_NEG_CLAUSES`
pub fn complex_poly_neg_clauses() -> @kernel.Thm {
  complex_poly_neg_clauses_c.get()
}

///|
let complex_poly_neg_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_NEG_CONV")

///|
/// `COMPLEX_POLY_NEG_CONV`
pub fn complex_poly_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_neg_conv_c.get())(x)
}

///|
let complex_poly_add_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_ADD_CONV")

///|
/// `COMPLEX_POLY_ADD_CONV`
pub fn complex_poly_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_add_conv_c.get())(x)
}

///|
let complex_poly_sub_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_SUB_CONV")

///|
/// `COMPLEX_POLY_SUB_CONV`
pub fn complex_poly_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_sub_conv_c.get())(x)
}

///|
let complex_poly_mul_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_MUL_CONV")

///|
/// `COMPLEX_POLY_MUL_CONV`
pub fn complex_poly_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_mul_conv_c.get())(x)
}

///|
let complex_poly_pow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_POW_CONV")

///|
/// `COMPLEX_POLY_POW_CONV`
pub fn complex_poly_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_pow_conv_c.get())(x)
}

///|
let complex_poly_conv_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_CONV")

///|
/// `COMPLEX_POLY_CONV`
pub fn complex_poly_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_conv_v1_c.get())(x)
}

///|
/// COMPLEX_POLY_NEG_CONV, COMPLEX_POLY_ADD_CONV, COMPLEX_POLY_SUB_CONV, COMPLEX_POLY_MUL_CONV, COMPLEX_POLY_POW_CONV, COMPLEX_POLY_CONV
fn step_139() -> Unit raise {
  let (complex_poly_neg_conv, complex_poly_add_conv, complex_poly_sub_conv, complex_poly_mul_conv, complex_poly_pow_conv, complex_poly_conv) = @normalizer.semiring_normalizers_conv(complex_poly_clauses())(complex_poly_neg_clauses())((is_complex_const, complex_rat_add_conv, complex_rat_mul_conv, complex_rat_pow_conv))(fn(x110 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x111 : @kernel.Term) -> Bool raise {
      (@lib.compare(x110, x111) < 0)
    }
  })
  complex_poly_neg_conv_c.set(complex_poly_neg_conv)
  complex_poly_add_conv_c.set(complex_poly_add_conv)
  complex_poly_sub_conv_c.set(complex_poly_sub_conv)
  complex_poly_mul_conv_c.set(complex_poly_mul_conv)
  complex_poly_pow_conv_c.set(complex_poly_pow_conv)
  complex_poly_conv_v1_c.set(complex_poly_conv)
}

///|
/// COMPLEX_RAT_INV_CONV
fn step_140() -> Unit raise {
  let t112 = @equal.rand_conv(@calc_rat.real_rat_inv_conv)
  complex_rat_inv_conv_c.set(@equal.thenc(@simp.rewr_conv(@equal.gsym(cx_inv())), t112))
}

///|
let complex_rat_inv_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COMPLEX_RAT_INV_CONV")

///|
/// `COMPLEX_RAT_INV_CONV`
pub fn complex_rat_inv_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_inv_conv_c.get())(x)
}

///|
/// COMPLEX_POLY_CONV
fn step_141() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("(op_minus_minus : (Cart[Real, 2]) -> Cart[Real, 2])")
  let inv_tm = @term_syntax.parse_term("complex_inv")
  let add_tm = @term_syntax.parse_term("(op_plus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])")
  let sub_tm = @term_syntax.parse_term("(op_minus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let div_tm = @term_syntax.parse_term("complex_div")
  let pow_tm = @term_syntax.parse_term("complex_pow")
  let div_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(complex_div())
  fn complex_poly_conv_1(x113 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x113
    if (!@kernel.is_comb(tm) || @calc_int.is_ratconst(tm)) {
      @kernel.refl(tm)
    } else {
      let (lop, r) = @kernel.dest_comb(tm)
      if (lop == neg_tm) {
        let th1 = @equal.ap_term(lop, complex_poly_conv_1(r))
        @kernel.trans(th1, complex_poly_neg_conv(@kernel.rand(@kernel.concl(th1))))
      } else {
        if (lop == inv_tm) {
          let th1_1 = @equal.ap_term(lop, complex_poly_conv_1(r))
          let t114 = @kernel.rand(@kernel.concl(th1_1))
          @kernel.trans(th1_1, @equal.try_conv(complex_rat_inv_conv)(t114))
        } else {
          if !@kernel.is_comb(lop) {
            @kernel.refl(tm)
          } else {
            let (op, l) = @kernel.dest_comb(lop)
            if (op == pow_tm) {
              let th1_2 = @equal.ap_thm(@equal.ap_term(op, complex_poly_conv_1(l)), r)
              let t115 = @kernel.rand(@kernel.concl(th1_2))
              @kernel.trans(th1_2, @equal.try_conv(complex_poly_pow_conv)(t115))
            } else {
              if ((op == add_tm) || ((op == mul_tm) || (op == sub_tm))) {
                let t116 = complex_poly_conv_1(r)
                let th1_3 = @kernel.mk_comb_rule(@equal.ap_term(op, complex_poly_conv_1(l)), t116)
                let fn_ : (@kernel.Term) -> @kernel.Thm raise = if (op == add_tm) {
                  complex_poly_add_conv
                } else {
                  if (op == mul_tm) {
                    complex_poly_mul_conv
                  } else {
                    complex_poly_sub_conv
                  }
                }
                @kernel.trans(th1_3, fn_(@kernel.rand(@kernel.concl(th1_3))))
              } else {
                if (op == div_tm) {
                  let th1_4 = div_conv(tm)
                  @kernel.trans(th1_4, complex_poly_conv_1(@kernel.rand(@kernel.concl(th1_4))))
                } else {
                  @kernel.refl(tm)
                }
              }
            }
          }
        }
      }
    }
  }
  complex_poly_conv_c.set(complex_poly_conv_1)
}

///|
let complex_poly_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_POLY_CONV")

///|
/// `COMPLEX_POLY_CONV`
pub fn complex_poly_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_poly_conv_c.get())(x)
}

///|
let complex_ring_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_RING")

///|
/// `COMPLEX_RING`
pub fn complex_ring(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_ring_c.get())(x)
}

///|
let complex_ideal_cofactors_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise] = @lib.Cell::new("complex_ideal_cofactors")

///|
/// `complex_ideal_cofactors`
pub fn complex_ideal_cofactors(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
  (complex_ideal_cofactors_c.get())(x)
}

///|
/// COMPLEX_RING, complex_ideal_cofactors
fn step_142() -> Unit raise {
  let t117 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_entire(), simple_complex_arith(@term_syntax.parse_term("(complex_mul((w : Cart[Real, 2]), (y : Cart[Real, 2])) + complex_mul((x : Cart[Real, 2]), (z : Cart[Real, 2])) == complex_mul(w, z) + complex_mul(x, y)) == (complex_mul(w - x, y - z) == Cx(real_of_num(0)))"))])), simple_complex_arith_tac)
  let complex_integral = @tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 2], complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (x + y == x + z) == (y == z)) && (∀ w : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_mul(w, y) + complex_mul(x, z) == complex_mul(w, z) + complex_mul(x, y)) == (w == x || y == z))"), t117)
  let t126 = @meson.meson_tac(@list.List([complex_mul_rinv(), complex_mul_lzero(), simple_complex_arith(@term_syntax.parse_term("!(Cx(real_of_num(1)) == Cx(real_of_num(0)))"))]))
  let t125 = @simp.gen_rewrite_tac(fn(x124 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s119 = @equal.land_conv(x118)
      fn(x120 : @kernel.Term) -> @kernel.Thm raise {
        s119(x120)
      }
    })((fn(x121 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s122 = @equal.rand_conv(x121)
      fn(x123 : @kernel.Term) -> @kernel.Thm raise {
        s122(x123)
      }
    })(x124))
  }, @list.List([@equal.gsym(complex_sub_0())]))
  let t127 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t125), t126)
  let complex_rabinowitsch = @tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], !(x == y) == (∃ z : Cart[Real, 2], complex_mul(x - y, z) == Cx(real_of_num(1)))"), t127)
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ii(), cx_def(), complex_mul(), complex_add(), re(), im()])), @tactics.ap_term_tac), @tactics.binop_tac), @calc_rat.real_arith_tac)
  let complex_iiii = @tactics.prove(@term_syntax.parse_term("complex_mul(ii, ii) + Cx(real_of_num(1)) == Cx(real_of_num(0))"), t128)
  let t129 = @term_syntax.parse_term("complex_pow")
  let t130 = @term_syntax.parse_term("complex_div")
  let t131 = @term_syntax.parse_term("complex_mul")
  let t132 = @term_syntax.parse_term("complex_inv")
  let t133 = @term_syntax.parse_term("(op_minus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])")
  let t134 = @term_syntax.parse_term("(op_plus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])")
  let (ring, ideal) = @grobner.ring_and_ideal_conv((dest_complex_const, mk_complex_const, complex_rat_eq_conv, @term_syntax.parse_term("(op_minus_minus : (Cart[Real, 2]) -> Cart[Real, 2])"), t134, t133, t132, t131, t130, t129, complex_integral, complex_rabinowitsch, complex_poly_conv))
  let ii_tm = @term_syntax.parse_term("ii")
  let iiii_tm = @kernel.concl(complex_iiii)
  let (complex_ring, complex_ideal_cofactors) = (fn(x135 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x135
    if @basics.free_in(ii_tm, tm) {
      @bool.mp(ring(@bool.mk_imp(iiii_tm, tm)), complex_iiii)
    } else {
      ring(tm)
    }
  }, ideal)
  complex_ring_c.set(complex_ring)
  complex_ideal_cofactors_c.set(complex_ideal_cofactors)
}

///|
/// COMPLEX_INV_0
fn step_143() -> Unit raise {
  complex_inv_0_c.set(@tactics.prove(@term_syntax.parse_term("complex_inv(Cx(real_of_num(0))) == Cx(real_of_num(0))"), simple_complex_arith_tac))
}

///|
let complex_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_0")

///|
/// `COMPLEX_INV_0`
pub fn complex_inv_0() -> @kernel.Thm {
  complex_inv_0_c.get()
}

///|
/// COMPLEX_INV_1
fn step_144() -> Unit raise {
  complex_inv_1_c.set(@tactics.prove(@term_syntax.parse_term("complex_inv(Cx(real_of_num(1))) == Cx(real_of_num(1))"), simple_complex_arith_tac))
}

///|
let complex_inv_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_1")

///|
/// `COMPLEX_INV_1`
pub fn complex_inv_1() -> @kernel.Thm {
  complex_inv_1_c.get()
}

///|
/// COMPLEX_INV_MUL
fn step_145() -> Unit raise {
  let t145 = @tactics.conv_tac(@calc_rat.real_field)
  let t144 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sos_eq_0())]))
  let t143 = @simp.rewrite_tac(@list.List([complex_mul(), complex_inv(), re(), im(), complex_eq(), cx_def()]))
  let t142 = @tactics.repeat_tac(@tactics.pop_assum(fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s140 = @tactics.mp_tac(x139)
    fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s140(x141)
    }
  }))
  let t138 = @simp.asm_rewrite_tac(@list.List([complex_inv_0(), complex_mul_lzero(), complex_mul_rzero()]))
  let t136 = @term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))")
  let t137 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"), t136]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t137), t138), t142), t143), t144), t145)
  complex_inv_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_inv(complex_mul(w, z)) == complex_mul(complex_inv(w), complex_inv(z))"), t146))
}

///|
let complex_inv_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_MUL")

///|
/// `COMPLEX_INV_MUL`
pub fn complex_inv_mul() -> @kernel.Thm {
  complex_inv_mul_c.get()
}

///|
/// COMPLEX_POW_INV
fn step_146() -> Unit raise {
  let t147 = @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_inv_1(), complex_inv_mul()]))
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t147)
  complex_pow_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, complex_pow(complex_inv(x), n) == complex_inv(complex_pow(x, n))"), t148))
}

///|
let complex_pow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_INV")

///|
/// `COMPLEX_POW_INV`
pub fn complex_pow_inv() -> @kernel.Thm {
  complex_pow_inv_c.get()
}

///|
/// COMPLEX_INV_INV
fn step_147() -> Unit raise {
  let t158 = @tactics.conv_tac(complex_ring)
  let t156 = @term_syntax.parse_term("complex_inv((x : Cart[Real, 2]))")
  let t157 = @tactics.map_every(fn(x154 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x154
    @tactics.mp_tac(@bool.spec(t, complex_mul_rinv()))
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t156]))
  let t153 = @tactics.pop_assum(fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s151 = @tactics.mp_tac(x150)
    fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s151(x152)
    }
  })
  let t149 = @simp.asm_rewrite_tac(@list.List([complex_inv_0()]))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))), t149), t153), t157), t158)
  complex_inv_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_inv(complex_inv(x)) == x"), t159))
}

///|
let complex_inv_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_INV")

///|
/// `COMPLEX_INV_INV`
pub fn complex_inv_inv() -> @kernel.Thm {
  complex_inv_inv_c.get()
}

///|
/// COMPLEX_INV_DIV
fn step_148() -> Unit raise {
  let t160 = @simp.rewrite_tac(@list.List([complex_mul_ac()]))
  let t161 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_div(), complex_inv_mul(), complex_inv_inv()])), t160)
  complex_inv_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_inv(complex_div(w, z)) == complex_div(z, w)"), t161))
}

///|
let complex_inv_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_DIV")

///|
/// `COMPLEX_INV_DIV`
pub fn complex_inv_div() -> @kernel.Thm {
  complex_inv_div_c.get()
}

///|
/// COMPLEX_EQ_INV2
fn step_149() -> Unit raise {
  let t162 = @meson.meson_tac(@list.List([complex_inv_inv()]))
  complex_eq_inv2_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_inv(w) == complex_inv(z)) == (w == z)"), t162))
}

///|
let complex_eq_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_INV2")

///|
/// `COMPLEX_EQ_INV2`
pub fn complex_eq_inv2() -> @kernel.Thm {
  complex_eq_inv2_c.get()
}

///|
/// SGN_RE_COMPLEX_INV
fn step_150() -> Unit raise {
  let t169 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @vectors.norm_pos_lt(), complex_vec_0()]))
  let t168 = @simp.rewrite_tac(@list.List([@real.real_sgn_eq(), @realax.real_gt(), @equal.gsym(complex_sqnorm())]))
  let t167 = @tactics.subgoal_then(@term_syntax.parse_term("real_sgn(pow(Re((z : Cart[Real, 2])), 2) + pow(Im(z), 2)) == real_of_num(1)"), fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x165
    @simp.rewrite_tac(@list.List([@real.real_div_1(), th]))
  })
  let t164 = @simp.rewrite_tac(@list.List([re(), complex_inv(), @real.real_sgn_div()]))
  let t163 = @simp.asm_rewrite_tac(@list.List([complex_inv_0()]))
  let t170 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))), t163), t164), t167), t168), t169)
  sgn_re_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_sgn(Re(complex_inv(z))) == real_sgn(Re(z))"), t170))
}

///|
let sgn_re_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SGN_RE_COMPLEX_INV")

///|
/// `SGN_RE_COMPLEX_INV`
pub fn sgn_re_complex_inv() -> @kernel.Thm {
  sgn_re_complex_inv_c.get()
}

///|
/// RE_COMPLEX_INV_GT_0
fn step_151() -> Unit raise {
  let t171 = @equal.gsym(@real.real_sgn_eq())
  let t172 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_gt()), t171, sgn_re_complex_inv()]))
  re_complex_inv_gt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (real_of_num(0) < Re(complex_inv(z))) == (real_of_num(0) < Re(z))"), t172))
}

///|
let re_complex_inv_gt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_INV_GT_0")

///|
/// `RE_COMPLEX_INV_GT_0`
pub fn re_complex_inv_gt_0() -> @kernel.Thm {
  re_complex_inv_gt_0_c.get()
}

///|
/// RE_COMPLEX_INV_GE_0
fn step_152() -> Unit raise {
  let t173 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sgn_eq()), sgn_re_complex_inv()]))
  let t174 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), t173)
  re_complex_inv_ge_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (real_of_num(0) <= Re(complex_inv(z))) == (real_of_num(0) <= Re(z))"), t174))
}

///|
let re_complex_inv_ge_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_INV_GE_0")

///|
/// `RE_COMPLEX_INV_GE_0`
pub fn re_complex_inv_ge_0() -> @kernel.Thm {
  re_complex_inv_ge_0_c.get()
}

///|
/// COMPLEX_EQ_MUL_LCANCEL
fn step_153() -> Unit raise {
  let t175 = @tactics.conv_tac(complex_ring)
  complex_eq_mul_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_mul(x, y) == complex_mul(x, z)) == (x == Cx(real_of_num(0)) || y == z)"), t175))
}

///|
let complex_eq_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_MUL_LCANCEL")

///|
/// `COMPLEX_EQ_MUL_LCANCEL`
pub fn complex_eq_mul_lcancel() -> @kernel.Thm {
  complex_eq_mul_lcancel_c.get()
}

///|
/// COMPLEX_EQ_MUL_RCANCEL
fn step_154() -> Unit raise {
  let t176 = @tactics.conv_tac(complex_ring)
  complex_eq_mul_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_mul(x, z) == complex_mul(y, z)) == (x == y || z == Cx(real_of_num(0)))"), t176))
}

///|
let complex_eq_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_MUL_RCANCEL")

///|
/// `COMPLEX_EQ_MUL_RCANCEL`
pub fn complex_eq_mul_rcancel() -> @kernel.Thm {
  complex_eq_mul_rcancel_c.get()
}

///|
/// COMPLEX_FIELD
fn step_155() -> Unit raise {
  let t186 = @simp.rewr_conv(@equal.gsym(complex_pow_inv()))
  let norm_net = @lib.itlist(fn(x181 : @kernel.Thm, x182 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    (fn(x179 : @kernel.Thm) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x180 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        ((x177 : @kernel.Thm, x178 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) => @simp.net_of_thm(false, x177, x178))(x179, x180)
      }
    })(@bool.spec_all(x181))(x182)
  }, @list.List([@theorems.forall_simp(), @theorems.exists_simp(), complex_div(), complex_inv_inv(), complex_inv_mul(), complex_pow_add()]), @simp.net_of_conv(@term_syntax.parse_term("complex_inv(complex_pow((x : Cart[Real, 2]), (n : Num)))"), fn(x187 : @kernel.Term) -> @kernel.Thm raise {
    t186(((x185 : @kernel.Term) => @lib.check(fn(x184 : @kernel.Term) -> Bool raise {
      (fn(x183 : @kernel.Term) -> Bool raise {
        @nums.is_numeral(@kernel.rand(x183))
      })(@kernel.rand(x184))
    }, x185))(x187))
  }, @nets.empty_net()))
  let t195 = @simp.gen_rewrite_conv(fn(x192 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s193 = @equal.try_conv(x192)
    fn(x194 : @kernel.Term) -> @kernel.Thm raise {
      s193(x194)
    }
  }, @list.List([@class.taut(@term_syntax.parse_term("(true → (p : Bool)) == p"))]))
  let t191 = @equal.top_depth_conv(@equal.thenc(@simp.rewr_conv(cx_inj()), @calc_rat.real_rat_eq_conv))
  let easy_nz_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.land_conv(@equal.thenc(@simp.gen_rewrite_conv(fn(x188 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s189 = @equal.try_conv(x188)
    fn(x190 : @kernel.Term) -> @kernel.Thm raise {
      s189(x190)
    }
  }, @list.List([@meson.meson(@list.List([complex_pow_eq_0(), @realax.real_of_num_eq(), cx_inj()]), @term_syntax.parse_term("!(complex_pow((x : Cart[Real, 2]), (n : Num)) == Cx(real_of_num(0))) == (!(x == Cx(real_of_num(0))) || Cx(real_of_num(n)) == Cx(real_of_num(0)) || !(complex_pow(x, n) == Cx(real_of_num(0))))"))])), t191)), t195)
  let t197 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), @canon.conds_celim_conv)
  let t196 = @equal.top_depth_conv(@simp.rewrites_conv(norm_net))
  let prenex_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.top_depth_conv(@equal.beta_conv), @calc_num.num_reduce_conv), t196), @canon.nnfc_conv), t197), @canon.prenex_conv)
  let setup_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@canon.nnf_conv, @canon.weak_cnf_conv), @canon.conj_canon_conv)
  let inv_tm = @term_syntax.parse_term("complex_inv")
  let t198 = @term_syntax.parse_term("complex_div")
  let is_div : (@kernel.Term) -> Bool raise = fn(x200 : @kernel.Term) -> Bool raise {
    ((x199 : @kernel.Term) => @basics.is_binop(t198, x199))(x200)
  }
  let is_inv : (@kernel.Term) -> Bool raise = fn(x201 : @kernel.Term) -> Bool raise {
    let tm = x201
    ((is_div(tm) || (@kernel.is_comb(tm) && (@kernel.rator(tm) == inv_tm))) && !@calc_int.is_ratconst(@kernel.rand(tm)))
  }
  let basic_complex_field : (@kernel.Term) -> @kernel.Thm raise = fn(x202 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x202
    let is_freeinv : (@kernel.Term) -> Bool raise = fn(x203 : @kernel.Term) -> Bool raise {
      let t = x203
      (is_inv(t) && @basics.free_in(t, tm_1))
    }
    let itms = @lib.setify(@lib.map(@kernel.rand, @basics.find_terms(is_freeinv, tm_1)))
    let hyps = @lib.map(fn(x204 : @kernel.Term) -> @kernel.Thm raise {
      let t_1 = x204
      @equal.conv_rule(easy_nz_conv, @bool.spec(t_1, complex_mul_rinv()))
    }, itms)
    let tm_p = @lib.itlist(fn(x205 : @kernel.Thm, x206 : @kernel.Term) -> @kernel.Term raise {
      let th = x205
      let t_2 = x206
      @bool.mk_imp(@kernel.concl(th), t_2)
    }, hyps, tm_1)
    let th1 = setup_conv(tm_p)
    let cjs = @basics.conjuncts(@kernel.rand(@kernel.concl(th1)))
    let ths = @lib.map(complex_ring, cjs)
    let t207 = @lib.end_itlist(@bool.conj, ths)
    let th2 = @kernel.eq_mp(@equal.sym(th1), t207)
    @lib.rev_itlist(fn(x210 : @kernel.Thm, x211 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x208 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x209 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.mp(x208, x209)
        }
      })(x211)(x210)
    }, hyps, th2)
  }
  complex_field_c.set(fn(x212 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x212
    let th0 = prenex_conv(tm_2)
    let tm0 = @kernel.rand(@kernel.concl(th0))
    let (avs, bod) = @basics.strip_forall(tm0)
    let th1_1 = setup_conv(bod)
    let ths_1 = @lib.map(basic_complex_field, @basics.conjuncts(@kernel.rand(@kernel.concl(th1_1))))
    let t213 = @lib.end_itlist(@bool.conj, ths_1)
    let t214 = @bool.genl(avs, @kernel.eq_mp(@equal.sym(th1_1), t213))
    @kernel.eq_mp(@equal.sym(th0), t214)
  })
}

///|
let complex_field_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_FIELD")

///|
/// `COMPLEX_FIELD`
pub fn complex_field(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_field_c.get())(x)
}

///|
/// COMPLEX_DIV_1
fn step_156() -> Unit raise {
  let t215 = @tactics.conv_tac(complex_field)
  complex_div_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_div(z, Cx(real_of_num(1))) == z"), t215))
}

///|
let complex_div_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_1")

///|
/// `COMPLEX_DIV_1`
pub fn complex_div_1() -> @kernel.Thm {
  complex_div_1_c.get()
}

///|
/// COMPLEX_DIV_LMUL
fn step_157() -> Unit raise {
  let t216 = @tactics.conv_tac(complex_field)
  complex_div_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], !(y == Cx(real_of_num(0))) → complex_mul(y, complex_div(x, y)) == x"), t216))
}

///|
let complex_div_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_LMUL")

///|
/// `COMPLEX_DIV_LMUL`
pub fn complex_div_lmul() -> @kernel.Thm {
  complex_div_lmul_c.get()
}

///|
/// COMPLEX_DIV_RMUL
fn step_158() -> Unit raise {
  let t217 = @tactics.conv_tac(complex_field)
  complex_div_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], !(y == Cx(real_of_num(0))) → complex_mul(complex_div(x, y), y) == x"), t217))
}

///|
let complex_div_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_RMUL")

///|
/// `COMPLEX_DIV_RMUL`
pub fn complex_div_rmul() -> @kernel.Thm {
  complex_div_rmul_c.get()
}

///|
/// COMPLEX_INV_II
fn step_159() -> Unit raise {
  let t218 = @tactics.conv_tac(complex_field)
  complex_inv_ii_c.set(@tactics.prove(@term_syntax.parse_term("complex_inv(ii) == -ii"), t218))
}

///|
let complex_inv_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_II")

///|
/// `COMPLEX_INV_II`
pub fn complex_inv_ii() -> @kernel.Thm {
  complex_inv_ii_c.get()
}

///|
/// COMPLEX_INV_EQ_0
fn step_160() -> Unit raise {
  let t224 = @tactics.conv_tac(complex_field)
  let t223 = @tactics.pop_assum(fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s221 = @tactics.mp_tac(x220)
    fn(x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s221(x222)
    }
  })
  let t219 = @simp.asm_rewrite_tac(@list.List([complex_inv_0()]))
  let t225 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))), t219), t223), t224)
  complex_inv_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], (complex_inv(x) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)))"), t225))
}

///|
let complex_inv_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_EQ_0")

///|
/// `COMPLEX_INV_EQ_0`
pub fn complex_inv_eq_0() -> @kernel.Thm {
  complex_inv_eq_0_c.get()
}

///|
/// COMPLEX_INV_NEG
fn step_161() -> Unit raise {
  let t231 = @tactics.conv_tac(complex_field)
  let t230 = @tactics.pop_assum(fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s228 = @tactics.mp_tac(x227)
    fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s228(x229)
    }
  })
  let t226 = @simp.asm_rewrite_tac(@list.List([complex_inv_0(), complex_neg_0()]))
  let t232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))), t226), t230), t231)
  complex_inv_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], complex_inv(-x) == -complex_inv(x)"), t232))
}

///|
let complex_inv_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_NEG")

///|
/// `COMPLEX_INV_NEG`
pub fn complex_inv_neg() -> @kernel.Thm {
  complex_inv_neg_c.get()
}

///|
/// COMPLEX_NEG_INV
fn step_162() -> Unit raise {
  let t233 = @simp.rewrite_tac(@list.List([complex_inv_neg()]))
  complex_neg_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], -complex_inv(x) == complex_inv(-x)"), t233))
}

///|
let complex_neg_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_INV")

///|
/// `COMPLEX_NEG_INV`
pub fn complex_neg_inv() -> @kernel.Thm {
  complex_neg_inv_c.get()
}

///|
/// COMPLEX_INV_EQ_1
fn step_163() -> Unit raise {
  let t239 = @tactics.conv_tac(complex_field)
  let t238 = @tactics.pop_assum(fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  })
  let t234 = @simp.asm_rewrite_tac(@list.List([complex_inv_0()]))
  let t240 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))), t234), t238), t239)
  complex_inv_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], (complex_inv(x) == Cx(real_of_num(1))) == (x == Cx(real_of_num(1)))"), t240))
}

///|
let complex_inv_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_EQ_1")

///|
/// `COMPLEX_INV_EQ_1`
pub fn complex_inv_eq_1() -> @kernel.Thm {
  complex_inv_eq_1_c.get()
}

///|
/// COMPLEX_DIV_EQ_0
fn step_164() -> Unit raise {
  let t241 = @simp.rewrite_tac(@list.List([complex_div(), complex_inv_eq_0(), complex_entire()]))
  complex_div_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_div(w, z) == Cx(real_of_num(0))) == (w == Cx(real_of_num(0)) || z == Cx(real_of_num(0)))"), t241))
}

///|
let complex_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_EQ_0")

///|
/// `COMPLEX_DIV_EQ_0`
pub fn complex_div_eq_0() -> @kernel.Thm {
  complex_div_eq_0_c.get()
}

///|
/// COMPLEX_POW_DIV
fn step_165() -> Unit raise {
  let t242 = @simp.rewrite_tac(@list.List([complex_div(), complex_pow_mul(), complex_pow_inv()]))
  complex_pow_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ n : Num, complex_pow(complex_div(x, y), n) == complex_div(complex_pow(x, n), complex_pow(y, n))"), t242))
}

///|
let complex_pow_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_DIV")

///|
/// `COMPLEX_POW_DIV`
pub fn complex_pow_div() -> @kernel.Thm {
  complex_pow_div_c.get()
}

///|
/// COMPLEX_DIV_POW
fn step_166() -> Unit raise {
  let t250 = @simp.asm_simp_tac(@list.List([complex_div_rmul()]))
  let t248 = @term_syntax.parse_term("!(complex_pow((x : Cart[Real, 2]), (k : Num)) == Cx(real_of_num(0)))")
  let t247 = @kernel.assume_rule(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t249 = @tactics.mp_tac(@meson.meson(@list.List([complex_pow_eq_0(), @kernel.assume_rule(@term_syntax.parse_term("!((k : Num) == 0)")), t247]), t248))
  let t246 = @simp.asm_simp_tac(@list.List([@equal.gsym(complex_pow_add()), @arith.sub_add()]))
  let t245 = @tactics.subgoal_then(@term_syntax.parse_term("complex_mul(complex_pow((x : Cart[Real, 2]), (n : Num) - (k : Num)), complex_pow(x, k)) == complex_mul(complex_div(complex_pow(x, n), complex_pow(x, k)), complex_pow(x, k))"), fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x243
    @meson.asm_meson_tac(@list.List([th, complex_pow_eq_0(), complex_eq_mul_rcancel()]))
  })
  let t251 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t245), t246), t249), t250)
  complex_div_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, ∀ k : Num, !(x == Cx(real_of_num(0))) && k <= n && !(k == 0) → complex_pow(x, n - k) == complex_div(complex_pow(x, n), complex_pow(x, k))"), t251))
}

///|
let complex_div_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_POW")

///|
/// `COMPLEX_DIV_POW`
pub fn complex_div_pow() -> @kernel.Thm {
  complex_div_pow_c.get()
}

///|
/// COMPLEX_DIV_POW2
fn step_167() -> Unit raise {
  let t254 = @simp.rewrite_tac(@list.List([@equal.gsym(complex_pow_add())]))
  let t253 = @simp.asm_simp_tac(@list.List([complex_pow_eq_0(), complex_field(@term_syntax.parse_term("!((b : Cart[Real, 2]) == Cx(real_of_num(0))) → (complex_div((a : Cart[Real, 2]), b) == (c : Cart[Real, 2])) == (complex_mul(b, c) == a)"))]))
  let t252 = @simp.asm_simp_tac(@list.List([complex_pow_eq_0(), complex_field(@term_syntax.parse_term("!((b : Cart[Real, 2]) == Cx(real_of_num(0))) && !((c : Cart[Real, 2]) == Cx(real_of_num(0))) → (complex_div((a : Cart[Real, 2]), b) == complex_inv(c)) == (complex_mul(a, c) == b)"))]))
  let t255 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t252), t253), t254), @tactics.ap_term_tac), @int.asm_arith_tac)
  complex_div_pow2_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ m : Num, ∀ n : Num, !(z == Cx(real_of_num(0))) → complex_div(complex_pow(z, m), complex_pow(z, n)) == (if n <= m { complex_pow(z, m - n) } else { complex_inv(complex_pow(z, n - m)) })"), t255))
}

///|
let complex_div_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_POW2")

///|
/// `COMPLEX_DIV_POW2`
pub fn complex_div_pow2() -> @kernel.Thm {
  complex_div_pow2_c.get()
}

///|
/// COMPLEX_NORM_ZERO
fn step_168() -> Unit raise {
  let t256 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_0(), complex_vec_0()]))
  complex_norm_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (norm(z) == real_of_num(0)) == (z == Cx(real_of_num(0)))"), t256))
}

///|
let complex_norm_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_ZERO")

///|
/// `COMPLEX_NORM_ZERO`
pub fn complex_norm_zero() -> @kernel.Thm {
  complex_norm_zero_c.get()
}

///|
/// COMPLEX_NORM_NUM
fn step_169() -> Unit raise {
  let t257 = @simp.rewrite_tac(@list.List([complex_norm_cx(), @calc_int.real_abs_num()]))
  complex_norm_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, norm(Cx(real_of_num(n))) == real_of_num(n)"), t257))
}

///|
let complex_norm_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_NUM")

///|
/// `COMPLEX_NORM_NUM`
pub fn complex_norm_num() -> @kernel.Thm {
  complex_norm_num_c.get()
}

///|
/// COMPLEX_NORM_0
fn step_170() -> Unit raise {
  let t258 = @meson.meson_tac(@list.List([complex_norm_zero()]))
  complex_norm_0_c.set(@tactics.prove(@term_syntax.parse_term("norm(Cx(real_of_num(0))) == real_of_num(0)"), t258))
}

///|
let complex_norm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_0")

///|
/// `COMPLEX_NORM_0`
pub fn complex_norm_0() -> @kernel.Thm {
  complex_norm_0_c.get()
}

///|
/// COMPLEX_NORM_NZ
fn step_171() -> Unit raise {
  let t259 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_lt(), complex_vec_0()]))
  complex_norm_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (real_of_num(0) < norm(z)) == !(z == Cx(real_of_num(0)))"), t259))
}

///|
let complex_norm_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_NZ")

///|
/// `COMPLEX_NORM_NZ`
pub fn complex_norm_nz() -> @kernel.Thm {
  complex_norm_nz_c.get()
}

///|
/// COMPLEX_NORM_MUL
fn step_172() -> Unit raise {
  let t261 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @realarith.real_pow_2(), @realarith.real_le_add(), @realarith.real_le_square()]))
  let t260 = @simp.rewrite_tac(@list.List([complex_norm(), complex_mul(), re(), im()]))
  let t262 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t260), t261), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  complex_norm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(complex_mul(w, z)) == norm(w) * norm(z)"), t262))
}

///|
let complex_norm_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_MUL")

///|
/// `COMPLEX_NORM_MUL`
pub fn complex_norm_mul() -> @kernel.Thm {
  complex_norm_mul_c.get()
}

///|
/// COMPLEX_NORM_POW
fn step_173() -> Unit raise {
  let t263 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @realax.real_pow(), complex_norm_num(), complex_norm_mul()]))
  let t264 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t263)
  complex_norm_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, norm(complex_pow(z, n)) == pow(norm(z), n)"), t264))
}

///|
let complex_norm_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_POW")

///|
/// `COMPLEX_NORM_POW`
pub fn complex_norm_pow() -> @kernel.Thm {
  complex_norm_pow_c.get()
}

///|
/// COMPLEX_NORM_INV
fn step_174() -> Unit raise {
  let t274 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), @realax.real_mul_lid(), @real.sqrt_1()]))
  let t272 = @term_syntax.parse_term("(a : Real) * (a * ((b : Real) * b)) == a * b * (a * b)")
  let t273 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t272)]))
  let t271 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @realax.real_le_mul(), @real.real_le_inv_eq(), @realarith.real_le_add(), @realarith.real_le_square()]))
  let t270 = @tactics.match_mp_tac(@real.real_mul_rinv_uniq())
  let t269 = @tactics.conv_tac(@equal.sym_conv)
  let t268 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_inv_0(), @real.sqrt_0(), @calc_int.real_mul_lzero()])), @tactics.all_tac])
  let t267 = @class.asm_cases_tac(@term_syntax.parse_term("Re((z : Cart[Real, 2])) * Re(z) + Im(z) * Im(z) == real_of_num(0)"))
  let t266 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(r : Real) * (d : Real) * (r * d) + -(i : Real) * d * (-i * d) == (r * r + i * i) * (d * d)"))]))
  let t265 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_div()]))
  let t275 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_norm(), complex_inv(), re(), im()]))), t265), t266), t267), t268), t269), t270), t271), t273), t274)
  complex_norm_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(complex_inv(z)) == inv(norm(z))"), t275))
}

///|
let complex_norm_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_INV")

///|
/// `COMPLEX_NORM_INV`
pub fn complex_norm_inv() -> @kernel.Thm {
  complex_norm_inv_c.get()
}

///|
/// COMPLEX_NORM_DIV
fn step_175() -> Unit raise {
  let t276 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), complex_norm_inv(), complex_norm_mul()]))
  complex_norm_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(complex_div(w, z)) == norm(w) / norm(z)"), t276))
}

///|
let complex_norm_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_DIV")

///|
/// `COMPLEX_NORM_DIV`
pub fn complex_norm_div() -> @kernel.Thm {
  complex_norm_div_c.get()
}

///|
/// COMPLEX_NORM_TRIANGLE_SUB
fn step_176() -> Unit raise {
  let t277 = @meson.meson_tac(@list.List([@vectors.norm_triangle(), @vectors.norm_neg(), complex_add_assoc(), complex_add_rinv(), complex_add_rid()]))
  complex_norm_triangle_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(w) <= norm(w + z) + norm(z)"), t277))
}

///|
let complex_norm_triangle_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_TRIANGLE_SUB")

///|
/// `COMPLEX_NORM_TRIANGLE_SUB`
pub fn complex_norm_triangle_sub() -> @kernel.Thm {
  complex_norm_triangle_sub_c.get()
}

///|
/// COMPLEX_NORM_ABS_NORM
fn step_177() -> Unit raise {
  let t279 = @meson.meson_tac(@list.List([complex_neg_sub(), @vectors.norm_neg(), @real.real_le_sub_radd(), complex_sub(), complex_norm_triangle_sub()]))
  let t278 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) <= (x : Real) && b - a <= x → abs(a - b) <= x")))
  let t280 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t278), t279)
  complex_norm_abs_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], abs(norm(w) - norm(z)) <= norm(w - z)"), t280))
}

///|
let complex_norm_abs_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_ABS_NORM")

///|
/// `COMPLEX_NORM_ABS_NORM`
pub fn complex_norm_abs_norm() -> @kernel.Thm {
  complex_norm_abs_norm_c.get()
}

///|
/// COMPLEX_POW_EQ_1
fn step_178() -> Unit raise {
  let t290 = @tactics.conv_tac(@class.taut)
  let t289 = @simp.simp_tac(@list.List([@vectors.real_abs_norm()]))
  let t288 = @simp.simp_tac(@list.List([complex_norm_pow(), complex_norm_cx(), @real.real_pow_eq_1(), @calc_int.real_abs_num()]))
  let t284 = @term_syntax.parse_term("(norm : (Cart[Real, 2]) -> Real)")
  let t287 = @tactics.disch_then(fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s282 = @tactics.mp_tac(x281)
      fn(x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s282(x283)
      }
    })(((x285 : @kernel.Thm) => @equal.ap_term(t284, x285))(x286))
  })
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t287), t288), t289), t290)
  complex_pow_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, complex_pow(z, n) == Cx(real_of_num(1)) → norm(z) == real_of_num(1) || n == 0"), t291))
}

///|
let complex_pow_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_EQ_1")

///|
/// `COMPLEX_POW_EQ_1`
pub fn complex_pow_eq_1() -> @kernel.Thm {
  complex_pow_eq_1_c.get()
}

///|
/// cnj
fn step_179() -> Unit raise {
  cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(cnj : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == complex((Re(z), -Im(z)))")))
}

///|
let cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cnj")

///|
/// `cnj`
pub fn cnj() -> @kernel.Thm {
  cnj_c.get()
}

///|
/// CNJ_INJ
fn step_180() -> Unit raise {
  let t292 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), re(), im(), @real.real_eq_neg2()]))
  cnj_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (cnj(w) == cnj(z)) == (w == z)"), t292))
}

///|
let cnj_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_INJ")

///|
/// `CNJ_INJ`
pub fn cnj_inj() -> @kernel.Thm {
  cnj_inj_c.get()
}

///|
/// CNJ_CNJ
fn step_181() -> Unit raise {
  let t293 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), re(), im(), @calc_int.real_neg_neg()]))
  cnj_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cnj(cnj(z)) == z"), t293))
}

///|
let cnj_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_CNJ")

///|
/// `CNJ_CNJ`
pub fn cnj_cnj() -> @kernel.Thm {
  cnj_cnj_c.get()
}

///|
/// CNJ_CX
fn step_182() -> Unit raise {
  let t294 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), cx_def(), @calc_int.real_neg_0(), re(), im()]))
  cnj_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, cnj(Cx(x)) == Cx(x)"), t294))
}

///|
let cnj_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_CX")

///|
/// `CNJ_CX`
pub fn cnj_cx() -> @kernel.Thm {
  cnj_cx_c.get()
}

///|
/// COMPLEX_NORM_CNJ
fn step_183() -> Unit raise {
  let t295 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), re(), im(), @calc_int.real_neg_neg()]))
  let t296 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_norm(), cnj(), @realarith.real_pow_2()])), t295)
  complex_norm_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(cnj(z)) == norm(z)"), t296))
}

///|
let complex_norm_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_CNJ")

///|
/// `COMPLEX_NORM_CNJ`
pub fn complex_norm_cnj() -> @kernel.Thm {
  complex_norm_cnj_c.get()
}

///|
/// CNJ_NEG
fn step_184() -> Unit raise {
  let t297 = @simp.rewrite_tac(@list.List([cnj(), complex_neg(), complex_eq(), re(), im()]))
  cnj_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cnj(-z) == -cnj(z)"), t297))
}

///|
let cnj_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_NEG")

///|
/// `CNJ_NEG`
pub fn cnj_neg() -> @kernel.Thm {
  cnj_neg_c.get()
}

///|
/// CNJ_INV
fn step_185() -> Unit raise {
  let t298 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_neg_neg(), @realarith.real_pow_2(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t299 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_inv(), complex_eq(), re(), im()])), t298)
  cnj_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cnj(complex_inv(z)) == complex_inv(cnj(z))"), t299))
}

///|
let cnj_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_INV")

///|
/// `CNJ_INV`
pub fn cnj_inv() -> @kernel.Thm {
  cnj_inv_c.get()
}

///|
/// CNJ_ADD
fn step_186() -> Unit raise {
  let t300 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @calc_int.real_neg_neg()]))
  let t301 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_add(), complex_eq(), re(), im()])), t300)
  cnj_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], cnj(w + z) == cnj(w) + cnj(z)"), t301))
}

///|
let cnj_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_ADD")

///|
/// `CNJ_ADD`
pub fn cnj_add() -> @kernel.Thm {
  cnj_add_c.get()
}

///|
/// CNJ_SUB
fn step_187() -> Unit raise {
  let t302 = @simp.rewrite_tac(@list.List([complex_sub(), cnj_add(), cnj_neg()]))
  cnj_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], cnj(w - z) == cnj(w) - cnj(z)"), t302))
}

///|
let cnj_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_SUB")

///|
/// `CNJ_SUB`
pub fn cnj_sub() -> @kernel.Thm {
  cnj_sub_c.get()
}

///|
/// CNJ_MUL
fn step_188() -> Unit raise {
  let t303 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @calc_int.real_neg_neg()]))
  let t304 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_mul(), complex_eq(), re(), im()])), t303)
  cnj_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], cnj(complex_mul(w, z)) == complex_mul(cnj(w), cnj(z))"), t304))
}

///|
let cnj_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_MUL")

///|
/// `CNJ_MUL`
pub fn cnj_mul() -> @kernel.Thm {
  cnj_mul_c.get()
}

///|
/// CNJ_DIV
fn step_189() -> Unit raise {
  let t305 = @simp.rewrite_tac(@list.List([complex_div(), cnj_mul(), cnj_inv()]))
  cnj_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], cnj(complex_div(w, z)) == complex_div(cnj(w), cnj(z))"), t305))
}

///|
let cnj_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_DIV")

///|
/// `CNJ_DIV`
pub fn cnj_div() -> @kernel.Thm {
  cnj_div_c.get()
}

///|
/// CNJ_POW
fn step_190() -> Unit raise {
  let t306 = @simp.asm_rewrite_tac(@list.List([complex_pow(), cnj_mul(), cnj_cx()]))
  let t307 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t306)
  cnj_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, cnj(complex_pow(z, n)) == complex_pow(cnj(z), n)"), t307))
}

///|
let cnj_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_POW")

///|
/// `CNJ_POW`
pub fn cnj_pow() -> @kernel.Thm {
  cnj_pow_c.get()
}

///|
/// RE_CNJ
fn step_191() -> Unit raise {
  let t308 = @simp.rewrite_tac(@list.List([cnj(), re()]))
  re_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Re(cnj(z)) == Re(z)"), t308))
}

///|
let re_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_CNJ")

///|
/// `RE_CNJ`
pub fn re_cnj() -> @kernel.Thm {
  re_cnj_c.get()
}

///|
/// IM_CNJ
fn step_192() -> Unit raise {
  let t309 = @simp.rewrite_tac(@list.List([cnj(), im()]))
  im_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Im(cnj(z)) == -Im(z)"), t309))
}

///|
let im_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_CNJ")

///|
/// `IM_CNJ`
pub fn im_cnj() -> @kernel.Thm {
  im_cnj_c.get()
}

///|
/// CNJ_EQ_CX
fn step_193() -> Unit raise {
  let t310 = @tactics.conv_tac(@calc_rat.real_ring)
  let t311 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re_cnj(), im_cnj(), re_cx(), im_cx()])), t310)
  cnj_eq_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ z : Cart[Real, 2], (cnj(z) == Cx(x)) == (z == Cx(x))"), t311))
}

///|
let cnj_eq_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_EQ_CX")

///|
/// `CNJ_EQ_CX`
pub fn cnj_eq_cx() -> @kernel.Thm {
  cnj_eq_cx_c.get()
}

///|
/// CNJ_EQ_0
fn step_194() -> Unit raise {
  let t312 = @simp.rewrite_tac(@list.List([cnj_eq_cx()]))
  cnj_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (cnj(z) == Cx(real_of_num(0))) == (z == Cx(real_of_num(0)))"), t312))
}

///|
let cnj_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_EQ_0")

///|
/// `CNJ_EQ_0`
pub fn cnj_eq_0() -> @kernel.Thm {
  cnj_eq_0_c.get()
}

///|
/// COMPLEX_ADD_CNJ
fn step_195() -> Unit raise {
  let t313 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re_cx(), im_cx(), re_add(), im_add(), re_cnj(), im_cnj()])), @calc_rat.real_arith_tac)
  complex_add_cnj_c.set(@tactics.prove(@term_syntax.parse_term("(∀ z : Cart[Real, 2], z + cnj(z) == Cx(real_of_num(2) * Re(z))) && (∀ z : Cart[Real, 2], cnj(z) + z == Cx(real_of_num(2) * Re(z)))"), t313))
}

///|
let complex_add_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_CNJ")

///|
/// `COMPLEX_ADD_CNJ`
pub fn complex_add_cnj() -> @kernel.Thm {
  complex_add_cnj_c.get()
}

///|
/// CNJ_II
fn step_196() -> Unit raise {
  let t314 = @simp.rewrite_tac(@list.List([cnj(), ii(), re(), im(), complex_neg(), @calc_int.real_neg_0()]))
  cnj_ii_c.set(@tactics.prove(@term_syntax.parse_term("cnj(ii) == -ii"), t314))
}

///|
let cnj_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_II")

///|
/// `CNJ_II`
pub fn cnj_ii() -> @kernel.Thm {
  cnj_ii_c.get()
}

///|
/// CX_RE_CNJ
fn step_197() -> Unit raise {
  let t315 = @simp.rewrite_tac(@list.List([re_add(), im_add(), re_cnj(), im_cnj()]))
  let t316 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re_div_cx(), im_div_cx(), re_cx(), im_cx()])), t315), @calc_rat.real_arith_tac)
  cx_re_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Cx(Re(z)) == complex_div(z + cnj(z), Cx(real_of_num(2)))"), t316))
}

///|
let cx_re_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_RE_CNJ")

///|
/// `CX_RE_CNJ`
pub fn cx_re_cnj() -> @kernel.Thm {
  cx_re_cnj_c.get()
}

///|
/// CX_IM_CNJ
fn step_198() -> Unit raise {
  let t317 = @simp.rewrite_tac(@list.List([re_sub(), im_sub(), re_cnj(), im_cnj()]))
  let t318 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re_div_cx(), im_div_cx(), re_cx(), im_cx(), complex_mul_lneg(), re_neg(), im_neg(), re_mul_ii(), im_mul_ii()])), t317), @calc_rat.real_arith_tac)
  cx_im_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], Cx(Im(z)) == complex_mul(-ii, complex_div(z - cnj(z), Cx(real_of_num(2))))"), t318))
}

///|
let cx_im_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_IM_CNJ")

///|
/// `CX_IM_CNJ`
pub fn cx_im_cnj() -> @kernel.Thm {
  cx_im_cnj_c.get()
}

///|
/// FORALL_CNJ
fn step_199() -> Unit raise {
  let t319 = @meson.meson_tac(@list.List([cnj_cnj()]))
  forall_cnj_c.set(@tactics.prove(@term_syntax.parse_term("(∀ z : Cart[Real, 2], (P : (Cart[Real, 2]) -> Bool)(cnj(z))) == (∀ z : Cart[Real, 2], P(z))"), t319))
}

///|
let forall_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_CNJ")

///|
/// `FORALL_CNJ`
pub fn forall_cnj() -> @kernel.Thm {
  forall_cnj_c.get()
}

///|
/// EXISTS_CNJ
fn step_200() -> Unit raise {
  let t320 = @meson.meson_tac(@list.List([cnj_cnj()]))
  exists_cnj_c.set(@tactics.prove(@term_syntax.parse_term("(∃ z : Cart[Real, 2], (P : (Cart[Real, 2]) -> Bool)(cnj(z))) == (∃ z : Cart[Real, 2], P(z))"), t320))
}

///|
let exists_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_CNJ")

///|
/// `EXISTS_CNJ`
pub fn exists_cnj() -> @kernel.Thm {
  exists_cnj_c.get()
}

///|
/// COMPLEX_NORM_POW_2
fn step_201() -> Unit raise {
  let t322 = @tactics.conv_tac(@calc_rat.real_ring)
  let t321 = @simp.rewrite_tac(@list.List([cnj(), complex_mul(), cx_def(), re(), im(), complex_eq()]))
  let t323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(cx_pow()), complex_sqnorm()]))), t321), t322)
  complex_norm_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_pow(Cx(norm(z)), 2) == complex_mul(z, cnj(z))"), t323))
}

///|
let complex_norm_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_POW_2")

///|
/// `COMPLEX_NORM_POW_2`
pub fn complex_norm_pow_2() -> @kernel.Thm {
  complex_norm_pow_2_c.get()
}

///|
/// COMPLEX_MUL_CNJ
fn step_202() -> Unit raise {
  let t326 = @tactics.conv_tac(@calc_rat.real_ring)
  let t325 = @simp.rewrite_tac(@list.List([cx_def()]))
  let t324 = @simp.rewrite_tac(@list.List([cnj(), complex_mul(), re(), im(), @equal.gsym(cx_pow()), complex_sqnorm()]))
  let t327 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_mul_sym()]))), t324), t325), @tactics.ap_term_tac), @tactics.binop_tac), t326)
  complex_mul_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_mul(cnj(z), z) == complex_pow(Cx(norm(z)), 2) && complex_mul(z, cnj(z)) == complex_pow(Cx(norm(z)), 2)"), t327))
}

///|
let complex_mul_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_CNJ")

///|
/// `COMPLEX_MUL_CNJ`
pub fn complex_mul_cnj() -> @kernel.Thm {
  complex_mul_cnj_c.get()
}

///|
/// COMPLEX_INV_CNJ
fn step_203() -> Unit raise {
  let t329 = @simp.asm_rewrite_tac(@list.List([complex_norm_zero(), @calc_num.arith()]))
  let t328 = @simp.asm_rewrite_tac(@list.List([complex_mul_cnj(), @equal.gsym(cx_pow()), cx_inj(), @real.real_pow_eq_0()]))
  let t330 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(complex_field(@term_syntax.parse_term("complex_mul((x : Cart[Real, 2]), (y : Cart[Real, 2])) == (z : Cart[Real, 2]) && !(x == Cx(real_of_num(0))) && !(z == Cx(real_of_num(0))) → complex_inv(x) == complex_div(y, z)"))), t328), t329)
  let t331 = @list.List([@simp.asm_rewrite_tac(@list.List([cnj_cx(), complex_div(), complex_inv_0(), complex_mul_lzero()])), t330])
  let t332 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))), t331)
  complex_inv_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_inv(z) == complex_div(cnj(z), complex_pow(Cx(norm(z)), 2))"), t332))
}

///|
let complex_inv_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_CNJ")

///|
/// `COMPLEX_INV_CNJ`
pub fn complex_inv_cnj() -> @kernel.Thm {
  complex_inv_cnj_c.get()
}

///|
/// COMPLEX_DIV_CNJ
fn step_204() -> Unit raise {
  let t338 = @simp.rewrite_tac(@list.List([complex_div()]))
  let t337 = @simp.gen_rewrite_tac(fn(x334 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s335 = @equal.land_conv(x334)
    fn(x336 : @kernel.Term) -> @kernel.Thm raise {
      s335(x336)
    }
  }, @list.List([complex_inv_cnj()]))
  let t333 = @simp.rewrite_tac(@list.List([complex_div(), @equal.gsym(complex_mul_assoc())]))
  let t339 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t333), @tactics.ap_term_tac), t337), t338)
  complex_div_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], complex_div(a, b) == complex_div(complex_mul(a, cnj(b)), complex_pow(Cx(norm(b)), 2))"), t339))
}

///|
let complex_div_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_CNJ")

///|
/// `COMPLEX_DIV_CNJ`
pub fn complex_div_cnj() -> @kernel.Thm {
  complex_div_cnj_c.get()
}

///|
/// RE_COMPLEX_DIV_EQ_0
fn step_205() -> Unit raise {
  let t346 = @simp.rewrite_tac(@list.List([cnj_cx(), complex_mul_rzero(), re_cx()]))
  let t345 = @simp.asm_rewrite_tac(@list.List([]))
  let t344 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t343 = @simp.rewrite_tac(@list.List([re_mul_cx(), @real.real_inv_eq_0(), @real.real_pow_eq_0(), @calc_num.arith(), @realarith.real_entire(), complex_norm_zero()]))
  let t341 = @equal.gsym(cx_inv())
  let t342 = @simp.rewrite_tac(@list.List([complex_div(), @equal.gsym(cx_pow()), t341]))
  let t340 = @simp.once_rewrite_tac(@list.List([complex_div_cnj()]))
  let t347 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t340), t342), t343), t344), t345), t346)
  re_complex_div_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Re(complex_div(a, b)) == real_of_num(0)) == (Re(complex_mul(a, cnj(b))) == real_of_num(0))"), t347))
}

///|
let re_complex_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_DIV_EQ_0")

///|
/// `RE_COMPLEX_DIV_EQ_0`
pub fn re_complex_div_eq_0() -> @kernel.Thm {
  re_complex_div_eq_0_c.get()
}

///|
/// IM_COMPLEX_DIV_EQ_0
fn step_206() -> Unit raise {
  let t354 = @simp.rewrite_tac(@list.List([cnj_cx(), complex_mul_rzero(), im_cx()]))
  let t353 = @simp.asm_rewrite_tac(@list.List([]))
  let t352 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t351 = @simp.rewrite_tac(@list.List([im_mul_cx(), @real.real_inv_eq_0(), @real.real_pow_eq_0(), @calc_num.arith(), @realarith.real_entire(), complex_norm_zero()]))
  let t349 = @equal.gsym(cx_inv())
  let t350 = @simp.rewrite_tac(@list.List([complex_div(), @equal.gsym(cx_pow()), t349]))
  let t348 = @simp.once_rewrite_tac(@list.List([complex_div_cnj()]))
  let t355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t348), t350), t351), t352), t353), t354)
  im_complex_div_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Im(complex_div(a, b)) == real_of_num(0)) == (Im(complex_mul(a, cnj(b))) == real_of_num(0))"), t355))
}

///|
let im_complex_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_DIV_EQ_0")

///|
/// `IM_COMPLEX_DIV_EQ_0`
pub fn im_complex_div_eq_0() -> @kernel.Thm {
  im_complex_div_eq_0_c.get()
}

///|
/// RE_COMPLEX_DIV_GT_0
fn step_207() -> Unit raise {
  let t363 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul_eq(), @real.real_lt_inv_eq(), @real.real_pow_lt(), @calc_num.arith(), complex_norm_nz()]))
  let t362 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (a : Real) * (x : Real)) == (real_of_num(0) * x < a * x)"))]))
  let t361 = @simp.asm_rewrite_tac(@list.List([cnj_cx(), complex_mul_rzero(), re_cx(), @calc_int.real_mul_lzero()]))
  let t360 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t359 = @simp.rewrite_tac(@list.List([re_mul_cx(), @real.real_inv_eq_0(), @real.real_pow_eq_0(), @calc_num.arith(), @realarith.real_entire(), complex_norm_zero()]))
  let t357 = @equal.gsym(cx_inv())
  let t358 = @simp.rewrite_tac(@list.List([complex_div(), @equal.gsym(cx_pow()), t357]))
  let t356 = @simp.once_rewrite_tac(@list.List([complex_div_cnj()]))
  let t364 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t356), t358), t359), t360), t361), t362), t363)
  re_complex_div_gt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (real_of_num(0) < Re(complex_div(a, b))) == (real_of_num(0) < Re(complex_mul(a, cnj(b))))"), t364))
}

///|
let re_complex_div_gt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_DIV_GT_0")

///|
/// `RE_COMPLEX_DIV_GT_0`
pub fn re_complex_div_gt_0() -> @kernel.Thm {
  re_complex_div_gt_0_c.get()
}

///|
/// IM_COMPLEX_DIV_GT_0
fn step_208() -> Unit raise {
  let t372 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul_eq(), @real.real_lt_inv_eq(), @real.real_pow_lt(), @calc_num.arith(), complex_norm_nz()]))
  let t371 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (a : Real) * (x : Real)) == (real_of_num(0) * x < a * x)"))]))
  let t370 = @simp.asm_rewrite_tac(@list.List([cnj_cx(), complex_mul_rzero(), im_cx(), @calc_int.real_mul_lzero()]))
  let t369 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t368 = @simp.rewrite_tac(@list.List([im_mul_cx(), @real.real_inv_eq_0(), @real.real_pow_eq_0(), @calc_num.arith(), @realarith.real_entire(), complex_norm_zero()]))
  let t366 = @equal.gsym(cx_inv())
  let t367 = @simp.rewrite_tac(@list.List([complex_div(), @equal.gsym(cx_pow()), t366]))
  let t365 = @simp.once_rewrite_tac(@list.List([complex_div_cnj()]))
  let t373 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t365), t367), t368), t369), t370), t371), t372)
  im_complex_div_gt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (real_of_num(0) < Im(complex_div(a, b))) == (real_of_num(0) < Im(complex_mul(a, cnj(b))))"), t373))
}

///|
let im_complex_div_gt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_DIV_GT_0")

///|
/// `IM_COMPLEX_DIV_GT_0`
pub fn im_complex_div_gt_0() -> @kernel.Thm {
  im_complex_div_gt_0_c.get()
}

///|
/// RE_COMPLEX_DIV_GE_0
fn step_209() -> Unit raise {
  let t374 = @simp.rewrite_tac(@list.List([re_complex_div_gt_0(), re_complex_div_eq_0()]))
  let t375 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (real_of_num(0) < x || x == real_of_num(0))"))])), t374)
  re_complex_div_ge_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (real_of_num(0) <= Re(complex_div(a, b))) == (real_of_num(0) <= Re(complex_mul(a, cnj(b))))"), t375))
}

///|
let re_complex_div_ge_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_DIV_GE_0")

///|
/// `RE_COMPLEX_DIV_GE_0`
pub fn re_complex_div_ge_0() -> @kernel.Thm {
  re_complex_div_ge_0_c.get()
}

///|
/// IM_COMPLEX_DIV_GE_0
fn step_210() -> Unit raise {
  let t376 = @simp.rewrite_tac(@list.List([im_complex_div_gt_0(), im_complex_div_eq_0()]))
  let t377 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (real_of_num(0) < x || x == real_of_num(0))"))])), t376)
  im_complex_div_ge_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (real_of_num(0) <= Im(complex_div(a, b))) == (real_of_num(0) <= Im(complex_mul(a, cnj(b))))"), t377))
}

///|
let im_complex_div_ge_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_DIV_GE_0")

///|
/// `IM_COMPLEX_DIV_GE_0`
pub fn im_complex_div_ge_0() -> @kernel.Thm {
  im_complex_div_ge_0_c.get()
}

///|
/// RE_COMPLEX_DIV_LE_0
fn step_211() -> Unit raise {
  let t378 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt()), re_complex_div_gt_0()]))
  re_complex_div_le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Re(complex_div(a, b)) <= real_of_num(0)) == (Re(complex_mul(a, cnj(b))) <= real_of_num(0))"), t378))
}

///|
let re_complex_div_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_DIV_LE_0")

///|
/// `RE_COMPLEX_DIV_LE_0`
pub fn re_complex_div_le_0() -> @kernel.Thm {
  re_complex_div_le_0_c.get()
}

///|
/// IM_COMPLEX_DIV_LE_0
fn step_212() -> Unit raise {
  let t379 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt()), im_complex_div_gt_0()]))
  im_complex_div_le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Im(complex_div(a, b)) <= real_of_num(0)) == (Im(complex_mul(a, cnj(b))) <= real_of_num(0))"), t379))
}

///|
let im_complex_div_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_DIV_LE_0")

///|
/// `IM_COMPLEX_DIV_LE_0`
pub fn im_complex_div_le_0() -> @kernel.Thm {
  im_complex_div_le_0_c.get()
}

///|
/// RE_COMPLEX_DIV_LT_0
fn step_213() -> Unit raise {
  let t380 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_not_le()), re_complex_div_ge_0()]))
  re_complex_div_lt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Re(complex_div(a, b)) < real_of_num(0)) == (Re(complex_mul(a, cnj(b))) < real_of_num(0))"), t380))
}

///|
let re_complex_div_lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_COMPLEX_DIV_LT_0")

///|
/// `RE_COMPLEX_DIV_LT_0`
pub fn re_complex_div_lt_0() -> @kernel.Thm {
  re_complex_div_lt_0_c.get()
}

///|
/// IM_COMPLEX_DIV_LT_0
fn step_214() -> Unit raise {
  let t381 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_not_le()), im_complex_div_ge_0()]))
  im_complex_div_lt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (Im(complex_div(a, b)) < real_of_num(0)) == (Im(complex_mul(a, cnj(b))) < real_of_num(0))"), t381))
}

///|
let im_complex_div_lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_DIV_LT_0")

///|
/// `IM_COMPLEX_DIV_LT_0`
pub fn im_complex_div_lt_0() -> @kernel.Thm {
  im_complex_div_lt_0_c.get()
}

///|
/// IM_COMPLEX_INV_GE_0
fn step_215() -> Unit raise {
  let t383 = @simp.rewrite_tac(@list.List([complex_div(), complex_mul_lid(), im_cnj()]))
  let t382 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t384 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t382]), im_complex_div_ge_0()))), t383), @calc_rat.real_arith_tac)
  im_complex_inv_ge_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (real_of_num(0) <= Im(complex_inv(z))) == (Im(z) <= real_of_num(0))"), t384))
}

///|
let im_complex_inv_ge_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_INV_GE_0")

///|
/// `IM_COMPLEX_INV_GE_0`
pub fn im_complex_inv_ge_0() -> @kernel.Thm {
  im_complex_inv_ge_0_c.get()
}

///|
/// IM_COMPLEX_INV_LE_0
fn step_216() -> Unit raise {
  let t385 = @meson.meson_tac(@list.List([im_complex_inv_ge_0(), complex_inv_inv()]))
  im_complex_inv_le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (Im(complex_inv(z)) <= real_of_num(0)) == (real_of_num(0) <= Im(z))"), t385))
}

///|
let im_complex_inv_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_INV_LE_0")

///|
/// `IM_COMPLEX_INV_LE_0`
pub fn im_complex_inv_le_0() -> @kernel.Thm {
  im_complex_inv_le_0_c.get()
}

///|
/// IM_COMPLEX_INV_GT_0
fn step_217() -> Unit raise {
  let t386 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (a : Real)) == !(a <= real_of_num(0))")), im_complex_inv_le_0()])), @calc_rat.real_arith_tac)
  im_complex_inv_gt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (real_of_num(0) < Im(complex_inv(z))) == (Im(z) < real_of_num(0))"), t386))
}

///|
let im_complex_inv_gt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_INV_GT_0")

///|
/// `IM_COMPLEX_INV_GT_0`
pub fn im_complex_inv_gt_0() -> @kernel.Thm {
  im_complex_inv_gt_0_c.get()
}

///|
/// IM_COMPLEX_INV_LT_0
fn step_218() -> Unit raise {
  let t387 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) < real_of_num(0)) == !(real_of_num(0) <= a)")), im_complex_inv_ge_0()])), @calc_rat.real_arith_tac)
  im_complex_inv_lt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (Im(complex_inv(z)) < real_of_num(0)) == (real_of_num(0) < Im(z))"), t387))
}

///|
let im_complex_inv_lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_INV_LT_0")

///|
/// `IM_COMPLEX_INV_LT_0`
pub fn im_complex_inv_lt_0() -> @kernel.Thm {
  im_complex_inv_lt_0_c.get()
}

///|
/// IM_COMPLEX_INV_EQ_0
fn step_219() -> Unit raise {
  let t388 = @tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@realax.real_le_antisym()), im_complex_inv_le_0(), im_complex_inv_ge_0()])), @calc_rat.real_arith_tac)
  im_complex_inv_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (Im(complex_inv(z)) == real_of_num(0)) == (Im(z) == real_of_num(0))"), t388))
}

///|
let im_complex_inv_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_COMPLEX_INV_EQ_0")

///|
/// `IM_COMPLEX_INV_EQ_0`
pub fn im_complex_inv_eq_0() -> @kernel.Thm {
  im_complex_inv_eq_0_c.get()
}

///|
/// REAL_SGN_RE_COMPLEX_DIV
fn step_220() -> Unit raise {
  let t389 = @simp.rewrite_tac(@list.List([@real.real_sgn(), re_complex_div_gt_0(), re_complex_div_ge_0(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < real_of_num(0)) == !(real_of_num(0) <= x)"))]))
  real_sgn_re_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real_sgn(Re(complex_div(w, z))) == real_sgn(Re(complex_mul(w, cnj(z))))"), t389))
}

///|
let real_sgn_re_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_RE_COMPLEX_DIV")

///|
/// `REAL_SGN_RE_COMPLEX_DIV`
pub fn real_sgn_re_complex_div() -> @kernel.Thm {
  real_sgn_re_complex_div_c.get()
}

///|
/// REAL_SGN_IM_COMPLEX_DIV
fn step_221() -> Unit raise {
  let t390 = @simp.rewrite_tac(@list.List([@real.real_sgn(), im_complex_div_gt_0(), im_complex_div_ge_0(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < real_of_num(0)) == !(real_of_num(0) <= x)"))]))
  real_sgn_im_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real_sgn(Im(complex_div(w, z))) == real_sgn(Im(complex_mul(w, cnj(z))))"), t390))
}

///|
let real_sgn_im_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_IM_COMPLEX_DIV")

///|
/// `REAL_SGN_IM_COMPLEX_DIV`
pub fn real_sgn_im_complex_div() -> @kernel.Thm {
  real_sgn_im_complex_div_c.get()
}

///|
/// COMPLEX_NORM_GE_RE_IM
fn step_222() -> Unit raise {
  let t393 = @simp.asm_simp_tac(@list.List([@real.real_le_addr(), @real.real_le_addl(), @realarith.real_pow_2(), @realarith.real_le_square()]))
  let t392 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t391 = @simp.rewrite_tac(@list.List([complex_norm()]))
  let t394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.pow_2_sqrt_abs())]))), t391), @tactics.conj_tac), t392), t393)
  complex_norm_ge_re_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], abs(Re(z)) <= norm(z) && abs(Im(z)) <= norm(z)"), t394))
}

///|
let complex_norm_ge_re_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_GE_RE_IM")

///|
/// `COMPLEX_NORM_GE_RE_IM`
pub fn complex_norm_ge_re_im() -> @kernel.Thm {
  complex_norm_ge_re_im_c.get()
}

///|
/// COMPLEX_NORM_LE_RE_IM
fn step_223() -> Unit raise {
  let t395 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.sum_2(), re_def(), im_def()]))
  let t396 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @vectors.norm_le_l1()))), t395)
  complex_norm_le_re_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(z) <= abs(Re(z)) + abs(Im(z))"), t396))
}

///|
let complex_norm_le_re_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_LE_RE_IM")

///|
/// `COMPLEX_NORM_LE_RE_IM`
pub fn complex_norm_le_re_im() -> @kernel.Thm {
  complex_norm_le_re_im_c.get()
}

///|
/// COMPLEX_L1_LE_NORM
fn step_224() -> Unit raise {
  let t400 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.sum_2(), re_def(), im_def()]))
  let t399 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @vectors.l1_le_norm()))
  let t398 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (x / real_of_num(2) * (y : Real)) == pow(x, 2) / real_of_num(2) * y")), @real.sqrt_pow_2(), @realarith.real_pos(), @real.sqrt_pos_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t397 = @tactics.exists_tac(@term_syntax.parse_term("sqrt(real_of_num(2))"))
  let t401 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@real.real_le_lcancel_imp())), t397), t398), t399), t400), @calc_rat.real_arith_tac)
  complex_l1_le_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], sqrt(real_of_num(2)) / real_of_num(2) * (abs(Re(z)) + abs(Im(z))) <= norm(z)"), t401))
}

///|
let complex_l1_le_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_L1_LE_NORM")

///|
/// `COMPLEX_L1_LE_NORM`
pub fn complex_l1_le_norm() -> @kernel.Thm {
  complex_l1_le_norm_c.get()
}

///|
/// csqrt
fn step_225() -> Unit raise {
  csqrt_c.set(@pair.new_definition(@term_syntax.parse_term("(csqrt : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == (if Im(z) == real_of_num(0) { if real_of_num(0) <= Re(z) { complex((sqrt(Re(z)), real_of_num(0))) } else { complex((real_of_num(0), sqrt(-Re(z)))) } } else { complex((sqrt((norm(z) + Re(z)) / real_of_num(2)), Im(z) / abs(Im(z)) * sqrt((norm(z) - Re(z)) / real_of_num(2)))) })")))
}

///|
let csqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("csqrt")

///|
/// `csqrt`
pub fn csqrt() -> @kernel.Thm {
  csqrt_c.get()
}

///|
/// CSQRT
fn step_226() -> Unit raise {
  let t431 = @simp.asm_simp_tac(@list.List([@real.real_div_refl(), @real.real_abs_zero(), @realarith.real_mul_rid()]))
  let t430 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @equal.gsym(@realax.real_div())]))
  let t429 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t427 = @term_syntax.parse_term("real_of_num(2) * ((i : Real) * (a' : Real) * ((a : Real) * (h : Real))) == i * (real_of_num(2) * h * (a * a'))")
  let t428 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t427)]))
  let t426 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_inv(), @calc_int.real_abs_num()]))
  let t425 = @simp.rewrite_tac(@list.List([@real.pow_2_sqrt_abs()]))
  let t424 = @simp.rewrite_tac(@list.List([@real.real_add_sub(), @equal.gsym(@real.real_pow_mul())]))
  let t423 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_le_add(), @simp.rewrite_rule(@list.List([@equal.gsym(@realarith.real_pow_2())]))(@realarith.real_le_square())]))
  let t422 = @simp.rewrite_tac(@list.List([complex_norm(), @equal.gsym(@realarith.real_pow_2())]))
  let t421 = @simp.rewrite_tac(@list.List([@real.real_diffsq()]))
  let t419 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((a' : Real) * b) == a * a' * (b * b)")
  let t420 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t419)]))
  let t418 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t416 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t415 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t414 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t413 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(m : Real) + (r : Real) - (m - r) == r * real_of_num(2)"))]))
  let t412 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @equal.gsym(@real.real_sub_rdistrib())]))
  let t417 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_pow_div(), @real.real_pow2_abs(), @real.real_pow_eq_0(), @real.real_div_refl()])), t412), t413), t414), t415), t416), @tactics.all_tac])
  let t411 = @simp.rewrite_tac(@list.List([complex_eq(), re(), im()]))
  let t410 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @equal.gsym(@real.sqrt_mul()), @real.sqrt_pow_2()]))
  let t409 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), complex_norm_ge_re_im())), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t408 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= norm((z : Cart[Real, 2])) + Re(z) && real_of_num(0) <= norm(z) - Re(z)"), @tactics.strip_assume_tac)
  let t407 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t406 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) * s - (i : Real) * (s' : Real) * (i * s') == s * s - i * i * (s' * s') && s * (i * s') + i * s' * s == real_of_num(2) * (i * (s * s'))"))]))
  let t405 = @simp.rewrite_tac(@list.List([complex_mul(), re(), im()]))
  let t403 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) <= (x : Real)) → real_of_num(0) <= -x"))]))
  let t402 = @simp.rewrite_tac(@list.List([@real.real_neg_eq(), @equal.gsym(@realarith.real_pow_2())]))
  let t404 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([cx_def(), complex_mul(), re(), im(), @calc_int.real_mul_rzero(), @calc_int.real_mul_lzero(), @real.real_sub_lzero(), @real.real_sub_rzero(), @realax.real_add_lid(), complex_eq()]))), t402), t403), @tactics.all_tac])
  let t432 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_pow_2(), csqrt()]))), @class.cond_cases_tac), t404), t405), t406), t407), t408), t409), t410), t411), @tactics.conj_tac), t417), t418), t420), t421), t422), t423), t424), t425), t426), t428), t429), t430), t431)
  csqrt_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_pow(csqrt(z), 2) == z"), t432))
}

///|
let csqrt_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT")

///|
/// `CSQRT`
pub fn csqrt_v1() -> @kernel.Thm {
  csqrt_v1_c.get()
}

///|
/// CX_SQRT
fn step_227() -> Unit raise {
  let t433 = @simp.simp_tac(@list.List([csqrt(), im_cx(), re_cx(), complex_eq(), re(), im()]))
  cx_sqrt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → Cx(sqrt(x)) == csqrt(Cx(x))"), t433))
}

///|
let cx_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_SQRT")

///|
/// `CX_SQRT`
pub fn cx_sqrt() -> @kernel.Thm {
  cx_sqrt_c.get()
}

///|
/// CSQRT_CX
fn step_228() -> Unit raise {
  let t434 = @simp.simp_tac(@list.List([cx_sqrt()]))
  csqrt_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → csqrt(Cx(x)) == Cx(sqrt(x))"), t434))
}

///|
let csqrt_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_CX")

///|
/// `CSQRT_CX`
pub fn csqrt_cx() -> @kernel.Thm {
  csqrt_cx_c.get()
}

///|
/// CSQRT_0
fn step_229() -> Unit raise {
  let t435 = @simp.simp_tac(@list.List([csqrt_cx(), @realarith.real_pos(), @real.sqrt_0()]))
  csqrt_0_c.set(@tactics.prove(@term_syntax.parse_term("csqrt(Cx(real_of_num(0))) == Cx(real_of_num(0))"), t435))
}

///|
let csqrt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_0")

///|
/// `CSQRT_0`
pub fn csqrt_0() -> @kernel.Thm {
  csqrt_0_c.get()
}

///|
/// CSQRT_1
fn step_230() -> Unit raise {
  let t436 = @simp.simp_tac(@list.List([csqrt_cx(), @realarith.real_pos(), @real.sqrt_1()]))
  csqrt_1_c.set(@tactics.prove(@term_syntax.parse_term("csqrt(Cx(real_of_num(1))) == Cx(real_of_num(1))"), t436))
}

///|
let csqrt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_1")

///|
/// `CSQRT_1`
pub fn csqrt_1() -> @kernel.Thm {
  csqrt_1_c.get()
}

///|
/// CSQRT_PRINCIPAL
fn step_231() -> Unit raise {
  let t450 = @simp.asm_rewrite_tac(@list.List([@realarith.real_le_square(), @realarith.real_entire()]))
  let t449 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))"))]))
  let t448 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square(), @real.real_lt_addr()]))
  let t447 = @tactics.match_mp_tac(@real.sqrt_mono_lt())
  let t446 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.pow_2_sqrt_abs())]))
  let t445 = @simp.rewrite_tac(@list.List([complex_norm()]))
  let t444 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((y : Real)) < (x : Real) → real_of_num(0) < (x + y) / real_of_num(2)")))
  let t451 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.match_mp_tac(@real.sqrt_pos_lt())), t444), t445), t446), t447), t448), t449), t450)
  let t443 = @tactics.match_mp_tac(@real.sqrt_pos_le())
  let t452 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @simp.rewrite_tac(@list.List([@realax.real_ge()]))), t443), @calc_rat.asm_real_arith_tac)
  let t441 = @drule.match_mp(@real.sqrt_pos_le())
  let t453 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s439 = @tactics.mp_tac(x438)
      fn(x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s439(x440)
      }
    })(t441(x442))
  }), @calc_rat.real_arith_tac), t452, t451])
  let t437 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([re(), im()]))))
  let t454 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([csqrt()]))), t437), t453)
  csqrt_principal_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(csqrt(z)) || Re(csqrt(z)) == real_of_num(0) && real_of_num(0) <= Im(csqrt(z))"), t454))
}

///|
let csqrt_principal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_PRINCIPAL")

///|
/// `CSQRT_PRINCIPAL`
pub fn csqrt_principal() -> @kernel.Thm {
  csqrt_principal_c.get()
}

///|
/// RE_CSQRT
fn step_232() -> Unit raise {
  let t455 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t456 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(csqrt_principal()), t455), @calc_rat.real_arith_tac)
  re_csqrt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) <= Re(csqrt(z))"), t456))
}

///|
let re_csqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_CSQRT")

///|
/// `RE_CSQRT`
pub fn re_csqrt() -> @kernel.Thm {
  re_csqrt_c.get()
}

///|
/// CSQRT_UNIQUE
fn step_233() -> Unit raise {
  let t488 = @tactics.pop_assum(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s486 = @tactics.mp_tac(x485)
    fn(x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s486(x487)
    }
  })
  let t484 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("complex_pow((s : Cart[Real, 2]), 2)"), csqrt_principal()))
  let t483 = @simp.rewrite_tac(@list.List([re_neg(), im_neg(), complex_eq(), re_cx(), im_cx()]))
  let t479 = @term_syntax.parse_term("Im")
  let t482 = @tactics.first_x_assum(fn(x481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x476 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s477 = @tactics.mp_tac(x476)
      fn(x478 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s477(x478)
      }
    })(((x480 : @kernel.Thm) => @equal.ap_term(t479, x480))(x481))
  })
  let t472 = @term_syntax.parse_term("Re")
  let t475 = @tactics.first_assum(fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s470 = @tactics.mp_tac(x469)
      fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s470(x471)
      }
    })(((x473 : @kernel.Thm) => @equal.ap_term(t472, x473))(x474))
  })
  let t468 = @simp.asm_rewrite_tac(@list.List([complex_ring(@term_syntax.parse_term("(-(z : Cart[Real, 2]) == z) == (z == Cx(real_of_num(0)))"))]))
  let t467 = @simp.simp_tac(@list.List([complex_ring(@term_syntax.parse_term("(complex_pow((a : Cart[Real, 2]), 2) == complex_pow((b : Cart[Real, 2]), 2)) == (a == b || a == -b)"))]))
  let t466 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("complex_pow((s : Cart[Real, 2]), 2)"), csqrt_v1()))
  let t465 = @tactics.first_x_assum(fn(x464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s462 = @tactics.subst_all_tac(x461)
      fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s462(x463)
      }
    })(@equal.sym(x464))
  })
  let t460 = @tactics.disch_then(@tactics.conjuncts_then(fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s458 = @tactics.assume_tac(x457)
    fn(x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s458(x459)
    }
  }))
  let t489 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t460), t465), t466), t467), @tactics.strip_tac), t468), t475), t482), t483), t484), t488), @calc_rat.real_arith_tac)
  csqrt_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_pow(s, 2) == z && (real_of_num(0) < Re(s) || Re(s) == real_of_num(0) && real_of_num(0) <= Im(s)) → csqrt(z) == s"), t489))
}

///|
let csqrt_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_UNIQUE")

///|
/// `CSQRT_UNIQUE`
pub fn csqrt_unique() -> @kernel.Thm {
  csqrt_unique_c.get()
}

///|
/// POW_2_CSQRT
fn step_234() -> Unit raise {
  let t490 = @meson.meson_tac(@list.List([csqrt_unique()]))
  pow_2_csqrt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) || Re(z) == real_of_num(0) && real_of_num(0) <= Im(z) → csqrt(complex_pow(z, 2)) == z"), t490))
}

///|
let pow_2_csqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POW_2_CSQRT")

///|
/// `POW_2_CSQRT`
pub fn pow_2_csqrt() -> @kernel.Thm {
  pow_2_csqrt_c.get()
}

///|
/// CSQRT_EQ_0
fn step_235() -> Unit raise {
  let t491 = @tactics.conv_tac(complex_ring)
  let t492 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), csqrt_v1()))), t491)
  csqrt_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (csqrt(z) == Cx(real_of_num(0))) == (z == Cx(real_of_num(0)))"), t492))
}

///|
let csqrt_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_EQ_0")

///|
/// `CSQRT_EQ_0`
pub fn csqrt_eq_0() -> @kernel.Thm {
  csqrt_eq_0_c.get()
}

///|
/// DOT_COMPLEX_MUL_CNJ
fn step_236() -> Unit raise {
  let t493 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), re_def(), im_def()]))
  let t494 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_mul(), re(), im()])), t493), @calc_rat.real_arith_tac)
  dot_complex_mul_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], dot(w, z) == Re(complex_mul(w, cnj(z)))"), t494))
}

///|
let dot_complex_mul_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_COMPLEX_MUL_CNJ")

///|
/// `DOT_COMPLEX_MUL_CNJ`
pub fn dot_complex_mul_cnj() -> @kernel.Thm {
  dot_complex_mul_cnj_c.get()
}

///|
/// DOT_CNJ
fn step_237() -> Unit raise {
  let t496 = @simp.rewrite_tac(@list.List([cnj(), re(), im()]))
  let t495 = @equal.gsym(im_def())
  let t497 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dot_2(), @equal.gsym(re_def()), t495])), t496), @calc_rat.real_arith_tac)
  dot_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], dot(cnj(w), cnj(z)) == dot(w, z)"), t497))
}

///|
let dot_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_CNJ")

///|
/// `DOT_CNJ`
pub fn dot_cnj() -> @kernel.Thm {
  dot_cnj_c.get()
}

///|
/// LINEAR_COMPLEX_MUL
fn step_238() -> Unit raise {
  let t498 = @tactics.conv_tac(complex_ring)
  let t499 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), complex_cmul()])), t498)
  linear_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], linear((x : Cart[Real, 2]) => complex_mul(c, x))"), t499))
}

///|
let linear_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_COMPLEX_MUL")

///|
/// `LINEAR_COMPLEX_MUL`
pub fn linear_complex_mul() -> @kernel.Thm {
  linear_complex_mul_c.get()
}

///|
/// BILINEAR_COMPLEX_MUL
fn step_239() -> Unit raise {
  let t500 = @tactics.conv_tac(complex_ring)
  let t501 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.bilinear(), @vectors.linear(), complex_cmul()])), t500)
  bilinear_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("bilinear(complex_mul)"), t501))
}

///|
let bilinear_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_COMPLEX_MUL")

///|
/// `BILINEAR_COMPLEX_MUL`
pub fn bilinear_complex_mul() -> @kernel.Thm {
  bilinear_complex_mul_c.get()
}

///|
/// LINEAR_CNJ
fn step_240() -> Unit raise {
  let t502 = @simp.rewrite_tac(@list.List([@vectors.linear(), complex_cmul(), cnj_add(), cnj_mul(), cnj_cx()]))
  linear_cnj_c.set(@tactics.prove(@term_syntax.parse_term("linear(cnj)"), t502))
}

///|
let linear_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_CNJ")

///|
/// `LINEAR_CNJ`
pub fn linear_cnj() -> @kernel.Thm {
  linear_cnj_c.get()
}

///|
/// ORTHOGONAL_TRANSFORMATION_CNJ
fn step_241() -> Unit raise {
  let t503 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation(), linear_cnj(), dot_cnj()]))
  orthogonal_transformation_cnj_c.set(@tactics.prove(@term_syntax.parse_term("orthogonal_transformation(cnj)"), t503))
}

///|
let orthogonal_transformation_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_TRANSFORMATION_CNJ")

///|
/// `ORTHOGONAL_TRANSFORMATION_CNJ`
pub fn orthogonal_transformation_cnj() -> @kernel.Thm {
  orthogonal_transformation_cnj_c.get()
}

///|
/// LINEAR_COMPLEX_LMUL
fn step_242() -> Unit raise {
  let t505 = @tactics.conv_tac(complex_ring)
  let t504 = @tactics.repeat_tac(@tactics.strip_tac)
  let t506 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.linear(), complex_cmul()])), t504), t505)
  linear_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], linear(f) → linear((x : Cart[Real, N]) => complex_mul(c, f(x)))"), t506))
}

///|
let linear_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_COMPLEX_LMUL")

///|
/// `LINEAR_COMPLEX_LMUL`
pub fn linear_complex_lmul() -> @kernel.Thm {
  linear_complex_lmul_c.get()
}

///|
/// LINEAR_COMPLEX_RMUL
fn step_243() -> Unit raise {
  let t507 = @simp.rewrite_tac(@list.List([linear_complex_lmul()]))
  let t508 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([complex_mul_sym()])), t507)
  linear_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], linear(f) → linear((x : Cart[Real, N]) => complex_mul(f(x), c))"), t508))
}

///|
let linear_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_COMPLEX_RMUL")

///|
/// `LINEAR_COMPLEX_RMUL`
pub fn linear_complex_rmul() -> @kernel.Thm {
  linear_complex_rmul_c.get()
}

///|
/// COMPLEX_CAUCHY_SCHWARZ_EQ
fn step_244() -> Unit raise {
  let t510 = @simp.rewrite_tac(@list.List([ii(), complex_mul(), re(), im()]))
  let t509 = @equal.gsym(im_def())
  let t511 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_2(), @equal.gsym(re_def()), t509])), t510), @calc_rat.real_arith_tac)
  complex_cauchy_schwarz_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], pow(dot(w, z), 2) + pow(dot(complex_mul(ii, w), z), 2) == pow(norm(w), 2) * pow(norm(z), 2)"), t511))
}

///|
let complex_cauchy_schwarz_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_CAUCHY_SCHWARZ_EQ")

///|
/// `COMPLEX_CAUCHY_SCHWARZ_EQ`
pub fn complex_cauchy_schwarz_eq() -> @kernel.Thm {
  complex_cauchy_schwarz_eq_c.get()
}

///|
/// COMPLEX_BASIS
fn step_245() -> Unit raise {
  let t514 = @simp.rewrite_tac(@list.List([ii()]))
  let t512 = @equal.gsym(im_def())
  let t513 = @simp.rewrite_tac(@list.List([@equal.gsym(re_def()), t512, re_cx(), im_cx()]))
  let t515 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()])), t513), t514), simple_complex_arith_tac)
  complex_basis_c.set(@tactics.prove(@term_syntax.parse_term("basis(1) == Cx(real_of_num(1)) && basis(2) == ii"), t515))
}

///|
let complex_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_BASIS")

///|
/// `COMPLEX_BASIS`
pub fn complex_basis() -> @kernel.Thm {
  complex_basis_c.get()
}

///|
/// COMPLEX_LINEAR
fn step_246() -> Unit raise {
  let t526 = @equal.gsym(im_def())
  let t527 = @simp.rewrite_tac(@list.List([@equal.gsym(re_def()), t526, im(), re(), complex_mul()]))
  let t525 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @vectors.matrix_vector_mul(), @cart.dimindex_2(), @vectors.sum_2(), @calc_num.arith(), @vectors.forall_2(), @class.fun_eq_thm(), @cart.lambda_beta()]))
  let t524 = @tactics.first_assum(fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x519
    @simp.gen_rewrite_tac(fn(x521 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s522 = @equal.land_conv(x521)
      fn(x523 : @kernel.Term) -> @kernel.Thm raise {
        s522(x523)
      }
    }, @list.List([@drule.match_mp(@vectors.matrix_vector_mul_v1())(th)]))
  })
  let t528 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("complex((op_dollar(op_dollar(matrix((f : (Cart[Real, 2]) -> Cart[Real, 2])), 1), 1), op_dollar(op_dollar(matrix(f), 2), 1)))"))), t524), t525), t527), @calc_rat.real_arith_tac)
  let t517 = @equal.gsym(im_def())
  let t518 = @simp.rewrite_tac(@list.List([complex_basis(), @equal.gsym(re_def()), t517, ii()]))
  let t516 = @simp.simp_tac(@list.List([@vectors.matrix(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t529 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([linear_complex_mul()]))), t516), t518), simple_complex_arith_tac), t528])
  let t530 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t529)
  complex_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (∃ c : Cart[Real, 2], f == ((z : Cart[Real, 2]) => complex_mul(c, z))) == (linear(f) && op_dollar(op_dollar(matrix(f), 1), 1) == op_dollar(op_dollar(matrix(f), 2), 2) && op_dollar(op_dollar(matrix(f), 1), 2) == -op_dollar(op_dollar(matrix(f), 2), 1))"), t530))
}

///|
let complex_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_LINEAR")

///|
/// `COMPLEX_LINEAR`
pub fn complex_linear() -> @kernel.Thm {
  complex_linear_c.get()
}

///|
/// COMPLEX_LINEAR_ALT
fn step_247() -> Unit raise {
  let t553 = @equal.gsym(im_def())
  let t554 = @simp.rewrite_tac(@list.List([@equal.gsym(re_def()), t553, cx_def(), re(), im(), re_ii(), im_ii()]))
  let t552 = @simp.simp_tac(@list.List([@vectors.matrix_vector_mul_component(), @cart.dimindex_2(), @calc_num.arith(), @vectors.dot_2()]))
  let t551 = @simp.rewrite_tac(@list.List([@vectors.matrix_vector_mul_component(), im_def(), re_def()]))
  let t549 = @equal.gsym(im_def())
  let t550 = @simp.rewrite_tac(@list.List([@equal.gsym(re_def()), t549, re_mul_ii(), im_mul_ii()]))
  let t548 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @cart.dimindex_2()]))
  let t547 = @tactics.first_assum(fn(x538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x538
    @simp.gen_rewrite_tac(fn(x546 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x540 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s541 = @equal.land_conv(x540)
        fn(x542 : @kernel.Term) -> @kernel.Thm raise {
          s541(x542)
        }
      })((fn(x543 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s544 = @equal.once_depth_conv(x543)
        fn(x545 : @kernel.Term) -> @kernel.Thm raise {
          s544(x545)
        }
      })(x546))
    }, @list.List([@drule.match_mp(@vectors.matrix_vector_mul_v1())(th)]))
  })
  let t537 = @tactics.first_assum(fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s534 = @tactics.mp_tac(x533)
      fn(x535 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s534(x535)
      }
    })(@equal.sym(x536))
  })
  let t532 = @list.List([simple_complex_arith_tac, @simp.asm_rewrite_tac(@list.List([complex_linear()]))])
  let t531 = @simp.asm_rewrite_tac(@list.List([linear_complex_mul()]))
  let t555 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), @tactics.strip_tac), t531), t532), t537), t547), t548), t550), t551), t552), t554), @calc_rat.real_arith_tac)
  complex_linear_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (∃ c : Cart[Real, 2], f == ((z : Cart[Real, 2]) => complex_mul(c, z))) == (linear(f) && f(ii) == complex_mul(ii, f(Cx(real_of_num(1)))))"), t555))
}

///|
let complex_linear_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_LINEAR_ALT")

///|
/// `COMPLEX_LINEAR_ALT`
pub fn complex_linear_alt() -> @kernel.Thm {
  complex_linear_alt_c.get()
}

///|
/// ORTHOGONAL_TRANSFORMATION_COMPLEX_MUL
fn step_248() -> Unit raise {
  let t567 = @simp.rewrite_tac(@list.List([complex_norm_cx()]))
  let t563 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t566 = @tactics.disch_then(fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x560 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s561 = @tactics.mp_tac(x560)
      fn(x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s561(x562)
      }
    })(((x564 : @kernel.Thm) => @bool.spec(t563, x564))(x565))
  })
  let t559 = @simp.asm_rewrite_tac(@list.List([]))
  let t558 = @class.asm_cases_tac(@term_syntax.parse_term("norm((c : Cart[Real, 2])) == real_of_num(1)"))
  let t557 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((c : Real) * (v : Real) == v) == (c == real_of_num(1) || v == real_of_num(0))"))]))
  let t556 = @simp.rewrite_tac(@list.List([complex_norm_mul()]))
  let t568 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation_v1(), linear_complex_mul()])), @tactics.gen_tac), t556), t557), t558), t559), t566), t567), @calc_rat.real_arith_tac)
  orthogonal_transformation_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], orthogonal_transformation((z : Cart[Real, 2]) => complex_mul(c, z)) == (norm(c) == real_of_num(1))"), t568))
}

///|
let orthogonal_transformation_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_TRANSFORMATION_COMPLEX_MUL")

///|
/// `ORTHOGONAL_TRANSFORMATION_COMPLEX_MUL`
pub fn orthogonal_transformation_complex_mul() -> @kernel.Thm {
  orthogonal_transformation_complex_mul_c.get()
}

///|
/// COMPLEX_ORTHOGONAL_ROTATION
fn step_249() -> Unit raise {
  let t592 = @simp.rewrite_tac(@list.List([complex_norm_cx()]))
  let t588 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t591 = @tactics.disch_then(fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s586 = @tactics.mp_tac(x585)
      fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s586(x587)
      }
    })(((x589 : @kernel.Thm) => @bool.spec(t588, x589))(x590))
  })
  let t584 = @simp.asm_rewrite_tac(@list.List([]))
  let t583 = @class.asm_cases_tac(@term_syntax.parse_term("norm((c : Cart[Real, 2])) == real_of_num(1)"))
  let t582 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((c : Real) * (v : Real) == v) == (c == real_of_num(1) || v == real_of_num(0))"))]))
  let t581 = @simp.asm_rewrite_tac(@list.List([complex_norm_mul()]))
  let t580 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => complex_mul((c : Cart[Real, 2]), z))"))
  let t579 = @simp.rewrite_tac(@list.List([]))
  let t578 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))
  let t577 = @simp.gen_rewrite_tac(fn(x576 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x576
  }, @list.List([@class.fun_eq_thm()]))
  let t593 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()])), @tactics.ap_term_tac), t577), t578), t579), t580), t581), t582), t583), t584), t591), t592), @calc_rat.real_arith_tac)
  let t575 = @tactics.conv_tac(@calc_rat.real_ring)
  let t574 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_matrix_2(), @determinants.det_2()]))
  let t573 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t572 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation_matrix()]))
  let t571 = @simp.rewrite_tac(@list.List([@equal.gsym(@determinants.orthogonal_transformation_v1())]))
  let t570 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == ((q && p) && r)"))]))
  let t594 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_linear()])), t570), t571), t572), t573), @tactics.ap_term_tac), t574), t575), t593])
  let t569 = @term_syntax.parse_term("(∀ z : Cart[Real, 2], norm((f : (Cart[Real, 2]) -> Cart[Real, 2])(z)) == norm(z)) && (∃ c : Cart[Real, 2], f == ((z : Cart[Real, 2]) => complex_mul(c, z)))")
  let t595 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.trans_tac(@theorems.eq_trans())(t569)), @tactics.conj_tac), t594)
  complex_orthogonal_rotation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (orthogonal_transformation(f) && det(matrix(f)) == real_of_num(1)) == (∃ c : Cart[Real, 2], norm(c) == real_of_num(1) && f == ((z : Cart[Real, 2]) => complex_mul(c, z)))"), t595))
}

///|
let complex_orthogonal_rotation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ORTHOGONAL_ROTATION")

///|
/// `COMPLEX_ORTHOGONAL_ROTATION`
pub fn complex_orthogonal_rotation() -> @kernel.Thm {
  complex_orthogonal_rotation_c.get()
}

///|
/// COMPLEX_ORTHOGONAL_ROTOINVERSION
fn step_250() -> Unit raise {
  let t618 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t616 = @equal.gsym(re_def())
  let t617 = @simp.rewrite_tac(@list.List([@equal.gsym(im_def()), t616, im(), re(), cx_def(), ii(), complex_neg()]))
  let t615 = @simp.rewrite_tac(@list.List([complex_basis(), cnj_ii(), cnj_cx()]))
  let t614 = @simp.simp_tac(@list.List([@determinants.det_2(), @vectors.matrix_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t613 = @simp.asm_simp_tac(@list.List([@determinants.orthogonal_transformation_compose(), @vectors.matrix_compose(), @determinants.det_mul(), orthogonal_transformation_cnj(), @determinants.orthogonal_transformation_linear()]))
  let t609 = @tactics.repeat_tac(@tactics.strip_tac)
  let t607 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t608 = @tactics.spec_tac(@term_syntax.parse_term("o((f : (Cart[Real, 2]) -> Cart[Real, 2]), cnj)"), t607)
  let t610 = @tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s605 = @tactics.mp_tac(x604)
    fn(x606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s605(x606)
    }
  }), t608), t609)
  let t611 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), cnj_cnj()])), t610])
  let t612 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2]) == o(o(f, cnj), cnj)"), fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s602 = @tactics.subst1_tac(x601)
    fn(x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s602(x603)
    }
  }), t611)])
  let t599 = @simp.rewrite_tac(@list.List([@equal.gsym(complex_orthogonal_rotation())]))
  let t598 = @meson.meson_tac(@list.List([cnj_cnj(), cnj_mul()]))
  let t600 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), t598), t599])
  let t619 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("∀ c : Cart[Real, 2], ((f : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => complex_mul(c, cnj(z)))) == (o(f, cnj) == ((z : Cart[Real, 2]) => complex_mul(c, z)))"), fn(x596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x596
    @simp.rewrite_tac(@list.List([th]))
  })), t600), @tactics.eq_tac), @tactics.disch_tac), t612), t613), t614), t615), t617), t618)
  complex_orthogonal_rotoinversion_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (orthogonal_transformation(f) && det(matrix(f)) == -real_of_num(1)) == (∃ c : Cart[Real, 2], norm(c) == real_of_num(1) && f == ((z : Cart[Real, 2]) => complex_mul(c, cnj(z))))"), t619))
}

///|
let complex_orthogonal_rotoinversion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ORTHOGONAL_ROTOINVERSION")

///|
/// `COMPLEX_ORTHOGONAL_ROTOINVERSION`
pub fn complex_orthogonal_rotoinversion() -> @kernel.Thm {
  complex_orthogonal_rotoinversion_c.get()
}

///|
/// COMPLEX_ORTHOGONAL_TRANSFORMATION
fn step_251() -> Unit raise {
  let t622 = @meson.meson_tac(@list.List([@determinants.det_orthogonal_matrix(), @determinants.orthogonal_transformation_matrix()]))
  let t620 = @equal.gsym(complex_orthogonal_rotoinversion())
  let t621 = @simp.rewrite_tac(@list.List([@equal.gsym(complex_orthogonal_rotation()), t620]))
  let t623 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.left_or_distrib(), @theorems.exists_or_thm()]))), t621), t622)
  complex_orthogonal_transformation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], orthogonal_transformation(f) == (∃ c : Cart[Real, 2], norm(c) == real_of_num(1) && (f == ((z : Cart[Real, 2]) => complex_mul(c, z)) || f == ((z : Cart[Real, 2]) => complex_mul(c, cnj(z)))))"), t623))
}

///|
let complex_orthogonal_transformation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ORTHOGONAL_TRANSFORMATION")

///|
/// `COMPLEX_ORTHOGONAL_TRANSFORMATION`
pub fn complex_orthogonal_transformation() -> @kernel.Thm {
  complex_orthogonal_transformation_c.get()
}

///|
/// RE_VSUM
fn step_252() -> Unit raise {
  let t624 = @simp.simp_tac(@list.List([re_def(), @vectors.vsum_component(), @cart.dimindex_2(), @calc_num.arith()]))
  re_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → Re(vsum(s, f)) == sum(s, (x : _) => Re(f(x)))"), t624))
}

///|
let re_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_VSUM")

///|
/// `RE_VSUM`
pub fn re_vsum() -> @kernel.Thm {
  re_vsum_c.get()
}

///|
/// IM_VSUM
fn step_253() -> Unit raise {
  let t625 = @simp.simp_tac(@list.List([im_def(), @vectors.vsum_component(), @cart.dimindex_2(), @calc_num.arith()]))
  im_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → Im(vsum(s, f)) == sum(s, (x : _) => Im(f(x)))"), t625))
}

///|
let im_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_VSUM")

///|
/// `IM_VSUM`
pub fn im_vsum() -> @kernel.Thm {
  im_vsum_c.get()
}

///|
/// VSUM_COMPLEX_LMUL
fn step_254() -> Unit raise {
  let t627 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), complex_vec_0(), complex_mul_rzero()]))
  let t626 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t628 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t626), t627), simple_complex_arith_tac)
  vsum_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → vsum(s, (x : _) => complex_mul(c, f(x))) == complex_mul(c, vsum(s, f))"), t628))
}

///|
let vsum_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_COMPLEX_LMUL")

///|
/// `VSUM_COMPLEX_LMUL`
pub fn vsum_complex_lmul() -> @kernel.Thm {
  vsum_complex_lmul_c.get()
}

///|
/// VSUM_COMPLEX_RMUL
fn step_255() -> Unit raise {
  let t629 = @simp.rewrite_tac(@list.List([vsum_complex_lmul()]))
  let t630 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([complex_mul_sym()])), t629)
  vsum_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → vsum(s, (x : _) => complex_mul(f(x), c)) == complex_mul(vsum(s, f), c)"), t630))
}

///|
let vsum_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_COMPLEX_RMUL")

///|
/// `VSUM_COMPLEX_RMUL`
pub fn vsum_complex_rmul() -> @kernel.Thm {
  vsum_complex_rmul_c.get()
}

///|
/// VSUM_CX
fn step_256() -> Unit raise {
  let t633 = @simp.rewrite_tac(@list.List([im_cx(), @iterate.sum_0(), re_cx(), @class.eta_ax()]))
  let t631 = @equal.gsym(im_def())
  let t632 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(re_def()), t631]))
  let t634 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vsum_component()])), t632), t633)
  vsum_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, vsum(s, (a : A) => Cx(f(a))) == Cx(sum(s, f))"), t634))
}

///|
let vsum_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_CX")

///|
/// `VSUM_CX`
pub fn vsum_cx() -> @kernel.Thm {
  vsum_cx_c.get()
}

///|
/// CNJ_VSUM
fn step_257() -> Unit raise {
  let t635 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), cnj_add(), cnj_cx(), complex_vec_0()]))
  let t636 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t635)
  cnj_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cnj(vsum(s, f)) == vsum(s, (x : _) => cnj(f(x)))"), t636))
}

///|
let cnj_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_VSUM")

///|
/// `CNJ_VSUM`
pub fn cnj_vsum() -> @kernel.Thm {
  cnj_vsum_c.get()
}

///|
/// VSUM_CX_NUMSEG
fn step_258() -> Unit raise {
  let t637 = @simp.simp_tac(@list.List([vsum_cx(), @iterate.finite_numseg()]))
  vsum_cx_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, vsum(op_dot_dot(m, n), (a : Num) => Cx(f(a))) == Cx(sum(op_dot_dot(m, n), f))"), t637))
}

///|
let vsum_cx_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_CX_NUMSEG")

///|
/// `VSUM_CX_NUMSEG`
pub fn vsum_cx_numseg() -> @kernel.Thm {
  vsum_cx_numseg_c.get()
}

///|
/// COMPLEX_SUB_POW
fn step_259() -> Unit raise {
  let t642 = @simp.simp_tac(@list.List([@arith.sub_0(), @arith.sub_add(), @arith.sub_refl(), complex_pow(), complex_mul_lid(), complex_mul_rid()]))
  let t641 = @simp.rewrite_tac(@list.List([@vectors.vsum_diffs_alt(), @arith.le_0()]))
  let t639 = @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) && (x : Num) <= n - 1 → n - 1 - x == n - (x + 1) && SUC(n - 1 - x) == n - x"))
  let t640 = @simp.simp_tac(@list.List([@equal.gsym(complex_pow()), @arith.add1(), t639]))
  let t638 = @simp.rewrite_tac(@list.List([complex_ring(@term_syntax.parse_term("complex_mul((x : Cart[Real, 2]) - (y : Cart[Real, 2]), complex_mul((a : Cart[Real, 2]), (b : Cart[Real, 2]))) == complex_mul(complex_mul(x, a), b) - complex_mul(a, complex_mul(y, b))"))]))
  let t643 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(vsum_complex_lmul()), @iterate.finite_numseg()])), t638), t640), t641), t642)
  complex_sub_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ n : Num, 1 <= n → complex_pow(x, n) - complex_pow(y, n) == complex_mul(x - y, vsum(op_dot_dot(0, n - 1), (i : Num) => complex_mul(complex_pow(x, i), complex_pow(y, n - 1 - i))))"), t643))
}

///|
let complex_sub_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_POW")

///|
/// `COMPLEX_SUB_POW`
pub fn complex_sub_pow() -> @kernel.Thm {
  complex_sub_pow_c.get()
}

///|
/// COMPLEX_SUB_POW_R1
fn step_260() -> Unit raise {
  let t654 = @simp.rewrite_tac(@list.List([complex_pow_one(), complex_mul_rid()]))
  let t651 = @drule.match_mp(complex_sub_pow())
  let t647 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t648 = @list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t647])
  let t653 = @tactics.disch_then(fn(x652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x650 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s645 = @tactics.mp_tac(x644)
        fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s645(x646)
        }
      })(((x649 : @kernel.Thm) => @bool.specl(t648, x649))(x650))
    })(t651(x652))
  })
  let t655 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t653), t654)
  complex_sub_pow_r1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, 1 <= n → complex_pow(x, n) - Cx(real_of_num(1)) == complex_mul(x - Cx(real_of_num(1)), vsum(op_dot_dot(0, n - 1), (i : Num) => complex_pow(x, i)))"), t655))
}

///|
let complex_sub_pow_r1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_POW_R1")

///|
/// `COMPLEX_SUB_POW_R1`
pub fn complex_sub_pow_r1() -> @kernel.Thm {
  complex_sub_pow_r1_c.get()
}

///|
/// COMPLEX_SUB_POW_L1
fn step_261() -> Unit raise {
  let t657 = @simp.rewrite_tac(@list.List([complex_mul_lneg()]))
  let t656 = @simp.simp_tac(@list.List([complex_sub_pow_r1()]))
  let t658 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(complex_neg_sub())])), t656), t657)
  complex_sub_pow_l1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, 1 <= n → Cx(real_of_num(1)) - complex_pow(x, n) == complex_mul(Cx(real_of_num(1)) - x, vsum(op_dot_dot(0, n - 1), (i : Num) => complex_pow(x, i)))"), t658))
}

///|
let complex_sub_pow_l1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_POW_L1")

///|
/// `COMPLEX_SUB_POW_L1`
pub fn complex_sub_pow_l1() -> @kernel.Thm {
  complex_sub_pow_l1_c.get()
}

///|
/// real
fn step_262() -> Unit raise {
  real_c.set(@pair.new_definition(@term_syntax.parse_term("(real : (Cart[Real, 2]) -> Bool)((z : Cart[Real, 2])) == (Im(z) == real_of_num(0))")))
}

///|
let real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real")

///|
/// `real`
pub fn real() -> @kernel.Thm {
  real_c.get()
}

///|
/// REAL
fn step_263() -> Unit raise {
  let t659 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), real(), cx_def(), re(), im()])), @calc_rat.real_arith_tac)
  real_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) == (Cx(Re(z)) == z)"), t659))
}

///|
let real_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL")

///|
/// `REAL`
pub fn real_v1() -> @kernel.Thm {
  real_v1_c.get()
}

///|
/// REAL_CNJ
fn step_264() -> Unit raise {
  let t660 = @tactics.then_tac(@simp.rewrite_tac(@list.List([real(), cnj(), complex_eq(), re(), im()])), @calc_rat.real_arith_tac)
  real_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) == (cnj(z) == z)"), t660))
}

///|
let real_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CNJ")

///|
/// `REAL_CNJ`
pub fn real_cnj() -> @kernel.Thm {
  real_cnj_c.get()
}

///|
/// REAL_IMP_CNJ
fn step_265() -> Unit raise {
  let t661 = @simp.rewrite_tac(@list.List([real_cnj()]))
  real_imp_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) → cnj(z) == z"), t661))
}

///|
let real_imp_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_IMP_CNJ")

///|
/// `REAL_IMP_CNJ`
pub fn real_imp_cnj() -> @kernel.Thm {
  real_imp_cnj_c.get()
}

///|
/// REAL_EXISTS
fn step_266() -> Unit raise {
  let t662 = @meson.meson_tac(@list.List([real_v1(), real(), im_cx()]))
  real_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) == (∃ x : Real, z == Cx(x))"), t662))
}

///|
let real_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EXISTS")

///|
/// `REAL_EXISTS`
pub fn real_exists() -> @kernel.Thm {
  real_exists_c.get()
}

///|
/// FORALL_REAL
fn step_267() -> Unit raise {
  let t663 = @meson.meson_tac(@list.List([real_exists()]))
  forall_real_c.set(@tactics.prove(@term_syntax.parse_term("(∀ z : Cart[Real, 2], real(z) → (P : (Cart[Real, 2]) -> Bool)(z)) == (∀ x : Real, P(Cx(x)))"), t663))
}

///|
let forall_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_REAL")

///|
/// `FORALL_REAL`
pub fn forall_real() -> @kernel.Thm {
  forall_real_c.get()
}

///|
/// EXISTS_REAL
fn step_268() -> Unit raise {
  let t664 = @meson.meson_tac(@list.List([real_exists()]))
  exists_real_c.set(@tactics.prove(@term_syntax.parse_term("(∃ z : Cart[Real, 2], real(z) && (P : (Cart[Real, 2]) -> Bool)(z)) == (∃ x : Real, P(Cx(x)))"), t664))
}

///|
let exists_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_REAL")

///|
/// `EXISTS_REAL`
pub fn exists_real() -> @kernel.Thm {
  exists_real_c.get()
}

///|
/// REAL_CX
fn step_269() -> Unit raise {
  let t665 = @simp.rewrite_tac(@list.List([real_cnj(), cnj_cx()]))
  real_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real(Cx(x))"), t665))
}

///|
let real_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CX")

///|
/// `REAL_CX`
pub fn real_cx() -> @kernel.Thm {
  real_cx_c.get()
}

///|
/// REAL_MUL_CX
fn step_270() -> Unit raise {
  let t666 = @simp.rewrite_tac(@list.List([real(), im_mul_cx(), @realarith.real_entire()]))
  real_mul_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ z : Cart[Real, 2], real(complex_mul(Cx(x), z)) == (x == real_of_num(0) || real(z))"), t666))
}

///|
let real_mul_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_CX")

///|
/// `REAL_MUL_CX`
pub fn real_mul_cx() -> @kernel.Thm {
  real_mul_cx_c.get()
}

///|
/// REAL_ADD
fn step_271() -> Unit raise {
  let t667 = @simp.simp_tac(@list.List([real_cnj(), cnj_add()]))
  real_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real(w) && real(z) → real(w + z)"), t667))
}

///|
let real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD")

///|
/// `REAL_ADD`
pub fn real_add() -> @kernel.Thm {
  real_add_c.get()
}

///|
/// REAL_NEG
fn step_272() -> Unit raise {
  let t668 = @simp.simp_tac(@list.List([real_cnj(), cnj_neg()]))
  real_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) → real(-z)"), t668))
}

///|
let real_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG")

///|
/// `REAL_NEG`
pub fn real_neg() -> @kernel.Thm {
  real_neg_c.get()
}

///|
/// REAL_SUB
fn step_273() -> Unit raise {
  let t669 = @simp.simp_tac(@list.List([real_cnj(), cnj_sub()]))
  real_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real(w) && real(z) → real(w - z)"), t669))
}

///|
let real_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB")

///|
/// `REAL_SUB`
pub fn real_sub() -> @kernel.Thm {
  real_sub_c.get()
}

///|
/// REAL_MUL
fn step_274() -> Unit raise {
  let t670 = @simp.simp_tac(@list.List([real_cnj(), cnj_mul()]))
  real_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real(w) && real(z) → real(complex_mul(w, z))"), t670))
}

///|
let real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL")

///|
/// `REAL_MUL`
pub fn real_mul() -> @kernel.Thm {
  real_mul_c.get()
}

///|
/// REAL_POW
fn step_275() -> Unit raise {
  let t671 = @simp.simp_tac(@list.List([real_cnj(), cnj_pow()]))
  real_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, real(z) → real(complex_pow(z, n))"), t671))
}

///|
let real_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW")

///|
/// `REAL_POW`
pub fn real_pow() -> @kernel.Thm {
  real_pow_c.get()
}

///|
/// REAL_INV
fn step_276() -> Unit raise {
  let t672 = @simp.simp_tac(@list.List([real_cnj(), cnj_inv()]))
  real_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) → real(complex_inv(z))"), t672))
}

///|
let real_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV")

///|
/// `REAL_INV`
pub fn real_inv() -> @kernel.Thm {
  real_inv_c.get()
}

///|
/// REAL_INV_EQ
fn step_277() -> Unit raise {
  let t673 = @meson.meson_tac(@list.List([real_inv(), complex_inv_inv()]))
  real_inv_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(complex_inv(z)) == real(z)"), t673))
}

///|
let real_inv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_EQ")

///|
/// `REAL_INV_EQ`
pub fn real_inv_eq() -> @kernel.Thm {
  real_inv_eq_c.get()
}

///|
/// REAL_DIV
fn step_278() -> Unit raise {
  let t674 = @simp.simp_tac(@list.List([real_cnj(), cnj_div()]))
  real_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real(w) && real(z) → real(complex_div(w, z))"), t674))
}

///|
let real_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV")

///|
/// `REAL_DIV`
pub fn real_div() -> @kernel.Thm {
  real_div_c.get()
}

///|
/// REAL_VSUM
fn step_279() -> Unit raise {
  let t675 = @simp.simp_tac(@list.List([cnj_vsum(), real_cnj()]))
  real_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) && (∀ a : _, IN(a, s) → real(f(a))) → real(vsum(s, f))"), t675))
}

///|
let real_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_VSUM")

///|
/// `REAL_VSUM`
pub fn real_vsum() -> @kernel.Thm {
  real_vsum_c.get()
}

///|
/// REAL_MUL_CNJ
fn step_280() -> Unit raise {
  let t676 = @simp.rewrite_tac(@list.List([complex_mul_cnj(), @equal.gsym(cx_pow()), real_cx()]))
  real_mul_cnj_c.set(@tactics.prove(@term_syntax.parse_term("(∀ z : Cart[Real, 2], real(complex_mul(z, cnj(z)))) && (∀ z : Cart[Real, 2], real(complex_mul(cnj(z), z)))"), t676))
}

///|
let real_mul_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_CNJ")

///|
/// `REAL_MUL_CNJ`
pub fn real_mul_cnj() -> @kernel.Thm {
  real_mul_cnj_c.get()
}

///|
/// REAL_SEGMENT
fn step_281() -> Unit raise {
  let t677 = @tactics.then_tac(@simp.simp_tac(@list.List([@topology.segment(), @sets.in_elim_thm(), real(), complex_eq(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm(), im_add(), im_cmul()])), @calc_rat.real_arith_tac)
  real_segment_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, segment([(a, b)])) && real(a) && real(b) → real(x)"), t677))
}

///|
let real_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SEGMENT")

///|
/// `REAL_SEGMENT`
pub fn real_segment() -> @kernel.Thm {
  real_segment_c.get()
}

///|
/// IN_SEGMENT_CX
fn step_282() -> Unit raise {
  let t710 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t708 = @tactics.conv_tac(@calc_rat.real_field)
  let t709 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((a : Real) == (b : Real))")), t708)]))
  let t705 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.exists_tac(@term_syntax.parse_term("((a : Real) - (x : Real)) / (a - (b : Real))"))])
  let t706 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real) - (b : Real)"), fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s703 = @tactics.assume_tac(x702)
    fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s703(x704)
    }
  }), t705)
  let t701 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.exists_tac(@term_syntax.parse_term("((x : Real) - (a : Real)) / ((b : Real) - a)"))])
  let t707 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (b : Real) - (a : Real)"), fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s699 = @tactics.assume_tac(x698)
    fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s699(x700)
    }
  }), t701), t706])
  let t696 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t695 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) || b <= a")))
  let t691 = @calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real)) * (a : Real) + u * (b : Real) <= b) == (real_of_num(0) <= (real_of_num(1) - u) * (b - a))"))
  let t692 = @calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (u : Real)) * (a : Real) + u * (b : Real) <= a) == (real_of_num(0) <= u * (a - b))"))
  let t693 = @calc_rat.real_arith(@term_syntax.parse_term("((b : Real) <= (real_of_num(1) - (u : Real)) * (a : Real) + u * b) == (real_of_num(0) <= (real_of_num(1) - u) * (a - b))"))
  let t694 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (real_of_num(1) - (u : Real)) * a + u * (b : Real)) == (real_of_num(0) <= u * (b - a))")), t693, t692, t691]))
  let t690 = @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s688 = @tactics.subst1_tac(x687)
    fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s688(x689)
    }
  })
  let t697 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(t690)), t694), t695), @list.List([@tactics.disj1_tac, @tactics.disj2_tac])), @tactics.conj_tac), t696), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t685 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t684 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t683 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_antisym()]))
  let t682 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (b : Real)"))
  let t686 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (b : Real) + u * b == b"))])), t682), t683), t684), t685), @tactics.all_tac])
  let t681 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == (b : Real)"))
  let t679 = @equal.gsym(cx_mul())
  let t680 = @simp.rewrite_tac(@list.List([complex_cmul(), @equal.gsym(cx_add()), cx_inj(), t679]))
  let t678 = @simp.rewrite_tac(@list.List([@topology.segment(), @sets.in_elim_thm()]))
  let t711 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t678), t680), t681), t686), @tactics.eq_tac), t697), @tactics.strip_tac), t707), t709), t710), @calc_rat.asm_real_arith_tac)
  in_segment_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Real, IN(Cx(x), segment([(Cx(a), Cx(b))])) == (a <= x && x <= b || b <= x && x <= a)"), t711))
}

///|
let in_segment_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SEGMENT_CX")

///|
/// `IN_SEGMENT_CX`
pub fn in_segment_cx() -> @kernel.Thm {
  in_segment_cx_c.get()
}

///|
/// IN_SEGMENT_CX_GEN
fn step_283() -> Unit raise {
  let t721 = @meson.asm_meson_tac(@list.List([real_segment(), real_cx()]))
  let t720 = @simp.rewrite_tac(@list.List([in_segment_cx(), real_cx(), re_cx()]))
  let t718 = @simp.rewrite_rule(@list.List([real_v1()]))
  let t722 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s715 = @tactics.subst1_tac(x714)
        fn(x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s715(x716)
        }
      })(@equal.sym(x717))
    })(t718(x719))
  }), t720), @calc_rat.real_arith_tac), t721])
  let t713 = @class.asm_cases_tac(@term_syntax.parse_term("real((x : Cart[Real, 2]))"))
  let t712 = @simp.rewrite_tac(@list.List([@equal.gsym(real())]))
  let t723 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t712), t713), t722)
  in_segment_cx_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Cart[Real, 2], IN(x, segment([(Cx(a), Cx(b))])) == (Im(x) == real_of_num(0) && (a <= Re(x) && Re(x) <= b || b <= Re(x) && Re(x) <= a))"), t723))
}

///|
let in_segment_cx_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SEGMENT_CX_GEN")

///|
/// `IN_SEGMENT_CX_GEN`
pub fn in_segment_cx_gen() -> @kernel.Thm {
  in_segment_cx_gen_c.get()
}

///|
/// RE_POS_SEGMENT
fn step_284() -> Unit raise {
  let t726 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_sub_le(), @realarith.real_lt_imp_le(), @realarith.real_entire()]))
  let t725 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && !(x == real_of_num(0) && y == real_of_num(0)) → real_of_num(0) < x + y")))
  let t724 = @tactics.repeat_tac(@tactics.strip_tac)
  let t727 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@topology.segment(), @sets.in_elim_thm(), real(), complex_eq(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm(), re_add(), re_cmul()])), t724), t725), t726), @calc_rat.asm_real_arith_tac)
  re_pos_segment_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, segment([(a, b)])) && real_of_num(0) < Re(a) && real_of_num(0) < Re(b) → real_of_num(0) < Re(x)"), t727))
}

///|
let re_pos_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_POS_SEGMENT")

///|
/// `RE_POS_SEGMENT`
pub fn re_pos_segment() -> @kernel.Thm {
  re_pos_segment_c.get()
}

///|
/// CONVEX_REAL
fn step_285() -> Unit raise {
  let t728 = @simp.simp_tac(@list.List([real_add(), real_mul(), real_cx()]))
  let t729 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex(), @sets.in_(), complex_cmul()])), t728)
  convex_real_c.set(@tactics.prove(@term_syntax.parse_term("convex(real)"), t729))
}

///|
let convex_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_REAL")

///|
/// `CONVEX_REAL`
pub fn convex_real() -> @kernel.Thm {
  convex_real_c.get()
}

///|
/// IMAGE_CX
fn step_286() -> Unit raise {
  let t730 = @meson.meson_tac(@list.List([re_cx(), real_v1()]))
  let t731 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image()])), t730)
  image_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, IMAGE(Cx, s) == {(z : Cart[Real, 2]) | real(z) && IN(Re(z), s)}"), t731))
}

///|
let image_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_CX")

///|
/// `IMAGE_CX`
pub fn image_cx() -> @kernel.Thm {
  image_cx_c.get()
}

///|
/// SUBSPACE_REAL
fn step_287() -> Unit raise {
  let t732 = @simp.simp_tac(@list.List([complex_cmul(), complex_vec_0(), @sets.in_(), real_cx(), real_add(), real_mul()]))
  let t733 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.subspace()])), t732)
  subspace_real_c.set(@tactics.prove(@term_syntax.parse_term("subspace(real)"), t733))
}

///|
let subspace_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSPACE_REAL")

///|
/// `SUBSPACE_REAL`
pub fn subspace_real() -> @kernel.Thm {
  subspace_real_c.get()
}

///|
/// DIM_REAL
fn step_288() -> Unit raise {
  let t734 = @simp.simp_tac(@list.List([real(), im_def(), @vectors.dim_special_hyperplane(), @cart.dimindex_2(), @calc_num.arith()]))
  let t735 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("real == {(x : Cart[Real, 2]) | real(x)}"))])), t734)
  dim_real_c.set(@tactics.prove(@term_syntax.parse_term("dim(real) == 1"), t735))
}

///|
let dim_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIM_REAL")

///|
/// `DIM_REAL`
pub fn dim_real() -> @kernel.Thm {
  dim_real_c.get()
}

///|
/// INTERIOR_REAL
fn step_289() -> Unit raise {
  let t736 = @simp.rewrite_tac(@list.List([dim_real(), @cart.dimindex_2(), @calc_num.arith()]))
  let t737 = @tactics.then_tac(@tactics.match_mp_tac(@topology.empty_interior_lowdim()), t736)
  interior_real_c.set(@tactics.prove(@term_syntax.parse_term("interior(real) == {}"), t737))
}

///|
let interior_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_REAL")

///|
/// `INTERIOR_REAL`
pub fn interior_real() -> @kernel.Thm {
  interior_real_c.get()
}

///|
/// REAL_NORM
fn step_290() -> Unit raise {
  let t739 = @simp.rewrite_tac(@list.List([@real.pow_2_sqrt_abs(), @calc_int.real_add_rid()]))
  let t738 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t740 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([real(), complex_norm()])), t738), t739)
  real_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) → norm(z) == abs(Re(z))"), t740))
}

///|
let real_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NORM")

///|
/// `REAL_NORM`
pub fn real_norm() -> @kernel.Thm {
  real_norm_c.get()
}

///|
/// REAL_NORM_POS
fn step_291() -> Unit raise {
  let t741 = @tactics.then_tac(@simp.simp_tac(@list.List([real_norm()])), @calc_rat.real_arith_tac)
  real_norm_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) && real_of_num(0) <= Re(z) → norm(z) == Re(z)"), t741))
}

///|
let real_norm_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NORM_POS")

///|
/// `REAL_NORM_POS`
pub fn real_norm_pos() -> @kernel.Thm {
  real_norm_pos_c.get()
}

///|
/// COMPLEX_NORM_VSUM_SUM_RE
fn step_292() -> Unit raise {
  let t744 = @simp.asm_simp_tac(@list.List([real_vsum(), re_vsum(), @iterate.sum_pos_le()]))
  let t743 = @tactics.match_mp_tac(real_norm_pos())
  let t742 = @tactics.repeat_tac(@tactics.strip_tac)
  let t745 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(re_vsum())])), t742), t743), t744)
  complex_norm_vsum_sum_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → real(f(x)) && real_of_num(0) <= Re(f(x))) → norm(vsum(s, f)) == sum(s, (x : _) => Re(f(x)))"), t745))
}

///|
let complex_norm_vsum_sum_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_VSUM_SUM_RE")

///|
/// `COMPLEX_NORM_VSUM_SUM_RE`
pub fn complex_norm_vsum_sum_re() -> @kernel.Thm {
  complex_norm_vsum_sum_re_c.get()
}

///|
/// COMPLEX_NORM_VSUM_BOUND
fn step_293() -> Unit raise {
  let t754 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @vectors.norm_pos_le()]))
  let t753 = @tactics.match_mp_tac(complex_norm_vsum_sum_re())
  let t752 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) → y <= x")))
  let t751 = @simp.asm_simp_tac(@list.List([@iterate.sum_le()]))
  let t750 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => Re((g : (A) -> Cart[Real, 2])(x)))"))
  let t749 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t748 = @simp.asm_simp_tac(@list.List([@vectors.vsum_norm()]))
  let t747 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => norm((f : (A) -> Cart[Real, 2])(x)))"))
  let t746 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t755 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t746), t747), t748), t749), t750), t751), t752), t753), t754)
  complex_norm_vsum_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], FINITE(s) && (∀ x : A, IN(x, s) → real(g(x)) && norm(f(x)) <= Re(g(x))) → norm(vsum(s, f)) <= norm(vsum(s, g))"), t755))
}

///|
let complex_norm_vsum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_VSUM_BOUND")

///|
/// `COMPLEX_NORM_VSUM_BOUND`
pub fn complex_norm_vsum_bound() -> @kernel.Thm {
  complex_norm_vsum_bound_c.get()
}

///|
/// COMPLEX_NORM_VSUM_BOUND_SUBSET
fn step_294() -> Unit raise {
  let t767 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @vectors.norm_pos_le(), @sets.finite_subset(), @sets.subset()]))
  let t764 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t765 = @tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset()), t764)
  let t766 = @list.List([@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(complex_norm_vsum_sum_re())), t765])
  let t762 = @tactics.conjuncts_then(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s760 = @tactics.subst1_tac(x759)
    fn(x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s760(x761)
    }
  })
  let t763 = @tactics.subgoal_then(@term_syntax.parse_term("norm(vsum((t : (A) -> Bool), (g : (A) -> Cart[Real, 2]))) == sum(t, (x : A) => Re(g(x))) && norm(vsum((s : (A) -> Bool), g)) == sum(s, (x : A) => Re(g(x)))"), t762)
  let t758 = @list.List([@meson.asm_meson_tac(@list.List([complex_norm_vsum_bound(), @sets.subset(), @sets.finite_subset()])), @tactics.all_tac])
  let t757 = @tactics.exists_tac(@term_syntax.parse_term("norm(vsum((t : (A) -> Bool), (g : (A) -> Cart[Real, 2])))"))
  let t756 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t768 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t756), t757), @tactics.conj_tac), t758), t763), t766), t767)
  complex_norm_vsum_bound_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) && (∀ x : A, IN(x, s) → real(g(x)) && norm(f(x)) <= Re(g(x))) → norm(vsum(t, f)) <= norm(vsum(s, g))"), t768))
}

///|
let complex_norm_vsum_bound_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_VSUM_BOUND_SUBSET")

///|
/// `COMPLEX_NORM_VSUM_BOUND_SUBSET`
pub fn complex_norm_vsum_bound_subset() -> @kernel.Thm {
  complex_norm_vsum_bound_subset_c.get()
}

///|
/// VSUM_GP_BASIC
fn step_295() -> Unit raise {
  let t771 = @simp.asm_rewrite_tac(@list.List([complex_add_ldistrib(), complex_pow()]))
  let t770 = @simp.rewrite_tac(@list.List([complex_pow(), complex_mul_rid(), @arith.le_0()]))
  let t769 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg()]))
  let t772 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t769), t770), t771), simple_complex_arith_tac)
  vsum_gp_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ n : Num, complex_mul(Cx(real_of_num(1)) - x, vsum(op_dot_dot(0, n), (i : Num) => complex_pow(x, i))) == Cx(real_of_num(1)) - complex_pow(x, SUC(n))"), t772))
}

///|
let vsum_gp_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_GP_BASIC")

///|
/// `VSUM_GP_BASIC`
pub fn vsum_gp_basic() -> @kernel.Thm {
  vsum_gp_basic_c.get()
}

///|
/// VSUM_GP_MULTIPLIED
fn step_296() -> Unit raise {
  let t775 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → SUC(n - m) + m == SUC(n)"))]))
  let t774 = @simp.rewrite_tac(@list.List([complex_sub_rdistrib(), @equal.gsym(complex_pow_add()), complex_mul_lid()]))
  let t773 = @simp.asm_simp_tac(@list.List([@vectors.vsum_offset_0(), complex_pow_add(), @iterate.finite_numseg(), complex_mul_assoc(), vsum_gp_basic(), vsum_complex_rmul()]))
  let t776 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t773), t774), t775)
  vsum_gp_multiplied_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n → complex_mul(Cx(real_of_num(1)) - x, vsum(op_dot_dot(m, n), (i : Num) => complex_pow(x, i))) == complex_pow(x, m) - complex_pow(x, SUC(n))"), t776))
}

///|
let vsum_gp_multiplied_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_GP_MULTIPLIED")

///|
/// `VSUM_GP_MULTIPLIED`
pub fn vsum_gp_multiplied() -> @kernel.Thm {
  vsum_gp_multiplied_c.get()
}

///|
/// VSUM_GP
fn step_297() -> Unit raise {
  let t782 = @simp.asm_simp_tac(@list.List([complex_div_lmul(), complex_sub_0(), vsum_gp_multiplied()]))
  let t781 = @tactics.match_mp_tac(complex_field(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(1))) && complex_mul(Cx(real_of_num(1)) - z, (x : Cart[Real, 2])) == (y : Cart[Real, 2]) → x == complex_div(y, Cx(real_of_num(1)) - z)")))
  let t780 = @simp.rewrite_tac(@list.List([complex_cmul(), complex_mul_rid()]))
  let t779 = @list.List([@simp.asm_rewrite_tac(@list.List([complex_pow_one(), @vectors.vsum_const_numseg(), complex_mul_rid()])), @tactics.all_tac])
  let t778 = @simp.asm_simp_tac(@list.List([@vectors.vsum_triv_numseg(), complex_vec_0()]))
  let t777 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) || !(n < m) && m <= n")))
  let t783 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t777), t778), @class.cond_cases_tac), t779), t780), t781), t782)
  vsum_gp_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ m : Num, ∀ n : Num, vsum(op_dot_dot(m, n), (i : Num) => complex_pow(x, i)) == (if n < m { Cx(real_of_num(0)) } else { if x == Cx(real_of_num(1)) { Cx(real_of_num(n + 1 - m)) } else { complex_div(complex_pow(x, m) - complex_pow(x, SUC(n)), Cx(real_of_num(1)) - x) } })"), t783))
}

///|
let vsum_gp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_GP")

///|
/// `VSUM_GP`
pub fn vsum_gp() -> @kernel.Thm {
  vsum_gp_c.get()
}

///|
/// VSUM_GP_OFFSET
fn step_298() -> Unit raise {
  let t786 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_div(), complex_pow(), complex_pow_add()])), simple_complex_arith_tac)
  let t787 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @equal.gsym(cx_add())])), @tactics.ap_term_tac), @tactics.ap_term_tac), @int.arith_tac), t786])
  let t785 = @simp.asm_rewrite_tac(@list.List([]))
  let t784 = @simp.rewrite_tac(@list.List([vsum_gp(), @int.arith_rule(@term_syntax.parse_term("!((m : Num) + (n : Num) < m)"))]))
  let t788 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t784), @class.cond_cases_tac), t785), t787)
  vsum_gp_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ m : Num, ∀ n : Num, vsum(op_dot_dot(m, m + n), (i : Num) => complex_pow(x, i)) == (if x == Cx(real_of_num(1)) { Cx(real_of_num(n)) + Cx(real_of_num(1)) } else { complex_mul(complex_pow(x, m), complex_div(Cx(real_of_num(1)) - complex_pow(x, SUC(n)), Cx(real_of_num(1)) - x)) })"), t788))
}

///|
let vsum_gp_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_GP_OFFSET")

///|
/// `VSUM_GP_OFFSET`
pub fn vsum_gp_offset() -> @kernel.Thm {
  vsum_gp_offset_c.get()
}

///|
/// COMPLEX_SUB_POLYFUN
fn step_299() -> Unit raise {
  let t806 = @simp.rewrite_tac(@list.List([complex_mul_ac()]))
  let t805 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) - (b : Num) - (c : Num) == a - (b + c)")), @arith.add_sym()]))
  let t804 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.in_elim_pair_thm(), @iterate.in_numseg()]))
  let t803 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x)))")))
  let t802 = @tactics.match_mp_tac(@vectors.vsum_eq_general_inverses())
  let t800 = @equal.gsym(vsum_complex_rmul())
  let t801 = @simp.simp_tac(@list.List([@equal.gsym(vsum_complex_lmul()), t800, @iterate.finite_numseg(), @vectors.vsum_vsum_product(), @iterate.finite_numseg()]))
  let t799 = @simp.simp_tac(@list.List([vsum_complex_lmul(), @iterate.finite_numseg()]))
  let t798 = @simp.once_rewrite_tac(@list.List([complex_ring(@term_syntax.parse_term("complex_mul((a : Cart[Real, 2]), complex_mul((x : Cart[Real, 2]), (s : Cart[Real, 2]))) == complex_mul(x, complex_mul(a, s))"))]))
  let t797 = @simp.simp_tac(@list.List([complex_sub_pow(), @arith.add_clauses()]))
  let t796 = @simp.rewrite_tac(@list.List([complex_sub_refl(), complex_pow(), complex_mul_rzero(), complex_add_lid()]))
  let t794 = @bool.spec_all(@arith.le_0())
  let t795 = @simp.gen_rewrite_tac(fn(x791 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s792 = @equal.land_conv(x791)
    fn(x793 : @kernel.Term) -> @kernel.Thm raise {
      s792(x793)
    }
  }, @list.List([@drule.match_mp(@vectors.vsum_clauses_left())(t794)]))
  let t789 = @equal.gsym(complex_sub_ldistrib())
  let t790 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_sub_numseg()), t789]))
  let t807 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t790), t795), t796), t797), t798), t799), @tactics.ap_term_tac), t801), t802), t803), t804), t805), t806), @int.arith_tac)
  complex_sub_polyfun_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ n : Num, 1 <= n → vsum(op_dot_dot(0, n), (i : Num) => complex_mul(a(i), complex_pow(x, i))) - vsum(op_dot_dot(0, n), (i : Num) => complex_mul(a(i), complex_pow(y, i))) == complex_mul(x - y, vsum(op_dot_dot(0, n - 1), (j : Num) => complex_mul(vsum(op_dot_dot(j + 1, n), (i : Num) => complex_mul(a(i), complex_pow(y, i - j - 1))), complex_pow(x, j))))"), t807))
}

///|
let complex_sub_polyfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_POLYFUN")

///|
/// `COMPLEX_SUB_POLYFUN`
pub fn complex_sub_polyfun() -> @kernel.Thm {
  complex_sub_polyfun_c.get()
}

///|
/// COMPLEX_SUB_POLYFUN_ALT
fn step_300() -> Unit raise {
  let t821 = @tactics.try_tac(@tactics.then_tac(@tactics.binop_tac, @tactics.ap_term_tac))
  let t820 = @tactics.repeat_tac(@tactics.strip_tac)
  let t819 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t817 = @term_syntax.parse_term("(k : Num) => (j : Num) + (k + 1)")
  let t818 = @tactics.map_every(fn(x814 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s815 = @tactics.exists_tac(x814)
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s815(x816)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num) => i - ((j : Num) + 1)"), t817]))
  let t813 = @tactics.match_mp_tac(@vectors.vsum_eq_general_inverses())
  let t812 = @simp.rewrite_tac(@list.List([]))
  let t811 = @tactics.repeat_tac(@tactics.strip_tac)
  let t810 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t809 = @tactics.match_mp_tac(@vectors.vsum_eq_numseg())
  let t808 = @simp.asm_simp_tac(@list.List([complex_sub_polyfun()]))
  let t822 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t808), @tactics.ap_term_tac), t809), t810), t811), t812), @tactics.ap_thm_tac), @tactics.ap_term_tac), t813), t818), t819), t820), t821), @int.asm_arith_tac)
  complex_sub_polyfun_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ n : Num, 1 <= n → vsum(op_dot_dot(0, n), (i : Num) => complex_mul(a(i), complex_pow(x, i))) - vsum(op_dot_dot(0, n), (i : Num) => complex_mul(a(i), complex_pow(y, i))) == complex_mul(x - y, vsum(op_dot_dot(0, n - 1), (j : Num) => complex_mul(vsum(op_dot_dot(0, n - j - 1), (k : Num) => complex_mul(a(j + (k + 1)), complex_pow(y, k))), complex_pow(x, j))))"), t822))
}

///|
let complex_sub_polyfun_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_POLYFUN_ALT")

///|
/// `COMPLEX_SUB_POLYFUN_ALT`
pub fn complex_sub_polyfun_alt() -> @kernel.Thm {
  complex_sub_polyfun_alt_c.get()
}

///|
/// COMPLEX_POLYFUN_LINEAR_FACTOR
fn step_301() -> Unit raise {
  let t829 = @simp.rewrite_tac(@list.List([]))
  let t828 = @tactics.exists_tac(@term_syntax.parse_term("(j : Num) => vsum(op_dot_dot(j + 1, (n : Num)), (i : Num) => complex_mul((c : (Num) -> Cart[Real, 2])(i), complex_pow((a : Cart[Real, 2]), i - j - 1)))"))
  let t830 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([complex_sub_polyfun(), @arith.le_1()])), t828), t829)
  let t827 = @simp.rewrite_tac(@list.List([complex_vec_0(), complex_mul_rzero()]))
  let t826 = @simp.rewrite_tac(@list.List([complex_sub_refl(), @equal.gsym(complex_vec_0()), @vectors.vsum_0()]))
  let t825 = @simp.asm_simp_tac(@list.List([@vectors.vsum_sing(), @iterate.numseg_sing(), complex_pow(), complex_mul_lzero()]))
  let t831 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : Num) => Cx(real_of_num(0))")), t825), t826), t827), t830])
  let t824 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t823 = @simp.rewrite_tac(@list.List([@equal.gsym(complex_eq_sub_radd())]))
  let t832 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t823), t824), t831)
  complex_polyfun_linear_factor_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, ∃ b : (Num) -> Cart[Real, 2], ∀ z : Cart[Real, 2], vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == complex_mul(z - a, vsum(op_dot_dot(0, n - 1), (i : Num) => complex_mul(b(i), complex_pow(z, i)))) + vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(a, i)))"), t832))
}

///|
let complex_polyfun_linear_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_LINEAR_FACTOR")

///|
/// `COMPLEX_POLYFUN_LINEAR_FACTOR`
pub fn complex_polyfun_linear_factor() -> @kernel.Thm {
  complex_polyfun_linear_factor_c.get()
}

///|
/// COMPLEX_POLYFUN_LINEAR_FACTOR_ROOT
fn step_302() -> Unit raise {
  let t833 = @meson.meson_tac(@list.List([complex_polyfun_linear_factor(), complex_add_rid()]))
  complex_polyfun_linear_factor_root_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(a, i))) == Cx(real_of_num(0)) → (∃ b : (Num) -> Cart[Real, 2], ∀ z : Cart[Real, 2], vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == complex_mul(z - a, vsum(op_dot_dot(0, n - 1), (i : Num) => complex_mul(b(i), complex_pow(z, i)))))"), t833))
}

///|
let complex_polyfun_linear_factor_root_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_LINEAR_FACTOR_ROOT")

///|
/// `COMPLEX_POLYFUN_LINEAR_FACTOR_ROOT`
pub fn complex_polyfun_linear_factor_root() -> @kernel.Thm {
  complex_polyfun_linear_factor_root_c.get()
}

///|
/// COMPLEX_POLYFUN_EXTREMAL_LEMMA
fn step_303() -> Unit raise {
  let t875 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), @real.real_pow_le(), @vectors.norm_pos_le(), @real.real_pow_1()]))
  let t874 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t873 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t872 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t871 = @simp.gen_rewrite_tac(fn(x870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x864 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s865 = @equal.rand_conv(x864)
      fn(x866 : @kernel.Term) -> @kernel.Thm raise {
        s865(x866)
      }
    })((fn(x867 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s868 = @equal.rand_conv(x867)
      fn(x869 : @kernel.Term) -> @kernel.Thm raise {
        s868(x869)
      }
    })(x870))
  }, @list.List([@real.real_pow_add()]))
  let t862 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == 1 + (n + 1)"))
  let t863 = @simp.simp_tac(@list.List([@arith.add1(), complex_norm_mul(), complex_norm_pow(), @equal.gsym(@real.real_add_rdistrib()), t862]))
  let t861 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(a : Real) + norm((y : Cart[Real, 2])) <= (b : Real) → norm((x : Cart[Real, 2])) <= a → norm(x + y) <= b")))
  let t860 = @simp.asm_rewrite_tac(@list.List([]))
  let t856 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t859 = @tactics.first_x_assum(fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s854 = @tactics.mp_tac(x853)
      fn(x855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s854(x855)
      }
    })(((x857 : @kernel.Thm) => @bool.spec(t856, x857))(x858))
  })
  let t852 = @simp.rewrite_tac(@list.List([@real.real_max_le()]))
  let t851 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t850 = @tactics.exists_tac(@term_syntax.parse_term("max((M : Real), (real_of_num(1) / real_of_num(2) + norm((c : (Num) -> Cart[Real, 2])((n : Num) + 1))) / (e : Real))"))
  let t847 = @term_syntax.parse_term("(M : Real)")
  let t849 = @tactics.disch_then((x848 : @kernel.Thm) => @tactics.x_choose_tac(t847, x848))
  let t843 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) / real_of_num(2)"))
  let t846 = @tactics.first_x_assum(fn(x845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s841 = @tactics.mp_tac(x840)
      fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s841(x842)
      }
    })((fn(x844 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x844)(t843)
    })(x845))
  })
  let t838 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t837 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq()]))
  let t836 = @tactics.exists_tac(@term_syntax.parse_term("norm((c : (Num) -> Cart[Real, 2])(0)) / (e : Real)"))
  let t839 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses(), complex_pow(), @real.real_pow_1(), complex_mul_rid()])), t836), t837), t838), @tactics.all_tac])
  let t835 = @tactics.repeat_tac(@tactics.strip_tac)
  let t834 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_numseg(), @arith.le_0()]))
  let t876 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t834), t835), t839), t846), t849), t850), t851), t852), @tactics.strip_tac), t859), t860), t861), t863), t871), t872), t873), t874), t875)
  complex_polyfun_extremal_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, ∀ e : Real, real_of_num(0) < e → (∃ M : Real, ∀ z : Cart[Real, 2], M <= norm(z) → norm(vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i)))) <= e * pow(norm(z), n + 1))"), t876))
}

///|
let complex_polyfun_extremal_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_EXTREMAL_LEMMA")

///|
/// `COMPLEX_POLYFUN_EXTREMAL_LEMMA`
pub fn complex_polyfun_extremal_lemma() -> @kernel.Thm {
  complex_polyfun_extremal_lemma_c.get()
}

///|
/// COMPLEX_POLYFUN_EXTREMAL
fn step_304() -> Unit raise {
  let t925 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t924 = @tactics.match_mp_tac(@real.real_pow_mono())
  let t923 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_pow_1()])), @tactics.all_tac])
  let t922 = @tactics.exists_tac(@term_syntax.parse_term("pow(norm((z : Cart[Real, 2])), 1)"))
  let t921 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t920 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), complex_norm_nz(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t919 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(c : Real) * (x : Real) - c / real_of_num(2) * x == x * (c / real_of_num(2))"))]))
  let t918 = @simp.rewrite_tac(@list.List([complex_norm_mul(), complex_norm_pow()]))
  let t917 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("abs((b : Real)) + real_of_num(1) <= norm((y : Cart[Real, 2])) - (a : Real) → norm((x : Cart[Real, 2])) <= a → b <= norm(y + x)")))
  let t916 = @simp.asm_rewrite_tac(@list.List([]))
  let t912 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t915 = @tactics.first_x_assum(fn(x914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s910 = @tactics.mp_tac(x909)
      fn(x911 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s910(x911)
      }
    })(((x913 : @kernel.Thm) => @bool.spec(t912, x913))(x914))
  })
  let t908 = @simp.rewrite_tac(@list.List([@realax.real_ge(), @real.real_max_le()]))
  let t907 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t906 = @tactics.exists_tac(@term_syntax.parse_term("max((M : Real), max(real_of_num(1), (abs((B : Real)) + real_of_num(1)) / (norm((c : (Num) -> Cart[Real, 2])((n : Num))) / real_of_num(2))))"))
  let t905 = @simp.rewrite_tac(@list.List([@topology.eventually_at_infinity()]))
  let t904 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t901 = @term_syntax.parse_term("(M : Real)")
  let t903 = @tactics.disch_then((x902 : @kernel.Thm) => @tactics.x_choose_tac(t901, x902))
  let t900 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → !(n <= n - 1)"))]))
  let t899 = @simp.simp_tac(@list.List([@sets.in_insert(), @vectors.vsum_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t898 = @simp.asm_simp_tac(@list.List([complex_norm_nz(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t897 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.le_1()]))
  let t895 = @term_syntax.parse_term("norm((c : (Num) -> Cart[Real, 2])((n : Num))) / real_of_num(2)")
  let t896 = @term_syntax.parse_term("(n : Num) - 1")
  let t926 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"), t896, t895]), complex_polyfun_extremal_lemma()))), t897), t898), t899), t900), t903), t904), t905), t906), t907), t908), @tactics.strip_tac), t915), t916), t917), t918), t919), t920), t921), t922), @tactics.conj_tac), t923), t924), t925)
  let t894 = @meson.asm_meson_tac(@list.List([]))
  let t893 = @simp.asm_rewrite_tac(@list.List([complex_mul_lzero(), complex_add_lid(), @class.cond_id()]))
  let t892 = @simp.simp_tac(@list.List([@sets.in_insert(), @vectors.vsum_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t891 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.numseg_rrec()), @arith.le_1()]))
  let t888 = @term_syntax.parse_term("(n : Num) - 1")
  let t927 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x890 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s886 = @tactics.mp_tac(x885)
      fn(x887 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s886(x887)
      }
    })(((x889 : @kernel.Thm) => @bool.spec(t888, x889))(x890))
  }), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t891), t892), t893), t894), t926])
  let t884 = @class.asm_cases_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])((n : Num)) == Cx(real_of_num(0))"))
  let t883 = @tactics.disch_then(fn(x882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t881 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_rrec())]))
  let t880 = @tactics.mp_tac(@int.arith_rule(@term_syntax.parse_term("0 <= (n : Num)")))
  let t879 = @simp.asm_rewrite_tac(@list.List([@iterate.numseg_clauses(), @calc_num.arith(), @sets.not_in_empty()]))
  let t878 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t877 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t928 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@arith.num_wf())), t877), @tactics.disch_tac), t878), t879), t880), t881), t883), t884), t927)
  complex_polyfun_extremal_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, (∀ k : Num, IN(k, op_dot_dot(1, n)) → c(k) == Cx(real_of_num(0))) || (∀ B : Real, eventually((z : Cart[Real, 2]) => norm(vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i)))) >= B, at_infinity))"), t928))
}

///|
let complex_polyfun_extremal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_EXTREMAL")

///|
/// `COMPLEX_POLYFUN_EXTREMAL`
pub fn complex_polyfun_extremal() -> @kernel.Thm {
  complex_polyfun_extremal_c.get()
}

///|
/// COMPLEX_POLYFUN_ROOTBOUND
fn step_305() -> Unit raise {
  let t993 = @meson.asm_meson_tac(@list.List([@vectors.norm_pos_le(), @realax.real_le_total(), @realax.real_le_trans()]))
  let t990 = @parser.parse_type("N")
  let t991 = @kernel.inst_type(@list.List([(@parser.parse_type("2"), t990)]), @vectors.vector_choose_size())
  let t992 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(b : Real)"), t991))
  let t989 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Real)"))
  let t988 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.not_forall_thm()]))
  let t987 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t986 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t982 = @term_syntax.parse_term("real_of_num(1)")
  let t985 = @tactics.first_x_assum(fn(x984 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x979 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s980 = @tactics.mp_tac(x979)
      fn(x981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s980(x981)
      }
    })(((x983 : @kernel.Thm) => @bool.spec(t982, x983))(x984))
  })
  let t978 = @list.List([@meson.asm_meson_tac(@list.List([@arith.le_1()])), @tactics.all_tac])
  let t977 = @tactics.repeat_tac(@tactics.strip_tac)
  let t976 = @simp.rewrite_tac(@list.List([complex_mul_rid(), @realax.real_ge(), @topology.eventually_at_infinity()]))
  let t975 = @simp.rewrite_tac(@list.List([complex_vec_0(), complex_mul_rzero(), complex_norm_num()]))
  let t974 = @simp.asm_simp_tac(@list.List([@vectors.vsum_0(), @equal.gsym(complex_vec_0()), @vectors.vsum_delta(), @iterate.in_numseg(), @arith.le_0()]))
  let t973 = @simp.simp_tac(@list.List([complex_pow_zero(), @class.cond_rand(), complex_mul_rzero()]))
  let t972 = @simp.asm_simp_tac(@list.List([@arith.suc_sub1(), complex_mul_lzero()]))
  let t968 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t971 = @tactics.first_x_assum(fn(x970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s966 = @tactics.mp_tac(x965)
      fn(x967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s966(x967)
      }
    })(((x969 : @kernel.Thm) => @bool.spec(t968, x969))(x970))
  })
  let t964 = @simp.asm_rewrite_tac(@list.List([]))
  let t962 = @term_syntax.parse_term("SUC((n : Num))")
  let t963 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"), t962]), complex_polyfun_extremal()))
  let t961 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules()]))
  let t957 = @term_syntax.parse_term("(b : (Num) -> Cart[Real, 2])")
  let t960 = @tactics.first_x_assum(fn(x959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s955 = @tactics.mp_tac(x954)
      fn(x956 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s955(x956)
      }
    })(((x958 : @kernel.Thm) => @bool.spec(t957, x958))(x959))
  })
  let t953 = @simp.asm_rewrite_tac(@list.List([complex_entire(), complex_sub_0(), @arith.suc_sub1(), @sets.set_rule(@term_syntax.parse_term("{(z : _) | z == (a : _) || (P : (_) -> Bool)(z)} == INSERT(a, {(z : _) | P(z)})"))]))
  let t950 = @term_syntax.parse_term("(b : (Num) -> Cart[Real, 2])")
  let t952 = @tactics.disch_then((x951 : @kernel.Thm) => @tactics.x_choose_tac(t950, x951))
  let t947 = @drule.match_mp(complex_polyfun_linear_factor_root())
  let t949 = @tactics.first_assum(fn(x948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x944 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s945 = @tactics.mp_tac(x944)
      fn(x946 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s945(x946)
      }
    })(t947(x948))
  })
  let t943 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t939 = @simp.gen_rewrite_rule(fn(x938 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x938
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t940 = @tactics.x_choose_then(@term_syntax.parse_term("(a : Cart[Real, 2])"))(fn(x935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s936 = @tactics.mp_tac(x935)
    fn(x937 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s936(x937)
    }
  })
  let t942 = @tactics.first_x_assum(fn(x941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t940(t939(x941))
  })
  let t934 = @simp.asm_rewrite_tac(@list.List([@sets.finite_rules(), @sets.card_clauses(), @arith.le_0()]))
  let t933 = @class.asm_cases_tac(@term_syntax.parse_term("{(z : Cart[Real, 2]) | vsum(op_dot_dot(0, SUC((n : Num))), (i : Num) => complex_mul((c : (Num) -> Cart[Real, 2])(i), complex_pow(z, i))) == Cx(real_of_num(0))} == {}"))
  let t931 = @simp.rewrite_tac(@list.List([@sets.empty_gspec(), @sets.finite_rules(), @sets.card_clauses(), @arith.le_refl()]))
  let t930 = @simp.asm_rewrite_tac(@list.List([complex_mul_rid()]))
  let t929 = @class.asm_cases_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])(0) == Cx(real_of_num(0))"))
  let t932 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@iterate.numseg_sing(), @vectors.vsum_sing(), @sets.in_sing(), complex_pow()])), t929), t930), t931), @tactics.all_tac])
  let t994 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → (b : Bool)) == (a || b)"))])), @nums.induct_tac), @tactics.gen_tac), t932), t933), t934), t942), t943), @tactics.disch_tac), t949), t952), t953), t960), @tactics.strip_tac), t961), @list.List([@tactics.disj1_tac, @int.asm_arith_tac])), t963), t964), t971), t972), t973), t974), t975), t976), t977), t978), t985), t986), t987), t988), t989), t992), t993)
  complex_polyfun_rootbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Cart[Real, 2], !(∀ i : Num, IN(i, op_dot_dot(0, n)) → c(i) == Cx(real_of_num(0))) → FINITE({(z : Cart[Real, 2]) | vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == Cx(real_of_num(0))}) && CARD({(z : Cart[Real, 2]) | vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == Cx(real_of_num(0))}) <= n"), t994))
}

///|
let complex_polyfun_rootbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_ROOTBOUND")

///|
/// `COMPLEX_POLYFUN_ROOTBOUND`
pub fn complex_polyfun_rootbound() -> @kernel.Thm {
  complex_polyfun_rootbound_c.get()
}

///|
/// COMPLEX_POLYFUN_FINITE_ROOTS
fn step_306() -> Unit raise {
  let t1001 = @equal.gsym(@sets.infinite())
  let t1002 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : Cart[Real, 2]) | true} == UNIV")), t1001, @vectors.euclidean_space_infinite()]))
  let t1000 = @simp.simp_tac(@list.List([@equal.gsym(complex_vec_0()), @vectors.vsum_0()]))
  let t999 = @simp.simp_tac(@list.List([complex_mul_lzero()]))
  let t998 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t997 = @simp.simp_tac(@list.List([complex_polyfun_rootbound()]))
  let t996 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.not_forall_thm())]))
  let t995 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && !(b : Bool)) == !(a → b)"))]))
  let t1003 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t995), t996), @tactics.eq_tac), t997), t998), t999), t1000), t1002)
  complex_polyfun_finite_roots_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Cart[Real, 2], FINITE({(x : Cart[Real, 2]) | vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(x, i))) == Cx(real_of_num(0))}) == (∃ i : Num, IN(i, op_dot_dot(0, n)) && !(c(i) == Cx(real_of_num(0))))"), t1003))
}

///|
let complex_polyfun_finite_roots_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_FINITE_ROOTS")

///|
/// `COMPLEX_POLYFUN_FINITE_ROOTS`
pub fn complex_polyfun_finite_roots() -> @kernel.Thm {
  complex_polyfun_finite_roots_c.get()
}

///|
/// COMPLEX_POLYFUN_EQ_0
fn step_307() -> Unit raise {
  let t1013 = @simp.rewrite_tac(@list.List([@equal.gsym(complex_vec_0()), @vectors.vsum_0()]))
  let t1014 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.in_numseg(), @arith.le_0(), complex_mul_lzero()])), t1013)
  let t1011 = @sets.set_rule(@term_syntax.parse_term("{(x : Cart[Real, 2]) | true} == UNIV"))
  let t1012 = @simp.asm_rewrite_tac(@list.List([@vectors.euclidean_space_infinite(), @equal.gsym(@sets.infinite()), @class.de_morgan_thm(), t1011]))
  let t1008 = @drule.match_mp(complex_polyfun_rootbound())
  let t1010 = @tactics.disch_then(fn(x1009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1006 = @tactics.mp_tac(x1005)
      fn(x1007 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1006(x1007)
      }
    })(t1008(x1009))
  })
  let t1015 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1004 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1004
  }, @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == !!p"))])), t1010), t1012), t1014])
  let t1016 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), @tactics.disch_tac), t1015)
  complex_polyfun_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Cart[Real, 2], (∀ z : Cart[Real, 2], vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == Cx(real_of_num(0))) == (∀ i : Num, IN(i, op_dot_dot(0, n)) → c(i) == Cx(real_of_num(0)))"), t1016))
}

///|
let complex_polyfun_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_EQ_0")

///|
/// `COMPLEX_POLYFUN_EQ_0`
pub fn complex_polyfun_eq_0() -> @kernel.Thm {
  complex_polyfun_eq_0_c.get()
}

///|
/// COMPLEX_POLYFUN_EQ_CONST
fn step_308() -> Unit raise {
  let t1028 = @meson.meson_tac(@list.List([@arith.le_1()]))
  let t1027 = @simp.simp_tac(@list.List([@arith.le_0(), complex_sub_0()]))
  let t1026 = @simp.gen_rewrite_tac(fn(x1023 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1024 = @equal.land_conv(x1023)
    fn(x1025 : @kernel.Term) -> @kernel.Thm raise {
      s1024(x1025)
    }
  }, @list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (∀ n : Num, !(n == 0) → P(n)))"))]))
  let t1029 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_polyfun_eq_0(), @iterate.in_numseg(), @arith.le_0()])), t1026), t1027), t1028)
  let t1022 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t1021 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1020 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t1019 = @simp.rewrite_tac(@list.List([complex_ring(@term_syntax.parse_term("((c : Cart[Real, 2]) - (k : Cart[Real, 2]) + (s : Cart[Real, 2]) == Cx(real_of_num(0))) == (c + s == k)"))]))
  let t1030 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.vsum_clauses_left(), @arith.le_0(), complex_pow(), complex_mul_rid()])), t1019), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1020), @tactics.gen_tac), t1021), @class.cond_cases_tac), t1022), t1029])
  let t1018 = @tactics.exists_tac(@term_syntax.parse_term("∀ x : Cart[Real, 2], vsum(op_dot_dot(0, (n : Num)), (i : Num) => complex_mul(if i == 0 { (c : (Num) -> Cart[Real, 2])(0) - (k : Cart[Real, 2]) } else { c(i) }, complex_pow(x, i))) == Cx(real_of_num(0))"))
  let t1017 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1031 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1017), t1018), @tactics.conj_tac), t1030)
  complex_polyfun_eq_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ k : Cart[Real, 2], (∀ z : Cart[Real, 2], vsum(op_dot_dot(0, n), (i : Num) => complex_mul(c(i), complex_pow(z, i))) == k) == (c(0) == k && (∀ i : Num, IN(i, op_dot_dot(1, n)) → c(i) == Cx(real_of_num(0))))"), t1031))
}

///|
let complex_polyfun_eq_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POLYFUN_EQ_CONST")

///|
/// `COMPLEX_POLYFUN_EQ_CONST`
pub fn complex_polyfun_eq_const() -> @kernel.Thm {
  complex_polyfun_eq_const_c.get()
}

///|
/// cproduct
fn step_309() -> Unit raise {
  cproduct_c.set(@pair.new_definition(@term_syntax.parse_term("(cproduct : ((_) -> Bool, (_) -> Cart[Real, 2]) -> Cart[Real, 2]) == iterate(complex_mul)")))
}

///|
let cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cproduct")

///|
/// `cproduct`
pub fn cproduct() -> @kernel.Thm {
  cproduct_c.get()
}

///|
/// NEUTRAL_COMPLEX_MUL
fn step_310() -> Unit raise {
  let t1033 = @meson.meson_tac(@list.List([complex_mul_lid(), complex_mul_rid()]))
  let t1032 = @tactics.match_mp_tac(@class.select_unique())
  let t1034 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t1032), t1033)
  neutral_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("neutral(complex_mul) == Cx(real_of_num(1))"), t1034))
}

///|
let neutral_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_COMPLEX_MUL")

///|
/// `NEUTRAL_COMPLEX_MUL`
pub fn neutral_complex_mul() -> @kernel.Thm {
  neutral_complex_mul_c.get()
}

///|
/// MONOIDAL_COMPLEX_MUL
fn step_311() -> Unit raise {
  let t1035 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_complex_mul()])), simple_complex_arith_tac)
  monoidal_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("monoidal(complex_mul)"), t1035))
}

///|
let monoidal_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_COMPLEX_MUL")

///|
/// `MONOIDAL_COMPLEX_MUL`
pub fn monoidal_complex_mul() -> @kernel.Thm {
  monoidal_complex_mul_c.get()
}

///|
/// CPRODUCT_CLAUSES
fn step_312() -> Unit raise {
  let t1038 = @simp.rewrite_tac(@list.List([monoidal_complex_mul()]))
  let t1037 = @tactics.match_mp_tac(@iterate.iterate_clauses())
  let t1036 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1039 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cproduct(), @equal.gsym(neutral_complex_mul())])), t1036), t1037), t1038)
  cproduct_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ f : (_) -> Cart[Real, 2], cproduct({}, f) == Cx(real_of_num(1))) && (∀ x : _, ∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cproduct(INSERT(x, s), f) == (if IN(x, s) { cproduct(s, f) } else { complex_mul(f(x), cproduct(s, f)) }))"), t1039))
}

///|
let cproduct_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CLAUSES")

///|
/// `CPRODUCT_CLAUSES`
pub fn cproduct_clauses() -> @kernel.Thm {
  cproduct_clauses_c.get()
}

///|
/// CPRODUCT_EQ_0
fn step_313() -> Unit raise {
  let t1041 = @meson.meson_tac(@list.List([]))
  let t1040 = @simp.simp_tac(@list.List([cproduct_clauses(), complex_entire(), @sets.in_insert(), cx_inj(), @realax.real_of_num_eq(), @calc_num.arith(), @sets.not_in_empty()]))
  let t1042 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t1040), t1041)
  cproduct_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → (cproduct(s, f) == Cx(real_of_num(0))) == (∃ x : _, IN(x, s) && f(x) == Cx(real_of_num(0)))"), t1042))
}

///|
let cproduct_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_EQ_0")

///|
/// `CPRODUCT_EQ_0`
pub fn cproduct_eq_0() -> @kernel.Thm {
  cproduct_eq_0_c.get()
}

///|
/// CPRODUCT_INV
fn step_314() -> Unit raise {
  let t1043 = @simp.simp_tac(@list.List([cproduct_clauses(), complex_inv_1(), complex_inv_mul()]))
  let t1044 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t1043)
  cproduct_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cproduct(s, (x : _) => complex_inv(f(x))) == complex_inv(cproduct(s, f))"), t1044))
}

///|
let cproduct_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_INV")

///|
/// `CPRODUCT_INV`
pub fn cproduct_inv() -> @kernel.Thm {
  cproduct_inv_c.get()
}

///|
/// CPRODUCT_MUL
fn step_315() -> Unit raise {
  let t1046 = @simp.simp_tac(@list.List([cproduct_clauses(), complex_mul_ac(), complex_mul_lid()]))
  let t1045 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1047 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t1045), t1046)
  cproduct_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cproduct(s, (x : _) => complex_mul(f(x), g(x))) == complex_mul(cproduct(s, f), cproduct(s, g))"), t1047))
}

///|
let cproduct_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_MUL")

///|
/// `CPRODUCT_MUL`
pub fn cproduct_mul() -> @kernel.Thm {
  cproduct_mul_c.get()
}

///|
/// CPRODUCT_EQ_1
fn step_316() -> Unit raise {
  let t1048 = @simp.simp_tac(@list.List([@iterate.iterate_eq_neutral(), monoidal_complex_mul()]))
  let t1049 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cproduct(), @equal.gsym(neutral_complex_mul())])), t1048)
  cproduct_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 2], ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == Cx(real_of_num(1))) → cproduct(s, f) == Cx(real_of_num(1))"), t1049))
}

///|
let cproduct_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_EQ_1")

///|
/// `CPRODUCT_EQ_1`
pub fn cproduct_eq_1() -> @kernel.Thm {
  cproduct_eq_1_c.get()
}

///|
/// CPRODUCT_1
fn step_317() -> Unit raise {
  let t1050 = @simp.simp_tac(@list.List([cproduct_eq_1()]))
  cproduct_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, cproduct(s, (n : _) => Cx(real_of_num(1))) == Cx(real_of_num(1))"), t1050))
}

///|
let cproduct_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_1")

///|
/// `CPRODUCT_1`
pub fn cproduct_1() -> @kernel.Thm {
  cproduct_1_c.get()
}

///|
/// CPRODUCT_POW
fn step_318() -> Unit raise {
  let t1052 = @simp.asm_simp_tac(@list.List([complex_pow(), cproduct_mul(), cproduct_1()]))
  let t1051 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t1053 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t1051), @tactics.disch_tac), @nums.induct_tac), t1052)
  cproduct_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, ∀ n : Num, FINITE(s) → cproduct(s, (x : _) => complex_pow(f(x), n)) == complex_pow(cproduct(s, f), n)"), t1053))
}

///|
let cproduct_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_POW")

///|
/// `CPRODUCT_POW`
pub fn cproduct_pow() -> @kernel.Thm {
  cproduct_pow_c.get()
}

///|
/// NORM_CPRODUCT
fn step_319() -> Unit raise {
  let t1054 = @simp.simp_tac(@list.List([cproduct_clauses(), complex_norm_cx(), @calc_int.real_abs_num(), cproduct_mul(), @iterate.product_clauses(), complex_norm_mul()]))
  let t1055 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t1054)
  norm_cproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → norm(cproduct(s, f)) == product(s, (x : _) => norm(f(x)))"), t1055))
}

///|
let norm_cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CPRODUCT")

///|
/// `NORM_CPRODUCT`
pub fn norm_cproduct() -> @kernel.Thm {
  norm_cproduct_c.get()
}

///|
/// CPRODUCT_EQ
fn step_320() -> Unit raise {
  let t1057 = @simp.rewrite_tac(@list.List([monoidal_complex_mul()]))
  let t1056 = @tactics.match_mp_tac(@iterate.iterate_eq())
  let t1058 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cproduct()])), t1056), t1057)
  cproduct_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → cproduct(s, f) == cproduct(s, g)"), t1058))
}

///|
let cproduct_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_EQ")

///|
/// `CPRODUCT_EQ`
pub fn cproduct_eq() -> @kernel.Thm {
  cproduct_eq_c.get()
}

///|
/// CPRODUCT_SING
fn step_321() -> Unit raise {
  let t1059 = @simp.simp_tac(@list.List([cproduct_clauses(), @sets.finite_rules(), @sets.not_in_empty(), complex_mul_rid()]))
  cproduct_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ x : _, cproduct({x}, f) == f(x)"), t1059))
}

///|
let cproduct_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_SING")

///|
/// `CPRODUCT_SING`
pub fn cproduct_sing() -> @kernel.Thm {
  cproduct_sing_c.get()
}

///|
/// CPRODUCT_CLAUSES_NUMSEG
fn step_322() -> Unit raise {
  let t1062 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")), complex_mul_ac()]))
  let t1061 = @simp.asm_simp_tac(@list.List([cproduct_sing(), cproduct_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1060 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1063 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])), t1060), @class.cond_cases_tac), t1061), t1062)
  cproduct_clauses_numseg_c.set(@tactics.prove(@term_syntax.parse_term("(∀ m : Num, cproduct(op_dot_dot(m, 0), (f : (Num) -> Cart[Real, 2])) == (if m == 0 { f(0) } else { Cx(real_of_num(1)) })) && (∀ m : Num, ∀ n : Num, cproduct(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { complex_mul(cproduct(op_dot_dot(m, n), f), f(SUC(n))) } else { cproduct(op_dot_dot(m, n), f) }))"), t1063))
}

///|
let cproduct_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CLAUSES_NUMSEG")

///|
/// `CPRODUCT_CLAUSES_NUMSEG`
pub fn cproduct_clauses_numseg() -> @kernel.Thm {
  cproduct_clauses_numseg_c.get()
}

///|
/// CPRODUCT_CLAUSES_RIGHT
fn step_323() -> Unit raise {
  let t1064 = @simp.simp_tac(@list.List([@arith.lt_refl(), cproduct_clauses_numseg(), @arith.suc_sub1()]))
  let t1065 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t1064)
  cproduct_clauses_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, 0 < n && m <= n → cproduct(op_dot_dot(m, n), f) == complex_mul(cproduct(op_dot_dot(m, n - 1), f), f(n))"), t1065))
}

///|
let cproduct_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CLAUSES_RIGHT")

///|
/// `CPRODUCT_CLAUSES_RIGHT`
pub fn cproduct_clauses_right() -> @kernel.Thm {
  cproduct_clauses_right_c.get()
}

///|
/// CPRODUCT_CLAUSES_LEFT
fn step_324() -> Unit raise {
  let t1066 = @tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec()), cproduct_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()])), @int.arith_tac)
  cproduct_clauses_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n → cproduct(op_dot_dot(m, n), f) == complex_mul(f(m), cproduct(op_dot_dot(m + 1, n), f))"), t1066))
}

///|
let cproduct_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CLAUSES_LEFT")

///|
/// `CPRODUCT_CLAUSES_LEFT`
pub fn cproduct_clauses_left() -> @kernel.Thm {
  cproduct_clauses_left_c.get()
}

///|
/// CPRODUCT_IMAGE
fn step_325() -> Unit raise {
  let t1068 = @simp.rewrite_tac(@list.List([monoidal_complex_mul()]))
  let t1067 = @tactics.match_mp_tac(@iterate.iterate_image())
  let t1069 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cproduct(), @equal.gsym(neutral_complex_mul())])), t1067), t1068)
  cproduct_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → cproduct(IMAGE(f, s), g) == cproduct(s, o(g, f))"), t1069))
}

///|
let cproduct_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_IMAGE")

///|
/// `CPRODUCT_IMAGE`
pub fn cproduct_image() -> @kernel.Thm {
  cproduct_image_c.get()
}

///|
/// CPRODUCT_OFFSET
fn step_326() -> Unit raise {
  let t1070 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1071 = @tactics.then_tac(@simp.simp_tac(@list.List([@iterate.numseg_offset_image(), cproduct_image(), @arith.eq_add_rcancel(), @iterate.finite_numseg()])), t1070)
  cproduct_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ p : Num, cproduct(op_dot_dot(m + p, (n : Num) + p), f) == cproduct(op_dot_dot(m, n), (i : Num) => f(i + p))"), t1071))
}

///|
let cproduct_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_OFFSET")

///|
/// `CPRODUCT_OFFSET`
pub fn cproduct_offset() -> @kernel.Thm {
  cproduct_offset_c.get()
}

///|
/// CPRODUCT_CONST
fn step_327() -> Unit raise {
  let t1072 = @simp.simp_tac(@list.List([cproduct_clauses(), @sets.card_clauses(), complex_pow()]))
  let t1073 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t1072)
  cproduct_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cproduct(s, (x : _) => c) == complex_pow(c, CARD(s))"), t1073))
}

///|
let cproduct_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CONST")

///|
/// `CPRODUCT_CONST`
pub fn cproduct_const() -> @kernel.Thm {
  cproduct_const_c.get()
}

///|
/// CPRODUCT_CONST_NUMSEG
fn step_328() -> Unit raise {
  let t1074 = @simp.simp_tac(@list.List([cproduct_const(), @iterate.card_numseg(), @iterate.finite_numseg()]))
  cproduct_const_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ m : Num, ∀ n : Num, cproduct(op_dot_dot(m, n), (x : Num) => c) == complex_pow(c, n + 1 - m)"), t1074))
}

///|
let cproduct_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_CONST_NUMSEG")

///|
/// `CPRODUCT_CONST_NUMSEG`
pub fn cproduct_const_numseg() -> @kernel.Thm {
  cproduct_const_numseg_c.get()
}

///|
/// CPRODUCT_PAIR
fn step_329() -> Unit raise {
  let t1075 = @simp.rewrite_tac(@list.List([cproduct(), neutral_complex_mul()]))
  let t1076 = @tactics.then_tac(@tactics.mp_tac(@drule.match_mp(@iterate.iterate_pair())(monoidal_complex_mul())), t1075)
  cproduct_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, cproduct(op_dot_dot(2 * m, 2 * n + 1), f) == cproduct(op_dot_dot(m, n), (i : Num) => complex_mul(f(2 * i), f(2 * i + 1)))"), t1076))
}

///|
let cproduct_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_PAIR")

///|
/// `CPRODUCT_PAIR`
pub fn cproduct_pair() -> @kernel.Thm {
  cproduct_pair_c.get()
}

///|
/// CPRODUCT_REFLECT
fn step_330() -> Unit raise {
  let t1082 = @simp.rewrite_tac(@list.List([neutral_complex_mul()]))
  let t1081 = @simp.gen_rewrite_tac(fn(x1078 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1079 = @equal.land_conv(x1078)
    fn(x1080 : @kernel.Term) -> @kernel.Thm raise {
      s1079(x1080)
    }
  }, @list.List([@drule.match_mp(@iterate.iterate_reflect())(monoidal_complex_mul())]))
  let t1077 = @simp.rewrite_tac(@list.List([cproduct()]))
  let t1083 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1077), t1081), t1082)
  cproduct_reflect_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, cproduct(op_dot_dot(m, n), x) == (if n < m { Cx(real_of_num(1)) } else { cproduct(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"), t1083))
}

///|
let cproduct_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_REFLECT")

///|
/// `CPRODUCT_REFLECT`
pub fn cproduct_reflect() -> @kernel.Thm {
  cproduct_reflect_c.get()
}

///|
/// CNJ_CPRODUCT
fn step_331() -> Unit raise {
  let t1084 = @simp.simp_tac(@list.List([cproduct_clauses(), cnj_mul(), cnj_cx()]))
  let t1085 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t1084)
  cnj_cproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, FINITE(s) → cnj(cproduct(s, f)) == cproduct(s, (i : _) => cnj(f(i)))"), t1085))
}

///|
let cnj_cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_CPRODUCT")

///|
/// `CNJ_CPRODUCT`
pub fn cnj_cproduct() -> @kernel.Thm {
  cnj_cproduct_c.get()
}

///|
/// CX_PRODUCT
fn step_332() -> Unit raise {
  let t1087 = @simp.simp_tac(@list.List([cproduct_clauses(), @iterate.product_clauses(), @equal.gsym(cx_mul())]))
  let t1086 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1088 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))), t1086), t1087)
  cx_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → Cx(product(s, f)) == cproduct(s, (i : _) => Cx(f(i)))"), t1088))
}

///|
let cx_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_PRODUCT")

///|
/// `CX_PRODUCT`
pub fn cx_product() -> @kernel.Thm {
  cx_product_c.get()
}

///|
/// CPRODUCT_SUPERSET
fn step_333() -> Unit raise {
  let t1089 = @simp.rewrite_tac(@list.List([@drule.match_mp(@iterate.iterate_superset())(monoidal_complex_mul())]))
  let t1090 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cproduct(), @equal.gsym(neutral_complex_mul())])), t1089)
  cproduct_superset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 2], ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == Cx(real_of_num(1))) → cproduct(v, f) == cproduct(u, f)"), t1090))
}

///|
let cproduct_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_SUPERSET")

///|
/// `CPRODUCT_SUPERSET`
pub fn cproduct_superset() -> @kernel.Thm {
  cproduct_superset_c.get()
}

///|
/// CPRODUCT_UNION
fn step_334() -> Unit raise {
  let t1091 = @simp.simp_tac(@list.List([cproduct(), @iterate.iterate_union(), monoidal_complex_mul()]))
  cproduct_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → cproduct(UNION(s, t), f) == complex_mul(cproduct(s, f), cproduct(t, f))"), t1091))
}

///|
let cproduct_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPRODUCT_UNION")

///|
/// `CPRODUCT_UNION`
pub fn cproduct_union() -> @kernel.Thm {
  cproduct_union_c.get()
}

///|
/// Multivariate/complexes.ml:2240
fn step_335() -> Unit raise {
  let t1093 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg()]))
  let t1092 = @tactics.match_mp_tac(cproduct_eq())
  let t1094 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1092), t1093)
  let th = @tactics.prove(@term_syntax.parse_term("(∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → cproduct(s, (i : _) => f(i)) == cproduct(s, g)) && (∀ f : (Num) -> Cart[Real, 2], ∀ g : (Num) -> Cart[Real, 2], ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → cproduct(op_dot_dot(a, b), (i : Num) => f(i)) == cproduct(op_dot_dot(a, b), g)) && (∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → cproduct({(y : _) | p(y)}, (i : _) => f(i)) == cproduct({(y : _) | p(y)}, g))"), t1094)
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
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
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
  step_298()
  step_299()
  step_300()
  step_301()
  step_302()
  step_303()
  step_304()
  step_305()
  step_306()
  step_307()
  step_308()
  step_309()
  step_310()
  step_311()
  step_312()
  step_313()
  step_314()
  step_315()
  step_316()
  step_317()
  step_318()
  step_319()
  step_320()
  step_321()
  step_322()
  step_323()
  step_324()
  step_325()
  step_326()
  step_327()
  step_328()
  step_329()
  step_330()
  step_331()
  step_332()
  step_333()
  step_334()
  step_335()
}
