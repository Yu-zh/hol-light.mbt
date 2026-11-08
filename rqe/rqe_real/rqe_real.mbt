// Translated from upstream Rqe/rqe_real.ml; edit this file directly.

///|
/// real_ty
fn step_1() -> Unit raise {
  real_ty_c.set(@term_syntax.parse_type("Real"))
}

///|
let real_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_ty")

///|
/// `real_ty`
pub fn real_ty() -> @kernel.HolType {
  real_ty_c.get()
}

///|
/// rx
fn step_2() -> Unit raise {
  rx_c.set(@term_syntax.parse_term("(x : Real)"))
}

///|
let rx_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rx")

///|
/// `rx`
pub fn rx() -> @kernel.Term {
  rx_c.get()
}

///|
/// ry
fn step_3() -> Unit raise {
  ry_c.set(@term_syntax.parse_term("(y : Real)"))
}

///|
let ry_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ry")

///|
/// `ry`
pub fn ry() -> @kernel.Term {
  ry_c.get()
}

///|
/// rz
fn step_4() -> Unit raise {
  rz_c.set(@term_syntax.parse_term("(z : Real)"))
}

///|
let rz_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rz")

///|
/// `rz`
pub fn rz() -> @kernel.Term {
  rz_c.get()
}

///|
/// rzero
fn step_5() -> Unit raise {
  rzero_v1_c.set(@term_syntax.parse_term("real_of_num(0)"))
}

///|
let rzero_v1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rzero")

///|
/// `rzero`
pub fn rzero_v1() -> @kernel.Term {
  rzero_v1_c.get()
}

///|
/// req
fn step_6() -> Unit raise {
  req_c.set(@term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)"))
}

///|
let req_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("req")

///|
/// `req`
pub fn req() -> @kernel.Term {
  req_c.get()
}

///|
/// rneq
fn step_7() -> Unit raise {
  rneq_c.set(@term_syntax.parse_term("(op_lt_gt : (Real, Real) -> Bool)"))
}

///|
let rneq_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rneq")

///|
/// `rneq`
pub fn rneq() -> @kernel.Term {
  rneq_c.get()
}

///|
/// rlt
fn step_8() -> Unit raise {
  rlt_c.set(@term_syntax.parse_term("real_lt"))
}

///|
let rlt_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rlt")

///|
/// `rlt`
pub fn rlt() -> @kernel.Term {
  rlt_c.get()
}

///|
/// rgt
fn step_9() -> Unit raise {
  rgt_c.set(@term_syntax.parse_term("real_gt"))
}

///|
let rgt_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rgt")

///|
/// `rgt`
pub fn rgt() -> @kernel.Term {
  rgt_c.get()
}

///|
/// rle
fn step_10() -> Unit raise {
  rle_c.set(@term_syntax.parse_term("real_le"))
}

///|
let rle_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rle")

///|
/// `rle`
pub fn rle() -> @kernel.Term {
  rle_c.get()
}

///|
/// rge
fn step_11() -> Unit raise {
  rge_c.set(@term_syntax.parse_term("real_ge"))
}

///|
let rge_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rge")

///|
/// `rge`
pub fn rge() -> @kernel.Term {
  rge_c.get()
}

///|
/// rm
fn step_12() -> Unit raise {
  rm_c.set(@term_syntax.parse_term("real_mul"))
}

///|
let rm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rm")

///|
/// `rm`
pub fn rm() -> @kernel.Term {
  rm_c.get()
}

///|
/// rs
fn step_13() -> Unit raise {
  rs_c.set(@term_syntax.parse_term("real_sub"))
}

///|
let rs_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rs")

///|
/// `rs`
pub fn rs() -> @kernel.Term {
  rs_c.get()
}

///|
/// rn
fn step_14() -> Unit raise {
  rn_c.set(@term_syntax.parse_term("real_neg"))
}

///|
let rn_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rn")

///|
/// `rn`
pub fn rn() -> @kernel.Term {
  rn_c.get()
}

///|
/// rd
fn step_15() -> Unit raise {
  rd_c.set(@term_syntax.parse_term("op_slash"))
}

///|
let rd_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rd")

///|
/// `rd`
pub fn rd() -> @kernel.Term {
  rd_c.get()
}

///|
/// rp
fn step_16() -> Unit raise {
  rp_c.set(@term_syntax.parse_term("real_add"))
}

///|
let rp_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rp")

///|
/// `rp`
pub fn rp() -> @kernel.Term {
  rp_c.get()
}

///|
/// rzero
fn step_17() -> Unit raise {
  rzero_c.set(@term_syntax.parse_term("real_of_num(0)"))
}

///|
let rzero_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rzero")

///|
/// `rzero`
pub fn rzero() -> @kernel.Term {
  rzero_c.get()
}

///|
/// rone
fn step_18() -> Unit raise {
  rone_c.set(@term_syntax.parse_term("real_of_num(1)"))
}

///|
let rone_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rone")

///|
/// `rone`
pub fn rone() -> @kernel.Term {
  rone_c.get()
}

///|
/// rlast
fn step_19() -> Unit raise {
  rlast_c.set(@term_syntax.parse_term("(LAST : (List[Real]) -> Real)"))
}

///|
let rlast_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rlast")

///|
/// `rlast`
pub fn rlast() -> @kernel.Term {
  rlast_c.get()
}

///|
/// rappend
fn step_20() -> Unit raise {
  rappend_c.set(@term_syntax.parse_term("(APPEND : (List[Real], List[Real]) -> List[Real])"))
}

///|
let rappend_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rappend")

///|
/// `rappend`
pub fn rappend() -> @kernel.Term {
  rappend_c.get()
}

///|
/// `mk_rlist`
pub fn mk_rlist(x1 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let l = x1
  @lists.mk_list(l, real_ty())
}

///|
/// diffl_tm
fn step_21() -> Unit raise {
  diffl_tm_c.set(@term_syntax.parse_term("diffl"))
}

///|
let diffl_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("diffl_tm")

///|
/// `diffl_tm`
pub fn diffl_tm() -> @kernel.Term {
  diffl_tm_c.get()
}

///|
/// `dest_diffl`
pub fn dest_diffl(x2 : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  let tm = x2
  try {
    let (l, var_) = @kernel.dest_comb(tm)
    let (dp, p_p) = @kernel.dest_comb(l)
    let (d, p) = @kernel.dest_comb(dp)
    if !((d == diffl_tm())) {
      raise Failure("dest_diffl: not a diffl")
    } else {
      let (_, bod) = @kernel.dest_abs(p)
      (bod, p_p)
    }
  } catch {
    _ => raise Failure("dest_diffl")
  }
}

///|
/// dest_mult
fn step_22() -> Unit raise {
  dest_mult_c.set(try {
    (x3 : @kernel.Term) => @basics.dest_binop(rm(), x3)
  } catch {
    _ => raise Failure("dest_mult")
  })
}

///|
let dest_mult_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_mult")

///|
/// `dest_mult`
pub fn dest_mult(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_mult_c.get())(x)
}

///|
/// mk_mult
fn step_23() -> Unit raise {
  mk_mult_c.set(fn(x6 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x7 : @kernel.Term) -> @kernel.Term raise {
      ((x4 : @kernel.Term, x5 : @kernel.Term) => @basics.mk_binop(rm(), x4, x5))(x6, x7)
    }
  })
}

///|
let mk_mult_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("mk_mult")

///|
/// `mk_mult`
pub fn mk_mult(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (mk_mult_c.get())(x)
}

///|
/// pow_tm
fn step_24() -> Unit raise {
  pow_tm_c.set(@term_syntax.parse_term("real_pow"))
}

///|
let pow_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pow_tm")

///|
/// `pow_tm`
pub fn pow_tm() -> @kernel.Term {
  pow_tm_c.get()
}

///|
/// dest_pow
fn step_25() -> Unit raise {
  dest_pow_c.set(try {
    (x8 : @kernel.Term) => @basics.dest_binop(pow_tm(), x8)
  } catch {
    _ => raise Failure("dest_pow")
  })
}

///|
let dest_pow_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_pow")

///|
/// `dest_pow`
pub fn dest_pow(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_pow_c.get())(x)
}

///|
/// mk_plus
fn step_26() -> Unit raise {
  mk_plus_c.set(fn(x11 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x12 : @kernel.Term) -> @kernel.Term raise {
      ((x9 : @kernel.Term, x10 : @kernel.Term) => @basics.mk_binop(rp(), x9, x10))(x11, x12)
    }
  })
}

///|
let mk_plus_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("mk_plus")

///|
/// `mk_plus`
pub fn mk_plus(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (mk_plus_c.get())(x)
}

///|
/// mk_negative
fn step_27() -> Unit raise {
  mk_negative_c.set((x14 : @kernel.Term) => @lib.curry(fn(x13 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    @kernel.mk_comb(x13.0, x13.1)
  }, rn(), x14))
}

///|
let mk_negative_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("mk_negative")

///|
/// `mk_negative`
pub fn mk_negative(x : @kernel.Term) -> @kernel.Term raise {
  (mk_negative_c.get())(x)
}

///|
/// dest_plus
fn step_28() -> Unit raise {
  dest_plus_c.set(try {
    (x15 : @kernel.Term) => @basics.dest_binop(rp(), x15)
  } catch {
    _ => raise Failure("dest_plus")
  })
}

///|
let dest_plus_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_plus")

///|
/// `dest_plus`
pub fn dest_plus(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_plus_c.get())(x)
}

///|
/// REAL_DENSE
fn step_29() -> Unit raise {
  let t47 = @tactics.first_assum(fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.match_accept_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  })
  let t43 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_sub())]))
  let t42 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_add_assoc()), @calc_int.real_add_rinv(), @calc_int.real_add_rid()]))
  let t38 = @term_syntax.parse_term("-(x : Real)")
  let t39 = @term_syntax.parse_term("(z : Real)")
  let t40 = @bool.ispecl(@list.List([@term_syntax.parse_term("(y : Real)"), t39, t38]), @analysis.real_lt_radd())
  let t41 = @bool.gen(@term_syntax.parse_term("(z : Real)"), t40)
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@rqe_tactics_ext.match_eq_mp_tac(@bool.gen(@term_syntax.parse_term("(y : Real)"), t41)), t42), t43), t47)
  let t36 = @tactics.first_assum(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.match_accept_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  })
  let t37 = @list.List([@tactics.match_accept_tac(@analysis.real_le_refl()), t36])
  let t32 = @tactics.match_mp_tac(@real.real_let_add2())
  let t31 = @tactics.conv_tac(@equal.land_conv(@simp.once_rewrite_conv(@list.List([@equal.gsym(@calc_int.real_add_rid())]))))
  let t49 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t31), t32), @tactics.strip_tac), t37), t48])
  let t30 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(e : Real) + (x : Real)"))
  let t29 = @tactics.pop_assum(fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s27 = @tactics.mp_tac(x26)
    fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s27(x28)
    }
  })
  let t24 = @drule.match_mp(@real.real_down())
  let t50 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s22 = @tactics.assume_tac(x21)
      fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s22(x23)
      }
    })(t24(x25))
  }), t29), @tactics.strip_tac), t30), @tactics.strip_tac), t49)
  let t20 = @tactics.pop_assum(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s18 = @tactics.match_accept_tac(x17)
    fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s18(x19)
    }
  })
  let t51 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@analysis.real_lt_sub_ladd(), @realax.real_add_lid()])), t20), t50])
  let t16 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) < (y : Real) - (x : Real)"))
  let t52 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t16), t51)
  real_dense_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → (∃ z : Real, x < z && z < y)"), t52))
}

///|
let real_dense_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DENSE")

///|
/// `REAL_DENSE`
pub fn real_dense() -> @kernel.Thm {
  real_dense_c.get()
}

///|
/// REAL_LT_EXISTS
fn step_30() -> Unit raise {
  let t53 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(x : Real) + real_of_num(1)"))), @calc_rat.real_arith_tac)
  real_lt_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ y : Real, x < y"), t53))
}

///|
let real_lt_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_EXISTS")

///|
/// `REAL_LT_EXISTS`
pub fn real_lt_exists() -> @kernel.Thm {
  real_lt_exists_c.get()
}

///|
/// REAL_GT_EXISTS
fn step_31() -> Unit raise {
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(x : Real) - real_of_num(1)"))), @calc_rat.real_arith_tac)
  real_gt_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ y : Real, y < x"), t54))
}

///|
let real_gt_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_GT_EXISTS")

///|
/// `REAL_GT_EXISTS`
pub fn real_gt_exists() -> @kernel.Thm {
  real_gt_exists_c.get()
}

///|
/// REAL_DIV_DISTRIB_L
fn step_32() -> Unit raise {
  let t55 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()])), @calc_rat.real_arith_tac])
  real_div_distrib_l_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x / (y * z) == x / y * (real_of_num(1) / z)"), t55))
}

///|
let real_div_distrib_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_DISTRIB_L")

///|
/// `REAL_DIV_DISTRIB_L`
pub fn real_div_distrib_l() -> @kernel.Thm {
  real_div_distrib_l_c.get()
}

///|
/// REAL_DIV_DISTRIB_R
fn step_33() -> Unit raise {
  let t56 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()])), @calc_rat.real_arith_tac])
  real_div_distrib_r_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x / (y * z) == real_of_num(1) / y * (x / z)"), t56))
}

///|
let real_div_distrib_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_DISTRIB_R")

///|
/// `REAL_DIV_DISTRIB_R`
pub fn real_div_distrib_r() -> @kernel.Thm {
  real_div_distrib_r_c.get()
}

///|
/// REAL_DIV_DISTRIB_2
fn step_34() -> Unit raise {
  let t57 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()])), @calc_rat.real_arith_tac])
  real_div_distrib_2_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x * (w : Real) / (y * z) == x / y * (w / z)"), t57))
}

///|
let real_div_distrib_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_DISTRIB_2")

///|
/// `REAL_DIV_DISTRIB_2`
pub fn real_div_distrib_2() -> @kernel.Thm {
  real_div_distrib_2_c.get()
}

///|
/// REAL_DIV_ADD_DISTRIB
fn step_35() -> Unit raise {
  let t58 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()])), @calc_rat.real_arith_tac])
  real_div_add_distrib_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y) / z == x / z + y / z"), t58))
}

///|
let real_div_add_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_ADD_DISTRIB")

///|
/// `REAL_DIV_ADD_DISTRIB`
pub fn real_div_add_distrib() -> @kernel.Thm {
  real_div_add_distrib_c.get()
}

///|
/// DIV_ID
fn step_36() -> Unit raise {
  let t59 = @meson.asm_meson_tac(@list.List([@realax.real_mul_linv(), @realax.real_mul_sym()]))
  let t60 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t61 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), t60, t59])
  div_id_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) → x / x == real_of_num(1)"), t61))
}

///|
let div_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ID")

///|
/// `DIV_ID`
pub fn div_id() -> @kernel.Thm {
  div_id_c.get()
}

///|
/// POS_POW
fn step_37() -> Unit raise {
  let t62 = @list.List([@meson.meson_tac(@list.List([@real.real_pow_lt(), @real.real_lt_mul()]))])
  pos_pow_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ c : Real, ∀ x : Real, real_of_num(0) < c && real_of_num(0) < x → real_of_num(0) < c * pow(x, (k : Num))"), t62))
}

///|
let pos_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POS_POW")

///|
/// `POS_POW`
pub fn pos_pow() -> @kernel.Thm {
  pos_pow_c.get()
}

///|
/// POS_NAT_POW
fn step_38() -> Unit raise {
  let t63 = @list.List([@meson.meson_tac(@list.List([@real.real_pow_lt(), @real.real_lt_mul(), @analysis.real_lt()]))])
  pos_nat_pow_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ c : Real, ∀ n : Num, 0 < n && real_of_num(0) < c → real_of_num(0) < c * pow(real_of_num(n), (k : Num))"), t63))
}

///|
let pos_nat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POS_NAT_POW")

///|
/// `POS_NAT_POW`
pub fn pos_nat_pow() -> @kernel.Thm {
  pos_nat_pow_c.get()
}

///|
/// REAL_NUM_LE_0
fn step_39() -> Unit raise {
  let t64 = @list.List([@nums.induct_tac, @calc_rat.real_arith_tac, @simp.rewrite_tac(@list.List([@analysis.real()])), @calc_rat.real_arith_tac])
  real_num_le_0_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ n : Num, real_of_num(0) <= real_of_num(n)"), t64))
}

///|
let real_num_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NUM_LE_0")

///|
/// `REAL_NUM_LE_0`
pub fn real_num_le_0() -> @kernel.Thm {
  real_num_le_0_c.get()
}

///|
/// REAL_ARCH_SIMPLE_LT
fn step_40() -> Unit raise {
  let t72 = @tactics.then_tac(@tactics.pop_assum(fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = @tactics.mp_tac(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  }), @calc_rat.real_arith_tac)
  let t73 = @simp.rewrite_tac(@list.List([@analysis.real()]))
  let t74 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t68 = @bool.ispec(@term_syntax.parse_term("(x : Real)"), @analysis.real_arch_simple())
  let t75 = @list.List([@tactics.strip_tac, @tactics.choose_then(fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.assume_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  })(t68), t74, t73, t72])
  real_arch_simple_lt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∃ n : Num, x < real_of_num(n)"), t75))
}

///|
let real_arch_simple_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_SIMPLE_LT")

///|
/// `REAL_ARCH_SIMPLE_LT`
pub fn real_arch_simple_lt() -> @kernel.Thm {
  real_arch_simple_lt_c.get()
}

///|
/// BINOMIAL_LEMMA_LT
fn step_41() -> Unit raise {
  let t98 = @tactics.first_assum(fn(x95 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s96 = @tactics.match_accept_tac(x95)
    fn(x97 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s96(x97)
    }
  })
  let t99 = @tactics.then_tac(@tactics.every_assum(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s93 = @tactics.mp_tac(x92)
    fn(x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s93(x94)
    }
  }), @calc_rat.real_arith_tac)
  let t100 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t101 = @tactics.first_assum(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s90 = @tactics.match_accept_tac(x89)
    fn(x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s90(x91)
    }
  })
  let t102 = @tactics.match_mp_tac(@real.real_pow_lt())
  let t103 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (y : Real) → x <= y")))
  let t104 = @tactics.first_assum(fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_3 = x87
    @tactics.then_tac(@tactics.mp_tac(x_3), @calc_rat.real_arith_tac)
  })
  let t105 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t106 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) → (x : Real) <= y + x")))
  let t107 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t108 = @tactics.first_assum(fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_2 = x85
    @tactics.then_tac(@tactics.mp_tac(x_2), @int.arith_tac)
  })
  let t109 = @tactics.match_mp_tac(@real.real_pow_le())
  let t110 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) → (x : Real) <= x + y")))
  let t111 = @tactics.first_assum(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x83
    @tactics.then_tac(@tactics.mp_tac(x_1), @int.arith_tac)
  })
  let t112 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t113 = @tactics.match_mp_tac(@real.real_le_add2())
  let t114 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib()]))
  let t115 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("((x : Real) + (y : Real)) * (pow(x, (n : Num)) + pow(y, n))"))
  let t116 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t117 = @tactics.disch_then(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x79
    @tactics.first_assum(fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let y = x81
      @tactics.assume_tac(@drule.match_mp(y)(x))
    })
  })
  let t118 = @tactics.then_tac(@tactics.pop_assum(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s77 = @tactics.mp_tac(x76)
    fn(x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s77(x78)
    }
  }), @int.arith_tac)
  let t119 = @rqe_tactics_ext.claim(@term_syntax.parse_term("0 < (n : Num)"))
  let t120 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow(), @analysis.real_mul_rid(), @analysis.real_le_refl()]))
  let t121 = @rqe_tactics_ext.cases_on(@term_syntax.parse_term("(n : Num) == 0"))
  let t122 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t123 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac, @nums.induct_tac, @int.arith_tac, t122, @tactics.strip_tac, t121, t120, t119, t118, t117, t116, t115, @tactics.strip_tac, t114, t113, @tactics.conj_tac, t112, @tactics.strip_tac, t111, t110, t109, t108, t107, t106, t105, @tactics.conj_tac, t104, t103, t102, t101, t100, @tactics.conj_tac, t99, t98])
  binomial_lemma_lt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) < y → (∀ n : Num, 0 < n → pow(x, n) + pow(y, n) <= pow(x + y, n))"), t123))
}

///|
let binomial_lemma_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIAL_LEMMA_LT")

///|
/// `BINOMIAL_LEMMA_LT`
pub fn binomial_lemma_lt() -> @kernel.Thm {
  binomial_lemma_lt_c.get()
}

///|
/// BINOMIAL_LEMMA
fn step_42() -> Unit raise {
  let t137 = @tactics.then_tac(@tactics.every_assum(fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s135 = @tactics.mp_tac(x134)
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s135(x136)
    }
  }), @calc_rat.real_arith_tac)
  let t138 = @tactics.match_mp_tac(binomial_lemma_lt())
  let t133 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t139 = @tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s131 = @tactics.mp_tac(x130)
    fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s131(x132)
    }
  }), t133), @tactics.strip_tac)
  let t140 = @simp.asm_rewrite_tac(@list.List([@analysis.pow_0(), @realax.real_add_lid(), @calc_int.real_add_rid(), @realax.real_pow(), @analysis.real_le_refl()]))
  let t141 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t142 = @tactics.then_tac(@tactics.pop_assum(fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s128 = @tactics.mp_tac(x127)
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s128(x129)
    }
  }), @int.arith_tac)
  let t143 = @rqe_tactics_ext.claim(@term_syntax.parse_term("(n : Num) == SUC(PRE(n))"))
  let t144 = @tactics.repeat_tac(@tactics.strip_tac)
  let t145 = @simp.asm_rewrite_tac(@list.List([@analysis.pow_0(), @realax.real_add_lid(), @realax.real_pow(), @analysis.real_le_refl()]))
  let t146 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t147 = @tactics.then_tac(@tactics.pop_assum(fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s125 = @tactics.mp_tac(x124)
    fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s125(x126)
    }
  }), @int.arith_tac)
  let t148 = @rqe_tactics_ext.claim(@term_syntax.parse_term("(n : Num) == SUC(PRE(n))"))
  let t149 = @tactics.repeat_tac(@tactics.strip_tac)
  let t150 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow(), @realax.real_add_lid(), @analysis.pow_0()]))
  let t151 = @tactics.pop_assum(@tactics.disj_cases_tac)
  let t152 = @rqe_tactics_ext.cases_on(@term_syntax.parse_term("(x : Real) == real_of_num(0) || (y : Real) == real_of_num(0)"))
  let t153 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac, t152, t151, t150, t149, t148, t147, @tactics.strip_tac, t146, t145, t144, t143, t142, @tactics.strip_tac, t141, t140, t139, t138, t137])
  binomial_lemma_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → (∀ n : Num, 0 < n → pow(x, n) + pow(y, n) <= pow(x + y, n))"), t153))
}

///|
let binomial_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIAL_LEMMA")

///|
/// `BINOMIAL_LEMMA`
pub fn binomial_lemma() -> @kernel.Thm {
  binomial_lemma_c.get()
}

///|
/// NEG_ABS
fn step_43() -> Unit raise {
  neg_abs_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, -abs(x) <= real_of_num(0)"), @list.List([@calc_rat.real_arith_tac])))
}

///|
let neg_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEG_ABS")

///|
/// `NEG_ABS`
pub fn neg_abs() -> @kernel.Thm {
  neg_abs_c.get()
}

///|
/// REAL_MUL_LT
fn step_44() -> Unit raise {
  let t189 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * -(y : Real) == -(x * y)"))]))
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t191 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t192 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) * real_of_num(0) < (x : Real) * -(y : Real)"))
  let t193 = @tactics.then_tac(@tactics.every_assum(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @tactics.mp_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  }), @calc_rat.real_arith_tac)
  let t194 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) < -(y : Real)"))
  let t195 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(y : Real) * (x : Real) == -(y * x)"))]))
  let t196 = @tactics.then_tac(@tactics.every_assum(fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s184 = @tactics.mp_tac(x183)
    fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s184(x185)
    }
  }), @calc_rat.real_arith_tac)
  let t197 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t198 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) * real_of_num(0) < -(x : Real) * (y : Real)"))
  let t199 = @tactics.then_tac(@tactics.every_assum(fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s181 = @tactics.mp_tac(x180)
    fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s181(x182)
    }
  }), @int.arith_tac)
  let t200 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) < -(x : Real)"))
  let t201 = @tactics.repeat_tac(@tactics.strip_tac)
  let t202 = @tactics.then_tac(@tactics.every_assum(fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s178 = @tactics.mp_tac(x177)
    fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s178(x179)
    }
  }), @int.arith_tac)
  let t203 = @simp.asm_rewrite_tac(@list.List([]))
  let t204 = @rqe_tactics_ext.rewrite_assums(@rewrites.real_rewrites().val)
  let t205 = @tactics.disch_then(fn(x176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @rqe_tactics_ext.rewrite_assums(@rqe_lib.list(x176))
  })
  let t206 = @tactics.then_tac(@tactics.every_assum(fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s174 = @tactics.mp_tac(x173)
    fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s174(x175)
    }
  }), @calc_rat.real_arith_tac)
  let t207 = @rqe_tactics_ext.claim(@term_syntax.parse_term("(y : Real) == real_of_num(0)"))
  let t208 = @tactics.then_tac(@tactics.every_assum(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s171 = @tactics.mp_tac(x170)
    fn(x172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s171(x172)
    }
  }), @calc_rat.real_arith_tac)
  let t209 = @tactics.then_tac(@tactics.every_assum(fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s168 = @tactics.mp_tac(x167)
    fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s168(x169)
    }
  }), @calc_rat.real_arith_tac)
  let t210 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t211 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) * real_of_num(0) <= -(x : Real) * -(y : Real)"))
  let t212 = @tactics.then_tac(@tactics.every_assum(fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s165 = @tactics.mp_tac(x164)
    fn(x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s165(x166)
    }
  }), @calc_rat.real_arith_tac)
  let t213 = @tactics.then_tac(@tactics.every_assum(fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s162 = @tactics.mp_tac(x161)
    fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s162(x163)
    }
  }), @calc_rat.real_arith_tac)
  let t214 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t215 = @rqe_tactics_ext.claim(@term_syntax.parse_term("real_of_num(0) * real_of_num(0) <= (x : Real) * (y : Real)"))
  let t216 = @meson.asm_meson_tac(@rewrites.real_rewrites().val)
  let t217 = @rqe_tactics_ext.rewrite_assums(@rewrites.real_rewrites().val)
  let t218 = @tactics.disch_then(fn(x160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @rqe_tactics_ext.rewrite_assums(@rqe_lib.list(x160))
  })
  let t219 = @tactics.then_tac(@tactics.every_assum(fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s158 = @tactics.mp_tac(x157)
    fn(x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s158(x159)
    }
  }), @calc_rat.real_arith_tac)
  let t220 = @rqe_tactics_ext.claim(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t221 = @tactics.then_tac(@tactics.pop_assum(fn(x154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s155 = @tactics.mp_tac(x154)
    fn(x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s155(x156)
    }
  }), @tactics.strip_tac)
  let t222 = @rqe_tactics_ext.rewrite_assums((@list.List([@analysis.real_not_lt(), @class.de_morgan_thm()])).concat(@rewrites.real_rewrites().val))
  let t223 = @tactics.repeat_tac(@tactics.strip_tac)
  let t224 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac, t223, @rqe_tactics_ext.ccontr_tac, t222, t221, t220, t219, t218, t217, t216, t215, t214, t213, @rewrites.real_simp_tac, t212, t211, t210, @rewrites.real_simp_tac, t209, @rewrites.real_simp_tac, t208, t207, t206, t205, t204, t203, t202, t201, t200, t199, @tactics.strip_tac, t198, t197, @rewrites.real_simp_tac, t196, @rewrites.real_simp_tac, t195, @calc_rat.real_arith_tac, t194, t193, @tactics.strip_tac, t192, t191, @rewrites.real_simp_tac, t190, @rewrites.real_simp_tac, t189, @calc_rat.real_arith_tac])
  real_mul_lt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x * y < real_of_num(0)) == (x < real_of_num(0) && real_of_num(0) < y || real_of_num(0) < x && y < real_of_num(0))"), t224))
}

///|
let real_mul_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_LT")

///|
/// `REAL_MUL_LT`
pub fn real_mul_lt() -> @kernel.Thm {
  real_mul_lt_c.get()
}

///|
/// REAL_MUL_GT
fn step_45() -> Unit raise {
  let t241 = @tactics.then_tac(@tactics.every_assum(fn(x238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s239 = @tactics.mp_tac(x238)
    fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s239(x240)
    }
  }), @calc_rat.real_arith_tac)
  let t242 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t243 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("real_of_num(0) == real_of_num(0) * real_of_num(0)"))]))
  let t244 = @tactics.then_tac(@tactics.every_assum(fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  }), @calc_rat.real_arith_tac)
  let t245 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t246 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("real_of_num(0) == real_of_num(0) * real_of_num(0)"))]))
  let t247 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Real) * (y : Real) == -x * -y"))]))
  let t248 = @tactics.repeat_tac(@tactics.strip_tac)
  let t249 = @tactics.then_tac(@tactics.every_assum(fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s233 = @tactics.mp_tac(x232)
    fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s233(x234)
    }
  }), @calc_rat.real_arith_tac)
  let t250 = @tactics.then_tac(@tactics.every_assum(fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s230 = @tactics.mp_tac(x229)
    fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s230(x231)
    }
  }), @calc_rat.real_arith_tac)
  let t228 = @tactics.repeat_tac(@tactics.strip_tac)
  let t251 = @tactics.then_tac(@tactics.pop_assum(fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s226 = @tactics.mp_tac(x225)
    fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s226(x227)
    }
  }), t228)
  let t252 = @rqe_tactics_ext.rewrite_assums(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-real_of_num(0) == real_of_num(0)")), real_mul_lt()]))
  let t253 = @rqe_tactics_ext.rewrite_assums(@list.List([@equal.gsym(@calc_int.real_mul_rneg())]))
  let t254 = @rqe_tactics_ext.once_rewrite_assums(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Real) < (y : Real)) == (-y < -x)"))]))
  let t255 = @tactics.repeat_tac(@tactics.strip_tac)
  let t256 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac, t255, t254, t253, t252, t251, @tactics.disj1_tac, t250, t249, t248, t247, t246, t245, t244, t243, t242, t241])
  real_mul_gt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) < x * y) == (x < real_of_num(0) && y < real_of_num(0) || real_of_num(0) < x && real_of_num(0) < y)"), t256))
}

///|
let real_mul_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_GT")

///|
/// `REAL_MUL_GT`
pub fn real_mul_gt() -> @kernel.Thm {
  real_mul_gt_c.get()
}

///|
/// REAL_DIV_INV
fn step_46() -> Unit raise {
  let t257 = @meson.asm_meson_tac(@list.List([]))
  let t258 = @tactics.match_mp_tac(@real.real_lt_inv2())
  let t259 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t260 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), t259, @rewrites.real_simp_tac, t258, t257])
  real_div_inv_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ y : Real, ∀ z : Real, real_of_num(0) < y && y < z → real_of_num(1) / z < real_of_num(1) / y"), t260))
}

///|
let real_div_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_INV")

///|
/// `REAL_DIV_INV`
pub fn real_div_inv() -> @kernel.Thm {
  real_div_inv_c.get()
}

///|
/// REAL_DIV_DENOM_LT
fn step_47() -> Unit raise {
  let t261 = @meson.asm_meson_tac(@list.List([]))
  let t262 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@realax.real_mul_lid(), @realax.real_div()]))(real_div_inv()))
  let t263 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_nz(), @realax.real_mul_assoc(), @realax.real_mul_linv()]))
  let t264 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t265 = @tactics.repeat_tac(@tactics.strip_tac)
  let t266 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("inv((x : Real))"))
  let t267 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t268 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), t267, t266, t265, @rewrites.real_solve_tac, t264, t263, @rewrites.real_simp_tac, t262, t261])
  real_div_denom_lt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < x && real_of_num(0) < y && y < z → x / z < x / y"), t268))
}

///|
let real_div_denom_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_DENOM_LT")

///|
/// `REAL_DIV_DENOM_LT`
pub fn real_div_denom_lt() -> @kernel.Thm {
  real_div_denom_lt_c.get()
}

///|
/// REAL_DIV_DENOM_LE
fn step_48() -> Unit raise {
  let t269 = @simp.asm_rewrite_tac(@list.List([]))
  let t270 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t271 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_nz(), @realax.real_mul_assoc(), @realax.real_mul_linv()]))
  let t272 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t273 = @meson.asm_meson_tac(@list.List([@analysis.real_lt_le()]))
  let t274 = @tactics.match_mp_tac(@real.real_lt_inv())
  let t275 = @tactics.repeat_tac(@tactics.strip_tac)
  let t276 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("inv((x : Real))"))
  let t277 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t278 = @simp.rewrite_tac(@list.List([@realax.real_div(), @analysis.real_mul_lzero(), @analysis.real_le_refl()]))
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t280 = @rqe_tactics_ext.cases_on(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t281 = @list.List([@tactics.repeat_tac(@tactics.strip_tac), t280, t279, t278, t277, t276, t275, t274, t273, t272, t271, @rewrites.real_simp_tac, t270, t269])
  real_div_denom_le_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= x && real_of_num(0) < y && y <= z → x / z <= x / y"), t281))
}

///|
let real_div_denom_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_DENOM_LE")

///|
/// `REAL_DIV_DENOM_LE`
pub fn real_div_denom_le() -> @kernel.Thm {
  real_div_denom_le_c.get()
}

///|
/// REAL_NEG_DIV
fn step_49() -> Unit raise {
  let t282 = @simp.rewrite_tac(@list.List([@real.real_inv_neg()]))
  let t283 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_div()])), t282, @calc_rat.real_arith_tac])
  real_neg_div_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x / -y == x / y"), t283))
}

///|
let real_neg_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_DIV")

///|
/// `REAL_NEG_DIV`
pub fn real_neg_div() -> @kernel.Thm {
  real_neg_div_c.get()
}

///|
/// REAL_GT_IMP_NZ
fn step_50() -> Unit raise {
  real_gt_imp_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, x < real_of_num(0) → !(x == real_of_num(0))"), @calc_rat.real_arith_tac))
}

///|
let real_gt_imp_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_GT_IMP_NZ")

///|
/// `REAL_GT_IMP_NZ`
pub fn real_gt_imp_nz() -> @kernel.Thm {
  real_gt_imp_nz_c.get()
}

///|
/// REAL_NEG_NZ
fn step_51() -> Unit raise {
  real_neg_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, x < real_of_num(0) → !(x == real_of_num(0))"), @calc_rat.real_arith_tac))
}

///|
let real_neg_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_NZ")

///|
/// `REAL_NEG_NZ`
pub fn real_neg_nz() -> @kernel.Thm {
  real_neg_nz_c.get()
}

///|
/// PARITY_POW_LT
fn step_52() -> Unit raise {
  let t287 = @meson.asm_meson_tac(@list.List([@arith.even_and_odd()]))
  let t288 = @meson.asm_meson_tac(@list.List([]))
  let t289 = @tactics.repeat_tac(@tactics.strip_tac)
  let t290 = @simp.asm_rewrite_tac(@list.List([@realax.real_gt(), real_mul_lt(), real_mul_gt()]))
  let t291 = @simp.asm_rewrite_tac(@list.List([]))
  let t292 = @meson.asm_meson_tac(@list.List([@realax.real_gt()]))
  let t293 = @simp.asm_rewrite_tac(@list.List([@realax.real_gt(), real_mul_lt()]))
  let t294 = @meson.asm_meson_tac(@list.List([@arith.even_and_odd()]))
  let t295 = @simp.asm_rewrite_tac(@list.List([@realax.real_gt(), real_mul_gt()]))
  let t296 = @tactics.repeat_tac(@tactics.strip_tac)
  let t297 = @simp.asm_rewrite_tac(@list.List([]))
  let t298 = @tactics.disj_cases_tac(@bool.ispec(@term_syntax.parse_term("(n : Num)"), @arith.even_or_odd()))
  let t299 = @simp.rewrite_tac(@list.List([@arith.even(), @arith.odd(), @realax.real_pow(), @arith.not_even(), @arith.not_odd()]))
  let t300 = @tactics.disch_then(fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x284
    let t286 = @tactics.assume_tac(x)
    @tactics.then_tac(@rqe_tactics_ext.rewrite_assums(@list.List([x])), t286)
  })
  let t301 = @list.List([@tactics.strip_tac, @nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.even(), @arith.odd(), @realax.real_pow()])), @calc_rat.real_arith_tac, t300, t299, t298, t297, t296, t295, t294, t293, t292, t291, t290, t289, t288, t287])
  parity_pow_lt_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ a : Real, ∀ n : Num, a < real_of_num(0) → (EVEN(n) → pow(a, n) > real_of_num(0)) && (ODD(n) → pow(a, n) < real_of_num(0))"), t301))
}

///|
let parity_pow_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARITY_POW_LT")

///|
/// `PARITY_POW_LT`
pub fn parity_pow_lt() -> @kernel.Thm {
  parity_pow_lt_c.get()
}

///|
/// EVEN_ODD_POW
fn step_53() -> Unit raise {
  let t305 = @simp.asm_rewrite_tac(@list.List([]))
  let t306 = @meson.asm_meson_tac(@list.List([@real.real_pow_lt(), @realax.real_gt()]))
  let t307 = @tactics.then_tac(@tactics.every_assum(fn(x302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s303 = @tactics.mp_tac(x302)
    fn(x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s303(x304)
    }
  }), @calc_rat.real_arith_tac)
  let t308 = @meson.asm_meson_tac(@list.List([@real.real_pow_lt(), @realax.real_gt()]))
  let t309 = @tactics.repeat_tac(@tactics.strip_tac)
  let t310 = @meson.asm_meson_tac(@list.List([@real.real_pow_lt(), @realax.real_gt()]))
  let t311 = @meson.asm_meson_tac(@list.List([parity_pow_lt()]))
  let t312 = @meson.asm_meson_tac(@list.List([parity_pow_lt()]))
  let t313 = @tactics.repeat_tac(@tactics.strip_tac)
  let t314 = @simp.asm_rewrite_tac(@list.List([]))
  let t315 = @rqe_tactics_ext.claim(@term_syntax.parse_term("(a : Real) < real_of_num(0) || a > real_of_num(0) || a == real_of_num(0)"))
  let t316 = @rqe_tactics_ext.repeat_n(2L, @tactics.strip_tac)
  let t317 = @list.List([@simp.rewrite_tac(@list.List([@basic.neq()])), t316, t315, @calc_rat.real_arith_tac, t314, @tactics.strip_tac, t313, t312, t311, t310, t309, t308, t307, t306, t305])
  even_odd_pow_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ a : Real, ∀ n : Num, op_lt_gt(a, real_of_num(0)) → (EVEN(n) → pow(a, n) > real_of_num(0)) && (ODD(n) → a < real_of_num(0) → pow(a, n) < real_of_num(0)) && (ODD(n) → a > real_of_num(0) → pow(a, n) > real_of_num(0))"), t317))
}

///|
let even_odd_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_ODD_POW")

///|
/// `EVEN_ODD_POW`
pub fn even_odd_pow() -> @kernel.Thm {
  even_odd_pow_c.get()
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
}
