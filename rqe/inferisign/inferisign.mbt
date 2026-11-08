// Translated from upstream Rqe/inferisign.ml; edit this file directly.

///|
/// `exception Isign`
pub(all) suberror Isign {
  Isign((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]))
}

///|
/// get_mp
fn step_1() -> Unit raise {
  let unknown = @term_syntax.parse_term("Unknown")
  let pos = @term_syntax.parse_term("Pos")
  let zero = @term_syntax.parse_term("Zero")
  let neg = @term_syntax.parse_term("Neg")
  get_mp_c.set(fn(x1 : @kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let upper_sign = x1
    fn(x2 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let lower_sign = x2
      fn(x3 : @kernel.Term) -> @kernel.Thm raise {
        let deriv_sign = x3
        if ((upper_sign == pos) && ((lower_sign == pos) && (deriv_sign == pos))) {
          @work_thms.inferisign_pos_pos_pos()
        } else {
          if ((upper_sign == pos) && ((lower_sign == pos) && (deriv_sign == neg))) {
            @work_thms.inferisign_pos_pos_neg()
          } else {
            if ((upper_sign == pos) && ((lower_sign == neg) && (deriv_sign == pos))) {
              @work_thms.inferisign_pos_neg_pos()
            } else {
              if ((upper_sign == pos) && ((lower_sign == neg) && (deriv_sign == neg))) {
                @work_thms.inferisign_pos_neg_neg()
              } else {
                if ((upper_sign == pos) && ((lower_sign == zero) && (deriv_sign == pos))) {
                  @work_thms.inferisign_pos_zero_pos()
                } else {
                  if ((upper_sign == pos) && ((lower_sign == zero) && (deriv_sign == neg))) {
                    @work_thms.inferisign_pos_zero_neg()
                  } else {
                    if ((upper_sign == neg) && ((lower_sign == pos) && (deriv_sign == pos))) {
                      @work_thms.inferisign_neg_pos_pos()
                    } else {
                      if ((upper_sign == neg) && ((lower_sign == pos) && (deriv_sign == neg))) {
                        @work_thms.inferisign_neg_pos_neg()
                      } else {
                        if ((upper_sign == neg) && ((lower_sign == neg) && (deriv_sign == pos))) {
                          @work_thms.inferisign_neg_neg_pos()
                        } else {
                          if ((upper_sign == neg) && ((lower_sign == neg) && (deriv_sign == neg))) {
                            @work_thms.inferisign_neg_neg_neg()
                          } else {
                            if ((upper_sign == neg) && ((lower_sign == zero) && (deriv_sign == pos))) {
                              @work_thms.inferisign_neg_zero_pos()
                            } else {
                              if ((upper_sign == neg) && ((lower_sign == zero) && (deriv_sign == neg))) {
                                @work_thms.inferisign_neg_zero_neg()
                              } else {
                                if ((upper_sign == zero) && ((lower_sign == pos) && (deriv_sign == pos))) {
                                  @work_thms.inferisign_zero_pos_pos()
                                } else {
                                  if ((upper_sign == zero) && ((lower_sign == pos) && (deriv_sign == neg))) {
                                    @work_thms.inferisign_zero_pos_neg()
                                  } else {
                                    if ((upper_sign == zero) && ((lower_sign == neg) && (deriv_sign == pos))) {
                                      @work_thms.inferisign_zero_neg_pos()
                                    } else {
                                      if ((upper_sign == zero) && ((lower_sign == neg) && (deriv_sign == neg))) {
                                        @work_thms.inferisign_zero_neg_neg()
                                      } else {
                                        if ((upper_sign == zero) && ((lower_sign == zero) && (deriv_sign == pos))) {
                                          @work_thms.inferisign_zero_zero_pos()
                                        } else {
                                          if ((upper_sign == zero) && ((lower_sign == zero) && (deriv_sign == neg))) {
                                            @work_thms.inferisign_zero_zero_neg()
                                          } else {
                                            raise Failure("bad signs in thm")
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  })
}

///|
let get_mp_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("get_mp")

///|
/// `get_mp`
pub fn get_mp(x : @kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (get_mp_c.get())(x)
}

///|
let tvars_c : @lib.Cell[Ref[@list.List[@kernel.Term]]] = @lib.Cell::new("tvars")

///|
/// `tvars`
pub fn tvars() -> Ref[@list.List[@kernel.Term]] {
  tvars_c.get()
}

///|
let tdiff_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("tdiff")

///|
/// `tdiff`
pub fn tdiff() -> Ref[@kernel.Thm] {
  tdiff_c.get()
}

///|
let tmat_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("tmat")

///|
/// `tmat`
pub fn tmat() -> Ref[@kernel.Thm] {
  tmat_c.get()
}

///|
let tex_c : @lib.Cell[Ref[@list.List[(@kernel.Term, @kernel.Thm)]]] = @lib.Cell::new("tex")

///|
/// `tex`
pub fn tex() -> Ref[@list.List[(@kernel.Term, @kernel.Thm)]] {
  tex_c.get()
}

///|
/// tvars, tdiff, tmat, tex
fn step_2() -> Unit raise {
  let t4 = Ref::{ val: @list.List([]) }
  let t5 = Ref::{ val: @bool.truth() }
  let t6 = Ref::{ val: @bool.truth() }
  let (tvars, tdiff, tmat, tex) = (Ref::{ val: @list.List([]) }, t6, t5, t4)
  tvars_c.set(tvars)
  tdiff_c.set(tdiff)
  tmat_c.set(tmat)
  tex_c.set(tex)
}

///|
let inferisign_v1_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise) raise) raise) raise] = @lib.Cell::new("INFERISIGN")

///|
/// `INFERISIGN`
pub fn inferisign_v1(x : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise) raise) raise) raise {
  (inferisign_v1_c.get())(x)
}

///|
/// INFERISIGN
fn step_3() -> Unit raise {
  let real_app = @term_syntax.parse_term("(APPEND : (List[Real], List[Real]) -> List[Real])")
  let sign_app = @term_syntax.parse_term("(APPEND : (List[List[Sign]], List[List[Sign]]) -> List[List[Sign]])")
  let real_len = @term_syntax.parse_term("(LENGTH : (List[Real]) -> Num)")
  let sign_len = @term_syntax.parse_term("(LENGTH : (List[List[Sign]]) -> Num)")
  let unknown = @term_syntax.parse_term("Unknown")
  let pos = @term_syntax.parse_term("Pos")
  let zero = @term_syntax.parse_term("Zero")
  let neg = @term_syntax.parse_term("Neg")
  let num_mul = @term_syntax.parse_term("(op_star : (Num, Num) -> Num)")
  let num_add = @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)")
  let real_ty = @term_syntax.parse_type("Real")
  let one = @term_syntax.parse_term("1")
  let two = @term_syntax.parse_term("2")
  let f = @term_syntax.parse_term("false")
  let imat = @term_syntax.parse_term("interpmat")
  let sl_ty = @term_syntax.parse_type("List[Sign]")
  fn inferisign_rec(x7 : @list.List[@kernel.Term], x8 : @kernel.Thm, x9 : @kernel.Thm, x10 : @list.List[(@kernel.Term, @kernel.Thm)]) -> ((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)])) raise {
    let vars = x7
    let diff_thm = x8
    let mat_thm = x9
    let ex_thms = x10
    try {
      {
        tvars().val = vars
        ()
      }
      {
        tdiff().val = diff_thm
        ()
      }
      {
        tmat().val = mat_thm
        ()
      }
      {
        tex().val = ex_thms
        ()
      }
      let (pts, ps, sgns) = @defs.dest_interpmat(@kernel.concl(mat_thm))
      let pts_p = @basics.dest_list(pts)
      if @list.List::is_empty(pts_p) {
        (mat_thm, ex_thms)
      } else {
        let sgns_p = @basics.dest_list(sgns)
        let sgnl = @lib.map(@basics.dest_list, sgns_p)
        let i = @rqe_lib.get_index(fn(x11 : @list.List[@kernel.Term]) -> Bool raise {
          let x = x11
          (@lib.hd(x) == unknown)
        }, sgnl)
        if (@lib.mod63(i, 2L) == 1L) {
          raise Failure("bad shifted matrix")
        } else {
          match @basics.dest_list(ps) {
            More(p, tail=More(p_p, tail=_)) => {
              let t12 = @kernel.dest_abs(p).1
              let t13 = @poly_ext.poly_enlist_conv(vars)(t12)
              let p_thm = @kernel.abs_rule(@lib.hd(vars), t13)
              let t14 = @kernel.dest_abs(p_p).1
              let t15 = @poly_ext.poly_enlist_conv(vars)(t14)
              let t16 = @kernel.abs_rule(@lib.hd(vars), t15)
              let p_p_thm = @simp.once_rewrite_rule(@list.List([@equal.gsym(diff_thm)]))(t16)
              let (pts1, qts1) = @lib.chop_list(@lib.int63_to_int(@lib.sub63(@lib.div63(i, 2L), 1L)), pts_p)
              let ps_thm = @simp.rewrite_conv(@list.List([p_thm, p_p_thm]))(ps)
              let pts2 = @lists.mk_list(pts1, real_ty)
              let t17 = @lists.mk_list(qts1, real_ty)
              let pts3 = @kernel.mk_comb(@kernel.mk_comb(real_app, pts2), t17)
              let t18 = @simp.rewrite_tac(@list.List([@lists.append()]))
              let pts_thm = @tactics.prove(@basics.mk_eq(pts, pts3), t18)
              let (sgns1, rgns1) = @lib.chop_list(@lib.int63_to_int(@lib.sub63(i, 1L)), sgns_p)
              let sgns2 = @lists.mk_list(sgns1, sl_ty)
              let t19 = @lists.mk_list(rgns1, sl_ty)
              let sgns3 = @kernel.mk_comb(@kernel.mk_comb(sign_app, sgns2), t19)
              let t20 = @simp.rewrite_tac(@list.List([@lists.append()]))
              let sgns_thm = @tactics.prove(@basics.mk_eq(sgns, sgns3), t20)
              let len1 = @kernel.mk_comb(sign_len, sgns2)
              let len2 = @basics.mk_binop(num_add, @basics.mk_binop(num_mul, two, @kernel.mk_comb(real_len, pts2)), one)
              let t21 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.length()])), @int.arith_tac)
              let len_thm = @tactics.prove(@basics.mk_eq(len1, len2), t21)
              let mat_thm1 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(@equal.ap_term(imat, pts_thm), ps_thm), sgns_thm)
              let mat_thm2 = @kernel.eq_mp(mat_thm1, mat_thm)
              let upper_sign = @lib.hd(@rqe_lib.ith(@lib.sub63(i, 1L), sgnl))
              let lower_sign = @lib.hd(@rqe_lib.ith(@lib.add63(i, 1L), sgnl))
              let deriv_sign = @lib.hd(@lib.tl(@rqe_lib.ith(i, sgnl)))
              let mp_thm = get_mp(upper_sign)(lower_sign)(deriv_sign)
              let mat_thm3 = @drule.match_mp(@drule.match_mp(mp_thm)(mat_thm2))(len_thm)
              let t22 = @equal.gsym(p_p_thm)
              let mat_thm4 = @simp.rewrite_rule(@list.List([@equal.gsym(p_thm), t22, @lists.append()]))(mat_thm3)
              let c = @kernel.concl(mat_thm4)
              if (c == f) {
                raise Isign::Isign((mat_thm4, ex_thms))
              } else {
                if !@basics.is_exists(c) {
                  inferisign_rec(vars, diff_thm, mat_thm4, ex_thms)
                } else {
                  let (x_1, bod) = @basics.dest_exists(c)
                  let x_p = @defs.new_var(real_ty)
                  let assume_thm = @kernel.assume_rule(@basics.subst(@list.List([(x_p, x_1)]), bod))
                  inferisign_rec(vars, diff_thm, assume_thm, ex_thms.prepend((x_p, mat_thm4)))
                }
              }
            }
            _ => raise @lib.MatchFailure("tscript.ml:117")
          }
        }
      }
    } catch {
      Failure("get_index") => (mat_thm, ex_thms)
      Failure(x_2) => raise Failure(("INFERISIGN: " + x_2))
      e => raise e
    }
  }
  let inferisign = fn(x23 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise) raise) raise) raise {
    fn(x24 : @kernel.Thm) -> ((@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise) raise) raise {
      fn(x25 : @kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise) raise {
        fn(x26 : @list.List[(@kernel.Term, @kernel.Thm)]) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)]) raise {
          inferisign_rec(x23, x24, x25, x26)
        }
      }
    }
  }
  inferisign_v1_c.set(inferisign)
}

///|
/// `INFERISIGN`
pub fn inferisign(x27 : @list.List[@kernel.Term], x28 : @kernel.Thm, x29 : @kernel.Thm, x30 : @list.List[(@kernel.Term, @kernel.Thm)]) -> ((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Thm)])) raise {
  let vars = x27
  let diff_thm = x28
  let mat_thm = x29
  let ex_thms = x30
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = inferisign_v1(vars)(diff_thm)(mat_thm)(ex_thms)
  @rqe_lib.op_plus_dot_eq(@timers.inferisign_timer(), (({
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
