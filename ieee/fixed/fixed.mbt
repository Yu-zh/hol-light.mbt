// Translated from upstream IEEE/fixed.hl; edit this file directly.

///|
/// is_valid_fformat
fn step_1() -> Unit raise {
  is_valid_fformat_c.set(@define.define_(@term_syntax.parse_term("(is_valid_fformat : ((Num, Num, Int)) -> Bool)(((r : Num), (p : Num), (e : Int))) == (1 < r && EVEN(r) && 0 < p)")))
}

///|
let is_valid_fformat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_valid_fformat")

///|
/// `is_valid_fformat`
pub fn is_valid_fformat() -> @kernel.Thm {
  is_valid_fformat_c.get()
}

///|
/// fformat_typbij
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([is_valid_fformat()]))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(2, 1, int_of_num(0))")), t1), @int.arith_tac)
  fformat_typbij_c.set(@class.new_type_definition("fformat", ("mk_fformat", "dest_fformat"), @tactics.prove(@term_syntax.parse_term("∃ fmt : (Num, Num, Int), is_valid_fformat(fmt)"), t2)))
}

///|
let fformat_typbij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fformat_typbij")

///|
/// `fformat_typbij`
pub fn fformat_typbij() -> @kernel.Thm {
  fformat_typbij_c.get()
}

///|
/// fr
fn step_3() -> Unit raise {
  fr_c.set(@define.define_(@term_syntax.parse_term("(fr : (Fformat) -> Num)((fmt : Fformat)) == FST(dest_fformat(fmt))")))
}

///|
let fr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fr")

///|
/// `fr`
pub fn fr() -> @kernel.Thm {
  fr_c.get()
}

///|
/// fp
fn step_4() -> Unit raise {
  fp_c.set(@define.define_(@term_syntax.parse_term("(fp : (Fformat) -> Num)((fmt : Fformat)) == FST(SND(dest_fformat(fmt)))")))
}

///|
let fp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fp")

///|
/// `fp`
pub fn fp() -> @kernel.Thm {
  fp_c.get()
}

///|
/// fe
fn step_5() -> Unit raise {
  fe_c.set(@define.define_(@term_syntax.parse_term("(fe : (Fformat) -> Int)((fmt : Fformat)) == SND(SND(dest_fformat(fmt)))")))
}

///|
let fe_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fe")

///|
/// `fe`
pub fn fe() -> @kernel.Thm {
  fe_c.get()
}

///|
/// is_frac
fn step_6() -> Unit raise {
  is_frac_c.set(@define.define_(@term_syntax.parse_term("(is_frac : (Fformat, Real, Num) -> Bool)((fmt : Fformat), (x : Real), (f : Num)) == (f <= EXP(fr(fmt), fp(fmt) - 1) && abs(x) == real_of_num(f) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)))")))
}

///|
let is_frac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_frac")

///|
/// `is_frac`
pub fn is_frac() -> @kernel.Thm {
  is_frac_c.get()
}

///|
/// ff
fn step_7() -> Unit raise {
  ff_c.set(@define.define_(@term_syntax.parse_term("(ff : (Fformat, Real) -> Num)((fmt : Fformat), (x : Real)) == select((f : Num) => is_frac(fmt, x, f))")))
}

///|
let ff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ff")

///|
/// `ff`
pub fn ff() -> @kernel.Thm {
  ff_c.get()
}

///|
/// is_fixed
fn step_8() -> Unit raise {
  is_fixed_c.set(@define.define_(@term_syntax.parse_term("(is_fixed : (Fformat, Real) -> Bool)((fmt : Fformat), (x : Real)) == (∃ f : Num, is_frac(fmt, x, f))")))
}

///|
let is_fixed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_fixed")

///|
/// `is_fixed`
pub fn is_fixed() -> @kernel.Thm {
  is_fixed_c.get()
}

///|
/// is_finite_fixed
fn step_9() -> Unit raise {
  is_finite_fixed_c.set(@term_syntax.parse_term("is_fixed((fmt : Fformat), (x : Real)) == (∃ f : Num, is_frac(fmt, x, f) && f < EXP(fr(fmt), fp(fmt) - 1))"))
}

///|
let is_finite_fixed_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("is_finite_fixed")

///|
/// `is_finite_fixed`
pub fn is_finite_fixed() -> @kernel.Term {
  is_finite_fixed_c.get()
}

///|
/// fulp
fn step_10() -> Unit raise {
  fulp_c.set(@define.define_(@term_syntax.parse_term("(fulp : (Fformat) -> Real)((fmt : Fformat)) == ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))")))
}

///|
let fulp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fulp")

///|
/// `fulp`
pub fn fulp() -> @kernel.Thm {
  fulp_c.get()
}

///|
/// finf
fn step_11() -> Unit raise {
  finf_c.set(@define.define_(@term_syntax.parse_term("(finf : (Fformat) -> Real)((fmt : Fformat)) == ipow(real_of_num(fr(fmt)), fe(fmt))")))
}

///|
let finf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("finf")

///|
/// `finf`
pub fn finf() -> @kernel.Thm {
  finf_c.get()
}

///|
/// fixed
fn step_12() -> Unit raise {
  fixed_c.set(@define.define_(@term_syntax.parse_term("(fixed : (Fformat, Real) -> Bool)((fmt : Fformat)) == {(x : Real) | is_fixed(fmt, x)}")))
}

///|
let fixed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fixed")

///|
/// `fixed`
pub fn fixed() -> @kernel.Thm {
  fixed_c.get()
}

///|
/// is_lb
fn step_13() -> Unit raise {
  is_lb_c.set(@define.define_(@term_syntax.parse_term("(is_lb : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (IN(y, fixed(fmt)) && y <= x)")))
}

///|
let is_lb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_lb")

///|
/// `is_lb`
pub fn is_lb() -> @kernel.Thm {
  is_lb_c.get()
}

///|
/// is_glb
fn step_14() -> Unit raise {
  is_glb_c.set(@define.define_(@term_syntax.parse_term("(is_glb : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (is_lb(fmt, x, y) && (∀ y' : Real, is_lb(fmt, x, y') → y' <= y))")))
}

///|
let is_glb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_glb")

///|
/// `is_glb`
pub fn is_glb() -> @kernel.Thm {
  is_glb_c.get()
}

///|
/// is_ub
fn step_15() -> Unit raise {
  is_ub_c.set(@define.define_(@term_syntax.parse_term("(is_ub : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (IN(y, fixed(fmt)) && x <= y)")))
}

///|
let is_ub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_ub")

///|
/// `is_ub`
pub fn is_ub() -> @kernel.Thm {
  is_ub_c.get()
}

///|
/// is_lub
fn step_16() -> Unit raise {
  is_lub_c.set(@define.define_(@term_syntax.parse_term("(is_lub : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (is_ub(fmt, x, y) && (∀ y' : Real, is_ub(fmt, x, y') → y <= y'))")))
}

///|
let is_lub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_lub")

///|
/// `is_lub`
pub fn is_lub() -> @kernel.Thm {
  is_lub_c.get()
}

///|
/// glb
fn step_17() -> Unit raise {
  glb_c.set(@define.define_(@term_syntax.parse_term("(glb : (Fformat, Real) -> Real)((fmt : Fformat), (x : Real)) == sup({(y : Real) | IN(y, fixed(fmt)) && y <= x})")))
}

///|
let glb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("glb")

///|
/// `glb`
pub fn glb() -> @kernel.Thm {
  glb_c.get()
}

///|
/// lub
fn step_18() -> Unit raise {
  lub_c.set(@define.define_(@term_syntax.parse_term("(lub : (Fformat, Real) -> Real)((fmt : Fformat), (x : Real)) == inf({(y : Real) | IN(y, fixed(fmt)) && x <= y})")))
}

///|
let lub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lub")

///|
/// `lub`
pub fn lub() -> @kernel.Thm {
  lub_c.get()
}

///|
let roundmode_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("roundmode_INDUCT")

///|
/// `roundmode_INDUCT`
pub fn roundmode_induct() -> @kernel.Thm {
  roundmode_induct_c.get()
}

///|
let roundmode_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("roundmode_RECURSION")

///|
/// `roundmode_RECURSION`
pub fn roundmode_recursion() -> @kernel.Thm {
  roundmode_recursion_c.get()
}

///|
/// roundmode_INDUCT, roundmode_RECURSION
fn step_19() -> Unit raise {
  let (roundmode_induct, roundmode_recursion) = @ind_types.define_type("enum Roundmode { To_near; To_zero; To_pinf; To_ninf }")
  roundmode_induct_c.set(roundmode_induct)
  roundmode_recursion_c.set(roundmode_recursion)
}

///|
/// fround
fn step_20() -> Unit raise {
  fround_c.set(@define.define_(@term_syntax.parse_term("(fround : (Fformat, Roundmode, Real) -> Real)((fmt : Fformat), To_near, (x : Real)) == LET((lo : Real) => (hi : Real) => LET_END(if closer(lo, hi, x) { lo } else { if closer(hi, lo, x) { hi } else { if EVEN(ff(fmt, lo)) { lo } else { hi } } }), glb(fmt, x), lub(fmt, x)) && fround(fmt, To_zero, x) == (if real_of_num(0) <= x { glb(fmt, x) } else { lub(fmt, x) }) && fround(fmt, To_pinf, x) == lub(fmt, x) && fround(fmt, To_ninf, x) == glb(fmt, x)")))
}

///|
let fround_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fround")

///|
/// `fround`
pub fn fround() -> @kernel.Thm {
  fround_c.get()
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
