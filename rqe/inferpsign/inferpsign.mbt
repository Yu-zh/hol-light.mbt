// Translated from upstream Rqe/inferpsign.ml; edit this file directly.

///|
/// `isign_eq_zero`
pub fn isign_eq_zero(x1 : @kernel.Thm) -> Bool raise {
  let thm = x1
  let (__, _, sign) = @defs.dest_interpsign(thm)
  (sign == @defs.szero_tm())
}

///|
/// `isign_lt_zero`
pub fn isign_lt_zero(x2 : @kernel.Thm) -> Bool raise {
  let thm = x2
  let (__, _, sign) = @defs.dest_interpsign(thm)
  (sign == @defs.sneg_tm())
}

///|
/// `isign_gt_zero`
pub fn isign_gt_zero(x3 : @kernel.Thm) -> Bool raise {
  let thm = x3
  let (__, _, sign) = @defs.dest_interpsign(thm)
  (sign == @defs.spos_tm())
}

///|
/// `inferpsign_row`
pub fn inferpsign_row(x4 : @list.List[@kernel.Term], x5 : @list.List[@kernel.Thm], x6 : @kernel.Thm, x7 : @kernel.Thm, x8 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let vars = x4
  let sgns = x5
  let p_thm = x6
  let q_thm = x7
  let div_thms = x8
  let t11 = @defs.interpsigns_thms2(p_thm)
  let t9 = @simp.pure_rewrite_rule(@list.List([@defs.interpsigns()]))
  let pthms = @lib.map(fn(x10 : @kernel.Thm) -> @kernel.Thm raise {
    @equal.beta_rule(t9(x10))
  }, t11)
  let t14 = @defs.interpsigns_thms2(q_thm)
  let t12 = @simp.pure_rewrite_rule(@list.List([@defs.interpsigns()]))
  let qthms = @lib.map(fn(x13 : @kernel.Thm) -> @kernel.Thm raise {
    @equal.beta_rule(t12(x13))
  }, t14)
  let (_, set, _) = @defs.dest_interpsigns(p_thm)
  if @lib.can((x15 : @list.List[@kernel.Thm]) => @rqe_lib.get_index(isign_eq_zero, x15), pthms) {
    let ind = @rqe_lib.get_index(isign_eq_zero, pthms)
    let pthm = @rqe_lib.ith(ind, pthms)
    let qthm = @rqe_lib.ith(ind, qthms)
    let div_thm = @rqe_lib.ith(ind, div_thms)
    let div_thm_p = @bool.gen(@lib.hd(vars), div_thm)
    let (aks, pqr) = @kernel.dest_eq(@kernel.concl(div_thm))
    let (ak, s) = @rqe_real.dest_mult(aks)
    let (a, k) = @rqe_real.dest_pow(ak)
    let (pq, r) = @rqe_real.dest_plus(pqr)
    let (p, q) = @rqe_real.dest_mult(pq)
    let parity_thm = @rqe_num.parity_conv(k)
    let evenp = (@kernel.dest_comb(@kernel.concl(parity_thm)).0 == @rqe_num.even_tm())
    let sign_thm = @signs.findsign(vars)(sgns)(a)
    let (op, _, _) = @rqe_lib.get_binop(@kernel.concl(sign_thm))
    if evenp {
      let nz_thm = if (op == @rqe_real.rlt()) {
        @drule.match_mp(@inferpsign_thms.ips_lt_nz_thm())(sign_thm)
      } else {
        if (op == @rqe_real.rgt()) {
          @drule.match_mp(@inferpsign_thms.ips_gt_nz_thm())(sign_thm)
        } else {
          if (op == @rqe_real.rneq()) {
            sign_thm
          } else {
            raise Failure("inferpsign: 0")
          }
        }
      }
      let imp_thms = @bool.conjuncts_rule(@bool.ispec(set, @rqe_tactics_ext.match_mpl(@list.List([@inferpsign_thms.even_div_lem(), div_thm_p, nz_thm, parity_thm]))))
      let (_, _, qsign) = @defs.dest_interpsign(qthm)
      let mp_thm = if (qsign == @defs.sneg_tm()) {
        @rqe_lib.ith(0L, imp_thms)
      } else {
        if (qsign == @defs.spos_tm()) {
          @rqe_lib.ith(1L, imp_thms)
        } else {
          if (qsign == @defs.szero_tm()) {
            @rqe_lib.ith(2L, imp_thms)
          } else {
            raise Failure("inferpsign: 1")
          }
        }
      }
      let final_thm = @rqe_tactics_ext.match_mpl(@list.List([mp_thm, pthm, qthm]))
      @defs.mk_interpsigns(pthms.prepend(final_thm))
    } else {
      if (op == @rqe_real.rgt()) {
        let imp_thms_1 = @bool.conjuncts_rule(@bool.ispec(set, @rqe_tactics_ext.match_mpl(@list.List([@inferpsign_thms.gt_div_lem(), div_thm_p, sign_thm]))))
        let (_, _, qsign_1) = @defs.dest_interpsign(qthm)
        let mp_thm_1 = if (qsign_1 == @defs.sneg_tm()) {
          @rqe_lib.ith(0L, imp_thms_1)
        } else {
          if (qsign_1 == @defs.spos_tm()) {
            @rqe_lib.ith(1L, imp_thms_1)
          } else {
            if (qsign_1 == @defs.szero_tm()) {
              @rqe_lib.ith(2L, imp_thms_1)
            } else {
              raise Failure("inferpsign: 1")
            }
          }
        }
        let final_thm_1 = @rqe_tactics_ext.match_mpl(@list.List([mp_thm_1, pthm, qthm]))
        @defs.mk_interpsigns(pthms.prepend(final_thm_1))
      } else {
        raise Failure("inferpsign: shouldn`t reach this point with an odd power and negative sign!  See PDIVIDES and return the correct div_thm")
      }
    }
  } else {
    let p_1 = @rqe_real.dest_mult(@equal.lhs(@kernel.concl(@lib.hd(div_thms)))).1
    let p1 = @kernel.mk_abs(@lib.hd(vars), p_1)
    let pthm_1 = @bool.ispecl(@list.List([set, p1]), @inferpsign_thms.unknown_thm())
    @defs.mk_interpsigns(pthms.prepend(pthm_1))
  }
}

///|
/// `split_interpsigns`
pub fn split_interpsigns(x16 : @kernel.Thm) -> ((@kernel.Thm, @kernel.Thm)) raise {
  let thm = x16
  let thms = @defs.interpsigns_thms2(thm)
  let n = @lib.div63(Int::to_int64(@lib.length(thms)), 2L)
  let (l, r) = @lib.chop_list(@lib.int63_to_int(n), thms)
  let t17 = @defs.mk_interpsigns(r)
  (@defs.mk_interpsigns(l), t17)
}

///|
/// `INFERPSIGN`
pub fn inferpsign_v1(x18 : @list.List[@kernel.Term], x19 : @list.List[@kernel.Thm], x20 : @kernel.Thm, x21 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let vars = x18
  let sgns = x19
  let mat_thm = x20
  let div_thms = x21
  let (pts, pols, signs) = @defs.dest_interpmat(@kernel.concl(mat_thm))
  let n = @lib.div63(Int::to_int64(@lib.length(@basics.dest_list(pols))), 2L)
  let (rol_thm, sgn_thm) = @defs.interpmat_thms(mat_thm)
  let part_thm = @defs.partition_line_conv(@kernel.dest_comb(@kernel.concl(rol_thm)).1)
  let conj_thms = @bool.conjuncts_rule(@simp.rewrite_rule(@list.List([@lists.all2(), part_thm]))(sgn_thm))
  let split_thms = @lib.map(split_interpsigns, conj_thms)
  let conj_thms_p = @lib.map(fn(x22 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
    let (x, y) = x22
    inferpsign_row(vars, sgns, x, y, div_thms)
  }, split_thms)
  let all_thm = @defs.mk_all2_interpsigns(part_thm, conj_thms_p)
  let mat_thm_p = @defs.mk_interpmat_thm(rol_thm, all_thm)
  mat_thm_p
}

///|
/// MK_REP
fn step_1() -> Unit raise {
  let rep_tm = @term_syntax.parse_term("(REPLICATE : (Num, Sign) -> List[Sign])")
  let len_tm = @term_syntax.parse_term("(LENGTH : (List[Real]) -> Num)")
  let one = @term_syntax.parse_term("1")
  let two = @term_syntax.parse_term("2")
  let unknown = @term_syntax.parse_term("Unknown")
  mk_rep_c.set(fn(x23 : @kernel.Term) -> @kernel.Thm raise {
    let pts = x23
    let num = @basics.mk_binop(@rqe_num.np(), @basics.mk_binop(@rqe_num.nm(), two, @kernel.mk_comb(len_tm, pts)), one)
    let len = Int::to_int64(@lib.length(@basics.dest_list(pts)))
    let num2 = @matinsert.mk_suc_v1(@lib.add63(@lib.mul63(2L, len), 1L))
    let lthm = @num_calc_simp.arith_simp_conv(@list.List([@lists.length()]))(num)
    let lthm2 = @kernel.trans(lthm, num2)
    let lthm3 = @equal.ap_thm(@equal.ap_term(rep_tm, lthm2), unknown)
    @simp.rewrite_rule(@list.List([@lists.replicate()]))(lthm3)
  })
}

///|
let mk_rep_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("MK_REP")

///|
/// `MK_REP`
pub fn mk_rep(x : @kernel.Term) -> @kernel.Thm raise {
  (mk_rep_c.get())(x)
}

///|
/// `INSERT_UNKNOWN_COL`
pub fn insert_unknown_col(x24 : @kernel.Thm, x25 : @kernel.Term) -> @kernel.Thm raise {
  let mat_thm = x24
  let p = x25
  let (pts, _, _) = @defs.dest_interpmat(@kernel.concl(mat_thm))
  let rep_thm = mk_rep(pts)
  let mat_thm_p = @drule.match_mp(@work_thms.inferpsign_matinsert_thm())(mat_thm)
  let mat_thm_p_p = @simp.pure_rewrite_rule(@list.List([@lists.map2(), rep_thm]))(mat_thm_p)
  @bool.ispec(p, mat_thm_p_p)
}

///|
/// `REMOVE_QS`
pub fn remove_qs(x26 : @kernel.Thm) -> @kernel.Thm raise {
  let mat_thm = x26
  let (_, pols, _) = @defs.dest_interpmat(@kernel.concl(mat_thm))
  let len = Int::to_int64(@lib.length(@basics.dest_list(pols)))
  if !((@lib.mod63(len, 2L) == 1L)) {
    raise Failure("odd pols?")
  } else {
    let t27 = @drule.match_mp(@work_thms.remove_last())
    let mat_thm_p = @lib.funpow(@lib.int63_to_int(@lib.div63(len, 2L)), t27, mat_thm)
    @simp.rewrite_rule(@list.List([@lists.map(), @lists.butlast(), @lists.not_cons_nil(), @lists.tl(), @lists.hd()]))(mat_thm_p)
  }
}

///|
/// `SPLIT_LIST`
pub fn split_list(x28 : Int64, x29 : @kernel.Term, x30 : @kernel.HolType) -> @kernel.Thm raise {
  let n = x28
  let l = x29
  let ty = x30
  let l_p = @basics.dest_list(l)
  let (l1_p, l2_p) = @lib.chop_list(@lib.int63_to_int(n), l_p)
  let t31 = @lists.mk_list(l2_p, ty)
  let (l1, l2) = (@lists.mk_list(l1_p, ty), t31)
  let app_tm = @kernel.mk_const("APPEND", @list.List([(ty, @kernel.aty)]))
  let l3 = @kernel.mk_comb(@kernel.mk_comb(app_tm, l1), l2)
  @equal.sym(@simp.rewrite_conv(@list.List([@lists.append()]))(l3))
}

///|
/// `prove_nonzero`
pub fn prove_nonzero(x32 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x32
  let (op, _, _) = @rqe_lib.get_binop(@kernel.concl(thm))
  if (op == @rqe_real.rgt()) {
    @drule.match_mp(@inferpsign_thms.ips_gt_nz_thm())(thm)
  } else {
    if (op == @rqe_real.rlt()) {
      @drule.match_mp(@inferpsign_thms.ips_lt_nz_thm())(thm)
    } else {
      if (op == @rqe_real.rneq()) {
        thm
      } else {
        raise Failure("prove_nonzero: bad op")
      }
    }
  }
}

///|
/// INFERPT
fn step_2() -> Unit raise {
  let unknown = @term_syntax.parse_term("Unknown")
  let zero = @term_syntax.parse_term("Zero")
  let pos = @term_syntax.parse_term("Pos")
  let neg = @term_syntax.parse_term("Neg")
  let pow = @term_syntax.parse_term("real_pow")
  let even_tm = @term_syntax.parse_term("EVEN")
  let odd_tm = @term_syntax.parse_term("ODD")
  let rr_ty = @term_syntax.parse_type("(Real) -> Real")
  let sl_ty = @term_syntax.parse_type("List[Sign]")
  let s_ty = @term_syntax.parse_type("Sign")
  let imat = @term_syntax.parse_term("interpmat")
  let rr_length = @kernel.mk_const("LENGTH", @list.List([(rr_ty, @kernel.aty)]))
  let s_length = @kernel.mk_const("LENGTH", @list.List([(s_ty, @kernel.aty)]))
  let sl_length = @kernel.mk_const("LENGTH", @list.List([(sl_ty, @kernel.aty)]))
  let imat_1 = @term_syntax.parse_term("interpmat")
  inferpt_c.set(fn(x33 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((@list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise {
    let vars = x33
    fn(x34 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((@list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise {
      let sgns = x34
      fn(x35 : @kernel.Thm) -> ((@list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise) raise {
        let mat_thm = x35
        fn(x36 : @list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise {
          let div_thms = x36
          fn(x37 : Int64) -> @kernel.Thm raise {
            let ind = x37
            let (pts, pols, signs) = @defs.dest_interpmat(@kernel.concl(mat_thm))
            let pols_p = @basics.dest_list(pols)
            let signsl = @basics.dest_list(signs)
            let signs_p = @lib.map(@basics.dest_list, signsl)
            let pols_len = Int::to_int64(@lib.length(@lib.hd(signs_p)))
            let pols_len2 = @lib.div63(pols_len, 2L)
            let pt_sgnl = @rqe_lib.ith(ind, signsl)
            let pt_sgns = @rqe_lib.ith(ind, signs_p)
            let zind = Int::to_int64(@lib.index(zero, pt_sgns))
            if (zind > pols_len2) {
              mat_thm
            } else {
              let psgn = @rqe_lib.ith(@lib.add63(pols_len2, zind), pt_sgns)
              let div_thm = @rqe_lib.ith(@lib.sub63(zind, 1L), div_thms)
              let (a, n) = @basics.dest_binop(pow, @basics.dest_binop(@rqe_real.rm(), @equal.lhs(@kernel.concl(div_thm))).0)
              let asign = @signs.findsign(vars)(sgns)(a)
              let (op, _, _) = @rqe_lib.get_binop(@kernel.concl(asign))
              let par_thm = @rqe_num.parity_conv(n)
              let par = @kernel.dest_comb(@kernel.concl(par_thm)).0
              let mp_thm = if (par == even_tm) {
                if (psgn == pos) {
                  @work_thms.inferpsign_pos_even()
                } else {
                  if (psgn == neg) {
                    @work_thms.inferpsign_neg_even()
                  } else {
                    if (psgn == zero) {
                      @work_thms.inferpsign_zero_even()
                    } else {
                      raise Failure("INFERPT: bad sign")
                    }
                  }
                }
              } else {
                if (psgn == pos) {
                  @work_thms.inferpsign_pos_odd_pos()
                } else {
                  if (psgn == neg) {
                    @work_thms.inferpsign_neg_odd_pos()
                  } else {
                    if (psgn == zero) {
                      @work_thms.inferpsign_zero_odd_pos()
                    } else {
                      raise Failure("INFERPT: bad sign")
                    }
                  }
                }
              }
              let split_pols1 = split_list(zind, pols, rr_ty)
              let (_, l2) = @lib.chop_list(@lib.int63_to_int(zind), pols_p)
              let split_pols2 = split_list(pols_len2, @lists.mk_list(l2, rr_ty), rr_ty)
              let (s1, t1) = @kernel.dest_comb(@equal.rhs(@kernel.concl(split_pols1)))
              let split_pols_thm = @kernel.trans(split_pols1, @equal.ap_term(s1, split_pols2))
              let split_sgns1 = split_list(zind, pt_sgnl, s_ty)
              let (_, l3) = @lib.chop_list(@lib.int63_to_int(zind), pt_sgns)
              let split_sgns2 = split_list(pols_len2, @lists.mk_list(l3, s_ty), s_ty)
              let (s2, t2) = @kernel.dest_comb(@equal.rhs(@kernel.concl(split_sgns1)))
              let split_pt_sgns_thm = @kernel.trans(split_sgns1, @equal.ap_term(s2, split_sgns2))
              let split_signs = split_list(ind, signs, sl_ty)
              let (r1, r3) = @kernel.dest_comb(@equal.rhs(@kernel.concl(split_signs)))
              let tl_thm = @rqe_list.hd_conv(@simp.once_rewrite_conv(@list.List([split_pt_sgns_thm])), r3)
              let (r4, _) = @kernel.dest_comb(@equal.rhs(@kernel.concl(split_signs)))
              let split_sgns_thm = @kernel.trans(split_signs, @equal.ap_term(r4, tl_thm))
              let mat1 = @kernel.mk_comb(imat_1, pts)
              let mat_thm1 = @equal.ap_term(mat1, split_pols_thm)
              let mat_thm2 = @kernel.mk_comb_rule(mat_thm1, split_sgns_thm)
              let mat_thm3 = @kernel.eq_mp(mat_thm2, mat_thm)
              let ps = @lists.mk_list(@lib.tl(@basics.dest_list(@kernel.dest_comb(s1).1)), rr_ty)
              let t38 = @kernel.mk_comb(rr_length, ps)
              let ps_len = @simp.rewrite_conv(@list.List([@lists.length()]))(t38)
              let ss = @lists.mk_list(@lib.tl(@basics.dest_list(@kernel.dest_comb(s2).1)), s_ty)
              let t39 = @kernel.mk_comb(s_length, ss)
              let ss_len = @simp.rewrite_conv(@list.List([@lists.length()]))(t39)
              let ps_s1_thm = @kernel.trans(ps_len, @equal.sym(ss_len))
              let t40 = @basics.dest_list(t1)
              let k1 = @lib.tl(@lib.chop_list(@lib.int63_to_int(pols_len2), t40).0)
              let qs = @lists.mk_list(k1, rr_ty)
              let t41 = @kernel.mk_comb(rr_length, qs)
              let qs_len = @simp.rewrite_conv(@list.List([@lists.length()]))(t41)
              let t42 = @basics.dest_list(t2)
              let k2 = @lib.tl(@lib.chop_list(@lib.int63_to_int(pols_len2), t42).0)
              let s2s = @lists.mk_list(k2, s_ty)
              let t43 = @kernel.mk_comb(s_length, s2s)
              let s2s_len = @simp.rewrite_conv(@list.List([@lists.length()]))(t43)
              let qs_s2_thm = @kernel.trans(qs_len, @equal.sym(s2s_len))
              let (_, hdsgns) = @kernel.dest_comb(r1)
              let t44 = @kernel.mk_comb(odd_tm, @kernel.mk_comb(sl_length, hdsgns))
              let odd_thm = @bool.eqt_elim(@simp.rewrite_conv(@list.List([@lists.length(), @arith.odd(), @arith.even(), @arith.not_odd(), @arith.not_even()]))(t44))
              let a_thm = if (par == even_tm) {
                prove_nonzero(asign)
              } else {
                asign
              }
              let div_thm_p = @bool.gen(@lib.hd(vars), div_thm)
              let thm1 = @equal.beta_rule(@rqe_tactics_ext.match_mpl(@list.List([mp_thm, mat_thm3, ps_s1_thm, qs_s2_thm, odd_thm])))
              let thm2 = if (par == even_tm) {
                @rqe_tactics_ext.match_mpl(@list.List([thm1, div_thm_p, a_thm, par_thm]))
              } else {
                @rqe_tactics_ext.match_mpl(@list.List([thm1, div_thm_p, a_thm]))
              }
              @simp.rewrite_rule(@list.List([@lists.append()]))(thm2)
            }
          }
        }
      }
    }
  })
}

///|
let inferpt_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((@list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise] = @lib.Cell::new("INFERPT")

///|
/// `INFERPT`
pub fn inferpt(x : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((@list.List[@kernel.Thm]) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise {
  (inferpt_c.get())(x)
}

///|
/// `INFERPTS`
pub fn inferpts(x45 : @list.List[@kernel.Term], x46 : @list.List[@kernel.Thm], x47 : @kernel.Thm, x48 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let vars = x45
  let sgns = x46
  let mat_thm = x47
  let div_thms = x48
  let (pts, _, _) = @defs.dest_interpmat(@kernel.concl(mat_thm))
  let len = @lib.mul63(2L, Int::to_int64(@lib.length(@basics.dest_list(pts))))
  let ods = @lib.filter(@rqe_lib.odd, @lib.range(1L, len))
  @lib.itlist(fn(x49 : Int64, x50 : @kernel.Thm) -> @kernel.Thm raise {
    let i = x49
    let matthm = x50
    inferpt(vars)(sgns)(matthm)(div_thms)(i)
  }, ods, mat_thm)
}

///|
let itvars_c : @lib.Cell[Ref[@list.List[@kernel.Term]]] = @lib.Cell::new("itvars")

///|
/// `itvars`
pub fn itvars() -> Ref[@list.List[@kernel.Term]] {
  itvars_c.get()
}

///|
let itsgns_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("itsgns")

///|
/// `itsgns`
pub fn itsgns() -> Ref[@list.List[@kernel.Thm]] {
  itsgns_c.get()
}

///|
let itmat_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("itmat")

///|
/// `itmat`
pub fn itmat() -> Ref[@kernel.Thm] {
  itmat_c.get()
}

///|
let itdivs_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("itdivs")

///|
/// `itdivs`
pub fn itdivs() -> Ref[@list.List[@kernel.Thm]] {
  itdivs_c.get()
}

///|
/// itvars, itsgns, itmat, itdivs
fn step_3() -> Unit raise {
  let t51 = Ref::{ val: @list.List([]) }
  let t52 = Ref::{ val: @bool.truth() }
  let t53 = Ref::{ val: @list.List([]) }
  let (itvars, itsgns, itmat, itdivs) = (Ref::{ val: @list.List([]) }, t53, t52, t51)
  itvars_c.set(itvars)
  itsgns_c.set(itsgns)
  itmat_c.set(itmat)
  itdivs_c.set(itdivs)
}

///|
/// `INFERPSIGN2`
pub fn inferpsign2(x54 : @list.List[@kernel.Term], x55 : @list.List[@kernel.Thm], x56 : @kernel.Thm, x57 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let vars = x54
  let sgns = x55
  let mat_thm = x56
  let div_thms = x57
  {
    itvars().val = vars
    ()
  }
  {
    itsgns().val = sgns
    ()
  }
  {
    itmat().val = mat_thm
    ()
  }
  {
    itdivs().val = div_thms
    ()
  }
  let (_, bod) = @basics.dest_binop(@rqe_real.rm(), @equal.lhs(@kernel.concl(@lib.hd(div_thms))))
  let p = @kernel.mk_abs(@lib.hd(vars), bod)
  let mat_thm_p = insert_unknown_col(mat_thm, p)
  let mat_thm_p_p = inferpts(vars, sgns, mat_thm_p, div_thms)
  remove_qs(mat_thm_p_p)
}

///|
/// `INFERPSIGN`
pub fn inferpsign(x58 : @list.List[@kernel.Term], x59 : @list.List[@kernel.Thm], x60 : @kernel.Thm, x61 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let vars = x58
  let sgns = x59
  let mat_thm = x60
  let div_thms = x61
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = inferpsign_v1(vars, sgns, mat_thm, div_thms)
  @rqe_lib.op_plus_dot_eq(@timers.inferpsign_timer(), (({
    (@lib.cpu_time.val)()
  }) - start_time))
  res
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
