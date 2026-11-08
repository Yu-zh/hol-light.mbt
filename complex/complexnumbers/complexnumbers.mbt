// Translated from upstream Complex/complexnumbers.ml; edit this file directly.

///|
/// Complex/complexnumbers.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// complex_tybij_raw
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([]))
  complex_tybij_raw_c.set(@class.new_type_definition("complex", ("complex", "coords"), @tactics.prove(@term_syntax.parse_term("∃ x : (Real, Real), true"), t1)))
}

///|
let complex_tybij_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_tybij_raw")

///|
/// `complex_tybij_raw`
pub fn complex_tybij_raw() -> @kernel.Thm {
  complex_tybij_raw_c.get()
}

///|
/// complex_tybij
fn step_3() -> Unit raise {
  complex_tybij_c.set(@simp.rewrite_rule(@list.List([]))(complex_tybij_raw()))
}

///|
let complex_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_tybij")

///|
/// `complex_tybij`
pub fn complex_tybij() -> @kernel.Thm {
  complex_tybij_c.get()
}

///|
/// RE_DEF
fn step_4() -> Unit raise {
  re_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Re : (Complex) -> Real)((z : Complex)) == FST(coords(z))")))
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
fn step_5() -> Unit raise {
  im_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Im : (Complex) -> Real)((z : Complex)) == SND(coords(z))")))
}

///|
let im_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_DEF")

///|
/// `IM_DEF`
pub fn im_def() -> @kernel.Thm {
  im_def_c.get()
}

///|
/// Complex/complexnumbers.ml:33
fn step_6() -> Unit raise {
  let t3 = ("inv", @term_syntax.parse_term("(complex_inv : (Complex) -> Complex)"))
  let t4 = ("pow", @term_syntax.parse_term("(complex_pow : (Complex, Num) -> Complex)"))
  let t5 = ("--", @term_syntax.parse_term("(complex_neg : (Complex) -> Complex)"))
  let t6 = ("/", @term_syntax.parse_term("(complex_div : (Complex, Complex) -> Complex)"))
  let t7 = ("*", @term_syntax.parse_term("(complex_mul : (Complex, Complex) -> Complex)"))
  let t8 = ("-", @term_syntax.parse_term("(complex_sub : (Complex, Complex) -> Complex)"))
  @lib.do_list(fn(x2 : (String, @kernel.Term)) -> Unit raise {
    @preterm.overload_interface(x2.0, x2.1)
  }, @list.List([("+", @term_syntax.parse_term("(complex_add : (Complex, Complex) -> Complex)")), t8, t7, t6, t5, t4, t3]))
}

///|
/// `prioritize_complex`
pub fn prioritize_complex(x9 : Unit) -> Unit raise {
  let _ = x9
  @preterm.prioritize_overload(@kernel.mk_type("complex", @list.List([])))
}

///|
/// Complex/complexnumbers.ml:48
fn step_7() -> Unit raise {
  @preterm.make_overloadable("norm", @term_syntax.parse_type("(A) -> Real"))
}

///|
/// Complex/complexnumbers.ml:49
fn step_8() -> Unit raise {
  @preterm.overload_interface("norm", @term_syntax.parse_term("(complex_norm : (Complex) -> Real)"))
}

///|
/// complex_norm
fn step_9() -> Unit raise {
  complex_norm_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_norm : (Complex) -> Real)((z : Complex)) == sqrt(pow(Re(z), 2) + pow(Im(z), 2))")))
}

///|
let complex_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_norm")

///|
/// `complex_norm`
pub fn complex_norm() -> @kernel.Thm {
  complex_norm_c.get()
}

///|
/// ii
fn step_10() -> Unit raise {
  ii_c.set(@pair.new_definition(@term_syntax.parse_term("(ii : Complex) == complex((real_of_num(0), real_of_num(1)))")))
}

///|
let ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ii")

///|
/// `ii`
pub fn ii() -> @kernel.Thm {
  ii_c.get()
}

///|
/// CX_DEF
fn step_11() -> Unit raise {
  cx_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Cx : (Real) -> Complex)((a : Real)) == complex((a, real_of_num(0)))")))
}

///|
let cx_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_DEF")

///|
/// `CX_DEF`
pub fn cx_def() -> @kernel.Thm {
  cx_def_c.get()
}

///|
/// complex_neg
fn step_12() -> Unit raise {
  complex_neg_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_neg : (Complex) -> Complex)((z : Complex)) == complex((-Re(z), -Im(z)))")))
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
fn step_13() -> Unit raise {
  complex_add_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_add : (Complex, Complex) -> Complex)((w : Complex), (z : Complex)) == complex((Re(w) + Re(z), Im(w) + Im(z)))")))
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
fn step_14() -> Unit raise {
  complex_sub_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_sub : (Complex, Complex) -> Complex)((w : Complex), (z : Complex)) == complex_add(w, complex_neg(z))")))
}

///|
let complex_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_sub")

///|
/// `complex_sub`
pub fn complex_sub() -> @kernel.Thm {
  complex_sub_c.get()
}

///|
/// complex_mul
fn step_15() -> Unit raise {
  complex_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_mul : (Complex, Complex) -> Complex)((w : Complex), (z : Complex)) == complex((Re(w) * Re(z) - Im(w) * Im(z), Re(w) * Im(z) + Im(w) * Re(z)))")))
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
fn step_16() -> Unit raise {
  complex_inv_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_inv : (Complex) -> Complex)((z : Complex)) == complex((Re(z) / (pow(Re(z), 2) + pow(Im(z), 2)), -Im(z) / (pow(Re(z), 2) + pow(Im(z), 2))))")))
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
fn step_17() -> Unit raise {
  complex_div_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_div : (Complex, Complex) -> Complex)((w : Complex), (z : Complex)) == complex_mul(w, complex_inv(z))")))
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
fn step_18() -> Unit raise {
  let t10 = @term_syntax.parse_term("(complex_pow : (Complex, Num) -> Complex)((x : Complex), 0) == Cx(real_of_num(1)) && (∀ n : Num, complex_pow(x, SUC(n)) == complex_mul(x, complex_pow(x, n)))")
  complex_pow_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t10))
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
fn step_19() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([re_def(), complex_tybij()]))
  re_c.set(@tactics.prove(@term_syntax.parse_term("Re(complex(((x : Real), (y : Real)))) == x"), t11))
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
fn step_20() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([im_def(), complex_tybij()]))
  im_c.set(@tactics.prove(@term_syntax.parse_term("Im(complex(((x : Real), (y : Real)))) == y"), t12))
}

///|
let im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM")

///|
/// `IM`
pub fn im() -> @kernel.Thm {
  im_c.get()
}

///|
/// COMPLEX
fn step_21() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([im_def(), re_def(), complex_tybij()]))
  complex_c.set(@tactics.prove(@term_syntax.parse_term("complex((Re((z : Complex)), Im(z))) == z"), t13))
}

///|
let complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX")

///|
/// `COMPLEX`
pub fn complex() -> @kernel.Thm {
  complex_c.get()
}

///|
/// COMPLEX_EQ
fn step_22() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([complex_tybij()]))
  let t15 = @tactics.then_tac(@simp.rewrite_tac(@list.List([re_def(), im_def(), @equal.gsym(@pair.pair_eq())])), t14)
  complex_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, (w == z) == (Re(w) == Re(z) && Im(w) == Im(z))"), t15))
}

///|
let complex_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ")

///|
/// `COMPLEX_EQ`
pub fn complex_eq() -> @kernel.Thm {
  complex_eq_c.get()
}

///|
/// SIMPLE_COMPLEX_ARITH_TAC
fn step_23() -> Unit raise {
  simple_complex_arith_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), re(), im(), cx_def(), complex_add(), complex_neg(), complex_sub(), complex_mul()])), @calc_rat.real_arith_tac))
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
pub fn simple_complex_arith(x16 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x16
  @tactics.prove(tm, simple_complex_arith_tac)
}

///|
/// COMPLEX_ADD_SYM
fn step_24() -> Unit raise {
  complex_add_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_add(x, y) == complex_add(y, x)"), simple_complex_arith_tac))
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
fn step_25() -> Unit raise {
  complex_add_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_add(x, complex_add(y, z)) == complex_add(complex_add(x, y), z)"), simple_complex_arith_tac))
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
fn step_26() -> Unit raise {
  complex_add_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_add(Cx(real_of_num(0)), x) == x"), simple_complex_arith_tac))
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
fn step_27() -> Unit raise {
  complex_add_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_add(complex_neg(x), x) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_28() -> Unit raise {
  complex_mul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_mul(x, y) == complex_mul(y, x)"), simple_complex_arith_tac))
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
fn step_29() -> Unit raise {
  complex_mul_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(x, complex_mul(y, z)) == complex_mul(complex_mul(x, y), z)"), simple_complex_arith_tac))
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
fn step_30() -> Unit raise {
  complex_mul_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_mul(Cx(real_of_num(1)), x) == x"), simple_complex_arith_tac))
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
fn step_31() -> Unit raise {
  complex_add_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(x, complex_add(y, z)) == complex_add(complex_mul(x, y), complex_mul(x, z))"), simple_complex_arith_tac))
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
fn step_32() -> Unit raise {
  complex_add_ac_c.set(@tactics.prove(@term_syntax.parse_term("complex_add((m : Complex), (n : Complex)) == complex_add(n, m) && complex_add(complex_add(m, n), (p : Complex)) == complex_add(m, complex_add(n, p)) && complex_add(m, complex_add(n, p)) == complex_add(n, complex_add(m, p))"), simple_complex_arith_tac))
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
fn step_33() -> Unit raise {
  complex_mul_ac_c.set(@tactics.prove(@term_syntax.parse_term("complex_mul((m : Complex), (n : Complex)) == complex_mul(n, m) && complex_mul(complex_mul(m, n), (p : Complex)) == complex_mul(m, complex_mul(n, p)) && complex_mul(m, complex_mul(n, p)) == complex_mul(n, complex_mul(m, p))"), simple_complex_arith_tac))
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
fn step_34() -> Unit raise {
  complex_add_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_add(x, Cx(real_of_num(0))) == x"), simple_complex_arith_tac))
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
fn step_35() -> Unit raise {
  complex_mul_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_mul(x, Cx(real_of_num(1))) == x"), simple_complex_arith_tac))
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
fn step_36() -> Unit raise {
  complex_add_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_add(x, complex_neg(x)) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_37() -> Unit raise {
  complex_add_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(complex_add(x, y), z) == complex_add(complex_mul(x, z), complex_mul(y, z))"), simple_complex_arith_tac))
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
fn step_38() -> Unit raise {
  complex_eq_add_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_add(x, y) == complex_add(x, z)) == (y == z)"), simple_complex_arith_tac))
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
fn step_39() -> Unit raise {
  complex_eq_add_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_add(x, z) == complex_add(y, z)) == (x == y)"), simple_complex_arith_tac))
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
fn step_40() -> Unit raise {
  complex_mul_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_mul(x, Cx(real_of_num(0))) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_41() -> Unit raise {
  complex_mul_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_42() -> Unit raise {
  complex_neg_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_neg(complex_neg(x)) == x"), simple_complex_arith_tac))
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
fn step_43() -> Unit raise {
  complex_mul_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_mul(x, complex_neg(y)) == complex_neg(complex_mul(x, y))"), simple_complex_arith_tac))
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
fn step_44() -> Unit raise {
  complex_mul_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_mul(complex_neg(x), y) == complex_neg(complex_mul(x, y))"), simple_complex_arith_tac))
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
fn step_45() -> Unit raise {
  complex_neg_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_neg(complex_add(x, y)) == complex_add(complex_neg(x), complex_neg(y))"), simple_complex_arith_tac))
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
fn step_46() -> Unit raise {
  complex_neg_0_c.set(@tactics.prove(@term_syntax.parse_term("complex_neg(Cx(real_of_num(0))) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_47() -> Unit raise {
  complex_eq_add_lcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_add(x, y) == x) == (y == Cx(real_of_num(0)))"), simple_complex_arith_tac))
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
fn step_48() -> Unit raise {
  complex_eq_add_rcancel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_add(x, y) == y) == (x == Cx(real_of_num(0)))"), simple_complex_arith_tac))
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
fn step_49() -> Unit raise {
  complex_lneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_add(x, y) == Cx(real_of_num(0))) == (x == complex_neg(y))"), simple_complex_arith_tac))
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
fn step_50() -> Unit raise {
  complex_rneg_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_add(x, y) == Cx(real_of_num(0))) == (y == complex_neg(x))"), simple_complex_arith_tac))
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
fn step_51() -> Unit raise {
  complex_neg_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_neg(complex_mul(x, y)) == complex_mul(complex_neg(x), y)"), simple_complex_arith_tac))
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
fn step_52() -> Unit raise {
  complex_neg_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_neg(complex_mul(x, y)) == complex_mul(x, complex_neg(y))"), simple_complex_arith_tac))
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
fn step_53() -> Unit raise {
  complex_neg_mul2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_mul(complex_neg(x), complex_neg(y)) == complex_mul(x, y)"), simple_complex_arith_tac))
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
fn step_54() -> Unit raise {
  complex_sub_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_add(complex_sub(x, y), y) == x"), simple_complex_arith_tac))
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
fn step_55() -> Unit raise {
  complex_sub_add2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_add(y, complex_sub(x, y)) == x"), simple_complex_arith_tac))
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
fn step_56() -> Unit raise {
  complex_sub_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_sub(x, x) == Cx(real_of_num(0))"), simple_complex_arith_tac))
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
fn step_57() -> Unit raise {
  complex_sub_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_sub(x, y) == Cx(real_of_num(0))) == (x == y)"), simple_complex_arith_tac))
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
fn step_58() -> Unit raise {
  complex_neg_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, (complex_neg(x) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)))"), simple_complex_arith_tac))
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
fn step_59() -> Unit raise {
  complex_neg_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_neg(complex_sub(x, y)) == complex_sub(y, x)"), simple_complex_arith_tac))
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
fn step_60() -> Unit raise {
  complex_add_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(complex_add(x, y), x) == y"), simple_complex_arith_tac))
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
fn step_61() -> Unit raise {
  complex_neg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_neg(x) == y) == (x == complex_neg(y))"), simple_complex_arith_tac))
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
fn step_62() -> Unit raise {
  complex_neg_minus1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_neg(x) == complex_mul(complex_neg(Cx(real_of_num(1))), x)"), simple_complex_arith_tac))
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
fn step_63() -> Unit raise {
  complex_sub_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(complex_sub(x, y), x) == complex_neg(y)"), simple_complex_arith_tac))
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
fn step_64() -> Unit raise {
  complex_add2_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, ∀ c : Complex, ∀ d : Complex, complex_sub(complex_add(a, b), complex_add(c, d)) == complex_add(complex_sub(a, c), complex_sub(b, d))"), simple_complex_arith_tac))
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
fn step_65() -> Unit raise {
  complex_sub_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_sub(Cx(real_of_num(0)), x) == complex_neg(x)"), simple_complex_arith_tac))
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
fn step_66() -> Unit raise {
  complex_sub_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_sub(x, Cx(real_of_num(0))) == x"), simple_complex_arith_tac))
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
fn step_67() -> Unit raise {
  complex_sub_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(complex_neg(x), y) == complex_neg(complex_add(x, y))"), simple_complex_arith_tac))
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
fn step_68() -> Unit raise {
  complex_sub_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(x, complex_neg(y)) == complex_add(x, y)"), simple_complex_arith_tac))
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
fn step_69() -> Unit raise {
  complex_sub_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(complex_neg(x), complex_neg(y)) == complex_sub(y, x)"), simple_complex_arith_tac))
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
fn step_70() -> Unit raise {
  complex_sub_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, ∀ c : Complex, complex_add(complex_sub(a, b), complex_sub(b, c)) == complex_sub(a, c)"), simple_complex_arith_tac))
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
fn step_71() -> Unit raise {
  complex_eq_sub_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (x == complex_sub(y, z)) == (complex_add(x, z) == y)"), simple_complex_arith_tac))
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
fn step_72() -> Unit raise {
  complex_eq_sub_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_sub(x, y) == z) == (x == complex_add(z, y))"), simple_complex_arith_tac))
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
fn step_73() -> Unit raise {
  complex_sub_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(x, complex_sub(x, y)) == y"), simple_complex_arith_tac))
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
fn step_74() -> Unit raise {
  complex_add_sub2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_sub(x, complex_add(x, y)) == complex_neg(y)"), simple_complex_arith_tac))
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
fn step_75() -> Unit raise {
  complex_diffsq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, complex_mul(complex_add(x, y), complex_sub(x, y)) == complex_sub(complex_mul(x, x), complex_mul(y, y))"), simple_complex_arith_tac))
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
fn step_76() -> Unit raise {
  complex_eq_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_neg(x) == complex_neg(y)) == (x == y)"), simple_complex_arith_tac))
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
fn step_77() -> Unit raise {
  complex_sub_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(x, complex_sub(y, z)) == complex_sub(complex_mul(x, y), complex_mul(x, z))"), simple_complex_arith_tac))
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
fn step_78() -> Unit raise {
  complex_sub_rdistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(complex_sub(x, y), z) == complex_sub(complex_mul(x, z), complex_mul(y, z))"), simple_complex_arith_tac))
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
fn step_79() -> Unit raise {
  complex_mul_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(2) * x == x + x"), simple_complex_arith_tac))
}

///|
let complex_mul_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_2")

///|
/// `COMPLEX_MUL_2`
pub fn complex_mul_2() -> @kernel.Thm {
  complex_mul_2_c.get()
}

///|
/// CX_INJ
fn step_80() -> Unit raise {
  let t17 = @simp.rewrite_tac(@list.List([cx_def(), complex_eq(), re(), im()]))
  cx_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (Cx(x) == Cx(y)) == (x == y)"), t17))
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
fn step_81() -> Unit raise {
  let t18 = @simp.rewrite_tac(@list.List([cx_def(), complex_neg(), re(), im(), @analysis.real_neg_0()]))
  cx_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(-x) == complex_neg(Cx(x))"), t18))
}

///|
let cx_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_NEG")

///|
/// `CX_NEG`
pub fn cx_neg() -> @kernel.Thm {
  cx_neg_c.get()
}

///|
/// CX_INV
fn step_82() -> Unit raise {
  let t29 = @meson.asm_meson_tac(@list.List([@analysis.real_mul_rinv()]))
  let t28 = @simp.gen_rewrite_tac(fn(x25 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s26 = @equal.land_conv(x25)
    fn(x27 : @kernel.Term) -> @kernel.Thm raise {
      s26(x27)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t24 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t23 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0(), @analysis.real_mul_lzero()]))
  let t22 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t21 = @simp.rewrite_tac(@list.List([@calc_int.real_add_rid(), @real.real_inv_mul()]))
  let t20 = @simp.rewrite_tac(@list.List([complex_eq(), @realarith.real_pow_2(), @analysis.real_mul_rzero(), re(), im()]))
  let t19 = @simp.rewrite_tac(@list.List([@realax.real_div(), @analysis.real_neg_0(), @analysis.real_mul_lzero()]))
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([cx_def(), complex_inv(), re(), im()]))), t19), t20), t21), t22), t23), t24), t28), @tactics.ap_thm_tac), @tactics.ap_term_tac), t29)
  cx_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(inv(x)) == complex_inv(Cx(x))"), t30))
}

///|
let cx_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_INV")

///|
/// `CX_INV`
pub fn cx_inv() -> @kernel.Thm {
  cx_inv_c.get()
}

///|
/// CX_ADD
fn step_83() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([cx_def(), complex_add(), re(), im(), @realax.real_add_lid()]))
  cx_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x + y) == complex_add(Cx(x), Cx(y))"), t31))
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
fn step_84() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([complex_sub(), @realax.real_sub(), cx_add(), cx_neg()]))
  cx_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x - y) == complex_sub(Cx(x), Cx(y))"), t32))
}

///|
let cx_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_SUB")

///|
/// `CX_SUB`
pub fn cx_sub() -> @kernel.Thm {
  cx_sub_c.get()
}

///|
/// CX_MUL
fn step_85() -> Unit raise {
  let t33 = @simp.rewrite_tac(@list.List([@analysis.real_sub_rzero(), @calc_int.real_add_rid()]))
  let t34 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cx_def(), complex_mul(), re(), im(), @analysis.real_mul_lzero(), @analysis.real_mul_rzero()])), t33)
  cx_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x * y) == complex_mul(Cx(x), Cx(y))"), t34))
}

///|
let cx_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_MUL")

///|
/// `CX_MUL`
pub fn cx_mul() -> @kernel.Thm {
  cx_mul_c.get()
}

///|
/// CX_DIV
fn step_86() -> Unit raise {
  let t35 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), cx_mul(), cx_inv()]))
  cx_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, Cx(x / y) == complex_div(Cx(x), Cx(y))"), t35))
}

///|
let cx_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_DIV")

///|
/// `CX_DIV`
pub fn cx_div() -> @kernel.Thm {
  cx_div_c.get()
}

///|
/// CX_POW
fn step_87() -> Unit raise {
  let t36 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @realax.real_pow(), cx_mul()]))
  let t37 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t36)
  cx_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, Cx(pow(x, n)) == complex_pow(Cx(x), n)"), t37))
}

///|
let cx_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_POW")

///|
/// `CX_POW`
pub fn cx_pow() -> @kernel.Thm {
  cx_pow_c.get()
}

///|
/// CX_ABS
fn step_88() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.pow_2_sqrt_abs()]))
  let t38 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @analysis.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t40 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cx_def(), complex_norm(), complex_eq(), re(), im()])), t38), t39)
  cx_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(abs(x)) == Cx(complex_norm(Cx(x)))"), t40))
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
fn step_89() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([@equal.gsym(cx_inj()), cx_abs()]))
  complex_norm_cx_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, complex_norm(Cx(x)) == abs(x)"), t41))
}

///|
let complex_norm_cx_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_CX")

///|
/// `COMPLEX_NORM_CX`
pub fn complex_norm_cx_v1() -> @kernel.Thm {
  complex_norm_cx_v1_c.get()
}

///|
/// COMPLEX_ENTIRE
fn step_90() -> Unit raise {
  let t42 = @tactics.conv_tac(@calc_rat.real_ring)
  let t43 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_eq(), complex_mul(), re(), im(), cx_def(), @equal.gsym(@real.real_sos_eq_0())])), t42)
  complex_entire_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, (complex_mul(x, y) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)) || y == Cx(real_of_num(0)))"), t43))
}

///|
let complex_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ENTIRE")

///|
/// `COMPLEX_ENTIRE`
pub fn complex_entire() -> @kernel.Thm {
  complex_entire_c.get()
}

///|
/// COMPLEX_POW_ADD
fn step_91() -> Unit raise {
  let t44 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), complex_pow(), complex_mul_lid(), complex_mul_assoc()]))
  let t45 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t44)
  complex_pow_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ m : Num, ∀ n : Num, complex_pow(x, m + n) == complex_mul(complex_pow(x, m), complex_pow(x, n))"), t45))
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
fn step_92() -> Unit raise {
  let t46 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @arith.mult_clauses(), complex_pow_add()]))
  let t47 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t46)
  complex_pow_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ m : Num, ∀ n : Num, complex_pow(complex_pow(x, m), n) == complex_pow(x, m * n)"), t47))
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
fn step_93() -> Unit raise {
  let t48 = @simp.rewrite_tac(@list.List([complex_pow(), complex_mul_rid()]))
  let t49 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))])), t48)
  complex_pow_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_pow(x, 1) == x"), t49))
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
fn step_94() -> Unit raise {
  let t50 = @simp.rewrite_tac(@list.List([complex_pow(), complex_pow_1()]))
  let t51 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2"))])), t50)
  complex_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_pow(x, 2) == complex_mul(x, x)"), t51))
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
fn step_95() -> Unit raise {
  let t54 = @simp.asm_rewrite_tac(@list.List([complex_mul_rneg(), complex_mul_lneg(), complex_neg_neg()]))
  let t53 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t52 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @arith.even()]))
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t52), t53), t54)
  complex_pow_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ n : Num, complex_pow(complex_neg(x), n) == (if EVEN(n) { complex_pow(x, n) } else { complex_neg(complex_pow(x, n)) })"), t55))
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
fn step_96() -> Unit raise {
  let t56 = @tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_mul_lid()])))
  complex_pow_one_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, complex_pow(Cx(real_of_num(1)), n) == Cx(real_of_num(1))"), t56))
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
fn step_97() -> Unit raise {
  let t57 = @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_mul_lid(), complex_mul_ac()]))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t57)
  complex_pow_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ n : Num, complex_pow(complex_mul(x, y), n) == complex_mul(complex_pow(x, n), complex_pow(y, n))"), t58))
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
fn step_98() -> Unit raise {
  let t59 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t60 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ii(), complex_pow_2(), complex_mul(), cx_def(), re(), im(), complex_neg()])), t59)
  complex_pow_ii_2_c.set(@tactics.prove(@term_syntax.parse_term("complex_pow(ii, 2) == complex_neg(Cx(real_of_num(1)))"), t60))
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
fn step_99() -> Unit raise {
  let t62 = @list.List([simple_complex_arith_tac, @tactics.conv_tac(@class.taut)])
  let t61 = @simp.asm_rewrite_tac(@list.List([@nums.not_suc(), complex_pow(), complex_entire()]))
  let t63 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t61), t62)
  complex_pow_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ n : Num, (complex_pow(x, n) == Cx(real_of_num(0))) == (x == Cx(real_of_num(0)) && !(n == 0))"), t63))
}

///|
let complex_pow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_EQ_0")

///|
/// `COMPLEX_POW_EQ_0`
pub fn complex_pow_eq_0() -> @kernel.Thm {
  complex_pow_eq_0_c.get()
}

///|
/// COMPLEX_NORM_CX
fn step_100() -> Unit raise {
  let t65 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.pow_2_sqrt_abs()]))
  let t64 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @analysis.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t66 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_norm(), cx_def(), re(), im()]))), t64), t65)
  complex_norm_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, complex_norm(Cx(x)) == abs(x)"), t66))
}

///|
let complex_norm_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_CX")

///|
/// `COMPLEX_NORM_CX`
pub fn complex_norm_cx() -> @kernel.Thm {
  complex_norm_cx_c.get()
}

///|
/// COMPLEX_NORM_POS
fn step_101() -> Unit raise {
  let t67 = @simp.simp_tac(@list.List([complex_norm(), @real.sqrt_pos_le(), @realarith.real_pow_2(), @analysis.real_le_square(), @realarith.real_le_add()]))
  complex_norm_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, real_of_num(0) <= complex_norm(z)"), t67))
}

///|
let complex_norm_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_POS")

///|
/// `COMPLEX_NORM_POS`
pub fn complex_norm_pos() -> @kernel.Thm {
  complex_norm_pos_c.get()
}

///|
/// COMPLEX_ABS_NORM
fn step_102() -> Unit raise {
  let t68 = @simp.rewrite_tac(@list.List([@realax.real_abs(), complex_norm_pos()]))
  complex_abs_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, abs(complex_norm(z)) == complex_norm(z)"), t68))
}

///|
let complex_abs_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ABS_NORM")

///|
/// `COMPLEX_ABS_NORM`
pub fn complex_abs_norm() -> @kernel.Thm {
  complex_abs_norm_c.get()
}

///|
/// COMPLEX_NORM_ZERO
fn step_103() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t79 = @simp.simp_tac(@list.List([@analysis.real_le_square(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → (x + y == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))"))]))
  let t78 = @simp.rewrite_tac(@list.List([complex_eq(), re(), im(), cx_def()]))
  let t77 = @simp.simp_tac(@list.List([@realarith.real_pow_2(), @analysis.real_le_square(), @realarith.real_le_add(), @analysis.real_pos(), @real.sqrt_inj()]))
  let t76 = @simp.gen_rewrite_tac(fn(x75 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x69 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s70 = @equal.land_conv(x69)
      fn(x71 : @kernel.Term) -> @kernel.Thm raise {
        s70(x71)
      }
    })((fn(x72 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s73 = @equal.rand_conv(x72)
      fn(x74 : @kernel.Term) -> @kernel.Thm raise {
        s73(x74)
      }
    })(x75))
  }, @list.List([@equal.gsym(@real.sqrt_0())]))
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_norm()]))), t76), t77), t78), t79), t80)
  complex_norm_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, (complex_norm(z) == real_of_num(0)) == (z == Cx(real_of_num(0)))"), t81))
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
fn step_104() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([complex_norm_cx(), @calc_int.real_abs_num()]))
  complex_norm_num_c.set(@tactics.prove(@term_syntax.parse_term("complex_norm(Cx(real_of_num((n : Num)))) == real_of_num(n)"), t82))
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
fn step_105() -> Unit raise {
  let t83 = @meson.meson_tac(@list.List([complex_norm_zero()]))
  complex_norm_0_c.set(@tactics.prove(@term_syntax.parse_term("complex_norm(Cx(real_of_num(0))) == real_of_num(0)"), t83))
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
fn step_106() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([complex_norm_zero(), complex_abs_norm(), @real.real_abs_nz()]))
  complex_norm_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, (real_of_num(0) < complex_norm(z)) == !(z == Cx(real_of_num(0)))"), t84))
}

///|
let complex_norm_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_NZ")

///|
/// `COMPLEX_NORM_NZ`
pub fn complex_norm_nz() -> @kernel.Thm {
  complex_norm_nz_c.get()
}

///|
/// COMPLEX_NORM_NEG
fn step_107() -> Unit raise {
  let t85 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_neg(), complex_norm(), @realarith.real_pow_2(), re(), im()])), @tactics.gen_tac), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  complex_norm_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, complex_norm(complex_neg(z)) == complex_norm(z)"), t85))
}

///|
let complex_norm_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_NEG")

///|
/// `COMPLEX_NORM_NEG`
pub fn complex_norm_neg() -> @kernel.Thm {
  complex_norm_neg_c.get()
}

///|
/// COMPLEX_NORM_MUL
fn step_108() -> Unit raise {
  let t87 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t86 = @simp.rewrite_tac(@list.List([complex_norm(), complex_mul(), re(), im()]))
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t86), t87), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  complex_norm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_norm(complex_mul(w, z)) == complex_norm(w) * complex_norm(z)"), t88))
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
fn step_109() -> Unit raise {
  let t89 = @simp.asm_rewrite_tac(@list.List([complex_pow(), @realax.real_pow(), complex_norm_num(), complex_norm_mul()]))
  let t90 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t89)
  complex_norm_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, ∀ n : Num, complex_norm(complex_pow(z, n)) == pow(complex_norm(z), n)"), t90))
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
fn step_110() -> Unit raise {
  let t100 = @simp.asm_simp_tac(@list.List([@analysis.real_mul_rinv(), @realax.real_mul_lid(), @real.sqrt_1()]))
  let t98 = @term_syntax.parse_term("(a : Real) * (a * ((b : Real) * b)) == a * b * (a * b)")
  let t99 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t98)]))
  let t97 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @analysis.real_le_mul(), @real.real_le_inv_eq(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t96 = @tactics.match_mp_tac(@real.real_mul_rinv_uniq())
  let t95 = @tactics.conv_tac(@equal.sym_conv)
  let t94 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_inv_0(), @real.sqrt_0(), @analysis.real_mul_lzero()])), @tactics.all_tac])
  let t93 = @class.asm_cases_tac(@term_syntax.parse_term("Re((z : Complex)) * Re(z) + Im(z) * Im(z) == real_of_num(0)"))
  let t92 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(r : Real) * (d : Real) * (r * d) + -(i : Real) * d * (-i * d) == (r * r + i * i) * (d * d)"))]))
  let t91 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_div()]))
  let t101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([complex_norm(), complex_inv(), re(), im()]))), t91), t92), t93), t94), t95), t96), t97), t99), t100)
  complex_norm_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, complex_norm(complex_inv(z)) == inv(complex_norm(z))"), t101))
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
fn step_111() -> Unit raise {
  let t102 = @simp.rewrite_tac(@list.List([complex_div(), @realax.real_div(), complex_norm_inv(), complex_norm_mul()]))
  complex_norm_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_norm(complex_div(w, z)) == complex_norm(w) / complex_norm(z)"), t102))
}

///|
let complex_norm_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_DIV")

///|
/// `COMPLEX_NORM_DIV`
pub fn complex_norm_div() -> @kernel.Thm {
  complex_norm_div_c.get()
}

///|
/// COMPLEX_NORM_TRIANGLE
fn step_112() -> Unit raise {
  let t117 = @simp.rewrite_tac(@list.List([@analysis.real_le_square()]))
  let t116 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((rw : Real) * (rz : Real) + (iw : Real) * (iz : Real)) * (rw * rz + iw * iz) <= (rw * rw + iw * iw) * (rz * rz + iz * iz)) == (real_of_num(0) <= (rw * iz - rz * iw) * (rw * iz - rz * iw))"))]))
  let t115 = @simp.simp_tac(@list.List([@real.sqrt_pos_le(), @realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square(), @real.real_le_square_abs(), @real.sqrt_pow_2(), @analysis.real_le_mul()]))
  let t114 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && abs((x : Real)) <= abs(y) → x <= y")))
  let t113 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t112 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((rw : Real) + (rz : Real)) * (rw + rz) + ((iw : Real) + (iz : Real)) * (iw + iz) <= rw * rw + iw * iw + (rz * rz + iz * iz + real_of_num(2) * (other : Real))) == (rw * rz + iw * iz <= other)"))]))
  let t111 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t110 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t109 = @simp.gen_rewrite_tac(fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s107 = @equal.rand_conv(x106)
    fn(x108 : @kernel.Term) -> @kernel.Thm raise {
      s107(x108)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real)) * (a + b) == a * a + (b * b + real_of_num(2) * (a * b))"))]))
  let t105 = @simp.simp_tac(@list.List([@real.sqrt_pos_le(), @realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square(), @real.real_le_square_abs(), @real.sqrt_pow_2()]))
  let t104 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && abs((x : Real)) <= abs(y) → x <= y")))
  let t103 = @simp.rewrite_tac(@list.List([complex_norm(), complex_add(), re(), im()]))
  let t118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t103), t104), t105), t109), t110), t111), t112), t113), t114), t115), t116), t117)
  complex_norm_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_norm(complex_add(w, z)) <= complex_norm(w) + complex_norm(z)"), t118))
}

///|
let complex_norm_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_TRIANGLE")

///|
/// `COMPLEX_NORM_TRIANGLE`
pub fn complex_norm_triangle() -> @kernel.Thm {
  complex_norm_triangle_c.get()
}

///|
/// COMPLEX_NORM_TRIANGLE_SUB
fn step_113() -> Unit raise {
  let t119 = @meson.meson_tac(@list.List([complex_norm_triangle(), complex_norm_neg(), complex_add_assoc(), complex_add_rinv(), complex_add_rid()]))
  complex_norm_triangle_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_norm(w) <= complex_norm(complex_add(w, z)) + complex_norm(z)"), t119))
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
fn step_114() -> Unit raise {
  let t121 = @meson.meson_tac(@list.List([complex_neg_sub(), complex_norm_neg(), @analysis.real_le_sub_radd(), complex_sub(), complex_norm_triangle_sub()]))
  let t120 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) <= (x : Real) && b - a <= x → abs(a - b) <= x")))
  let t122 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t120), t121)
  complex_norm_abs_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, abs(complex_norm(w) - complex_norm(z)) <= complex_norm(complex_sub(w, z))"), t122))
}

///|
let complex_norm_abs_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NORM_ABS_NORM")

///|
/// `COMPLEX_NORM_ABS_NORM`
pub fn complex_norm_abs_norm() -> @kernel.Thm {
  complex_norm_abs_norm_c.get()
}

///|
/// cnj
fn step_115() -> Unit raise {
  cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(cnj : (Complex) -> Complex)((z : Complex)) == complex((Re(z), -Im(z)))")))
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
fn step_116() -> Unit raise {
  let t123 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), re(), im(), @real.real_eq_neg2()]))
  cnj_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, (cnj(w) == cnj(z)) == (w == z)"), t123))
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
fn step_117() -> Unit raise {
  let t124 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), re(), im(), @analysis.real_neg_neg()]))
  cnj_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, cnj(cnj(z)) == z"), t124))
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
fn step_118() -> Unit raise {
  let t125 = @simp.rewrite_tac(@list.List([cnj(), complex_eq(), cx_def(), @analysis.real_neg_0(), re(), im()]))
  cnj_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, cnj(Cx(x)) == Cx(x)"), t125))
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
fn step_119() -> Unit raise {
  let t126 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), re(), im(), @analysis.real_neg_neg()]))
  let t127 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_norm(), cnj(), @realarith.real_pow_2()])), t126)
  complex_norm_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, complex_norm(cnj(z)) == complex_norm(z)"), t127))
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
fn step_120() -> Unit raise {
  let t128 = @simp.rewrite_tac(@list.List([cnj(), complex_neg(), complex_eq(), re(), im()]))
  cnj_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, cnj(complex_neg(z)) == complex_neg(cnj(z))"), t128))
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
fn step_121() -> Unit raise {
  let t129 = @simp.rewrite_tac(@list.List([@realax.real_div(), @analysis.real_neg_neg(), @realarith.real_pow_2(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t130 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_inv(), complex_eq(), re(), im()])), t129)
  cnj_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, cnj(complex_inv(z)) == complex_inv(cnj(z))"), t130))
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
fn step_122() -> Unit raise {
  let t131 = @simp.rewrite_tac(@list.List([@analysis.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @analysis.real_neg_neg()]))
  let t132 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_add(), complex_eq(), re(), im()])), t131)
  cnj_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, cnj(complex_add(w, z)) == complex_add(cnj(w), cnj(z))"), t132))
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
fn step_123() -> Unit raise {
  let t133 = @simp.rewrite_tac(@list.List([complex_sub(), cnj_add(), cnj_neg()]))
  cnj_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, cnj(complex_sub(w, z)) == complex_sub(cnj(w), cnj(z))"), t133))
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
fn step_124() -> Unit raise {
  let t134 = @simp.rewrite_tac(@list.List([@analysis.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @analysis.real_neg_neg()]))
  let t135 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cnj(), complex_mul(), complex_eq(), re(), im()])), t134)
  cnj_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, cnj(complex_mul(w, z)) == complex_mul(cnj(w), cnj(z))"), t135))
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
fn step_125() -> Unit raise {
  let t136 = @simp.rewrite_tac(@list.List([complex_div(), cnj_mul(), cnj_inv()]))
  cnj_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, cnj(complex_div(w, z)) == complex_div(cnj(w), cnj(z))"), t136))
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
fn step_126() -> Unit raise {
  let t137 = @simp.asm_rewrite_tac(@list.List([complex_pow(), cnj_mul(), cnj_cx()]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t137)
  cnj_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, ∀ n : Num, cnj(complex_pow(z, n)) == complex_pow(cnj(z), n)"), t138))
}

///|
let cnj_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_POW")

///|
/// `CNJ_POW`
pub fn cnj_pow() -> @kernel.Thm {
  cnj_pow_c.get()
}

///|
/// is_complex_const
fn step_127() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  is_complex_const_c.set(fn(x139 : @kernel.Term) -> Bool raise {
    let tm = x139
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
fn step_128() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  dest_complex_const_c.set(fn(x140 : @kernel.Term) -> @num.Num raise {
    let tm = x140
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
fn step_129() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  mk_complex_const_c.set(fn(x141 : @num.Num) -> @kernel.Term raise {
    let r = x141
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
/// COMPLEX_RAT_MUL_CONV
fn step_130() -> Unit raise {
  let t143 = @equal.rand_conv(@calc_rat.real_rat_mul_conv)
  complex_rat_mul_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x142 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x142
  }, @list.List([@equal.gsym(cx_mul())])), t143))
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
fn step_131() -> Unit raise {
  let t145 = @equal.rand_conv(@calc_rat.real_rat_add_conv)
  complex_rat_add_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x144 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x144
  }, @list.List([@equal.gsym(cx_add())])), t145))
}

///|
let complex_rat_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COMPLEX_RAT_ADD_CONV")

///|
/// `COMPLEX_RAT_ADD_CONV`
pub fn complex_rat_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_rat_add_conv_c.get())(x)
}

///|
/// COMPLEX_RAT_EQ_CONV
fn step_132() -> Unit raise {
  complex_rat_eq_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x146 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x146
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
/// COMPLEX_RAT_POW_CONV
fn step_133() -> Unit raise {
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let pth = @equal.sym(@bool.specl(@list.List([x_tm, n_tm]), cx_pow()))
  complex_rat_pow_conv_c.set(fn(x147 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x147
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
fn step_134() -> Unit raise {
  let t148 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_pow()])), simple_complex_arith_tac)
  complex_poly_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_add(x, complex_add(y, z)) == complex_add(complex_add(x, y), z)) && (∀ x : Complex, ∀ y : Complex, complex_add(x, y) == complex_add(y, x)) && (∀ x : Complex, complex_add(Cx(real_of_num(0)), x) == x) && (∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(x, complex_mul(y, z)) == complex_mul(complex_mul(x, y), z)) && (∀ x : Complex, ∀ y : Complex, complex_mul(x, y) == complex_mul(y, x)) && (∀ x : Complex, complex_mul(Cx(real_of_num(1)), x) == x) && (∀ x : Complex, complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))) && (∀ x : Complex, ∀ y : Complex, ∀ z : Complex, complex_mul(x, complex_add(y, z)) == complex_add(complex_mul(x, y), complex_mul(x, z))) && (∀ x : Complex, complex_pow(x, 0) == Cx(real_of_num(1))) && (∀ x : Complex, ∀ n : Num, complex_pow(x, SUC(n)) == complex_mul(x, complex_pow(x, n)))"), t148))
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
fn step_135() -> Unit raise {
  complex_poly_neg_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Complex, complex_neg(x) == complex_mul(Cx(-real_of_num(1)), x)) && (∀ x : Complex, ∀ y : Complex, complex_sub(x, y) == complex_add(x, complex_mul(Cx(-real_of_num(1)), y)))"), simple_complex_arith_tac))
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
fn step_136() -> Unit raise {
  let (complex_poly_neg_conv, complex_poly_add_conv, complex_poly_sub_conv, complex_poly_mul_conv, complex_poly_pow_conv, complex_poly_conv) = @normalizer.semiring_normalizers_conv(complex_poly_clauses())(complex_poly_neg_clauses())((is_complex_const, complex_rat_add_conv, complex_rat_mul_conv, complex_rat_pow_conv))(fn(x149 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x150 : @kernel.Term) -> Bool raise {
      (@lib.compare(x149, x150) < 0)
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
fn step_137() -> Unit raise {
  let t152 = @equal.rand_conv(@calc_rat.real_rat_inv_conv)
  complex_rat_inv_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x151 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x151
  }, @list.List([@equal.gsym(cx_inv())])), t152))
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
fn step_138() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("complex_neg")
  let inv_tm = @term_syntax.parse_term("complex_inv")
  let add_tm = @term_syntax.parse_term("complex_add")
  let sub_tm = @term_syntax.parse_term("complex_sub")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let div_tm = @term_syntax.parse_term("complex_div")
  let pow_tm = @term_syntax.parse_term("complex_pow")
  let div_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(complex_div())
  fn complex_poly_conv_1(x153 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x153
    if (!@kernel.is_comb(tm) || is_complex_const(tm)) {
      @kernel.refl(tm)
    } else {
      let (lop, r) = @kernel.dest_comb(tm)
      if (lop == neg_tm) {
        let th1 = @equal.ap_term(lop, complex_poly_conv_1(r))
        @kernel.trans(th1, complex_poly_neg_conv(@kernel.rand(@kernel.concl(th1))))
      } else {
        if (lop == inv_tm) {
          let th1_1 = @equal.ap_term(lop, complex_poly_conv_1(r))
          let t154 = @kernel.rand(@kernel.concl(th1_1))
          @kernel.trans(th1_1, @equal.try_conv(complex_rat_inv_conv)(t154))
        } else {
          if !@kernel.is_comb(lop) {
            @kernel.refl(tm)
          } else {
            let (op, l) = @kernel.dest_comb(lop)
            if (op == pow_tm) {
              let th1_2 = @equal.ap_thm(@equal.ap_term(op, complex_poly_conv_1(l)), r)
              let t155 = @kernel.rand(@kernel.concl(th1_2))
              @kernel.trans(th1_2, @equal.try_conv(complex_poly_pow_conv)(t155))
            } else {
              if ((op == add_tm) || ((op == mul_tm) || (op == sub_tm))) {
                let t156 = complex_poly_conv_1(r)
                let th1_3 = @kernel.mk_comb_rule(@equal.ap_term(op, complex_poly_conv_1(l)), t156)
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
/// COMPLEX_MUL_LINV
fn step_139() -> Unit raise {
  let t158 = @tactics.conv_tac(@calc_rat.real_field)
  let t157 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sos_eq_0())]))
  let t159 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_mul(), complex_inv(), re(), im(), complex_eq(), cx_def()])), t157), t158)
  complex_mul_linv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, !(z == Cx(real_of_num(0))) → complex_mul(complex_inv(z), z) == Cx(real_of_num(1))"), t159))
}

///|
let complex_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LINV")

///|
/// `COMPLEX_MUL_LINV`
pub fn complex_mul_linv() -> @kernel.Thm {
  complex_mul_linv_c.get()
}

///|
/// COMPLEX_MUL_RINV
fn step_140() -> Unit raise {
  let t160 = @simp.rewrite_tac(@list.List([complex_mul_linv()]))
  let t161 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([complex_mul_sym()])), t160)
  complex_mul_rinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, !(z == Cx(real_of_num(0))) → complex_mul(z, complex_inv(z)) == Cx(real_of_num(1))"), t161))
}

///|
let complex_mul_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RINV")

///|
/// `COMPLEX_MUL_RINV`
pub fn complex_mul_rinv() -> @kernel.Thm {
  complex_mul_rinv_c.get()
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
fn step_141() -> Unit raise {
  let ring_pow_tm = @term_syntax.parse_term("complex_pow")
  let t162 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_entire(), simple_complex_arith(@term_syntax.parse_term("(complex_add(complex_mul((w : Complex), (y : Complex)), complex_mul((x : Complex), (z : Complex))) == complex_add(complex_mul(w, z), complex_mul(x, y))) == (complex_mul(complex_sub(w, x), complex_sub(y, z)) == Cx(real_of_num(0)))"))])), simple_complex_arith_tac)
  let complex_integral = @tactics.prove(@term_syntax.parse_term("(∀ x : Complex, complex_mul(Cx(real_of_num(0)), x) == Cx(real_of_num(0))) && (∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_add(x, y) == complex_add(x, z)) == (y == z)) && (∀ w : Complex, ∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_add(complex_mul(w, y), complex_mul(x, z)) == complex_add(complex_mul(w, z), complex_mul(x, y))) == (w == x || y == z))"), t162)
  let t171 = @meson.meson_tac(@list.List([complex_mul_rinv(), complex_mul_lzero(), simple_complex_arith(@term_syntax.parse_term("!(Cx(real_of_num(1)) == Cx(real_of_num(0)))"))]))
  let t170 = @simp.gen_rewrite_tac(fn(x169 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x163 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s164 = @equal.land_conv(x163)
      fn(x165 : @kernel.Term) -> @kernel.Thm raise {
        s164(x165)
      }
    })((fn(x166 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s167 = @equal.rand_conv(x166)
      fn(x168 : @kernel.Term) -> @kernel.Thm raise {
        s167(x168)
      }
    })(x169))
  }, @list.List([@equal.gsym(complex_sub_0())]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t170), t171)
  let complex_rabinowitsch = @tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, !(x == y) == (∃ z : Complex, complex_mul(complex_sub(x, y), z) == Cx(real_of_num(1)))"), t172)
  let init_ : (@kernel.Term) -> @kernel.Thm raise = @equal.all_conv
  let t173 = @term_syntax.parse_term("complex_pow")
  let t174 = @term_syntax.parse_term("complex_div")
  let t175 = @term_syntax.parse_term("complex_mul")
  let t176 = @term_syntax.parse_term("complex_inv")
  let t177 = @term_syntax.parse_term("complex_sub")
  let t178 = @term_syntax.parse_term("complex_add")
  let (pure_, ideal) = @grobner.ring_and_ideal_conv((dest_complex_const, mk_complex_const, complex_rat_eq_conv, @term_syntax.parse_term("complex_neg"), t178, t177, t176, t175, t174, t173, complex_integral, complex_rabinowitsch, complex_poly_conv))
  let (complex_ring, complex_ideal_cofactors) = (fn(x179 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x179
    let th = init_(tm)
    let t180 = pure_(@kernel.rand(@kernel.concl(th)))
    @kernel.eq_mp(@equal.sym(th), t180)
  }, ideal)
  complex_ring_c.set(complex_ring)
  complex_ideal_cofactors_c.set(complex_ideal_cofactors)
}

///|
/// COMPLEX_INV_0
fn step_142() -> Unit raise {
  let t181 = @simp.rewrite_tac(@list.List([complex_inv(), cx_def(), re(), im(), @realax.real_div(), @analysis.real_mul_lzero(), @analysis.real_neg_0()]))
  complex_inv_0_c.set(@tactics.prove(@term_syntax.parse_term("complex_inv(Cx(real_of_num(0))) == Cx(real_of_num(0))"), t181))
}

///|
let complex_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_0")

///|
/// `COMPLEX_INV_0`
pub fn complex_inv_0() -> @kernel.Thm {
  complex_inv_0_c.get()
}

///|
/// COMPLEX_INV_MUL
fn step_143() -> Unit raise {
  let t191 = @tactics.conv_tac(@calc_rat.real_field)
  let t190 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sos_eq_0())]))
  let t189 = @simp.rewrite_tac(@list.List([complex_mul(), complex_inv(), re(), im(), complex_eq(), cx_def()]))
  let t188 = @tactics.repeat_tac(@tactics.pop_assum(fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.mp_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  }))
  let t184 = @simp.asm_rewrite_tac(@list.List([complex_inv_0(), complex_mul_lzero(), complex_mul_rzero()]))
  let t182 = @term_syntax.parse_term("(z : Complex) == Cx(real_of_num(0))")
  let t183 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(w : Complex) == Cx(real_of_num(0))"), t182]))
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t183), t184), t188), t189), t190), t191)
  complex_inv_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_inv(complex_mul(w, z)) == complex_mul(complex_inv(w), complex_inv(z))"), t192))
}

///|
let complex_inv_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_MUL")

///|
/// `COMPLEX_INV_MUL`
pub fn complex_inv_mul() -> @kernel.Thm {
  complex_inv_mul_c.get()
}

///|
/// COMPLEX_INV_1
fn step_144() -> Unit raise {
  let t194 = @simp.rewrite_tac(@list.List([@real.real_div_1()]))
  let t193 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t195 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_inv(), cx_def(), re(), im()])), t193), t194)
  complex_inv_1_c.set(@tactics.prove(@term_syntax.parse_term("complex_inv(Cx(real_of_num(1))) == Cx(real_of_num(1))"), t195))
}

///|
let complex_inv_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_1")

///|
/// `COMPLEX_INV_1`
pub fn complex_inv_1() -> @kernel.Thm {
  complex_inv_1_c.get()
}

///|
/// COMPLEX_POW_INV
fn step_145() -> Unit raise {
  let t196 = @simp.asm_rewrite_tac(@list.List([complex_pow(), complex_inv_1(), complex_inv_mul()]))
  let t197 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t196)
  complex_pow_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ n : Num, complex_pow(complex_inv(x), n) == complex_inv(complex_pow(x, n))"), t197))
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
fn step_146() -> Unit raise {
  let t207 = @tactics.conv_tac(complex_ring)
  let t205 = @term_syntax.parse_term("complex_inv((x : Complex))")
  let t206 = @tactics.map_every(fn(x203 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x203
    @tactics.mp_tac(@bool.spec(t, complex_mul_rinv()))
  }, @list.List([@term_syntax.parse_term("(x : Complex)"), t205]))
  let t202 = @tactics.pop_assum(fn(x199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s200 = @tactics.mp_tac(x199)
    fn(x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s200(x201)
    }
  })
  let t198 = @simp.asm_rewrite_tac(@list.List([complex_inv_0()]))
  let t208 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Complex) == Cx(real_of_num(0))"))), t198), t202), t206), t207)
  complex_inv_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, complex_inv(complex_inv(x)) == x"), t208))
}

///|
let complex_inv_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_INV_INV")

///|
/// `COMPLEX_INV_INV`
pub fn complex_inv_inv() -> @kernel.Thm {
  complex_inv_inv_c.get()
}

///|
/// COMPLEX_FIELD
fn step_147() -> Unit raise {
  let t210 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), @canon.conds_celim_conv)
  let t209 = @simp.pure_rewrite_conv(@list.List([@theorems.forall_simp(), @theorems.exists_simp(), complex_div(), complex_inv_inv(), complex_inv_mul(), @equal.gsym(@real.real_pow_inv())]))
  let prenex_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.top_depth_conv(@equal.beta_conv), t209), @canon.nnfc_conv), t210), @canon.prenex_conv)
  let setup_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@canon.nnf_conv, @canon.weak_cnf_conv), @canon.conj_canon_conv)
  let inv_tm = @term_syntax.parse_term("complex_inv")
  let t211 = @term_syntax.parse_term("complex_div")
  let is_div : (@kernel.Term) -> Bool raise = fn(x213 : @kernel.Term) -> Bool raise {
    ((x212 : @kernel.Term) => @basics.is_binop(t211, x212))(x213)
  }
  let is_inv : (@kernel.Term) -> Bool raise = fn(x214 : @kernel.Term) -> Bool raise {
    let tm = x214
    ((is_div(tm) || (@kernel.is_comb(tm) && (@kernel.rator(tm) == inv_tm))) && !is_complex_const(@kernel.rand(tm)))
  }
  let lemma_inv = @meson.meson(@list.List([complex_mul_rinv()]), @term_syntax.parse_term("∀ x : Complex, x == Cx(real_of_num(0)) || complex_mul(x, complex_inv(x)) == Cx(real_of_num(1))"))
  let dcases : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) && ((r : Bool) || (s : Bool)) → (p || r) || q && s")))
  let cases_rule : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x215 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1 = x215
    fn(x216 : @kernel.Thm) -> @kernel.Thm raise {
      let th2 = x216
      dcases(@bool.conj(th1, th2))
    }
  }
  let basic_complex_field : (@kernel.Term) -> @kernel.Thm raise = fn(x217 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x217
    let is_freeinv : (@kernel.Term) -> Bool raise = fn(x218 : @kernel.Term) -> Bool raise {
      let t = x218
      (is_inv(t) && @basics.free_in(t, tm_1))
    }
    let itms = @lib.setify(@lib.map(@kernel.rand, @basics.find_terms(is_freeinv, tm_1)))
    let dth = if @list.List::is_empty(itms) {
      @bool.truth()
    } else {
      @lib.end_itlist(fn(x219 : @kernel.Thm, x220 : @kernel.Thm) -> @kernel.Thm raise {
        let s221 = cases_rule(x219)
        s221(x220)
      }, @lib.map(fn(x224 : @kernel.Term) -> @kernel.Thm raise {
        (fn(x222 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          fn(x223 : @kernel.Thm) -> @kernel.Thm raise {
            @bool.spec(x222, x223)
          }
        })(x224)(lemma_inv)
      }, itms))
    }
    let tm_p = @bool.mk_imp(@kernel.concl(dth), tm_1)
    let th1_1 = setup_conv(tm_p)
    let ths = @lib.map(complex_ring, @basics.conjuncts(@kernel.rand(@kernel.concl(th1_1))))
    let t225 = @lib.end_itlist(@bool.conj, ths)
    let th2_1 = @kernel.eq_mp(@equal.sym(th1_1), t225)
    let t226 = @lib.end_itlist(@bool.conj, ths)
    @bool.mp(@kernel.eq_mp(@equal.sym(th1_1), t226), dth)
  }
  complex_field_c.set(fn(x227 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x227
    let th0 = prenex_conv(tm_2)
    let tm0 = @kernel.rand(@kernel.concl(th0))
    let (avs, bod) = @basics.strip_forall(tm0)
    let th1_2 = setup_conv(bod)
    let ths_1 = @lib.map(basic_complex_field, @basics.conjuncts(@kernel.rand(@kernel.concl(th1_2))))
    let t228 = @lib.end_itlist(@bool.conj, ths_1)
    let t229 = @bool.genl(avs, @kernel.eq_mp(@equal.sym(th1_2), t228))
    @kernel.eq_mp(@equal.sym(th0), t229)
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
/// COMPLEX_POW_DIV
fn step_148() -> Unit raise {
  let t230 = @simp.rewrite_tac(@list.List([complex_div(), complex_pow_mul(), complex_pow_inv()]))
  complex_pow_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ n : Num, complex_pow(complex_div(x, y), n) == complex_div(complex_pow(x, n), complex_pow(y, n))"), t230))
}

///|
let complex_pow_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_POW_DIV")

///|
/// `COMPLEX_POW_DIV`
pub fn complex_pow_div() -> @kernel.Thm {
  complex_pow_div_c.get()
}

///|
/// COMPLEX_DIV_REFL
fn step_149() -> Unit raise {
  let t231 = @tactics.conv_tac(complex_field)
  complex_div_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, !(x == Cx(real_of_num(0))) → complex_div(x, x) == Cx(real_of_num(1))"), t231))
}

///|
let complex_div_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_REFL")

///|
/// `COMPLEX_DIV_REFL`
pub fn complex_div_refl() -> @kernel.Thm {
  complex_div_refl_c.get()
}

///|
/// COMPLEX_EQ_MUL_LCANCEL
fn step_150() -> Unit raise {
  let t232 = @tactics.conv_tac(complex_field)
  complex_eq_mul_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_mul(x, y) == complex_mul(x, z)) == (x == Cx(real_of_num(0)) || y == z)"), t232))
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
fn step_151() -> Unit raise {
  let t233 = @tactics.conv_tac(complex_field)
  complex_eq_mul_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, (complex_mul(x, z) == complex_mul(y, z)) == (x == y || z == Cx(real_of_num(0)))"), t233))
}

///|
let complex_eq_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_MUL_RCANCEL")

///|
/// `COMPLEX_EQ_MUL_RCANCEL`
pub fn complex_eq_mul_rcancel() -> @kernel.Thm {
  complex_eq_mul_rcancel_c.get()
}

///|
/// COMPLEX_MUL_RINV_UNIQ
fn step_152() -> Unit raise {
  let t234 = @tactics.conv_tac(complex_field)
  complex_mul_rinv_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_mul(w, z) == Cx(real_of_num(1)) → complex_inv(w) == z"), t234))
}

///|
let complex_mul_rinv_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_RINV_UNIQ")

///|
/// `COMPLEX_MUL_RINV_UNIQ`
pub fn complex_mul_rinv_uniq() -> @kernel.Thm {
  complex_mul_rinv_uniq_c.get()
}

///|
/// COMPLEX_MUL_LINV_UNIQ
fn step_153() -> Unit raise {
  let t235 = @tactics.conv_tac(complex_field)
  complex_mul_linv_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, complex_mul(w, z) == Cx(real_of_num(1)) → complex_inv(z) == w"), t235))
}

///|
let complex_mul_linv_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MUL_LINV_UNIQ")

///|
/// `COMPLEX_MUL_LINV_UNIQ`
pub fn complex_mul_linv_uniq() -> @kernel.Thm {
  complex_mul_linv_uniq_c.get()
}

///|
/// COMPLEX_DIV_LMUL
fn step_154() -> Unit raise {
  let t236 = @tactics.conv_tac(complex_field)
  complex_div_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, !(z == Cx(real_of_num(0))) → complex_mul(z, complex_div(w, z)) == w"), t236))
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
fn step_155() -> Unit raise {
  let t237 = @tactics.conv_tac(complex_field)
  complex_div_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Complex, ∀ z : Complex, !(z == Cx(real_of_num(0))) → complex_mul(complex_div(w, z), z) == w"), t237))
}

///|
let complex_div_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIV_RMUL")

///|
/// `COMPLEX_DIV_RMUL`
pub fn complex_div_rmul() -> @kernel.Thm {
  complex_div_rmul_c.get()
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
}
