// Translated from upstream Quaternions/qcalc.hl; edit this file directly.

///|
/// `dest_quat`
pub fn dest_quat(x1 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let tm = x1
  let quat_tm = @term_syntax.parse_term("quat")
  let (f, p) = @kernel.dest_comb(tm)
  if (f != quat_tm) {
    raise Failure("dest_quat")
  } else {
    let (tm1, p1) = @pair.dest_pair(p)
    let (tm2, p2) = @pair.dest_pair(p1)
    let (tm3, tm4) = @pair.dest_pair(p2)
    (tm1, tm2, tm3, tm4)
  }
}

///|
/// CNJ_QUAT
fn step_1() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), @quaternion.quat_cnj_components(), @quaternion.quat_components()]))
  cnj_quat_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, quat_cnj(quat((x, y, z, w))) == quat((x, -y, -z, -w))"), t2))
}

///|
let cnj_quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_QUAT")

///|
/// `CNJ_QUAT`
pub fn cnj_quat() -> @kernel.Thm {
  cnj_quat_c.get()
}

///|
/// `QUAT_COMPONENTS_CONV`
pub fn quat_components_conv(x3 : (@kernel.Term) -> @kernel.Thm raise) -> @equal.Conv raise {
  let conv = x3
  let t5 = @equal.rand_conv(@equal.binop_conv(conv))
  let t6 = @equal.rand_conv(@equal.thenc(@equal.land_conv(conv), t5))
  @equal.rand_conv(@equal.thenc(@equal.land_conv(conv), t6))
}

///|
/// RAT_QUAT_EQ_CONV
fn step_2() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([@quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_eq = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ y1 : Real, ∀ y2 : Real, ∀ y3 : Real, ∀ y4 : Real, (quat((x1, x2, x3, x4)) == quat((y1, y2, y3, y4))) == (x1 == y1 && x2 == y2 && x3 == y3 && x4 == y4)"), t7)
  let (th1, th2) = @bool.conj_pair(@class.taut(@term_syntax.parse_term("(false && (p : Bool)) == false && (true && p) == p")))
  let t8 = @simp.rewr_conv(th2)
  let (c1, c2) = (@simp.rewr_conv(th1), t8)
  let t10 = @equal.orelsec(c1, @equal.thenc(c2, @calc_rat.real_rat_eq_conv))
  let t11 = @equal.orelsec(c1, @equal.thenc(@equal.thenc(c2, @equal.land_conv(@calc_rat.real_rat_eq_conv)), t10))
  let t12 = @equal.orelsec(c1, @equal.thenc(@equal.thenc(c2, @equal.land_conv(@calc_rat.real_rat_eq_conv)), t11))
  let t9 = @equal.land_conv(@calc_rat.real_rat_eq_conv)
  rat_quat_eq_conv_c.set(@equal.thenc(@equal.thenc(@simp.rewr_conv(qth_eq), t9), t12))
}

///|
let rat_quat_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_EQ_CONV")

///|
/// `RAT_QUAT_EQ_CONV`
pub fn rat_quat_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_eq_conv_c.get())(x)
}

///|
/// RAT_QUAT_ADD_CONV
fn step_3() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([@quaternion.quat_add(), @quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_add = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ y1 : Real, ∀ y2 : Real, ∀ y3 : Real, ∀ y4 : Real, quat((x1, x2, x3, x4)) + quat((y1, y2, y3, y4)) == quat((x1 + y1, x2 + y2, x3 + y3, x4 + y4))"), t13)
  let t14 = quat_components_conv(@calc_rat.real_rat_add_conv)
  rat_quat_add_conv_c.set(@equal.thenc(@simp.rewr_conv(qth_add), t14))
}

///|
let rat_quat_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_ADD_CONV")

///|
/// `RAT_QUAT_ADD_CONV`
pub fn rat_quat_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_add_conv_c.get())(x)
}

///|
/// RAT_QUAT_NEG_CONV
fn step_4() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([@quaternion.quat_neg(), @quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_neg = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, -quat((x1, x2, x3, x4)) == quat((-x1, -x2, -x3, -x4))"), t15)
  let t16 = quat_components_conv(@calc_rat.real_rat_neg_conv)
  rat_quat_neg_conv_c.set(@equal.thenc(@simp.rewr_conv(qth_neg), t16))
}

///|
let rat_quat_neg_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_NEG_CONV")

///|
/// `RAT_QUAT_NEG_CONV`
pub fn rat_quat_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_neg_conv_c.get())(x)
}

///|
/// RAT_QUAT_SUB_CONV
fn step_5() -> Unit raise {
  let t17 = @simp.rewrite_tac(@list.List([@quaternion.quat_sub(), @quaternion.quat_neg(), @quaternion.quat_add(), @realax.real_sub(), @quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_sub = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ y1 : Real, ∀ y2 : Real, ∀ y3 : Real, ∀ y4 : Real, quat((x1, x2, x3, x4)) - quat((y1, y2, y3, y4)) == quat((x1 - y1, x2 - y2, x3 - y3, x4 - y4))"), t17)
  let t18 = quat_components_conv(@calc_rat.real_rat_sub_conv)
  rat_quat_sub_conv_c.set(@equal.thenc(@simp.rewr_conv(qth_sub), t18))
}

///|
let rat_quat_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_SUB_CONV")

///|
/// `RAT_QUAT_SUB_CONV`
pub fn rat_quat_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_sub_conv_c.get())(x)
}

///|
/// RAT_QUAT_MUL_CONV
fn step_6() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([@quaternion.quat_mul(), @quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_mul = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ y1 : Real, ∀ y2 : Real, ∀ y3 : Real, ∀ y4 : Real, quat_mul(quat((x1, x2, x3, x4)), quat((y1, y2, y3, y4))) == quat((x1 * y1 - x2 * y2 - x3 * y3 - x4 * y4, x1 * y2 + (x2 * y1 + (x3 * y4 - x4 * y3)), x1 * y3 - x2 * y4 + (x3 * y1 + x4 * y2), x1 * y4 + (x2 * y3 - x3 * y2 + x4 * y1)))"), t19)
  let t20 = quat_components_conv(@calc_rat.real_rat_reduce_conv)
  rat_quat_mul_conv_c.set(@equal.thenc(@simp.rewr_conv(qth_mul), t20))
}

///|
let rat_quat_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_MUL_CONV")

///|
/// `RAT_QUAT_MUL_CONV`
pub fn rat_quat_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_mul_conv_c.get())(x)
}

///|
/// RAT_QUAT_INV_CONV
fn step_7() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([@quaternion.quat_inv(), @quaternion.quat_eq(), @quaternion.quat_components()]))
  let qth_inv = @tactics.prove(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, quat_inv(quat((x1, x2, x3, x4))) == quat((x1 / (pow(x1, 2) + (pow(x2, 2) + (pow(x3, 2) + pow(x4, 2)))), -x2 / (pow(x1, 2) + (pow(x2, 2) + (pow(x3, 2) + pow(x4, 2)))), -x3 / (pow(x1, 2) + (pow(x2, 2) + (pow(x3, 2) + pow(x4, 2)))), -x4 / (pow(x1, 2) + (pow(x2, 2) + (pow(x3, 2) + pow(x4, 2))))))"), t21)
  let t22 = quat_components_conv(@calc_rat.real_rat_reduce_conv)
  rat_quat_inv_conv_c.set(@equal.thenc(@simp.rewr_conv(qth_inv), t22))
}

///|
let rat_quat_inv_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_INV_CONV")

///|
/// `RAT_QUAT_INV_CONV`
pub fn rat_quat_inv_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_inv_conv_c.get())(x)
}

///|
/// RAT_QUAT_POW_CONV
fn step_8() -> Unit raise {
  let n = @term_syntax.parse_term("(n : Num)")
  let z = @term_syntax.parse_term("_0")
  let x = @term_syntax.parse_term("(x : Cart[Real, 4])")
  let y = @term_syntax.parse_term("(y : Cart[Real, 4])")
  let z_1 = @term_syntax.parse_term("(z : Cart[Real, 4])")
  let t = @term_syntax.parse_term("(t : Cart[Real, 4])")
  let bit0 = @term_syntax.parse_term("BIT0")
  let mul = @term_syntax.parse_term("quat_mul")
  let t29 = @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1(), @quaternion.quat_pow(), @quaternion.quat_pow_add()]))
  let t28 = @tactics.repeat_tac(@tactics.disch_then(fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s25 = @tactics.subst1_tac(x24)
      fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s25(x26)
      }
    })(@equal.gsym(x27))
  }))
  let t23 = @equal.gsym(@quaternion.hx_def())
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), @calc_num.denumeral(@quaternion.quat_pow()), t23])), @tactics.conj_tac), t28), t29)
  let th_pow = @tactics.prove(@term_syntax.parse_term("quat_pow((x : Cart[Real, 4]), NUMERAL((n : Num))) == quat_pow(x, n) && quat_pow(x, _0) == quat((real_of_num(1), real_of_num(0), real_of_num(0), real_of_num(0))) && (quat_pow(x, n) == (y : Cart[Real, 4]) → quat_mul(y, y) == (z : Cart[Real, 4]) → quat_pow(x, BIT0(n)) == z) && (quat_pow(x, n) == y → quat_mul(y, y) == z → quat_mul(x, z) == (t : Cart[Real, 4]) → quat_pow(x, BIT1(n)) == t)"), t30)
  rat_quat_pow_conv_c.set(match @bool.conjuncts_rule(th_pow) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=Empty)))) => {
      let pow = @term_syntax.parse_term("quat_pow")
      let dest_pow : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x31 : @kernel.Term) => @basics.dest_binop(pow, x31)
      fn quat_pow(x32 : @kernel.Term, x33 : @kernel.Term) -> @kernel.Thm raise {
        let l = x32
        let r = x33
        if (r == z) {
          @kernel.inst_rule(@list.List([(l, x)]), pth1)
        } else {
          let (b, r_p) = @kernel.dest_comb(r)
          if (b == bit0) {
            let th1 = quat_pow(l, r_p)
            let tm1 = @kernel.rand(@kernel.concl(th1))
            let th2 = rat_quat_mul_conv(@basics.mk_binop(mul, tm1, tm1))
            let tm2 = @kernel.rand(@kernel.concl(th2))
            @bool.mp(@bool.mp(@kernel.inst_rule(@list.List([(l, x), (r_p, n), (tm1, y), (tm2, z_1)]), pth2), th1), th2)
          } else {
            let th1_1 = quat_pow(l, r_p)
            let tm1_1 = @kernel.rand(@kernel.concl(th1_1))
            let th2_1 = rat_quat_mul_conv(@basics.mk_binop(mul, tm1_1, tm1_1))
            let tm2_1 = @kernel.rand(@kernel.concl(th2_1))
            let th3 = rat_quat_mul_conv(@basics.mk_binop(mul, l, tm2_1))
            let tm3 = @kernel.rand(@kernel.concl(th3))
            @bool.mp(@bool.mp(@bool.mp(@kernel.inst_rule(@list.List([(l, x), (r_p, n), (tm1_1, y), (tm2_1, z_1), (tm3, t)]), pth3), th1_1), th2_1), th3)
          }
        }
      }
      fn(x34 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x34
        let th0 = @simp.rewr_conv(pth0)(tm)
        let (l_1, r_1) = dest_pow(@kernel.rand(@kernel.concl(th0)))
        @kernel.trans(th0, quat_pow(l_1, r_1))
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:110")
  })
}

///|
let rat_quat_pow_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_POW_CONV")

///|
/// `RAT_QUAT_POW_CONV`
pub fn rat_quat_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_pow_conv_c.get())(x)
}

///|
/// RAT_QUAT_CNJ_CONV
fn step_9() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("real_neg")
  let cnj_tm = @term_syntax.parse_term("quat_cnj")
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let y_tm = @term_syntax.parse_term("(y : Real)")
  let y_p_tm = @term_syntax.parse_term("(y' : Real)")
  let z_tm = @term_syntax.parse_term("(z : Real)")
  let z_p_tm = @term_syntax.parse_term("(z' : Real)")
  let w_tm = @term_syntax.parse_term("(w : Real)")
  let w_p_tm = @term_syntax.parse_term("(w' : Real)")
  let t35 = @simp.simp_tac(@list.List([cnj_quat()]))
  let cnj_th = @tactics.prove(@term_syntax.parse_term("-(y : Real) == (y' : Real) → -(z : Real) == (z' : Real) → -(w : Real) == (w' : Real) → quat_cnj(quat(((x : Real), y, z, w))) == quat((x, y', z', w'))"), t35)
  rat_quat_cnj_conv_c.set(fn(x36 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x36
    let (op, q) = @kernel.dest_comb(tm)
    if (op != cnj_tm) {
      raise Failure("RAT_QUAT_CNJ_CONV")
    } else {
      let (x, y, z, w) = dest_quat(q)
      let yth = @calc_rat.real_rat_neg_conv(@kernel.mk_comb(neg_tm, y))
      let zth = @calc_rat.real_rat_neg_conv(@kernel.mk_comb(neg_tm, z))
      let wth = @calc_rat.real_rat_neg_conv(@kernel.mk_comb(neg_tm, w))
      let y_p = @kernel.rand(@kernel.concl(yth))
      let z_p = @kernel.rand(@kernel.concl(zth))
      let w_p = @kernel.rand(@kernel.concl(wth))
      let th = @kernel.inst_rule(@list.List([(x, x_tm), (y, y_tm), (z, z_tm), (w, w_tm), (y_p, y_p_tm), (z_p, z_p_tm), (w_p, w_p_tm)]), cnj_th)
      @bool.mp(@bool.mp(@bool.mp(th, yth), zth), wth)
    }
  })
}

///|
let rat_quat_cnj_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_CNJ_CONV")

///|
/// `RAT_QUAT_CNJ_CONV`
pub fn rat_quat_cnj_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_cnj_conv_c.get())(x)
}

///|
/// RAT_QUAT_RED_CONV
fn step_10() -> Unit raise {
  let t50 = @simp.basic_net()
  let t44 = (@term_syntax.parse_term("quat_cnj(quat((x : (Real, Real, Real, Real))))"), rat_quat_cnj_conv)
  let t45 = (@term_syntax.parse_term("quat_pow(quat((x : (Real, Real, Real, Real))), (n : Num))"), rat_quat_pow_conv)
  let t46 = (@term_syntax.parse_term("quat_inv(quat((x : (Real, Real, Real, Real))))"), rat_quat_inv_conv)
  let t47 = (@term_syntax.parse_term("quat_mul(quat((x : (Real, Real, Real, Real))), quat((y : (Real, Real, Real, Real))))"), rat_quat_mul_conv)
  let t48 = (@term_syntax.parse_term("quat((x : (Real, Real, Real, Real))) - quat((y : (Real, Real, Real, Real)))"), rat_quat_sub_conv)
  let t49 = (@term_syntax.parse_term("quat((x : (Real, Real, Real, Real))) + quat((y : (Real, Real, Real, Real)))"), rat_quat_add_conv)
  let gconv_net = @lib.itlist(fn(x41 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x42 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s43 = ((x40 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => @lib.uncurry(fn(x37 : @kernel.Term, x38 : (@kernel.Term) -> @kernel.Thm raise) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x39 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        @simp.net_of_conv(x37, x38, x39)
      }
    }, x40))(x41)
    s43(x42)
  }, @list.List([(@term_syntax.parse_term("quat((x : (Real, Real, Real, Real))) == quat((y : (Real, Real, Real, Real)))"), rat_quat_eq_conv), t49, t48, t47, t46, t45, t44]), t50)
  rat_quat_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let rat_quat_red_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("RAT_QUAT_RED_CONV")

///|
/// `RAT_QUAT_RED_CONV`
pub fn rat_quat_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_red_conv_c.get())(x)
}

///|
/// RAT_QUAT_REDUCE_CONV
fn step_11() -> Unit raise {
  rat_quat_reduce_conv_c.set(@equal.depth_conv(rat_quat_red_conv))
}

///|
let rat_quat_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RAT_QUAT_REDUCE_CONV")

///|
/// `RAT_QUAT_REDUCE_CONV`
pub fn rat_quat_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rat_quat_reduce_conv_c.get())(x)
}

///|
/// RAT_QUAT_REDUCE_TAC
fn step_12() -> Unit raise {
  rat_quat_reduce_tac_c.set(@tactics.conv_tac(rat_quat_reduce_conv))
}

///|
let rat_quat_reduce_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("RAT_QUAT_REDUCE_TAC")

///|
/// `RAT_QUAT_REDUCE_TAC`
pub fn rat_quat_reduce_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (rat_quat_reduce_tac_c.get())(x)
}

///|
/// QUAT_TRAD_CONV
fn step_13() -> Unit raise {
  let t54 = @simp.gen_rewrite_conv(fn(x51 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s52 = @equal.depth_conv(x51)
    fn(x53 : @kernel.Term) -> @kernel.Thm raise {
      s52(x53)
    }
  }, @list.List([@quaternion.quat_mul_rid(), @quaternion.quat_mul_rzero(), @quaternion.quat_add_lid(), @quaternion.quat_add_rid()]))
  quat_trad_conv_c.set(@equal.thenc(@simp.rewr_conv(@quaternion.quat_trad()), t54))
}

///|
let quat_trad_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_TRAD_CONV")

///|
/// `QUAT_TRAD_CONV`
pub fn quat_trad_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_trad_conv_c.get())(x)
}

///|
/// RATIONAL_QUAT_CONV
fn step_14() -> Unit raise {
  rational_quat_conv_c.set(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x55 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s56 = @equal.depth_conv(x55)
    fn(x57 : @kernel.Term) -> @kernel.Thm raise {
      s56(x57)
    }
  }, @list.List([@quaternion.hx_def(), @quaternion.quat_ii(), @quaternion.quat_jj(), @quaternion.quat_kk()])), rat_quat_reduce_conv), quat_trad_conv))
}

///|
let rational_quat_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RATIONAL_QUAT_CONV")

///|
/// `RATIONAL_QUAT_CONV`
pub fn rational_quat_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (rational_quat_conv_c.get())(x)
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
}
