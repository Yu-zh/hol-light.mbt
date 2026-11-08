// Translated from upstream Examples/hol88.ml; edit this file directly.

///|
/// upto
fn step_1() -> Unit raise {
  upto_c.set(fn(x1 : Int64) -> ((Int64) -> @list.List[Int64] raise) raise {
    fn(x2 : Int64) -> @list.List[Int64] raise {
      @lib.range(x1, x2)
    }
  })
}

///|
let upto_c : @lib.Cell[(Int64) -> ((Int64) -> @list.List[Int64] raise) raise] = @lib.Cell::new("upto")

///|
/// `upto`
pub fn upto(x : Int64) -> ((Int64) -> @list.List[Int64] raise) raise {
  (upto_c.get())(x)
}

///|
/// `is_neg_imp`
pub fn is_neg_imp(x3 : @kernel.Term) -> Bool raise {
  let tm = x3
  (@basics.is_neg(tm) || @basics.is_imp(tm))
}

///|
/// `dest_neg_imp`
pub fn dest_neg_imp(x4 : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  let tm = x4
  try {
    @basics.dest_imp(tm)
  } catch {
    Failure(_) => {
      try {
        let t5 = @kernel.mk_const("F", @list.List([]))
        (@basics.dest_neg(tm), t5)
      } catch {
        Failure(_) => raise Failure("dest_neg_imp")
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// CONTRAPOS
fn step_2() -> Unit raise {
  let a = @term_syntax.parse_term("(a : Bool)")
  let b = @term_syntax.parse_term("(b : Bool)")
  let pth = @itab.itaut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → !b → !a"))
  contrapos_c.set(fn(x6 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x6
    try {
      let (p, q) = @basics.dest_imp(@kernel.concl(th))
      @bool.mp(@kernel.inst_rule(@list.List([(p, a), (q, b)]), pth), th)
    } catch {
      Failure(_) => raise Failure("CONTRAPOS")
      e => raise e
    }
  })
}

///|
let contrapos_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("CONTRAPOS")

///|
/// `CONTRAPOS`
pub fn contrapos(x : @kernel.Thm) -> @kernel.Thm raise {
  (contrapos_c.get())(x)
}

///|
/// NEG_DISCH
fn step_3() -> Unit raise {
  let falsity = @term_syntax.parse_term("false")
  neg_disch_c.set(fn(x7 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let t = x7
    fn(x8 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x8
      try {
        if (@kernel.concl(th) == falsity) {
          @bool.not_intro(@bool.disch(t, th))
        } else {
          @bool.disch(t, th)
        }
      } catch {
        Failure(_) => raise Failure("NEG_DISCH")
        e => raise e
      }
    }
  })
}

///|
let neg_disch_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("NEG_DISCH")

///|
/// `NEG_DISCH`
pub fn neg_disch(x : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (neg_disch_c.get())(x)
}

///|
/// `SELECT_ELIM`
pub fn select_elim(x9 : @kernel.Thm, x10 : (@kernel.Term, @kernel.Thm)) -> @kernel.Thm raise {
  let th1 = x9
  let (v, th2) = x10
  try {
    let (p, sp) = @kernel.dest_comb(@kernel.concl(th1))
    let th3 = @bool.disch(@kernel.mk_comb(p, v), th2)
    @bool.mp(@kernel.inst_rule(@list.List([(sp, v)]), th3), th1)
  } catch {
    Failure(_) => raise Failure("SELECT_ELIM")
    e => raise e
  }
}

///|
/// SELECT_INTRO
fn step_4() -> Unit raise {
  let p = @term_syntax.parse_term("(P : (A) -> Bool)")
  let x = @term_syntax.parse_term("(x : A)")
  let pth = @bool.specl(@list.List([p, x]), @class.select_ax())
  select_intro_c.set(fn(x11 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x11
    try {
      let (f, arg) = @kernel.dest_comb(@kernel.concl(th))
      @bool.mp(@bool.pinst(@list.List([(@kernel.type_of(x), @kernel.aty)]), @list.List([(f, p), (arg, x)]), pth), th)
    } catch {
      Failure(_) => raise Failure("SELECT_INTRO")
      e => raise e
    }
  })
}

///|
let select_intro_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("SELECT_INTRO")

///|
/// `SELECT_INTRO`
pub fn select_intro(x : @kernel.Thm) -> @kernel.Thm raise {
  (select_intro_c.get())(x)
}

///|
/// EXT
fn step_5() -> Unit raise {
  let f = @term_syntax.parse_term("(f : (A) -> B)")
  let g = @term_syntax.parse_term("(g : (A) -> B)")
  let t12 = @tactics.match_accept_tac(@class.eq_ext())
  let pth = @tactics.prove(@term_syntax.parse_term("(∀ x : A, (f : (A) -> B)(x) == (g : (A) -> B)(x)) → f == g"), t12)
  ext_c.set(fn(x13 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x13
    try {
      let (x, bod) = @basics.dest_forall(@kernel.concl(th))
      let (l, r) = @kernel.dest_eq(bod)
      let t14 = @kernel.rator(r)
      let (l_p, r_p) = (@kernel.rator(l), t14)
      let t15 = (@kernel.type_of(l), @basics.bty)
      let th1 = @bool.pinst(@list.List([(@kernel.type_of(x), @kernel.aty), t15]), @list.List([(l_p, f), (r_p, g)]), pth)
      @bool.mp(th1, th)
    } catch {
      Failure(_) => raise Failure("EXT")
      e => raise e
    }
  })
}

///|
let ext_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("EXT")

///|
/// `EXT`
pub fn ext(x : @kernel.Thm) -> @kernel.Thm raise {
  (ext_c.get())(x)
}

///|
/// PROVE
fn step_6() -> Unit raise {
  prove_c.set(fn(x16 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x16.0, x16.1)
  })
}

///|
let prove_c : @lib.Cell[((@kernel.Term, @tactics.Tactic)) -> @kernel.Thm raise] = @lib.Cell::new("PROVE")

///|
/// `PROVE`
pub fn prove(x : (@kernel.Term, @tactics.Tactic)) -> @kernel.Thm raise {
  (prove_c.get())(x)
}

///|
/// `prove_thm`
pub fn prove_thm(x17 : String, x18 : @kernel.Term, x19 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
  let (_ as s, g, t) = (x17, x18, x19)
  @tactics.prove(g, t)
}

///|
/// CONV_OF_RCONV
fn step_7() -> Unit raise {
  fn get_bv(x20 : @kernel.Term) -> @kernel.Term raise {
    let tm = x20
    if @kernel.is_abs(tm) {
      @basics.bndvar(tm)
    } else {
      if @kernel.is_comb(tm) {
        try {
          get_bv(@kernel.rand(tm))
        } catch {
          Failure(_) => get_bv(@kernel.rator(tm))
          e => raise e
        }
      } else {
        raise Failure("")
      }
    }
  }
  conv_of_rconv_c.set(fn(x21 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let conv = x21
    fn(x22 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x22
      let v = get_bv(tm_1)
      let th1 = conv(tm_1)
      let t23 = @equal.rhs(@kernel.concl(th1))
      let th2 = @equal.once_depth_conv(@equal.gen_alpha_conv(v))(t23)
      @kernel.trans(th1, th2)
    }
  })
}

///|
let conv_of_rconv_c : @lib.Cell[(@equal.Conv) -> @equal.Conv raise] = @lib.Cell::new("CONV_OF_RCONV")

///|
/// `CONV_OF_RCONV`
pub fn conv_of_rconv(x : @equal.Conv) -> @equal.Conv raise {
  (conv_of_rconv_c.get())(x)
}

///|
/// CONV_OF_THM
fn step_8() -> Unit raise {
  conv_of_thm_c.set(fn(x24 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    conv_of_rconv(@simp.rewr_conv(x24))
  })
}

///|
let conv_of_thm_c : @lib.Cell[(@kernel.Thm) -> @equal.Conv raise] = @lib.Cell::new("CONV_OF_THM")

///|
/// `CONV_OF_THM`
pub fn conv_of_thm(x : @kernel.Thm) -> @equal.Conv raise {
  (conv_of_thm_c.get())(x)
}

///|
/// `X_FUN_EQ_CONV`
pub fn x_fun_eq_conv(x25 : @kernel.Term) -> @equal.Conv raise {
  let v = x25
  let t27 = @equal.gen_alpha_conv(v)
  @equal.thenc(@simp.rewr_conv(@class.fun_eq_thm()), t27)
}

///|
/// `FUN_EQ_CONV`
pub fn fun_eq_conv(x28 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x28
  let vars = @kernel.frees(tm)
  match @kernel.dest_type(@kernel.type_of(@equal.lhs(tm))) {
    (op, More(ty1, tail=More(ty2, tail=Empty))) => {
      if (op == "fun") {
        let varnm = if @kernel.is_vartype(ty1) {
          "x"
        } else {
          @lib.hd(@lib.explode(@kernel.dest_type(ty1).0))
        }
        let x = @kernel.variant(vars, @kernel.mk_var(varnm, ty1))
        x_fun_eq_conv(x)(tm)
      } else {
        raise Failure("FUN_EQ_CONV")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:105")
  }
}

///|
/// SINGLE_DEPTH_CONV
fn step_9() -> Unit raise {
  fn single_depth_conv_1(x29 : (@kernel.Term) -> @kernel.Thm raise, x30 : @kernel.Term) -> @kernel.Thm raise {
    let conv = x29
    let tm = x30
    try {
      conv(tm)
    } catch {
      Failure(_) => {
        let t32 = @equal.try_conv(conv)
        @equal.thenc(@equal.sub_conv((x31 : @kernel.Term) => single_depth_conv_1(conv, x31)), t32)(tm)
      }
      e => raise e
    }
  }
  single_depth_conv_c.set(fn(x33 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x34 : @kernel.Term) -> @kernel.Thm raise {
      single_depth_conv_1(x33, x34)
    }
  })
}

///|
let single_depth_conv_c : @lib.Cell[(@equal.Conv) -> @equal.Conv raise] = @lib.Cell::new("SINGLE_DEPTH_CONV")

///|
/// `SINGLE_DEPTH_CONV`
pub fn single_depth_conv(x : @equal.Conv) -> @equal.Conv raise {
  (single_depth_conv_c.get())(x)
}

///|
/// SKOLEM_CONV
fn step_10() -> Unit raise {
  skolem_conv_c.set(single_depth_conv(@simp.rewr_conv(@class.skolem_thm())))
}

///|
let skolem_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("SKOLEM_CONV")

///|
/// `SKOLEM_CONV`
pub fn skolem_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (skolem_conv_c.get())(x)
}

///|
/// `X_SKOLEM_CONV`
pub fn x_skolem_conv(x35 : @kernel.Term) -> @equal.Conv raise {
  let v = x35
  @equal.thenc(skolem_conv, @equal.gen_alpha_conv(v))
}

///|
/// `EXISTS_UNIQUE_CONV`
pub fn exists_unique_conv(x37 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x37
  let v = @basics.bndvar(@kernel.rand(tm))
  let th1 = @simp.rewr_conv(@theorems.exists_unique_thm())(tm)
  let tm1 = @equal.rhs(@kernel.concl(th1))
  let vars = @kernel.frees(tm1)
  let v_1 = @kernel.variant(vars, v)
  let v_p = @kernel.variant(vars.prepend(v_1), v_1)
  let t38 = @equal.gen_alpha_conv(v_1)
  let t39 = @equal.rand_conv(@equal.thenc(@equal.binder_conv(@equal.gen_alpha_conv(v_p)), t38))
  let th2 = @equal.thenc(@equal.land_conv(@equal.gen_alpha_conv(v_1)), t39)(tm1)
  @kernel.trans(th1, th2)
}

///|
/// NOT_FORALL_CONV
fn step_11() -> Unit raise {
  not_forall_conv_c.set(conv_of_thm(@class.not_forall_thm()))
}

///|
let not_forall_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NOT_FORALL_CONV")

///|
/// `NOT_FORALL_CONV`
pub fn not_forall_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_forall_conv_c.get())(x)
}

///|
/// NOT_EXISTS_CONV
fn step_12() -> Unit raise {
  not_exists_conv_c.set(conv_of_thm(@class.not_exists_thm()))
}

///|
let not_exists_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NOT_EXISTS_CONV")

///|
/// `NOT_EXISTS_CONV`
pub fn not_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_exists_conv_c.get())(x)
}

///|
/// RIGHT_IMP_EXISTS_CONV
fn step_13() -> Unit raise {
  right_imp_exists_conv_c.set(conv_of_thm(@class.right_imp_exists_thm()))
}

///|
let right_imp_exists_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RIGHT_IMP_EXISTS_CONV")

///|
/// `RIGHT_IMP_EXISTS_CONV`
pub fn right_imp_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (right_imp_exists_conv_c.get())(x)
}

///|
/// FORALL_IMP_CONV
fn step_14() -> Unit raise {
  let t41 = @simp.rewr_conv(@theorems.left_forall_imp_thm())
  let t40 = @simp.rewr_conv(@theorems.right_forall_imp_thm())
  forall_imp_conv_c.set(conv_of_rconv(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@theorems.triv_forall_imp_thm()), t40), t41)))
}

///|
let forall_imp_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("FORALL_IMP_CONV")

///|
/// `FORALL_IMP_CONV`
pub fn forall_imp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (forall_imp_conv_c.get())(x)
}

///|
/// EXISTS_AND_CONV
fn step_15() -> Unit raise {
  let t43 = @simp.rewr_conv(@theorems.right_exists_and_thm())
  let t42 = @simp.rewr_conv(@theorems.left_exists_and_thm())
  exists_and_conv_c.set(conv_of_rconv(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@theorems.triv_exists_and_thm()), t42), t43)))
}

///|
let exists_and_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EXISTS_AND_CONV")

///|
/// `EXISTS_AND_CONV`
pub fn exists_and_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (exists_and_conv_c.get())(x)
}

///|
/// LEFT_IMP_EXISTS_CONV
fn step_16() -> Unit raise {
  left_imp_exists_conv_c.set(conv_of_thm(@theorems.left_imp_exists_thm()))
}

///|
let left_imp_exists_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LEFT_IMP_EXISTS_CONV")

///|
/// `LEFT_IMP_EXISTS_CONV`
pub fn left_imp_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (left_imp_exists_conv_c.get())(x)
}

///|
/// `LEFT_AND_EXISTS_CONV`
pub fn left_and_exists_conv(x44 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x44
  let v = @basics.bndvar(@kernel.rand(@kernel.rand(@kernel.rator(tm))))
  let t45 = @equal.try_conv(@equal.gen_alpha_conv(v))
  @equal.thenc(@simp.rewr_conv(@theorems.left_and_exists_thm()), t45)(tm)
}

///|
/// RIGHT_AND_EXISTS_CONV
fn step_17() -> Unit raise {
  right_and_exists_conv_c.set(conv_of_thm(@theorems.right_and_exists_thm()))
}

///|
let right_and_exists_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("RIGHT_AND_EXISTS_CONV")

///|
/// `RIGHT_AND_EXISTS_CONV`
pub fn right_and_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (right_and_exists_conv_c.get())(x)
}

///|
/// AND_FORALL_CONV
fn step_18() -> Unit raise {
  and_forall_conv_c.set(conv_of_thm(@theorems.and_forall_thm()))
}

///|
let and_forall_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("AND_FORALL_CONV")

///|
/// `AND_FORALL_CONV`
pub fn and_forall_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (and_forall_conv_c.get())(x)
}

///|
/// PAIRED_BETA_CONV
fn step_19() -> Unit raise {
  let t46 = @term_syntax.parse_term("∀ P : (A) -> Bool, op_q(P) → P(GABS(P))")
  let t47 = @simp.rewrite_conv(@list.List([@class.exists_thm(), @pair.gabs_def()]))
  let pth = @bool.eqt_elim(t47(t46))
  let pth1 = @equal.gsym(@pair.passoc_def())
  let pth2 = @equal.gsym(@pair.uncurry_def())
  let dest_geq : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x48 : @kernel.Term) => @basics.dest_binary("GEQ", x48)
  let t49 = @simp.rewr_conv(@equal.gsym(@pair.geq_def()))
  let geq_rule : (@kernel.Thm) -> @kernel.Thm raise = (x50 : @kernel.Thm) => @equal.conv_rule(t49, x50)
  let t51 = @simp.rewr_conv(@pair.geq_def())
  let ungeq_rule : (@kernel.Thm) -> @kernel.Thm raise = (x52 : @kernel.Thm) => @equal.conv_rule(t51, x52)
  fn uncurry_conv(x53 : @kernel.Term, x54 : @kernel.Term) -> @kernel.Thm raise {
    let fn_ = x53
    let vs = x54
    try {
      let (l, r) = @pair.dest_pair(vs)
      try {
        let (r1, r2) = @pair.dest_pair(r)
        let lr = @pair.mk_pair((l, r1))
        let th0 = uncurry_conv(fn_, @pair.mk_pair((lr, r2)))
        let th1 = @bool.ispecl(@list.List([@kernel.rator(@kernel.rand(@kernel.concl(th0))), l, r1, r2]), pth1)
        @kernel.trans(th0, th1)
      } catch {
        Failure(_) => {
          let th0_1 = uncurry_conv(fn_, l)
          let fn_p = @kernel.rand(@kernel.concl(th0_1))
          let th1_1 = uncurry_conv(fn_p, r)
          let th2 = @bool.ispecl(@list.List([@kernel.rator(fn_p), l, r]), pth2)
          @kernel.trans(@kernel.trans(@equal.ap_thm(th0_1, r), th1_1), th2)
        }
        e => raise e
      }
    } catch {
      Failure(_) => @kernel.refl(@kernel.mk_comb(fn_, vs))
      e => raise e
    }
  }
  paired_beta_conv_c.set(fn(x55 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x55
    try {
      @equal.beta_conv(tm)
    } catch {
      Failure(_) => {
        let (gabs, args) = @kernel.dest_comb(tm)
        let (fn__1, bod) = @basics.dest_binder("GABS", gabs)
        let (avs, eqv) = @basics.strip_forall(bod)
        let (l_1, r_1) = dest_geq(eqv)
        let pred = @basics.list_mk_abs(avs, r_1)
        let th0_2 = @lib.rev_itlist(fn(x56 : @kernel.Term, x57 : @kernel.Thm) -> @kernel.Thm raise {
          let v = x56
          let th = x57
          let t58 = @equal.ap_thm(th, v)
          @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), t58)
        }, avs, @kernel.refl(pred))
        let th1_2 = @kernel.trans(@equal.sym(uncurry_conv(pred, @kernel.rand(l_1))), th0_2)
        let th1a = geq_rule(th1_2)
        let etm = @basics.list_mk_icomb("?", @list.List([@kernel.rand(gabs)]))
        let t59 = @bool.genl(avs, th1a)
        let th2_1 = @bool.exists_rule(etm, @kernel.rator(@equal.lhand(@kernel.concl(th1a))), t59)
        let t60 = @equal.beta_rule(@drule.match_mp(pth)(th2_1))
        let th3 = @bool.specl(@lib.striplist(@pair.dest_pair, args), t60)
        ungeq_rule(th3)
      }
      e => raise e
    }
  })
}

///|
let paired_beta_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("PAIRED_BETA_CONV")

///|
/// `PAIRED_BETA_CONV`
pub fn paired_beta_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (paired_beta_conv_c.get())(x)
}

///|
/// AND1_THM
fn step_20() -> Unit raise {
  and1_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 && t2 → t1")))
}

///|
let and1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND1_THM")

///|
/// `AND1_THM`
pub fn and1_thm() -> @kernel.Thm {
  and1_thm_c.get()
}

///|
/// AND2_THM
fn step_21() -> Unit raise {
  and2_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 && t2 → t2")))
}

///|
let and2_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND2_THM")

///|
/// `AND2_THM`
pub fn and2_thm() -> @kernel.Thm {
  and2_thm_c.get()
}

///|
/// AND_IMP_INTRO
fn step_22() -> Unit raise {
  and_imp_intro_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 → t2 → t3) == (t1 && t2 → t3)")))
}

///|
let and_imp_intro_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_IMP_INTRO")

///|
/// `AND_IMP_INTRO`
pub fn and_imp_intro() -> @kernel.Thm {
  and_imp_intro_c.get()
}

///|
/// AND_INTRO_THM
fn step_23() -> Unit raise {
  and_intro_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 → t2 → t1 && t2")))
}

///|
let and_intro_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_INTRO_THM")

///|
/// `AND_INTRO_THM`
pub fn and_intro_thm() -> @kernel.Thm {
  and_intro_thm_c.get()
}

///|
/// BOOL_EQ_DISTINCT
fn step_24() -> Unit raise {
  bool_eq_distinct_c.set(@class.taut(@term_syntax.parse_term("!(true == false) && !(false == true)")))
}

///|
let bool_eq_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOOL_EQ_DISTINCT")

///|
/// `BOOL_EQ_DISTINCT`
pub fn bool_eq_distinct() -> @kernel.Thm {
  bool_eq_distinct_c.get()
}

///|
/// EQ_EXPAND
fn step_25() -> Unit raise {
  eq_expand_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 == t2) == (t1 && t2 || !t1 && !t2)")))
}

///|
let eq_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EXPAND")

///|
/// `EQ_EXPAND`
pub fn eq_expand() -> @kernel.Thm {
  eq_expand_c.get()
}

///|
/// EQ_IMP_THM
fn step_26() -> Unit raise {
  eq_imp_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 == t2) == ((t1 → t2) && (t2 → t1))")))
}

///|
let eq_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_IMP_THM")

///|
/// `EQ_IMP_THM`
pub fn eq_imp_thm() -> @kernel.Thm {
  eq_imp_thm_c.get()
}

///|
/// FALSITY
fn step_27() -> Unit raise {
  falsity_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, false → t")))
}

///|
let falsity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FALSITY")

///|
/// `FALSITY`
pub fn falsity() -> @kernel.Thm {
  falsity_c.get()
}

///|
/// F_IMP
fn step_28() -> Unit raise {
  f_imp_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, !t → t → false")))
}

///|
let f_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("F_IMP")

///|
/// `F_IMP`
pub fn f_imp() -> @kernel.Thm {
  f_imp_c.get()
}

///|
/// IMP_DISJ_THM
fn step_29() -> Unit raise {
  imp_disj_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 → t2) == (!t1 || t2)")))
}

///|
let imp_disj_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_DISJ_THM")

///|
/// `IMP_DISJ_THM`
pub fn imp_disj_thm() -> @kernel.Thm {
  imp_disj_thm_c.get()
}

///|
/// IMP_F
fn step_30() -> Unit raise {
  imp_f_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, (t → false) → !t")))
}

///|
let imp_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_F")

///|
/// `IMP_F`
pub fn imp_f() -> @kernel.Thm {
  imp_f_c.get()
}

///|
/// IMP_F_EQ_F
fn step_31() -> Unit raise {
  imp_f_eq_f_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, (t → false) == (t == false)")))
}

///|
let imp_f_eq_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_F_EQ_F")

///|
/// `IMP_F_EQ_F`
pub fn imp_f_eq_f() -> @kernel.Thm {
  imp_f_eq_f_c.get()
}

///|
/// LEFT_AND_OVER_OR
fn step_32() -> Unit raise {
  left_and_over_or_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 && (t2 || t3)) == (t1 && t2 || t1 && t3)")))
}

///|
let left_and_over_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEFT_AND_OVER_OR")

///|
/// `LEFT_AND_OVER_OR`
pub fn left_and_over_or() -> @kernel.Thm {
  left_and_over_or_c.get()
}

///|
/// LEFT_OR_OVER_AND
fn step_33() -> Unit raise {
  left_or_over_and_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 || t2 && t3) == ((t1 || t2) && (t1 || t3))")))
}

///|
let left_or_over_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEFT_OR_OVER_AND")

///|
/// `LEFT_OR_OVER_AND`
pub fn left_or_over_and() -> @kernel.Thm {
  left_or_over_and_c.get()
}

///|
/// NOT_AND
fn step_34() -> Unit raise {
  not_and_c.set(@class.taut(@term_syntax.parse_term("!((t : Bool) && !t)")))
}

///|
let not_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_AND")

///|
/// `NOT_AND`
pub fn not_and() -> @kernel.Thm {
  not_and_c.get()
}

///|
/// NOT_F
fn step_35() -> Unit raise {
  not_f_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, !t → t == false")))
}

///|
let not_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_F")

///|
/// `NOT_F`
pub fn not_f() -> @kernel.Thm {
  not_f_c.get()
}

///|
/// OR_ELIM_THM
fn step_36() -> Unit raise {
  or_elim_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t : Bool, ∀ t1 : Bool, ∀ t2 : Bool, t1 || t2 → (t1 → t) → (t2 → t) → t")))
}

///|
let or_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_ELIM_THM")

///|
/// `OR_ELIM_THM`
pub fn or_elim_thm() -> @kernel.Thm {
  or_elim_thm_c.get()
}

///|
/// OR_IMP_THM
fn step_37() -> Unit raise {
  or_imp_thm_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 == (t2 || t1)) == (t2 → t1)")))
}

///|
let or_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_IMP_THM")

///|
/// `OR_IMP_THM`
pub fn or_imp_thm() -> @kernel.Thm {
  or_imp_thm_c.get()
}

///|
/// OR_INTRO_THM1
fn step_38() -> Unit raise {
  or_intro_thm1_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 → t1 || t2")))
}

///|
let or_intro_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_INTRO_THM1")

///|
/// `OR_INTRO_THM1`
pub fn or_intro_thm1() -> @kernel.Thm {
  or_intro_thm1_c.get()
}

///|
/// OR_INTRO_THM2
fn step_39() -> Unit raise {
  or_intro_thm2_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t2 → t1 || t2")))
}

///|
let or_intro_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_INTRO_THM2")

///|
/// `OR_INTRO_THM2`
pub fn or_intro_thm2() -> @kernel.Thm {
  or_intro_thm2_c.get()
}

///|
/// RIGHT_AND_OVER_OR
fn step_40() -> Unit raise {
  right_and_over_or_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, ((t2 || t3) && t1) == (t2 && t1 || t3 && t1)")))
}

///|
let right_and_over_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIGHT_AND_OVER_OR")

///|
/// `RIGHT_AND_OVER_OR`
pub fn right_and_over_or() -> @kernel.Thm {
  right_and_over_or_c.get()
}

///|
/// RIGHT_OR_OVER_AND
fn step_41() -> Unit raise {
  right_or_over_and_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t2 && t3 || t1) == ((t2 || t1) && (t3 || t1))")))
}

///|
let right_or_over_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIGHT_OR_OVER_AND")

///|
/// `RIGHT_OR_OVER_AND`
pub fn right_or_over_and() -> @kernel.Thm {
  right_or_over_and_c.get()
}

///|
/// is_type
fn step_42() -> Unit raise {
  is_type_c.set((x61 : String) => @lib.can(@kernel.get_type_arity, x61))
}

///|
let is_type_c : @lib.Cell[(String) -> Bool raise] = @lib.Cell::new("is_type")

///|
/// `is_type`
pub fn is_type(x : String) -> Bool raise {
  (is_type_c.get())(x)
}

///|
/// is_constant
fn step_43() -> Unit raise {
  is_constant_c.set((x62 : String) => @lib.can(@kernel.get_const_type, x62))
}

///|
let is_constant_c : @lib.Cell[(String) -> Bool raise] = @lib.Cell::new("is_constant")

///|
/// `is_constant`
pub fn is_constant(x : String) -> Bool raise {
  (is_constant_c.get())(x)
}

///|
/// `null`
pub fn[TA] null(x63 : @list.List[TA]) -> Bool raise {
  let l = x63
  @list.List::is_empty(l)
}

///|
/// `combine`
pub fn[TA, TB] combine(x64 : @list.List[TA], x65 : @list.List[TB]) -> @list.List[(TA, TB)] raise {
  let (a, b) = (x64, x65)
  @lib.zip(a, b)
}

///|
/// `split`
pub fn[TA, TB] split(x : @list.List[(TA, TB)]) -> ((@list.List[TA], @list.List[TB])) raise {
  let f : (@list.List[(TA, TB)]) -> (@list.List[TA], @list.List[TB]) raise = x66 => @lib.unzip(x66)
  f(x)
}

///|
/// type_tyvars
fn step_44() -> Unit raise {
  type_tyvars_c.set(fn(x70 : @kernel.HolType) -> @list.List[@kernel.HolType] raise {
    (fn(x67 : @kernel.Term) -> @list.List[@kernel.HolType] raise {
      @kernel.type_vars_in_term(x67)
    })(((x69 : @kernel.HolType) => @lib.curry(fn(x68 : (String, @kernel.HolType)) -> @kernel.Term raise {
      @kernel.mk_var(x68.0, x68.1)
    }, "x", x69))(x70))
  })
}

///|
let type_tyvars_c : @lib.Cell[(@kernel.HolType) -> @list.List[@kernel.HolType] raise] = @lib.Cell::new("type_tyvars")

///|
/// `type_tyvars`
pub fn type_tyvars(x : @kernel.HolType) -> @list.List[@kernel.HolType] raise {
  (type_tyvars_c.get())(x)
}

///|
/// `find_match`
pub fn find_match(x71 : @kernel.Term) -> ((@kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise) raise {
  let u = x71
  fn find_mt(x73 : @kernel.Term) -> @drule.Instantiation raise {
    let t = x73
    try {
      @drule.term_match(@list.List([]), u, t)
    } catch {
      Failure(_) => {
        try {
          find_mt(@kernel.rator(t))
        } catch {
          Failure(_) => {
            try {
              find_mt(@kernel.rand(t))
            } catch {
              Failure(_) => {
                try {
                  find_mt(@kernel.dest_abs(t).1)
                } catch {
                  Failure(_) => raise Failure("find_match")
                  e => raise e
                }
              }
              e => raise e
            }
          }
          e => raise e
        }
      }
      e => raise e
    }
  }
  fn(x74 : @kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
    let t_1 = x74
    let (_, tmin, tyin) = find_mt(t_1)
    (tmin, tyin)
  }
}

///|
/// `mk_primed_var`
pub fn mk_primed_var(x75 : String, x76 : @kernel.HolType) -> @kernel.Term raise {
  let (name, ty) = (x75, x76)
  if @lib.can(@kernel.get_const_type, name) {
    mk_primed_var((name + "'"), ty)
  } else {
    @kernel.mk_var(name, ty)
  }
}

///|
/// subst_occs
fn step_45() -> Unit raise {
  fn subst_occs_1(x77 : @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))], x78 : @kernel.Term) -> ((@kernel.Term, @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))])) raise {
    let slist = x77
    let tm = x78
    let (applic, noway) = @lib.partition(fn(x79 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let (i, (t, x)) = x79
      @basics.aconv(tm, x)
    }, slist)
    let sposs = @lib.map(fn(x80 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> ((@list.List[Int64], (@kernel.Term, @kernel.Term)), (@list.List[Int64], (@kernel.Term, @kernel.Term))) raise {
      let (l, z) = x80
      let (l1, l2) = @lib.partition(fn(x81 : Int64) -> Bool raise {
        (1L == x81)
      }, l)
      ((l1, z), (l2, z))
    }, applic)
    let (racts, rrest) = @lib.unzip(sposs)
    let acts = @lib.filter(fn(x82 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_1 = x82
      !@list.List::is_empty(t_1.0)
    }, racts)
    let trest = @lib.map(fn(x83 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> (@list.List[Int64], (@kernel.Term, @kernel.Term)) raise {
      let (n, t_2) = x83
      (@lib.map(fn(x86 : Int64) -> Int64 raise {
        (fn(x84 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x85 : Int64) -> Int64 raise {
            @lib.sub63(x84, x85)
          }
        })(x86)(1L)
      }, n), t_2)
    }, rrest)
    let urest = @lib.filter(fn(x87 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_3 = x87
      !@list.List::is_empty(t_3.0)
    }, trest)
    let tlist = urest.concat(noway)
    if @list.List::is_empty(acts) {
      if @kernel.is_comb(tm) {
        let (l_1, r) = @kernel.dest_comb(tm)
        let (l_p, s_p) = subst_occs_1(tlist, l_1)
        let (r_p, s_p_p) = subst_occs_1(s_p, r)
        (@kernel.mk_comb(l_p, r_p), s_p_p)
      } else {
        if @kernel.is_abs(tm) {
          let (bv, bod) = @kernel.dest_abs(tm)
          let gv = @basics.genvar(@kernel.type_of(bv))
          let nbod = @kernel.vsubst(@list.List([(gv, bv)]), bod)
          let (tm_p, s_p_1) = subst_occs_1(tlist, nbod)
          (@basics.alpha(bv, @kernel.mk_abs(gv, tm_p)), s_p_1)
        } else {
          (tm, tlist)
        }
      }
    } else {
      let tm_p_1 = (fn(x88 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> @kernel.Term raise {
        let (n_1, (t_4, x_1)) = x88
        @basics.subst(@list.List([(t_4, x_1)]), tm)
      })(@lib.hd(acts))
      (tm_p_1, tlist)
    }
  }
  subst_occs_c.set(fn(x89 : @list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
    let ilist = x89
    fn(x90 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      let slist_1 = x90
      fn(x91 : @kernel.Term) -> @kernel.Term raise {
        let tm_1 = x91
        subst_occs_1(@lib.zip(ilist, slist_1), tm_1).0
      }
    }
  })
}

///|
let subst_occs_c : @lib.Cell[(@list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise] = @lib.Cell::new("subst_occs")

///|
/// `subst_occs`
pub fn subst_occs(x : @list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
  (subst_occs_c.get())(x)
}

///|
/// `INST_TY_TERM`
pub fn inst_ty_term(x92 : (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x93 : @kernel.Thm) -> @kernel.Thm raise {
  let (substl, insttyl) = x92
  let th = x93
  let th_p = @kernel.inst_rule(substl, @kernel.inst_type(insttyl, th))
  let t94 = @kernel.hyp(th)
  if (@kernel.hyp(th_p) == t94) {
    th_p
  } else {
    raise Failure("INST_TY_TERM: Free term and/or type variables in hypotheses")
  }
}

///|
/// `RIGHT_CONV_RULE`
pub fn right_conv_rule(x95 : (@kernel.Term) -> @kernel.Thm raise, x96 : @kernel.Thm) -> @kernel.Thm raise {
  let _ as conv = x95
  let th = x96
  @kernel.trans(th, conv(@equal.rhs(@kernel.concl(th))))
}

///|
/// NOT_EQ_SYM
fn step_46() -> Unit raise {
  let t98 = contrapos(@bool.disch_all(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(a : A) == (b : A)")))))
  let t97 = @term_syntax.parse_term("(b : A)")
  let pth = @bool.genl(@list.List([@term_syntax.parse_term("(a : A)"), t97]), t98)
  let aty = @term_syntax.parse_type("A")
  not_eq_sym_c.set(fn(x99 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x99
    try {
      let (l, r) = @kernel.dest_eq(@basics.dest_neg(@kernel.concl(th)))
      @bool.mp(@bool.specl(@list.List([r, l]), @kernel.inst_type(@list.List([(@kernel.type_of(l), aty)]), pth)), th)
    } catch {
      Failure(_) => raise Failure("NOT_EQ_SYM")
      e => raise e
    }
  })
}

///|
let not_eq_sym_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("NOT_EQ_SYM")

///|
/// `NOT_EQ_SYM`
pub fn not_eq_sym(x : @kernel.Thm) -> @kernel.Thm raise {
  (not_eq_sym_c.get())(x)
}

///|
/// `NOT_MP`
pub fn not_mp(x100 : @kernel.Thm, x101 : @kernel.Thm) -> @kernel.Thm raise {
  let thi = x100
  let th = x101
  try {
    @bool.mp(thi, th)
  } catch {
    Failure(_) => {
      try {
        let t = @basics.dest_neg(@kernel.concl(thi))
        @bool.mp(@bool.mp(@bool.spec(t, f_imp()), thi), th)
      } catch {
        Failure(_) => raise Failure("NOT_MP")
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `FORALL_EQ`
pub fn forall_eq(x102 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x102
  let t104 = @kernel.mk_vartype("A")
  let t105 = @kernel.mk_const("forall", @list.List([(@kernel.type_of(x), t104)]))
  let mkall : (@kernel.Thm) -> @kernel.Thm raise = (x106 : @kernel.Thm) => @equal.ap_term(t105, x106)
  fn(x107 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x107
    try {
      mkall(@kernel.abs_rule(x, th))
    } catch {
      Failure(_) => raise Failure("FORALL_EQ")
      e => raise e
    }
  }
}

///|
/// `EXISTS_EQ`
pub fn exists_eq(x108 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x108
  let t110 = @kernel.mk_vartype("A")
  let t111 = @kernel.mk_const("?", @list.List([(@kernel.type_of(x), t110)]))
  let mkex : (@kernel.Thm) -> @kernel.Thm raise = (x112 : @kernel.Thm) => @equal.ap_term(t111, x112)
  fn(x113 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x113
    try {
      mkex(@kernel.abs_rule(x, th))
    } catch {
      Failure(_) => raise Failure("EXISTS_EQ")
      e => raise e
    }
  }
}

///|
/// `SELECT_EQ`
pub fn select_eq(x114 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x114
  let t116 = @kernel.mk_vartype("A")
  let t117 = @kernel.mk_const("@", @list.List([(@kernel.type_of(x), t116)]))
  let mksel : (@kernel.Thm) -> @kernel.Thm raise = (x118 : @kernel.Thm) => @equal.ap_term(t117, x118)
  fn(x119 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x119
    try {
      mksel(@kernel.abs_rule(x, th))
    } catch {
      Failure(_) => raise Failure("SELECT_EQ")
      e => raise e
    }
  }
}

///|
/// `RIGHT_BETA`
pub fn right_beta(x120 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x120
  try {
    @kernel.trans(th, @equal.beta_conv(@equal.rhs(@kernel.concl(th))))
  } catch {
    Failure(_) => raise Failure("RIGHT_BETA")
    e => raise e
  }
}

///|
/// `LIST_BETA_CONV`
pub fn list_beta_conv(x121 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x121
  try {
    let (rat, rnd) = @kernel.dest_comb(tm)
    right_beta(@equal.ap_thm(list_beta_conv(rat), rnd))
  } catch {
    Failure(_) => @kernel.refl(tm)
    e => raise e
  }
}

///|
/// `RIGHT_LIST_BETA`
pub fn right_list_beta(x122 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x122
  @kernel.trans(th, list_beta_conv(@kernel.dest_eq(@kernel.concl(th)).1))
}

///|
/// LIST_CONJ
fn step_47() -> Unit raise {
  list_conj_c.set((x123 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x123))
}

///|
let list_conj_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @kernel.Thm raise] = @lib.Cell::new("LIST_CONJ")

///|
/// `LIST_CONJ`
pub fn list_conj(x : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  (list_conj_c.get())(x)
}

///|
/// `CONJ_LIST`
pub fn conj_list(x124 : Int64, x125 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let n = x124
  let th = x125
  try {
    if (n == 1L) {
      @list.List([th])
    } else {
      let t126 = @bool.conjunct2(th)
      let t127 = conj_list(@lib.sub63(n, 1L), t126)
      t127.prepend(@bool.conjunct1(th))
    }
  } catch {
    Failure(_) => raise Failure("CONJ_LIST")
    e => raise e
  }
}

///|
/// `BODY_CONJUNCTS`
pub fn body_conjuncts(x128 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x128
  if @basics.is_forall(@kernel.concl(th)) {
    body_conjuncts(@bool.spec_all(th))
  } else {
    if @basics.is_conj(@kernel.concl(th)) {
      let t129 = body_conjuncts(@bool.conjunct2(th))
      body_conjuncts(@bool.conjunct1(th)).concat(t129)
    } else {
      @list.List([th])
    }
  }
}

///|
/// `IMP_CANON`
pub fn imp_canon(x130 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x130
  let w = @kernel.concl(th)
  if @basics.is_conj(w) {
    let t131 = imp_canon(@bool.conjunct2(th))
    imp_canon(@bool.conjunct1(th)).concat(t131)
  } else {
    if @basics.is_imp(w) {
      let (ante, conc) = dest_neg_imp(w)
      if @basics.is_conj(ante) {
        let (a, b) = @basics.dest_conj(ante)
        let t132 = @kernel.assume_rule(b)
        imp_canon(@bool.disch(a, @bool.disch(b, not_mp(th, @bool.conj(@kernel.assume_rule(a), t132)))))
      } else {
        if @basics.is_disj(ante) {
          let (a_1, b_1) = @basics.dest_disj(ante)
          let t133 = imp_canon(@bool.disch(b_1, not_mp(th, @bool.disj2(a_1, @kernel.assume_rule(b_1)))))
          imp_canon(@bool.disch(a_1, not_mp(th, @bool.disj1(@kernel.assume_rule(a_1), b_1)))).concat(t133)
        } else {
          if @basics.is_exists(ante) {
            let (x, body) = @basics.dest_exists(ante)
            let x_p = @kernel.variant(@basics.thm_frees(th), x)
            let body_p = @basics.subst(@list.List([(x_p, x)]), body)
            imp_canon(@bool.disch(body_p, not_mp(th, @bool.exists_rule(ante, x_p, @kernel.assume_rule(body_p)))))
          } else {
            @lib.map((x134 : @kernel.Thm) => @bool.disch(ante, x134), imp_canon(@bool.undisch(th)))
          }
        }
      }
    } else {
      if @basics.is_forall(w) {
        imp_canon(@bool.spec_all(th))
      } else {
        @list.List([th])
      }
    }
  }
}

///|
/// LIST_MP
fn step_48() -> Unit raise {
  list_mp_c.set(fn(x139 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x140 : @kernel.Thm) -> @kernel.Thm raise {
      ((x137 : @list.List[@kernel.Thm], x138 : @kernel.Thm) => @lib.rev_itlist(fn(x135 : @kernel.Thm, x136 : @kernel.Thm) -> @kernel.Thm raise {
        let x = x135
        let y = x136
        @bool.mp(y, x)
      }, x137, x138))(x139, x140)
    }
  })
}

///|
let list_mp_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("LIST_MP")

///|
/// `LIST_MP`
pub fn list_mp(x : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (list_mp_c.get())(x)
}

///|
/// DISJ_IMP
fn step_49() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 || t2 → !t1 → t2"))
  disj_imp_c.set(fn(x141 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x141
    try {
      let (a, b) = @basics.dest_disj(@kernel.concl(th))
      @bool.mp(@bool.specl(@list.List([a, b]), pth), th)
    } catch {
      Failure(_) => raise Failure("DISJ_IMP")
      e => raise e
    }
  })
}

///|
let disj_imp_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("DISJ_IMP")

///|
/// `DISJ_IMP`
pub fn disj_imp(x : @kernel.Thm) -> @kernel.Thm raise {
  (disj_imp_c.get())(x)
}

///|
/// IMP_ELIM
fn step_50() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 → t2) → !t1 || t2"))
  imp_elim_c.set(fn(x142 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x142
    try {
      let (a, b) = @basics.dest_imp(@kernel.concl(th))
      @bool.mp(@bool.specl(@list.List([a, b]), pth), th)
    } catch {
      Failure(_) => raise Failure("IMP_ELIM")
      e => raise e
    }
  })
}

///|
let imp_elim_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("IMP_ELIM")

///|
/// `IMP_ELIM`
pub fn imp_elim(x : @kernel.Thm) -> @kernel.Thm raise {
  (imp_elim_c.get())(x)
}

///|
/// `DISJ_CASES_UNION`
pub fn disj_cases_union(x143 : @kernel.Thm, x144 : @kernel.Thm, x145 : @kernel.Thm) -> @kernel.Thm raise {
  let dth = x143
  let ath = x144
  let bth = x145
  let t146 = @bool.disj2(@kernel.concl(ath), bth)
  @bool.disj_cases(dth, @bool.disj1(ath, @kernel.concl(bth)), t146)
}

///|
/// `MK_ABS`
pub fn mk_abs(x147 : @kernel.Thm) -> @kernel.Thm raise {
  let qth = x147
  try {
    let ov = @basics.bndvar(@kernel.rand(@kernel.concl(qth)))
    let (bv, rth) = @bool.spec_var(qth)
    let sth = @kernel.abs_rule(bv, rth)
    let cnv : (@kernel.Term) -> @kernel.Thm raise = @equal.alpha_conv(ov)
    @equal.conv_rule(@equal.binop_conv(cnv), sth)
  } catch {
    Failure(_) => raise Failure("MK_ABS")
    e => raise e
  }
}

///|
/// `HALF_MK_ABS`
pub fn half_mk_abs(x148 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x148
  try {
    let th1 = mk_abs(th)
    @equal.conv_rule(@equal.land_conv(@class.eta_conv), th1)
  } catch {
    Failure(_) => raise Failure("HALF_MK_ABS")
    e => raise e
  }
}

///|
/// `MK_EXISTS`
pub fn mk_exists(x149 : @kernel.Thm) -> @kernel.Thm raise {
  let qth = x149
  try {
    let ov = @basics.bndvar(@kernel.rand(@kernel.concl(qth)))
    let (bv, rth) = @bool.spec_var(qth)
    let sth = exists_eq(bv)(rth)
    let cnv : (@kernel.Term) -> @kernel.Thm raise = @equal.gen_alpha_conv(ov)
    @equal.conv_rule(@equal.binop_conv(cnv), sth)
  } catch {
    Failure(_) => raise Failure("MK_EXISTS")
    e => raise e
  }
}

///|
/// `LIST_MK_EXISTS`
pub fn list_mk_exists(x150 : @list.List[@kernel.Term], x151 : @kernel.Thm) -> @kernel.Thm raise {
  let l = x150
  let th = x151
  @lib.itlist(fn(x152 : @kernel.Term, x153 : @kernel.Thm) -> @kernel.Thm raise {
    let x = x152
    let th_1 = x153
    mk_exists(@bool.gen(x, th_1))
  }, l, th)
}

///|
/// `IMP_CONJ`
pub fn imp_conj(x154 : @kernel.Thm, x155 : @kernel.Thm) -> @kernel.Thm raise {
  let th1 = x154
  let th2 = x155
  let (a1, c1) = @basics.dest_imp(@kernel.concl(th1))
  let (a2, c2) = @basics.dest_imp(@kernel.concl(th2))
  let (a1_1, a2_1) = @bool.conj_pair(@kernel.assume_rule(@bool.mk_conj(a1, a2)))
  let t156 = @bool.mp(th2, a2_1)
  let t157 = @bool.conj(@bool.mp(th1, a1_1), t156)
  @bool.disch(@bool.mk_conj(a1, a2), t157)
}

///|
/// `EXISTS_IMP`
pub fn exists_imp(x158 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x158
  if !@kernel.is_var(x) {
    raise Failure("EXISTS_IMP: first argument not a variable")
  } else {
    fn(x160 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x160
      try {
        let (ante, cncl) = @basics.dest_imp(@kernel.concl(th))
        let t161 = @bool.undisch(th)
        let th1 = @bool.exists_rule(@bool.mk_exists(x, cncl), x, t161)
        let asm_ = @bool.mk_exists(x, ante)
        @bool.disch(asm_, @bool.choose_rule(x, @kernel.assume_rule(asm_), th1))
      } catch {
        Failure(_) => raise Failure("EXISTS_IMP: variable free in assumptions")
        e => raise e
      }
    }
  }
}

///|
/// `CONJUNCTS_CONV`
pub fn conjuncts_conv(x162 : @kernel.Term, x163 : @kernel.Term) -> @kernel.Thm raise {
  let (t1, t2) = (x162, x163)
  fn build_conj(x164 : @list.List[@kernel.Thm], x165 : @kernel.Term) -> @kernel.Thm raise {
    let thl = x164
    let t = x165
    try {
      let (l, r) = @basics.dest_conj(t)
      let t166 = build_conj(thl, r)
      @bool.conj(build_conj(thl, l), t166)
    } catch {
      Failure(_) => @lib.find(fn(x167 : @kernel.Thm) -> Bool raise {
        let th = x167
        (@kernel.concl(th) == t)
      }, thl)
      e => raise e
    }
  }
  try {
    let t168 = @bool.disch(t2, build_conj(@bool.conjuncts_rule(@kernel.assume_rule(t2)), t1))
    @bool.imp_antisym_rule(@bool.disch(t1, build_conj(@bool.conjuncts_rule(@kernel.assume_rule(t1)), t2)), t168)
  } catch {
    Failure(_) => raise Failure("CONJUNCTS_CONV")
    e => raise e
  }
}

///|
/// `CONJ_SET_CONV`
pub fn conj_set_conv(x169 : @list.List[@kernel.Term], x170 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
  let l1 = x169
  let l2 = x170
  try {
    let t171 = @bool.list_mk_conj(l2)
    conjuncts_conv(@bool.list_mk_conj(l1), t171)
  } catch {
    Failure(_) => raise Failure("CONJ_SET_CONV")
    e => raise e
  }
}

///|
/// `FRONT_CONJ_CONV`
pub fn front_conj_conv(x172 : @list.List[@kernel.Term], x173 : @kernel.Term) -> @kernel.Thm raise {
  let tml = x172
  let t = x173
  try {
    conj_set_conv(tml, remove_l(t, tml).prepend(t))
  } catch {
    Failure(_) => raise Failure("FRONT_CONJ_CONV")
    e => raise e
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] remove_l(x174 : TA, x175 : @list.List[TA]) -> @list.List[TA] raise {
  let x = x174
  let l = x175
  if (@lib.hd(l) == x) {
    @lib.tl(l)
  } else {
    let t176 = remove_l(x, @lib.tl(l))
    t176.prepend(@lib.hd(l))
  }
}

///|
/// CONJ_DISCH
fn step_51() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t : Bool, ∀ t1 : Bool, ∀ t2 : Bool, (t → t1 == t2) → (t && t1) == (t && t2)"))
  conj_disch_c.set(fn(x177 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let t = x177
    fn(x178 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x178
      try {
        let (t1, t2) = @kernel.dest_eq(@kernel.concl(th))
        let t179 = @bool.disch(t, th)
        @bool.mp(@bool.specl(@list.List([t, t1, t2]), pth), t179)
      } catch {
        Failure(_) => raise Failure("CONJ_DISCH")
        e => raise e
      }
    }
  })
}

///|
let conj_disch_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("CONJ_DISCH")

///|
/// `CONJ_DISCH`
pub fn conj_disch(x : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (conj_disch_c.get())(x)
}

///|
/// `CONJ_DISCHL`
pub fn conj_dischl(x180 : @list.List[@kernel.Term], x181 : @kernel.Thm) -> @kernel.Thm raise {
  let l = x180
  let th = x181
  if @list.List::is_empty(l) {
    th
  } else {
    let t182 = conj_dischl(@lib.tl(l), th)
    conj_disch(@lib.hd(l))(t182)
  }
}

///|
/// `GSPEC`
pub fn gspec(x183 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x183
  let (wl, w) = @kernel.dest_thm(th)
  if @basics.is_forall(w) {
    gspec(@bool.spec(@basics.genvar(@kernel.type_of(@basics.dest_forall(w).0)), th))
  } else {
    th
  }
}

///|
/// `ANTE_CONJ_CONV`
pub fn ante_conj_conv(x184 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x184
  try {
    let t186 = @basics.dest_imp(tm)
    let t187 = (fn(x185 : @kernel.Term) -> @kernel.Term raise {
      x185
    })(t186.1)
    let ((a1, a2), c) = (@basics.dest_conj(t186.0), t187)
    let t188 = @kernel.assume_rule(a2)
    let t189 = @bool.conj(@kernel.assume_rule(a1), t188)
    let imp1 = @bool.mp(@kernel.assume_rule(tm), t189)
    let t191 = @kernel.assume_rule(@bool.mk_imp(a1, @bool.mk_imp(a2, c)))
    let t190 = @bool.conjunct2(@kernel.assume_rule(@bool.mk_conj(a1, a2)))
    let imp2 = list_mp(@list.List([@bool.conjunct1(@kernel.assume_rule(@bool.mk_conj(a1, a2))), t190]))(t191)
    let t192 = @bool.disch_all(@bool.disch(@bool.mk_conj(a1, a2), imp2))
    @bool.imp_antisym_rule(@bool.disch_all(@bool.disch(a1, @bool.disch(a2, imp1))), t192)
  } catch {
    Failure(_) => raise Failure("ANTE_CONJ_CONV")
    e => raise e
  }
}

///|
/// bool_EQ_CONV
fn step_52() -> Unit raise {
  let boolty = @term_syntax.parse_type("Bool")
  let check : (@kernel.Term) -> @kernel.Term raise = (x194 : @kernel.Term) => @lib.check(fn(x193 : @kernel.Term) -> Bool raise {
    let tm = x193
    (@kernel.type_of(tm) == boolty)
  }, x194)
  let t197 = @bool.conjuncts_rule(@bool.spec(@term_syntax.parse_term("(b : Bool)"), @theorems.eq_clauses()))
  let t195 = @term_syntax.parse_term("(b : Bool)")
  let clist = @lib.map((x196 : @kernel.Thm) => @bool.gen(t195, x196), t197)
  let tb = @lib.hd(clist)
  let bt = @lib.hd(@lib.tl(clist))
  let t = @term_syntax.parse_term("true")
  let f = @term_syntax.parse_term("false")
  bool_eq_conv_c.set(fn(x198 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x198
    try {
      let t200 = @kernel.dest_eq(tm_1)
      let t201 = check(t200.1)
      let (l, r) = ((fn(x199 : @kernel.Term) -> @kernel.Term raise {
        x199
      })(t200.0), t201)
      if (l == r) {
        @bool.eqt_intro(@kernel.refl(l))
      } else {
        if (l == t) {
          @bool.spec(r, tb)
        } else {
          if (r == t) {
            @bool.spec(l, bt)
          } else {
            @lib.failure()
          }
        }
      }
    } catch {
      Failure(_) => raise Failure("bool_EQ_CONV")
      e => raise e
    }
  })
}

///|
let bool_eq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("bool_EQ_CONV")

///|
/// `bool_EQ_CONV`
pub fn bool_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (bool_eq_conv_c.get())(x)
}

///|
/// COND_CONV
fn step_53() -> Unit raise {
  let t = @term_syntax.parse_term("true")
  let f = @term_syntax.parse_term("false")
  let vt = @basics.genvar(@term_syntax.parse_type("A"))
  let vf = @basics.genvar(@term_syntax.parse_type("A"))
  let gen : (@kernel.Thm) -> @kernel.Thm raise = (x202 : @kernel.Thm) => @bool.genl(@list.List([vt, vf]), x202)
  let t203 = @bool.conj_pair(@bool.specl(@list.List([vt, vf]), @class.cond_clauses()))
  let t204 = gen(t203.1)
  let (ct, cf) = (gen(t203.0), t204)
  cond_conv_c.set(fn(x205 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x205
    let (p, (u, v)) = try {
      @class.dest_cond(tm)
    } catch {
      Failure(_) => raise Failure("COND_CONV: not a conditional")
      e => raise e
    }
    let ty = @kernel.type_of(u)
    if (p == t) {
      @bool.spec(v, @bool.spec(u, @kernel.inst_type(@list.List([(ty, @term_syntax.parse_type("A"))]), ct)))
    } else {
      if (p == f) {
        @bool.spec(v, @bool.spec(u, @kernel.inst_type(@list.List([(ty, @term_syntax.parse_type("A"))]), cf)))
      } else {
        if (u == v) {
          @bool.spec(u, @bool.spec(p, @kernel.inst_type(@list.List([(ty, @term_syntax.parse_type("A"))]), @class.cond_id())))
        } else {
          if @basics.aconv(u, v) {
            let t206 = @equal.alpha_rule(v, u)
            let cnd = @equal.ap_term(@kernel.rator(tm), t206)
            let thm = @bool.spec(u, @bool.spec(p, @kernel.inst_type(@list.List([(ty, @term_syntax.parse_type("A"))]), @class.cond_id())))
            @kernel.trans(cnd, thm)
          } else {
            raise Failure("COND_CONV: can't simplify conditional")
          }
        }
      }
    }
  })
}

///|
let cond_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COND_CONV")

///|
/// `COND_CONV`
pub fn cond_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cond_conv_c.get())(x)
}

///|
/// `SUBST_MATCH`
pub fn subst_match(x207 : @kernel.Thm, x208 : @kernel.Thm) -> @kernel.Thm raise {
  let eqth = x207
  let th = x208
  let t209 = @kernel.concl(th)
  let (tm_inst, ty_inst) = find_match(@equal.lhs(@kernel.concl(eqth)))(t209)
  @equal.subs(@list.List([@kernel.inst_rule(tm_inst, @kernel.inst_type(ty_inst, eqth))]), th)
}

///|
/// `SUBST`
pub fn subst(x210 : @list.List[(@kernel.Thm, @kernel.Term)], x211 : @kernel.Term, x212 : @kernel.Thm) -> @kernel.Thm raise {
  let thl = x210
  let pat = x211
  let th = x212
  let (eqs, vs) = @lib.unzip(thl)
  let gvs = @lib.map(fn(x215 : @kernel.Term) -> @kernel.Term raise {
    (fn(x213 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x213)
    })((fn(x214 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x214)
    })(x215))
  }, vs)
  let gpat = @basics.subst(@lib.zip(gvs, vs), pat)
  let (ls, rs) = @lib.unzip(@lib.map(fn(x217 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_eq((fn(x216 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x216)
    })(x217))
  }, eqs))
  let ths = @lib.map(fn(x219 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
    @kernel.assume_rule((fn(x218 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @basics.mk_eq(x218.0, x218.1)
    })(x219))
  }, @lib.zip(gvs, rs))
  let th1 = @kernel.assume_rule(gpat)
  let th2 = @equal.subs(ths, th1)
  let t221 = @bool.disch(gpat, th2)
  let th3 = @lib.itlist(@bool.disch, @lib.map(fn(x220 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x220)
  }, ths), t221)
  let th4 = @kernel.inst_rule(@lib.zip(ls, gvs), th3)
  @bool.mp(@lib.rev_itlist(fn(x224 : @kernel.Thm, x225 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x222 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x223 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.mp(x222, x223)
      }
    })(x225)(x224)
  }, eqs, th4), th)
}

///|
/// `SUBST_CONV`
pub fn subst_conv(x226 : @list.List[(@kernel.Thm, @kernel.Term)], x227 : @kernel.Term, x228 : @kernel.Term) -> @kernel.Thm raise {
  let thvars = x226
  let template = x227
  let tm = x228
  let (thms, vars) = @lib.unzip(thvars)
  let gvs = @lib.map(fn(x231 : @kernel.Term) -> @kernel.Term raise {
    (fn(x229 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x229)
    })((fn(x230 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x230)
    })(x231))
  }, vars)
  let gtemplate = @basics.subst(@lib.zip(gvs, vars), template)
  let t232 = @kernel.refl(tm)
  let t233 = @basics.mk_eq(template, gtemplate)
  subst(@lib.zip(thms, gvs), t233, t232)
}

///|
/// `FILTER_PURE_ASM_REWRITE_RULE`
pub fn filter_pure_asm_rewrite_rule(x234 : (@kernel.Term) -> Bool raise, x235 : @list.List[@kernel.Thm], x236 : @kernel.Thm) -> @kernel.Thm raise {
  let f = x234
  let thl = x235
  let th = x236
  @simp.pure_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f, @kernel.hyp(th))).concat(thl))(th)
}

///|
/// `FILTER_ASM_REWRITE_RULE`
pub fn filter_asm_rewrite_rule(x237 : (@kernel.Term) -> Bool raise, x238 : @list.List[@kernel.Thm], x239 : @kernel.Thm) -> @kernel.Thm raise {
  let f_1 = x237
  let thl_1 = x238
  let th_1 = x239
  @simp.rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_1, @kernel.hyp(th_1))).concat(thl_1))(th_1)
}

///|
/// `FILTER_PURE_ONCE_ASM_REWRITE_RULE`
pub fn filter_pure_once_asm_rewrite_rule(x240 : (@kernel.Term) -> Bool raise, x241 : @list.List[@kernel.Thm], x242 : @kernel.Thm) -> @kernel.Thm raise {
  let f_2 = x240
  let thl_2 = x241
  let th_2 = x242
  @simp.pure_once_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_2, @kernel.hyp(th_2))).concat(thl_2))(th_2)
}

///|
/// `FILTER_ONCE_ASM_REWRITE_RULE`
pub fn filter_once_asm_rewrite_rule(x243 : (@kernel.Term) -> Bool raise, x244 : @list.List[@kernel.Thm], x245 : @kernel.Thm) -> @kernel.Thm raise {
  let f_3 = x243
  let thl_3 = x244
  let th_3 = x245
  @simp.once_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_3, @kernel.hyp(th_3))).concat(thl_3))(th_3)
}

///|
/// `FILTER_PURE_ASM_REWRITE_TAC`
pub fn filter_pure_asm_rewrite_tac(x246 : (@kernel.Term) -> Bool raise, x247 : @list.List[@kernel.Thm], x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f = x246
  let thl = x247
  let (asl, w) = x248
  @simp.pure_rewrite_tac(@lib.filter(fn(x250 : @kernel.Thm) -> Bool raise {
    f((fn(x249 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x249)
    })(x250))
  }, @lib.map(fn(x251 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x251.1
  }, asl)).concat(thl))((asl, w))
}

///|
/// `FILTER_ASM_REWRITE_TAC`
pub fn filter_asm_rewrite_tac(x252 : (@kernel.Term) -> Bool raise, x253 : @list.List[@kernel.Thm], x254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_1 = x252
  let thl_1 = x253
  let (asl_1, w_1) = x254
  @simp.rewrite_tac(@lib.filter(fn(x256 : @kernel.Thm) -> Bool raise {
    f_1((fn(x255 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x255)
    })(x256))
  }, @lib.map(fn(x257 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x257.1
  }, asl_1)).concat(thl_1))((asl_1, w_1))
}

///|
/// `FILTER_PURE_ONCE_ASM_REWRITE_TAC`
pub fn filter_pure_once_asm_rewrite_tac(x258 : (@kernel.Term) -> Bool raise, x259 : @list.List[@kernel.Thm], x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_2 = x258
  let thl_2 = x259
  let (asl_2, w_2) = x260
  @simp.pure_once_rewrite_tac(@lib.filter(fn(x262 : @kernel.Thm) -> Bool raise {
    f_2((fn(x261 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x261)
    })(x262))
  }, @lib.map(fn(x263 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x263.1
  }, asl_2)).concat(thl_2))((asl_2, w_2))
}

///|
/// `FILTER_ONCE_ASM_REWRITE_TAC`
pub fn filter_once_asm_rewrite_tac(x264 : (@kernel.Term) -> Bool raise, x265 : @list.List[@kernel.Thm], x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_3 = x264
  let thl_3 = x265
  let (asl_3, w_3) = x266
  @simp.once_rewrite_tac(@lib.filter(fn(x268 : @kernel.Thm) -> Bool raise {
    f_3((fn(x267 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x267)
    })(x268))
  }, @lib.map(fn(x269 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x269.1
  }, asl_3)).concat(thl_3))((asl_3, w_3))
}

///|
/// DISJ_CASES_THENL
fn step_54() -> Unit raise {
  disj_cases_thenl_c.set((x276 : @list.List[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise]) => @lib.end_itlist(fn(x270 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x271 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s272 = @tactics.disj_cases_then2(x270, x271)
    fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s274 = s272(x273)
      fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s274(x275)
      }
    }
  }, x276))
}

///|
let disj_cases_thenl_c : @lib.Cell[(@list.List[@tactics.ThmTactic]) -> @tactics.ThmTactic raise] = @lib.Cell::new("DISJ_CASES_THENL")

///|
/// `DISJ_CASES_THENL`
pub fn disj_cases_thenl(x : @list.List[@tactics.ThmTactic]) -> @tactics.ThmTactic raise {
  (disj_cases_thenl_c.get())(x)
}

///|
/// `X_CASES_THENL`
pub fn x_cases_thenl(x277 : @list.List[@list.List[@kernel.Term]], x278 : @list.List[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise]) -> @tactics.ThmTactic raise {
  let varsl = x277
  let ttacl = x278
  @lib.end_itlist(fn(x280 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x281 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s282 = @tactics.disj_cases_then2(x280, x281)
    fn(x283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s284 = s282(x283)
      fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s284(x285)
      }
    }
  }, @lib.map(fn(x286 : (@list.List[@kernel.Term], (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise)) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let (vars, ttac) = x286
    @tactics.every_tcl(@lib.map(fn(x288 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
      let s289 = @tactics.x_choose_then(x288)
      fn(x290 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
        let s291 = s289(x290)
        fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s293 = s291(x292)
          fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s293(x294)
          }
        }
      }
    }, vars))(ttac)
  }, @lib.zip(varsl, ttacl)))
}

///|
/// `X_CASES_THEN`
pub fn x_cases_then(x295 : @list.List[@list.List[@kernel.Term]], x296 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.ThmTactic raise {
  let varsl = x295
  let ttac = x296
  @lib.end_itlist(fn(x298 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x299 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s300 = @tactics.disj_cases_then2(x298, x299)
    fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s302 = s300(x301)
      fn(x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s302(x303)
      }
    }
  }, @lib.map(fn(x304 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let vars = x304
    @tactics.every_tcl(@lib.map(fn(x306 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
      let s307 = @tactics.x_choose_then(x306)
      fn(x308 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
        let s309 = s307(x308)
        fn(x310 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s311 = s309(x310)
          fn(x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s311(x312)
          }
        }
      }
    }, vars))(ttac)
  }, varsl))
}

///|
/// `CASES_THENL`
pub fn cases_thenl(x313 : @list.List[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise]) -> @tactics.ThmTactic raise {
  let ttacl = x313
  @lib.end_itlist(fn(x315 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x316 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s317 = @tactics.disj_cases_then2(x315, x316)
    fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s319 = s317(x318)
      fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s319(x320)
      }
    }
  }, @lib.map(@tactics.repeat_tcl(@tactics.choose_then), ttacl))
}

///|
/// DISCARD_TAC
fn step_55() -> Unit raise {
  let truth = @term_syntax.parse_term("true")
  discard_tac_c.set(fn(x321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x321
    fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let (asl, w) = x322
      let t329 = @lib.map(fn(x328 : (String, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x326 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x326)
        })((fn(x327 : (String, @kernel.Thm)) -> @kernel.Thm raise {
          x327.1
        })(x328))
      }, asl).prepend(truth)
      let t323 = @kernel.concl(th)
      if @lib.exists(fn(x325 : @kernel.Term) -> Bool raise {
        ((x324 : @kernel.Term) => @basics.aconv(t323, x324))(x325)
      }, t329) {
        @tactics.all_tac((asl, w))
      } else {
        raise Failure("DISCARD_TAC")
      }
    }
  })
}

///|
let discard_tac_c : @lib.Cell[@tactics.ThmTactic] = @lib.Cell::new("DISCARD_TAC")

///|
/// `DISCARD_TAC`
pub fn discard_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (discard_tac_c.get())(x)
}

///|
/// `GSUBST_TAC`
pub fn gsubst_tac(x330 : (@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise, x331 : @list.List[@kernel.Thm], x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let substfn = x330
  let ths = x331
  let (asl, w) = x332
  let (ls, rs) = split(@lib.map(fn(x334 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_eq((fn(x333 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x333)
    })(x334))
  }, ths))
  let vars = @lib.map(fn(x337 : @kernel.Term) -> @kernel.Term raise {
    (fn(x335 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x335)
    })((fn(x336 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x336)
    })(x337))
  }, ls)
  let base = substfn(combine(vars, ls))(w)
  (@tactics.null_meta, @list.List([(asl, @basics.subst(combine(rs, vars), base))]), ((x338, x339) => rfn_l(ths, vars, base, x338, x339)))
}

///|
fn[TA] rfn_l(ths : @list.List[@kernel.Thm], vars : @list.List[@kernel.Term], base : @kernel.Term, x338 : TA, x339 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let i = x338
  let thl = x339
  match thl {
    More(th, tail=Empty) => subst(combine(@lib.map(@equal.sym, ths), vars), base, th)
    _ => raise Failure("")
  }
}

///|
/// SUBST_TAC
fn step_56() -> Unit raise {
  subst_tac_c.set(fn(x344 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x342 : @list.List[@kernel.Thm], x343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => gsubst_tac(fn(x340 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
        fn(x341 : @kernel.Term) -> @kernel.Term raise {
          @basics.subst(x340, x341)
        }
      }, x342, x343))(x344, x345)
    }
  })
}

///|
let subst_tac_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("SUBST_TAC")

///|
/// `SUBST_TAC`
pub fn subst_tac(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (subst_tac_c.get())(x)
}

///|
/// `SUBST_OCCS_TAC`
pub fn subst_occs_tac(x346 : @list.List[(@list.List[Int64], @kernel.Thm)]) -> @tactics.Tactic raise {
  let nlths = x346
  let (nll, ths) = split(nlths)
  let t348 = subst_occs(nll)
  (x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => gsubst_tac(t348, ths, x349)
}

///|
/// `CHECK_ASSUME_TAC`
pub fn check_assume_tac(x350 : @kernel.Thm) -> @tactics.Tactic raise {
  let gth = x350
  let t352 = @tactics.assume_tac(gth)
  let t353 = discard_tac(gth)
  let t354 = @tactics.accept_tac(gth)
  @tactics.first(@list.List([@tactics.contr_tac(gth), t354, t353, t352]))
}

///|
/// `FILTER_GEN_TAC`
pub fn filter_gen_tac(x355 : @kernel.Term, x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x355
  let (asl, w) = x356
  if (@basics.is_forall(w) && !((tm == @basics.dest_forall(w).0))) {
    @tactics.gen_tac((asl, w))
  } else {
    raise Failure("FILTER_GEN_TAC")
  }
}

///|
/// `FILTER_DISCH_THEN`
pub fn filter_disch_then(x357 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x358 : @kernel.Term, x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let ttac = x357
  let tm = x358
  let (asl, w) = x359
  if (is_neg_imp(w) && !@basics.free_in(tm, dest_neg_imp(w).0)) {
    @tactics.disch_then(ttac)((asl, w))
  } else {
    raise Failure("FILTER_DISCH_THEN")
  }
}

///|
/// `FILTER_STRIP_THEN`
pub fn filter_strip_then(x360 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x361 : @kernel.Term) -> @tactics.Tactic raise {
  let ttac = x360
  let tm = x361
  @tactics.first(@list.List([(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_gen_tac(tm, x363), (x364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_disch_then(ttac, tm, x364), @tactics.conj_tac]))
}

///|
/// FILTER_DISCH_TAC
fn step_57() -> Unit raise {
  filter_disch_tac_c.set(fn(x367 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x365 : @kernel.Term, x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_disch_then(@tactics.strip_assume_tac, x365, x366))(x367, x368)
    }
  })
}

///|
let filter_disch_tac_c : @lib.Cell[(@kernel.Term) -> @tactics.Tactic raise] = @lib.Cell::new("FILTER_DISCH_TAC")

///|
/// `FILTER_DISCH_TAC`
pub fn filter_disch_tac(x : @kernel.Term) -> @tactics.Tactic raise {
  (filter_disch_tac_c.get())(x)
}

///|
/// FILTER_STRIP_TAC
fn step_58() -> Unit raise {
  filter_strip_tac_c.set((x369 : @kernel.Term) => filter_strip_then(@tactics.strip_assume_tac, x369))
}

///|
let filter_strip_tac_c : @lib.Cell[(@kernel.Term) -> @tactics.Tactic raise] = @lib.Cell::new("FILTER_STRIP_TAC")

///|
/// `FILTER_STRIP_TAC`
pub fn filter_strip_tac(x : @kernel.Term) -> @tactics.Tactic raise {
  (filter_strip_tac_c.get())(x)
}

///|
/// RES_CANON
fn step_59() -> Unit raise {
  let not_elim : (@kernel.Thm) -> (Bool, @kernel.Thm) raise = fn(x370 : @kernel.Thm) -> (Bool, @kernel.Thm) raise {
    let th = x370
    if @basics.is_neg(@kernel.concl(th)) {
      (true, @bool.not_elim(th))
    } else {
      (false, th)
    }
  }
  fn canon(x371 : Bool, x372 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let fl = x371
    let th_1 = x372
    let w = @kernel.concl(th_1)
    if @basics.is_conj(w) {
      let (th1, th2) = @bool.conj_pair(th_1)
      let t373 = canon(fl, th2)
      canon(fl, th1).concat(t373)
    } else {
      if (@basics.is_imp(w) && !@basics.is_neg(w)) {
        let (ante, conc) = dest_neg_imp(w)
        if @basics.is_conj(ante) {
          let (a, b) = @basics.dest_conj(ante)
          let t374 = @kernel.assume_rule(b)
          let cth = not_mp(th_1, @bool.conj(@kernel.assume_rule(a), t374))
          let th1_1 = @bool.disch(b, cth)
          let th2_1 = @bool.disch(a, cth)
          let t375 = canon(true, @bool.disch(b, th2_1))
          canon(true, @bool.disch(a, th1_1)).concat(t375)
        } else {
          if @basics.is_disj(ante) {
            let (a_1, b_1) = @basics.dest_disj(ante)
            let ath = @bool.disj1(@kernel.assume_rule(a_1), b_1)
            let bth = @bool.disj2(a_1, @kernel.assume_rule(b_1))
            let th1_2 = @bool.disch(a_1, not_mp(th_1, ath))
            let th2_2 = @bool.disch(b_1, not_mp(th_1, bth))
            let t376 = canon(true, th2_2)
            canon(true, th1_2).concat(t376)
          } else {
            if @basics.is_exists(ante) {
              let (v, body) = @basics.dest_exists(ante)
              let newv = @kernel.variant(@basics.thm_frees(th_1), v)
              let newa = @basics.subst(@list.List([(newv, v)]), body)
              let th1_3 = not_mp(th_1, @bool.exists_rule(ante, newv, @kernel.assume_rule(newa)))
              canon(true, @bool.disch(newa, th1_3))
            } else {
              @lib.map(fn(x378 : @kernel.Thm) -> @kernel.Thm raise {
                @bool.gen_all(((x377 : @kernel.Thm) => @bool.disch(ante, x377))(x378))
              }, canon(true, @bool.undisch(th_1)))
            }
          }
        }
      } else {
        if (if @basics.is_eq(w) {
          let t379 = @term_syntax.parse_type("Bool")
          (@kernel.type_of(@kernel.rand(w)) == t379)
        } else {
          false
        }) {
          let (th1_4, th2_3) = @bool.eq_imp_rule(th_1)
          let t380 = canon(true, th2_3)
          let t381 = canon(true, th1_4).concat(t380)
          (if fl {
            @list.List([@bool.gen_all(th_1)])
          } else {
            @list.List([])
          }).concat(t381)
        } else {
          if @basics.is_forall(w) {
            let (vs, body_1) = @basics.strip_forall(w)
            let fvs = @basics.thm_frees(th_1)
            let vfn : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x382 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
              let l = x382
              (x384 : @kernel.Term) => @kernel.variant(l.concat(fvs), x384)
            }
            let nvs = @lib.itlist(fn(x385 : @kernel.Term, x386 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
              let v_1 = x385
              let nv = x386
              let v_p = vfn(nv)(v_1)
              nv.prepend(v_p)
            }, vs, @list.List([]))
            canon(fl, @bool.specl(nvs, th_1))
          } else {
            if fl {
              @list.List([@bool.gen_all(th_1)])
            } else {
              @list.List([])
            }
          }
        }
      }
    }
  }
  res_canon_c.set(fn(x387 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let th_2 = x387
    try {
      let args = @lib.map(fn(x388 : @kernel.Thm) -> (Bool, @kernel.Thm) raise {
        not_elim(@bool.spec_all(x388))
      }, @bool.conjuncts_rule(@bool.spec_all(th_2)))
      let imps = @lib.flat(@lib.map(fn(x391 : (Bool, @kernel.Thm)) -> @list.List[@kernel.Thm] raise {
        ((x389 : @list.List[@kernel.Thm]) => @lib.map(@bool.gen_all, x389))(((x390 : (Bool, @kernel.Thm)) => @lib.uncurry(canon, x390))(x391))
      }, args))
      @lib.check(fn(x394 : @list.List[@kernel.Thm]) -> Bool raise {
        (fn(x392 : Bool) -> Bool raise {
          !x392
        })((fn(x393 : @list.List[@kernel.Thm]) -> Bool raise {
          (@list.List([]) == x393)
        })(x394))
      }, imps)
    } catch {
      Failure(_) => raise Failure("RES_CANON: no implication is derivable from input thm.")
      e => raise e
    }
  })
}

///|
let res_canon_c : @lib.Cell[(@kernel.Thm) -> @list.List[@kernel.Thm] raise] = @lib.Cell::new("RES_CANON")

///|
/// `RES_CANON`
pub fn res_canon(x : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  (res_canon_c.get())(x)
}

///|
let imp_res_then_c : @lib.Cell[((@kernel.Thm) -> @tactics.Tactic raise) -> ((@kernel.Thm) -> @tactics.Tactic raise) raise] = @lib.Cell::new("IMP_RES_THEN")

///|
/// `IMP_RES_THEN`
pub fn imp_res_then(x : (@kernel.Thm) -> @tactics.Tactic raise) -> ((@kernel.Thm) -> @tactics.Tactic raise) raise {
  (imp_res_then_c.get())(x)
}

///|
let res_then_c : @lib.Cell[((@kernel.Thm) -> @tactics.Tactic raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("RES_THEN")

///|
/// `RES_THEN`
pub fn res_then(x : (@kernel.Thm) -> @tactics.Tactic raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  (res_then_c.get())(x)
}

///|
/// IMP_RES_THEN, RES_THEN
fn step_60() -> Unit raise {
  let match_mp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x395 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let impth = x395
    let sth = @bool.spec_all(impth)
    let t398 = dest_neg_imp(@kernel.concl(sth)).0
    let matchfn : (@kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise = fn(x400 : @kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
      (fn(x397 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
        let (a, b, c) = x397
        (b, c)
      })(((x399 : @kernel.Term) => @drule.term_match(@list.List([]), t398, x399))(x400))
    }
    fn(x401 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x401
      not_mp(inst_ty_term(matchfn(@kernel.concl(th)), sth), th)
    }
  }
  let imp_res_then : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x404 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let ttac = x404
    fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let impth_1 = x405
      let ths = try {
        res_canon(impth_1)
      } catch {
        Failure(_) => raise Failure("IMP_RES_THEN: no implication")
        e => raise e
      }
      @tactics.assum_list(fn(x407 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let asl = x407
        let l_1 = @lib.itlist(fn(x409 : @kernel.Thm, x410 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          let th_1 = x409
          let t411 = @lib.mapfilter(match_mp(th_1), asl)
          (fn(x412 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
            t411.concat(x412)
          })(x410)
        }, ths, @list.List([]))
        let res = check_l("IMP_RES_THEN: no resolvents ", l_1)
        let tacs = check_l("IMP_RES_THEN: no tactics", @lib.mapfilter(ttac, res))
        @tactics.every(tacs)
      })
    }
  }
  let res_then : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x413 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let ttac_1 = x413
    fn(x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let (asl_1, g) = x414
      let asm_ = @lib.map(fn(x415 : (String, @kernel.Thm)) -> @kernel.Thm raise {
        x415.1
      }, asl_1)
      let ths_1 = @lib.itlist(fn(x418 : @list.List[@kernel.Thm], x419 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        let s420 = (fn(x416 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
          fn(x417 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
            x416.concat(x417)
          }
        })(x418)
        s420(x419)
      }, @lib.mapfilter(res_canon, asm_), @list.List([]))
      let imps = check_l("RES_THEN: no implication", ths_1)
      let l_2 = @lib.itlist(fn(x421 : @kernel.Thm, x422 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        let th_2 = x421
        let t423 = @lib.mapfilter(match_mp(th_2), asm_)
        (fn(x424 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          t423.concat(x424)
        })(x422)
      }, imps, @list.List([]))
      let res_1 = check_l("RES_THEN: no resolvents ", l_2)
      let tacs_1 = check_l("RES_THEN: no tactics", @lib.mapfilter(ttac_1, res_1))
      @tactics.every(tacs_1)((asl_1, g))
    }
  }
  let (imp_res_then_1, res_then_1) = (imp_res_then, res_then)
  imp_res_then_c.set(imp_res_then_1)
  res_then_c.set(res_then_1)
}

///|
fn[TA] check_l(x402 : String, x403 : @list.List[TA]) -> @list.List[TA] raise {
  let st = x402
  let l = x403
  if @list.List::is_empty(l) {
    raise Failure(st)
  } else {
    l
  }
}

///|
/// `IMP_RES_TAC`
pub fn imp_res_tac(x425 : @kernel.Thm, x426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let th = x425
  let g = x426
  try {
    imp_res_then(@tactics.repeat_gtcl(imp_res_then)(@tactics.strip_assume_tac))(th)(g)
  } catch {
    Failure(_) => @tactics.all_tac(g)
    e => raise e
  }
}

///|
/// `RES_TAC`
pub fn res_tac(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x427
  try {
    res_then(@tactics.repeat_gtcl(imp_res_then)(@tactics.strip_assume_tac))(g)
  } catch {
    Failure(_) => @tactics.all_tac(g)
    e => raise e
  }
}

///|
/// `prove_rep_fn_one_one`
pub fn prove_rep_fn_one_one(x428 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x428
  try {
    let thm = @bool.conjunct1(th)
    let t430 = @kernel.dest_comb(@equal.lhs(@basics.dest_forall(@kernel.concl(thm)).1))
    let t431 = @kernel.rator(t430.1)
    let (a, r) = ((fn(x429 : @kernel.Term) -> @kernel.Term raise {
      x429
    })(t430.0), t431)
    match @kernel.dest_type(@kernel.type_of(r)) {
      (_, More(aty, tail=More(rty, tail=Empty))) => {
        let a_1 = mk_primed_var("a", aty)
        let a_p = @kernel.variant(@list.List([a_1]), a_1)
        let a_eq_a_p = @basics.mk_eq(a_1, a_p)
        let t432 = @kernel.mk_comb(r, a_p)
        let ra_eq_ra_p = @basics.mk_eq(@kernel.mk_comb(r, a_1), t432)
        let th1 = @equal.ap_term(a, @kernel.assume_rule(ra_eq_ra_p))
        let ga1 = @basics.genvar(aty)
        let ga2 = @basics.genvar(aty)
        let t434 = @basics.mk_eq(ga1, ga2)
        let t433 = (@bool.spec(a_p, thm), ga2)
        let th2 = subst(@list.List([(@bool.spec(a_1, thm), ga1), t433]), t434, th1)
        let th3 = @bool.disch(a_eq_a_p, @equal.ap_term(r, @kernel.assume_rule(a_eq_a_p)))
        @bool.gen(a_1, @bool.gen(a_p, @bool.imp_antisym_rule(@bool.disch(ra_eq_ra_p, th2), th3)))
      }
      _ => raise @lib.MatchFailure("tscript.ml:786")
    }
  } catch {
    Failure(_) => raise Failure("prove_rep_fn_one_one")
    e => raise e
  }
}

///|
/// `prove_rep_fn_onto`
pub fn prove_rep_fn_onto(x435 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x435
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t437 = @basics.dest_forall(@kernel.concl(th2))
        let t438 = @equal.rhs(t437.1)
        let (r, eq) = ((fn(x436 : @kernel.Term) -> @kernel.Term raise {
          x436
        })(t437.0), t438)
        let (re, ar) = @kernel.dest_comb(@equal.lhs(eq))
        let sr = (fn(x441 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          (fn(x439 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            @basics.mk_eq(x439.0, x439.1)
          })((fn(x440 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
            let (x, y) = x440
            (y, x)
          })(x441))
        })(@kernel.dest_eq(eq))
        let a = mk_primed_var("a", @kernel.type_of(ar))
        let sra = @basics.mk_eq(r, @kernel.mk_comb(re, a))
        let ex = @bool.mk_exists(a, sra)
        let imp1 = @bool.exists_rule(ex, ar, @equal.sym(@kernel.assume_rule(eq)))
        let v = @basics.genvar(@kernel.type_of(r))
        let a_1 = @kernel.rator(ar)
        let s_p = @equal.ap_term(re, @bool.spec(a, th1))
        let t442 = @basics.mk_eq(@kernel.mk_comb(re, @kernel.mk_comb(a_1, v)), v)
        let th_1 = subst(@list.List([(@equal.sym(@kernel.assume_rule(sra)), v)]), t442, s_p)
        let imp2 = @bool.choose_rule(a, @kernel.assume_rule(ex), th_1)
        let t443 = @bool.disch(ex, imp2)
        let swap = @bool.imp_antisym_rule(@bool.disch(eq, imp1), t443)
        @bool.gen(r, @kernel.trans(@bool.spec(r, th2), swap))
      }
      _ => raise @lib.MatchFailure("tscript.ml:798")
    }
  } catch {
    Failure(_) => raise Failure("prove_rep_fn_onto")
    e => raise e
  }
}

///|
/// `prove_abs_fn_onto`
pub fn prove_abs_fn_onto(x444 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x444
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t451 = @basics.dest_forall(@kernel.concl(th1))
        let t452 = (fn(x450 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
          (fn(x449 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            (fn(x447 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
              let t448 = @kernel.rator(x447.1)
              ((fn(x446 : @kernel.Term) -> @kernel.Term raise {
                x446
              })(x447.0), t448)
            })(@kernel.dest_comb(x449))
          })(@equal.lhs(x450))
        })(t451.1)
        let (a, (a_1, r)) = ((fn(x445 : @kernel.Term) -> @kernel.Term raise {
          x445
        })(t451.0), t452)
        let t453 = @bool.eqt_intro(@equal.ap_term(r, @bool.spec(a, th1)))
        let thm1 = @bool.eqt_elim(@kernel.trans(@bool.spec(@kernel.mk_comb(r, a), th2), t453))
        let thm2 = @equal.sym(@bool.spec(a, th1))
        let t456 = @basics.dest_forall(@kernel.concl(th2))
        let t457 = (fn(x455 : @kernel.Term) -> @kernel.Term raise {
          @kernel.rator(@equal.lhs(x455))
        })(t456.1)
        let (r_1, p) = ((fn(x454 : @kernel.Term) -> @kernel.Term raise {
          x454
        })(t456.0), t457)
        let t458 = @kernel.mk_comb(p, r_1)
        let ex = @bool.mk_exists(r_1, @bool.mk_conj(@basics.mk_eq(a, @kernel.mk_comb(a_1, r_1)), t458))
        let t459 = @bool.conj(thm2, thm1)
        @bool.gen(a, @bool.exists_rule(ex, @kernel.mk_comb(r, a), t459))
      }
      _ => raise @lib.MatchFailure("tscript.ml:816")
    }
  } catch {
    Failure(_) => raise Failure("prove_abs_fn_onto")
    e => raise e
  }
}

///|
/// `prove_abs_fn_one_one`
pub fn prove_abs_fn_one_one(x460 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x460
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t463 = @basics.dest_forall(@kernel.concl(th2))
        let t464 = (fn(x462 : @kernel.Term) -> @kernel.Term raise {
          @kernel.rator(@equal.lhs(x462))
        })(t463.1)
        let (r, p) = ((fn(x461 : @kernel.Term) -> @kernel.Term raise {
          x461
        })(t463.0), t464)
        let t466 = @kernel.dest_comb(@equal.lhs(@basics.dest_forall(@kernel.concl(th1)).1))
        let t467 = @kernel.rator(t466.1)
        let (a, r_1) = ((fn(x465 : @kernel.Term) -> @kernel.Term raise {
          x465
        })(t466.0), t467)
        let r_p = @kernel.variant(@list.List([r]), r)
        let as1 = @kernel.assume_rule(@kernel.mk_comb(p, r))
        let as2 = @kernel.assume_rule(@kernel.mk_comb(p, r_p))
        let t1 = @kernel.eq_mp(@bool.spec(r, th2), as1)
        let t2 = @kernel.eq_mp(@bool.spec(r_p, th2), as2)
        let t468 = @kernel.mk_comb(a, r_p)
        let eq = @basics.mk_eq(@kernel.mk_comb(a, r), t468)
        let v1 = @basics.genvar(@kernel.type_of(r))
        let v2 = @basics.genvar(@kernel.type_of(r))
        let t469 = @equal.ap_term(r_1, @kernel.assume_rule(eq))
        let i1 = @bool.disch(eq, subst(@list.List([(t1, v1), (t2, v2)]), @basics.mk_eq(v1, v2), t469))
        let t470 = @equal.ap_term(a, @kernel.assume_rule(@basics.mk_eq(r, r_p)))
        let i2 = @bool.disch(@basics.mk_eq(r, r_p), t470)
        let thm = @bool.imp_antisym_rule(i1, i2)
        let t471 = @bool.disch(@kernel.mk_comb(p, r_p), thm)
        let disch = @bool.disch(@kernel.mk_comb(p, r), t471)
        @bool.gen(r, @bool.gen(r_p, disch))
      }
      _ => raise @lib.MatchFailure("tscript.ml:828")
    }
  } catch {
    Failure(_) => raise Failure("prove_abs_fn_one_one")
    e => raise e
  }
}

///|
/// `AC_CONV`
pub fn ac_conv(x472 : (@kernel.Thm, @kernel.Thm), x473 : @kernel.Term) -> @kernel.Thm raise {
  let (associative, commutative) = x472
  let tm = x473
  try {
    let op = (fn(x479 : @kernel.Term) -> @kernel.Term raise {
      (fn(x477 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
        (fn(x475 : @kernel.Term) -> @kernel.Term raise {
          (fn(x474 : @kernel.Term) -> @kernel.Term raise {
            @kernel.rator(@kernel.rator(x474))
          })(@equal.lhs(x475))
        })((fn(x476 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
          x476.1
        })(x477))
      })((fn(x478 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x478)
      })(x479))
    })((fn(x480 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x480)
    })(commutative))
    let ty = (fn(x483 : @kernel.HolType) -> @kernel.HolType raise {
      (fn(x482 : (String, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
        @lib.hd((fn(x481 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
          x481.1
        })(x482))
      })(@kernel.dest_type(x483))
    })((fn(x484 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x484)
    })(op))
    let x = @kernel.mk_var("x", ty)
    let y = @kernel.mk_var("y", ty)
    let z = @kernel.mk_var("z", ty)
    let xy = @kernel.mk_comb(@kernel.mk_comb(op, x), y)
    let yz = @kernel.mk_comb(@kernel.mk_comb(op, y), z)
    let yx = @kernel.mk_comb(@kernel.mk_comb(op, y), x)
    let t486 = @basics.mk_eq(xy, yx)
    let comm = @drule.part_match(fn(x485 : @kernel.Term) -> @kernel.Term raise {
      x485
    }, commutative)(t486)
    let t488 = @kernel.mk_comb(@kernel.mk_comb(op, x), yz)
    let t489 = @basics.mk_eq(@kernel.mk_comb(@kernel.mk_comb(op, xy), z), t488)
    let ass = @drule.part_match(fn(x487 : @kernel.Term) -> @kernel.Term raise {
      x487
    }, @equal.sym(@bool.spec_all(associative)))(t489)
    let t490 = @kernel.inst_rule(@list.List([(x, y), (y, x)]), ass)
    let asc = @kernel.trans(@equal.subs(@list.List([comm]), @equal.sym(ass)), t490)
    let init_ = @equal.top_depth_conv(@simp.rewr_conv(ass))(tm)
    let gl = @equal.rhs(@kernel.concl(init_))
    fn bubble(x491 : @kernel.Term, x492 : @kernel.Term) -> @kernel.Thm raise {
      let head = x491
      let expr = x492
      let t494 = @kernel.dest_comb(expr)
      let t495 = (fn(x493 : @kernel.Term) -> @kernel.Term raise {
        x493
      })(t494.1)
      let ((xop, l), r) = (@kernel.dest_comb(t494.0), t495)
      if (xop == op) {
        if (l == head) {
          @kernel.refl(expr)
        } else {
          if (r == head) {
            @kernel.inst_rule(@list.List([(l, x), (r, y)]), comm)
          } else {
            let subb = bubble(head, r)
            let eqv = @equal.ap_term(@kernel.mk_comb(xop, l), subb)
            let t497 = @kernel.dest_comb(@kernel.dest_eq(@kernel.concl(subb)).1)
            let t498 = (fn(x496 : @kernel.Term) -> @kernel.Term raise {
              x496
            })(t497.1)
            let ((yop, l_p), r_p) = (@kernel.dest_comb(t497.0), t498)
            @kernel.trans(eqv, @kernel.inst_rule(@list.List([(l, x), (l_p, y), (r_p, z)]), asc))
          }
        }
      } else {
        raise Failure("")
      }
    }
    fn asce(x499 : @kernel.Term, x500 : @kernel.Term) -> @kernel.Thm raise {
      let (l_1, r_1) = (x499, x500)
      if (l_1 == r_1) {
        @kernel.refl(l_1)
      } else {
        let t502 = @kernel.dest_comb(l_1)
        let t503 = (fn(x501 : @kernel.Term) -> @kernel.Term raise {
          x501
        })(t502.1)
        let ((zop, l_p_1), r_p_1) = (@kernel.dest_comb(t502.0), t503)
        if (zop == op) {
          let beq = bubble(l_p_1, r_1)
          let rt = @kernel.dest_eq(@kernel.concl(beq)).1
          let t506 = @equal.sym(beq)
          let t504 = @kernel.dest_comb(rt).1
          let t505 = asce(@kernel.dest_comb(l_1).1, t504)
          @kernel.trans(@equal.ap_term(@kernel.mk_comb(op, l_p_1), t505), t506)
        } else {
          raise Failure("")
        }
      }
    }
    let t507 = @kernel.dest_eq(gl)
    let t508 = asce(t507.0, t507.1)
    @bool.eqt_intro(@kernel.eq_mp(@equal.sym(init_), t508))
  } catch {
    _ => raise Failure("AC_CONV")
  }
}

///|
/// `AC_RULE`
pub fn ac_rule(x509 : (@kernel.Thm, @kernel.Thm)) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let ths = x509
  fn(x512 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_elim(((x511 : @kernel.Term) => ac_conv(ths, x511))(x512))
  }
}

///|
/// COND_CASES_TAC
fn step_61() -> Unit raise {
  let is_good_cond : (@kernel.Term) -> Bool raise = fn(x513 : @kernel.Term) -> Bool raise {
    let tm = x513
    try {
      !@kernel.is_const(@class.dest_cond(tm).0)
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  cond_cases_tac_c.set(fn(x514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x514
    let cond = @basics.find_term(fn(x515 : @kernel.Term) -> Bool raise {
      let tm_1 = x515
      (is_good_cond(tm_1) && @basics.free_in(tm_1, w))
    }, w)
    let (p, (t, u)) = @class.dest_cond(cond)
    let t516 = @term_syntax.parse_type("A")
    let inst = @kernel.inst_type(@list.List([(@kernel.type_of(t), t516)]), @class.cond_clauses())
    let (ct, cf) = @bool.conj_pair(@bool.spec(u, @bool.spec(t, inst)))
    let t525 = @bool.spec(p, @class.excluded_middle())
    @tactics.disj_cases_then2(fn(x517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th = x517
      let t520 = @tactics.assume_tac(th)
      let t519 = @tactics.subst1_tac(ct)
      @tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@bool.eqt_intro(th)), t519), t520)
    }, fn(x521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th_1 = x521
      let t524 = @tactics.assume_tac(th_1)
      let t523 = @tactics.subst1_tac(cf)
      @tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@bool.eqf_intro(th_1)), t523), t524)
    })(t525)((asl, w))
  })
}

///|
let cond_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("COND_CASES_TAC")

///|
/// `COND_CASES_TAC`
pub fn cond_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (cond_cases_tac_c.get())(x)
}

///|
/// `MATCH_MP_TAC`
pub fn match_mp_tac(x526 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x526
  let t528 = @tactics.match_mp_tac(@simp.pure_rewrite_rule(@list.List([@theorems.right_imp_forall_thm()]))(th))
  @tactics.orelse_tac(@tactics.match_mp_tac(th), t528)
}

///|
/// ZERO_LESS_EQ
fn step_62() -> Unit raise {
  zero_less_eq_c.set(@arith.le_0())
}

///|
let zero_less_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_LESS_EQ")

///|
/// `ZERO_LESS_EQ`
pub fn zero_less_eq() -> @kernel.Thm {
  zero_less_eq_c.get()
}

///|
/// LESS_EQ_MONO
fn step_63() -> Unit raise {
  less_eq_mono_c.set(@arith.le_suc())
}

///|
let less_eq_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_MONO")

///|
/// `LESS_EQ_MONO`
pub fn less_eq_mono() -> @kernel.Thm {
  less_eq_mono_c.get()
}

///|
/// NOT_LESS
fn step_64() -> Unit raise {
  not_less_c.set(@arith.not_lt())
}

///|
let not_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LESS")

///|
/// `NOT_LESS`
pub fn not_less() -> @kernel.Thm {
  not_less_c.get()
}

///|
/// LESS_0
fn step_65() -> Unit raise {
  less_0_c.set(@arith.lt_0())
}

///|
let less_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_0")

///|
/// `LESS_0`
pub fn less_0() -> @kernel.Thm {
  less_0_c.get()
}

///|
/// LESS_EQ_REFL
fn step_66() -> Unit raise {
  less_eq_refl_c.set(@arith.le_refl())
}

///|
let less_eq_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_REFL")

///|
/// `LESS_EQ_REFL`
pub fn less_eq_refl() -> @kernel.Thm {
  less_eq_refl_c.get()
}

///|
/// LESS_EQUAL_ANTISYM
fn step_67() -> Unit raise {
  less_equal_antisym_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.le_antisym())).0))
}

///|
let less_equal_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQUAL_ANTISYM")

///|
/// `LESS_EQUAL_ANTISYM`
pub fn less_equal_antisym() -> @kernel.Thm {
  less_equal_antisym_c.get()
}

///|
/// NOT_LESS_0
fn step_68() -> Unit raise {
  not_less_0_c.set(@bool.gen_all(@bool.eqf_elim(@bool.spec_all(@bool.conjunct1(@arith.lt())))))
}

///|
let not_less_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LESS_0")

///|
/// `NOT_LESS_0`
pub fn not_less_0() -> @kernel.Thm {
  not_less_0_c.get()
}

///|
/// LESS_TRANS
fn step_69() -> Unit raise {
  less_trans_c.set(@arith.lt_trans())
}

///|
let less_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_TRANS")

///|
/// `LESS_TRANS`
pub fn less_trans() -> @kernel.Thm {
  less_trans_c.get()
}

///|
/// LESS_LEMMA1
fn step_70() -> Unit raise {
  less_lemma1_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@bool.conjunct2(@arith.lt()))).0))
}

///|
let less_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_LEMMA1")

///|
/// `LESS_LEMMA1`
pub fn less_lemma1() -> @kernel.Thm {
  less_lemma1_c.get()
}

///|
/// LESS_SUC_REFL
fn step_71() -> Unit raise {
  let t529 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  less_suc_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n < SUC(n)"), t529))
}

///|
let less_suc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_SUC_REFL")

///|
/// `LESS_SUC_REFL`
pub fn less_suc_refl() -> @kernel.Thm {
  less_suc_refl_c.get()
}

///|
/// FACT_LESS
fn step_72() -> Unit raise {
  fact_less_c.set(@arith.fact_lt())
}

///|
let fact_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_LESS")

///|
/// `FACT_LESS`
pub fn fact_less() -> @kernel.Thm {
  fact_less_c.get()
}

///|
/// LESS_EQ_SUC_REFL
fn step_73() -> Unit raise {
  let t530 = @simp.rewrite_tac(@list.List([@arith.le(), @arith.le_refl()]))
  less_eq_suc_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= SUC(n)"), t530))
}

///|
let less_eq_suc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_SUC_REFL")

///|
/// `LESS_EQ_SUC_REFL`
pub fn less_eq_suc_refl() -> @kernel.Thm {
  less_eq_suc_refl_c.get()
}

///|
/// LESS_EQ_ADD
fn step_74() -> Unit raise {
  less_eq_add_c.set(@arith.le_add())
}

///|
let less_eq_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_ADD")

///|
/// `LESS_EQ_ADD`
pub fn less_eq_add() -> @kernel.Thm {
  less_eq_add_c.get()
}

///|
/// GREATER_EQ
fn step_75() -> Unit raise {
  greater_eq_c.set(@arith.ge())
}

///|
let greater_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREATER_EQ")

///|
/// `GREATER_EQ`
pub fn greater_eq() -> @kernel.Thm {
  greater_eq_c.get()
}

///|
/// LESS_EQUAL_ADD
fn step_76() -> Unit raise {
  less_equal_add_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.le_exists())).0))
}

///|
let less_equal_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQUAL_ADD")

///|
/// `LESS_EQUAL_ADD`
pub fn less_equal_add() -> @kernel.Thm {
  less_equal_add_c.get()
}

///|
/// LESS_EQ_IMP_LESS_SUC
fn step_77() -> Unit raise {
  less_eq_imp_less_suc_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.lt_suc_le())).1))
}

///|
let less_eq_imp_less_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_IMP_LESS_SUC")

///|
/// `LESS_EQ_IMP_LESS_SUC`
pub fn less_eq_imp_less_suc() -> @kernel.Thm {
  less_eq_imp_less_suc_c.get()
}

///|
/// LESS_IMP_LESS_OR_EQ
fn step_78() -> Unit raise {
  less_imp_less_or_eq_c.set(@arith.lt_imp_le())
}

///|
let less_imp_less_or_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_IMP_LESS_OR_EQ")

///|
/// `LESS_IMP_LESS_OR_EQ`
pub fn less_imp_less_or_eq() -> @kernel.Thm {
  less_imp_less_or_eq_c.get()
}

///|
/// LESS_MONO_ADD
fn step_79() -> Unit raise {
  less_mono_add_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.lt_add_rcancel())).1))
}

///|
let less_mono_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MONO_ADD")

///|
/// `LESS_MONO_ADD`
pub fn less_mono_add() -> @kernel.Thm {
  less_mono_add_c.get()
}

///|
/// LESS_SUC
fn step_80() -> Unit raise {
  let t531 = @meson.meson_tac(@list.List([@arith.lt()]))
  less_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → m < SUC(n)"), t531))
}

///|
let less_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_SUC")

///|
/// `LESS_SUC`
pub fn less_suc() -> @kernel.Thm {
  less_suc_c.get()
}

///|
/// LESS_CASES
fn step_81() -> Unit raise {
  less_cases_c.set(@arith.lte_cases())
}

///|
let less_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_CASES")

///|
/// `LESS_CASES`
pub fn less_cases() -> @kernel.Thm {
  less_cases_c.get()
}

///|
/// LESS_EQ
fn step_82() -> Unit raise {
  less_eq_c.set(@equal.gsym(@arith.le_suc_lt()))
}

///|
let less_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ")

///|
/// `LESS_EQ`
pub fn less_eq() -> @kernel.Thm {
  less_eq_c.get()
}

///|
/// LESS_OR_EQ
fn step_83() -> Unit raise {
  less_or_eq_c.set(@arith.le_lt())
}

///|
let less_or_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_OR_EQ")

///|
/// `LESS_OR_EQ`
pub fn less_or_eq() -> @kernel.Thm {
  less_or_eq_c.get()
}

///|
/// LESS_ADD_1
fn step_84() -> Unit raise {
  less_add_1_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@simp.rewrite_rule(@list.List([@arith.add1()]))(@arith.lt_exists()))).0))
}

///|
let less_add_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_ADD_1")

///|
/// `LESS_ADD_1`
pub fn less_add_1() -> @kernel.Thm {
  less_add_1_c.get()
}

///|
/// SUC_SUB1
fn step_85() -> Unit raise {
  suc_sub1_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, SUC(m) - 1 == m")))
}

///|
let suc_sub1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_SUB1")

///|
/// `SUC_SUB1`
pub fn suc_sub1() -> @kernel.Thm {
  suc_sub1_c.get()
}

///|
/// LESS_MONO_EQ
fn step_86() -> Unit raise {
  less_mono_eq_c.set(@arith.lt_suc())
}

///|
let less_mono_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MONO_EQ")

///|
/// `LESS_MONO_EQ`
pub fn less_mono_eq() -> @kernel.Thm {
  less_mono_eq_c.get()
}

///|
/// LESS_ADD_SUC
fn step_87() -> Unit raise {
  less_add_suc_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < m + SUC(n)")))
}

///|
let less_add_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_ADD_SUC")

///|
/// `LESS_ADD_SUC`
pub fn less_add_suc() -> @kernel.Thm {
  less_add_suc_c.get()
}

///|
/// LESS_REFL
fn step_88() -> Unit raise {
  less_refl_c.set(@arith.lt_refl())
}

///|
let less_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_REFL")

///|
/// `LESS_REFL`
pub fn less_refl() -> @kernel.Thm {
  less_refl_c.get()
}

///|
/// INV_SUC_EQ
fn step_89() -> Unit raise {
  inv_suc_eq_c.set(@nums.suc_inj())
}

///|
let inv_suc_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV_SUC_EQ")

///|
/// `INV_SUC_EQ`
pub fn inv_suc_eq() -> @kernel.Thm {
  inv_suc_eq_c.get()
}

///|
/// LESS_EQ_CASES
fn step_90() -> Unit raise {
  less_eq_cases_c.set(@arith.le_cases())
}

///|
let less_eq_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_CASES")

///|
/// `LESS_EQ_CASES`
pub fn less_eq_cases() -> @kernel.Thm {
  less_eq_cases_c.get()
}

///|
/// LESS_EQ_TRANS
fn step_91() -> Unit raise {
  less_eq_trans_c.set(@arith.le_trans())
}

///|
let less_eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_TRANS")

///|
/// `LESS_EQ_TRANS`
pub fn less_eq_trans() -> @kernel.Thm {
  less_eq_trans_c.get()
}

///|
/// LESS_THM
fn step_92() -> Unit raise {
  less_thm_c.set(@bool.conjunct2(@arith.lt()))
}

///|
let less_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_THM")

///|
/// `LESS_THM`
pub fn less_thm() -> @kernel.Thm {
  less_thm_c.get()
}

///|
/// GREATER
fn step_93() -> Unit raise {
  greater_c.set(@arith.gt())
}

///|
let greater_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREATER")

///|
/// `GREATER`
pub fn greater() -> @kernel.Thm {
  greater_c.get()
}

///|
/// LESS_EQ_0
fn step_94() -> Unit raise {
  less_eq_0_c.set(@bool.conjunct1(@arith.le()))
}

///|
let less_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_0")

///|
/// `LESS_EQ_0`
pub fn less_eq_0() -> @kernel.Thm {
  less_eq_0_c.get()
}

///|
/// OR_LESS
fn step_95() -> Unit raise {
  or_less_c.set(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.le_suc_lt())).0))
}

///|
let or_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_LESS")

///|
/// `OR_LESS`
pub fn or_less() -> @kernel.Thm {
  or_less_c.get()
}

///|
/// SUB_EQUAL_0
fn step_96() -> Unit raise {
  sub_equal_0_c.set(@arith.sub_refl())
}

///|
let sub_equal_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_EQUAL_0")

///|
/// `SUB_EQUAL_0`
pub fn sub_equal_0() -> @kernel.Thm {
  sub_equal_0_c.get()
}

///|
/// SUB_MONO_EQ
fn step_97() -> Unit raise {
  sub_mono_eq_c.set(@arith.sub_suc())
}

///|
let sub_mono_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_MONO_EQ")

///|
/// `SUB_MONO_EQ`
pub fn sub_mono_eq() -> @kernel.Thm {
  sub_mono_eq_c.get()
}

///|
/// NOT_SUC_LESS_EQ
fn step_98() -> Unit raise {
  not_suc_less_eq_c.set(@int.arith_rule(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, !(SUC(n) <= m) == (m <= n)")))
}

///|
let not_suc_less_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_SUC_LESS_EQ")

///|
/// `NOT_SUC_LESS_EQ`
pub fn not_suc_less_eq() -> @kernel.Thm {
  not_suc_less_eq_c.get()
}

///|
/// SUC_NOT
fn step_99() -> Unit raise {
  suc_not_c.set(@equal.gsym(@nums.not_suc()))
}

///|
let suc_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_NOT")

///|
/// `SUC_NOT`
pub fn suc_not() -> @kernel.Thm {
  suc_not_c.get()
}

///|
/// LESS_LESS_CASES
fn step_100() -> Unit raise {
  less_less_cases_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m == n || m < n || n < m")))
}

///|
let less_less_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_LESS_CASES")

///|
/// `LESS_LESS_CASES`
pub fn less_less_cases() -> @kernel.Thm {
  less_less_cases_c.get()
}

///|
/// NOT_LESS_EQUAL
fn step_101() -> Unit raise {
  not_less_equal_c.set(@arith.not_le())
}

///|
let not_less_equal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LESS_EQUAL")

///|
/// `NOT_LESS_EQUAL`
pub fn not_less_equal() -> @kernel.Thm {
  not_less_equal_c.get()
}

///|
/// LESS_EQ_EXISTS
fn step_102() -> Unit raise {
  less_eq_exists_c.set(@arith.le_exists())
}

///|
let less_eq_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_EXISTS")

///|
/// `LESS_EQ_EXISTS`
pub fn less_eq_exists() -> @kernel.Thm {
  less_eq_exists_c.get()
}

///|
/// LESS_MONO_ADD_EQ
fn step_103() -> Unit raise {
  less_mono_add_eq_c.set(@arith.lt_add_rcancel())
}

///|
let less_mono_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MONO_ADD_EQ")

///|
/// `LESS_MONO_ADD_EQ`
pub fn less_mono_add_eq() -> @kernel.Thm {
  less_mono_add_eq_c.get()
}

///|
/// LESS_LESS_EQ_TRANS
fn step_104() -> Unit raise {
  less_less_eq_trans_c.set(@arith.lte_trans())
}

///|
let less_less_eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_LESS_EQ_TRANS")

///|
/// `LESS_LESS_EQ_TRANS`
pub fn less_less_eq_trans() -> @kernel.Thm {
  less_less_eq_trans_c.get()
}

///|
/// SUB_SUB
fn step_105() -> Unit raise {
  sub_sub_c.set(@int.arith_rule(@term_syntax.parse_term("∀ b : Num, ∀ c : Num, c <= b → (∀ a : Num, a - (b - c) == a + c - b)")))
}

///|
let sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_SUB")

///|
/// `SUB_SUB`
pub fn sub_sub() -> @kernel.Thm {
  sub_sub_c.get()
}

///|
/// LESS_CASES_IMP
fn step_106() -> Unit raise {
  less_cases_imp_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m < n) && !(m == n) → n < m")))
}

///|
let less_cases_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_CASES_IMP")

///|
/// `LESS_CASES_IMP`
pub fn less_cases_imp() -> @kernel.Thm {
  less_cases_imp_c.get()
}

///|
/// SUB_LESS_EQ
fn step_107() -> Unit raise {
  sub_less_eq_c.set(@int.arith_rule(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, n - m <= n")))
}

///|
let sub_less_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_LESS_EQ")

///|
/// `SUB_LESS_EQ`
pub fn sub_less_eq() -> @kernel.Thm {
  sub_less_eq_c.get()
}

///|
/// SUB_EQ_EQ_0
fn step_108() -> Unit raise {
  sub_eq_eq_0_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m - n == m) == (m == 0) || n == 0")))
}

///|
let sub_eq_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_EQ_EQ_0")

///|
/// `SUB_EQ_EQ_0`
pub fn sub_eq_eq_0() -> @kernel.Thm {
  sub_eq_eq_0_c.get()
}

///|
/// SUB_LEFT_LESS_EQ
fn step_109() -> Unit raise {
  sub_left_less_eq_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m <= n - p) == (m + p <= n || m <= 0)")))
}

///|
let sub_left_less_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_LEFT_LESS_EQ")

///|
/// `SUB_LEFT_LESS_EQ`
pub fn sub_left_less_eq() -> @kernel.Thm {
  sub_left_less_eq_c.get()
}

///|
/// SUB_LEFT_GREATER_EQ
fn step_110() -> Unit raise {
  sub_left_greater_eq_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m >= n - p) == (m + p >= n)")))
}

///|
let sub_left_greater_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_LEFT_GREATER_EQ")

///|
/// `SUB_LEFT_GREATER_EQ`
pub fn sub_left_greater_eq() -> @kernel.Thm {
  sub_left_greater_eq_c.get()
}

///|
/// LESS_EQ_LESS_TRANS
fn step_111() -> Unit raise {
  less_eq_less_trans_c.set(@arith.let_trans())
}

///|
let less_eq_less_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_LESS_TRANS")

///|
/// `LESS_EQ_LESS_TRANS`
pub fn less_eq_less_trans() -> @kernel.Thm {
  less_eq_less_trans_c.get()
}

///|
/// LESS_0_CASES
fn step_112() -> Unit raise {
  less_0_cases_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, 0 == m || 0 < m")))
}

///|
let less_0_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_0_CASES")

///|
/// `LESS_0_CASES`
pub fn less_0_cases() -> @kernel.Thm {
  less_0_cases_c.get()
}

///|
/// LESS_OR
fn step_113() -> Unit raise {
  less_or_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → SUC(m) <= n")))
}

///|
let less_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_OR")

///|
/// `LESS_OR`
pub fn less_or() -> @kernel.Thm {
  less_or_c.get()
}

///|
/// SUB
fn step_114() -> Unit raise {
  sub_c.set(@int.arith_rule(@term_syntax.parse_term("(∀ m : Num, 0 - m == 0) && (∀ m : Num, ∀ n : Num, SUC(m) - n == (if m < n { 0 } else { SUC(m - n) }))")))
}

///|
let sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB")

///|
/// `SUB`
pub fn sub() -> @kernel.Thm {
  sub_c.get()
}

///|
/// LESS_MULT_MONO
fn step_115() -> Unit raise {
  let t532 = @simp.rewrite_tac(@list.List([@arith.lt_mult_lcancel(), @nums.not_suc()]))
  less_mult_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ i : Num, ∀ n : Num, (SUC(n) * m < SUC(n) * i) == (m < i)"), t532))
}

///|
let less_mult_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MULT_MONO")

///|
/// `LESS_MULT_MONO`
pub fn less_mult_mono() -> @kernel.Thm {
  less_mult_mono_c.get()
}

///|
/// LESS_MONO_MULT
fn step_116() -> Unit raise {
  let t533 = @simp.simp_tac(@list.List([@arith.le_mult_rcancel()]))
  less_mono_mult_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n → m * p <= n * p"), t533))
}

///|
let less_mono_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MONO_MULT")

///|
/// `LESS_MONO_MULT`
pub fn less_mono_mult() -> @kernel.Thm {
  less_mono_mult_c.get()
}

///|
/// LESS_MULT2
fn step_117() -> Unit raise {
  let t534 = @simp.rewrite_tac(@list.List([@arith.lt_mult()]))
  less_mult2_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, 0 < m && 0 < n → 0 < m * n"), t534))
}

///|
let less_mult2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_MULT2")

///|
/// `LESS_MULT2`
pub fn less_mult2() -> @kernel.Thm {
  less_mult2_c.get()
}

///|
/// SUBSET_FINITE
fn step_118() -> Unit raise {
  let t535 = @meson.meson_tac(@list.List([@sets.finite_subset()]))
  subset_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → (∀ t : (_) -> Bool, SUBSET(t, s) → FINITE(t))"), t535))
}

///|
let subset_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_FINITE")

///|
/// `SUBSET_FINITE`
pub fn subset_finite() -> @kernel.Thm {
  subset_finite_c.get()
}

///|
/// LESS_EQ_SUC
fn step_119() -> Unit raise {
  let t536 = @simp.rewrite_tac(@list.List([@arith.le()]))
  less_eq_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ((m : Num) <= SUC(n)) == (m == SUC(n) || m <= n)"), t536))
}

///|
let less_eq_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_SUC")

///|
/// `LESS_EQ_SUC`
pub fn less_eq_suc() -> @kernel.Thm {
  less_eq_suc_c.get()
}

///|
/// Examples/hol88.ml:1061
fn step_120() -> Unit raise {
  @printer.parse_as_infix("=", (2L, "right"))
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
}
