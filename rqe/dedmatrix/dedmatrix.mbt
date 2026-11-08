// Translated from upstream Rqe/dedmatrix.ml; edit this file directly.

///|
/// prove_nonconstant
fn step_1() -> Unit raise {
  let nonconstant_tm = @term_syntax.parse_term("nonconstant")
  prove_nonconstant_c.set(fn(x1 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let pdiff_thm = x1
    fn(x2 : @kernel.Thm) -> @kernel.Thm raise {
      let normal_thm = x2
      let thm = @simp.once_rewrite_rule(@list.List([@equal.gsym(pdiff_thm)]))(normal_thm)
      let ret = @simp.rewrite_rule(@list.List([@equal.gsym(@asym.normal_pdiff())]))(thm)
      let (f, _) = @basics.strip_comb(@kernel.concl(ret))
      if !((f == nonconstant_tm)) {
        raise Failure("prove_nonconstant")
      } else {
        ret
      }
    }
  })
}

///|
let prove_nonconstant_c : @lib.Cell[(@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("prove_nonconstant")

///|
/// `prove_nonconstant`
pub fn prove_nonconstant(x : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (prove_nonconstant_c.get())(x)
}

///|
/// `REMOVE_COLUMN1`
pub fn remove_column1_v1(x3 : @kernel.Thm) -> @kernel.Thm raise {
  let mat_thm = x3
  let mat_thm1 = @drule.match_mp(@work_thms.remove_col1())(mat_thm)
  @simp.rewrite_rule(@list.List([@lists.map(), @lists.hd(), @lists.tl()]))(mat_thm1)
}

///|
/// `APPENDIZE`
pub fn appendize(x4 : @kernel.Term, x5 : Int64) -> @kernel.Thm raise {
  let l = x4
  let n = x5
  let lty = @kernel.type_of(l)
  let ty = @lib.hd(@kernel.dest_type(lty).1)
  let app_tm = @kernel.mk_const("APPEND", @list.List([(ty, @kernel.aty)]))
  let t6 = @basics.dest_list(l)
  let (l1, l2) = @lib.chop_list(@lib.int63_to_int(n), t6)
  let t7 = @lists.mk_list(l2, ty)
  let app = @kernel.mk_comb(@kernel.mk_comb(app_tm, @lists.mk_list(l1, ty)), t7)
  @equal.gsym(@simp.rewrite_conv(@list.List([@lists.append()]))(app))
}

///|
/// `REMOVE_INFINITIES`
pub fn remove_infinities_v1(x8 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x8
  let thm_p = @drule.match_mp(@work_thms.interpmat_trio())(thm)
  let (pts, _, sgns) = @defs.dest_interpmat(@kernel.concl(thm_p))
  let p_thm = appendize(pts, @lib.sub63(Int::to_int64(@lib.length(@basics.dest_list(pts))), 2L))
  let (pts_p, _, sgns_1) = @defs.dest_interpmat(@kernel.concl(thm_p))
  let s_thm = appendize(sgns_1, @lib.sub63(Int::to_int64(@lib.length(@basics.dest_list(sgns_1))), 5L))
  let t9 = @simp.once_rewrite_rule(@list.List([p_thm, s_thm]))(thm_p)
  let thm_p_p = @drule.match_mp(@work_thms.interpmat_trio_tl())(t9)
  @simp.rewrite_rule(@list.List([@lists.append()]))(thm_p_p)
}

///|
/// get_dirs
fn step_2() -> Unit raise {
  let pos = @term_syntax.parse_term("Pos")
  let neg = @term_syntax.parse_term("Neg")
  get_dirs_c.set(fn(x10 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let lb_deriv = x10
    fn(x11 : @kernel.Term) -> @kernel.Thm raise {
      let ub_deriv = x11
      if ((lb_deriv == pos) && (ub_deriv == pos)) {
        @work_thms.infin_pos_pos()
      } else {
        if ((lb_deriv == pos) && (ub_deriv == neg)) {
          @work_thms.infin_pos_neg()
        } else {
          if ((lb_deriv == neg) && (ub_deriv == pos)) {
            @work_thms.infin_neg_pos()
          } else {
            if ((lb_deriv == neg) && (ub_deriv == neg)) {
              @work_thms.infin_neg_neg()
            } else {
              raise Failure("get_dirs: bad signs")
            }
          }
        }
      }
    }
  })
}

///|
let get_dirs_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("get_dirs")

///|
/// `get_dirs`
pub fn get_dirs(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (get_dirs_c.get())(x)
}

///|
/// get_sing_dirs
fn step_3() -> Unit raise {
  let pos = @term_syntax.parse_term("Pos")
  let neg = @term_syntax.parse_term("Neg")
  get_sing_dirs_c.set(fn(x12 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let lb_deriv = x12
    fn(x13 : @kernel.Term) -> @kernel.Thm raise {
      let ub_deriv = x13
      if ((lb_deriv == pos) && (ub_deriv == pos)) {
        @work_thms.infin_sing_pos_pos()
      } else {
        if ((lb_deriv == pos) && (ub_deriv == neg)) {
          @work_thms.infin_sing_pos_neg()
        } else {
          if ((lb_deriv == neg) && (ub_deriv == pos)) {
            @work_thms.infin_sing_neg_pos()
          } else {
            if ((lb_deriv == neg) && (ub_deriv == neg)) {
              @work_thms.infin_sing_neg_neg()
            } else {
              raise Failure("get_dirs: bad signs")
            }
          }
        }
      }
    }
  })
}

///|
let get_sing_dirs_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("get_sing_dirs")

///|
/// `get_sing_dirs`
pub fn get_sing_dirs(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (get_sing_dirs_c.get())(x)
}

///|
let aitvars_c : @lib.Cell[Ref[@list.List[@kernel.Term]]] = @lib.Cell::new("aitvars")

///|
/// `aitvars`
pub fn aitvars() -> Ref[@list.List[@kernel.Term]] {
  aitvars_c.get()
}

///|
let aitdiff_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("aitdiff")

///|
/// `aitdiff`
pub fn aitdiff() -> Ref[@kernel.Thm] {
  aitdiff_c.get()
}

///|
let aitnorm_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("aitnorm")

///|
/// `aitnorm`
pub fn aitnorm() -> Ref[@kernel.Thm] {
  aitnorm_c.get()
}

///|
let aitmat_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("aitmat")

///|
/// `aitmat`
pub fn aitmat() -> Ref[@kernel.Thm] {
  aitmat_c.get()
}

///|
/// aitvars, aitdiff, aitnorm, aitmat
fn step_4() -> Unit raise {
  let t14 = Ref::{ val: @bool.truth() }
  let t15 = Ref::{ val: @bool.truth() }
  let t16 = Ref::{ val: @bool.truth() }
  let (aitvars, aitdiff, aitnorm, aitmat) = (Ref::{ val: @list.List([]) }, t16, t15, t14)
  aitvars_c.set(aitvars)
  aitdiff_c.set(aitdiff)
  aitnorm_c.set(aitnorm)
  aitmat_c.set(aitmat)
}

///|
/// ADD_INFINITIES
fn step_5() -> Unit raise {
  let real_app = @term_syntax.parse_term("(APPEND : (List[Real], List[Real]) -> List[Real])")
  let sign_app = @term_syntax.parse_term("(APPEND : (List[List[Sign]], List[List[Sign]]) -> List[List[Sign]])")
  let imat = @term_syntax.parse_term("interpmat")
  let pos = @term_syntax.parse_term("Pos")
  let neg = @term_syntax.parse_term("Neg")
  let sl_ty = @term_syntax.parse_type("List[Sign]")
  let real_ty = @term_syntax.parse_type("Real")
  add_infinities_v1_c.set(fn(x17 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise) raise) raise) raise {
    let vars = x17
    fn(x18 : @kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise) raise) raise {
      let diff_thm = x18
      fn(x19 : @kernel.Thm) -> ((@kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise) raise {
        let normal_thm = x19
        fn(x20 : @kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise {
          let mat_thm = x20
          {
            aitvars().val = vars
            ()
          }
          {
            aitdiff().val = diff_thm
            ()
          }
          {
            aitnorm().val = normal_thm
            ()
          }
          {
            aitmat().val = mat_thm
            ()
          }
          let nc_thm = prove_nonconstant(diff_thm)(normal_thm)
          let (pts, pols, sgns) = @defs.dest_interpmat(@kernel.concl(mat_thm))
          let polsl = @basics.dest_list(pols)
          match polsl {
            More(p, tail=More(p_p, tail=_)) => {
              let t21 = @kernel.dest_abs(p).1
              let t22 = @poly_ext.poly_enlist_conv(vars)(t21)
              let p_thm = @kernel.abs_rule(@lib.hd(vars), t22)
              let t23 = @kernel.dest_abs(p_p).1
              let t24 = @poly_ext.poly_enlist_conv(vars)(t23)
              let t25 = @kernel.abs_rule(@lib.hd(vars), t24)
              let p_p_thm = @simp.once_rewrite_rule(@list.List([@equal.gsym(diff_thm)]))(t25)
              let pols_thm = @simp.rewrite_conv(@list.List([p_thm, p_p_thm]))(pols)
              let sgnsl = @basics.dest_list(sgns)
              let sgns_len = Int::to_int64(@lib.length(sgnsl))
              let thm1 = if (sgns_len == 1L) {
                let sgn = @lib.hd(@lib.tl(@basics.dest_list(@lib.hd(sgnsl))))
                let mp_thm = if (sgn == pos) {
                  @work_thms.infin_nil_pos()
                } else {
                  if (sgn == neg) {
                    @work_thms.infin_nil_neg()
                  } else {
                    raise Failure("bad sign in mat")
                  }
                }
                let t26 = @kernel.refl(sgns)
                let mat_thm1 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(@equal.ap_term(imat, @kernel.refl(pts)), pols_thm), t26)
                let mat_thm2 = @kernel.eq_mp(mat_thm1, mat_thm)
                @drule.match_mp(@drule.match_mp(mp_thm)(mat_thm2))(nc_thm)
              } else {
                if (sgns_len == 3L) {
                  let lb_deriv = @lib.hd(@lib.tl(@basics.dest_list(@lib.hd(sgnsl))))
                  let ub_deriv = @lib.hd(@lib.tl(@basics.dest_list(@lib.last(sgnsl))))
                  let mp_thm_1 = get_sing_dirs(lb_deriv)(ub_deriv)
                  let t27 = @kernel.refl(sgns)
                  let mat_thm1_1 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(@equal.ap_term(imat, @kernel.refl(pts)), pols_thm), t27)
                  let mat_thm2_1 = @kernel.eq_mp(mat_thm1_1, mat_thm)
                  @drule.match_mp(@drule.match_mp(mp_thm_1)(mat_thm2_1))(nc_thm)
                } else {
                  let (s1, s2) = @lib.chop_list(@lib.int63_to_int(@lib.sub63(sgns_len, 3L)), sgnsl)
                  let s3 = @lists.mk_list(s1, sl_ty)
                  let t28 = @lists.mk_list(s2, sl_ty)
                  let s4 = @kernel.mk_comb(@kernel.mk_comb(sign_app, s3), t28)
                  let t29 = @simp.rewrite_tac(@list.List([@lists.append()]))
                  let sgns_thm = @tactics.prove(@basics.mk_eq(sgns, s4), t29)
                  let mat_thm1_2 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(@equal.ap_term(imat, @kernel.refl(pts)), pols_thm), sgns_thm)
                  let mat_thm2_2 = @kernel.eq_mp(mat_thm1_2, mat_thm)
                  let lb_deriv_1 = @lib.hd(@lib.tl(@basics.dest_list(@lib.hd(sgnsl))))
                  let ub_deriv_1 = @lib.hd(@lib.tl(@basics.dest_list(@lib.last(sgnsl))))
                  let mp_thm_2 = get_dirs(lb_deriv_1)(ub_deriv_1)
                  @drule.match_mp(@drule.match_mp(mp_thm_2)(mat_thm2_2))(nc_thm)
                }
              }
              let thm2 = @simp.rewrite_rule(@list.List([@lists.append(), @equal.gsym(pols_thm)]))(thm1)
              let c = @kernel.concl(thm2)
              let (x, bod) = @basics.dest_exists(c)
              let x_p = @defs.new_var(real_ty)
              let bod1 = @basics.subst(@list.List([(x_p, x)]), bod)
              let assume_thm1 = @kernel.assume_rule(bod1)
              let (x2, bod2) = @basics.dest_exists(bod1)
              let x_p_p = @defs.new_var(real_ty)
              let assume_thm2 = @kernel.assume_rule(@basics.subst(@list.List([(x_p_p, x2)]), bod2))
              (assume_thm2, (x_p, thm2), (x_p_p, assume_thm1))
            }
            _ => raise @lib.MatchFailure("tscript.ml:81")
          }
        }
      }
    }
  })
}

///|
let add_infinities_v1_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise) raise) raise) raise] = @lib.Cell::new("ADD_INFINITIES")

///|
/// `ADD_INFINITIES`
pub fn add_infinities_v1(x : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> (@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm)) raise) raise) raise) raise {
  (add_infinities_v1_c.get())(x)
}

///|
let tvars_c : @lib.Cell[Ref[@list.List[@kernel.Term]]] = @lib.Cell::new("tvars")

///|
/// `tvars`
pub fn tvars() -> Ref[@list.List[@kernel.Term]] {
  tvars_c.get()
}

///|
let tsgns_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("tsgns")

///|
/// `tsgns`
pub fn tsgns() -> Ref[@list.List[@kernel.Thm]] {
  tsgns_c.get()
}

///|
let tdivs_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("tdivs")

///|
/// `tdivs`
pub fn tdivs() -> Ref[@list.List[@kernel.Thm]] {
  tdivs_c.get()
}

///|
let tdiff_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("tdiff")

///|
/// `tdiff`
pub fn tdiff() -> Ref[@kernel.Thm] {
  tdiff_c.get()
}

///|
let tnorm_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("tnorm")

///|
/// `tnorm`
pub fn tnorm() -> Ref[@kernel.Thm] {
  tnorm_c.get()
}

///|
let tcont_c : @lib.Cell[Ref[(@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise]] = @lib.Cell::new("tcont")

///|
/// `tcont`
pub fn tcont() -> Ref[(@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise] {
  tcont_c.get()
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
/// tvars, tsgns, tdivs, tdiff, tnorm, tcont, tmat, tex
fn step_6() -> Unit raise {
  let t32 = Ref::{ val: @list.List([]) }
  let t33 = Ref::{ val: @bool.truth() }
  let t34 = Ref::{ val: fn(x30 : @kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise {
    let x = x30
    fn(x31 : @list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise {
      let y = x31
      x
    }
  } }
  let t35 = Ref::{ val: @bool.truth() }
  let t36 = Ref::{ val: @bool.truth() }
  let t37 = Ref::{ val: @list.List([]) }
  let t38 = Ref::{ val: @list.List([]) }
  let (tvars, tsgns, tdivs, tdiff, tnorm, tcont, tmat, tex) = (Ref::{ val: @list.List([]) }, t38, t37, t36, t35, t34, t33, t32)
  tvars_c.set(tvars)
  tsgns_c.set(tsgns)
  tdivs_c.set(tdivs)
  tdiff_c.set(tdiff)
  tnorm_c.set(tnorm)
  tcont_c.set(tcont)
  tmat_c.set(tmat)
  tex_c.set(tex)
}

///|
/// `DEDMATRIX`
pub fn dedmatrix(x39 : @list.List[@kernel.Term], x40 : @list.List[@kernel.Thm], x41 : @list.List[@kernel.Thm], x42 : @kernel.Thm, x43 : @kernel.Thm, x44 : (@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise, x45 : @kernel.Thm, x46 : @list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise {
  let vars = x39
  let sgns = x40
  let div_thms = x41
  let pdiff_thm = x42
  let normal_thm = x43
  let cont = x44
  let mat_thm = x45
  let ex_thms = x46
  try {
    {
      tvars().val = vars
      ()
    }
    {
      tsgns().val = sgns
      ()
    }
    {
      tdivs().val = div_thms
      ()
    }
    {
      tdiff().val = pdiff_thm
      ()
    }
    {
      tnorm().val = normal_thm
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
    {
      tcont().val = cont
      ()
    }
    let start_time = {
      (@lib.cpu_time.val)()
    }
    let (pts, pols, signll) = @defs.dest_interpmat(@kernel.concl(mat_thm))
    let mat_thm_p = @inferpsign.inferpsign(vars, sgns, mat_thm, div_thms)
    let mat_thm_p_p = @condense.condense(mat_thm_p)
    let (mat_thm_p_p_p, (v1, exthm1), (v2, exthm2)) = add_infinities_v1(vars)(pdiff_thm)(normal_thm)(mat_thm_p_p)
    let (mat_thm4, new_ex_pairs) = @inferisign.inferisign(vars, pdiff_thm, mat_thm_p_p_p, (ex_thms.prepend((v2, exthm2))).prepend((v1, exthm1)))
    let mat_thm5 = remove_infinities_v1(mat_thm4)
    let mat_thm6 = remove_column1_v1(mat_thm5)
    let mat_thm7 = @condense.condense(mat_thm6)
    let t47 = @equal.alpha_conv(@lib.hd(vars))
    let mat_thm8 = @equal.conv_rule(@equal.rator_conv(@equal.rand_conv((x48 : @kernel.Term) => @lists.list_conv(t47, x48))), mat_thm7)
    let ex_pairs = (@list.List([(v1, exthm1), (v2, exthm2)])).concat(new_ex_pairs)
    let cont_p : (@kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise = fn(x49 : @kernel.Thm) -> ((@list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise) raise {
      let mat_thm_1 = x49
      fn(x50 : @list.List[(@kernel.Term, @kernel.Thm)]) -> @kernel.Thm raise {
        let ex_thms_1 = x50
        cont(mat_thm_1)(ex_thms_1.concat(ex_pairs))
      }
    }
    cont_p(mat_thm8)(ex_thms)
  } catch {
    @inferisign.Isign((false_thm, ex_thms_2)) => raise @inferisign.Isign((false_thm, ex_thms_2))
    Failure(x) => raise Failure(("DEDMATRIX: " + x))
    e => raise e
  }
}

///|
/// `REMOVE_COLUMN1`
pub fn remove_column1(x51 : @kernel.Thm) -> @kernel.Thm raise {
  let mat_thm = x51
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = remove_column1_v1(mat_thm)
  @rqe_lib.op_plus_dot_eq(@timers.remove_column1_timer(), (({
    (@lib.cpu_time.val)()
  }) - start_time))
  res
}

///|
/// `ADD_INFINITIES`
pub fn add_infinities(x52 : @list.List[@kernel.Term], x53 : @kernel.Thm, x54 : @kernel.Thm, x55 : @kernel.Thm) -> ((@kernel.Thm, (@kernel.Term, @kernel.Thm), (@kernel.Term, @kernel.Thm))) raise {
  let vars = x52
  let pdiff_thm = x53
  let normal_thm = x54
  let mat_thm = x55
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = add_infinities_v1(vars)(pdiff_thm)(normal_thm)(mat_thm)
  @rqe_lib.op_plus_dot_eq(@timers.add_infinities_timer(), (({
    (@lib.cpu_time.val)()
  }) - start_time))
  res
}

///|
/// `REMOVE_INFINITIES`
pub fn remove_infinities(x56 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x56
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = remove_infinities_v1(thm)
  @rqe_lib.op_plus_dot_eq(@timers.remove_infinities_timer(), (({
    (@lib.cpu_time.val)()
  }) - start_time))
  res
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
