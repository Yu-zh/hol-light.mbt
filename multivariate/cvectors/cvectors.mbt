// Translated from upstream Multivariate/cvectors.ml; edit this file directly.

///|
/// `SINGLE`
pub fn[TA, TB] single(x1 : (@list.List[TB]) -> TA raise, x2 : TB) -> TA raise {
  let f = x1
  let x = x2
  f(@list.List([x]))
}

///|
/// `distrib`
pub fn[TA, TB] distrib(x3 : @list.List[(TB) -> TA raise], x4 : TB) -> @list.List[TA] raise {
  let fs = x3
  let x = x4
  @lib.map(fn(x5 : (TB) -> TA raise) -> TA raise {
    let f = x5
    f(x)
  }, fs)
}

///|
/// `DISTRIB`
pub fn[TA] distrib_v1(x6 : @list.List[(TA) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise], x7 : TA) -> @tactics.Tactic raise {
  let ttacs = x6
  let x = x7
  @tactics.every(distrib(ttacs, x))
}

///|
/// REWRITE_TACS
fn step_1() -> Unit raise {
  rewrite_tacs_c.set((x10 : @list.List[@kernel.Thm]) => @tactics.map_every((x9 : @kernel.Thm) => single(@simp.rewrite_tac, x9), x10))
}

///|
let rewrite_tacs_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("REWRITE_TACS")

///|
/// `REWRITE_TACS`
pub fn rewrite_tacs(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewrite_tacs_c.get())(x)
}

///|
/// `GCONJUNCTS`
pub fn gconjuncts(x11 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let thm = x11
  @lib.map(@bool.gen_all, @bool.conjuncts_rule(@bool.spec_all(thm)))
}

///|
/// COMPONENT_LE_NORM_ALT
fn step_2() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([@real.real_abs_le(), @vectors.component_le_norm(), @realax.real_le_trans()]))
  component_le_norm_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) <= (norm : (Cart[Real, N]) -> Real)(x)"), t12))
}

///|
let component_le_norm_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPONENT_LE_NORM_ALT")

///|
/// `COMPONENT_LE_NORM_ALT`
pub fn component_le_norm_alt() -> @kernel.Thm {
  component_le_norm_alt_c.get()
}

///|
/// RE_IM_NORM
fn step_3() -> Unit raise {
  let t15 = @simp.simp_tac(@list.List([@vectors.component_le_norm()]))
  let t14 = @simp.rewrite_tac(@list.List([@cart.dimindex_2()]))
  let t16 = @tactics.orelse_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(component_le_norm_alt()), t14), @int.arith_tac), t15)
  let t13 = @tactics.repeat_tac(@tactics.conj_tac)
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()])), @tactics.gen_tac), t13), t16)
  re_im_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], Re(x) <= norm(x) && Im(x) <= norm(x) && abs(Re(x)) <= norm(x) && abs(Im(x)) <= norm(x)"), t17))
}

///|
let re_im_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_IM_NORM")

///|
/// `RE_IM_NORM`
pub fn re_im_norm() -> @kernel.Thm {
  re_im_norm_c.get()
}

///|
let re_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_NORM")

///|
/// `RE_NORM`
pub fn re_norm() -> @kernel.Thm {
  re_norm_c.get()
}

///|
let im_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IM_NORM")

///|
/// `IM_NORM`
pub fn im_norm() -> @kernel.Thm {
  im_norm_c.get()
}

///|
let abs_re_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_RE_NORM")

///|
/// `ABS_RE_NORM`
pub fn abs_re_norm() -> @kernel.Thm {
  abs_re_norm_c.get()
}

///|
let abs_im_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_IM_NORM")

///|
/// `ABS_IM_NORM`
pub fn abs_im_norm() -> @kernel.Thm {
  abs_im_norm_c.get()
}

///|
/// RE_NORM, IM_NORM, ABS_RE_NORM, ABS_IM_NORM
fn step_4() -> Unit raise {
  match gconjuncts(re_im_norm()) {
    More(re_norm, tail=More(im_norm, tail=More(abs_re_norm, tail=More(abs_im_norm, tail=Empty)))) => {
      re_norm_c.set(re_norm)
      im_norm_c.set(im_norm)
      abs_re_norm_c.set(abs_re_norm)
      abs_im_norm_c.set(abs_im_norm)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:62:4")
  }
}

///|
/// NORM_RE
fn step_5() -> Unit raise {
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec_all(abs_re_norm()))), @calc_rat.real_arith_tac)
  norm_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], real_of_num(0) <= norm(x) + Re(x) && real_of_num(0) <= norm(x) - Re(x)"), t18))
}

///|
let norm_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_RE")

///|
/// `NORM_RE`
pub fn norm_re() -> @kernel.Thm {
  norm_re_c.get()
}

///|
let norm_re_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_RE_ADD")

///|
/// `NORM_RE_ADD`
pub fn norm_re_add() -> @kernel.Thm {
  norm_re_add_c.get()
}

///|
let norm_re_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_RE_SUB")

///|
/// `NORM_RE_SUB`
pub fn norm_re_sub() -> @kernel.Thm {
  norm_re_sub_c.get()
}

///|
/// NORM_RE_ADD, NORM_RE_SUB
fn step_6() -> Unit raise {
  match gconjuncts(norm_re()) {
    More(norm_re_add, tail=More(norm_re_sub, tail=Empty)) => {
      norm_re_add_c.set(norm_re_add)
      norm_re_sub_c.set(norm_re_sub)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:68:4")
  }
}

///|
/// NORM2_ADD_REAL
fn step_7() -> Unit raise {
  let t19 = @simp.simp_tac(@list.List([@complexes.real(), @complexes.complex_norm(), @complexes.re_add(), @complexes.im_add(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @calc_int.real_neg_0(), @realax.real_add_lid(), @calc_int.real_add_rid(), @real.real_pow_zero(), @int.arith_rule(@term_syntax.parse_term("!(2 == 0)")), @real.real_le_pow_2(), @real.sqrt_pow_2(), @realarith.real_le_add()]))
  norm2_add_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], real(x) && real(y) → pow(norm(x + ii * y), 2) == pow(norm(x), 2) + pow(norm(y), 2)"), t19))
}

///|
let norm2_add_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM2_ADD_REAL")

///|
/// `NORM2_ADD_REAL`
pub fn norm2_add_real() -> @kernel.Thm {
  norm2_add_real_c.get()
}

///|
/// COMPLEX_EQ_RCANCEL_IMP
fn step_8() -> Unit raise {
  let t20 = @bool.spec_all(@complexes.complex_eq_mul_rcancel())
  complex_eq_rcancel_imp_c.set(@bool.gen_all(@drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("(p : Bool) == ((r : Bool) || (q : Bool)) → p && !r → q")))(t20)))
}

///|
let complex_eq_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_EQ_RCANCEL_IMP")

///|
/// `COMPLEX_EQ_RCANCEL_IMP`
pub fn complex_eq_rcancel_imp() -> @kernel.Thm {
  complex_eq_rcancel_imp_c.get()
}

///|
/// COMPLEX_BALANCE_DIV_MUL
fn step_9() -> Unit raise {
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(y : Cart[Real, 2]) / (z : Cart[Real, 2]) * (t : Cart[Real, 2]) * z == y / z * z * t"))])), t30)
  let t32 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t31])
  let t29 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, 2]) == (y : Cart[Real, 2]) / (z : Cart[Real, 2]) * (t : Cart[Real, 2])) == (x * z == y / z * t * z)"), (x28 : @kernel.Thm) => single(@simp.rewrite_tac, x28))
  let t27 = @tactics.pop_assum(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x21
    let t24 = @term_syntax.parse_term("(z : Cart[Real, 2])")
    let t25 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t24]), @complexes.complex_div_rmul())
    let t26 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([x]))(t25))
    let t23 = @bool.spec_all(@complexes.complex_eq_mul_rcancel())
    @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([x]))(t23)), t26)
  })
  let t33 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t27), t29), t32)
  complex_balance_div_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ t : Cart[Real, 2], !(z == Cx(real_of_num(0))) → (x == y / z * t) == (x * z == y * t)"), t33))
}

///|
let complex_balance_div_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_BALANCE_DIV_MUL")

///|
/// `COMPLEX_BALANCE_DIV_MUL`
pub fn complex_balance_div_mul() -> @kernel.Thm {
  complex_balance_div_mul_c.get()
}

///|
/// CSQRT_MUL_LCX_LT
fn step_10() -> Unit raise {
  let t163 = @meson.asm_meson_tac(@list.List([@real.sqrt_mul(), norm_re_sub()]))
  let t164 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("Im((y : Cart[Real, 2])) / abs(Im(y)) * (sqrt((x : Real)) * (sqrt(norm(y) - Re(y)) / sqrt(real_of_num(2)))) == Im(y) / abs(Im(y)) * (sqrt(x) * sqrt(norm(y) - Re(y)) / sqrt(real_of_num(2)))"), fn(x160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s161 = @tactics.assume_tac(x160)
    fn(x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s161(x162)
    }
  }), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t163)
  let t159 = @meson.asm_meson_tac(@list.List([@real.sqrt_mul(), norm_re_add()]))
  let t165 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("sqrt((x : Real)) * (sqrt(norm((y : Cart[Real, 2])) + Re(y)) / sqrt(real_of_num(2))) == sqrt(x) * sqrt(norm(y) + Re(y)) / sqrt(real_of_num(2))"), fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.assume_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  }), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t159), t164])
  let t155 = @simp.simp_tac(@list.List([@complexes.re(), @complexes.im()]))
  let t154 = @simp.simp_tac(@list.List([@complexes.complex_eq()]))
  let t153 = @list.List([@simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()])), @tactics.all_tac])
  let t152 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (x : Real)"), fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.assume_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  })
  let t148 = @simp.asm_simp_tac(@list.List([]))
  let t146 = @list.List([@simp.simp_tac(@list.List([norm_re_add()])), @calc_rat.real_arith_tac])
  let t147 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.simp_tac(@list.List([@real.sqrt_div()])), @tactics.conj_tac), t146), @tactics.all_tac])
  let t145 = @tactics.subgoal_then(@term_syntax.parse_term("sqrt((norm((y : Cart[Real, 2])) + Re(y)) / real_of_num(2)) == sqrt(norm(y) + Re(y)) / sqrt(real_of_num(2))"), fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s143 = @tactics.assume_tac(x142)
    fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s143(x144)
    }
  })
  let t139 = @simp.simp_tac(@list.List([norm_re_add()]))
  let t140 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_le_mul_eq(), @realarith.real_lt_imp_le()])), t139), @calc_rat.real_arith_tac])
  let t141 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.simp_tac(@list.List([@real.sqrt_div()])), @tactics.conj_tac), t140), @tactics.all_tac])
  let t138 = @tactics.subgoal_then(@term_syntax.parse_term("sqrt((x : Real) * (norm((y : Cart[Real, 2])) + Re(y)) / real_of_num(2)) == sqrt(x * (norm(y) + Re(y))) / sqrt(real_of_num(2))"), fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s136 = @tactics.assume_tac(x135)
    fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s136(x137)
    }
  })
  let t134 = @simp.asm_simp_tac(@list.List([]))
  let t132 = @list.List([@simp.simp_tac(@list.List([norm_re_sub()])), @calc_rat.real_arith_tac])
  let t133 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.simp_tac(@list.List([@real.sqrt_div()])), @tactics.conj_tac), t132), @tactics.all_tac])
  let t131 = @tactics.subgoal_then(@term_syntax.parse_term("sqrt((norm((y : Cart[Real, 2])) - Re(y)) / real_of_num(2)) == sqrt(norm(y) - Re(y)) / sqrt(real_of_num(2))"), fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.assume_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  })
  let t127 = @simp.asm_simp_tac(@list.List([]))
  let t124 = @simp.simp_tac(@list.List([norm_re_sub()]))
  let t125 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_le_mul_eq(), @realarith.real_lt_imp_le()])), t124), @calc_rat.real_arith_tac])
  let t126 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.simp_tac(@list.List([@real.sqrt_div()])), @tactics.conj_tac), t125), @tactics.all_tac])
  let t123 = @tactics.subgoal_then(@term_syntax.parse_term("sqrt((x : Real) * (norm((y : Cart[Real, 2])) - Re(y)) / real_of_num(2)) == sqrt(x * (norm(y) - Re(y))) / sqrt(real_of_num(2))"), fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s121 = @tactics.assume_tac(x120)
    fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s121(x122)
    }
  })
  let t119 = @simp.asm_simp_tac(@list.List([]))
  let t118 = @list.List([@simp.simp_tac(@list.List([@real.real_mul_ac()])), @tactics.all_tac])
  let t117 = @tactics.subgoal_then(@term_syntax.parse_term("sqrt((x : Real)) * (Im((y : Cart[Real, 2])) / abs(Im(y)) * sqrt((norm(y) - Re(y)) / real_of_num(2))) == Im(y) / abs(Im(y)) * (sqrt(x) * sqrt((norm(y) - Re(y)) / real_of_num(2)))"), fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s115 = @tactics.assume_tac(x114)
    fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s115(x116)
    }
  })
  let t113 = @simp.asm_simp_tac(@list.List([]))
  let t111 = @simp.simp_tac(@list.List([@real.real_mul_ac()]))
  let t110 = @simp.simp_tac(@list.List([@realax.real_mul_lid()]))
  let t109 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), @real.real_lt_imp_nz()]))
  let t108 = @list.List([@simp.simp_tac(@list.List([@real.real_mul_ac()])), @tactics.all_tac])
  let t107 = @tactics.subgoal_then(@term_syntax.parse_term("Im((y : Cart[Real, 2])) * ((x : Real) * (inv(x) * inv(abs(Im(y))))) == Im(y) * (x * inv(x) * inv(abs(Im(y))))"), fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s105 = @tactics.assume_tac(x104)
    fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s105(x106)
    }
  })
  let t103 = @simp.once_rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t102 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t101 = @simp.simp_tac(@list.List([@real.real_inv_mul()]))
  let t112 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realax.real_div()])), t101), t102), t103), t107), t108), t109), t110), t111), @tactics.all_tac])
  let t100 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Real) * Im((y : Cart[Real, 2])) / (x * abs(Im(y))) == Im(y) / abs(Im(y))"), fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s98 = @tactics.assume_tac(x97)
    fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s98(x99)
    }
  })
  let t95 = @equal.gsym(@real.real_sub_ldistrib())
  let t96 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_add_ldistrib()), t95]))
  let t94 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_abs_refl())]))
  let t93 = @simp.simp_tac(@list.List([@real.real_abs_mul()]))
  let t92 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_abs_refl())]))
  let t91 = @tactics.pop_assum(fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s89 = @tactics.mp_tac(x88)
    fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s89(x90)
    }
  })
  let t87 = @simp.simp_tac(@list.List([@vectors.norm_mul()]))
  let t86 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_rule(@list.List([@complexes.cx_def(), @complexes.complex_mul(), @complexes.re(), @complexes.im(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @real.real_sub_rzero()]))(@complexes.complex_cmul()))]))
  let t83 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) < (y : Real) && y < x)"))]))
  let t84 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) < (y : Real) && !(x <= y))"))]))
  let t85 = @list.List([@simp.simp_tac(@list.List([@calc_int.real_neg_0(), @real.sqrt_0(), @calc_int.real_mul_rzero()])), t84, t83, @tactics.all_tac])
  let t75 = @simp.simp_tac(@list.List([@class.de_morgan_thm()]))
  let t74 = @simp.simp_tac(@list.List([@realarith.real_entire()]))
  let t76 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s72 = @tactics.mp_tac(x71)
    fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s72(x73)
    }
  })), t74), t75)
  let t70 = @simp.simp_tac(@list.List([@class.de_morgan_thm()]))
  let t69 = @simp.simp_tac(@list.List([@realarith.real_entire()]))
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s67 = @tactics.mp_tac(x66)
    fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s67(x68)
    }
  })), t69), t70)
  let t65 = @meson.meson_tac(@list.List([@real.real_lt_imp_nz()]))
  let t64 = @simp.simp_tac(@list.List([@realarith.real_entire()]))
  let t78 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s62 = @tactics.mp_tac(x61)
    fn(x63 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s62(x63)
    }
  })), t64), t65)
  let t60 = @meson.meson_tac(@list.List([@realarith.real_lt_imp_le(), @real.sqrt_mul()]))
  let t59 = @simp.simp_tac(@list.List([@equal.gsym(@real.real_neg_gt0())]))
  let t58 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) <= (y : Real)) == (y < real_of_num(0))"))]))
  let t57 = @tactics.repeat_tac(@tactics.pop_assum(fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s55 = @tactics.mp_tac(x54)
    fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s55(x56)
    }
  }))
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@real.real_neg_rmul()])), t57), t58), t59), t60)
  let t80 = @meson.asm_meson_tac(@list.List([@real.real_le_mul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) <= (y : Real)) == (real_of_num(0) > y)"))]))
  let t53 = @meson.meson_tac(@list.List([@real.real_lt_imp_nz()]))
  let t52 = @simp.simp_tac(@list.List([@realarith.real_entire()]))
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s50 = @tactics.mp_tac(x49)
    fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s50(x51)
    }
  })), t52), t53)
  let t48 = @simp.asm_rewrite_tac(@list.List([@real.sqrt_0(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]))
  let t47 = @tactics.repeat_tac(@tactics.strip_tac)
  let t46 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @real.real_mul_pos_le()]))
  let t82 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s44 = @tactics.mp_tac(x43)
    fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s44(x45)
    }
  })), t46), t47), t48), t81, t80, t79, t78, t77, t76, @tactics.all_tac])
  let t42 = @simp.asm_simp_tac(@list.List([@complexes.im(), @complexes.re(), @calc_int.real_mul_rzero(), @real.sqrt_mul()]))
  let t39 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t41 = @tactics.first_assum(fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s37 = @tactics.assume_tac(x36)
      fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s37(x38)
      }
    })(t39(x40))
  })
  let t35 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t34 = @tactics.repeat_tac(@tactics.strip_tac)
  let t166 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.csqrt(), @complexes.complex_mul(), @complexes.im(), @complexes.re(), @complexes.im_cx(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @complexes.re_cx(), @real.real_sub_rzero()])), t34), t35), t41), t42), t82), t85), t86), t87), t91), t92), @tactics.disch_tac), t93), t94), t96), t100), t112), t113), t117), t118), t119), t123), t126), t127), t131), t133), t134), t138), t141), t145), t147), t148), t152), t153), t154), t155), @tactics.conj_tac), t165)
  csqrt_mul_lcx_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Cart[Real, 2], real_of_num(0) < x → csqrt(Cx(x) * y) == Cx(sqrt(x)) * csqrt(y)"), t166))
}

///|
let csqrt_mul_lcx_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_MUL_LCX_LT")

///|
/// `CSQRT_MUL_LCX_LT`
pub fn csqrt_mul_lcx_lt() -> @kernel.Thm {
  csqrt_mul_lcx_lt_c.get()
}

///|
/// CSQRT_MUL_LCX
fn step_11() -> Unit raise {
  let t170 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @real.sqrt_0(), @complexes.csqrt_0()]))
  let t169 = @simp.expand_tac("x")
  let t168 = @simp.asm_simp_tac(@list.List([csqrt_mul_lcx_lt()]))
  let t167 = @tactics.repeat_tac(@tactics.strip_tac)
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_le_lt()])), t167), t168), t169), t170)
  csqrt_mul_lcx_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Cart[Real, 2], real_of_num(0) <= x → csqrt(Cx(x) * y) == Cx(sqrt(x)) * csqrt(y)"), t171))
}

///|
let csqrt_mul_lcx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSQRT_MUL_LCX")

///|
/// `CSQRT_MUL_LCX`
pub fn csqrt_mul_lcx() -> @kernel.Thm {
  csqrt_mul_lcx_c.get()
}

///|
/// REAL_ADD_POW_2
fn step_12() -> Unit raise {
  real_add_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, pow(x + y, 2) == pow(x, 2) + (pow(y, 2) + real_of_num(2) * (x * y))"), @calc_rat.real_arith_tac))
}

///|
let real_add_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_POW_2")

///|
/// `REAL_ADD_POW_2`
pub fn real_add_pow_2() -> @kernel.Thm {
  real_add_pow_2_c.get()
}

///|
/// COMPLEX_ADD_POW_2
fn step_13() -> Unit raise {
  let t172 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_pow_2()])), @complexes.simple_complex_arith_tac)
  complex_add_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], pow(x + y, 2) == pow(x, 2) + (pow(y, 2) + Cx(real_of_num(2)) * (x * y))"), t172))
}

///|
let complex_add_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_POW_2")

///|
/// `COMPLEX_ADD_POW_2`
pub fn complex_add_pow_2() -> @kernel.Thm {
  complex_add_pow_2_c.get()
}

///|
/// Multivariate/cvectors.ml:201
fn step_14() -> Unit raise {
  @vectors.prioritize_vector(())
}

///|
/// FINITE_INTER_ENUM
fn step_15() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([@sets.finite_inter(), @iterate.finite_numseg()]))
  finite_inter_enum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ n : Num, FINITE(INTER(s, op_dot_dot(0, n)))"), t173))
}

///|
let finite_inter_enum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INTER_ENUM")

///|
/// `FINITE_INTER_ENUM`
pub fn finite_inter_enum() -> @kernel.Thm {
  finite_inter_enum_c.get()
}

///|
/// NORM_PASTECART_GE1
fn step_16() -> Unit raise {
  let t174 = @meson.meson_tac(@list.List([@cart.fstcart_pastecart(), @vectors.norm_fstcart()]))
  norm_pastecart_ge1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], norm(x) <= norm(pastecart(x, y))"), t174))
}

///|
let norm_pastecart_ge1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_PASTECART_GE1")

///|
/// `NORM_PASTECART_GE1`
pub fn norm_pastecart_ge1() -> @kernel.Thm {
  norm_pastecart_ge1_c.get()
}

///|
/// NORM_PASTECART_GE2
fn step_17() -> Unit raise {
  let t175 = @meson.meson_tac(@list.List([@cart.sndcart_pastecart(), @vectors.norm_sndcart()]))
  norm_pastecart_ge2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], norm(y) <= norm(pastecart(x, y))"), t175))
}

///|
let norm_pastecart_ge2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_PASTECART_GE2")

///|
/// `NORM_PASTECART_GE2`
pub fn norm_pastecart_ge2() -> @kernel.Thm {
  norm_pastecart_ge2_c.get()
}

///|
/// SUMS_PASTECART
fn step_18() -> Unit raise {
  let t176 = @equal.gsym(@topology.lim_pastecart_eq())
  let t177 = @simp.simp_tac(@list.List([@topology.sums(), finite_inter_enum(), @equal.gsym(@vectors.pastecart_vsum()), t176]))
  sums_pastecart_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ f1 : (Num) -> Cart[Real, N], ∀ f2 : (Num) -> Cart[Real, M], ∀ l1 : Cart[Real, N], ∀ l2 : Cart[Real, M], (sums(f1, l1, s) && sums(f2, l2, s)) == sums((x : Num) => pastecart(f1(x), f2(x)), pastecart(l1, l2), s)"), t177))
}

///|
let sums_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_PASTECART")

///|
/// `SUMS_PASTECART`
pub fn sums_pastecart() -> @kernel.Thm {
  sums_pastecart_c.get()
}

///|
/// LINEAR_SUMS
fn step_19() -> Unit raise {
  let t178 = @simp.rewrite_rule(@list.List([@trivia.o_def(), @topology.continuous_at_sequentially()]))(@topology.linear_continuous_at())
  let t179 = @simp.simp_tac(@list.List([@topology.sums(), finite_inter_enum(), @equal.gsym(@vectors.linear_vsum()), t178]))
  linear_sums_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ f : (Num) -> Cart[Real, _], ∀ l : Cart[Real, _], ∀ g : (Cart[Real, _]) -> Cart[Real, _], linear(g) → sums(f, l, s) → sums(o(g, f), g(l), s)"), t179))
}

///|
let linear_sums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_SUMS")

///|
/// `LINEAR_SUMS`
pub fn linear_sums() -> @kernel.Thm {
  linear_sums_c.get()
}

///|
/// real_of_complex
fn step_20() -> Unit raise {
  real_of_complex_c.set(@pair.new_definition(@term_syntax.parse_term("(real_of_complex : (Cart[Real, 2]) -> Real)((c : Cart[Real, 2])) == select((r : Real) => c == Cx(r))")))
}

///|
let real_of_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_of_complex")

///|
/// `real_of_complex`
pub fn real_of_complex() -> @kernel.Thm {
  real_of_complex_c.get()
}

///|
/// REAL_OF_COMPLEX
fn step_21() -> Unit raise {
  let t180 = @meson.meson_tac(@list.List([@complexes.real_v1(), real_of_complex()]))
  real_of_complex_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], real(c) → Cx(real_of_complex(c)) == c"), t180))
}

///|
let real_of_complex_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX")

///|
/// `REAL_OF_COMPLEX`
pub fn real_of_complex_v1() -> @kernel.Thm {
  real_of_complex_v1_c.get()
}

///|
/// REAL_OF_COMPLEX_RE
fn step_22() -> Unit raise {
  let t181 = @meson.meson_tac(@list.List([@complexes.re_cx(), real_of_complex_v1()]))
  real_of_complex_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], real(c) → real_of_complex(c) == Re(c)"), t181))
}

///|
let real_of_complex_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_RE")

///|
/// `REAL_OF_COMPLEX_RE`
pub fn real_of_complex_re() -> @kernel.Thm {
  real_of_complex_re_c.get()
}

///|
/// REAL_OF_COMPLEX_CX
fn step_23() -> Unit raise {
  let t182 = @simp.simp_tac(@list.List([@complexes.real_cx(), real_of_complex_re(), @complexes.re_cx()]))
  real_of_complex_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Real, real_of_complex(Cx(r)) == r"), t182))
}

///|
let real_of_complex_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_CX")

///|
/// `REAL_OF_COMPLEX_CX`
pub fn real_of_complex_cx() -> @kernel.Thm {
  real_of_complex_cx_c.get()
}

///|
/// REAL_OF_COMPLEX_NORM
fn step_24() -> Unit raise {
  let t183 = @meson.meson_tac(@list.List([@complexes.real_norm(), real_of_complex_re()]))
  real_of_complex_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], real(c) → norm(c) == abs(real_of_complex(c))"), t183))
}

///|
let real_of_complex_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_NORM")

///|
/// `REAL_OF_COMPLEX_NORM`
pub fn real_of_complex_norm() -> @kernel.Thm {
  real_of_complex_norm_c.get()
}

///|
/// REAL_OF_COMPLEX_ADD
fn step_25() -> Unit raise {
  let t184 = @meson.meson_tac(@list.List([@complexes.real_add(), real_of_complex_re(), @complexes.re_add()]))
  real_of_complex_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], real(x) && real(y) → real_of_complex(x + y) == real_of_complex(x) + real_of_complex(y)"), t184))
}

///|
let real_of_complex_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_ADD")

///|
/// `REAL_OF_COMPLEX_ADD`
pub fn real_of_complex_add() -> @kernel.Thm {
  real_of_complex_add_c.get()
}

///|
/// REAL_MUL
fn step_26() -> Unit raise {
  let t185 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real()])), @complexes.simple_complex_arith_tac)
  real_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], real(x) && real(y) → real(x * y)"), t185))
}

///|
let real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL")

///|
/// `REAL_MUL`
pub fn real_mul() -> @kernel.Thm {
  real_mul_c.get()
}

///|
/// REAL_OF_COMPLEX_MUL
fn step_27() -> Unit raise {
  let t186 = @meson.meson_tac(@list.List([real_mul(), real_of_complex_v1(), @complexes.cx_mul(), real_of_complex_cx()]))
  real_of_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], real(x) && real(y) → real_of_complex(x * y) == real_of_complex(x) * real_of_complex(y)"), t186))
}

///|
let real_of_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_MUL")

///|
/// `REAL_OF_COMPLEX_MUL`
pub fn real_of_complex_mul() -> @kernel.Thm {
  real_of_complex_mul_c.get()
}

///|
/// REAL_OF_COMPLEX_0
fn step_28() -> Unit raise {
  let t188 = @simp.asm_simp_tac(@list.List([real_of_complex_cx(), @complexes.cx_inj()]))
  let t187 = @tactics.repeat_tac(@tactics.strip_tac)
  let t189 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real_exists()])), t187), t188)
  real_of_complex_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], real(x) → (real_of_complex(x) == real_of_num(0)) == (x == Cx(real_of_num(0)))"), t189))
}

///|
let real_of_complex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_0")

///|
/// `REAL_OF_COMPLEX_0`
pub fn real_of_complex_0() -> @kernel.Thm {
  real_of_complex_0_c.get()
}

///|
/// REAL_COMPLEX_ADD_CNJ
fn step_29() -> Unit raise {
  let t190 = @simp.rewrite_tac(@list.List([@complexes.complex_add_cnj(), @complexes.real_cx()]))
  real_complex_add_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], real(cnj(x) + x) && real(x + cnj(x))"), t190))
}

///|
let real_complex_add_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_COMPLEX_ADD_CNJ")

///|
/// `REAL_COMPLEX_ADD_CNJ`
pub fn real_complex_add_cnj() -> @kernel.Thm {
  real_complex_add_cnj_c.get()
}

///|
/// vector_const
fn step_30() -> Unit raise {
  vector_const_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_const : (A) -> Cart[A, N])((k : A)) == lambda((i : Num) => k)")))
}

///|
let vector_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_const")

///|
/// `vector_const`
pub fn vector_const() -> @kernel.Thm {
  vector_const_c.get()
}

///|
/// vector_map
fn step_31() -> Unit raise {
  vector_map_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_map : ((A) -> B, Cart[A, N]) -> Cart[B, N])((f : (A) -> B), (v : Cart[A, N])) == lambda((i : Num) => f(op_dollar(v, i)))")))
}

///|
let vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_map")

///|
/// `vector_map`
pub fn vector_map() -> @kernel.Thm {
  vector_map_c.get()
}

///|
/// vector_map2
fn step_32() -> Unit raise {
  vector_map2_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_map2 : ((A, B) -> C, Cart[A, N], Cart[B, N]) -> Cart[C, N])((f : (A, B) -> C), (v1 : Cart[A, N]), (v2 : Cart[B, N])) == lambda((i : Num) => f(op_dollar(v1, i), op_dollar(v2, i)))")))
}

///|
let vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_map2")

///|
/// `vector_map2`
pub fn vector_map2() -> @kernel.Thm {
  vector_map2_c.get()
}

///|
/// vector_map3
fn step_33() -> Unit raise {
  vector_map3_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_map3 : ((A, B, C) -> D, Cart[A, N], Cart[B, N], Cart[C, N]) -> Cart[D, N])((f : (A, B, C) -> D), (v1 : Cart[A, N]), (v2 : Cart[B, N]), (v3 : Cart[C, N])) == lambda((i : Num) => f(op_dollar(v1, i), op_dollar(v2, i), op_dollar(v3, i)))")))
}

///|
let vector_map3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_map3")

///|
/// `vector_map3`
pub fn vector_map3() -> @kernel.Thm {
  vector_map3_c.get()
}

///|
/// FINITE_INDEX_INRANGE_2
fn step_34() -> Unit raise {
  let t191 = @meson.meson_tac(@list.List([@cart.finite_index_works()]))
  let t192 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.finite_index()])), t191)
  finite_index_inrange_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∃ k : Num, 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (∀ x : Cart[A, N], (op_dollar : (Cart[A, N], Num) -> A)(x, i) == (op_dollar : (Cart[A, N], Num) -> A)(x, k)) && (∀ x : Cart[B, N], (op_dollar : (Cart[B, N], Num) -> B)(x, i) == (op_dollar : (Cart[B, N], Num) -> B)(x, k)) && (∀ x : Cart[C, N], (op_dollar : (Cart[C, N], Num) -> C)(x, i) == (op_dollar : (Cart[C, N], Num) -> C)(x, k)) && (∀ x : Cart[D, N], (op_dollar : (Cart[D, N], Num) -> D)(x, i) == (op_dollar : (Cart[D, N], Num) -> D)(x, k))"), t192))
}

///|
let finite_index_inrange_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INDEX_INRANGE_2")

///|
/// `FINITE_INDEX_INRANGE_2`
pub fn finite_index_inrange_2() -> @kernel.Thm {
  finite_index_inrange_2_c.get()
}

///|
/// `COMPONENT_TAC`
pub fn component_tac(x193 : @kernel.Thm) -> @tactics.Tactic raise {
  let x = x193
  let t196 = @simp.asm_simp_tac(@list.List([x, @cart.lambda_beta()]))
  let t195 = @tactics.choose_tac(@bool.spec_all(finite_index_inrange_2()))
  @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t195), t196)
}

///|
/// VECTOR_CONST_COMPONENT
fn step_35() -> Unit raise {
  let t197 = component_tac(vector_const())
  vector_const_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ k : A, (op_dollar : (Cart[A, N], Num) -> A)((vector_const : (A) -> Cart[A, N])(k), i) == k"), t197))
}

///|
let vector_const_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_CONST_COMPONENT")

///|
/// `VECTOR_CONST_COMPONENT`
pub fn vector_const_component() -> @kernel.Thm {
  vector_const_component_c.get()
}

///|
/// VECTOR_MAP_COMPONENT
fn step_36() -> Unit raise {
  let t198 = component_tac(vector_map())
  vector_map_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ f : (A) -> B, ∀ v : Cart[A, N], op_dollar(vector_map(f, v), i) == f(op_dollar(v, i))"), t198))
}

///|
let vector_map_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_COMPONENT")

///|
/// `VECTOR_MAP_COMPONENT`
pub fn vector_map_component() -> @kernel.Thm {
  vector_map_component_c.get()
}

///|
/// VECTOR_MAP2_COMPONENT
fn step_37() -> Unit raise {
  let t199 = component_tac(vector_map2())
  vector_map2_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ f : (A, B) -> C, ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], op_dollar(vector_map2(f, v1, v2), i) == f(op_dollar(v1, i), op_dollar(v2, i))"), t199))
}

///|
let vector_map2_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_COMPONENT")

///|
/// `VECTOR_MAP2_COMPONENT`
pub fn vector_map2_component() -> @kernel.Thm {
  vector_map2_component_c.get()
}

///|
/// VECTOR_MAP3_COMPONENT
fn step_38() -> Unit raise {
  let t200 = component_tac(vector_map3())
  vector_map3_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ f : (A, B, C) -> D, ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], ∀ v3 : Cart[C, N], op_dollar(vector_map3(f, v1, v2, v3), i) == f(op_dollar(v1, i), op_dollar(v2, i), op_dollar(v3, i))"), t200))
}

///|
let vector_map3_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP3_COMPONENT")

///|
/// `VECTOR_MAP3_COMPONENT`
pub fn vector_map3_component() -> @kernel.Thm {
  vector_map3_component_c.get()
}

///|
/// COMMON_TAC
fn step_39() -> Unit raise {
  let t202 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @trivia.o_def()]))
  let t201 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  common_tac_v1_c.set(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([vector_const(), vector_map(), vector_map2(), vector_map3()])), t201), t202))
}

///|
let common_tac_v1_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("COMMON_TAC")

///|
/// `COMMON_TAC`
pub fn common_tac_v1(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (common_tac_v1_c.get())(x)
}

///|
/// VECTOR_MAP_VECTOR_CONST
fn step_40() -> Unit raise {
  vector_map_vector_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ k : A, (vector_map : ((A) -> B, Cart[A, N]) -> Cart[B, N])(f, (vector_const : (A) -> Cart[A, N])(k)) == (vector_const : (B) -> Cart[B, N])(f(k))"), common_tac_v1))
}

///|
let vector_map_vector_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_VECTOR_CONST")

///|
/// `VECTOR_MAP_VECTOR_CONST`
pub fn vector_map_vector_const() -> @kernel.Thm {
  vector_map_vector_const_c.get()
}

///|
/// VECTOR_MAP_VECTOR_MAP
fn step_41() -> Unit raise {
  vector_map_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (C) -> A, ∀ v : Cart[C, N], vector_map(f, vector_map(g, v)) == vector_map(o(f, g), v)"), common_tac_v1))
}

///|
let vector_map_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_VECTOR_MAP")

///|
/// `VECTOR_MAP_VECTOR_MAP`
pub fn vector_map_vector_map() -> @kernel.Thm {
  vector_map_vector_map_c.get()
}

///|
/// VECTOR_MAP_VECTOR_MAP2
fn step_42() -> Unit raise {
  vector_map_vector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (C, D) -> A, ∀ u : Cart[C, N], ∀ v : Cart[D, N], vector_map(f, vector_map2(g, u, v)) == vector_map2((x : C) => (y : D) => f(g(x, y)), u, v)"), common_tac_v1))
}

///|
let vector_map_vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_VECTOR_MAP2")

///|
/// `VECTOR_MAP_VECTOR_MAP2`
pub fn vector_map_vector_map2() -> @kernel.Thm {
  vector_map_vector_map2_c.get()
}

///|
/// VECTOR_MAP2_LVECTOR_CONST
fn step_43() -> Unit raise {
  vector_map2_lvector_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ k : A, ∀ v : Cart[B, N], vector_map2(f, vector_const(k), v) == vector_map(f(k), v)"), common_tac_v1))
}

///|
let vector_map2_lvector_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_LVECTOR_CONST")

///|
/// `VECTOR_MAP2_LVECTOR_CONST`
pub fn vector_map2_lvector_const() -> @kernel.Thm {
  vector_map2_lvector_const_c.get()
}

///|
/// VECTOR_MAP2_RVECTOR_CONST
fn step_44() -> Unit raise {
  vector_map2_rvector_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ k : B, ∀ v : Cart[A, N], vector_map2(f, v, vector_const(k)) == vector_map((x : A) => f(x, k), v)"), common_tac_v1))
}

///|
let vector_map2_rvector_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_RVECTOR_CONST")

///|
/// `VECTOR_MAP2_RVECTOR_CONST`
pub fn vector_map2_rvector_const() -> @kernel.Thm {
  vector_map2_rvector_const_c.get()
}

///|
/// VECTOR_MAP2_LVECTOR_MAP
fn step_45() -> Unit raise {
  vector_map2_lvector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ g : (D) -> A, ∀ v1 : Cart[D, N], ∀ v2 : Cart[B, N], vector_map2(f, vector_map(g, v1), v2) == vector_map2(o(f, g), v1, v2)"), common_tac_v1))
}

///|
let vector_map2_lvector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_LVECTOR_MAP")

///|
/// `VECTOR_MAP2_LVECTOR_MAP`
pub fn vector_map2_lvector_map() -> @kernel.Thm {
  vector_map2_lvector_map_c.get()
}

///|
/// VECTOR_MAP2_RVECTOR_MAP
fn step_46() -> Unit raise {
  vector_map2_rvector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ g : (D) -> B, ∀ v1 : Cart[A, N], ∀ v2 : Cart[D, N], vector_map2(f, v1, vector_map(g, v2)) == vector_map2((x : A) => (y : D) => f(x, g(y)), v1, v2)"), common_tac_v1))
}

///|
let vector_map2_rvector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_RVECTOR_MAP")

///|
/// `VECTOR_MAP2_RVECTOR_MAP`
pub fn vector_map2_rvector_map() -> @kernel.Thm {
  vector_map2_rvector_map_c.get()
}

///|
/// VECTOR_MAP2_LVECTOR_MAP2
fn step_47() -> Unit raise {
  vector_map2_lvector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ g : (D, E) -> A, ∀ v1 : Cart[D, N], ∀ v2 : Cart[E, N], ∀ v3 : Cart[B, N], vector_map2(f, vector_map2(g, v1, v2), v3) == vector_map3((x : D) => (y : E) => f(g(x, y)), v1, v2, v3)"), common_tac_v1))
}

///|
let vector_map2_lvector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_LVECTOR_MAP2")

///|
/// `VECTOR_MAP2_LVECTOR_MAP2`
pub fn vector_map2_lvector_map2() -> @kernel.Thm {
  vector_map2_lvector_map2_c.get()
}

///|
/// VECTOR_MAP2_RVECTOR_MAP2
fn step_48() -> Unit raise {
  vector_map2_rvector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ g : (D, E) -> B, ∀ v1 : Cart[A, N], ∀ v2 : Cart[D, N], ∀ v3 : Cart[E, N], vector_map2(f, v1, vector_map2(g, v2, v3)) == vector_map3((x : A) => (y : D) => (z : E) => f(x, g(y, z)), v1, v2, v3)"), common_tac_v1))
}

///|
let vector_map2_rvector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_RVECTOR_MAP2")

///|
/// `VECTOR_MAP2_RVECTOR_MAP2`
pub fn vector_map2_rvector_map2() -> @kernel.Thm {
  vector_map2_rvector_map2_c.get()
}

///|
/// VECTOR_MAP_SIMP_TAC
fn step_49() -> Unit raise {
  vector_map_simp_tac_c.set(@simp.rewrite_tac(@list.List([vector_map_vector_const(), vector_map2_lvector_const(), vector_map2_rvector_const(), vector_map_vector_map(), vector_map2_rvector_map(), vector_map2_lvector_map(), vector_map2_rvector_map2(), vector_map2_lvector_map2(), vector_map_vector_map2()])))
}

///|
let vector_map_simp_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VECTOR_MAP_SIMP_TAC")

///|
/// `VECTOR_MAP_SIMP_TAC`
pub fn vector_map_simp_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vector_map_simp_tac_c.get())(x)
}

///|
/// `VECTOR_MAP_PROPERTY_TAC`
pub fn vector_map_property_tac(x203 : @list.List[@kernel.Thm], x204 : @kernel.Thm) -> @tactics.Tactic raise {
  let fs = x203
  let prop = x204
  let t207 = @simp.rewrite_tac(@list.List([vector_map_component(), vector_map2_component(), vector_map3_component(), vector_const_component(), @trivia.o_def(), prop]))
  let t206 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(fs), vector_map_simp_tac), t206), t207)
}

///|
/// `VECTOR_MAP_PROPERTY`
pub fn vector_map_property(x208 : @kernel.Term, x209 : @list.List[@kernel.Thm], x210 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x208
  let f = x209
  let prop = x210
  @tactics.prove(thm, vector_map_property_tac(f, prop))
}

///|
/// COMPLEX_VECTOR_MAP
fn step_50() -> Unit raise {
  let t212 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @cart.lambda_beta(), @vectors.vector_2(), @complexes.re_def(), @complexes.im_def()]))
  let t211 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.gen_tac, @tactics.eq_tac))
  let t213 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([vector_map(), @class.fun_eq_thm(), @complexes.complex()])), t211), t212)
  complex_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Real) -> Real, (f == vector_map(g)) == (∀ z : Cart[Real, 2], f(z) == complex((g(Re(z)), g(Im(z)))))"), t213))
}

///|
let complex_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_VECTOR_MAP")

///|
/// `COMPLEX_VECTOR_MAP`
pub fn complex_vector_map() -> @kernel.Thm {
  complex_vector_map_c.get()
}

///|
/// COMPLEX_NEG_IS_A_MAP
fn step_51() -> Unit raise {
  let t214 = @simp.rewrite_tac(@list.List([complex_vector_map(), @complexes.complex_neg()]))
  complex_neg_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_minus_minus : (Cart[Real, 2]) -> Cart[Real, 2]) == (vector_map : ((Real) -> Real, Cart[Real, 2]) -> Cart[Real, 2])(op_minus_minus)"), t214))
}

///|
let complex_neg_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_NEG_IS_A_MAP")

///|
/// `COMPLEX_NEG_IS_A_MAP`
pub fn complex_neg_is_a_map() -> @kernel.Thm {
  complex_neg_is_a_map_c.get()
}

///|
/// VECTOR_NEG_IS_A_MAP
fn step_52() -> Unit raise {
  let t215 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cart.cart_eq(), @vectors.vector_neg_component(), vector_map_component()]))
  vector_neg_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_minus_minus : (Cart[Real, N]) -> Cart[Real, N]) == (vector_map : ((Real) -> Real, Cart[Real, N]) -> Cart[Real, N])(op_minus_minus)"), t215))
}

///|
let vector_neg_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_NEG_IS_A_MAP")

///|
/// `VECTOR_NEG_IS_A_MAP`
pub fn vector_neg_is_a_map() -> @kernel.Thm {
  vector_neg_is_a_map_c.get()
}

///|
/// VECTOR_MAP_VECTOR_MAP_ALT
fn step_53() -> Unit raise {
  let t216 = @simp.simp_tac(@list.List([@trivia.o_def(), @class.fun_eq_thm(), vector_map_vector_map()]))
  vector_map_vector_map_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[A, N]) -> Cart[B, N], ∀ g : (Cart[C, N]) -> Cart[A, N], ∀ f' : (A) -> B, ∀ g' : (C) -> A, f == vector_map(f') && g == vector_map(g') → o(f, g) == vector_map(o(f', g'))"), t216))
}

///|
let vector_map_vector_map_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_VECTOR_MAP_ALT")

///|
/// `VECTOR_MAP_VECTOR_MAP_ALT`
pub fn vector_map_vector_map_alt() -> @kernel.Thm {
  vector_map_vector_map_alt_c.get()
}

///|
/// COMPLEX_VECTOR_MAP2
fn step_54() -> Unit raise {
  let t218 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @cart.lambda_beta(), @vectors.vector_2(), @complexes.re_def(), @complexes.im_def()]))
  let t217 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.gen_tac, @tactics.eq_tac))
  let t219 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([vector_map2(), @class.fun_eq_thm(), @complexes.complex()])), t217), t218)
  complex_vector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Real, Real) -> Real, (f == vector_map2(g)) == (∀ z1 : Cart[Real, 2], ∀ z2 : Cart[Real, 2], f(z1, z2) == complex((g(Re(z1), Re(z2)), g(Im(z1), Im(z2)))))"), t219))
}

///|
let complex_vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_VECTOR_MAP2")

///|
/// `COMPLEX_VECTOR_MAP2`
pub fn complex_vector_map2() -> @kernel.Thm {
  complex_vector_map2_c.get()
}

///|
/// VECTOR_MAP2_RVECTOR_MAP_ALT
fn step_55() -> Unit raise {
  let t220 = @simp.simp_tac(@list.List([@class.fun_eq_thm(), vector_map2_rvector_map()]))
  vector_map2_rvector_map_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Real, Real) -> Real, ∀ g' : (Real) -> Real, f == vector_map2(f') && g == vector_map(g') → ((x : Cart[Real, 2]) => (y : Cart[Real, 2]) => f(x, g(y))) == vector_map2((x : Real) => (y : Real) => f'(x, g'(y)))"), t220))
}

///|
let vector_map2_rvector_map_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_RVECTOR_MAP_ALT")

///|
/// `VECTOR_MAP2_RVECTOR_MAP_ALT`
pub fn vector_map2_rvector_map_alt() -> @kernel.Thm {
  vector_map2_rvector_map_alt_c.get()
}

///|
/// COMPLEX_ADD_IS_A_MAP
fn step_56() -> Unit raise {
  let t221 = @simp.rewrite_tac(@list.List([complex_vector_map2(), @complexes.complex_add()]))
  complex_add_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_plus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2]) == (vector_map2 : ((Real, Real) -> Real, Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])(op_plus)"), t221))
}

///|
let complex_add_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_ADD_IS_A_MAP")

///|
/// `COMPLEX_ADD_IS_A_MAP`
pub fn complex_add_is_a_map() -> @kernel.Thm {
  complex_add_is_a_map_c.get()
}

///|
/// VECTOR_ADD_IS_A_MAP
fn step_57() -> Unit raise {
  let t222 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cart.cart_eq(), @vectors.vector_add_component(), vector_map2_component()]))
  vector_add_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_plus : (Cart[Real, N], Cart[Real, N]) -> Cart[Real, N]) == (vector_map2 : ((Real, Real) -> Real, Cart[Real, N], Cart[Real, N]) -> Cart[Real, N])(op_plus)"), t222))
}

///|
let vector_add_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ADD_IS_A_MAP")

///|
/// `VECTOR_ADD_IS_A_MAP`
pub fn vector_add_is_a_map() -> @kernel.Thm {
  vector_add_is_a_map_c.get()
}

///|
/// COMPLEX_SUB_IS_A_MAP
fn step_58() -> Unit raise {
  let t228 = @simp.rewrite_tac(@list.List([complex_neg_is_a_map(), complex_add_is_a_map()]))
  let t227 = @tactics.match_mp_tac(vector_map2_rvector_map_alt())
  let t226 = @simp.rewrite_tac(@list.List([@complexes.complex_sub(), @realax.real_sub()]))
  let t224 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t225 = @simp.once_rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("op_minus == ((x : Real) => (y : Real) => x - y)"), t224)]))
  let t223 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t229 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("op_minus == ((x : Cart[Real, 2]) => (y : Cart[Real, 2]) => x - y)"), t223)])), t225), t226), t227), t228)
  complex_sub_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_minus : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2]) == (vector_map2 : ((Real, Real) -> Real, Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])(op_minus)"), t229))
}

///|
let complex_sub_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_SUB_IS_A_MAP")

///|
/// `COMPLEX_SUB_IS_A_MAP`
pub fn complex_sub_is_a_map() -> @kernel.Thm {
  complex_sub_is_a_map_c.get()
}

///|
/// VECTOR_SUB_IS_A_MAP
fn step_59() -> Unit raise {
  let t230 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cart.cart_eq(), @vectors.vector_sub_component(), vector_map2_component()]))
  vector_sub_is_a_map_c.set(@tactics.prove(@term_syntax.parse_term("(op_minus : (Cart[Real, N], Cart[Real, N]) -> Cart[Real, N]) == (vector_map2 : ((Real, Real) -> Real, Cart[Real, N], Cart[Real, N]) -> Cart[Real, N])(op_minus)"), t230))
}

///|
let vector_sub_is_a_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_SUB_IS_A_MAP")

///|
/// `VECTOR_SUB_IS_A_MAP`
pub fn vector_sub_is_a_map() -> @kernel.Thm {
  vector_sub_is_a_map_c.get()
}

///|
/// `COMMON_TAC`
pub fn common_tac_v2(x231 : @kernel.Thm) -> @tactics.Tactic raise {
  let x = x231
  let t248 = @simp.rewrite_rule(@list.List([@cart.dimindex_finite_sum()]))
  let t250 = @tactics.repeat_tac(@tactics.pop_assum(fn(x249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s246 = @tactics.mp_tac(x245)
      fn(x247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s246(x247)
      }
    })(t248(x249))
  }))
  let t244 = @simp.asm_simp_tac(@list.List([@cart.lambda_beta()]))
  let t243 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (i : Num) - (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i - (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))"), fn(x240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s241 = @tactics.assume_tac(x240)
    fn(x242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s241(x242)
    }
  })
  let t239 = @simp.rewrite_tac(@list.List([]))
  let t238 = @tactics.pop_assum(fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  })
  let t234 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t233 = @tactics.repeat_tac(@tactics.strip_tac)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.pastecart(), x, @cart.lambda_beta()])), t233), t234), t238), t239), t243), t244), t250), @int.arith_tac)
}

///|
/// PASTECART_VECTOR_MAP
fn step_60() -> Unit raise {
  let t251 = common_tac_v2(vector_map())
  pastecart_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ x : Cart[A, N], ∀ y : Cart[A, M], pastecart(vector_map(f, x), vector_map(f, y)) == vector_map(f, pastecart(x, y))"), t251))
}

///|
let pastecart_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_VECTOR_MAP")

///|
/// `PASTECART_VECTOR_MAP`
pub fn pastecart_vector_map() -> @kernel.Thm {
  pastecart_vector_map_c.get()
}

///|
/// PASTECART_VECTOR_MAP2
fn step_61() -> Unit raise {
  let t252 = common_tac_v2(vector_map2())
  pastecart_vector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ x1 : Cart[A, N], ∀ x2 : Cart[B, N], ∀ y1 : Cart[A, M], ∀ y2 : Cart[B, M], pastecart(vector_map2(f, x1, x2), vector_map2(f, y1, y2)) == vector_map2(f, pastecart(x1, y1), pastecart(x2, y2))"), t252))
}

///|
let pastecart_vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_VECTOR_MAP2")

///|
/// `PASTECART_VECTOR_MAP2`
pub fn pastecart_vector_map2() -> @kernel.Thm {
  pastecart_vector_map2_c.get()
}

///|
/// vector_zip
fn step_62() -> Unit raise {
  vector_zip_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_zip : (Cart[A, N], Cart[B, N]) -> Cart[(A, B), N])((v1 : Cart[A, N]), (v2 : Cart[B, N])) == lambda((i : Num) => (op_dollar(v1, i), op_dollar(v2, i)))")))
}

///|
let vector_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_zip")

///|
/// `vector_zip`
pub fn vector_zip() -> @kernel.Thm {
  vector_zip_c.get()
}

///|
/// VECTOR_ZIP_COMPONENT
fn step_63() -> Unit raise {
  let t256 = @simp.asm_simp_tac(@list.List([vector_zip(), @cart.lambda_beta()]))
  let t254 = @bool.spec_all(finite_index_inrange_2())
  let t253 = @term_syntax.parse_type("C")
  let t255 = @tactics.choose_tac(@kernel.inst_type(@list.List([(@term_syntax.parse_type("(A, B)"), t253)]), t254))
  let t257 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t255), t256)
  vector_zip_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], op_dollar(vector_zip(v1, v2), i) == (op_dollar(v1, i), op_dollar(v2, i))"), t257))
}

///|
let vector_zip_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ZIP_COMPONENT")

///|
/// `VECTOR_ZIP_COMPONENT`
pub fn vector_zip_component() -> @kernel.Thm {
  vector_zip_component_c.get()
}

///|
/// vector_unzip
fn step_64() -> Unit raise {
  vector_unzip_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_unzip : (Cart[(A, B), N]) -> (Cart[A, N], Cart[B, N]))((v : Cart[(A, B), N])) == (vector_map(FST, v), vector_map(SND, v))")))
}

///|
let vector_unzip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_unzip")

///|
/// `vector_unzip`
pub fn vector_unzip() -> @kernel.Thm {
  vector_unzip_c.get()
}

///|
/// VECTOR_UNZIP_COMPONENT
fn step_65() -> Unit raise {
  let t258 = @simp.rewrite_tac(@list.List([vector_unzip(), vector_map_component()]))
  vector_unzip_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ v : Cart[(A, B), N], op_dollar(FST(vector_unzip(v)), i) == FST(op_dollar(v, i)) && op_dollar(SND(vector_unzip(v)), i) == SND(op_dollar(v, i))"), t258))
}

///|
let vector_unzip_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_UNZIP_COMPONENT")

///|
/// `VECTOR_UNZIP_COMPONENT`
pub fn vector_unzip_component() -> @kernel.Thm {
  vector_unzip_component_c.get()
}

///|
/// VECTOR_MAP2_AS_VECTOR_MAP
fn step_66() -> Unit raise {
  let t259 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), vector_map2_component(), vector_map_component(), vector_zip_component(), @pair.uncurry_def()]))
  vector_map2_as_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> C, ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], vector_map2(f, v1, v2) == vector_map(UNCURRY(f), vector_zip(v1, v2))"), t259))
}

///|
let vector_map2_as_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP2_AS_VECTOR_MAP")

///|
/// `VECTOR_MAP2_AS_VECTOR_MAP`
pub fn vector_map2_as_vector_map() -> @kernel.Thm {
  vector_map2_as_vector_map_c.get()
}

///|
/// Multivariate/cvectors.ml:480
fn step_67() -> Unit raise {
  @preterm.make_overloadable("%", @term_syntax.parse_type("(A, B) -> B"))
}

///|
/// `prioritize_cvector`
pub fn prioritize_cvector(x260 : Unit) -> Unit raise {
  let _ = x260
  @preterm.overload_interface("--", @term_syntax.parse_term("(cvector_neg : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])"))
  @preterm.overload_interface("+", @term_syntax.parse_term("(cvector_add : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])"))
  @preterm.overload_interface("-", @term_syntax.parse_term("(cvector_sub : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])"))
  @preterm.overload_interface("%", @term_syntax.parse_term("(cvector_mul : (Cart[Real, 2], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])"))
}

///|
/// cvector_zero
fn step_68() -> Unit raise {
  cvector_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_zero : Cart[Cart[Real, 2], N]) == vector_const(Cx(real_of_num(0)))")))
}

///|
let cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_zero")

///|
/// `cvector_zero`
pub fn cvector_zero() -> @kernel.Thm {
  cvector_zero_c.get()
}

///|
/// cvector_neg
fn step_69() -> Unit raise {
  cvector_neg_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_neg : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) == vector_map(op_minus_minus)")))
}

///|
let cvector_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_neg")

///|
/// `cvector_neg`
pub fn cvector_neg() -> @kernel.Thm {
  cvector_neg_c.get()
}

///|
/// cvector_add
fn step_70() -> Unit raise {
  cvector_add_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_add : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) == vector_map2(op_plus)")))
}

///|
let cvector_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_add")

///|
/// `cvector_add`
pub fn cvector_add() -> @kernel.Thm {
  cvector_add_c.get()
}

///|
/// cvector_sub
fn step_71() -> Unit raise {
  cvector_sub_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_sub : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) == vector_map2(op_minus)")))
}

///|
let cvector_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_sub")

///|
/// `cvector_sub`
pub fn cvector_sub() -> @kernel.Thm {
  cvector_sub_c.get()
}

///|
/// cvector_mul
fn step_72() -> Unit raise {
  cvector_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_mul : (Cart[Real, 2], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((a : Cart[Real, 2])) == vector_map(op_star(a))")))
}

///|
let cvector_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_mul")

///|
/// `cvector_mul`
pub fn cvector_mul() -> @kernel.Thm {
  cvector_mul_c.get()
}

///|
/// Multivariate/cvectors.ml:503
fn step_73() -> Unit raise {
  @preterm.overload_interface("%", @term_syntax.parse_term("(op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])"))
}

///|
/// Multivariate/cvectors.ml:504
fn step_74() -> Unit raise {
  prioritize_cvector(())
}

///|
/// CVECTOR_ZERO_COMPONENT
fn step_75() -> Unit raise {
  let t261 = @simp.rewrite_tac(@list.List([cvector_zero(), vector_const_component()]))
  cvector_zero_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (op_dollar : (Cart[Cart[Real, 2], N], Num) -> Cart[Real, 2])((cvector_zero : Cart[Cart[Real, 2], N]), i) == Cx(real_of_num(0))"), t261))
}

///|
let cvector_zero_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ZERO_COMPONENT")

///|
/// `CVECTOR_ZERO_COMPONENT`
pub fn cvector_zero_component() -> @kernel.Thm {
  cvector_zero_component_c.get()
}

///|
/// CVECTOR_NON_ZERO
fn step_76() -> Unit raise {
  let t270 = @meson.meson_tac(@list.List([]))
  let t269 = @simp.rewrite_tac(@list.List([cvector_zero_component()]))
  let t271 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x262 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s263 = @equal.rator_conv(x262)
      fn(x264 : @kernel.Term) -> @kernel.Thm raise {
        s263(x264)
      }
    })((fn(x265 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s266 = @equal.once_depth_conv(x265)
      fn(x267 : @kernel.Term) -> @kernel.Thm raise {
        s266(x267)
      }
    })(x268))
  }, @list.List([@cart.cart_eq()]))), t269), t270)
  cvector_non_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], !(x == (cvector_zero : Cart[Cart[Real, 2], N])) == (∃ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && !((op_dollar : (Cart[Cart[Real, 2], N], Num) -> Cart[Real, 2])(x, i) == Cx(real_of_num(0))))"), t271))
}

///|
let cvector_non_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NON_ZERO")

///|
/// `CVECTOR_NON_ZERO`
pub fn cvector_non_zero() -> @kernel.Thm {
  cvector_non_zero_c.get()
}

///|
/// CVECTOR_ADD_COMPONENT
fn step_77() -> Unit raise {
  let t272 = @simp.rewrite_tac(@list.List([cvector_add(), vector_map2_component()]))
  cvector_add_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : Cart[Cart[Real, 2], N], ∀ Y : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(X + Y, i) == op_dollar(X, i) + op_dollar(Y, i)"), t272))
}

///|
let cvector_add_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_COMPONENT")

///|
/// `CVECTOR_ADD_COMPONENT`
pub fn cvector_add_component() -> @kernel.Thm {
  cvector_add_component_c.get()
}

///|
/// CVECTOR_SUB_COMPONENT
fn step_78() -> Unit raise {
  let t273 = @simp.rewrite_tac(@list.List([cvector_sub(), vector_map2_component()]))
  cvector_sub_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : Cart[Cart[Real, 2], N], ∀ Y : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(X - Y, i) == op_dollar(X, i) - op_dollar(Y, i)"), t273))
}

///|
let cvector_sub_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_COMPONENT")

///|
/// `CVECTOR_SUB_COMPONENT`
pub fn cvector_sub_component() -> @kernel.Thm {
  cvector_sub_component_c.get()
}

///|
/// CVECTOR_NEG_COMPONENT
fn step_79() -> Unit raise {
  let t274 = @simp.rewrite_tac(@list.List([cvector_neg(), vector_map_component()]))
  cvector_neg_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(-X, i) == -op_dollar(X, i)"), t274))
}

///|
let cvector_neg_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_COMPONENT")

///|
/// `CVECTOR_NEG_COMPONENT`
pub fn cvector_neg_component() -> @kernel.Thm {
  cvector_neg_component_c.get()
}

///|
/// CVECTOR_MUL_COMPONENT
fn step_80() -> Unit raise {
  let t275 = @simp.rewrite_tac(@list.List([cvector_mul(), vector_map_component()]))
  cvector_mul_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ X : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(cvector_mul(c, X), i) == c * op_dollar(X, i)"), t275))
}

///|
let cvector_mul_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_COMPONENT")

///|
/// `CVECTOR_MUL_COMPONENT`
pub fn cvector_mul_component() -> @kernel.Thm {
  cvector_mul_component_c.get()
}

///|
/// CVECTOR_ARITH_TAC
fn step_81() -> Unit raise {
  let renamed_lambda_beta : (@kernel.Thm) -> @kernel.Thm raise = fn(x276 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x276
    if (@basics.dest_fun_ty(@kernel.type_of(@lib.funpow(3, @kernel.rand, @kernel.concl(th)))).0 == @kernel.aty) {
      @kernel.inst_type(@list.List([(@kernel.aty, @basics.bty), (@basics.bty, @kernel.aty)]), @cart.lambda_beta())
    } else {
      @cart.lambda_beta()
    }
  }
  let t297 = @tactics.disch_then(fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x295
    @simp.rewrite_tac(@list.List([@drule.match_mp(renamed_lambda_beta(th_1))(th_1)]))
  })
  let t294 = @simp.rewrite_tac(@list.List([cvector_zero(), cvector_add(), cvector_sub(), cvector_neg(), cvector_mul(), vector_map(), vector_map2(), vector_const()]))
  let t293 = @tactics.try_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (c : Bool)) → (a → b) → a → c"))))
  let t291 = @class.taut(@term_syntax.parse_term("(((a : Bool) → (b : Bool)) || (a → (c : Bool))) == (a → b || c)"))
  let t292 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) → (b : Bool)) && (a → (c : Bool))) == (a → b && c)")), t291]))
  let t290 = @tactics.try_tac(@tactics.match_mp_tac(@theorems.mono_forall()))
  let t289 = @tactics.try_tac(@tactics.eq_tac)
  let t288 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t287 = @simp.gen_rewrite_tac(fn(x284 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s285 = @equal.once_depth_conv(x284)
    fn(x286 : @kernel.Term) -> @kernel.Thm raise {
      s285(x286)
    }
  }, @list.List([@cart.cart_eq()]))
  let t283 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t282 = @tactics.repeat_tac(@tactics.pop_assum(fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s280 = @tactics.mp_tac(x279)
    fn(x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s280(x281)
    }
  }))
  let t278 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.gen_tac, @tactics.conj_tac), @tactics.disch_tac), @tactics.eq_tac))
  cvector_arith_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x277 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t278), t282), t283), t287), t288), t289), t290), @tactics.gen_tac), t292), t293), t294), t297), @complexes.simple_complex_arith_tac))
}

///|
let cvector_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("CVECTOR_ARITH_TAC")

///|
/// `CVECTOR_ARITH_TAC`
pub fn cvector_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (cvector_arith_tac_c.get())(x)
}

///|
/// `CVECTOR_ARITH`
pub fn cvector_arith(x298 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x298
  @tactics.prove(tm, cvector_arith_tac)
}

///|
/// `CVECTOR_MAP_PROPERTY`
pub fn cvector_map_property_v1(x299 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let thm = x299
  (x301 : @kernel.Thm) => vector_map_property(thm, @list.List([cvector_zero(), cvector_add(), cvector_sub(), cvector_neg(), cvector_mul()]), x301)
}

///|
/// CVECTOR_ADD_SYM
fn step_82() -> Unit raise {
  cvector_add_sym_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x + y == y + x"))(@complexes.complex_add_sym()))
}

///|
let cvector_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_SYM")

///|
/// `CVECTOR_ADD_SYM`
pub fn cvector_add_sym() -> @kernel.Thm {
  cvector_add_sym_c.get()
}

///|
/// CVECTOR_ADD_ASSOC
fn step_83() -> Unit raise {
  cvector_add_assoc_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], x + (y + z) == x + y + z"))(@complexes.complex_add_assoc()))
}

///|
let cvector_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_ASSOC")

///|
/// `CVECTOR_ADD_ASSOC`
pub fn cvector_add_assoc() -> @kernel.Thm {
  cvector_add_assoc_c.get()
}

///|
/// CVECTOR_ADD_ID
fn step_84() -> Unit raise {
  let t302 = @bool.conj(@complexes.complex_add_rid(), @complexes.complex_add_lid())
  cvector_add_id_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], x + cvector_zero == x && cvector_zero + x == x"))(t302))
}

///|
let cvector_add_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_ID")

///|
/// `CVECTOR_ADD_ID`
pub fn cvector_add_id() -> @kernel.Thm {
  cvector_add_id_c.get()
}

///|
let cvector_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_RID")

///|
/// `CVECTOR_ADD_RID`
pub fn cvector_add_rid() -> @kernel.Thm {
  cvector_add_rid_c.get()
}

///|
let cvector_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_LID")

///|
/// `CVECTOR_ADD_LID`
pub fn cvector_add_lid() -> @kernel.Thm {
  cvector_add_lid_c.get()
}

///|
/// CVECTOR_ADD_RID, CVECTOR_ADD_LID
fn step_85() -> Unit raise {
  match gconjuncts(cvector_add_id()) {
    More(cvector_add_rid, tail=More(cvector_add_lid, tail=Empty)) => {
      cvector_add_rid_c.set(cvector_add_rid)
      cvector_add_lid_c.set(cvector_add_lid)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:573:4")
  }
}

///|
/// CVECTOR_ADD_INV
fn step_86() -> Unit raise {
  let t303 = @bool.conj(@complexes.complex_add_rinv(), @complexes.complex_add_linv())
  cvector_add_inv_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], x + -x == cvector_zero && -x + x == cvector_zero"))(t303))
}

///|
let cvector_add_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_INV")

///|
/// `CVECTOR_ADD_INV`
pub fn cvector_add_inv() -> @kernel.Thm {
  cvector_add_inv_c.get()
}

///|
/// CVECTOR_MUL_ASSOC
fn step_87() -> Unit raise {
  cvector_mul_assoc_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(a, cvector_mul(b, x)) == cvector_mul(a * b, x)"))(@complexes.complex_mul_assoc()))
}

///|
let cvector_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_ASSOC")

///|
/// `CVECTOR_MUL_ASSOC`
pub fn cvector_mul_assoc() -> @kernel.Thm {
  cvector_mul_assoc_c.get()
}

///|
/// CVECTOR_SUB_LDISTRIB
fn step_88() -> Unit raise {
  cvector_sub_ldistrib_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_mul(c, x - y) == cvector_mul(c, x) - cvector_mul(c, y)"))(@complexes.complex_sub_ldistrib()))
}

///|
let cvector_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_LDISTRIB")

///|
/// `CVECTOR_SUB_LDISTRIB`
pub fn cvector_sub_ldistrib() -> @kernel.Thm {
  cvector_sub_ldistrib_c.get()
}

///|
/// CVECTOR_SCALAR_RDIST
fn step_89() -> Unit raise {
  cvector_scalar_rdist_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(a + b, x) == cvector_mul(a, x) + cvector_mul(b, x)"))(@complexes.complex_add_rdistrib()))
}

///|
let cvector_scalar_rdist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SCALAR_RDIST")

///|
/// `CVECTOR_SCALAR_RDIST`
pub fn cvector_scalar_rdist() -> @kernel.Thm {
  cvector_scalar_rdist_c.get()
}

///|
/// CVECTOR_MUL_ID
fn step_90() -> Unit raise {
  cvector_mul_id_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_mul(Cx(real_of_num(1)), x) == x"))(@complexes.complex_mul_lid()))
}

///|
let cvector_mul_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_ID")

///|
/// `CVECTOR_MUL_ID`
pub fn cvector_mul_id() -> @kernel.Thm {
  cvector_mul_id_c.get()
}

///|
/// CVECTOR_SUB_REFL
fn step_91() -> Unit raise {
  cvector_sub_refl_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], x - x == cvector_zero"))(@complexes.complex_sub_refl()))
}

///|
let cvector_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_REFL")

///|
/// `CVECTOR_SUB_REFL`
pub fn cvector_sub_refl() -> @kernel.Thm {
  cvector_sub_refl_c.get()
}

///|
/// CVECTOR_SUB_RADD
fn step_92() -> Unit raise {
  cvector_sub_radd_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x - (x + y) == -y"))(@complexes.complex_add_sub2()))
}

///|
let cvector_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_RADD")

///|
/// `CVECTOR_SUB_RADD`
pub fn cvector_sub_radd() -> @kernel.Thm {
  cvector_sub_radd_c.get()
}

///|
/// CVECTOR_NEG_SUB
fn step_93() -> Unit raise {
  cvector_neg_sub_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], -(x - y) == y - x"))(@complexes.complex_neg_sub()))
}

///|
let cvector_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_SUB")

///|
/// `CVECTOR_NEG_SUB`
pub fn cvector_neg_sub() -> @kernel.Thm {
  cvector_neg_sub_c.get()
}

///|
/// CVECTOR_SUB_EQ
fn step_94() -> Unit raise {
  cvector_sub_eq_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], (x - y == cvector_zero) == (x == y)"))(@complexes.complex_sub_0()))
}

///|
let cvector_sub_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_EQ")

///|
/// `CVECTOR_SUB_EQ`
pub fn cvector_sub_eq() -> @kernel.Thm {
  cvector_sub_eq_c.get()
}

///|
/// CVECTOR_MUL_LZERO
fn step_95() -> Unit raise {
  cvector_mul_lzero_v1_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], _], cvector_mul(Cx(real_of_num(0)), x) == cvector_zero"))(@complexes.complex_mul_lzero()))
}

///|
let cvector_mul_lzero_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_LZERO")

///|
/// `CVECTOR_MUL_LZERO`
pub fn cvector_mul_lzero_v1() -> @kernel.Thm {
  cvector_mul_lzero_v1_c.get()
}

///|
/// CVECTOR_SUB_ADD
fn step_96() -> Unit raise {
  cvector_sub_add_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x - y + y == x"))(@complexes.complex_sub_add()))
}

///|
let cvector_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_ADD")

///|
/// `CVECTOR_SUB_ADD`
pub fn cvector_sub_add() -> @kernel.Thm {
  cvector_sub_add_c.get()
}

///|
/// CVECTOR_SUB_ADD2
fn step_97() -> Unit raise {
  cvector_sub_add2_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], y + (x - y) == x"))(@complexes.complex_sub_add2()))
}

///|
let cvector_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_ADD2")

///|
/// `CVECTOR_SUB_ADD2`
pub fn cvector_sub_add2() -> @kernel.Thm {
  cvector_sub_add2_c.get()
}

///|
/// CVECTOR_ADD_LDISTRIB
fn step_98() -> Unit raise {
  cvector_add_ldistrib_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_mul(c, x + y) == cvector_mul(c, x) + cvector_mul(c, y)"))(@complexes.complex_add_ldistrib()))
}

///|
let cvector_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_LDISTRIB")

///|
/// `CVECTOR_ADD_LDISTRIB`
pub fn cvector_add_ldistrib() -> @kernel.Thm {
  cvector_add_ldistrib_c.get()
}

///|
/// CVECTOR_ADD_RDISTRIB
fn step_99() -> Unit raise {
  cvector_add_rdistrib_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(a + b, x) == cvector_mul(a, x) + cvector_mul(b, x)"))(@complexes.complex_add_rdistrib()))
}

///|
let cvector_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_RDISTRIB")

///|
/// `CVECTOR_ADD_RDISTRIB`
pub fn cvector_add_rdistrib() -> @kernel.Thm {
  cvector_add_rdistrib_c.get()
}

///|
/// CVECTOR_SUB_RDISTRIB
fn step_100() -> Unit raise {
  cvector_sub_rdistrib_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(a - b, x) == cvector_mul(a, x) - cvector_mul(b, x)"))(@complexes.complex_sub_rdistrib()))
}

///|
let cvector_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_RDISTRIB")

///|
/// `CVECTOR_SUB_RDISTRIB`
pub fn cvector_sub_rdistrib() -> @kernel.Thm {
  cvector_sub_rdistrib_c.get()
}

///|
/// CVECTOR_ADD_SUB
fn step_101() -> Unit raise {
  cvector_add_sub_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x + y - x == y"))(@complexes.complex_add_sub()))
}

///|
let cvector_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_SUB")

///|
/// `CVECTOR_ADD_SUB`
pub fn cvector_add_sub() -> @kernel.Thm {
  cvector_add_sub_c.get()
}

///|
/// CVECTOR_EQ_ADDR
fn step_102() -> Unit raise {
  cvector_eq_addr_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], (x + y == x) == (y == cvector_zero)"))(@complexes.complex_eq_add_lcancel_0()))
}

///|
let cvector_eq_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_EQ_ADDR")

///|
/// `CVECTOR_EQ_ADDR`
pub fn cvector_eq_addr() -> @kernel.Thm {
  cvector_eq_addr_c.get()
}

///|
/// CVECTOR_SUB
fn step_103() -> Unit raise {
  cvector_sub_v1_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x - y == x + -y"))(@complexes.complex_sub()))
}

///|
let cvector_sub_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB")

///|
/// `CVECTOR_SUB`
pub fn cvector_sub_v1() -> @kernel.Thm {
  cvector_sub_v1_c.get()
}

///|
/// CVECTOR_SUB_RZERO
fn step_104() -> Unit raise {
  cvector_sub_rzero_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], x - cvector_zero == x"))(@complexes.complex_sub_rzero()))
}

///|
let cvector_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_RZERO")

///|
/// `CVECTOR_SUB_RZERO`
pub fn cvector_sub_rzero() -> @kernel.Thm {
  cvector_sub_rzero_c.get()
}

///|
/// CVECTOR_MUL_RZERO
fn step_105() -> Unit raise {
  cvector_mul_rzero_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ c : Cart[Real, 2], (cvector_mul : (Cart[Real, 2], Cart[Cart[Real, 2], _]) -> Cart[Cart[Real, 2], _])(c, (cvector_zero : Cart[Cart[Real, 2], _])) == (cvector_zero : Cart[Cart[Real, 2], _])"))(@complexes.complex_mul_rzero()))
}

///|
let cvector_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_RZERO")

///|
/// `CVECTOR_MUL_RZERO`
pub fn cvector_mul_rzero() -> @kernel.Thm {
  cvector_mul_rzero_c.get()
}

///|
/// CVECTOR_MUL_LZERO
fn step_106() -> Unit raise {
  cvector_mul_lzero_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_mul(Cx(real_of_num(0)), x) == cvector_zero"))(@complexes.complex_mul_lzero()))
}

///|
let cvector_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_LZERO")

///|
/// `CVECTOR_MUL_LZERO`
pub fn cvector_mul_lzero() -> @kernel.Thm {
  cvector_mul_lzero_c.get()
}

///|
/// CVECTOR_MUL_EQ_0
fn step_107() -> Unit raise {
  let t323 = @simp.asm_rewrite_tac(@list.List([cvector_mul_rzero(), cvector_mul_lzero()]))
  let t324 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t323)
  let t320 = @simp.rewrite_tac(@list.List([cvector_zero_component()]))
  let t319 = @simp.gen_rewrite_tac(fn(x318 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x312 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s313 = @equal.rand_conv(x312)
      fn(x314 : @kernel.Term) -> @kernel.Thm raise {
        s313(x314)
      }
    })((fn(x315 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s316 = @equal.depth_conv(x315)
      fn(x317 : @kernel.Term) -> @kernel.Thm raise {
        s316(x317)
      }
    })(x318))
  }, @list.List([@cart.cart_eq()]))
  let t311 = @simp.asm_rewrite_tac(@list.List([cvector_mul_component(), cvector_zero_component(), @complexes.complex_entire()]))
  let t321 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x310 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x304 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s305 = @equal.rator_conv(x304)
      fn(x306 : @kernel.Term) -> @kernel.Thm raise {
        s305(x306)
      }
    })((fn(x307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s308 = @equal.depth_conv(x307)
      fn(x309 : @kernel.Term) -> @kernel.Thm raise {
        s308(x309)
      }
    })(x310))
  }, @list.List([@cart.cart_eq()])), t311), t319), t320)
  let t322 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t321])
  let t325 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == Cx(real_of_num(0))")), t322), t324])
  let t326 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t325)
  cvector_mul_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], (cvector_mul(a, x) == cvector_zero) == (a == Cx(real_of_num(0)) || x == cvector_zero)"), t326))
}

///|
let cvector_mul_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_EQ_0")

///|
/// `CVECTOR_MUL_EQ_0`
pub fn cvector_mul_eq_0() -> @kernel.Thm {
  cvector_mul_eq_0_c.get()
}

///|
/// CVECTOR_NEG_MINUS1
fn step_108() -> Unit raise {
  let t327 = @equal.gsym(@complexes.complex_neg_minus1())
  cvector_neg_minus1_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], -x == cvector_mul(-Cx(real_of_num(1)), x)"))(t327))
}

///|
let cvector_neg_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_MINUS1")

///|
/// `CVECTOR_NEG_MINUS1`
pub fn cvector_neg_minus1() -> @kernel.Thm {
  cvector_neg_minus1_c.get()
}

///|
/// CVECTOR_SUB_LZERO
fn step_109() -> Unit raise {
  cvector_sub_lzero_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_zero - x == -x"))(@complexes.complex_sub_lzero()))
}

///|
let cvector_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_LZERO")

///|
/// `CVECTOR_SUB_LZERO`
pub fn cvector_sub_lzero() -> @kernel.Thm {
  cvector_sub_lzero_c.get()
}

///|
/// CVECTOR_NEG_NEG
fn step_110() -> Unit raise {
  cvector_neg_neg_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], --x == x"))(@complexes.complex_neg_neg()))
}

///|
let cvector_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_NEG")

///|
/// `CVECTOR_NEG_NEG`
pub fn cvector_neg_neg() -> @kernel.Thm {
  cvector_neg_neg_c.get()
}

///|
/// CVECTOR_MUL_LNEG
fn step_111() -> Unit raise {
  cvector_mul_lneg_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(-c, x) == -cvector_mul(c, x)"))(@complexes.complex_mul_lneg()))
}

///|
let cvector_mul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_LNEG")

///|
/// `CVECTOR_MUL_LNEG`
pub fn cvector_mul_lneg() -> @kernel.Thm {
  cvector_mul_lneg_c.get()
}

///|
/// CVECTOR_MUL_RNEG
fn step_112() -> Unit raise {
  cvector_mul_rneg_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cvector_mul(c, -x) == -cvector_mul(c, x)"))(@complexes.complex_mul_rneg()))
}

///|
let cvector_mul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_RNEG")

///|
/// `CVECTOR_MUL_RNEG`
pub fn cvector_mul_rneg() -> @kernel.Thm {
  cvector_mul_rneg_c.get()
}

///|
/// CVECTOR_NEG_0
fn step_113() -> Unit raise {
  cvector_neg_0_c.set(cvector_map_property_v1(@term_syntax.parse_term("-(cvector_zero : Cart[Cart[Real, 2], _]) == (cvector_zero : Cart[Cart[Real, 2], _])"))(@complexes.complex_neg_0()))
}

///|
let cvector_neg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_0")

///|
/// `CVECTOR_NEG_0`
pub fn cvector_neg_0() -> @kernel.Thm {
  cvector_neg_0_c.get()
}

///|
/// CVECTOR_NEG_EQ_0
fn step_114() -> Unit raise {
  cvector_neg_eq_0_c.set(cvector_map_property_v1(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], (-x == cvector_zero) == (x == cvector_zero)"))(@complexes.complex_neg_eq_0()))
}

///|
let cvector_neg_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_EQ_0")

///|
/// `CVECTOR_NEG_EQ_0`
pub fn cvector_neg_eq_0() -> @kernel.Thm {
  cvector_neg_eq_0_c.get()
}

///|
/// CVECTOR_ADD_AC
fn step_115() -> Unit raise {
  let t328 = @meson.meson_tac(@list.List([cvector_add_sym(), cvector_add_assoc()]))
  cvector_add_ac_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], x + y == y + x && x + y + z == x + (y + z) && x + (y + z) == y + (x + z)"), t328))
}

///|
let cvector_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_AC")

///|
/// `CVECTOR_ADD_AC`
pub fn cvector_add_ac() -> @kernel.Thm {
  cvector_add_ac_c.get()
}

///|
/// CVECTOR_MUL_LCANCEL
fn step_116() -> Unit raise {
  let t329 = @meson.meson_tac(@list.List([cvector_mul_eq_0(), cvector_sub_ldistrib(), cvector_sub_eq()]))
  cvector_mul_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], (cvector_mul(a, x) == cvector_mul(a, y)) == (a == Cx(real_of_num(0)) || x == y)"), t329))
}

///|
let cvector_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_LCANCEL")

///|
/// `CVECTOR_MUL_LCANCEL`
pub fn cvector_mul_lcancel() -> @kernel.Thm {
  cvector_mul_lcancel_c.get()
}

///|
/// CVECTOR_MUL_RCANCEL
fn step_117() -> Unit raise {
  let t330 = @meson.meson_tac(@list.List([cvector_mul_eq_0(), cvector_sub_rdistrib(), @complexes.complex_sub_0(), cvector_sub_eq()]))
  cvector_mul_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], (cvector_mul(a, x) == cvector_mul(b, x)) == (a == b || x == cvector_zero)"), t330))
}

///|
let cvector_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_RCANCEL")

///|
/// `CVECTOR_MUL_RCANCEL`
pub fn cvector_mul_rcancel() -> @kernel.Thm {
  cvector_mul_rcancel_c.get()
}

///|
/// clinear
fn step_118() -> Unit raise {
  clinear_c.set(@pair.new_definition(@term_syntax.parse_term("(clinear : ((Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N]) -> Bool)((f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N])) == ((∀ x : Cart[Cart[Real, 2], M], ∀ y : Cart[Cart[Real, 2], M], f(x + y) == f(x) + f(y)) && (∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], M], f(cvector_mul(c, x)) == cvector_mul(c, f(x))))")))
}

///|
let clinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("clinear")

///|
/// `clinear`
pub fn clinear() -> @kernel.Thm {
  clinear_c.get()
}

///|
/// `COMMON_TAC`
pub fn common_tac(x331 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let additional_thms = x331
  let t335 = @simp.simp_tac((additional_thms.prepend(cvector_mul_component())).prepend(cvector_add_component()))
  let t334 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  let t333 = @tactics.repeat_tac(@tactics.strip_tac)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([clinear()])), t333), t334), t335), @complexes.simple_complex_arith_tac)
}

///|
/// CLINEAR_COMPOSE_CMUL
fn step_119() -> Unit raise {
  let t336 = common_tac(@list.List([]))
  clinear_compose_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ c : Cart[Real, 2], clinear(f) → clinear((x : Cart[Cart[Real, 2], M]) => cvector_mul(c, f(x)))"), t336))
}

///|
let clinear_compose_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_COMPOSE_CMUL")

///|
/// `CLINEAR_COMPOSE_CMUL`
pub fn clinear_compose_cmul() -> @kernel.Thm {
  clinear_compose_cmul_c.get()
}

///|
/// CLINEAR_COMPOSE_NEG
fn step_120() -> Unit raise {
  let t337 = common_tac(@list.List([cvector_neg_component()]))
  clinear_compose_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], clinear(f) → clinear((x : Cart[Cart[Real, 2], M]) => -f(x))"), t337))
}

///|
let clinear_compose_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_COMPOSE_NEG")

///|
/// `CLINEAR_COMPOSE_NEG`
pub fn clinear_compose_neg() -> @kernel.Thm {
  clinear_compose_neg_c.get()
}

///|
/// CLINEAR_COMPOSE_ADD
fn step_121() -> Unit raise {
  let t338 = common_tac(@list.List([]))
  clinear_compose_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ g : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], clinear(f) && clinear(g) → clinear((x : Cart[Cart[Real, 2], M]) => f(x) + g(x))"), t338))
}

///|
let clinear_compose_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_COMPOSE_ADD")

///|
/// `CLINEAR_COMPOSE_ADD`
pub fn clinear_compose_add() -> @kernel.Thm {
  clinear_compose_add_c.get()
}

///|
/// CLINEAR_COMPOSE_SUB
fn step_122() -> Unit raise {
  let t339 = common_tac(@list.List([cvector_sub_component()]))
  clinear_compose_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ g : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], clinear(f) && clinear(g) → clinear((x : Cart[Cart[Real, 2], M]) => f(x) - g(x))"), t339))
}

///|
let clinear_compose_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_COMPOSE_SUB")

///|
/// `CLINEAR_COMPOSE_SUB`
pub fn clinear_compose_sub() -> @kernel.Thm {
  clinear_compose_sub_c.get()
}

///|
/// CLINEAR_COMPOSE
fn step_123() -> Unit raise {
  let t340 = @simp.simp_tac(@list.List([clinear(), @trivia.o_thm()]))
  clinear_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ g : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], _], clinear(f) && clinear(g) → clinear(o(g, f))"), t340))
}

///|
let clinear_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_COMPOSE")

///|
/// `CLINEAR_COMPOSE`
pub fn clinear_compose() -> @kernel.Thm {
  clinear_compose_c.get()
}

///|
/// CLINEAR_ID
fn step_124() -> Unit raise {
  let t341 = @simp.rewrite_tac(@list.List([clinear()]))
  clinear_id_c.set(@tactics.prove(@term_syntax.parse_term("clinear((x : Cart[Cart[Real, 2], N]) => x)"), t341))
}

///|
let clinear_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_ID")

///|
/// `CLINEAR_ID`
pub fn clinear_id() -> @kernel.Thm {
  clinear_id_c.get()
}

///|
/// CLINEAR_I
fn step_125() -> Unit raise {
  let t342 = @simp.rewrite_tac(@list.List([@trivia.i_def(), clinear_id()]))
  clinear_i_c.set(@tactics.prove(@term_syntax.parse_term("(clinear : ((Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) -> Bool)((I : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]))"), t342))
}

///|
let clinear_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_I")

///|
/// `CLINEAR_I`
pub fn clinear_i() -> @kernel.Thm {
  clinear_i_c.get()
}

///|
/// CLINEAR_ZERO
fn step_126() -> Unit raise {
  let t343 = common_tac(@list.List([cvector_zero_component()]))
  clinear_zero_c.set(@tactics.prove(@term_syntax.parse_term("(clinear : ((Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N]) -> Bool)((x : Cart[Cart[Real, 2], M]) => (cvector_zero : Cart[Cart[Real, 2], N]))"), t343))
}

///|
let clinear_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_ZERO")

///|
/// `CLINEAR_ZERO`
pub fn clinear_zero() -> @kernel.Thm {
  clinear_zero_c.get()
}

///|
/// CLINEAR_NEGATION
fn step_127() -> Unit raise {
  let t344 = common_tac(@list.List([cvector_neg_component()]))
  clinear_negation_c.set(@tactics.prove(@term_syntax.parse_term("(clinear : ((Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) -> Bool)((op_minus_minus : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]))"), t344))
}

///|
let clinear_negation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_NEGATION")

///|
/// `CLINEAR_NEGATION`
pub fn clinear_negation() -> @kernel.Thm {
  clinear_negation_c.get()
}

///|
/// CLINEAR_VMUL_COMPONENT
fn step_128() -> Unit raise {
  let t345 = common_tac(@list.List([]))
  clinear_vmul_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ v : Cart[Cart[Real, 2], P], ∀ k : Num, (clinear : ((Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N]) -> Bool)(f) && 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (clinear : ((Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], P]) -> Bool)((x : Cart[Cart[Real, 2], M]) => (cvector_mul : (Cart[Real, 2], Cart[Cart[Real, 2], P]) -> Cart[Cart[Real, 2], P])((op_dollar : (Cart[Cart[Real, 2], N], Num) -> Cart[Real, 2])(f(x), k), v))"), t345))
}

///|
let clinear_vmul_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_VMUL_COMPONENT")

///|
/// `CLINEAR_VMUL_COMPONENT`
pub fn clinear_vmul_component() -> @kernel.Thm {
  clinear_vmul_component_c.get()
}

///|
/// CLINEAR_0
fn step_129() -> Unit raise {
  let t346 = @meson.meson_tac(@list.List([cvector_mul_lzero(), clinear()]))
  clinear_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], clinear(f) → f(cvector_zero) == cvector_zero"), t346))
}

///|
let clinear_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_0")

///|
/// `CLINEAR_0`
pub fn clinear_0() -> @kernel.Thm {
  clinear_0_c.get()
}

///|
/// CLINEAR_CMUL
fn step_130() -> Unit raise {
  let t347 = @simp.simp_tac(@list.List([clinear()]))
  clinear_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], M], clinear(f) → f(cvector_mul(c, x)) == cvector_mul(c, f(x))"), t347))
}

///|
let clinear_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_CMUL")

///|
/// `CLINEAR_CMUL`
pub fn clinear_cmul() -> @kernel.Thm {
  clinear_cmul_c.get()
}

///|
/// CLINEAR_NEG
fn step_131() -> Unit raise {
  let t348 = @simp.simp_tac(@list.List([clinear_cmul()]))
  let t349 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([cvector_neg_minus1()])), t348)
  clinear_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ x : Cart[Cart[Real, 2], M], clinear(f) → f(-x) == -f(x)"), t349))
}

///|
let clinear_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_NEG")

///|
/// `CLINEAR_NEG`
pub fn clinear_neg() -> @kernel.Thm {
  clinear_neg_c.get()
}

///|
/// CLINEAR_ADD
fn step_132() -> Unit raise {
  let t350 = @simp.simp_tac(@list.List([clinear()]))
  clinear_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ x : Cart[Cart[Real, 2], M], ∀ y : Cart[Cart[Real, 2], M], clinear(f) → f(x + y) == f(x) + f(y)"), t350))
}

///|
let clinear_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_ADD")

///|
/// `CLINEAR_ADD`
pub fn clinear_add() -> @kernel.Thm {
  clinear_add_c.get()
}

///|
/// CLINEAR_SUB
fn step_133() -> Unit raise {
  let t351 = @simp.simp_tac(@list.List([cvector_sub_v1(), clinear_add(), clinear_neg()]))
  clinear_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ x : Cart[Cart[Real, 2], M], ∀ y : Cart[Cart[Real, 2], M], clinear(f) → f(x - y) == f(x) - f(y)"), t351))
}

///|
let clinear_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_SUB")

///|
/// `CLINEAR_SUB`
pub fn clinear_sub() -> @kernel.Thm {
  clinear_sub_c.get()
}

///|
/// CLINEAR_INJECTIVE_0
fn step_134() -> Unit raise {
  let t353 = @meson.meson_tac(@list.List([cvector_sub_rzero()]))
  let t352 = @simp.simp_tac(@list.List([cvector_sub_rzero(), @equal.gsym(clinear_sub())]))
  let t354 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(cvector_sub_eq())])), t352), t353)
  clinear_injective_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], clinear(f) → (∀ x : Cart[Cart[Real, 2], M], ∀ y : Cart[Cart[Real, 2], M], f(x) == f(y) → x == y) == (∀ x : Cart[Cart[Real, 2], M], f(x) == cvector_zero → x == cvector_zero)"), t354))
}

///|
let clinear_injective_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_INJECTIVE_0")

///|
/// `CLINEAR_INJECTIVE_0`
pub fn clinear_injective_0() -> @kernel.Thm {
  clinear_injective_0_c.get()
}

///|
/// CLINEAR_FSTCART_SNDCART
fn step_135() -> Unit raise {
  let t355 = @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (b : Num) → x + (a : Num) <= a + b"))
  let t356 = @simp.simp_tac(@list.List([clinear(), @cart.fstcart(), @cart.sndcart(), @cart.cart_eq(), @cart.lambda_beta(), cvector_add_component(), cvector_mul_component(), @cart.dimindex_finite_sum(), @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (a : Num) → x <= a + (b : Num)")), t355]))
  clinear_fstcart_sndcart_c.set(@tactics.prove(@term_syntax.parse_term("(clinear : ((Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _]) -> Bool)((fstcart : (Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _])) && (clinear : ((Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _]) -> Bool)((sndcart : (Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _]))"), t356))
}

///|
let clinear_fstcart_sndcart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLINEAR_FSTCART_SNDCART")

///|
/// `CLINEAR_FSTCART_SNDCART`
pub fn clinear_fstcart_sndcart() -> @kernel.Thm {
  clinear_fstcart_sndcart_c.get()
}

///|
/// FSTCART_CLINEAR
fn step_136() -> Unit raise {
  fstcart_clinear_c.set(@bool.conjunct1(clinear_fstcart_sndcart()))
}

///|
let fstcart_clinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FSTCART_CLINEAR")

///|
/// `FSTCART_CLINEAR`
pub fn fstcart_clinear() -> @kernel.Thm {
  fstcart_clinear_c.get()
}

///|
/// SNDCART_CLINEAR
fn step_137() -> Unit raise {
  sndcart_clinear_c.set(@bool.conjunct2(clinear_fstcart_sndcart()))
}

///|
let sndcart_clinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SNDCART_CLINEAR")

///|
/// `SNDCART_CLINEAR`
pub fn sndcart_clinear() -> @kernel.Thm {
  sndcart_clinear_c.get()
}

///|
/// FSTCART_SNDCART_CVECTOR_ZERO
fn step_138() -> Unit raise {
  let t357 = @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (b : Num) → x + (a : Num) <= a + b"))
  let t358 = @simp.simp_tac(@list.List([cvector_zero_component(), @cart.fstcart(), @cart.sndcart(), @cart.lambda_beta(), @cart.cart_eq(), @cart.dimindex_finite_sum(), @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (a : Num) → x <= a + (b : Num)")), t357]))
  fstcart_sndcart_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(fstcart : (Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _])((cvector_zero : Cart[Cart[Real, 2], Finite_sum[_, _]])) == (cvector_zero : Cart[Cart[Real, 2], _]) && (sndcart : (Cart[Cart[Real, 2], Finite_sum[_, _]]) -> Cart[Cart[Real, 2], _])((cvector_zero : Cart[Cart[Real, 2], Finite_sum[_, _]])) == (cvector_zero : Cart[Cart[Real, 2], _])"), t358))
}

///|
let fstcart_sndcart_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FSTCART_SNDCART_CVECTOR_ZERO")

///|
/// `FSTCART_SNDCART_CVECTOR_ZERO`
pub fn fstcart_sndcart_cvector_zero() -> @kernel.Thm {
  fstcart_sndcart_cvector_zero_c.get()
}

///|
/// FSTCART_CVECTOR_ZERO
fn step_139() -> Unit raise {
  fstcart_cvector_zero_c.set(@bool.conjunct1(fstcart_sndcart_cvector_zero()))
}

///|
let fstcart_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FSTCART_CVECTOR_ZERO")

///|
/// `FSTCART_CVECTOR_ZERO`
pub fn fstcart_cvector_zero() -> @kernel.Thm {
  fstcart_cvector_zero_c.get()
}

///|
/// SNDCART_CVECTOR_ZERO
fn step_140() -> Unit raise {
  sndcart_cvector_zero_c.set(@bool.conjunct2(fstcart_sndcart_cvector_zero()))
}

///|
let sndcart_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SNDCART_CVECTOR_ZERO")

///|
/// `SNDCART_CVECTOR_ZERO`
pub fn sndcart_cvector_zero() -> @kernel.Thm {
  sndcart_cvector_zero_c.get()
}

///|
/// FSTCART_SNDCART_CVECTOR_ADD
fn step_141() -> Unit raise {
  let t359 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([clinear()]))(clinear_fstcart_sndcart())]))
  fstcart_sndcart_cvector_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], Finite_sum[M, N]], ∀ y : Cart[Cart[Real, 2], Finite_sum[M, N]], fstcart(x + y) == fstcart(x) + fstcart(y) && sndcart(x + y) == sndcart(x) + sndcart(y)"), t359))
}

///|
let fstcart_sndcart_cvector_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FSTCART_SNDCART_CVECTOR_ADD")

///|
/// `FSTCART_SNDCART_CVECTOR_ADD`
pub fn fstcart_sndcart_cvector_add() -> @kernel.Thm {
  fstcart_sndcart_cvector_add_c.get()
}

///|
/// FSTCART_SNDCART_CVECTOR_MUL
fn step_142() -> Unit raise {
  let t360 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([clinear()]))(clinear_fstcart_sndcart())]))
  fstcart_sndcart_cvector_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], Finite_sum[M, N]], ∀ c : Cart[Real, 2], fstcart(cvector_mul(c, x)) == cvector_mul(c, fstcart(x)) && sndcart(cvector_mul(c, x)) == cvector_mul(c, sndcart(x))"), t360))
}

///|
let fstcart_sndcart_cvector_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FSTCART_SNDCART_CVECTOR_MUL")

///|
/// `FSTCART_SNDCART_CVECTOR_MUL`
pub fn fstcart_sndcart_cvector_mul() -> @kernel.Thm {
  fstcart_sndcart_cvector_mul_c.get()
}

///|
/// `PASTECART_TAC`
pub fn pastecart_tac(x361 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let xs = x361
  @simp.rewrite_tac(((xs.prepend(@cart.sndcart_pastecart())).prepend(@cart.fstcart_pastecart())).prepend(@cart.pastecart_eq()))
}

///|
/// PASTECART_CVECTOR_ZERO
fn step_143() -> Unit raise {
  let t363 = pastecart_tac(@list.List([fstcart_sndcart_cvector_zero()]))
  pastecart_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(pastecart : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], Finite_sum[N, M]])((cvector_zero : Cart[Cart[Real, 2], N]), (cvector_zero : Cart[Cart[Real, 2], M])) == (cvector_zero : Cart[Cart[Real, 2], Finite_sum[N, M]])"), t363))
}

///|
let pastecart_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_CVECTOR_ZERO")

///|
/// `PASTECART_CVECTOR_ZERO`
pub fn pastecart_cvector_zero() -> @kernel.Thm {
  pastecart_cvector_zero_c.get()
}

///|
/// PASTECART_EQ_CVECTOR_ZERO
fn step_144() -> Unit raise {
  let t364 = pastecart_tac(@list.List([fstcart_sndcart_cvector_zero()]))
  pastecart_eq_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], M], (pastecart(x, y) == cvector_zero) == (x == cvector_zero && y == cvector_zero)"), t364))
}

///|
let pastecart_eq_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_EQ_CVECTOR_ZERO")

///|
/// `PASTECART_EQ_CVECTOR_ZERO`
pub fn pastecart_eq_cvector_zero() -> @kernel.Thm {
  pastecart_eq_cvector_zero_c.get()
}

///|
/// PASTECART_CVECTOR_ADD
fn step_145() -> Unit raise {
  let t365 = pastecart_tac(@list.List([fstcart_sndcart_cvector_add()]))
  pastecart_cvector_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x1 : Cart[Cart[Real, 2], N], ∀ y2 : _, ∀ x2 : Cart[Cart[Real, 2], N], ∀ y2 : Cart[Cart[Real, 2], M], pastecart(x1, (y1 : Cart[Cart[Real, 2], M])) + pastecart(x2, y2) == pastecart(x1 + x2, y1 + y2)"), t365))
}

///|
let pastecart_cvector_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_CVECTOR_ADD")

///|
/// `PASTECART_CVECTOR_ADD`
pub fn pastecart_cvector_add() -> @kernel.Thm {
  pastecart_cvector_add_c.get()
}

///|
/// PASTECART_CVECTOR_MUL
fn step_146() -> Unit raise {
  let t366 = pastecart_tac(@list.List([fstcart_sndcart_cvector_mul()]))
  pastecart_cvector_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x1 : Cart[Cart[Real, 2], _], ∀ x2 : _, ∀ c : Cart[Real, 2], pastecart(cvector_mul(c, x1), cvector_mul(c, (y1 : Cart[Cart[Real, 2], _]))) == cvector_mul(c, pastecart(x1, y1))"), t366))
}

///|
let pastecart_cvector_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_CVECTOR_MUL")

///|
/// `PASTECART_CVECTOR_MUL`
pub fn pastecart_cvector_mul() -> @kernel.Thm {
  pastecart_cvector_mul_c.get()
}

///|
/// cvector_re
fn step_147() -> Unit raise {
  cvector_re_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_re : (Cart[Cart[Real, 2], N]) -> Cart[Real, N]) == vector_map(Re)")))
}

///|
let cvector_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_re")

///|
/// `cvector_re`
pub fn cvector_re() -> @kernel.Thm {
  cvector_re_c.get()
}

///|
/// cvector_im
fn step_148() -> Unit raise {
  cvector_im_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_im : (Cart[Cart[Real, 2], N]) -> Cart[Real, N]) == vector_map(Im)")))
}

///|
let cvector_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_im")

///|
/// `cvector_im`
pub fn cvector_im() -> @kernel.Thm {
  cvector_im_c.get()
}

///|
/// vector_to_cvector
fn step_149() -> Unit raise {
  vector_to_cvector_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_to_cvector : (Cart[Real, N]) -> Cart[Cart[Real, 2], N]) == vector_map(Cx)")))
}

///|
let vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_to_cvector")

///|
/// `vector_to_cvector`
pub fn vector_to_cvector() -> @kernel.Thm {
  vector_to_cvector_c.get()
}

///|
/// CVECTOR_RE_COMPONENT
fn step_150() -> Unit raise {
  let t367 = @simp.rewrite_tac(@list.List([cvector_re(), vector_map_component()]))
  cvector_re_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(cvector_re(x), i) == Re(op_dollar(x, i))"), t367))
}

///|
let cvector_re_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_COMPONENT")

///|
/// `CVECTOR_RE_COMPONENT`
pub fn cvector_re_component() -> @kernel.Thm {
  cvector_re_component_c.get()
}

///|
/// CVECTOR_IM_COMPONENT
fn step_151() -> Unit raise {
  let t368 = @simp.rewrite_tac(@list.List([cvector_im(), vector_map_component()]))
  cvector_im_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ i : Num, op_dollar(cvector_im(x), i) == Im(op_dollar(x, i))"), t368))
}

///|
let cvector_im_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_COMPONENT")

///|
/// `CVECTOR_IM_COMPONENT`
pub fn cvector_im_component() -> @kernel.Thm {
  cvector_im_component_c.get()
}

///|
/// VECTOR_TO_CVECTOR_COMPONENT
fn step_152() -> Unit raise {
  let t369 = @simp.rewrite_tac(@list.List([vector_to_cvector(), vector_map_component()]))
  vector_to_cvector_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ i : Num, op_dollar(vector_to_cvector(x), i) == Cx(op_dollar(x, i))"), t369))
}

///|
let vector_to_cvector_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_TO_CVECTOR_COMPONENT")

///|
/// `VECTOR_TO_CVECTOR_COMPONENT`
pub fn vector_to_cvector_component() -> @kernel.Thm {
  vector_to_cvector_component_c.get()
}

///|
/// VECTOR_TO_CVECTOR_ZERO
fn step_153() -> Unit raise {
  let t370 = @simp.rewrite_tac(@list.List([vector_to_cvector_component(), cvector_zero_component(), @vectors.vec_component()]))
  let t371 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t370)
  vector_to_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(vector_to_cvector : (Cart[Real, N]) -> Cart[Cart[Real, 2], N])((vec : (Num) -> Cart[Real, N])(0)) == (cvector_zero : Cart[Cart[Real, 2], N])"), t371))
}

///|
let vector_to_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_TO_CVECTOR_ZERO")

///|
/// `VECTOR_TO_CVECTOR_ZERO`
pub fn vector_to_cvector_zero() -> @kernel.Thm {
  vector_to_cvector_zero_c.get()
}

///|
/// VECTOR_TO_CVECTOR_ZERO_EQ
fn step_154() -> Unit raise {
  let t374 = @simp.simp_tac(@list.List([vector_to_cvector_component(), cvector_zero_component(), @vectors.vec_component(), @complexes.cx_inj()]))
  let t373 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  let t372 = @simp.simp_tac(@list.List([vector_to_cvector_zero()]))
  let t375 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t372), t373), t374)
  vector_to_cvector_zero_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], (vector_to_cvector(x) == cvector_zero) == (x == vec(0))"), t375))
}

///|
let vector_to_cvector_zero_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_TO_CVECTOR_ZERO_EQ")

///|
/// `VECTOR_TO_CVECTOR_ZERO_EQ`
pub fn vector_to_cvector_zero_eq() -> @kernel.Thm {
  vector_to_cvector_zero_eq_c.get()
}

///|
/// CVECTOR_ZERO_VEC0
fn step_155() -> Unit raise {
  let t377 = @meson.meson_tac(@list.List([]))
  let t376 = @simp.rewrite_tac(@list.List([cvector_zero_component(), cvector_re_component(), cvector_im_component(), @vectors.vec_component(), @complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t378 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t376), t377)
  cvector_zero_vec0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], (x == cvector_zero) == (cvector_re(x) == vec(0) && cvector_im(x) == vec(0))"), t378))
}

///|
let cvector_zero_vec0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ZERO_VEC0")

///|
/// `CVECTOR_ZERO_VEC0`
pub fn cvector_zero_vec0() -> @kernel.Thm {
  cvector_zero_vec0_c.get()
}

///|
/// VECTOR_TO_CVECTOR_MUL
fn step_156() -> Unit raise {
  let t379 = @simp.rewrite_tac(@list.List([vector_to_cvector_component(), cvector_mul_component(), @vectors.vector_mul_component(), @complexes.cx_mul()]))
  let t380 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t379)
  vector_to_cvector_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, N], vector_to_cvector(op_pct(a, x)) == cvector_mul(Cx(a), vector_to_cvector(x))"), t380))
}

///|
let vector_to_cvector_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_TO_CVECTOR_MUL")

///|
/// `VECTOR_TO_CVECTOR_MUL`
pub fn vector_to_cvector_mul() -> @kernel.Thm {
  vector_to_cvector_mul_c.get()
}

///|
/// CVECTOR_EQ
fn step_157() -> Unit raise {
  let t383 = @meson.meson_tac(@list.List([]))
  let t382 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_add(), @complexes.im_add(), @complexes.re_mul_ii(), @calc_int.real_neg_0(), @calc_int.real_add_rid(), @realax.real_add_lid(), @complexes.im_mul_ii()]))
  let t381 = @simp.rewrite_tac(@list.List([cvector_add_component(), cvector_mul_component(), cvector_re_component(), cvector_im_component(), vector_to_cvector_component()]))
  let t384 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t381), t382), t383)
  cvector_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], (x == vector_to_cvector(y) + cvector_mul(ii, vector_to_cvector(z))) == (cvector_re(x) == y && cvector_im(x) == z)"), t384))
}

///|
let cvector_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_EQ")

///|
/// `CVECTOR_EQ`
pub fn cvector_eq() -> @kernel.Thm {
  cvector_eq_c.get()
}

///|
/// CVECTOR_RE_VECTOR_TO_CVECTOR
fn step_158() -> Unit raise {
  let t385 = @simp.rewrite_tac(@list.List([cvector_re_component(), vector_to_cvector_component(), @complexes.re_cx()]))
  let t386 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t385)
  cvector_re_vector_to_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], cvector_re(vector_to_cvector(x)) == x"), t386))
}

///|
let cvector_re_vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_VECTOR_TO_CVECTOR")

///|
/// `CVECTOR_RE_VECTOR_TO_CVECTOR`
pub fn cvector_re_vector_to_cvector() -> @kernel.Thm {
  cvector_re_vector_to_cvector_c.get()
}

///|
/// CVECTOR_IM_VECTOR_TO_CVECTOR
fn step_159() -> Unit raise {
  let t387 = @simp.rewrite_tac(@list.List([cvector_im_component(), vector_to_cvector_component(), @complexes.im_cx(), @vectors.vec_component()]))
  let t388 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t387)
  cvector_im_vector_to_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], cvector_im(vector_to_cvector(x)) == vec(0)"), t388))
}

///|
let cvector_im_vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_VECTOR_TO_CVECTOR")

///|
/// `CVECTOR_IM_VECTOR_TO_CVECTOR`
pub fn cvector_im_vector_to_cvector() -> @kernel.Thm {
  cvector_im_vector_to_cvector_c.get()
}

///|
/// CVECTOR_IM_VECTOR_TO_CVECTOR_IM
fn step_160() -> Unit raise {
  let t389 = @simp.rewrite_tac(@list.List([cvector_im_component(), vector_to_cvector_component(), @complexes.im_cx(), @vectors.vec_component(), cvector_mul_component(), @complexes.im_mul_ii(), @complexes.re_cx()]))
  let t390 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t389)
  cvector_im_vector_to_cvector_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], cvector_im(cvector_mul(ii, vector_to_cvector(x))) == x"), t390))
}

///|
let cvector_im_vector_to_cvector_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_VECTOR_TO_CVECTOR_IM")

///|
/// `CVECTOR_IM_VECTOR_TO_CVECTOR_IM`
pub fn cvector_im_vector_to_cvector_im() -> @kernel.Thm {
  cvector_im_vector_to_cvector_im_c.get()
}

///|
/// VECTOR_TO_CVECTOR_CVECTOR_RE_IM
fn step_161() -> Unit raise {
  let t391 = @simp.rewrite_tac(@list.List([cvector_eq()]))
  let t392 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@theorems.eq_sym())), t391)
  vector_to_cvector_cvector_re_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], vector_to_cvector(cvector_re(x)) + cvector_mul(ii, vector_to_cvector(cvector_im(x))) == x"), t392))
}

///|
let vector_to_cvector_cvector_re_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_TO_CVECTOR_CVECTOR_RE_IM")

///|
/// `VECTOR_TO_CVECTOR_CVECTOR_RE_IM`
pub fn vector_to_cvector_cvector_re_im() -> @kernel.Thm {
  vector_to_cvector_cvector_re_im_c.get()
}

///|
/// CVECTOR_IM_VECTOR_TO_CVECTOR_RE_IM
fn step_162() -> Unit raise {
  let t393 = @simp.rewrite_tac(@list.List([cvector_im_component(), cvector_add_component(), cvector_mul_component(), vector_to_cvector_component(), @complexes.im_add(), @complexes.im_cx(), @complexes.im_mul_ii(), @complexes.re_cx(), @realax.real_add_lid()]))
  let t394 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t393)
  cvector_im_vector_to_cvector_re_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], cvector_im(vector_to_cvector(x) + cvector_mul(ii, vector_to_cvector(y))) == y"), t394))
}

///|
let cvector_im_vector_to_cvector_re_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_VECTOR_TO_CVECTOR_RE_IM")

///|
/// `CVECTOR_IM_VECTOR_TO_CVECTOR_RE_IM`
pub fn cvector_im_vector_to_cvector_re_im() -> @kernel.Thm {
  cvector_im_vector_to_cvector_re_im_c.get()
}

///|
/// CVECTOR_RE_VECTOR_TO_CVECTOR_RE_IM
fn step_163() -> Unit raise {
  let t395 = @simp.rewrite_tac(@list.List([cvector_re_component(), cvector_add_component(), cvector_mul_component(), @complexes.re_add(), vector_to_cvector_component(), @complexes.re_cx(), @complexes.re_mul_cx(), @complexes.re_ii(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t396 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t395)
  cvector_re_vector_to_cvector_re_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], cvector_re(vector_to_cvector(x) + cvector_mul(ii, vector_to_cvector(y))) == x"), t396))
}

///|
let cvector_re_vector_to_cvector_re_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_VECTOR_TO_CVECTOR_RE_IM")

///|
/// `CVECTOR_RE_VECTOR_TO_CVECTOR_RE_IM`
pub fn cvector_re_vector_to_cvector_re_im() -> @kernel.Thm {
  cvector_re_vector_to_cvector_re_im_c.get()
}

///|
/// CVECTOR_RE_ADD
fn step_164() -> Unit raise {
  let t397 = @simp.rewrite_tac(@list.List([cvector_re_component(), @vectors.vector_add_component(), cvector_add_component(), @complexes.re_add()]))
  let t398 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t397)
  cvector_re_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_re(x + y) == cvector_re(x) + cvector_re(y)"), t398))
}

///|
let cvector_re_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_ADD")

///|
/// `CVECTOR_RE_ADD`
pub fn cvector_re_add() -> @kernel.Thm {
  cvector_re_add_c.get()
}

///|
/// CVECTOR_IM_ADD
fn step_165() -> Unit raise {
  let t399 = @simp.rewrite_tac(@list.List([cvector_im_component(), @vectors.vector_add_component(), cvector_add_component(), @complexes.im_add()]))
  let t400 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t399)
  cvector_im_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_im(x + y) == cvector_im(x) + cvector_im(y)"), t400))
}

///|
let cvector_im_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_ADD")

///|
/// `CVECTOR_IM_ADD`
pub fn cvector_im_add() -> @kernel.Thm {
  cvector_im_add_c.get()
}

///|
/// CVECTOR_RE_MUL
fn step_166() -> Unit raise {
  let t401 = @simp.rewrite_tac(@list.List([cvector_re_component(), @vectors.vector_mul_component(), cvector_mul_component(), @complexes.re_mul_cx()]))
  let t402 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t401)
  cvector_re_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Cart[Real, 2], N], cvector_re(cvector_mul(Cx(a), x)) == op_pct(a, cvector_re(x))"), t402))
}

///|
let cvector_re_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_MUL")

///|
/// `CVECTOR_RE_MUL`
pub fn cvector_re_mul() -> @kernel.Thm {
  cvector_re_mul_c.get()
}

///|
/// CVECTOR_IM_MUL
fn step_167() -> Unit raise {
  let t403 = @simp.rewrite_tac(@list.List([cvector_im_component(), @vectors.vector_mul_component(), cvector_mul_component(), @complexes.im_mul_cx()]))
  let t404 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t403)
  cvector_im_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Cart[Real, 2], N], cvector_im(cvector_mul(Cx(a), x)) == op_pct(a, cvector_im(x))"), t404))
}

///|
let cvector_im_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_MUL")

///|
/// `CVECTOR_IM_MUL`
pub fn cvector_im_mul() -> @kernel.Thm {
  cvector_im_mul_c.get()
}

///|
/// CVECTOR_RE_VECTOR_MAP
fn step_168() -> Unit raise {
  let t405 = @simp.rewrite_tac(@list.List([cvector_re(), vector_map_vector_map()]))
  cvector_re_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 2], ∀ v : Cart[A, N], cvector_re(vector_map(f, v)) == vector_map(o(Re, f), v)"), t405))
}

///|
let cvector_re_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_VECTOR_MAP")

///|
/// `CVECTOR_RE_VECTOR_MAP`
pub fn cvector_re_vector_map() -> @kernel.Thm {
  cvector_re_vector_map_c.get()
}

///|
/// CVECTOR_IM_VECTOR_MAP
fn step_169() -> Unit raise {
  let t406 = @simp.rewrite_tac(@list.List([cvector_im(), vector_map_vector_map()]))
  cvector_im_vector_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 2], ∀ v : Cart[A, N], cvector_im(vector_map(f, v)) == vector_map(o(Im, f), v)"), t406))
}

///|
let cvector_im_vector_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_VECTOR_MAP")

///|
/// `CVECTOR_IM_VECTOR_MAP`
pub fn cvector_im_vector_map() -> @kernel.Thm {
  cvector_im_vector_map_c.get()
}

///|
/// VECTOR_MAP_CVECTOR_RE
fn step_170() -> Unit raise {
  let t407 = @simp.rewrite_tac(@list.List([cvector_re(), vector_map_vector_map()]))
  vector_map_cvector_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> A, ∀ v : Cart[Cart[Real, 2], N], vector_map(f, cvector_re(v)) == vector_map(o(f, Re), v)"), t407))
}

///|
let vector_map_cvector_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_CVECTOR_RE")

///|
/// `VECTOR_MAP_CVECTOR_RE`
pub fn vector_map_cvector_re() -> @kernel.Thm {
  vector_map_cvector_re_c.get()
}

///|
/// VECTOR_MAP_CVECTOR_IM
fn step_171() -> Unit raise {
  let t408 = @simp.rewrite_tac(@list.List([cvector_im(), vector_map_vector_map()]))
  vector_map_cvector_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> A, ∀ v : Cart[Cart[Real, 2], N], vector_map(f, cvector_im(v)) == vector_map(o(f, Im), v)"), t408))
}

///|
let vector_map_cvector_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_MAP_CVECTOR_IM")

///|
/// `VECTOR_MAP_CVECTOR_IM`
pub fn vector_map_cvector_im() -> @kernel.Thm {
  vector_map_cvector_im_c.get()
}

///|
/// CVECTOR_RE_VECTOR_MAP2
fn step_172() -> Unit raise {
  let t409 = @simp.rewrite_tac(@list.List([cvector_re(), vector_map_vector_map2()]))
  cvector_re_vector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> Cart[Real, 2], ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], cvector_re(vector_map2(f, v1, v2)) == vector_map2((x : A) => (y : B) => Re(f(x, y)), v1, v2)"), t409))
}

///|
let cvector_re_vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_VECTOR_MAP2")

///|
/// `CVECTOR_RE_VECTOR_MAP2`
pub fn cvector_re_vector_map2() -> @kernel.Thm {
  cvector_re_vector_map2_c.get()
}

///|
/// CVECTOR_IM_VECTOR_MAP2
fn step_173() -> Unit raise {
  let t410 = @simp.rewrite_tac(@list.List([cvector_im(), vector_map_vector_map2()]))
  cvector_im_vector_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> Cart[Real, 2], ∀ v1 : Cart[A, N], ∀ v2 : Cart[B, N], cvector_im(vector_map2(f, v1, v2)) == vector_map2((x : A) => (y : B) => Im(f(x, y)), v1, v2)"), t410))
}

///|
let cvector_im_vector_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_VECTOR_MAP2")

///|
/// `CVECTOR_IM_VECTOR_MAP2`
pub fn cvector_im_vector_map2() -> @kernel.Thm {
  cvector_im_vector_map2_c.get()
}

///|
/// cvector_flatten
fn step_174() -> Unit raise {
  cvector_flatten_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_flatten : (Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]])((v : Cart[Cart[Real, 2], N])) == pastecart(cvector_re(v), cvector_im(v))")))
}

///|
let cvector_flatten_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_flatten")

///|
/// `cvector_flatten`
pub fn cvector_flatten() -> @kernel.Thm {
  cvector_flatten_c.get()
}

///|
/// FLATTEN_RE_IM_COMPONENT
fn step_175() -> Unit raise {
  let t411 = @simp.simp_tac(@list.List([@arith.mult_2(), @equal.gsym(@cart.dimindex_finite_sum()), cvector_flatten(), @cart.pastecart(), @cart.lambda_beta()]))
  flatten_re_im_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Cart[Real, 2], N], ∀ i : Num, 1 <= i && i <= 2 * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[Real, Finite_sum[N, N]], Num) -> Real)((cvector_flatten : (Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]])(v), i) == (if i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) { (op_dollar : (Cart[Real, N], Num) -> Real)((cvector_re : (Cart[Cart[Real, 2], N]) -> Cart[Real, N])(v), i) } else { (op_dollar : (Cart[Real, N], Num) -> Real)((cvector_im : (Cart[Cart[Real, 2], N]) -> Cart[Real, N])(v), i - (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) })"), t411))
}

///|
let flatten_re_im_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_RE_IM_COMPONENT")

///|
/// `FLATTEN_RE_IM_COMPONENT`
pub fn flatten_re_im_component() -> @kernel.Thm {
  flatten_re_im_component_c.get()
}

///|
/// complex_vector
fn step_176() -> Unit raise {
  complex_vector_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_vector : ((Cart[Real, N], Cart[Real, N])) -> Cart[Cart[Real, 2], N])(((v1 : Cart[Real, N]), (v2 : Cart[Real, N]))) == vector_map2((x : Real) => (y : Real) => Cx(x) + ii * Cx(y), v1, v2)")))
}

///|
let complex_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_vector")

///|
/// `complex_vector`
pub fn complex_vector() -> @kernel.Thm {
  complex_vector_c.get()
}

///|
/// COMPLEX_VECTOR_TRANSPOSE
fn step_177() -> Unit raise {
  let t412 = @simp.simp_tac(@list.List([complex_vector(), cvector_add_component(), cvector_mul_component(), vector_to_cvector_component(), vector_map2_component()]))
  let t413 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cart.cart_eq()])), t412)
  complex_vector_transpose_c.set(@tactics.prove(@term_syntax.parse_term("∀ v1 : Cart[Real, N], ∀ v2 : Cart[Real, N], complex_vector((v1, v2)) == vector_to_cvector(v1) + cvector_mul(ii, vector_to_cvector(v2))"), t413))
}

///|
let complex_vector_transpose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_VECTOR_TRANSPOSE")

///|
/// `COMPLEX_VECTOR_TRANSPOSE`
pub fn complex_vector_transpose() -> @kernel.Thm {
  complex_vector_transpose_c.get()
}

///|
/// cvector_unflatten
fn step_178() -> Unit raise {
  cvector_unflatten_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_unflatten : (Cart[Real, Finite_sum[N, N]]) -> Cart[Cart[Real, 2], N])((v : Cart[Real, Finite_sum[N, N]])) == complex_vector((fstcart(v), sndcart(v)))")))
}

///|
let cvector_unflatten_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_unflatten")

///|
/// `cvector_unflatten`
pub fn cvector_unflatten() -> @kernel.Thm {
  cvector_unflatten_c.get()
}

///|
/// UNFLATTEN_FLATTEN
fn step_179() -> Unit raise {
  let t414 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @trivia.i_def(), cvector_flatten(), cvector_unflatten(), @cart.fstcart_pastecart(), @cart.sndcart_pastecart(), complex_vector_transpose(), vector_to_cvector_cvector_re_im()]))
  unflatten_flatten_c.set(@tactics.prove(@term_syntax.parse_term("(o : ((Cart[Real, Finite_sum[N, N]]) -> Cart[Cart[Real, 2], N], (Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]], Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((cvector_unflatten : (Cart[Real, Finite_sum[N, N]]) -> Cart[Cart[Real, 2], N]), (cvector_flatten : (Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]])) == (I : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])"), t414))
}

///|
let unflatten_flatten_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNFLATTEN_FLATTEN")

///|
/// `UNFLATTEN_FLATTEN`
pub fn unflatten_flatten() -> @kernel.Thm {
  unflatten_flatten_c.get()
}

///|
/// FLATTEN_UNFLATTEN
fn step_180() -> Unit raise {
  let t415 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @trivia.i_def(), cvector_flatten(), cvector_unflatten(), @cart.pastecart_fst_snd(), complex_vector_transpose(), cvector_re_vector_to_cvector_re_im(), cvector_im_vector_to_cvector_re_im()]))
  flatten_unflatten_c.set(@tactics.prove(@term_syntax.parse_term("(o : ((Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]], (Cart[Real, Finite_sum[N, N]]) -> Cart[Cart[Real, 2], N], Cart[Real, Finite_sum[N, N]]) -> Cart[Real, Finite_sum[N, N]])((cvector_flatten : (Cart[Cart[Real, 2], N]) -> Cart[Real, Finite_sum[N, N]]), (cvector_unflatten : (Cart[Real, Finite_sum[N, N]]) -> Cart[Cart[Real, 2], N])) == (I : (Cart[Real, Finite_sum[N, N]]) -> Cart[Real, Finite_sum[N, N]])"), t415))
}

///|
let flatten_unflatten_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_UNFLATTEN")

///|
/// `FLATTEN_UNFLATTEN`
pub fn flatten_unflatten() -> @kernel.Thm {
  flatten_unflatten_c.get()
}

///|
/// FLATTEN_CLINEAR
fn step_181() -> Unit raise {
  let t423 = @simp.simp_tac(@list.List([vector_map2_component(), @vectors.vector_add_component(), cvector_add_component(), @complexes.cx_add(), @vectors.vector_mul_component(), cvector_mul_component(), @vectors.fstcart_cmul(), @vectors.sndcart_cmul(), @complexes.cx_mul()]))
  let t422 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  let t421 = @tactics.assum_list(fn(x420 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @simp.rewrite_tac(((x419 : @list.List[@kernel.Thm]) => @lib.map(@equal.gsym, x419))(x420))
  })
  let t418 = @simp.rewrite_tac(@lib.map(@equal.gsym, @list.List([cvector_re_add(), cvector_im_add(), cvector_re_mul(), cvector_im_mul()])))
  let t417 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.ap_term_tac, @tactics.mk_comb_tac))
  let t416 = @tactics.repeat_tac(@tactics.strip_tac)
  let t424 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([clinear(), @vectors.linear(), cvector_flatten(), cvector_unflatten(), @trivia.o_def(), @vectors.fstcart_add(), @vectors.sndcart_add(), @vectors.pastecart_add(), complex_vector(), @equal.gsym(@vectors.pastecart_cmul())])), t416), t417), t418), @tactics.ap_term_tac), t421), @tactics.ap_term_tac), t422), t423), @complexes.simple_complex_arith_tac)
  flatten_clinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], M], clinear(f) → linear(o(cvector_flatten, o(f, cvector_unflatten)))"), t424))
}

///|
let flatten_clinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_CLINEAR")

///|
/// `FLATTEN_CLINEAR`
pub fn flatten_clinear() -> @kernel.Thm {
  flatten_clinear_c.get()
}

///|
/// FLATTEN_MAP
fn step_182() -> Unit raise {
  let t425 = @simp.simp_tac(@list.List([cvector_flatten(), cvector_re_vector_map(), cvector_im_vector_map(), @equal.gsym(pastecart_vector_map()), vector_map_cvector_re(), vector_map_cvector_im(), @trivia.o_def(), @complexes.im_def(), @complexes.re_def(), vector_map_component()]))
  flatten_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Real) -> Real, f == vector_map(g) → (∀ x : Cart[Cart[Real, 2], N], cvector_flatten(vector_map(f, x)) == vector_map(g, cvector_flatten(x)))"), t425))
}

///|
let flatten_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_MAP")

///|
/// `FLATTEN_MAP`
pub fn flatten_map() -> @kernel.Thm {
  flatten_map_c.get()
}

///|
/// FLATTEN_NEG
fn step_183() -> Unit raise {
  let t426 = @simp.rewrite_tac(@list.List([vector_neg_is_a_map()]))
  let t427 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cvector_neg(), @drule.match_mp(flatten_map())(complex_neg_is_a_map())])), t426)
  flatten_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_flatten(-x) == -cvector_flatten(x)"), t427))
}

///|
let flatten_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_NEG")

///|
/// `FLATTEN_NEG`
pub fn flatten_neg() -> @kernel.Thm {
  flatten_neg_c.get()
}

///|
/// CVECTOR_NEG_ALT
fn step_184() -> Unit raise {
  let t428 = @simp.rewrite_rule(@list.List([@trivia.o_def(), @class.fun_eq_thm(), @trivia.i_def()]))(unflatten_flatten())
  let t429 = @simp.rewrite_tac(@list.List([@equal.gsym(flatten_neg()), t428]))
  cvector_neg_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], -x == cvector_unflatten(-cvector_flatten(x))"), t429))
}

///|
let cvector_neg_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_NEG_ALT")

///|
/// `CVECTOR_NEG_ALT`
pub fn cvector_neg_alt() -> @kernel.Thm {
  cvector_neg_alt_c.get()
}

///|
/// FLATTEN_MAP2
fn step_185() -> Unit raise {
  let t432 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.im_def(), @complexes.re_def(), vector_map2_component(), @trivia.o_def()]))
  let t431 = @tactics.repeat_tac(@tactics.mk_comb_tac)
  let t430 = @simp.rewrite_tac(@list.List([cvector_re(), cvector_im(), vector_map2_lvector_map(), vector_map2_rvector_map()]))
  let t433 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([cvector_flatten(), cvector_re_vector_map2(), cvector_im_vector_map2(), cvector_re_vector_map2(), @equal.gsym(pastecart_vector_map2())])), t430), t431), t432)
  flatten_map2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Real, Real) -> Real, f == vector_map2(g) → (∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_flatten(vector_map2(f, x, y)) == vector_map2(g, cvector_flatten(x), cvector_flatten(y)))"), t433))
}

///|
let flatten_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_MAP2")

///|
/// `FLATTEN_MAP2`
pub fn flatten_map2() -> @kernel.Thm {
  flatten_map2_c.get()
}

///|
/// FLATTEN_ADD
fn step_186() -> Unit raise {
  let t434 = @simp.rewrite_tac(@list.List([vector_add_is_a_map()]))
  let t435 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cvector_add(), @drule.match_mp(flatten_map2())(complex_add_is_a_map())])), t434)
  flatten_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_flatten(x + y) == cvector_flatten(x) + cvector_flatten(y)"), t435))
}

///|
let flatten_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_ADD")

///|
/// `FLATTEN_ADD`
pub fn flatten_add() -> @kernel.Thm {
  flatten_add_c.get()
}

///|
/// CVECTOR_ADD_ALT
fn step_187() -> Unit raise {
  let t436 = @simp.rewrite_rule(@list.List([@trivia.o_def(), @class.fun_eq_thm(), @trivia.i_def()]))(unflatten_flatten())
  let t437 = @simp.rewrite_tac(@list.List([@equal.gsym(flatten_add()), t436]))
  cvector_add_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x + y == cvector_unflatten(cvector_flatten(x) + cvector_flatten(y))"), t437))
}

///|
let cvector_add_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_ADD_ALT")

///|
/// `CVECTOR_ADD_ALT`
pub fn cvector_add_alt() -> @kernel.Thm {
  cvector_add_alt_c.get()
}

///|
/// FLATTEN_SUB
fn step_188() -> Unit raise {
  let t438 = @simp.rewrite_tac(@list.List([vector_sub_is_a_map()]))
  let t439 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cvector_sub(), @drule.match_mp(flatten_map2())(complex_sub_is_a_map())])), t438)
  flatten_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_flatten(x - y) == cvector_flatten(x) - cvector_flatten(y)"), t439))
}

///|
let flatten_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_SUB")

///|
/// `FLATTEN_SUB`
pub fn flatten_sub() -> @kernel.Thm {
  flatten_sub_c.get()
}

///|
/// CVECTOR_SUB_ALT
fn step_189() -> Unit raise {
  let t440 = @simp.rewrite_rule(@list.List([@trivia.o_def(), @class.fun_eq_thm(), @trivia.i_def()]))(unflatten_flatten())
  let t441 = @simp.rewrite_tac(@list.List([@equal.gsym(flatten_sub()), t440]))
  cvector_sub_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], x - y == cvector_unflatten(cvector_flatten(x) - cvector_flatten(y))"), t441))
}

///|
let cvector_sub_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_SUB_ALT")

///|
/// `CVECTOR_SUB_ALT`
pub fn cvector_sub_alt() -> @kernel.Thm {
  cvector_sub_alt_c.get()
}

///|
/// cvector_cnj
fn step_190() -> Unit raise {
  cvector_cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(cvector_cnj : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N]) == vector_map(cnj)")))
}

///|
let cvector_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvector_cnj")

///|
/// `cvector_cnj`
pub fn cvector_cnj() -> @kernel.Thm {
  cvector_cnj_c.get()
}

///|
/// `CVECTOR_MAP_PROPERTY`
pub fn cvector_map_property(x442 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let thm = x442
  (x444 : @kernel.Thm) => vector_map_property(thm, @list.List([cvector_zero(), cvector_add(), cvector_sub(), cvector_neg(), cvector_mul(), cvector_cnj(), cvector_re(), cvector_im()]), x444)
}

///|
/// CVECTOR_CNJ_ADD
fn step_191() -> Unit raise {
  cvector_cnj_add_c.set(cvector_map_property(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_cnj(x + y) == cvector_cnj(x) + cvector_cnj(y)"))(@complexes.cnj_add()))
}

///|
let cvector_cnj_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_CNJ_ADD")

///|
/// `CVECTOR_CNJ_ADD`
pub fn cvector_cnj_add() -> @kernel.Thm {
  cvector_cnj_add_c.get()
}

///|
/// CVECTOR_CNJ_SUB
fn step_192() -> Unit raise {
  cvector_cnj_sub_c.set(cvector_map_property(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cvector_cnj(x - y) == cvector_cnj(x) - cvector_cnj(y)"))(@complexes.cnj_sub()))
}

///|
let cvector_cnj_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_CNJ_SUB")

///|
/// `CVECTOR_CNJ_SUB`
pub fn cvector_cnj_sub() -> @kernel.Thm {
  cvector_cnj_sub_c.get()
}

///|
/// CVECTOR_CNJ_NEG
fn step_193() -> Unit raise {
  cvector_cnj_neg_c.set(cvector_map_property(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_cnj(-x) == -cvector_cnj(x)"))(@complexes.cnj_neg()))
}

///|
let cvector_cnj_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_CNJ_NEG")

///|
/// `CVECTOR_CNJ_NEG`
pub fn cvector_cnj_neg() -> @kernel.Thm {
  cvector_cnj_neg_c.get()
}

///|
/// CVECTOR_RE_CNJ
fn step_194() -> Unit raise {
  cvector_re_cnj_c.set(cvector_map_property(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_re(cvector_cnj(x)) == cvector_re(x)"))(@complexes.re_cnj()))
}

///|
let cvector_re_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_RE_CNJ")

///|
/// `CVECTOR_RE_CNJ`
pub fn cvector_re_cnj() -> @kernel.Thm {
  cvector_re_cnj_c.get()
}

///|
/// CVECTOR_IM_CNJ
fn step_195() -> Unit raise {
  let t445 = vector_map_property_tac(@list.List([cvector_im(), cvector_cnj(), vector_neg_is_a_map()]), @complexes.im_cnj())
  cvector_im_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_im(cvector_cnj(x)) == -cvector_im(x)"), t445))
}

///|
let cvector_im_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_IM_CNJ")

///|
/// `CVECTOR_IM_CNJ`
pub fn cvector_im_cnj() -> @kernel.Thm {
  cvector_im_cnj_c.get()
}

///|
/// CVECTOR_CNJ_CNJ
fn step_196() -> Unit raise {
  cvector_cnj_cnj_c.set(cvector_map_property(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_cnj(cvector_cnj(x)) == x"))(@complexes.cnj_cnj()))
}

///|
let cvector_cnj_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_CNJ_CNJ")

///|
/// `CVECTOR_CNJ_CNJ`
pub fn cvector_cnj_cnj() -> @kernel.Thm {
  cvector_cnj_cnj_c.get()
}

///|
/// Multivariate/cvectors.ml:1163
fn step_197() -> Unit raise {
  @vectors.prioritize_vector(())
}

///|
/// Multivariate/cvectors.ml:1165
fn step_198() -> Unit raise {
  @printer.parse_as_infix("ccross", (20L, "right"))
}

///|
/// ccross
fn step_199() -> Unit raise {
  ccross_c.set(@pair.new_definition(@term_syntax.parse_term("(ccross : (Cart[Cart[Real, 2], 3], Cart[Cart[Real, 2], 3]) -> Cart[Cart[Real, 2], 3])((x : Cart[Cart[Real, 2], 3]), (y : Cart[Cart[Real, 2], 3])) == vector([op_dollar(x, 2) * op_dollar(y, 3) - op_dollar(x, 3) * op_dollar(y, 2), op_dollar(x, 3) * op_dollar(y, 1) - op_dollar(x, 1) * op_dollar(y, 3), op_dollar(x, 1) * op_dollar(y, 2) - op_dollar(x, 2) * op_dollar(y, 1)])")))
}

///|
let ccross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ccross")

///|
/// `ccross`
pub fn ccross() -> @kernel.Thm {
  ccross_c.get()
}

///|
/// CCROSS_COMPONENT
fn step_200() -> Unit raise {
  let t446 = @simp.rewrite_tac(@list.List([ccross(), @vectors.vector_3()]))
  ccross_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], op_dollar(ccross(x, y), 1) == op_dollar(x, 2) * op_dollar(y, 3) - op_dollar(x, 3) * op_dollar(y, 2) && op_dollar(ccross(x, y), 2) == op_dollar(x, 3) * op_dollar(y, 1) - op_dollar(x, 1) * op_dollar(y, 3) && op_dollar(ccross(x, y), 3) == op_dollar(x, 1) * op_dollar(y, 2) - op_dollar(x, 2) * op_dollar(y, 1)"), t446))
}

///|
let ccross_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_COMPONENT")

///|
/// `CCROSS_COMPONENT`
pub fn ccross_component() -> @kernel.Thm {
  ccross_component_c.get()
}

///|
/// CART_EQ3
fn step_201() -> Unit raise {
  let t451 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3()]))
  let t452 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x448 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s449 = ((x447 : (@kernel.Term) -> @kernel.Thm raise) => @equal.path_conv("rbrblr", x447))(x448)
    fn(x450 : @kernel.Term) -> @kernel.Thm raise {
      s449(x450)
    }
  }, @list.List([@cart.cart_eq()])), t451)
  cart_eq3_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], (x == y) == (op_dollar(x, 1) == op_dollar(y, 1) && op_dollar(x, 2) == op_dollar(y, 2) && op_dollar(x, 3) == op_dollar(y, 3))"), t452))
}

///|
let cart_eq3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CART_EQ3")

///|
/// `CART_EQ3`
pub fn cart_eq3() -> @kernel.Thm {
  cart_eq3_c.get()
}

///|
/// `CCROSS_TAC`
pub fn ccross_tac(x453 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let lemmas = x453
  @tactics.then_tac(@simp.rewrite_tac((lemmas.prepend(ccross_component())).prepend(cart_eq3())), @complexes.simple_complex_arith_tac)
}

///|
/// CCROSS_LZERO
fn step_202() -> Unit raise {
  let t455 = ccross_tac(@list.List([cvector_zero_component()]))
  ccross_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ccross(cvector_zero, x) == cvector_zero"), t455))
}

///|
let ccross_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_LZERO")

///|
/// `CCROSS_LZERO`
pub fn ccross_lzero() -> @kernel.Thm {
  ccross_lzero_c.get()
}

///|
/// CCROSS_RZERO
fn step_203() -> Unit raise {
  let t456 = ccross_tac(@list.List([cvector_zero_component()]))
  ccross_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ccross(x, cvector_zero) == cvector_zero"), t456))
}

///|
let ccross_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_RZERO")

///|
/// `CCROSS_RZERO`
pub fn ccross_rzero() -> @kernel.Thm {
  ccross_rzero_c.get()
}

///|
/// CCROSS_SKEW
fn step_204() -> Unit raise {
  let t457 = ccross_tac(@list.List([cvector_neg_component()]))
  ccross_skew_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ccross(x, y) == -ccross(y, x)"), t457))
}

///|
let ccross_skew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_SKEW")

///|
/// `CCROSS_SKEW`
pub fn ccross_skew() -> @kernel.Thm {
  ccross_skew_c.get()
}

///|
/// CCROSS_REFL
fn step_205() -> Unit raise {
  let t458 = ccross_tac(@list.List([cvector_zero_component()]))
  ccross_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ccross(x, x) == cvector_zero"), t458))
}

///|
let ccross_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_REFL")

///|
/// `CCROSS_REFL`
pub fn ccross_refl() -> @kernel.Thm {
  ccross_refl_c.get()
}

///|
/// CCROSS_LADD
fn step_206() -> Unit raise {
  let t459 = ccross_tac(@list.List([cvector_add_component()]))
  ccross_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ∀ z : Cart[Cart[Real, 2], 3], ccross(x + y, z) == ccross(x, z) + ccross(y, z)"), t459))
}

///|
let ccross_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_LADD")

///|
/// `CCROSS_LADD`
pub fn ccross_ladd() -> @kernel.Thm {
  ccross_ladd_c.get()
}

///|
/// CCROSS_RADD
fn step_207() -> Unit raise {
  let t460 = ccross_tac(@list.List([cvector_add_component()]))
  ccross_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ∀ z : Cart[Cart[Real, 2], 3], ccross(x, y + z) == ccross(x, y) + ccross(x, z)"), t460))
}

///|
let ccross_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_RADD")

///|
/// `CCROSS_RADD`
pub fn ccross_radd() -> @kernel.Thm {
  ccross_radd_c.get()
}

///|
/// CCROSS_LMUL
fn step_208() -> Unit raise {
  let t461 = ccross_tac(@list.List([cvector_mul_component()]))
  ccross_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ccross(cvector_mul(c, x), y) == cvector_mul(c, ccross(x, y))"), t461))
}

///|
let ccross_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_LMUL")

///|
/// `CCROSS_LMUL`
pub fn ccross_lmul() -> @kernel.Thm {
  ccross_lmul_c.get()
}

///|
/// CCROSS_RMUL
fn step_209() -> Unit raise {
  let t462 = ccross_tac(@list.List([cvector_mul_component()]))
  ccross_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ccross(x, cvector_mul(c, y)) == cvector_mul(c, ccross(x, y))"), t462))
}

///|
let ccross_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_RMUL")

///|
/// `CCROSS_RMUL`
pub fn ccross_rmul() -> @kernel.Thm {
  ccross_rmul_c.get()
}

///|
/// CCROSS_LNEG
fn step_210() -> Unit raise {
  let t463 = ccross_tac(@list.List([cvector_neg_component()]))
  ccross_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ccross(-x, y) == -ccross(x, y)"), t463))
}

///|
let ccross_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_LNEG")

///|
/// `CCROSS_LNEG`
pub fn ccross_lneg() -> @kernel.Thm {
  ccross_lneg_c.get()
}

///|
/// CCROSS_RNEG
fn step_211() -> Unit raise {
  let t464 = ccross_tac(@list.List([cvector_neg_component()]))
  ccross_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ccross(x, -y) == -ccross(x, y)"), t464))
}

///|
let ccross_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_RNEG")

///|
/// `CCROSS_RNEG`
pub fn ccross_rneg() -> @kernel.Thm {
  ccross_rneg_c.get()
}

///|
/// CCROSS_JACOBI
fn step_212() -> Unit raise {
  let t465 = @simp.rewrite_tac(@list.List([cvector_add_component(), ccross_component(), cvector_zero_component()]))
  let t466 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cart_eq3()])), t465), @complexes.simple_complex_arith_tac)
  ccross_jacobi_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], ∀ z : Cart[Cart[Real, 2], 3], ccross(x, ccross(y, z)) + (ccross(y, ccross(z, x)) + ccross(z, ccross(x, y))) == cvector_zero"), t466))
}

///|
let ccross_jacobi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_JACOBI")

///|
/// `CCROSS_JACOBI`
pub fn ccross_jacobi() -> @kernel.Thm {
  ccross_jacobi_c.get()
}

///|
/// Multivariate/cvectors.ml:1247
fn step_213() -> Unit raise {
  @complexes.prioritize_complex(())
}

///|
/// Multivariate/cvectors.ml:1249
fn step_214() -> Unit raise {
  @printer.parse_as_infix("cdot", (20L, "right"))
}

///|
/// cdot
fn step_215() -> Unit raise {
  cdot_c.set(@pair.new_definition(@term_syntax.parse_term("(cdot : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Cart[Real, 2])((x : Cart[Cart[Real, 2], N]), (y : Cart[Cart[Real, 2], N])) == (vsum : ((Num) -> Bool, (Num) -> Cart[Real, 2]) -> Cart[Real, 2])(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (i : Num) => (op_dollar : (Cart[Cart[Real, 2], N], Num) -> Cart[Real, 2])(x, i) * cnj((op_dollar : (Cart[Cart[Real, 2], N], Num) -> Cart[Real, 2])(y, i)))")))
}

///|
let cdot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cdot")

///|
/// `cdot`
pub fn cdot() -> @kernel.Thm {
  cdot_c.get()
}

///|
/// CDOT_SYM
fn step_216() -> Unit raise {
  let t470 = @simp.rewrite_tac(@list.List([@complexes.cnj_mul(), @complexes.cnj_cnj(), @complexes.complex_mul_sym()]))
  let t467 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t468 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t467)
  let t469 = @simp.rewrite_tac(@list.List([@drule.match_mp(@bool.spec_all(@complexes.cnj_vsum()))(t468)]))
  let t471 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t469), t470)
  cdot_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cdot(x, y) == cnj(cdot(y, x))"), t471))
}

///|
let cdot_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_SYM")

///|
/// `CDOT_SYM`
pub fn cdot_sym() -> @kernel.Thm {
  cdot_sym_c.get()
}

///|
/// REAL_CDOT_SELF
fn step_217() -> Unit raise {
  let t472 = @simp.rewrite_tac(@list.List([@complexes.real_cnj(), @equal.gsym(cdot_sym())]))
  real_cdot_self_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], real(cdot(x, x))"), t472))
}

///|
let real_cdot_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CDOT_SELF")

///|
/// `REAL_CDOT_SELF`
pub fn real_cdot_self() -> @kernel.Thm {
  real_cdot_self_c.get()
}

///|
/// CDOT_LADD
fn step_218() -> Unit raise {
  let t483 = @simp.rewrite_tac(@list.List([cvector_add_component()]))
  let t481 = @equal.gsym(@complexes.complex_add_rdistrib())
  let t479 = @term_syntax.parse_term("cnj(op_dollar((z : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t480 = @term_syntax.parse_term("op_dollar((y : Cart[Cart[Real, 2], N]), (x' : Num))")
  let t482 = @simp.rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], N]), (x' : Num))"), t480, t479]), t481)]))
  let t478 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t477 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t476 = @tactics.repeat_tac(@tactics.gen_tac)
  let t473 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t474 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t473)
  let t475 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@vectors.vsum_add()))(t474)]))
  let t484 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t475), t476), t477), @tactics.gen_tac), @tactics.disch_tac), t478), t482), t483)
  cdot_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], cdot(x + y, z) == cdot(x, z) + cdot(y, z)"), t484))
}

///|
let cdot_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LADD")

///|
/// `CDOT_LADD`
pub fn cdot_ladd() -> @kernel.Thm {
  cdot_ladd_c.get()
}

///|
/// CDOT_RADD
fn step_219() -> Unit raise {
  let t495 = @simp.rewrite_tac(@list.List([@complexes.cnj_add(), cvector_add_component()]))
  let t493 = @equal.gsym(@complexes.complex_add_ldistrib())
  let t491 = @term_syntax.parse_term("cnj(op_dollar((z : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t492 = @term_syntax.parse_term("cnj(op_dollar((y : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t494 = @simp.rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], N]), (x' : Num))"), t492, t491]), t493)]))
  let t490 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t489 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t488 = @tactics.repeat_tac(@tactics.gen_tac)
  let t485 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t486 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t485)
  let t487 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@vectors.vsum_add()))(t486)]))
  let t496 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t487), t488), t489), @tactics.gen_tac), @tactics.disch_tac), t490), t494), t495)
  cdot_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], cdot(x, y + z) == cdot(x, y) + cdot(x, z)"), t496))
}

///|
let cdot_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RADD")

///|
/// `CDOT_RADD`
pub fn cdot_radd() -> @kernel.Thm {
  cdot_radd_c.get()
}

///|
/// CDOT_LSUB
fn step_220() -> Unit raise {
  let t507 = @simp.rewrite_tac(@list.List([cvector_sub_component()]))
  let t505 = @equal.gsym(@complexes.complex_sub_rdistrib())
  let t503 = @term_syntax.parse_term("cnj(op_dollar((z : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t504 = @term_syntax.parse_term("op_dollar((y : Cart[Cart[Real, 2], N]), (x' : Num))")
  let t506 = @simp.rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], N]), (x' : Num))"), t504, t503]), t505)]))
  let t502 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t501 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t500 = @tactics.repeat_tac(@tactics.gen_tac)
  let t497 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t498 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t497)
  let t499 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@vectors.vsum_sub()))(t498)]))
  let t508 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t499), t500), t501), @tactics.gen_tac), @tactics.disch_tac), t502), t506), t507)
  cdot_lsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], cdot(x - y, z) == cdot(x, z) - cdot(y, z)"), t508))
}

///|
let cdot_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LSUB")

///|
/// `CDOT_LSUB`
pub fn cdot_lsub() -> @kernel.Thm {
  cdot_lsub_c.get()
}

///|
/// CDOT_RSUB
fn step_221() -> Unit raise {
  let t519 = @simp.rewrite_tac(@list.List([@complexes.cnj_sub(), cvector_sub_component()]))
  let t517 = @equal.gsym(@complexes.complex_sub_ldistrib())
  let t515 = @term_syntax.parse_term("cnj(op_dollar((z : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t516 = @term_syntax.parse_term("cnj(op_dollar((y : Cart[Cart[Real, 2], N]), (x' : Num)))")
  let t518 = @simp.rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], N]), (x' : Num))"), t516, t515]), t517)]))
  let t514 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t513 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t512 = @tactics.repeat_tac(@tactics.gen_tac)
  let t509 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t510 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t509)
  let t511 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@vectors.vsum_sub()))(t510)]))
  let t520 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t511), t512), t513), @tactics.gen_tac), @tactics.disch_tac), t514), t518), t519)
  cdot_rsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], ∀ z : Cart[Cart[Real, 2], N], cdot(x, y - z) == cdot(x, y) - cdot(x, z)"), t520))
}

///|
let cdot_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RSUB")

///|
/// `CDOT_RSUB`
pub fn cdot_rsub() -> @kernel.Thm {
  cdot_rsub_c.get()
}

///|
/// CDOT_LMUL
fn step_222() -> Unit raise {
  let t524 = @simp.rewrite_tac(@list.List([cvector_mul_component(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t521 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t522 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t521)
  let t523 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@complexes.vsum_complex_lmul()))(t522)]))
  let t525 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t523), t524)
  cdot_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cdot(cvector_mul(c, x), y) == c * cdot(x, y)"), t525))
}

///|
let cdot_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LMUL")

///|
/// `CDOT_LMUL`
pub fn cdot_lmul() -> @kernel.Thm {
  cdot_lmul_c.get()
}

///|
/// CDOT_RMUL
fn step_223() -> Unit raise {
  let t529 = @simp.rewrite_tac(@list.List([cvector_mul_component(), @complexes.cnj_mul(), @complexes.complex_mul_ac()]))
  let t526 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t527 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t526)
  let t528 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@complexes.vsum_complex_lmul()))(t527)]))
  let t530 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t528), t529)
  cdot_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ x : Cart[Cart[Real, 2], _], ∀ y : Cart[Cart[Real, 2], _], cdot(x, cvector_mul(c, y)) == cnj(c) * cdot(x, y)"), t530))
}

///|
let cdot_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RMUL")

///|
/// `CDOT_RMUL`
pub fn cdot_rmul() -> @kernel.Thm {
  cdot_rmul_c.get()
}

///|
/// CDOT_LNEG
fn step_224() -> Unit raise {
  let t537 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_lmul()]))
  let t536 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_neg_minus1())]))
  let t535 = @simp.rewrite_tac(@list.List([cvector_neg_component()]))
  let t532 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t533 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t532)
  let t534 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@complexes.vsum_complex_lmul()))(t533)]))
  let t531 = @simp.once_rewrite_tac(@list.List([@complexes.complex_neg_minus1()]))
  let t538 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t531), t534), t535), t536), t537)
  cdot_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cdot(-x, y) == -cdot(x, y)"), t538))
}

///|
let cdot_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LNEG")

///|
/// `CDOT_LNEG`
pub fn cdot_lneg() -> @kernel.Thm {
  cdot_lneg_c.get()
}

///|
/// CDOT_RNEG
fn step_225() -> Unit raise {
  let t544 = @simp.rewrite_tac(@list.List([cvector_neg_component(), @complexes.cnj_neg(), @complexes.complex_neg_rmul()]))
  let t543 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_neg_minus1())]))
  let t540 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t541 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t540)
  let t542 = @simp.rewrite_tac(@list.List([@drule.match_mp(@equal.gsym(@complexes.vsum_complex_lmul()))(t541)]))
  let t539 = @simp.once_rewrite_tac(@list.List([@complexes.complex_neg_minus1()]))
  let t545 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t539), t542), t543), t544)
  cdot_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cdot(x, -y) == -cdot(x, y)"), t545))
}

///|
let cdot_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RNEG")

///|
/// `CDOT_RNEG`
pub fn cdot_rneg() -> @kernel.Thm {
  cdot_rneg_c.get()
}

///|
/// CDOT_LZERO
fn step_226() -> Unit raise {
  let t547 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @equal.gsym(@complexes.complex_vec_0()), @vectors.vsum_0()]))
  let t546 = @simp.rewrite_tac(@list.List([cvector_zero_component()]))
  let t548 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t546), t547)
  cdot_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cdot(cvector_zero, x) == Cx(real_of_num(0))"), t548))
}

///|
let cdot_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LZERO")

///|
/// `CDOT_LZERO`
pub fn cdot_lzero() -> @kernel.Thm {
  cdot_lzero_c.get()
}

///|
/// CNJ_ZERO
fn step_227() -> Unit raise {
  let t549 = @simp.rewrite_tac(@list.List([@complexes.cnj(), @complexes.re_cx(), @complexes.im_cx(), @complexes.cx_def(), @calc_int.real_neg_0()]))
  cnj_zero_c.set(@tactics.prove(@term_syntax.parse_term("cnj(Cx(real_of_num(0))) == Cx(real_of_num(0))"), t549))
}

///|
let cnj_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_ZERO")

///|
/// `CNJ_ZERO`
pub fn cnj_zero() -> @kernel.Thm {
  cnj_zero_c.get()
}

///|
/// CDOT_RZERO
fn step_228() -> Unit raise {
  let t552 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @equal.gsym(@complexes.complex_vec_0()), @vectors.vsum_0()]))
  let t551 = @simp.rewrite_tac(@list.List([cnj_zero()]))
  let t550 = @simp.rewrite_tac(@list.List([cvector_zero_component()]))
  let t553 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t550), t551), t552)
  cdot_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cdot(x, cvector_zero) == Cx(real_of_num(0))"), t553))
}

///|
let cdot_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RZERO")

///|
/// `CDOT_RZERO`
pub fn cdot_rzero() -> @kernel.Thm {
  cdot_rzero_c.get()
}

///|
/// CDOT3
fn step_229() -> Unit raise {
  let t555 = @simp.rewrite_tac(@list.List([@vectors.vsum_3()]))
  let t554 = @simp.simp_tac(@list.List([@cart.dimindex_3()]))
  let t556 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot()])), t554), t555)
  cdot3_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], cdot(x, y) == op_dollar(x, 1) * cnj(op_dollar(y, 1)) + (op_dollar(x, 2) * cnj(op_dollar(y, 2)) + op_dollar(x, 3) * cnj(op_dollar(y, 3)))"), t556))
}

///|
let cdot3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT3")

///|
/// `CDOT3`
pub fn cdot3() -> @kernel.Thm {
  cdot3_c.get()
}

///|
/// ADD_CDOT_SYM
fn step_230() -> Unit raise {
  let t557 = @meson.meson_tac(@list.List([cdot_sym(), @complexes.complex_add_cnj()]))
  add_cdot_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cdot(x, y) + cdot(y, x) == Cx(real_of_num(2) * Re(cdot(x, y)))"), t557))
}

///|
let add_cdot_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_CDOT_SYM")

///|
/// `ADD_CDOT_SYM`
pub fn add_cdot_sym() -> @kernel.Thm {
  add_cdot_sym_c.get()
}

///|
/// CCROSS_LREAL
fn step_231() -> Unit raise {
  let t559 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t558 = @tactics.repeat_tac(@tactics.strip_tac)
  let t560 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cart_eq3(), cvector_add_component(), cvector_mul_component(), vector_to_cvector_component(), ccross_component(), @cross.cross_components(), cvector_re_component(), cvector_im_component(), @complexes.complex_mul(), @complexes.re_cx(), @complexes.im_cx(), @complexes.cx_def(), @complexes.complex_sub(), @complexes.complex_neg(), @complexes.complex_add(), @complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii()])), t558), @tactics.ap_term_tac), t559), @int.arith_tac)
  ccross_lreal_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, 3], ∀ c : Cart[Cart[Real, 2], 3], ccross(vector_to_cvector(r), c) == vector_to_cvector(cross(r, cvector_re(c))) + cvector_mul(ii, vector_to_cvector(cross(r, cvector_im(c))))"), t560))
}

///|
let ccross_lreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_LREAL")

///|
/// `CCROSS_LREAL`
pub fn ccross_lreal() -> @kernel.Thm {
  ccross_lreal_c.get()
}

///|
/// CCROSS_RREAL
fn step_232() -> Unit raise {
  let t562 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t561 = @tactics.repeat_tac(@tactics.strip_tac)
  let t563 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cart_eq3(), cvector_add_component(), cvector_mul_component(), vector_to_cvector_component(), ccross_component(), @cross.cross_components(), cvector_re_component(), cvector_im_component(), @complexes.complex_mul(), @complexes.re_cx(), @complexes.im_cx(), @complexes.cx_def(), @complexes.complex_sub(), @complexes.complex_neg(), @complexes.complex_add(), @complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii()])), t561), @tactics.ap_term_tac), t562), @int.arith_tac)
  ccross_rreal_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, 3], ∀ c : Cart[Cart[Real, 2], 3], ccross(c, vector_to_cvector(r)) == vector_to_cvector(cross(cvector_re(c), r)) + cvector_mul(ii, vector_to_cvector(cross(cvector_im(c), r)))"), t563))
}

///|
let ccross_rreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_RREAL")

///|
/// `CCROSS_RREAL`
pub fn ccross_rreal() -> @kernel.Thm {
  ccross_rreal_c.get()
}

///|
/// CDOT_LREAL
fn step_233() -> Unit raise {
  let t585 = @equal.gsym(@calc_int.real_mul_rneg())
  let t586 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_neg_minus1()), t585]))
  let t584 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t583 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul())]))
  let t582 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t581 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac()]))
  let t580 = @simp.rewrite_tac(@list.List([@complexes.complex_poly_neg_clauses()]))
  let t579 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @complexes.re_cnj(), @complexes.im_mul_cx(), @complexes.im_cnj()]))
  let t576 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t577 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t576)
  let t578 = @simp.rewrite_tac(@list.List([@drule.match_mp(@complexes.im_vsum())(t577)]))
  let t573 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t574 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t573)
  let t575 = @simp.rewrite_tac(@list.List([@drule.match_mp(@complexes.re_vsum())(t574)]))
  let t572 = @simp.gen_rewrite_tac(fn(x571 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x565 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s566 = @equal.rator_conv(x565)
      fn(x567 : @kernel.Term) -> @kernel.Thm raise {
        s566(x567)
      }
    })((fn(x568 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s569 = @equal.once_depth_conv(x568)
      fn(x570 : @kernel.Term) -> @kernel.Thm raise {
        s569(x570)
      }
    })(x571))
  }, @list.List([@complexes.complex_expand()]))
  let t564 = @tactics.repeat_tac(@tactics.gen_tac)
  let t587 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot(), @vectors.dot(), vector_to_cvector_component(), cvector_re_component(), cvector_im_component()])), t564), t572), t575), t578), t579), t580), t581), t582), t583), t584), t586)
  cdot_lreal_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, _], ∀ c : Cart[Cart[Real, 2], _], cdot(vector_to_cvector(r), c) == Cx(dot(r, cvector_re(c))) - ii * Cx(dot(r, cvector_im(c)))"), t587))
}

///|
let cdot_lreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_LREAL")

///|
/// `CDOT_LREAL`
pub fn cdot_lreal() -> @kernel.Thm {
  cdot_lreal_c.get()
}

///|
/// CDOT_RREAL
fn step_234() -> Unit raise {
  let t604 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @complexes.re_cnj(), @complexes.im_mul_cx(), @complexes.im_cnj()]))
  let t603 = @simp.rewrite_tac(@list.List([@complexes.cnj_cx()]))
  let t600 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t601 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t600)
  let t602 = @simp.rewrite_tac(@list.List([@drule.match_mp(@complexes.im_vsum())(t601)]))
  let t597 = @bool.gen_all(@bool.conjunct1(@bool.spec_all(@simp.rewrite_rule(@list.List([@sets.has_size()]))(@iterate.has_size_numseg_1()))))
  let t598 = @bool.spec(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), t597)
  let t599 = @simp.rewrite_tac(@list.List([@drule.match_mp(@complexes.re_vsum())(t598)]))
  let t596 = @simp.gen_rewrite_tac(fn(x595 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x589 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s590 = @equal.rator_conv(x589)
      fn(x591 : @kernel.Term) -> @kernel.Thm raise {
        s590(x591)
      }
    })((fn(x592 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s593 = @equal.once_depth_conv(x592)
      fn(x594 : @kernel.Term) -> @kernel.Thm raise {
        s593(x594)
      }
    })(x595))
  }, @list.List([@complexes.complex_expand()]))
  let t588 = @tactics.repeat_tac(@tactics.gen_tac)
  let t605 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cdot(), @vectors.dot(), vector_to_cvector_component(), cvector_re_component(), cvector_im_component()])), t588), t596), t599), t602), t603), t604)
  cdot_rreal_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, _], ∀ c : Cart[Cart[Real, 2], _], cdot(c, vector_to_cvector(r)) == Cx(dot(cvector_re(c), r)) + ii * Cx(dot(cvector_im(c), r))"), t605))
}

///|
let cdot_rreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_RREAL")

///|
/// `CDOT_RREAL`
pub fn cdot_rreal() -> @kernel.Thm {
  cdot_rreal_c.get()
}

///|
/// cnorm2
fn step_235() -> Unit raise {
  cnorm2_c.set(@pair.new_definition(@term_syntax.parse_term("(cnorm2 : (Cart[Cart[Real, 2], N]) -> Real)((v : Cart[Cart[Real, 2], N])) == real_of_complex(cdot(v, v))")))
}

///|
let cnorm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cnorm2")

///|
/// `cnorm2`
pub fn cnorm2() -> @kernel.Thm {
  cnorm2_c.get()
}

///|
/// CX_CNORM2
fn step_236() -> Unit raise {
  let t606 = @simp.simp_tac(@list.List([cnorm2(), real_cdot_self(), real_of_complex_v1()]))
  cx_cnorm2_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Cart[Real, 2], N], Cx(cnorm2(v)) == cdot(v, v)"), t606))
}

///|
let cx_cnorm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_CNORM2")

///|
/// `CX_CNORM2`
pub fn cx_cnorm2() -> @kernel.Thm {
  cx_cnorm2_c.get()
}

///|
/// CNORM2_CVECTOR_ZERO
fn step_237() -> Unit raise {
  let t607 = @simp.rewrite_tac(@list.List([cnorm2(), cdot_rzero(), real_of_complex_cx()]))
  cnorm2_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(cnorm2 : (Cart[Cart[Real, 2], N]) -> Real)((cvector_zero : Cart[Cart[Real, 2], N])) == real_of_num(0)"), t607))
}

///|
let cnorm2_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_CVECTOR_ZERO")

///|
/// `CNORM2_CVECTOR_ZERO`
pub fn cnorm2_cvector_zero() -> @kernel.Thm {
  cnorm2_cvector_zero_c.get()
}

///|
/// CNORM2_MODULUS
fn step_238() -> Unit raise {
  let t608 = @simp.rewrite_tac(@list.List([cnorm2(), cdot(), @complexes.complex_mul_cnj(), @complexes.complex_pow_2(), @equal.gsym(@complexes.cx_mul()), @complexes.vsum_cx_numseg(), @vectors.dot(), vector_map_component(), real_of_complex_cx()]))
  cnorm2_modulus_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cnorm2(x) == dot(vector_map(norm, x), vector_map(norm, x))"), t608))
}

///|
let cnorm2_modulus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_MODULUS")

///|
/// `CNORM2_MODULUS`
pub fn cnorm2_modulus() -> @kernel.Thm {
  cnorm2_modulus_c.get()
}

///|
/// CNORM2_EQ_0
fn step_239() -> Unit raise {
  let t626 = @simp.rewrite_tac(@list.List([cvector_zero_component()]))
  let t625 = @simp.gen_rewrite_tac(fn(x624 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x618 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s619 = @equal.rand_conv(x618)
      fn(x620 : @kernel.Term) -> @kernel.Thm raise {
        s619(x620)
      }
    })((fn(x621 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s622 = @equal.depth_conv(x621)
      fn(x623 : @kernel.Term) -> @kernel.Thm raise {
        s622(x623)
      }
    })(x624))
  }, @list.List([@cart.cart_eq()]))
  let t617 = @simp.rewrite_tac(@list.List([@vectors.vec_component(), vector_map_component(), @complexes.complex_norm_zero()]))
  let t616 = @simp.gen_rewrite_tac(fn(x615 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x609 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s610 = @equal.rator_conv(x609)
      fn(x611 : @kernel.Term) -> @kernel.Thm raise {
        s610(x611)
      }
    })((fn(x612 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s613 = @equal.depth_conv(x612)
      fn(x614 : @kernel.Term) -> @kernel.Thm raise {
        s613(x614)
      }
    })(x615))
  }, @list.List([@cart.cart_eq()]))
  let t627 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cnorm2_modulus(), @complexes.cx_inj(), @vectors.dot_eq_0()])), @tactics.gen_tac), t616), t617), t625), t626)
  cnorm2_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], (cnorm2(x) == real_of_num(0)) == (x == cvector_zero)"), t627))
}

///|
let cnorm2_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_EQ_0")

///|
/// `CNORM2_EQ_0`
pub fn cnorm2_eq_0() -> @kernel.Thm {
  cnorm2_eq_0_c.get()
}

///|
/// CDOT_EQ_0
fn step_240() -> Unit raise {
  let t634 = @simp.rewrite_tac(@list.List([@equal.gsym(cnorm2()), cnorm2_eq_0()]))
  let t631 = @drule.match_mp(@meson.meson(@list.List([real_of_complex_cx()]), @term_syntax.parse_term("(x : Cart[Real, 2]) == Cx((y : Real)) → real_of_complex(x) == y")))
  let t633 = @tactics.disch_then(fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s629 = @tactics.mp_tac(x628)
      fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s629(x630)
      }
    })(t631(x632))
  })
  let t635 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p → q) && (q → p))")), cdot_lzero()])), @tactics.gen_tac), t633), t634)
  cdot_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], (cdot(x, x) == Cx(real_of_num(0))) == (x == cvector_zero)"), t635))
}

///|
let cdot_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_EQ_0")

///|
/// `CDOT_EQ_0`
pub fn cdot_eq_0() -> @kernel.Thm {
  cdot_eq_0_c.get()
}

///|
/// CNORM2_POS
fn step_241() -> Unit raise {
  let t636 = @simp.rewrite_tac(@list.List([cnorm2_modulus(), @vectors.dot_pos_le()]))
  cnorm2_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], real_of_num(0) <= cnorm2(x)"), t636))
}

///|
let cnorm2_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_POS")

///|
/// `CNORM2_POS`
pub fn cnorm2_pos() -> @kernel.Thm {
  cnorm2_pos_c.get()
}

///|
/// CDOT_SELF_POS
fn step_242() -> Unit raise {
  let t637 = @simp.rewrite_tac(@list.List([@equal.gsym(cnorm2()), cnorm2_pos()]))
  cdot_self_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], real_of_num(0) <= real_of_complex(cdot(x, x))"), t637))
}

///|
let cdot_self_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_SELF_POS")

///|
/// `CDOT_SELF_POS`
pub fn cdot_self_pos() -> @kernel.Thm {
  cdot_self_pos_c.get()
}

///|
/// CNORM2_MUL
fn step_243() -> Unit raise {
  let t638 = @equal.gsym(@complexes.cx_pow())
  let t639 = @simp.simp_tac(@list.List([cnorm2(), cdot_lmul(), cdot_rmul(), @complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) * (cnj(x) * (y : Cart[Real, 2])) == x * cnj(x) * y")), @complexes.complex_mul_cnj(), real_of_complex_cx(), real_of_complex_mul(), @complexes.real_cx(), real_cdot_self(), t638]))
  cnorm2_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], cnorm2(cvector_mul(a, x)) == pow(norm(a), 2) * cnorm2(x)"), t639))
}

///|
let cnorm2_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_MUL")

///|
/// `CNORM2_MUL`
pub fn cnorm2_mul() -> @kernel.Thm {
  cnorm2_mul_c.get()
}

///|
/// CNORM2_NORM2_2
fn step_244() -> Unit raise {
  let t646 = @equal.gsym(@realarith.real_pow_2())
  let t647 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_add()), real_of_complex_cx(), t646, @vectors.dot_pos_le(), @real.sqrt_pow_2()]))
  let t642 = @equal.gsym(@vectors.dot())
  let t643 = @equal.gsym(@vectors.dot())
  let t644 = @equal.gsym(@complexes.cx_pow())
  let t645 = @simp.simp_tac(@list.List([@meson.meson(@list.List([@iterate.card_numseg_1(), @iterate.has_size_numseg_1(), @sets.finite_has_size()]), @term_syntax.parse_term("FINITE(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))")), @vectors.vsum_add(), t644, @complexes.vsum_cx(), t643, @realarith.real_pow_2(), t642]))
  let t640 = @complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) - -Cx(real_of_num(1)) * (y : Cart[Real, 2]) == x + y"))
  let t641 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_2()), @complexes.complex_pow_ii_2(), t640]))
  let t648 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cnorm2(), @vectors.vector_norm(), cdot(), cvector_add_component(), cvector_mul_component(), vector_to_cvector_component(), @complexes.cnj_add(), @complexes.cnj_cx(), @complexes.cnj_mul(), @complexes.cnj_ii(), @complexes.complex_add_rdistrib(), @complexes.complex_add_ldistrib(), @complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) * x + x * (-ii * (y : Cart[Real, 2])) + (ii * y * x + ii * y * (-ii * y)) == x * x - ii * ii * (y * y)"))])), t641), t645), t647)
  cnorm2_norm2_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], cnorm2(vector_to_cvector(x) + cvector_mul(ii, vector_to_cvector(y))) == pow(norm(x), 2) + pow(norm(y), 2)"), t648))
}

///|
let cnorm2_norm2_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_NORM2_2")

///|
/// `CNORM2_NORM2_2`
pub fn cnorm2_norm2_2() -> @kernel.Thm {
  cnorm2_norm2_2_c.get()
}

///|
/// CNORM2_NORM2
fn step_245() -> Unit raise {
  let t656 = @simp.rewrite_tac(@list.List([cnorm2_norm2_2()]))
  let t657 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x655 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x649 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s650 = @equal.rator_conv(x649)
      fn(x651 : @kernel.Term) -> @kernel.Thm raise {
        s650(x651)
      }
    })((fn(x652 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s653 = @equal.once_depth_conv(x652)
      fn(x654 : @kernel.Term) -> @kernel.Thm raise {
        s653(x654)
      }
    })(x655))
  }, @list.List([@equal.gsym(vector_to_cvector_cvector_re_im())]))), t656)
  cnorm2_norm2_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Cart[Real, 2], N], cnorm2(v) == pow(norm(cvector_re(v)), 2) + pow(norm(cvector_im(v)), 2)"), t657))
}

///|
let cnorm2_norm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_NORM2")

///|
/// `CNORM2_NORM2`
pub fn cnorm2_norm2() -> @kernel.Thm {
  cnorm2_norm2_c.get()
}

///|
/// CNORM2_ALT
fn step_246() -> Unit raise {
  let t658 = @simp.simp_tac(@list.List([cnorm2(), real_of_complex_norm(), real_cdot_self(), @theorems.eq_sym_eq(), @real.real_abs_refl(), @simp.rewrite_rule(@list.List([cnorm2()]))(cnorm2_pos())]))
  cnorm2_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cnorm2(x) == norm(cdot(x, x))"), t658))
}

///|
let cnorm2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_ALT")

///|
/// `CNORM2_ALT`
pub fn cnorm2_alt() -> @kernel.Thm {
  cnorm2_alt_c.get()
}

///|
/// CNORM2_SUB
fn step_247() -> Unit raise {
  let t659 = @tactics.repeat_tac(@tactics.gen_tac)
  let t660 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cnorm2(), cdot_lsub(), cdot_rsub()])), t659), @tactics.ap_term_tac), @complexes.simple_complex_arith_tac)
  cnorm2_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], cnorm2(x - y) == cnorm2(y - x)"), t660))
}

///|
let cnorm2_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_SUB")

///|
/// `CNORM2_SUB`
pub fn cnorm2_sub() -> @kernel.Thm {
  cnorm2_sub_c.get()
}

///|
/// CNORM2_VECTOR_TO_CVECTOR
fn step_248() -> Unit raise {
  let t661 = @simp.rewrite_tac(@list.List([cnorm2_alt(), cdot_rreal(), cvector_re_vector_to_cvector(), cvector_im_vector_to_cvector(), @vectors.dot_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_add_rid(), @vectors.dot_square_norm(), @complexes.cx_pow(), @complexes.complex_norm_pow(), @complexes.complex_norm_cx(), @real.real_pow2_abs()]))
  cnorm2_vector_to_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], cnorm2(vector_to_cvector(x)) == pow(norm(x), 2)"), t661))
}

///|
let cnorm2_vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM2_VECTOR_TO_CVECTOR")

///|
/// `CNORM2_VECTOR_TO_CVECTOR`
pub fn cnorm2_vector_to_cvector() -> @kernel.Thm {
  cnorm2_vector_to_cvector_c.get()
}

///|
/// cnorm
fn step_249() -> Unit raise {
  cnorm_c.set(@pair.new_definition(@term_syntax.parse_term("(cnorm : (Cart[Cart[Real, 2], N]) -> Real) == o(sqrt, cnorm2)")))
}

///|
let cnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cnorm")

///|
/// `cnorm`
pub fn cnorm() -> @kernel.Thm {
  cnorm_c.get()
}

///|
/// Multivariate/cvectors.ml:1533
fn step_250() -> Unit raise {
  @preterm.overload_interface("norm", @term_syntax.parse_term("(cnorm : (Cart[Cart[Real, 2], N]) -> Real)"))
}

///|
/// CNORM_CVECTOR_ZERO
fn step_251() -> Unit raise {
  let t662 = @simp.rewrite_tac(@list.List([cnorm(), cnorm2_cvector_zero(), @trivia.o_def(), @real.sqrt_0()]))
  cnorm_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(norm : (Cart[Cart[Real, 2], N]) -> Real)((cvector_zero : Cart[Cart[Real, 2], N])) == real_of_num(0)"), t662))
}

///|
let cnorm_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_CVECTOR_ZERO")

///|
/// `CNORM_CVECTOR_ZERO`
pub fn cnorm_cvector_zero() -> @kernel.Thm {
  cnorm_cvector_zero_c.get()
}

///|
/// CNORM_POW_2
fn step_252() -> Unit raise {
  let t663 = @simp.simp_tac(@list.List([cnorm(), @trivia.o_def(), @real.sqrt_pow_2(), cnorm2_pos()]))
  cnorm_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], pow(norm(x), 2) == cnorm2(x)"), t663))
}

///|
let cnorm_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_POW_2")

///|
/// `CNORM_POW_2`
pub fn cnorm_pow_2() -> @kernel.Thm {
  cnorm_pow_2_c.get()
}

///|
/// CNORM_NORM_2
fn step_253() -> Unit raise {
  let t664 = @simp.rewrite_tac(@list.List([cnorm(), @trivia.o_def(), cnorm2_norm2_2()]))
  cnorm_norm_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], norm(vector_to_cvector(x) + cvector_mul(ii, vector_to_cvector(y))) == sqrt(pow(norm(x), 2) + pow(norm(y), 2))"), t664))
}

///|
let cnorm_norm_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_NORM_2")

///|
/// `CNORM_NORM_2`
pub fn cnorm_norm_2() -> @kernel.Thm {
  cnorm_norm_2_c.get()
}

///|
/// CNORM_NORM
fn step_254() -> Unit raise {
  let t672 = @simp.rewrite_tac(@list.List([cnorm_norm_2()]))
  let t673 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x671 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x665 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s666 = @equal.rator_conv(x665)
      fn(x667 : @kernel.Term) -> @kernel.Thm raise {
        s666(x667)
      }
    })((fn(x668 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s669 = @equal.once_depth_conv(x668)
      fn(x670 : @kernel.Term) -> @kernel.Thm raise {
        s669(x670)
      }
    })(x671))
  }, @list.List([@equal.gsym(vector_to_cvector_cvector_re_im())]))), t672)
  cnorm_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Cart[Real, 2], N], norm(v) == sqrt(pow(norm(cvector_re(v)), 2) + pow(norm(cvector_im(v)), 2))"), t673))
}

///|
let cnorm_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_NORM")

///|
/// `CNORM_NORM`
pub fn cnorm_norm() -> @kernel.Thm {
  cnorm_norm_c.get()
}

///|
/// CNORM_MUL
fn step_255() -> Unit raise {
  let t674 = @simp.simp_tac(@list.List([cnorm(), @trivia.o_def(), cnorm2_mul(), @real.real_le_pow_2(), @real.sqrt_mul(), cnorm2_pos(), @vectors.norm_pos_le(), @real.pow_2_sqrt()]))
  cnorm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], norm(cvector_mul(a, x)) == norm(a) * norm(x)"), t674))
}

///|
let cnorm_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_MUL")

///|
/// `CNORM_MUL`
pub fn cnorm_mul() -> @kernel.Thm {
  cnorm_mul_c.get()
}

///|
/// CNORM_EQ_0
fn step_256() -> Unit raise {
  let t675 = @simp.simp_tac(@list.List([cnorm(), @trivia.o_def(), @real.sqrt_eq_0(), cnorm2_pos(), cnorm2_eq_0()]))
  cnorm_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], (norm(x) == real_of_num(0)) == (x == cvector_zero)"), t675))
}

///|
let cnorm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_EQ_0")

///|
/// `CNORM_EQ_0`
pub fn cnorm_eq_0() -> @kernel.Thm {
  cnorm_eq_0_c.get()
}

///|
/// CNORM_POS
fn step_257() -> Unit raise {
  let t676 = @simp.simp_tac(@list.List([cnorm(), @trivia.o_def(), @real.sqrt_pos_le(), cnorm2_pos()]))
  cnorm_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], real_of_num(0) <= norm(x)"), t676))
}

///|
let cnorm_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_POS")

///|
/// `CNORM_POS`
pub fn cnorm_pos() -> @kernel.Thm {
  cnorm_pos_c.get()
}

///|
/// CNORM_SUB
fn step_258() -> Unit raise {
  let t677 = @simp.rewrite_tac(@list.List([cnorm(), @trivia.o_def(), cnorm2_sub()]))
  cnorm_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], norm(x - y) == norm(y - x)"), t677))
}

///|
let cnorm_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_SUB")

///|
/// `CNORM_SUB`
pub fn cnorm_sub() -> @kernel.Thm {
  cnorm_sub_c.get()
}

///|
/// CNORM_VECTOR_TO_CVECTOR
fn step_259() -> Unit raise {
  let t678 = @simp.simp_tac(@list.List([cnorm(), @trivia.o_def(), cnorm2_vector_to_cvector(), @real.pow_2_sqrt(), @vectors.norm_pos_le()]))
  cnorm_vector_to_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], norm(vector_to_cvector(x)) == norm(x)"), t678))
}

///|
let cnorm_vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_VECTOR_TO_CVECTOR")

///|
/// `CNORM_VECTOR_TO_CVECTOR`
pub fn cnorm_vector_to_cvector() -> @kernel.Thm {
  cnorm_vector_to_cvector_c.get()
}

///|
/// CNORM_BASIS
fn step_260() -> Unit raise {
  let t679 = @simp.simp_tac(@list.List([@vectors.norm_basis(), cnorm_vector_to_cvector()]))
  cnorm_basis_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (norm : (Cart[Cart[Real, 2], N]) -> Real)((vector_to_cvector : (Cart[Real, N]) -> Cart[Cart[Real, 2], N])((basis : (Num) -> Cart[Real, N])(k))) == real_of_num(1)"), t679))
}

///|
let cnorm_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_BASIS")

///|
/// `CNORM_BASIS`
pub fn cnorm_basis() -> @kernel.Thm {
  cnorm_basis_c.get()
}

///|
/// CNORM_BASIS_1
fn step_261() -> Unit raise {
  let t680 = @simp.simp_tac(@list.List([@vectors.norm_basis_1(), cnorm_vector_to_cvector()]))
  cnorm_basis_1_c.set(@tactics.prove(@term_syntax.parse_term("(norm : (Cart[Real, N]) -> Real)((basis : (Num) -> Cart[Real, N])(1)) == real_of_num(1)"), t680))
}

///|
let cnorm_basis_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_BASIS_1")

///|
/// `CNORM_BASIS_1`
pub fn cnorm_basis_1() -> @kernel.Thm {
  cnorm_basis_1_c.get()
}

///|
/// CVECTOR_CHOOSE_SIZE
fn step_262() -> Unit raise {
  let t681 = @meson.meson_tac(@list.List([@vectors.vector_choose_size(), cnorm_vector_to_cvector()]))
  cvector_choose_size_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, real_of_num(0) <= c → (∃ x : Cart[Cart[Real, 2], N], norm(x) == c)"), t681))
}

///|
let cvector_choose_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_CHOOSE_SIZE")

///|
/// `CVECTOR_CHOOSE_SIZE`
pub fn cvector_choose_size() -> @kernel.Thm {
  cvector_choose_size_c.get()
}

///|
/// cunit
fn step_263() -> Unit raise {
  cunit_c.set(@pair.new_definition(@term_syntax.parse_term("(cunit : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((X : Cart[Cart[Real, 2], N])) == cvector_mul(inv(Cx(norm(X))), X)")))
}

///|
let cunit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cunit")

///|
/// `cunit`
pub fn cunit() -> @kernel.Thm {
  cunit_c.get()
}

///|
/// CUNIT_CVECTOR_ZERO
fn step_264() -> Unit raise {
  let t682 = @simp.rewrite_tac(@list.List([cunit(), cnorm_cvector_zero(), @complexes.complex_inv_0(), cvector_mul_lzero()]))
  cunit_cvector_zero_c.set(@tactics.prove(@term_syntax.parse_term("(cunit : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((cvector_zero : Cart[Cart[Real, 2], N])) == (cvector_zero : Cart[Cart[Real, 2], N])"), t682))
}

///|
let cunit_cvector_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUNIT_CVECTOR_ZERO")

///|
/// `CUNIT_CVECTOR_ZERO`
pub fn cunit_cvector_zero() -> @kernel.Thm {
  cunit_cvector_zero_c.get()
}

///|
/// CDOT_CUNIT_MUL_CUNIT
fn step_265() -> Unit raise {
  let t688 = @simp.asm_simp_tac(@list.List([cnorm2(), real_of_complex_v1(), real_cdot_self(), cdot_eq_0(), cnorm2_cvector_zero(), cvector_mul_rzero(), cnorm2_eq_0(), @complexes.complex_mul_linv(), cvector_mul_id()]))
  let t684 = @equal.gsym(@realarith.real_pow_2())
  let t685 = @equal.gsym(@complexes.cx_mul())
  let t686 = @equal.gsym(@complexes.complex_inv_mul())
  let t687 = @simp.simp_tac(@list.List([cunit(), cvector_mul_assoc(), cdot_lmul(), @complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) * (y : Cart[Real, 2]) * x == x * x * y")), t686, t685, t684, cnorm(), @trivia.o_def(), cnorm2_pos(), @real.sqrt_pow_2()]))
  let t683 = @simp.asm_rewrite_tac(@list.List([cunit_cvector_zero(), cdot_lzero(), cvector_mul_lzero()]))
  let t689 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Cart[Real, 2], N]) == cvector_zero"))), t683), t687), t688)
  cdot_cunit_mul_cunit_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], cvector_mul(cdot(cunit(x), x), cunit(x)) == x"), t689))
}

///|
let cdot_cunit_mul_cunit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_CUNIT_MUL_CUNIT")

///|
/// `CDOT_CUNIT_MUL_CUNIT`
pub fn cdot_cunit_mul_cunit() -> @kernel.Thm {
  cdot_cunit_mul_cunit_c.get()
}

///|
/// collinear_cvectors
fn step_266() -> Unit raise {
  collinear_cvectors_c.set(@pair.new_definition(@term_syntax.parse_term("(collinear_cvectors : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Bool)((x : Cart[Cart[Real, 2], N]), (y : Cart[Cart[Real, 2], N])) == (∃ a : Cart[Real, 2], y == cvector_mul(a, x) || x == cvector_mul(a, y))")))
}

///|
let collinear_cvectors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("collinear_cvectors")

///|
/// `collinear_cvectors`
pub fn collinear_cvectors() -> @kernel.Thm {
  collinear_cvectors_c.get()
}

///|
/// COLLINEAR_CVECTORS_SYM
fn step_267() -> Unit raise {
  let t690 = @meson.meson_tac(@list.List([]))
  let t691 = @tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_cvectors()])), t690)
  collinear_cvectors_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], collinear_cvectors(x, y) == collinear_cvectors(y, x)"), t691))
}

///|
let collinear_cvectors_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_CVECTORS_SYM")

///|
/// `COLLINEAR_CVECTORS_SYM`
pub fn collinear_cvectors_sym() -> @kernel.Thm {
  collinear_cvectors_sym_c.get()
}

///|
/// COLLINEAR_CVECTORS_0
fn step_268() -> Unit raise {
  let t693 = @simp.rewrite_tac(@list.List([cvector_mul_lzero()]))
  let t692 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))"))
  let t694 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_cvectors()])), @tactics.gen_tac), t692), t693)
  collinear_cvectors_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], collinear_cvectors(x, cvector_zero)"), t694))
}

///|
let collinear_cvectors_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_CVECTORS_0")

///|
/// `COLLINEAR_CVECTORS_0`
pub fn collinear_cvectors_0() -> @kernel.Thm {
  collinear_cvectors_0_c.get()
}

///|
/// NON_NULL_COLLINEARS
fn step_269() -> Unit raise {
  let t700 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_linv(), cvector_mul_id()]))
  let t699 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_inv_eq_0(), cvector_mul_assoc()]))
  let t701 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("inv((a : Cart[Real, 2]))")), t699), t700)
  let t702 = @list.List([@meson.asm_meson_tac(@list.List([cvector_mul_lzero()])), t701])
  let t703 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((a : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s697 = @tactics.assume_tac(x696)
    fn(x698 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s697(x698)
    }
  }), t702)
  let t704 = @list.List([@meson.asm_meson_tac(@list.List([cvector_mul_lzero()])), t703])
  let t695 = @tactics.repeat_tac(@tactics.strip_tac)
  let t705 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_cvectors()])), t695), t704)
  non_null_collinears_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], collinear_cvectors(x, y) && !(x == cvector_zero) && !(y == cvector_zero) → (∃ a : Cart[Real, 2], !(a == Cx(real_of_num(0))) && y == cvector_mul(a, x))"), t705))
}

///|
let non_null_collinears_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NON_NULL_COLLINEARS")

///|
/// `NON_NULL_COLLINEARS`
pub fn non_null_collinears() -> @kernel.Thm {
  non_null_collinears_c.get()
}

///|
/// COLLINEAR_LNONNULL
fn step_270() -> Unit raise {
  let t709 = @meson.asm_meson_tac(@list.List([non_null_collinears()]))
  let t708 = @meson.asm_meson_tac(@list.List([cvector_mul_lzero()]))
  let t707 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))"))
  let t710 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t707), t708), t709])
  let t706 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Cart[Real, 2], N]) == cvector_zero"))
  let t711 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t706), t710)
  collinear_lnonnull_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], collinear_cvectors(x, y) && !(x == cvector_zero) → (∃ a : Cart[Real, 2], y == cvector_mul(a, x))"), t711))
}

///|
let collinear_lnonnull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_LNONNULL")

///|
/// `COLLINEAR_LNONNULL`
pub fn collinear_lnonnull() -> @kernel.Thm {
  collinear_lnonnull_c.get()
}

///|
/// COLLINEAR_RNONNULL
fn step_271() -> Unit raise {
  let t712 = @meson.meson_tac(@list.List([collinear_lnonnull(), collinear_cvectors_sym()]))
  collinear_rnonnull_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], collinear_cvectors(x, y) && !(y == cvector_zero) → (∃ a : Cart[Real, 2], x == cvector_mul(a, y))"), t712))
}

///|
let collinear_rnonnull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_RNONNULL")

///|
/// `COLLINEAR_RNONNULL`
pub fn collinear_rnonnull() -> @kernel.Thm {
  collinear_rnonnull_c.get()
}

///|
/// COLLINEAR_RUNITREAL
fn step_272() -> Unit raise {
  let t736 = @simp.rewrite_rule(@list.List([@vectors.norm_eq_1()]))
  let t738 = @tactics.pop_assum(fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let x_1 = x734
      @simp.rewrite_tac(@list.List([x_1, @complexes.complex_mul_rid()]))
    })(t736(x737))
  })
  let t733 = @simp.rewrite_tac(@list.List([cdot_lmul(), cdot_lreal(), cvector_re_vector_to_cvector(), cvector_im_vector_to_cvector(), @vectors.dot_rzero(), @complexes.complex_mul_rzero(), @complexes.complex_sub_rzero()]))
  let t732 = @tactics.first_x_assum(fn(x725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x725
    @tactics.first_x_assum(fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let y = x727
      let t730 = @bool.conj(y, x)
      let t731 = @drule.match_mp(collinear_rnonnull())(t730)
      @tactics.choose_then((x729 : @kernel.Thm) => single(@simp.once_rewrite_tac, x729))(t731)
    })
  })
  let t721 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, x == real_of_num(1) → !(x == real_of_num(0))")))
  let t719 = @simp.rewrite_rule(@list.List([@vectors.norm_eq_0(), @equal.gsym(vector_to_cvector_zero_eq())]))
  let t724 = @tactics.pop_assum((x723 : @kernel.Thm) => distrib_v1(@list.List([fn(x713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s714 = @tactics.assume_tac(x713)
    fn(x715 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s714(x715)
    }
  }, fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s717 = @tactics.assume_tac(x716)
        fn(x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s717(x718)
        }
      })(t719(x720))
    })(t721(x722))
  }]), x723))
  let t739 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t724), t732), t733), t738)
  collinear_runitreal_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Real, N], collinear_cvectors(x, vector_to_cvector(y)) && norm(y) == real_of_num(1) → x == cvector_mul(cdot(x, vector_to_cvector(y)), vector_to_cvector(y))"), t739))
}

///|
let collinear_runitreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_RUNITREAL")

///|
/// `COLLINEAR_RUNITREAL`
pub fn collinear_runitreal() -> @kernel.Thm {
  collinear_runitreal_c.get()
}

///|
/// CCROSS_COLLINEAR_CVECTORS
fn step_273() -> Unit raise {
  let t759 = @meson.asm_meson_tac(@list.List([@complexes.complex_mul_ac()]))
  let t758 = @simp.asm_simp_tac(@list.List([complex_balance_div_mul()]))
  let t757 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((y : Cart[Cart[Real, 2], 3]), 1) / op_dollar((x : Cart[Cart[Real, 2], 3]), 1)"))
  let t760 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t757), t758), t759)
  let t754 = @meson.asm_meson_tac(@list.List([@complexes.complex_mul_ac()]))
  let t753 = @simp.asm_simp_tac(@list.List([complex_balance_div_mul()]))
  let t752 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((y : Cart[Cart[Real, 2], 3]), 2) / op_dollar((x : Cart[Cart[Real, 2], 3]), 2)"))
  let t755 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t752), t753), t754)
  let t749 = @meson.asm_meson_tac(@list.List([@complexes.complex_mul_ac()]))
  let t748 = @simp.asm_simp_tac(@list.List([complex_balance_div_mul()]))
  let t747 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((y : Cart[Cart[Real, 2], 3]), 3) / op_dollar((x : Cart[Cart[Real, 2], 3]), 3)"))
  let t750 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t747), t748), t749)
  let t746 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_poly_clauses()]))
  let t745 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))"))
  let t751 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t745), t746), t750])
  let t756 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], 3]), 3) == Cx(real_of_num(0))")), t751), t755])
  let t761 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], 3]), 2) == Cx(real_of_num(0))")), t756), t760])
  let t744 = @class.asm_cases_tac(@term_syntax.parse_term("op_dollar((x : Cart[Cart[Real, 2], 3]), 1) == Cx(real_of_num(0))"))
  let t762 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s742 = @tactics.mp_tac(x741)
    fn(x743 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s742(x743)
    }
  })), t744), t761), @complexes.simple_complex_arith_tac])
  let t740 = @tactics.repeat_tac(@tactics.gen_tac)
  let t763 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ccross(), collinear_cvectors(), cart_eq3(), @vectors.vector_3(), cvector_zero_component(), @complexes.complex_sub_0(), cvector_mul_component()])), t740), @tactics.eq_tac), t762)
  ccross_collinear_cvectors_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], 3], ∀ y : Cart[Cart[Real, 2], 3], (ccross(x, y) == cvector_zero) == collinear_cvectors(x, y)"), t763))
}

///|
let ccross_collinear_cvectors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCROSS_COLLINEAR_CVECTORS")

///|
/// `CCROSS_COLLINEAR_CVECTORS`
pub fn ccross_collinear_cvectors() -> @kernel.Thm {
  ccross_collinear_cvectors_c.get()
}

///|
/// CVECTOR_MUL_INV
fn step_274() -> Unit raise {
  let t764 = @simp.asm_simp_tac(@list.List([cvector_mul_assoc(), @meson.meson(@list.List([]), @term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)")), @complexes.complex_mul_linv(), cvector_mul_id()]))
  let t765 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t764)
  cvector_mul_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], !(a == Cx(real_of_num(0))) && x == cvector_mul(a, y) → y == cvector_mul(inv(a), x)"), t765))
}

///|
let cvector_mul_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_INV")

///|
/// `CVECTOR_MUL_INV`
pub fn cvector_mul_inv() -> @kernel.Thm {
  cvector_mul_inv_c.get()
}

///|
/// CVECTOR_MUL_INV2
fn step_275() -> Unit raise {
  let t767 = @meson.asm_meson_tac(@list.List([cvector_mul_lzero(), cvector_mul_inv()]))
  let t766 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t768 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t766), t767)
  cvector_mul_inv2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], !(x == cvector_zero) && x == cvector_mul(a, y) → y == cvector_mul(inv(a), x)"), t768))
}

///|
let cvector_mul_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CVECTOR_MUL_INV2")

///|
/// `CVECTOR_MUL_INV2`
pub fn cvector_mul_inv2() -> @kernel.Thm {
  cvector_mul_inv2_c.get()
}

///|
/// COLLINEAR_CVECTORS_VECTOR_TO_CVECTOR
fn step_276() -> Unit raise {
  let t792 = @simp.rewrite_tac(@list.List([]))
  let t791 = @tactics.exists_tac(@term_syntax.parse_term("Cx((c : Real))"))
  let t793 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([vector_to_cvector_mul()])), t791), t792)
  let t790 = @simp.asm_rewrite_tac(@list.List([vector_to_cvector_zero(), cvector_mul_lzero()]))
  let t794 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))")), t790)
  let t789 = @simp.asm_simp_tac(@list.List([]))
  let t788 = @tactics.exists_tac(@term_syntax.parse_term("Re(inv((a : Cart[Real, 2])))"))
  let t787 = @tactics.repeat_tac(@tactics.strip_tac)
  let t786 = @simp.rewrite_tac(@list.List([cvector_mul_component(), vector_to_cvector_component(), @vectors.vector_mul_component(), @complexes.complex_eq(), @complexes.re_cx(), @complexes.re_mul_cx()]))
  let t785 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  let t784 = @tactics.pop_assum(fn(x781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s782 = @tactics.mp_tac(x781)
    fn(x783 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s782(x783)
    }
  })
  let t779 = @list.List([@meson.asm_meson_tac(@list.List([cvector_mul_inv2()]))])
  let t780 = @tactics.subgoal_tac("", @term_syntax.parse_term("vector_to_cvector((y : Cart[Real, N])) == cvector_mul(inv((a : Cart[Real, 2])), vector_to_cvector((x : Cart[Real, N])))"), t779)
  let t778 = @simp.rewrite_tac(@list.List([@equal.gsym(vector_to_cvector_zero_eq())]))
  let t795 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)"))])), t778), @tactics.disch_tac), t780), t784), t785), t786), t787), t788), t789)
  let t777 = @simp.asm_simp_tac(@list.List([]))
  let t776 = @tactics.exists_tac(@term_syntax.parse_term("Re((a : Cart[Real, 2]))"))
  let t775 = @tactics.repeat_tac(@tactics.strip_tac)
  let t774 = @simp.rewrite_tac(@list.List([cvector_mul_component(), vector_to_cvector_component(), @vectors.vector_mul_component(), @complexes.complex_eq(), @complexes.re_cx(), @complexes.re_mul_cx()]))
  let t773 = @simp.once_rewrite_tac(@list.List([@cart.cart_eq()]))
  let t796 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s771 = @tactics.mp_tac(x770)
    fn(x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s771(x772)
    }
  }), t773), t774), t775), @tactics.disj2_tac), t776), t777), t795, t794, t793])
  let t769 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac))
  let t797 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.collinear_lemma_alt(), collinear_cvectors()])), t769), t796)
  collinear_cvectors_vector_to_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], collinear_cvectors(vector_to_cvector(x), vector_to_cvector(y)) == collinear({vec(0), x, y})"), t797))
}

///|
let collinear_cvectors_vector_to_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_CVECTORS_VECTOR_TO_CVECTOR")

///|
/// `COLLINEAR_CVECTORS_VECTOR_TO_CVECTOR`
pub fn collinear_cvectors_vector_to_cvector() -> @kernel.Thm {
  collinear_cvectors_vector_to_cvector_c.get()
}

///|
/// corthogonal
fn step_277() -> Unit raise {
  corthogonal_c.set(@pair.new_definition(@term_syntax.parse_term("(corthogonal : (Cart[Cart[Real, 2], N], Cart[Cart[Real, 2], N]) -> Bool)((x : Cart[Cart[Real, 2], N]), (y : Cart[Cart[Real, 2], N])) == (cdot(x, y) == Cx(real_of_num(0)))")))
}

///|
let corthogonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("corthogonal")

///|
/// `corthogonal`
pub fn corthogonal() -> @kernel.Thm {
  corthogonal_c.get()
}

///|
/// CORTHOGONAL_SYM
fn step_278() -> Unit raise {
  let t798 = @meson.meson_tac(@list.List([corthogonal(), cdot_sym(), cnj_zero()]))
  corthogonal_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], corthogonal(x, y) == corthogonal(y, x)"), t798))
}

///|
let corthogonal_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_SYM")

///|
/// `CORTHOGONAL_SYM`
pub fn corthogonal_sym() -> @kernel.Thm {
  corthogonal_sym_c.get()
}

///|
/// CORTHOGONAL_0
fn step_279() -> Unit raise {
  let t799 = @simp.rewrite_tac(@list.List([corthogonal(), cdot_lzero(), cdot_rzero()]))
  corthogonal_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], corthogonal(cvector_zero, x) && corthogonal(x, cvector_zero)"), t799))
}

///|
let corthogonal_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_0")

///|
/// `CORTHOGONAL_0`
pub fn corthogonal_0() -> @kernel.Thm {
  corthogonal_0_c.get()
}

///|
let corthogonal_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LZERO")

///|
/// `CORTHOGONAL_LZERO`
pub fn corthogonal_lzero() -> @kernel.Thm {
  corthogonal_lzero_c.get()
}

///|
let corthogonal_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_RZERO")

///|
/// `CORTHOGONAL_RZERO`
pub fn corthogonal_rzero() -> @kernel.Thm {
  corthogonal_rzero_c.get()
}

///|
/// CORTHOGONAL_LZERO, CORTHOGONAL_RZERO
fn step_280() -> Unit raise {
  match gconjuncts(corthogonal_0()) {
    More(corthogonal_lzero, tail=More(corthogonal_rzero, tail=Empty)) => {
      corthogonal_lzero_c.set(corthogonal_lzero)
      corthogonal_rzero_c.set(corthogonal_rzero)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1749:4")
  }
}

///|
/// CORTHOGONAL_COLLINEAR_CVECTORS
fn step_281() -> Unit raise {
  let t806 = @meson.asm_meson_tac(@list.List([cvector_mul_lzero()]))
  let t805 = @simp.asm_rewrite_tac(@list.List([cdot_rmul(), cdot_lmul(), @complexes.complex_entire(), @equal.gsym(cnorm2()), cdot_eq_0(), @complexes.cnj_eq_0()]))
  let t804 = @tactics.pop_assum(fn(x801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s802 = @tactics.mp_tac(x801)
    fn(x803 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s802(x803)
    }
  })
  let t800 = @tactics.repeat_tac(@tactics.strip_tac)
  let t807 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_cvectors(), corthogonal()])), t800), t804), t805), t806)
  corthogonal_collinear_cvectors_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], collinear_cvectors(x, y) && !(x == cvector_zero) && !(y == cvector_zero) → !corthogonal(x, y)"), t807))
}

///|
let corthogonal_collinear_cvectors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_COLLINEAR_CVECTORS")

///|
/// `CORTHOGONAL_COLLINEAR_CVECTORS`
pub fn corthogonal_collinear_cvectors() -> @kernel.Thm {
  corthogonal_collinear_cvectors_c.get()
}

///|
/// CORTHOGONAL_MUL_CLAUSES
fn step_282() -> Unit raise {
  let t808 = @meson.meson_tac(@list.List([]))
  let t809 = @tactics.then_tac(@simp.simp_tac(@list.List([corthogonal(), cdot_rmul(), cdot_lmul(), @complexes.complex_entire(), @complexes.cnj_eq_0()])), t808)
  corthogonal_mul_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], _], ∀ y : Cart[Cart[Real, 2], _], ∀ a : Cart[Real, 2], (corthogonal(x, y) → corthogonal(x, cvector_mul(a, y))) && (corthogonal(x, y) || a == Cx(real_of_num(0))) == corthogonal(x, cvector_mul(a, y)) && (corthogonal(x, y) → corthogonal(cvector_mul(a, x), y)) && (corthogonal(x, y) || a == Cx(real_of_num(0))) == corthogonal(cvector_mul(a, x), y)"), t809))
}

///|
let corthogonal_mul_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_MUL_CLAUSES")

///|
/// `CORTHOGONAL_MUL_CLAUSES`
pub fn corthogonal_mul_clauses() -> @kernel.Thm {
  corthogonal_mul_clauses_c.get()
}

///|
let corthogonal_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_RMUL")

///|
/// `CORTHOGONAL_RMUL`
pub fn corthogonal_rmul() -> @kernel.Thm {
  corthogonal_rmul_c.get()
}

///|
let corthogonal_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_RMUL_EQ")

///|
/// `CORTHOGONAL_RMUL_EQ`
pub fn corthogonal_rmul_eq() -> @kernel.Thm {
  corthogonal_rmul_eq_c.get()
}

///|
let corthogonal_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LMUL")

///|
/// `CORTHOGONAL_LMUL`
pub fn corthogonal_lmul() -> @kernel.Thm {
  corthogonal_lmul_c.get()
}

///|
let corthogonal_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LMUL_EQ")

///|
/// `CORTHOGONAL_LMUL_EQ`
pub fn corthogonal_lmul_eq() -> @kernel.Thm {
  corthogonal_lmul_eq_c.get()
}

///|
/// CORTHOGONAL_RMUL, CORTHOGONAL_RMUL_EQ, CORTHOGONAL_LMUL, CORTHOGONAL_LMUL_EQ
fn step_283() -> Unit raise {
  match gconjuncts(corthogonal_mul_clauses()) {
    More(corthogonal_rmul, tail=More(corthogonal_rmul_eq, tail=More(corthogonal_lmul, tail=More(corthogonal_lmul_eq, tail=Empty)))) => {
      corthogonal_rmul_c.set(corthogonal_rmul)
      corthogonal_rmul_eq_c.set(corthogonal_rmul_eq)
      corthogonal_lmul_c.set(corthogonal_lmul)
      corthogonal_lmul_eq_c.set(corthogonal_lmul_eq)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1770:4")
  }
}

///|
/// CORTHOGONAL_LRMUL_CLAUSES
fn step_284() -> Unit raise {
  let t810 = @meson.meson_tac(@list.List([corthogonal_mul_clauses()]))
  corthogonal_lrmul_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], _], ∀ y : Cart[Cart[Real, 2], _], ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], (corthogonal(x, y) → corthogonal(cvector_mul(a, x), cvector_mul(b, y))) && (corthogonal(x, y) || a == Cx(real_of_num(0)) || b == Cx(real_of_num(0))) == corthogonal(cvector_mul(a, x), cvector_mul(b, y))"), t810))
}

///|
let corthogonal_lrmul_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LRMUL_CLAUSES")

///|
/// `CORTHOGONAL_LRMUL_CLAUSES`
pub fn corthogonal_lrmul_clauses() -> @kernel.Thm {
  corthogonal_lrmul_clauses_c.get()
}

///|
let corthogonal_lrmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LRMUL")

///|
/// `CORTHOGONAL_LRMUL`
pub fn corthogonal_lrmul() -> @kernel.Thm {
  corthogonal_lrmul_c.get()
}

///|
let corthogonal_lrmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LRMUL_EQ")

///|
/// `CORTHOGONAL_LRMUL_EQ`
pub fn corthogonal_lrmul_eq() -> @kernel.Thm {
  corthogonal_lrmul_eq_c.get()
}

///|
/// CORTHOGONAL_LRMUL, CORTHOGONAL_LRMUL_EQ
fn step_285() -> Unit raise {
  match gconjuncts(corthogonal_lrmul_clauses()) {
    More(corthogonal_lrmul, tail=More(corthogonal_lrmul_eq, tail=Empty)) => {
      corthogonal_lrmul_c.set(corthogonal_lrmul)
      corthogonal_lrmul_eq_c.set(corthogonal_lrmul_eq)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1780:4")
  }
}

///|
/// CORTHOGONAL_REAL_CLAUSES
fn step_286() -> Unit raise {
  let t812 = @tactics.conv_tac(@calc_rat.real_field)
  let t811 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.cx_def(), @complexes.im_def(), @complexes.complex(), @complexes.complex_mul(), @vectors.vector_2(), @complexes.ii()]))
  let t813 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([corthogonal(), @vectors.orthogonal(), cdot_lreal(), cdot_rreal(), @complexes.complex_sub_0(), @complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_sub(), @complexes.im_sub(), @complexes.re_add(), @complexes.im_add()])), t811), t812)
  corthogonal_real_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, _], ∀ c : Cart[Cart[Real, 2], _], corthogonal(c, vector_to_cvector(r)) == (orthogonal(cvector_re(c), r) && orthogonal(cvector_im(c), r)) && corthogonal(vector_to_cvector(r), c) == (orthogonal(r, cvector_re(c)) && orthogonal(r, cvector_im(c)))"), t813))
}

///|
let corthogonal_real_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_REAL_CLAUSES")

///|
/// `CORTHOGONAL_REAL_CLAUSES`
pub fn corthogonal_real_clauses() -> @kernel.Thm {
  corthogonal_real_clauses_c.get()
}

///|
let corthogonal_rreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_RREAL")

///|
/// `CORTHOGONAL_RREAL`
pub fn corthogonal_rreal() -> @kernel.Thm {
  corthogonal_rreal_c.get()
}

///|
let corthogonal_lreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LREAL")

///|
/// `CORTHOGONAL_LREAL`
pub fn corthogonal_lreal() -> @kernel.Thm {
  corthogonal_lreal_c.get()
}

///|
/// CORTHOGONAL_RREAL, CORTHOGONAL_LREAL
fn step_287() -> Unit raise {
  match gconjuncts(corthogonal_real_clauses()) {
    More(corthogonal_rreal, tail=More(corthogonal_lreal, tail=Empty)) => {
      corthogonal_rreal_c.set(corthogonal_rreal)
      corthogonal_lreal_c.set(corthogonal_lreal)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1794:4")
  }
}

///|
/// CORTHOGONAL_UNIT
fn step_288() -> Unit raise {
  let t814 = @meson.meson_tac(@list.List([corthogonal_0()]))
  let t815 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cunit(), @equal.gsym(corthogonal_mul_clauses()), @complexes.complex_inv_eq_0(), @complexes.cx_inj(), cnorm_eq_0()])), t814)
  corthogonal_unit_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], corthogonal(x, cunit(y)) == corthogonal(x, y) && corthogonal(cunit(x), y) == corthogonal(x, y)"), t815))
}

///|
let corthogonal_unit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_UNIT")

///|
/// `CORTHOGONAL_UNIT`
pub fn corthogonal_unit() -> @kernel.Thm {
  corthogonal_unit_c.get()
}

///|
let corthogonal_runit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_RUNIT")

///|
/// `CORTHOGONAL_RUNIT`
pub fn corthogonal_runit() -> @kernel.Thm {
  corthogonal_runit_c.get()
}

///|
let corthogonal_lunit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_LUNIT")

///|
/// `CORTHOGONAL_LUNIT`
pub fn corthogonal_lunit() -> @kernel.Thm {
  corthogonal_lunit_c.get()
}

///|
/// CORTHOGONAL_RUNIT, CORTHOGONAL_LUNIT
fn step_289() -> Unit raise {
  match gconjuncts(corthogonal_unit()) {
    More(corthogonal_runit, tail=More(corthogonal_lunit, tail=Empty)) => {
      corthogonal_runit_c.set(corthogonal_runit)
      corthogonal_lunit_c.set(corthogonal_lunit)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1805:4")
  }
}

///|
/// CORTHOGONAL_PROJECTION
fn step_290() -> Unit raise {
  let t825 = @simp.asm_simp_tac(@list.List([cdot_eq_0(), @complexes.complex_mul_rinv(), @complexes.complex_mul_rid(), @complexes.complex_sub_refl()]))
  let t824 = @simp.simp_tac(@list.List([cnorm2_pos(), @complexes.cx_sqrt(), cnorm2(), real_cdot_self(), real_of_complex_v1(), @complexes.csqrt_v1()]))
  let t822 = @equal.gsym(@complexes.complex_pow_2())
  let t823 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac(), @equal.gsym(@complexes.complex_inv_mul()), t822, cnorm(), @trivia.o_def(), @complexes.csqrt_v1()]))
  let t818 = @bool.spec_all(@complexes.real_cx())
  let t819 = @drule.match_mp(@complexes.real_inv())(t818)
  let t820 = @simp.rewrite_rule(@list.List([@complexes.real_cnj()]))(t819)
  let t821 = @simp.rewrite_tac(@list.List([cdot_lsub(), cunit(), cvector_mul_assoc(), @equal.gsym(cnorm2()), cdot_lmul(), cdot_rmul(), t820]))
  let t817 = @simp.asm_rewrite_tac(@list.List([corthogonal(), cdot_rzero()]))
  let t816 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Cart[Real, 2], N]) == cvector_zero"))
  let t826 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t816), t817), t821), t823), t824), t825)
  corthogonal_projection_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], corthogonal(x - cvector_mul(cdot(x, cunit(y)), cunit(y)), y)"), t826))
}

///|
let corthogonal_projection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORTHOGONAL_PROJECTION")

///|
/// `CORTHOGONAL_PROJECTION`
pub fn corthogonal_projection() -> @kernel.Thm {
  corthogonal_projection_c.get()
}

///|
/// CDOT_PYTHAGOREAN
fn step_291() -> Unit raise {
  let t827 = @simp.simp_tac(@list.List([corthogonal(), cnorm2(), cdot_ladd(), cdot_radd(), @complexes.complex_add_rid(), @complexes.complex_add_lid(), real_of_complex_add(), real_cdot_self(), @meson.meson(@list.List([cdot_sym(), cnj_zero()]), @term_syntax.parse_term("cdot((x : Cart[Cart[Real, 2], _]), (y : Cart[Cart[Real, 2], _])) == Cx(real_of_num(0)) → cdot(y, x) == Cx(real_of_num(0))"))]))
  cdot_pythagorean_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], corthogonal(x, y) → cnorm2(x + y) == cnorm2(x) + cnorm2(y)"), t827))
}

///|
let cdot_pythagorean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_PYTHAGOREAN")

///|
/// `CDOT_PYTHAGOREAN`
pub fn cdot_pythagorean() -> @kernel.Thm {
  cdot_pythagorean_c.get()
}

///|
/// CDOT_CAUCHY_SCHWARZ_POW_2
fn step_292() -> Unit raise {
  let t855 = @equal.gsym(@realarith.real_pow_2())
  let t856 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), cnorm2_eq_0(), @realarith.real_mul_rid(), @equal.gsym(@complexes.cx_add()), real_of_complex_cx(), t855, @real.real_le_addl(), @realax.real_le_mul(), cnorm2_pos()]))
  let t849 = @equal.gsym(@complexes.cx_inv())
  let t850 = @equal.gsym(@complexes.cx_pow())
  let t851 = @equal.gsym(@complexes.complex_pow_2())
  let t852 = @equal.gsym(@complexes.cx_mul())
  let t853 = @equal.gsym(@complexes.cx_sqrt())
  let t854 = @simp.simp_tac(@list.List([@equal.gsym(cnorm2()), t853, cnorm2_pos(), t852, t851, t850, @real.sqrt_pow_2(), t849]))
  let t847 = @bool.spec_all(real_cdot_self())
  let t848 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(real_of_complex_v1())(t847))]))
  let t846 = @simp.asm_simp_tac(@list.List([cdot_eq_0(), @complexes.complex_mul_rinv(), @complexes.complex_mul_lid(), @complexes.complex_mul_cnj(), @equal.gsym(@complexes.complex_inv_mul())]))
  let t845 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) * ((y : Cart[Real, 2]) * inv(x) * x * ((z : Cart[Real, 2]) * inv((x' : Cart[Real, 2])) * inv(x'))) == y * z * (x * inv(x) * (x * (inv(x') * inv(x'))))"))]))
  let t844 = @simp.simp_tac(@list.List([@complexes.cx_sqrt(), cnorm2_pos(), @complexes.csqrt_v1(), cx_cnorm2()]))
  let t837 = @bool.spec_all(@complexes.real_cx())
  let t838 = @drule.match_mp(@complexes.real_inv())(t837)
  let t839 = @simp.rewrite_rule(@list.List([@complexes.real_cnj()]))(t838)
  let t840 = @equal.gsym(cnorm2())
  let t841 = @equal.gsym(@complexes.complex_pow_2())
  let t842 = @equal.gsym(@complexes.complex_inv_mul())
  let t835 = @bool.spec_all(@complexes.real_cx())
  let t836 = @drule.match_mp(@complexes.real_inv())(t835)
  let t843 = rewrite_tacs(@list.List([cunit(), cdot_rmul(), cvector_mul_assoc(), @simp.rewrite_rule(@list.List([@complexes.real_cnj()]))(t836), @complexes.complex_mul_ac(), t842, t841, cnorm(), @trivia.o_def(), @complexes.csqrt_v1(), @complexes.complex_add_ldistrib(), cnorm2(), cdot_rmul(), @complexes.cnj_mul(), cdot_lmul(), t840, t839]))
  let t833 = @equal.gsym(real_of_complex_mul())
  let t834 = @simp.simp_tac(@list.List([cnorm2(), @equal.gsym(real_of_complex_add()), real_cdot_self(), @complexes.real_add(), t833]))
  let t832 = @simp.rewrite_tac(@list.List([@equal.gsym(corthogonal_mul_clauses()), corthogonal_runit(), corthogonal_projection()]))
  let t831 = @tactics.match_mp_tac(@bool.gen_all(@drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) → (f : (_, _) -> Real)(x, y) == (g : (_, _) -> Real)(x, y)) → P((x : _), (y : _)) && (a : Real) <= g(x, y) * (b : Real) → a <= f(x, y) * b")))(cdot_pythagorean())))
  let t830 = @simp.once_rewrite_tac(@list.List([@drule.match_mp(@meson.meson(@list.List([cvector_sub_add()]), @term_syntax.parse_term("(∀ x : Cart[Cart[Real, 2], N], ∀ y : _, (p : (Cart[Cart[Real, 2], N], _) -> Bool)(x - (f : (Cart[Cart[Real, 2], N], _) -> Cart[Cart[Real, 2], N])(x, y), y)) → cnorm2((x : Cart[Cart[Real, 2], N])) * (z : Real) == cnorm2(x - f(x, (y : _)) + f(x, y)) * z")))(corthogonal_projection())]))
  let t829 = @simp.asm_rewrite_tac(@list.List([cnorm2_cvector_zero(), cdot_rzero(), @complexes.complex_norm_0(), @realarith.real_pow_2(), @calc_int.real_mul_rzero(), real_of_complex_cx(), @realax.real_le_refl()]))
  let t828 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Cart[Real, 2], N]) == cvector_zero"))
  let t857 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t828), t829), t830), t831), t832), t834), t843), t844), t845), t846), t848), t854), t856)
  cdot_cauchy_schwarz_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], pow(norm(cdot(x, y)), 2) <= cnorm2(x) * cnorm2(y)"), t857))
}

///|
let cdot_cauchy_schwarz_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_CAUCHY_SCHWARZ_POW_2")

///|
/// `CDOT_CAUCHY_SCHWARZ_POW_2`
pub fn cdot_cauchy_schwarz_pow_2() -> @kernel.Thm {
  cdot_cauchy_schwarz_pow_2_c.get()
}

///|
/// CDOT_CAUCHY_SCHWARZ
fn step_293() -> Unit raise {
  let t860 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), cnorm_pos(), @realax.real_le_mul(), @real.real_pow_mul(), cnorm_pow_2(), cdot_cauchy_schwarz_pow_2()]))
  let t858 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && abs(x) <= abs(y) → x <= y"))
  let t859 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@real.real_le_square_abs()]))(t858))
  let t861 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t859), t860)
  cdot_cauchy_schwarz_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], norm(cdot(x, y)) <= norm(x) * norm(y)"), t861))
}

///|
let cdot_cauchy_schwarz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_CAUCHY_SCHWARZ")

///|
/// `CDOT_CAUCHY_SCHWARZ`
pub fn cdot_cauchy_schwarz() -> @kernel.Thm {
  cdot_cauchy_schwarz_c.get()
}

///|
/// CDOT_CAUCHY_SCHWARZ_POW_2_EQUAL
fn step_294() -> Unit raise {
  let t894 = @equal.gsym(cnorm2_alt())
  let t895 = @equal.gsym(@complexes.cx_pow())
  let t896 = @simp.simp_tac(@list.List([@complexes.complex_mul_cnj(), @equal.gsym(cnorm2()), @complexes.complex_norm_cnj(), t895, real_of_complex_mul(), @complexes.real_cx(), real_cdot_self(), real_of_complex_cx(), t894]))
  let t893 = @simp.asm_rewrite_tac(@list.List([cnorm2(), cdot_lmul(), cdot_rmul(), @complexes.complex_norm_mul(), @complexes.complex_mul_assoc()]))
  let t892 = @tactics.repeat_tac(@tactics.strip_tac)
  let t897 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_cvectors()])), t892), t893), t896), @complexes.simple_complex_arith_tac)
  let t891 = @meson.meson_tac(@list.List([]))
  let t887 = @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real) + x) == (y == real_of_num(0))"))
  let t888 = @equal.gsym(@complexes.cx_pow())
  let t889 = @equal.gsym(@realarith.real_pow_2())
  let t890 = @simp.asm_simp_tac(@list.List([@real.real_mul_rinv(), cnorm2_eq_0(), @realarith.real_mul_rid(), @equal.gsym(@complexes.cx_add()), real_of_complex_cx(), t889, @real.real_le_addl(), @realax.real_le_mul(), cnorm2_pos(), t888, @real.real_pow_one(), @complexes.complex_mul_rid(), @complexes.complex_mul_cnj(), t887, @realarith.real_entire(), cnorm2_eq_0(), cvector_sub_eq(), collinear_cvectors()]))
  let t881 = @equal.gsym(@complexes.cx_inv())
  let t882 = @equal.gsym(@complexes.cx_pow())
  let t883 = @equal.gsym(@complexes.complex_pow_2())
  let t884 = @equal.gsym(@complexes.cx_mul())
  let t885 = @equal.gsym(@complexes.cx_sqrt())
  let t886 = @simp.simp_tac(@list.List([@equal.gsym(cnorm2()), t885, cnorm2_pos(), t884, t883, t882, @real.sqrt_pow_2(), t881, @real.real_pow_inv()]))
  let t879 = @bool.spec_all(real_cdot_self())
  let t880 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(real_of_complex_v1())(t879))]))
  let t878 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) * ((y : Cart[Real, 2]) * inv(x) * x * ((z : Cart[Real, 2]) * inv((x' : Cart[Real, 2])) * inv(x'))) == y * z * (x * inv(x) * (x * (inv(x') * inv(x'))))"))]))
  let t877 = @simp.simp_tac(@list.List([@complexes.cx_sqrt(), cnorm2_pos(), @complexes.csqrt_v1(), cx_cnorm2()]))
  let t870 = @bool.spec_all(@complexes.real_cx())
  let t871 = @drule.match_mp(@complexes.real_inv())(t870)
  let t872 = @simp.rewrite_rule(@list.List([@complexes.real_cnj()]))(t871)
  let t873 = @equal.gsym(cnorm2())
  let t874 = @equal.gsym(@complexes.complex_pow_2())
  let t875 = @equal.gsym(@complexes.complex_inv_mul())
  let t868 = @bool.spec_all(@complexes.real_cx())
  let t869 = @drule.match_mp(@complexes.real_inv())(t868)
  let t876 = rewrite_tacs(@list.List([cunit(), cdot_rmul(), cvector_mul_assoc(), @simp.rewrite_rule(@list.List([@complexes.real_cnj()]))(t869), @complexes.complex_mul_ac(), t875, t874, cnorm(), @trivia.o_def(), @complexes.csqrt_v1(), @complexes.complex_add_ldistrib(), cnorm2(), cdot_rmul(), @complexes.cnj_mul(), cdot_lmul(), t873, t872]))
  let t866 = @equal.gsym(real_of_complex_mul())
  let t867 = @simp.simp_tac(@list.List([cnorm2(), @equal.gsym(real_of_complex_add()), real_cdot_self(), @complexes.real_add(), t866]))
  let t865 = @simp.rewrite_tac(@list.List([@equal.gsym(corthogonal_mul_clauses()), corthogonal_runit(), corthogonal_projection()]))
  let t864 = @tactics.match_mp_tac(@bool.gen_all(@drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) → (g : (_, _) -> Real)(x, y) == (f : (_, _) -> Real)(x, y)) → P((x : _), (y : _)) && ((a : Real) == f(x, y) * (z : Real) → (R : Bool)) → a == g(x, y) * z → R")))(cdot_pythagorean())))
  let t898 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@drule.match_mp(@meson.meson(@list.List([cvector_sub_add()]), @term_syntax.parse_term("(∀ x : Cart[Cart[Real, 2], N], ∀ y : _, (p : (Cart[Cart[Real, 2], N], _) -> Bool)(x - (f : (Cart[Cart[Real, 2], N], _) -> Cart[Cart[Real, 2], N])(x, y), y)) → cnorm2((x : Cart[Cart[Real, 2], N])) * (z : Real) == cnorm2(x - f(x, (y : _)) + f(x, y)) * z")))(corthogonal_projection())])), t864), t865), t867), t876), t877), t878), t880), t886), t890), t891), t897])
  let t863 = @simp.asm_rewrite_tac(@list.List([cnorm2_cvector_zero(), cdot_rzero(), @complexes.complex_norm_0(), @realarith.real_pow_2(), @calc_int.real_mul_rzero(), real_of_complex_cx(), collinear_cvectors_0()]))
  let t862 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Cart[Real, 2], N]) == cvector_zero"))
  let t899 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t862), t863), @tactics.eq_tac), t898)
  cdot_cauchy_schwarz_pow_2_equal_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], (pow(norm(cdot(x, y)), 2) == cnorm2(x) * cnorm2(y)) == collinear_cvectors(x, y)"), t899))
}

///|
let cdot_cauchy_schwarz_pow_2_equal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_CAUCHY_SCHWARZ_POW_2_EQUAL")

///|
/// `CDOT_CAUCHY_SCHWARZ_POW_2_EQUAL`
pub fn cdot_cauchy_schwarz_pow_2_equal() -> @kernel.Thm {
  cdot_cauchy_schwarz_pow_2_equal_c.get()
}

///|
/// CDOT_CAUCHY_SCHWARZ_EQUAL
fn step_295() -> Unit raise {
  let t901 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), cnorm_pos(), @realax.real_le_mul(), @real.real_pow_mul(), cnorm_pow_2(), cdot_cauchy_schwarz_pow_2_equal()]))
  let t900 = @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real)) == (abs(x) == abs(y) && (real_of_num(0) <= x && real_of_num(0) <= y || x < real_of_num(0) && y < real_of_num(0)))"))
  let t902 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@real.real_eq_square_abs()]))(t900)])), t901)
  cdot_cauchy_schwarz_equal_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], (norm(cdot(x, y)) == norm(x) * norm(y)) == collinear_cvectors(x, y)"), t902))
}

///|
let cdot_cauchy_schwarz_equal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CDOT_CAUCHY_SCHWARZ_EQUAL")

///|
/// `CDOT_CAUCHY_SCHWARZ_EQUAL`
pub fn cdot_cauchy_schwarz_equal() -> @kernel.Thm {
  cdot_cauchy_schwarz_equal_c.get()
}

///|
/// CNORM_TRIANGLE
fn step_296() -> Unit raise {
  let t907 = @meson.meson_tac(@list.List([cdot_cauchy_schwarz(), re_norm(), @realax.real_le_trans()]))
  let t905 = @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (real_of_num(2) * (y : Real) + (z : Real)) <= x + (z + real_of_num(2) * (t : Real))) == (y <= t)"))
  let t906 = @simp.simp_tac(@list.List([cnorm_pos(), @realarith.real_le_add(), real_add_pow_2(), cnorm_pow_2(), cnorm2(), cdot_ladd(), cdot_radd(), @complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) + (y : Cart[Real, 2]) + ((z : Cart[Real, 2]) + (t : Cart[Real, 2])) == x + (y + z + t)")), add_cdot_sym(), real_of_complex_add(), real_cdot_self(), @complexes.real_cx(), @complexes.real_add(), real_of_complex_cx(), t905]))
  let t903 = @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= abs((y : Real)) && real_of_num(0) <= x && real_of_num(0) <= y → x <= y"))
  let t904 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@real.real_le_square_abs()]))(t903))
  let t908 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t904), t906), t907)
  cnorm_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], norm(x + y) <= norm(x) + norm(y)"), t908))
}

///|
let cnorm_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNORM_TRIANGLE")

///|
/// `CNORM_TRIANGLE`
pub fn cnorm_triangle() -> @kernel.Thm {
  cnorm_triangle_c.get()
}

///|
/// REAL_ABS_SUB_CNORM
fn step_297() -> Unit raise {
  let t909 = @term_syntax.parse_term("(y : Cart[Cart[Real, 2], N]) - (x : Cart[Cart[Real, 2], N])")
  let t910 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Cart[Cart[Real, 2], N])"), t909]), cnorm_triangle())
  let lemma = @simp.rewrite_rule(@list.List([cvector_sub_add2(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real) + (z : Real)) == (x - y <= z)"))]))(t910)
  let t914 = @simp.rewrite_tac(@list.List([lemma, @simp.once_rewrite_rule(@list.List([cnorm_sub()]))(lemma)]))
  let t913 = @simp.rewrite_tac(@list.List([@realarith.real_neg_sub()]))
  let t912 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) <= (y : Real)) == (-y <= x)"))]))
  let t911 = @tactics.match_mp_tac(@drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) == (Q : (_, _) -> Bool)(x, y)) → Q((x : _), (y : _)) → P(x, y)")))(@real.real_abs_bounds()))
  let t915 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t911), t912), t913), t914)
  real_abs_sub_cnorm_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Cart[Real, 2], N], ∀ y : Cart[Cart[Real, 2], N], abs(norm(x) - norm(y)) <= norm(x - y)"), t915))
}

///|
let real_abs_sub_cnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SUB_CNORM")

///|
/// `REAL_ABS_SUB_CNORM`
pub fn real_abs_sub_cnorm() -> @kernel.Thm {
  real_abs_sub_cnorm_c.get()
}

///|
/// cvsum
fn step_298() -> Unit raise {
  cvsum_c.set(@pair.new_definition(@term_syntax.parse_term("(cvsum : ((A) -> Bool, (A) -> Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((s : (A) -> Bool), (f : (A) -> Cart[Cart[Real, 2], N])) == lambda((i : Num) => vsum(s, (x : A) => op_dollar(f(x), i)))")))
}

///|
let cvsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cvsum")

///|
/// `cvsum`
pub fn cvsum() -> @kernel.Thm {
  cvsum_c.get()
}

///|
/// csummable
fn step_299() -> Unit raise {
  csummable_c.set(@pair.new_definition(@term_syntax.parse_term("(csummable : ((Num) -> Bool, (Num) -> Cart[Cart[Real, 2], N]) -> Bool)((s : (Num) -> Bool), (f : (Num) -> Cart[Cart[Real, 2], N])) == (summable(s, o(cvector_re, f)) && summable(s, o(cvector_im, f)))")))
}

///|
let csummable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("csummable")

///|
/// `csummable`
pub fn csummable() -> @kernel.Thm {
  csummable_c.get()
}

///|
/// cinfsum
fn step_300() -> Unit raise {
  cinfsum_c.set(@pair.new_definition(@term_syntax.parse_term("(cinfsum : ((Num) -> Bool, (Num) -> Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], N])((s : (Num) -> Bool), (f : (Num) -> Cart[Cart[Real, 2], N])) == vector_to_cvector(infsum(s, (x : Num) => cvector_re(f(x)))) + cvector_mul(ii, vector_to_cvector(infsum(s, (x : Num) => cvector_im(f(x)))))")))
}

///|
let cinfsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cinfsum")

///|
/// `cinfsum`
pub fn cinfsum() -> @kernel.Thm {
  cinfsum_c.get()
}

///|
/// CSUMMABLE_FLATTEN_CVECTOR
fn step_301() -> Unit raise {
  let t931 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax(), @trivia.o_def(), @cart.pastecart_fst_snd()]))
  let t930 = @tactics.exists_tac(@term_syntax.parse_term("fstcart((l : Cart[Real, Finite_sum[N, N]]))"))
  let t929 = @tactics.exists_tac(@term_syntax.parse_term("o(cvector_re, (f : (Num) -> Cart[Cart[Real, 2], N]))"))
  let t926 = @bool.spec_all(sums_pastecart())
  let t925 = @term_syntax.parse_type("M")
  let t927 = @kernel.inst_type(@list.List([(@term_syntax.parse_type("N"), t925)]), t926)
  let t928 = @tactics.match_mp_tac(@bool.gen_all(@drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == (r : Bool) → r → q")))(t927)))
  let t932 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("sndcart((l : Cart[Real, Finite_sum[N, N]]))")), t928), t929), t930), t931)
  let t924 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax(), @trivia.o_def(), @cart.pastecart_fst_snd()]))
  let t923 = @tactics.exists_tac(@term_syntax.parse_term("sndcart((l : Cart[Real, Finite_sum[N, N]]))"))
  let t922 = @tactics.exists_tac(@term_syntax.parse_term("o(cvector_im, (f : (Num) -> Cart[Cart[Real, 2], N]))"))
  let t919 = @bool.spec_all(sums_pastecart())
  let t918 = @term_syntax.parse_type("M")
  let t920 = @kernel.inst_type(@list.List([(@term_syntax.parse_type("N"), t918)]), t919)
  let t921 = @tactics.match_mp_tac(@bool.gen_all(@drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == (r : Bool) → r → p")))(t920)))
  let t933 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("fstcart((l : Cart[Real, Finite_sum[N, N]]))")), t921), t922), t923), t924)
  let t917 = @simp.asm_simp_tac(@list.List([@equal.gsym(sums_pastecart())]))
  let t934 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("pastecart((l : Cart[Real, N]), (l' : Cart[Real, N]))")), t917), t933, t932])
  let t916 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac))
  let t935 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([csummable(), @topology.summable(), cvector_flatten(), @trivia.o_def()])), t916), t934)
  csummable_flatten_cvector_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ f : (Num) -> Cart[Cart[Real, 2], N], csummable(s, f) == summable(s, o(cvector_flatten, f))"), t935))
}

///|
let csummable_flatten_cvector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSUMMABLE_FLATTEN_CVECTOR")

///|
/// `CSUMMABLE_FLATTEN_CVECTOR`
pub fn csummable_flatten_cvector() -> @kernel.Thm {
  csummable_flatten_cvector_c.get()
}

///|
/// FLATTEN_CINFSUM
fn step_302() -> Unit raise {
  let t936 = @simp.simp_tac(@list.List([cinfsum(), cvector_unflatten(), complex_vector_transpose(), @vectors.linear_fstcart(), @vectors.linear_sndcart(), csummable_flatten_cvector(), @equal.gsym(@topology.infsum_linear()), @trivia.o_def(), cvector_flatten(), @cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  flatten_cinfsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ f : (Num) -> Cart[Cart[Real, 2], N], csummable(s, f) → cinfsum(s, f) == cvector_unflatten(infsum(s, o(cvector_flatten, f)))"), t936))
}

///|
let flatten_cinfsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_CINFSUM")

///|
/// `FLATTEN_CINFSUM`
pub fn flatten_cinfsum() -> @kernel.Thm {
  flatten_cinfsum_c.get()
}

///|
/// CSUMMABLE_LINEAR
fn step_303() -> Unit raise {
  let t948 = @simp.asm_simp_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t949 = @tactics.then_tac(@tactics.match_mp_tac(@topology.summable_linear()), t948)
  let t947 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def(), @trivia.i_def(), @class.fun_eq_thm()]))(unflatten_flatten())]))
  let t946 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t950 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def(), @class.fun_eq_thm()])), @tactics.gen_tac), t946), t947), t949])
  let t945 = @tactics.subgoal_then(@term_syntax.parse_term("o(cvector_flatten, o((h : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], M]), (f : (Num) -> Cart[Cart[Real, 2], N]))) == ((n : Num) => o(cvector_flatten, o(h, cvector_unflatten), cvector_flatten(f(n))))"), (x944 : @kernel.Thm) => single(@simp.rewrite_tac, x944))
  let t941 = @drule.match_mp(flatten_clinear())
  let t943 = @tactics.pop_assum(fn(x942 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s939 = @tactics.assume_tac(x938)
      fn(x940 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s939(x940)
      }
    })(t941(x942))
  })
  let t937 = @tactics.repeat_tac(@tactics.strip_tac)
  let t951 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([csummable_flatten_cvector()])), t937), t943), t945), t950)
  csummable_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, 2], N], ∀ h : (Cart[Cart[Real, 2], N]) -> Cart[Cart[Real, 2], M], ∀ s : (Num) -> Bool, csummable(s, f) && clinear(h) → csummable(s, o(h, f))"), t951))
}

///|
let csummable_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSUMMABLE_LINEAR")

///|
/// `CSUMMABLE_LINEAR`
pub fn csummable_linear() -> @kernel.Thm {
  csummable_linear_c.get()
}

///|
/// CINFSUM_LINEAR
fn step_304() -> Unit raise {
  let t971 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @simp.rewrite_rule(@list.List([@trivia.o_def(), @trivia.i_def(), @class.fun_eq_thm()]))(unflatten_flatten())]))
  let t972 = @tactics.then_tac(@tactics.first_assum(fn(x967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x967
    @tactics.first_assum(fn(x969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let y = x969
      @simp.rewrite_tac(@list.List([@drule.match_mp(@drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.infsum_linear()))(x_1))(y)]))
    })
  }), t971)
  let t966 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def(), @trivia.i_def(), @class.fun_eq_thm()]))(unflatten_flatten())]))
  let t965 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def(), @class.fun_eq_thm()])), @tactics.gen_tac), t965), t966), t972])
  let t964 = @tactics.subgoal_then(@term_syntax.parse_term("o(cvector_flatten, o((h : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N]), (f : (Num) -> Cart[Cart[Real, 2], M]))) == ((n : Num) => o(cvector_flatten, o(h, cvector_unflatten), o(cvector_flatten, f, n)))"), (x963 : @kernel.Thm) => single(@simp.rewrite_tac, x963))
  let t960 = @drule.match_mp(flatten_clinear())
  let t962 = @tactics.pop_assum(fn(x961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s958 = @tactics.assume_tac(x957)
      fn(x959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s958(x959)
      }
    })(t960(x961))
  })
  let t956 = @tactics.repeat_tac(@tactics.strip_tac)
  let t955 = @simp.simp_tac(@list.List([flatten_cinfsum(), csummable_flatten_cvector()]))
  let t954 = @tactics.disch_then(fn(x952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x952
    @tactics.mp_tac(@bool.conj(@drule.match_mp(csummable_linear())(x), x))
  })
  let t974 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t954), t955), t956), t962), t964), t973)
  cinfsum_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, 2], M], ∀ h : (Cart[Cart[Real, 2], M]) -> Cart[Cart[Real, 2], N], ∀ s : (Num) -> Bool, csummable(s, f) && clinear(h) → cinfsum(s, o(h, f)) == h(cinfsum(s, f))"), t974))
}

///|
let cinfsum_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CINFSUM_LINEAR")

///|
/// `CINFSUM_LINEAR`
pub fn cinfsum_linear() -> @kernel.Thm {
  cinfsum_linear_c.get()
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
}
