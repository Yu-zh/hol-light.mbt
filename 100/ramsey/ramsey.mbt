// Translated from upstream 100/ramsey.ml; edit this file directly.

///|
/// `is_neg_imp`
pub fn is_neg_imp(x1 : @kernel.Term) -> Bool raise {
  let tm = x1
  (@basics.is_neg(tm) || @basics.is_imp(tm))
}

///|
/// `dest_neg_imp`
pub fn dest_neg_imp(x2 : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  let tm = x2
  try {
    @basics.dest_imp(tm)
  } catch {
    Failure(_) => {
      try {
        let t3 = @kernel.mk_const("F", @list.List([]))
        (@basics.dest_neg(tm), t3)
      } catch {
        Failure(_) => raise Failure("dest_neg_imp")
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// PROVE
fn step_1() -> Unit raise {
  prove_c.set(fn(x4 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x4.0, x4.1)
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
pub fn prove_thm(x5 : String, x6 : @kernel.Term, x7 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
  let (_ as s, g, t) = (x5, x6, x7)
  @tactics.prove(g, t)
}

///|
/// CONV_OF_RCONV
fn step_2() -> Unit raise {
  fn get_bv(x8 : @kernel.Term) -> @kernel.Term raise {
    let tm = x8
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
  conv_of_rconv_c.set(fn(x9 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let conv = x9
    fn(x10 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x10
      let v = get_bv(tm_1)
      let th1 = conv(tm_1)
      let t11 = @equal.rhs(@kernel.concl(th1))
      let th2 = @equal.once_depth_conv(@equal.gen_alpha_conv(v))(t11)
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
fn step_3() -> Unit raise {
  conv_of_thm_c.set(fn(x12 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    conv_of_rconv(@simp.rewr_conv(x12))
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
pub fn x_fun_eq_conv(x13 : @kernel.Term) -> @equal.Conv raise {
  let v = x13
  let t15 = @equal.gen_alpha_conv(v)
  @equal.thenc(@simp.rewr_conv(@class.fun_eq_thm()), t15)
}

///|
/// `FUN_EQ_CONV`
pub fn fun_eq_conv(x16 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x16
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
    _ => raise @lib.MatchFailure("tscript.ml:51")
  }
}

///|
/// SINGLE_DEPTH_CONV
fn step_4() -> Unit raise {
  fn single_depth_conv_1(x17 : (@kernel.Term) -> @kernel.Thm raise, x18 : @kernel.Term) -> @kernel.Thm raise {
    let conv = x17
    let tm = x18
    try {
      conv(tm)
    } catch {
      Failure(_) => {
        let t20 = @equal.try_conv(conv)
        @equal.thenc(@equal.sub_conv((x19 : @kernel.Term) => single_depth_conv_1(conv, x19)), t20)(tm)
      }
      e => raise e
    }
  }
  single_depth_conv_c.set(fn(x21 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x22 : @kernel.Term) -> @kernel.Thm raise {
      single_depth_conv_1(x21, x22)
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
fn step_5() -> Unit raise {
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
pub fn x_skolem_conv(x23 : @kernel.Term) -> @equal.Conv raise {
  let v = x23
  @equal.thenc(skolem_conv, @equal.gen_alpha_conv(v))
}

///|
/// `EXISTS_UNIQUE_CONV`
pub fn exists_unique_conv(x25 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x25
  let v = @basics.bndvar(@kernel.rand(tm))
  let th1 = @simp.rewr_conv(@theorems.exists_unique_thm())(tm)
  let tm1 = @equal.rhs(@kernel.concl(th1))
  let vars = @kernel.frees(tm1)
  let v_1 = @kernel.variant(vars, v)
  let v_p = @kernel.variant(vars.prepend(v_1), v_1)
  let t26 = @equal.gen_alpha_conv(v_1)
  let t27 = @equal.rand_conv(@equal.thenc(@equal.binder_conv(@equal.gen_alpha_conv(v_p)), t26))
  let th2 = @equal.thenc(@equal.land_conv(@equal.gen_alpha_conv(v_1)), t27)(tm1)
  @kernel.trans(th1, th2)
}

///|
/// NOT_FORALL_CONV
fn step_6() -> Unit raise {
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
fn step_7() -> Unit raise {
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
fn step_8() -> Unit raise {
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
fn step_9() -> Unit raise {
  let t29 = @simp.rewr_conv(@theorems.left_forall_imp_thm())
  let t28 = @simp.rewr_conv(@theorems.right_forall_imp_thm())
  forall_imp_conv_c.set(conv_of_rconv(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@theorems.triv_forall_imp_thm()), t28), t29)))
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
fn step_10() -> Unit raise {
  let t31 = @simp.rewr_conv(@theorems.right_exists_and_thm())
  let t30 = @simp.rewr_conv(@theorems.left_exists_and_thm())
  exists_and_conv_c.set(conv_of_rconv(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@theorems.triv_exists_and_thm()), t30), t31)))
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
fn step_11() -> Unit raise {
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
pub fn left_and_exists_conv(x32 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x32
  let v = @basics.bndvar(@kernel.rand(@kernel.rand(@kernel.rator(tm))))
  let t33 = @equal.try_conv(@equal.gen_alpha_conv(v))
  @equal.thenc(@simp.rewr_conv(@theorems.left_and_exists_thm()), t33)(tm)
}

///|
/// RIGHT_AND_EXISTS_CONV
fn step_12() -> Unit raise {
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
fn step_13() -> Unit raise {
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
/// AND1_THM
fn step_14() -> Unit raise {
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
fn step_15() -> Unit raise {
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
fn step_16() -> Unit raise {
  and_imp_intro_c.set(@class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, t1 → t2 → t3 == t1 && t2 → t3")))
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
fn step_17() -> Unit raise {
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
fn step_18() -> Unit raise {
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
fn step_19() -> Unit raise {
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
fn step_20() -> Unit raise {
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
fn step_21() -> Unit raise {
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
fn step_22() -> Unit raise {
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
fn step_23() -> Unit raise {
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
fn step_24() -> Unit raise {
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
fn step_25() -> Unit raise {
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
fn step_26() -> Unit raise {
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
fn step_27() -> Unit raise {
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
fn step_28() -> Unit raise {
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
fn step_29() -> Unit raise {
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
fn step_30() -> Unit raise {
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
fn step_31() -> Unit raise {
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
fn step_32() -> Unit raise {
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
fn step_33() -> Unit raise {
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
fn step_34() -> Unit raise {
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
fn step_35() -> Unit raise {
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
fn step_36() -> Unit raise {
  is_type_c.set((x34 : String) => @lib.can(@kernel.get_type_arity, x34))
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
fn step_37() -> Unit raise {
  is_constant_c.set((x35 : String) => @lib.can(@kernel.get_const_type, x35))
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
pub fn[TA] null(x36 : @list.List[TA]) -> Bool raise {
  let l = x36
  @list.List::is_empty(l)
}

///|
/// type_tyvars
fn step_38() -> Unit raise {
  type_tyvars_c.set(fn(x40 : @kernel.HolType) -> @list.List[@kernel.HolType] raise {
    (fn(x37 : @kernel.Term) -> @list.List[@kernel.HolType] raise {
      @kernel.type_vars_in_term(x37)
    })(((x39 : @kernel.HolType) => @lib.curry(fn(x38 : (String, @kernel.HolType)) -> @kernel.Term raise {
      @kernel.mk_var(x38.0, x38.1)
    }, "x", x39))(x40))
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
pub fn find_match(x41 : @kernel.Term) -> ((@kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise) raise {
  let u = x41
  fn find_mt(x43 : @kernel.Term) -> @drule.Instantiation raise {
    let t = x43
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
  fn(x44 : @kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
    let t_1 = x44
    let (_, tmin, tyin) = find_mt(t_1)
    (tmin, tyin)
  }
}

///|
/// `mk_primed_var`
pub fn mk_primed_var(x45 : String, x46 : @kernel.HolType) -> @kernel.Term raise {
  let (name, ty) = (x45, x46)
  if @lib.can(@kernel.get_const_type, name) {
    mk_primed_var((name + "'"), ty)
  } else {
    @kernel.mk_var(name, ty)
  }
}

///|
/// subst_occs
fn step_39() -> Unit raise {
  fn subst_occs_1(x47 : @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))], x48 : @kernel.Term) -> ((@kernel.Term, @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))])) raise {
    let slist = x47
    let tm = x48
    let (applic, noway) = @lib.partition(fn(x49 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let (i, (t, x)) = x49
      @basics.aconv(tm, x)
    }, slist)
    let sposs = @lib.map(fn(x50 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> ((@list.List[Int64], (@kernel.Term, @kernel.Term)), (@list.List[Int64], (@kernel.Term, @kernel.Term))) raise {
      let (l, z) = x50
      let (l1, l2) = @lib.partition(fn(x51 : Int64) -> Bool raise {
        (1L == x51)
      }, l)
      ((l1, z), (l2, z))
    }, applic)
    let (racts, rrest) = @lib.unzip(sposs)
    let acts = @lib.filter(fn(x52 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_1 = x52
      !@list.List::is_empty(t_1.0)
    }, racts)
    let trest = @lib.map(fn(x53 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> (@list.List[Int64], (@kernel.Term, @kernel.Term)) raise {
      let (n, t_2) = x53
      (@lib.map(fn(x56 : Int64) -> Int64 raise {
        (fn(x54 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x55 : Int64) -> Int64 raise {
            @lib.sub63(x54, x55)
          }
        })(x56)(1L)
      }, n), t_2)
    }, rrest)
    let urest = @lib.filter(fn(x57 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_3 = x57
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
      let tm_p_1 = (fn(x58 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> @kernel.Term raise {
        let (n_1, (t_4, x_1)) = x58
        @basics.subst(@list.List([(t_4, x_1)]), tm)
      })(@lib.hd(acts))
      (tm_p_1, tlist)
    }
  }
  subst_occs_c.set(fn(x59 : @list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
    let ilist = x59
    fn(x60 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      let slist_1 = x60
      fn(x61 : @kernel.Term) -> @kernel.Term raise {
        let tm_1 = x61
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
pub fn inst_ty_term(x62 : (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x63 : @kernel.Thm) -> @kernel.Thm raise {
  let (substl, insttyl) = x62
  let th = x63
  let th_p = @kernel.inst_rule(substl, @kernel.inst_type(insttyl, th))
  let t64 = @kernel.hyp(th)
  if (@kernel.hyp(th_p) == t64) {
    th_p
  } else {
    raise Failure("INST_TY_TERM: Free term and/or type variables in hypotheses")
  }
}

///|
/// `RIGHT_CONV_RULE`
pub fn right_conv_rule(x65 : (@kernel.Term) -> @kernel.Thm raise, x66 : @kernel.Thm) -> @kernel.Thm raise {
  let _ as conv = x65
  let th = x66
  @kernel.trans(th, conv(@equal.rhs(@kernel.concl(th))))
}

///|
/// NOT_EQ_SYM
fn step_40() -> Unit raise {
  let t69 = @bool.disch_all(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(a : A) == (b : A)"))))
  let t70 = @simp.gen_rewrite_rule(fn(x68 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x68
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))(t69)
  let t67 = @term_syntax.parse_term("(b : A)")
  let pth = @bool.genl(@list.List([@term_syntax.parse_term("(a : A)"), t67]), t70)
  let aty = @term_syntax.parse_type("A")
  not_eq_sym_c.set(fn(x71 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x71
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
pub fn not_mp(x72 : @kernel.Thm, x73 : @kernel.Thm) -> @kernel.Thm raise {
  let thi = x72
  let th = x73
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
pub fn forall_eq(x74 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x74
  let t76 = @kernel.mk_vartype("A")
  let t77 = @kernel.mk_const("forall", @list.List([(@kernel.type_of(x), t76)]))
  let mkall : (@kernel.Thm) -> @kernel.Thm raise = (x78 : @kernel.Thm) => @equal.ap_term(t77, x78)
  fn(x79 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x79
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
pub fn exists_eq(x80 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x80
  let t82 = @kernel.mk_vartype("A")
  let t83 = @kernel.mk_const("?", @list.List([(@kernel.type_of(x), t82)]))
  let mkex : (@kernel.Thm) -> @kernel.Thm raise = (x84 : @kernel.Thm) => @equal.ap_term(t83, x84)
  fn(x85 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x85
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
pub fn select_eq(x86 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x86
  let t88 = @kernel.mk_vartype("A")
  let t89 = @kernel.mk_const("@", @list.List([(@kernel.type_of(x), t88)]))
  let mksel : (@kernel.Thm) -> @kernel.Thm raise = (x90 : @kernel.Thm) => @equal.ap_term(t89, x90)
  fn(x91 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x91
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
pub fn right_beta(x92 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x92
  try {
    @kernel.trans(th, @equal.beta_conv(@equal.rhs(@kernel.concl(th))))
  } catch {
    Failure(_) => raise Failure("RIGHT_BETA")
    e => raise e
  }
}

///|
/// `LIST_BETA_CONV`
pub fn list_beta_conv(x93 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x93
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
pub fn right_list_beta(x94 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x94
  @kernel.trans(th, list_beta_conv(@kernel.dest_eq(@kernel.concl(th)).1))
}

///|
/// LIST_CONJ
fn step_41() -> Unit raise {
  list_conj_c.set((x95 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x95))
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
pub fn conj_list(x96 : Int64, x97 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let n = x96
  let th = x97
  try {
    if (n == 1L) {
      @list.List([th])
    } else {
      let t98 = @bool.conjunct2(th)
      let t99 = conj_list(@lib.sub63(n, 1L), t98)
      t99.prepend(@bool.conjunct1(th))
    }
  } catch {
    Failure(_) => raise Failure("CONJ_LIST")
    e => raise e
  }
}

///|
/// `BODY_CONJUNCTS`
pub fn body_conjuncts(x100 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x100
  if @basics.is_forall(@kernel.concl(th)) {
    body_conjuncts(@bool.spec_all(th))
  } else {
    if @basics.is_conj(@kernel.concl(th)) {
      let t101 = body_conjuncts(@bool.conjunct2(th))
      body_conjuncts(@bool.conjunct1(th)).concat(t101)
    } else {
      @list.List([th])
    }
  }
}

///|
/// `IMP_CANON`
pub fn imp_canon(x102 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x102
  let w = @kernel.concl(th)
  if @basics.is_conj(w) {
    let t103 = imp_canon(@bool.conjunct2(th))
    imp_canon(@bool.conjunct1(th)).concat(t103)
  } else {
    if @basics.is_imp(w) {
      let (ante, conc) = dest_neg_imp(w)
      if @basics.is_conj(ante) {
        let (a, b) = @basics.dest_conj(ante)
        let t104 = @kernel.assume_rule(b)
        imp_canon(@bool.disch(a, @bool.disch(b, not_mp(th, @bool.conj(@kernel.assume_rule(a), t104)))))
      } else {
        if @basics.is_disj(ante) {
          let (a_1, b_1) = @basics.dest_disj(ante)
          let t105 = imp_canon(@bool.disch(b_1, not_mp(th, @bool.disj2(a_1, @kernel.assume_rule(b_1)))))
          imp_canon(@bool.disch(a_1, not_mp(th, @bool.disj1(@kernel.assume_rule(a_1), b_1)))).concat(t105)
        } else {
          if @basics.is_exists(ante) {
            let (x, body) = @basics.dest_exists(ante)
            let x_p = @kernel.variant(@basics.thm_frees(th), x)
            let body_p = @basics.subst(@list.List([(x_p, x)]), body)
            imp_canon(@bool.disch(body_p, not_mp(th, @bool.exists_rule(ante, x_p, @kernel.assume_rule(body_p)))))
          } else {
            @lib.map((x106 : @kernel.Thm) => @bool.disch(ante, x106), imp_canon(@bool.undisch(th)))
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
fn step_42() -> Unit raise {
  list_mp_c.set(fn(x111 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x112 : @kernel.Thm) -> @kernel.Thm raise {
      ((x109 : @list.List[@kernel.Thm], x110 : @kernel.Thm) => @lib.rev_itlist(fn(x107 : @kernel.Thm, x108 : @kernel.Thm) -> @kernel.Thm raise {
        let x = x107
        let y = x108
        @bool.mp(y, x)
      }, x109, x110))(x111, x112)
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
fn step_43() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, t1 || t2 → !t1 → t2"))
  disj_imp_c.set(fn(x113 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x113
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
fn step_44() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 → t2) → !t1 || t2"))
  imp_elim_c.set(fn(x114 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x114
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
pub fn disj_cases_union(x115 : @kernel.Thm, x116 : @kernel.Thm, x117 : @kernel.Thm) -> @kernel.Thm raise {
  let dth = x115
  let ath = x116
  let bth = x117
  let t118 = @bool.disj2(@kernel.concl(ath), bth)
  @bool.disj_cases(dth, @bool.disj1(ath, @kernel.concl(bth)), t118)
}

///|
/// `MK_ABS`
pub fn mk_abs(x119 : @kernel.Thm) -> @kernel.Thm raise {
  let qth = x119
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
pub fn half_mk_abs(x120 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x120
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
pub fn mk_exists(x121 : @kernel.Thm) -> @kernel.Thm raise {
  let qth = x121
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
pub fn list_mk_exists(x122 : @list.List[@kernel.Term], x123 : @kernel.Thm) -> @kernel.Thm raise {
  let l = x122
  let th = x123
  @lib.itlist(fn(x124 : @kernel.Term, x125 : @kernel.Thm) -> @kernel.Thm raise {
    let x = x124
    let th_1 = x125
    mk_exists(@bool.gen(x, th_1))
  }, l, th)
}

///|
/// `IMP_CONJ`
pub fn imp_conj(x126 : @kernel.Thm, x127 : @kernel.Thm) -> @kernel.Thm raise {
  let th1 = x126
  let th2 = x127
  let (a1, c1) = @basics.dest_imp(@kernel.concl(th1))
  let (a2, c2) = @basics.dest_imp(@kernel.concl(th2))
  let (a1_1, a2_1) = @bool.conj_pair(@kernel.assume_rule(@bool.mk_conj(a1, a2)))
  let t128 = @bool.mp(th2, a2_1)
  let t129 = @bool.conj(@bool.mp(th1, a1_1), t128)
  @bool.disch(@bool.mk_conj(a1, a2), t129)
}

///|
/// `EXISTS_IMP`
pub fn exists_imp(x130 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let x = x130
  if !@kernel.is_var(x) {
    raise Failure("EXISTS_IMP: first argument not a variable")
  } else {
    fn(x132 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x132
      try {
        let (ante, cncl) = @basics.dest_imp(@kernel.concl(th))
        let t133 = @bool.undisch(th)
        let th1 = @bool.exists_rule(@bool.mk_exists(x, cncl), x, t133)
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
pub fn conjuncts_conv(x134 : @kernel.Term, x135 : @kernel.Term) -> @kernel.Thm raise {
  let (t1, t2) = (x134, x135)
  fn build_conj(x136 : @list.List[@kernel.Thm], x137 : @kernel.Term) -> @kernel.Thm raise {
    let thl = x136
    let t = x137
    try {
      let (l, r) = @basics.dest_conj(t)
      let t138 = build_conj(thl, r)
      @bool.conj(build_conj(thl, l), t138)
    } catch {
      Failure(_) => @lib.find(fn(x139 : @kernel.Thm) -> Bool raise {
        let th = x139
        (@kernel.concl(th) == t)
      }, thl)
      e => raise e
    }
  }
  try {
    let t140 = @bool.disch(t2, build_conj(@bool.conjuncts_rule(@kernel.assume_rule(t2)), t1))
    @bool.imp_antisym_rule(@bool.disch(t1, build_conj(@bool.conjuncts_rule(@kernel.assume_rule(t1)), t2)), t140)
  } catch {
    Failure(_) => raise Failure("CONJUNCTS_CONV")
    e => raise e
  }
}

///|
/// `CONJ_SET_CONV`
pub fn conj_set_conv(x141 : @list.List[@kernel.Term], x142 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
  let l1 = x141
  let l2 = x142
  try {
    let t143 = @bool.list_mk_conj(l2)
    conjuncts_conv(@bool.list_mk_conj(l1), t143)
  } catch {
    Failure(_) => raise Failure("CONJ_SET_CONV")
    e => raise e
  }
}

///|
/// `FRONT_CONJ_CONV`
pub fn front_conj_conv(x144 : @list.List[@kernel.Term], x145 : @kernel.Term) -> @kernel.Thm raise {
  let tml = x144
  let t = x145
  try {
    conj_set_conv(tml, remove_l(t, tml).prepend(t))
  } catch {
    Failure(_) => raise Failure("FRONT_CONJ_CONV")
    e => raise e
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] remove_l(x146 : TA, x147 : @list.List[TA]) -> @list.List[TA] raise {
  let x = x146
  let l = x147
  if (@lib.hd(l) == x) {
    @lib.tl(l)
  } else {
    let t148 = remove_l(x, @lib.tl(l))
    t148.prepend(@lib.hd(l))
  }
}

///|
/// CONJ_DISCH
fn step_45() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("∀ t : Bool, ∀ t1 : Bool, ∀ t2 : Bool, (t → t1 == t2) → (t && t1) == (t && t2)"))
  conj_disch_c.set(fn(x149 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let t = x149
    fn(x150 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x150
      try {
        let (t1, t2) = @kernel.dest_eq(@kernel.concl(th))
        let t151 = @bool.disch(t, th)
        @bool.mp(@bool.specl(@list.List([t, t1, t2]), pth), t151)
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
pub fn conj_dischl(x152 : @list.List[@kernel.Term], x153 : @kernel.Thm) -> @kernel.Thm raise {
  let l = x152
  let th = x153
  if @list.List::is_empty(l) {
    th
  } else {
    let t154 = conj_dischl(@lib.tl(l), th)
    conj_disch(@lib.hd(l))(t154)
  }
}

///|
/// `GSPEC`
pub fn gspec(x155 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x155
  let (wl, w) = @kernel.dest_thm(th)
  if @basics.is_forall(w) {
    gspec(@bool.spec(@basics.genvar(@kernel.type_of(@basics.dest_forall(w).0)), th))
  } else {
    th
  }
}

///|
/// `ANTE_CONJ_CONV`
pub fn ante_conj_conv(x156 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x156
  try {
    let t158 = @basics.dest_imp(tm)
    let t159 = (fn(x157 : @kernel.Term) -> @kernel.Term raise {
      x157
    })(t158.1)
    let ((a1, a2), c) = (@basics.dest_conj(t158.0), t159)
    let t160 = @kernel.assume_rule(a2)
    let t161 = @bool.conj(@kernel.assume_rule(a1), t160)
    let imp1 = @bool.mp(@kernel.assume_rule(tm), t161)
    let t163 = @kernel.assume_rule(@bool.mk_imp(a1, @bool.mk_imp(a2, c)))
    let t162 = @bool.conjunct2(@kernel.assume_rule(@bool.mk_conj(a1, a2)))
    let imp2 = list_mp(@list.List([@bool.conjunct1(@kernel.assume_rule(@bool.mk_conj(a1, a2))), t162]))(t163)
    let t164 = @bool.disch_all(@bool.disch(@bool.mk_conj(a1, a2), imp2))
    @bool.imp_antisym_rule(@bool.disch_all(@bool.disch(a1, @bool.disch(a2, imp1))), t164)
  } catch {
    Failure(_) => raise Failure("ANTE_CONJ_CONV")
    e => raise e
  }
}

///|
/// bool_EQ_CONV
fn step_46() -> Unit raise {
  let boolty = @term_syntax.parse_type("Bool")
  let check : (@kernel.Term) -> @kernel.Term raise = (x166 : @kernel.Term) => @lib.check(fn(x165 : @kernel.Term) -> Bool raise {
    let tm = x165
    (@kernel.type_of(tm) == boolty)
  }, x166)
  let t169 = @bool.conjuncts_rule(@bool.spec(@term_syntax.parse_term("(b : Bool)"), @theorems.eq_clauses()))
  let t167 = @term_syntax.parse_term("(b : Bool)")
  let clist = @lib.map((x168 : @kernel.Thm) => @bool.gen(t167, x168), t169)
  let tb = @lib.hd(clist)
  let bt = @lib.hd(@lib.tl(clist))
  let t = @term_syntax.parse_term("true")
  let f = @term_syntax.parse_term("false")
  bool_eq_conv_c.set(fn(x170 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x170
    try {
      let t172 = @kernel.dest_eq(tm_1)
      let t173 = check(t172.1)
      let (l, r) = ((fn(x171 : @kernel.Term) -> @kernel.Term raise {
        x171
      })(t172.0), t173)
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
fn step_47() -> Unit raise {
  let t = @term_syntax.parse_term("true")
  let f = @term_syntax.parse_term("false")
  let vt = @basics.genvar(@term_syntax.parse_type("A"))
  let vf = @basics.genvar(@term_syntax.parse_type("A"))
  let gen : (@kernel.Thm) -> @kernel.Thm raise = (x174 : @kernel.Thm) => @bool.genl(@list.List([vt, vf]), x174)
  let t175 = @bool.conj_pair(@bool.specl(@list.List([vt, vf]), @class.cond_clauses()))
  let t176 = gen(t175.1)
  let (ct, cf) = (gen(t175.0), t176)
  cond_conv_c.set(fn(x177 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x177
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
            let t178 = @equal.alpha_rule(v, u)
            let cnd = @equal.ap_term(@kernel.rator(tm), t178)
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
pub fn subst_match(x179 : @kernel.Thm, x180 : @kernel.Thm) -> @kernel.Thm raise {
  let eqth = x179
  let th = x180
  let t181 = @kernel.concl(th)
  let (tm_inst, ty_inst) = find_match(@equal.lhs(@kernel.concl(eqth)))(t181)
  @equal.subs(@list.List([@kernel.inst_rule(tm_inst, @kernel.inst_type(ty_inst, eqth))]), th)
}

///|
/// `SUBST`
pub fn subst(x182 : @list.List[(@kernel.Thm, @kernel.Term)], x183 : @kernel.Term, x184 : @kernel.Thm) -> @kernel.Thm raise {
  let thl = x182
  let pat = x183
  let th = x184
  let (eqs, vs) = @lib.unzip(thl)
  let gvs = @lib.map(fn(x187 : @kernel.Term) -> @kernel.Term raise {
    (fn(x185 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x185)
    })((fn(x186 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x186)
    })(x187))
  }, vs)
  let gpat = @basics.subst(@lib.zip(gvs, vs), pat)
  let (ls, rs) = @lib.unzip(@lib.map(fn(x189 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_eq((fn(x188 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x188)
    })(x189))
  }, eqs))
  let ths = @lib.map(fn(x191 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
    @kernel.assume_rule((fn(x190 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @basics.mk_eq(x190.0, x190.1)
    })(x191))
  }, @lib.zip(gvs, rs))
  let th1 = @kernel.assume_rule(gpat)
  let th2 = @equal.subs(ths, th1)
  let t193 = @bool.disch(gpat, th2)
  let th3 = @lib.itlist(@bool.disch, @lib.map(fn(x192 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x192)
  }, ths), t193)
  let th4 = @kernel.inst_rule(@lib.zip(ls, gvs), th3)
  @bool.mp(@lib.rev_itlist(fn(x196 : @kernel.Thm, x197 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x194 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x195 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.mp(x194, x195)
      }
    })(x197)(x196)
  }, eqs, th4), th)
}

///|
/// `SUBST_CONV`
pub fn subst_conv(x198 : @list.List[(@kernel.Thm, @kernel.Term)], x199 : @kernel.Term, x200 : @kernel.Term) -> @kernel.Thm raise {
  let thvars = x198
  let template = x199
  let tm = x200
  let (thms, vars) = @lib.unzip(thvars)
  let gvs = @lib.map(fn(x203 : @kernel.Term) -> @kernel.Term raise {
    (fn(x201 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x201)
    })((fn(x202 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x202)
    })(x203))
  }, vars)
  let gtemplate = @basics.subst(@lib.zip(gvs, vars), template)
  let t204 = @kernel.refl(tm)
  let t205 = @basics.mk_eq(template, gtemplate)
  subst(@lib.zip(thms, gvs), t205, t204)
}

///|
/// `FILTER_PURE_ASM_REWRITE_RULE`
pub fn filter_pure_asm_rewrite_rule(x206 : (@kernel.Term) -> Bool raise, x207 : @list.List[@kernel.Thm], x208 : @kernel.Thm) -> @kernel.Thm raise {
  let f = x206
  let thl = x207
  let th = x208
  @simp.pure_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f, @kernel.hyp(th))).concat(thl))(th)
}

///|
/// `FILTER_ASM_REWRITE_RULE`
pub fn filter_asm_rewrite_rule(x209 : (@kernel.Term) -> Bool raise, x210 : @list.List[@kernel.Thm], x211 : @kernel.Thm) -> @kernel.Thm raise {
  let f_1 = x209
  let thl_1 = x210
  let th_1 = x211
  @simp.rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_1, @kernel.hyp(th_1))).concat(thl_1))(th_1)
}

///|
/// `FILTER_PURE_ONCE_ASM_REWRITE_RULE`
pub fn filter_pure_once_asm_rewrite_rule(x212 : (@kernel.Term) -> Bool raise, x213 : @list.List[@kernel.Thm], x214 : @kernel.Thm) -> @kernel.Thm raise {
  let f_2 = x212
  let thl_2 = x213
  let th_2 = x214
  @simp.pure_once_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_2, @kernel.hyp(th_2))).concat(thl_2))(th_2)
}

///|
/// `FILTER_ONCE_ASM_REWRITE_RULE`
pub fn filter_once_asm_rewrite_rule(x215 : (@kernel.Term) -> Bool raise, x216 : @list.List[@kernel.Thm], x217 : @kernel.Thm) -> @kernel.Thm raise {
  let f_3 = x215
  let thl_3 = x216
  let th_3 = x217
  @simp.once_rewrite_rule(@lib.map(@kernel.assume_rule, @lib.filter(f_3, @kernel.hyp(th_3))).concat(thl_3))(th_3)
}

///|
/// `FILTER_PURE_ASM_REWRITE_TAC`
pub fn filter_pure_asm_rewrite_tac(x218 : (@kernel.Term) -> Bool raise, x219 : @list.List[@kernel.Thm], x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f = x218
  let thl = x219
  let (asl, w) = x220
  @simp.pure_rewrite_tac(@lib.filter(fn(x222 : @kernel.Thm) -> Bool raise {
    f((fn(x221 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x221)
    })(x222))
  }, @lib.map(fn(x223 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x223.1
  }, asl)).concat(thl))((asl, w))
}

///|
/// `FILTER_ASM_REWRITE_TAC`
pub fn filter_asm_rewrite_tac(x224 : (@kernel.Term) -> Bool raise, x225 : @list.List[@kernel.Thm], x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_1 = x224
  let thl_1 = x225
  let (asl_1, w_1) = x226
  @simp.rewrite_tac(@lib.filter(fn(x228 : @kernel.Thm) -> Bool raise {
    f_1((fn(x227 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x227)
    })(x228))
  }, @lib.map(fn(x229 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x229.1
  }, asl_1)).concat(thl_1))((asl_1, w_1))
}

///|
/// `FILTER_PURE_ONCE_ASM_REWRITE_TAC`
pub fn filter_pure_once_asm_rewrite_tac(x230 : (@kernel.Term) -> Bool raise, x231 : @list.List[@kernel.Thm], x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_2 = x230
  let thl_2 = x231
  let (asl_2, w_2) = x232
  @simp.pure_once_rewrite_tac(@lib.filter(fn(x234 : @kernel.Thm) -> Bool raise {
    f_2((fn(x233 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x233)
    })(x234))
  }, @lib.map(fn(x235 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x235.1
  }, asl_2)).concat(thl_2))((asl_2, w_2))
}

///|
/// `FILTER_ONCE_ASM_REWRITE_TAC`
pub fn filter_once_asm_rewrite_tac(x236 : (@kernel.Term) -> Bool raise, x237 : @list.List[@kernel.Thm], x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let f_3 = x236
  let thl_3 = x237
  let (asl_3, w_3) = x238
  @simp.once_rewrite_tac(@lib.filter(fn(x240 : @kernel.Thm) -> Bool raise {
    f_3((fn(x239 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x239)
    })(x240))
  }, @lib.map(fn(x241 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x241.1
  }, asl_3)).concat(thl_3))((asl_3, w_3))
}

///|
/// `X_CASES_THENL`
pub fn x_cases_thenl(x242 : @list.List[@list.List[@kernel.Term]], x243 : @list.List[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise]) -> @tactics.ThmTactic raise {
  let varsl = x242
  let ttacl = x243
  @lib.end_itlist(fn(x245 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x246 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s247 = @tactics.disj_cases_then2(x245, x246)
    fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s249 = s247(x248)
      fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s249(x250)
      }
    }
  }, @lib.map(fn(x251 : (@list.List[@kernel.Term], (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise)) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let (vars, ttac) = x251
    @tactics.every_tcl(@lib.map(fn(x253 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
      let s254 = @tactics.x_choose_then(x253)
      fn(x255 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
        let s256 = s254(x255)
        fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s258 = s256(x257)
          fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s258(x259)
          }
        }
      }
    }, vars))(ttac)
  }, @lib.zip(varsl, ttacl)))
}

///|
/// `X_CASES_THEN`
pub fn x_cases_then(x260 : @list.List[@list.List[@kernel.Term]], x261 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.ThmTactic raise {
  let varsl = x260
  let ttac = x261
  @lib.end_itlist(fn(x263 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x264 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s265 = @tactics.disj_cases_then2(x263, x264)
    fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s267 = s265(x266)
      fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s267(x268)
      }
    }
  }, @lib.map(fn(x269 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let vars = x269
    @tactics.every_tcl(@lib.map(fn(x271 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
      let s272 = @tactics.x_choose_then(x271)
      fn(x273 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
        let s274 = s272(x273)
        fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s276 = s274(x275)
          fn(x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s276(x277)
          }
        }
      }
    }, vars))(ttac)
  }, varsl))
}

///|
/// `CASES_THENL`
pub fn cases_thenl(x278 : @list.List[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise]) -> @tactics.ThmTactic raise {
  let ttacl = x278
  @lib.end_itlist(fn(x280 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x281 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s282 = @tactics.disj_cases_then2(x280, x281)
    fn(x283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s284 = s282(x283)
      fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s284(x285)
      }
    }
  }, @lib.map(@tactics.repeat_tcl(@tactics.choose_then), ttacl))
}

///|
/// DISCARD_TAC
fn step_48() -> Unit raise {
  let truth = @term_syntax.parse_term("true")
  discard_tac_c.set(fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x286
    fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let (asl, w) = x287
      let t294 = @lib.map(fn(x293 : (String, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x291 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x291)
        })((fn(x292 : (String, @kernel.Thm)) -> @kernel.Thm raise {
          x292.1
        })(x293))
      }, asl).prepend(truth)
      let t288 = @kernel.concl(th)
      if @lib.exists(fn(x290 : @kernel.Term) -> Bool raise {
        ((x289 : @kernel.Term) => @basics.aconv(t288, x289))(x290)
      }, t294) {
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
/// `CHECK_ASSUME_TAC`
pub fn check_assume_tac(x295 : @kernel.Thm) -> @tactics.Tactic raise {
  let gth = x295
  let t297 = @tactics.assume_tac(gth)
  let t298 = discard_tac(gth)
  let t299 = @tactics.accept_tac(gth)
  @tactics.first(@list.List([@tactics.contr_tac(gth), t299, t298, t297]))
}

///|
/// `FILTER_GEN_TAC`
pub fn filter_gen_tac(x300 : @kernel.Term, x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x300
  let (asl, w) = x301
  if (@basics.is_forall(w) && !((tm == @basics.dest_forall(w).0))) {
    @tactics.gen_tac((asl, w))
  } else {
    raise Failure("FILTER_GEN_TAC")
  }
}

///|
/// `FILTER_DISCH_THEN`
pub fn filter_disch_then(x302 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x303 : @kernel.Term, x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let ttac = x302
  let tm = x303
  let (asl, w) = x304
  if (is_neg_imp(w) && !@basics.free_in(tm, dest_neg_imp(w).0)) {
    @tactics.disch_then(ttac)((asl, w))
  } else {
    raise Failure("FILTER_DISCH_THEN")
  }
}

///|
/// `FILTER_STRIP_THEN`
pub fn filter_strip_then(x305 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x306 : @kernel.Term) -> @tactics.Tactic raise {
  let ttac = x305
  let tm = x306
  @tactics.first(@list.List([(x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_gen_tac(tm, x308), (x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_disch_then(ttac, tm, x309), @tactics.conj_tac]))
}

///|
/// FILTER_DISCH_TAC
fn step_49() -> Unit raise {
  filter_disch_tac_c.set(fn(x312 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x310 : @kernel.Term, x311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => filter_disch_then(@tactics.strip_assume_tac, x310, x311))(x312, x313)
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
fn step_50() -> Unit raise {
  filter_strip_tac_c.set((x314 : @kernel.Term) => filter_strip_then(@tactics.strip_assume_tac, x314))
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
fn step_51() -> Unit raise {
  let not_elim : (@kernel.Thm) -> (Bool, @kernel.Thm) raise = fn(x315 : @kernel.Thm) -> (Bool, @kernel.Thm) raise {
    let th = x315
    if @basics.is_neg(@kernel.concl(th)) {
      (true, @bool.not_elim(th))
    } else {
      (false, th)
    }
  }
  fn canon(x316 : Bool, x317 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let fl = x316
    let th_1 = x317
    let w = @kernel.concl(th_1)
    if @basics.is_conj(w) {
      let (th1, th2) = @bool.conj_pair(th_1)
      let t318 = canon(fl, th2)
      canon(fl, th1).concat(t318)
    } else {
      if (@basics.is_imp(w) && !@basics.is_neg(w)) {
        let (ante, conc) = dest_neg_imp(w)
        if @basics.is_conj(ante) {
          let (a, b) = @basics.dest_conj(ante)
          let t319 = @kernel.assume_rule(b)
          let cth = not_mp(th_1, @bool.conj(@kernel.assume_rule(a), t319))
          let th1_1 = @bool.disch(b, cth)
          let th2_1 = @bool.disch(a, cth)
          let t320 = canon(true, @bool.disch(b, th2_1))
          canon(true, @bool.disch(a, th1_1)).concat(t320)
        } else {
          if @basics.is_disj(ante) {
            let (a_1, b_1) = @basics.dest_disj(ante)
            let ath = @bool.disj1(@kernel.assume_rule(a_1), b_1)
            let bth = @bool.disj2(a_1, @kernel.assume_rule(b_1))
            let th1_2 = @bool.disch(a_1, not_mp(th_1, ath))
            let th2_2 = @bool.disch(b_1, not_mp(th_1, bth))
            let t321 = canon(true, th2_2)
            canon(true, th1_2).concat(t321)
          } else {
            if @basics.is_exists(ante) {
              let (v, body) = @basics.dest_exists(ante)
              let newv = @kernel.variant(@basics.thm_frees(th_1), v)
              let newa = @basics.subst(@list.List([(newv, v)]), body)
              let th1_3 = not_mp(th_1, @bool.exists_rule(ante, newv, @kernel.assume_rule(newa)))
              canon(true, @bool.disch(newa, th1_3))
            } else {
              @lib.map(fn(x323 : @kernel.Thm) -> @kernel.Thm raise {
                @bool.gen_all(((x322 : @kernel.Thm) => @bool.disch(ante, x322))(x323))
              }, canon(true, @bool.undisch(th_1)))
            }
          }
        }
      } else {
        if (if @basics.is_eq(w) {
          let t324 = @term_syntax.parse_type("Bool")
          (@kernel.type_of(@kernel.rand(w)) == t324)
        } else {
          false
        }) {
          let (th1_4, th2_3) = @bool.eq_imp_rule(th_1)
          let t325 = canon(true, th2_3)
          let t326 = canon(true, th1_4).concat(t325)
          (if fl {
            @list.List([@bool.gen_all(th_1)])
          } else {
            @list.List([])
          }).concat(t326)
        } else {
          if @basics.is_forall(w) {
            let (vs, body_1) = @basics.strip_forall(w)
            let fvs = @basics.thm_frees(th_1)
            let vfn : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x327 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
              let l = x327
              (x329 : @kernel.Term) => @kernel.variant(l.concat(fvs), x329)
            }
            let nvs = @lib.itlist(fn(x330 : @kernel.Term, x331 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
              let v_1 = x330
              let nv = x331
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
  res_canon_c.set(fn(x332 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let th_2 = x332
    try {
      let args = @lib.map(fn(x333 : @kernel.Thm) -> (Bool, @kernel.Thm) raise {
        not_elim(@bool.spec_all(x333))
      }, @bool.conjuncts_rule(@bool.spec_all(th_2)))
      let imps = @lib.flat(@lib.map(fn(x336 : (Bool, @kernel.Thm)) -> @list.List[@kernel.Thm] raise {
        ((x334 : @list.List[@kernel.Thm]) => @lib.map(@bool.gen_all, x334))(((x335 : (Bool, @kernel.Thm)) => @lib.uncurry(canon, x335))(x336))
      }, args))
      @lib.check(fn(x337 : @list.List[@kernel.Thm]) -> Bool raise {
        let l_1 = x337
        !@list.List::is_empty(l_1)
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
let imp_res_then_v1_c : @lib.Cell[((@kernel.Thm) -> @tactics.Tactic raise) -> ((@kernel.Thm) -> @tactics.Tactic raise) raise] = @lib.Cell::new("IMP_RES_THEN")

///|
/// `IMP_RES_THEN`
pub fn imp_res_then_v1(x : (@kernel.Thm) -> @tactics.Tactic raise) -> ((@kernel.Thm) -> @tactics.Tactic raise) raise {
  (imp_res_then_v1_c.get())(x)
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
fn step_52() -> Unit raise {
  let match_mp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x338 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let impth = x338
    let sth = @bool.spec_all(impth)
    let t341 = dest_neg_imp(@kernel.concl(sth)).0
    let matchfn : (@kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise = fn(x343 : @kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
      (fn(x340 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> (@list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
        let (a, b, c) = x340
        (b, c)
      })(((x342 : @kernel.Term) => @drule.term_match(@list.List([]), t341, x342))(x343))
    }
    fn(x344 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x344
      not_mp(inst_ty_term(matchfn(@kernel.concl(th)), sth), th)
    }
  }
  let imp_res_then : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x347 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let ttac = x347
    fn(x348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let impth_1 = x348
      let ths = try {
        res_canon(impth_1)
      } catch {
        Failure(_) => raise Failure("IMP_RES_THEN: no implication")
        e => raise e
      }
      @tactics.assum_list(fn(x350 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let asl = x350
        let l_1 = @lib.itlist(fn(x352 : @kernel.Thm, x353 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          let th_1 = x352
          let t354 = @lib.mapfilter(match_mp(th_1), asl)
          (fn(x355 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
            t354.concat(x355)
          })(x353)
        }, ths, @list.List([]))
        let res = check_l("IMP_RES_THEN: no resolvents ", l_1)
        let tacs = check_l("IMP_RES_THEN: no tactics", @lib.mapfilter(ttac, res))
        @tactics.every(tacs)
      })
    }
  }
  let res_then : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x356 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let ttac_1 = x356
    fn(x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let (asl_1, g) = x357
      let asm_ = @lib.map(fn(x358 : (String, @kernel.Thm)) -> @kernel.Thm raise {
        x358.1
      }, asl_1)
      let ths_1 = @lib.itlist(fn(x361 : @list.List[@kernel.Thm], x362 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        let s363 = (fn(x359 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
          fn(x360 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
            x359.concat(x360)
          }
        })(x361)
        s363(x362)
      }, @lib.mapfilter(res_canon, asm_), @list.List([]))
      let imps = check_l("RES_THEN: no implication", ths_1)
      let l_2 = @lib.itlist(fn(x364 : @kernel.Thm, x365 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        let th_2 = x364
        let t366 = @lib.mapfilter(match_mp(th_2), asm_)
        (fn(x367 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          t366.concat(x367)
        })(x365)
      }, imps, @list.List([]))
      let res_1 = check_l("RES_THEN: no resolvents ", l_2)
      let tacs_1 = check_l("RES_THEN: no tactics", @lib.mapfilter(ttac_1, res_1))
      @tactics.every(tacs_1)((asl_1, g))
    }
  }
  let (imp_res_then_1, res_then_1) = (imp_res_then, res_then)
  imp_res_then_v1_c.set(imp_res_then_1)
  res_then_c.set(res_then_1)
}

///|
fn[TA] check_l(x345 : String, x346 : @list.List[TA]) -> @list.List[TA] raise {
  let st = x345
  let l = x346
  if @list.List::is_empty(l) {
    raise Failure(st)
  } else {
    l
  }
}

///|
/// `IMP_RES_TAC`
pub fn imp_res_tac(x368 : @kernel.Thm, x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let th = x368
  let g = x369
  try {
    imp_res_then_v1(@tactics.repeat_gtcl(imp_res_then_v1)(@tactics.strip_assume_tac))(th)(g)
  } catch {
    Failure(_) => @tactics.all_tac(g)
    e => raise e
  }
}

///|
/// `RES_TAC`
pub fn res_tac(x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x370
  try {
    res_then(@tactics.repeat_gtcl(imp_res_then_v1)(@tactics.strip_assume_tac))(g)
  } catch {
    Failure(_) => @tactics.all_tac(g)
    e => raise e
  }
}

///|
/// `prove_rep_fn_one_one`
pub fn prove_rep_fn_one_one(x371 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x371
  try {
    let thm = @bool.conjunct1(th)
    let t373 = @kernel.dest_comb(@equal.lhs(@basics.dest_forall(@kernel.concl(thm)).1))
    let t374 = @kernel.rator(t373.1)
    let (a, r) = ((fn(x372 : @kernel.Term) -> @kernel.Term raise {
      x372
    })(t373.0), t374)
    match @kernel.dest_type(@kernel.type_of(r)) {
      (_, More(aty, tail=More(rty, tail=Empty))) => {
        let a_1 = mk_primed_var("a", aty)
        let a_p = @kernel.variant(@list.List([a_1]), a_1)
        let a_eq_a_p = @basics.mk_eq(a_1, a_p)
        let t375 = @kernel.mk_comb(r, a_p)
        let ra_eq_ra_p = @basics.mk_eq(@kernel.mk_comb(r, a_1), t375)
        let th1 = @equal.ap_term(a, @kernel.assume_rule(ra_eq_ra_p))
        let ga1 = @basics.genvar(aty)
        let ga2 = @basics.genvar(aty)
        let t377 = @basics.mk_eq(ga1, ga2)
        let t376 = (@bool.spec(a_p, thm), ga2)
        let th2 = subst(@list.List([(@bool.spec(a_1, thm), ga1), t376]), t377, th1)
        let th3 = @bool.disch(a_eq_a_p, @equal.ap_term(r, @kernel.assume_rule(a_eq_a_p)))
        @bool.gen(a_1, @bool.gen(a_p, @bool.imp_antisym_rule(@bool.disch(ra_eq_ra_p, th2), th3)))
      }
      _ => raise @lib.MatchFailure("tscript.ml:667")
    }
  } catch {
    Failure(_) => raise Failure("prove_rep_fn_one_one")
    e => raise e
  }
}

///|
/// `prove_rep_fn_onto`
pub fn prove_rep_fn_onto(x378 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x378
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t380 = @basics.dest_forall(@kernel.concl(th2))
        let t381 = @equal.rhs(t380.1)
        let (r, eq) = ((fn(x379 : @kernel.Term) -> @kernel.Term raise {
          x379
        })(t380.0), t381)
        let (re, ar) = @kernel.dest_comb(@equal.lhs(eq))
        let sr = (fn(x384 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          (fn(x382 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            @basics.mk_eq(x382.0, x382.1)
          })((fn(x383 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
            let (x, y) = x383
            (y, x)
          })(x384))
        })(@kernel.dest_eq(eq))
        let a = mk_primed_var("a", @kernel.type_of(ar))
        let sra = @basics.mk_eq(r, @kernel.mk_comb(re, a))
        let ex = @bool.mk_exists(a, sra)
        let imp1 = @bool.exists_rule(ex, ar, @equal.sym(@kernel.assume_rule(eq)))
        let v = @basics.genvar(@kernel.type_of(r))
        let a_1 = @kernel.rator(ar)
        let s_p = @equal.ap_term(re, @bool.spec(a, th1))
        let t385 = @basics.mk_eq(@kernel.mk_comb(re, @kernel.mk_comb(a_1, v)), v)
        let th_1 = subst(@list.List([(@equal.sym(@kernel.assume_rule(sra)), v)]), t385, s_p)
        let imp2 = @bool.choose_rule(a, @kernel.assume_rule(ex), th_1)
        let t386 = @bool.disch(ex, imp2)
        let swap = @bool.imp_antisym_rule(@bool.disch(eq, imp1), t386)
        @bool.gen(r, @kernel.trans(@bool.spec(r, th2), swap))
      }
      _ => raise @lib.MatchFailure("tscript.ml:679")
    }
  } catch {
    Failure(_) => raise Failure("prove_rep_fn_onto")
    e => raise e
  }
}

///|
/// `prove_abs_fn_onto`
pub fn prove_abs_fn_onto(x387 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x387
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t394 = @basics.dest_forall(@kernel.concl(th1))
        let t395 = (fn(x393 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
          (fn(x392 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            (fn(x390 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
              let t391 = @kernel.rator(x390.1)
              ((fn(x389 : @kernel.Term) -> @kernel.Term raise {
                x389
              })(x390.0), t391)
            })(@kernel.dest_comb(x392))
          })(@equal.lhs(x393))
        })(t394.1)
        let (a, (a_1, r)) = ((fn(x388 : @kernel.Term) -> @kernel.Term raise {
          x388
        })(t394.0), t395)
        let t396 = @bool.eqt_intro(@equal.ap_term(r, @bool.spec(a, th1)))
        let thm1 = @bool.eqt_elim(@kernel.trans(@bool.spec(@kernel.mk_comb(r, a), th2), t396))
        let thm2 = @equal.sym(@bool.spec(a, th1))
        let t399 = @basics.dest_forall(@kernel.concl(th2))
        let t400 = (fn(x398 : @kernel.Term) -> @kernel.Term raise {
          @kernel.rator(@equal.lhs(x398))
        })(t399.1)
        let (r_1, p) = ((fn(x397 : @kernel.Term) -> @kernel.Term raise {
          x397
        })(t399.0), t400)
        let t401 = @kernel.mk_comb(p, r_1)
        let ex = @bool.mk_exists(r_1, @bool.mk_conj(@basics.mk_eq(a, @kernel.mk_comb(a_1, r_1)), t401))
        let t402 = @bool.conj(thm2, thm1)
        @bool.gen(a, @bool.exists_rule(ex, @kernel.mk_comb(r, a), t402))
      }
      _ => raise @lib.MatchFailure("tscript.ml:697")
    }
  } catch {
    Failure(_) => raise Failure("prove_abs_fn_onto")
    e => raise e
  }
}

///|
/// `prove_abs_fn_one_one`
pub fn prove_abs_fn_one_one(x403 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x403
  try {
    match @bool.conjuncts_rule(th) {
      More(th1, tail=More(th2, tail=Empty)) => {
        let t406 = @basics.dest_forall(@kernel.concl(th2))
        let t407 = (fn(x405 : @kernel.Term) -> @kernel.Term raise {
          @kernel.rator(@equal.lhs(x405))
        })(t406.1)
        let (r, p) = ((fn(x404 : @kernel.Term) -> @kernel.Term raise {
          x404
        })(t406.0), t407)
        let t409 = @kernel.dest_comb(@equal.lhs(@basics.dest_forall(@kernel.concl(th1)).1))
        let t410 = @kernel.rator(t409.1)
        let (a, r_1) = ((fn(x408 : @kernel.Term) -> @kernel.Term raise {
          x408
        })(t409.0), t410)
        let r_p = @kernel.variant(@list.List([r]), r)
        let as1 = @kernel.assume_rule(@kernel.mk_comb(p, r))
        let as2 = @kernel.assume_rule(@kernel.mk_comb(p, r_p))
        let t1 = @kernel.eq_mp(@bool.spec(r, th2), as1)
        let t2 = @kernel.eq_mp(@bool.spec(r_p, th2), as2)
        let t411 = @kernel.mk_comb(a, r_p)
        let eq = @basics.mk_eq(@kernel.mk_comb(a, r), t411)
        let v1 = @basics.genvar(@kernel.type_of(r))
        let v2 = @basics.genvar(@kernel.type_of(r))
        let t412 = @equal.ap_term(r_1, @kernel.assume_rule(eq))
        let i1 = @bool.disch(eq, subst(@list.List([(t1, v1), (t2, v2)]), @basics.mk_eq(v1, v2), t412))
        let t413 = @equal.ap_term(a, @kernel.assume_rule(@basics.mk_eq(r, r_p)))
        let i2 = @bool.disch(@basics.mk_eq(r, r_p), t413)
        let thm = @bool.imp_antisym_rule(i1, i2)
        let t414 = @bool.disch(@kernel.mk_comb(p, r_p), thm)
        let disch = @bool.disch(@kernel.mk_comb(p, r), t414)
        @bool.gen(r, @bool.gen(r_p, disch))
      }
      _ => raise @lib.MatchFailure("tscript.ml:709")
    }
  } catch {
    Failure(_) => raise Failure("prove_abs_fn_one_one")
    e => raise e
  }
}

///|
/// `AC_CONV`
pub fn ac_conv(x415 : @kernel.Thm, x416 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let (assoc, sym) = (x415, x416)
  let th1 = @bool.spec_all(assoc)
  let th2 = @bool.spec_all(sym)
  let th3 = @simp.gen_rewrite_rule(fn(x424 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x418 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s419 = @equal.rand_conv(x418)
      fn(x420 : @kernel.Term) -> @kernel.Thm raise {
        s419(x420)
      }
    })((fn(x421 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s422 = @equal.land_conv(x421)
      fn(x423 : @kernel.Term) -> @kernel.Thm raise {
        s422(x423)
      }
    })(x424))
  }, @list.List([th2]))(th1)
  let th4 = @equal.sym(th1)
  let th5 = @simp.gen_rewrite_rule(fn(x425 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s426 = @equal.rand_conv(x425)
    fn(x427 : @kernel.Term) -> @kernel.Thm raise {
      s426(x427)
    }
  }, @list.List([th4]))(th3)
  let t428 = @theorems.ac(@lib.end_itlist(@bool.conj, @list.List([th2, th4, th5])))
  fn(x429 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(t428(x429))
  }
}

///|
/// `AC_RULE`
pub fn ac_rule(x430 : (@kernel.Thm, @kernel.Thm)) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let ths = x430
  let t432 = ac_conv(ths.0, ths.1)
  fn(x433 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_elim(t432(x433))
  }
}

///|
/// COND_CASES_TAC
fn step_53() -> Unit raise {
  let is_good_cond : (@kernel.Term) -> Bool raise = fn(x434 : @kernel.Term) -> Bool raise {
    let tm = x434
    try {
      !@kernel.is_const(@class.dest_cond(tm).0)
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  cond_cases_tac_c.set(fn(x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x435
    let cond = @basics.find_term(fn(x436 : @kernel.Term) -> Bool raise {
      let tm_1 = x436
      (is_good_cond(tm_1) && @basics.free_in(tm_1, w))
    }, w)
    let (p, (t, u)) = @class.dest_cond(cond)
    let t437 = @term_syntax.parse_type("A")
    let inst = @kernel.inst_type(@list.List([(@kernel.type_of(t), t437)]), @class.cond_clauses())
    let (ct, cf) = @bool.conj_pair(@bool.spec(u, @bool.spec(t, inst)))
    let t446 = @bool.spec(p, @class.excluded_middle())
    @tactics.disj_cases_then2(fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th = x438
      let t441 = @tactics.assume_tac(th)
      let t440 = @tactics.subst1_tac(ct)
      @tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@bool.eqt_intro(th)), t440), t441)
    }, fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th_1 = x442
      let t445 = @tactics.assume_tac(th_1)
      let t444 = @tactics.subst1_tac(cf)
      @tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@bool.eqf_intro(th_1)), t444), t445)
    })(t446)((asl, w))
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
pub fn match_mp_tac(x447 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x447
  let t449 = @tactics.match_mp_tac(@simp.pure_rewrite_rule(@list.List([@theorems.right_imp_forall_thm()]))(th))
  @tactics.orelse_tac(@tactics.match_mp_tac(th), t449)
}

///|
/// ZERO_LESS_EQ
fn step_54() -> Unit raise {
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
fn step_55() -> Unit raise {
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
fn step_56() -> Unit raise {
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
fn step_57() -> Unit raise {
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
fn step_58() -> Unit raise {
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
fn step_59() -> Unit raise {
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
fn step_60() -> Unit raise {
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
fn step_61() -> Unit raise {
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
fn step_62() -> Unit raise {
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
fn step_63() -> Unit raise {
  let t450 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  less_suc_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n < SUC(n)"), t450))
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
fn step_64() -> Unit raise {
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
fn step_65() -> Unit raise {
  let t451 = @simp.rewrite_tac(@list.List([@arith.le(), @arith.le_refl()]))
  less_eq_suc_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= SUC(n)"), t451))
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
fn step_66() -> Unit raise {
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
fn step_67() -> Unit raise {
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
fn step_68() -> Unit raise {
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
fn step_69() -> Unit raise {
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
fn step_70() -> Unit raise {
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
fn step_71() -> Unit raise {
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
fn step_72() -> Unit raise {
  let t452 = @meson.meson_tac(@list.List([@arith.lt()]))
  less_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → m < SUC(n)"), t452))
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
fn step_73() -> Unit raise {
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
fn step_74() -> Unit raise {
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
fn step_75() -> Unit raise {
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
fn step_76() -> Unit raise {
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
fn step_77() -> Unit raise {
  let t453 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @arith.sub_suc(), @arith.sub_0()]))
  suc_sub1_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, SUC(m) - 1 == m"), t453))
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
fn step_78() -> Unit raise {
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
fn step_79() -> Unit raise {
  let t454 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.lt_suc_le(), @arith.le_add()]))
  less_add_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < m + SUC(n)"), t454))
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
fn step_80() -> Unit raise {
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
fn step_81() -> Unit raise {
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
fn step_82() -> Unit raise {
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
fn step_83() -> Unit raise {
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
fn step_84() -> Unit raise {
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
fn step_85() -> Unit raise {
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
fn step_86() -> Unit raise {
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
fn step_87() -> Unit raise {
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
fn step_88() -> Unit raise {
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
fn step_89() -> Unit raise {
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
fn step_90() -> Unit raise {
  let t455 = @meson.meson_tac(@list.List([@arith.le_lt()]))
  let t456 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.not_le(), @arith.lt()])), t455)
  not_suc_less_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, !(SUC(n) <= m) == (m <= n)"), t456))
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
fn step_91() -> Unit raise {
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
fn step_92() -> Unit raise {
  let t457 = @meson.meson_tac(@list.List([@arith.lt_cases()]))
  less_less_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m == n || m < n || n < m"), t457))
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
fn step_93() -> Unit raise {
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
fn step_94() -> Unit raise {
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
fn step_95() -> Unit raise {
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
fn step_96() -> Unit raise {
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
fn step_97() -> Unit raise {
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
fn step_98() -> Unit raise {
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
fn step_99() -> Unit raise {
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
fn step_100() -> Unit raise {
  sub_eq_eq_0_c.set(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m - n == m) == (m == 0 || n == 0)")))
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
fn step_101() -> Unit raise {
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
fn step_102() -> Unit raise {
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
fn step_103() -> Unit raise {
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
fn step_104() -> Unit raise {
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
fn step_105() -> Unit raise {
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
fn step_106() -> Unit raise {
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
fn step_107() -> Unit raise {
  let t458 = @simp.rewrite_tac(@list.List([@arith.lt_mult_lcancel(), @nums.not_suc()]))
  less_mult_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ i : Num, ∀ n : Num, (SUC(n) * m < SUC(n) * i) == (m < i)"), t458))
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
fn step_108() -> Unit raise {
  let t459 = @simp.simp_tac(@list.List([@arith.le_mult_rcancel()]))
  less_mono_mult_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n → m * p <= n * p"), t459))
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
fn step_109() -> Unit raise {
  let t460 = @simp.rewrite_tac(@list.List([@arith.lt_mult()]))
  less_mult2_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, 0 < m && 0 < n → 0 < m * n"), t460))
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
fn step_110() -> Unit raise {
  let t461 = @meson.meson_tac(@list.List([@sets.finite_subset()]))
  subset_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → (∀ t : (_) -> Bool, SUBSET(t, s) → FINITE(t))"), t461))
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
fn step_111() -> Unit raise {
  let t462 = @simp.rewrite_tac(@list.List([@arith.le()]))
  less_eq_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ((m : Num) <= SUC(n)) == (m == SUC(n) || m <= n)"), t462))
}

///|
let less_eq_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESS_EQ_SUC")

///|
/// `LESS_EQ_SUC`
pub fn less_eq_suc() -> @kernel.Thm {
  less_eq_suc_c.get()
}

///|
/// `ANTE_RES_THEN`
pub fn ante_res_then(x463 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x464 : @kernel.Thm) -> @tactics.Tactic raise {
  let ttac = x463
  let th = x464
  @tactics.first_assum(fn(x466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x466
    ttac(@drule.match_mp(t)(th))
  })
}

///|
/// `IMP_RES_THEN`
pub fn imp_res_then(x468 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x469 : @kernel.Thm) -> @tactics.Tactic raise {
  let ttac = x468
  let th = x469
  @tactics.first_assum(fn(x471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x471
    ttac(@drule.match_mp(th)(t))
  })
}

///|
/// INFINITE_MEMBER
fn step_112() -> Unit raise {
  let t485 = @simp.rewrite_tac(@list.List([]))
  let t484 = @simp.pure_once_rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t486 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty()])), t484), t485)
  let t483 = @simp.rewrite_tac(@list.List([@sets.infinite(), @sets.finite_empty()]))
  let t482 = @tactics.disch_then(fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s480 = @tactics.subst1_tac(x479)
    fn(x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s480(x481)
    }
  })
  let t478 = @simp.rewrite_tac(@list.List([]))
  let t477 = @tactics.conv_tac(@class.contrapos_conv)
  let t487 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("INFINITE((s : (A) -> Bool))")), t477), t478), t482), t483), t486])
  let t476 = @tactics.subgoal_then(@term_syntax.parse_term("!((s : (A) -> Bool) == {})"), fn(x473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s474 = @tactics.mp_tac(x473)
    fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s474(x475)
    }
  })
  let t488 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t476), t487)
  infinite_member_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → (∃ x : A, IN(x, s))"), t488))
}

///|
let infinite_member_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_MEMBER")

///|
/// `INFINITE_MEMBER`
pub fn infinite_member() -> @kernel.Thm {
  infinite_member_c.get()
}

///|
/// INFINITE_CHOOSE
fn step_113() -> Unit raise {
  let t501 = @simp.rewrite_tac(@list.List([]))
  let t500 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t499 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t498 = @tactics.disch_then(fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s495 = @tactics.mp_tac(x494)
      fn(x496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s495(x496)
      }
    })(@class.select_rule(x497))
  })
  let t492 = @drule.match_mp(infinite_member())
  let t502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s490 = @tactics.mp_tac(x489)
      fn(x491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s490(x491)
      }
    })(t492(x493))
  })), t498), t499), t500), t501)
  infinite_choose_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → IN(select(s), s)"), t502))
}

///|
let infinite_choose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_CHOOSE")

///|
/// `INFINITE_CHOOSE`
pub fn infinite_choose() -> @kernel.Thm {
  infinite_choose_c.get()
}

///|
/// INFINITE_DELETE
fn step_114() -> Unit raise {
  let t503 = @simp.rewrite_tac(@list.List([@sets.infinite(), @sets.finite_delete()]))
  infinite_delete_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (A) -> Bool, ∀ x : A, INFINITE(DELETE(t, x)) == INFINITE(t)"), t503))
}

///|
let infinite_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_DELETE")

///|
/// `INFINITE_DELETE`
pub fn infinite_delete() -> @kernel.Thm {
  infinite_delete_c.get()
}

///|
/// INFINITE_INSERT
fn step_115() -> Unit raise {
  let t504 = @simp.rewrite_tac(@list.List([@sets.infinite(), @sets.finite_insert()]))
  infinite_insert_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ t : (A) -> Bool, INFINITE(INSERT(x, t)) == INFINITE(t)"), t504))
}

///|
let infinite_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_INSERT")

///|
/// `INFINITE_INSERT`
pub fn infinite_insert() -> @kernel.Thm {
  infinite_insert_c.get()
}

///|
/// SIZE_INSERT
fn step_116() -> Unit raise {
  let t505 = @simp.simp_tac(@list.List([@sets.has_size(), @sets.card_clauses(), @sets.finite_rules()]))
  size_insert_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ t : (A) -> Bool, !IN(x, t) && HAS_SIZE(t, (n : Num)) → HAS_SIZE(INSERT(x, t), SUC(n))"), t505))
}

///|
let size_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_INSERT")

///|
/// `SIZE_INSERT`
pub fn size_insert() -> @kernel.Thm {
  size_insert_c.get()
}

///|
/// SIZE_DELETE
fn step_117() -> Unit raise {
  let t506 = @simp.simp_tac(@list.List([@sets.has_size_suc()]))
  size_delete_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ t : (A) -> Bool, IN(x, t) && HAS_SIZE(t, SUC((n : Num))) → HAS_SIZE(DELETE(t, x), n)"), t506))
}

///|
let size_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_DELETE")

///|
/// `SIZE_DELETE`
pub fn size_delete() -> @kernel.Thm {
  size_delete_c.get()
}

///|
/// SIZE_EXISTS
fn step_118() -> Unit raise {
  let t507 = @simp.simp_tac(@list.List([@sets.has_size_suc(), @equal.gsym(@sets.member_not_empty())]))
  size_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ N : Num, HAS_SIZE(s, SUC(N)) → (∃ x : A, IN(x, s))"), t507))
}

///|
let size_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_EXISTS")

///|
/// `SIZE_EXISTS`
pub fn size_exists() -> @kernel.Thm {
  size_exists_c.get()
}

///|
/// SUBSET_DELETE
fn step_119() -> Unit raise {
  let t510 = @simp.asm_rewrite_tac(@list.List([@sets.delete_subset()]))
  let t509 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t508 = match_mp_tac(@sets.subset_trans())
  let t511 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t508), t509), t510)
  subset_delete_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ x : A, SUBSET(s, t) → SUBSET(DELETE(s, x), t)"), t511))
}

///|
let subset_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_DELETE")

///|
/// `SUBSET_DELETE`
pub fn subset_delete() -> @kernel.Thm {
  subset_delete_c.get()
}

///|
/// INFINITE_FINITE_CHOICE
fn step_120() -> Unit raise {
  let t551 = @simp.rewrite_tac(@list.List([]))
  let t550 = @tactics.disch_then((x549 : @kernel.Thm) => imp_res_then(fn(x546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s547 = @tactics.mp_tac(x546)
    fn(x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s547(x548)
    }
  }, x549))
  let t545 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_delete()]))
  let t544 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((t : (A) -> Bool), DELETE((s : (A) -> Bool), select(s)))"))
  let t543 = @simp.asm_rewrite_tac(@list.List([]))
  let t552 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(match_mp_tac(size_insert()), t543), @tactics.disch_tac), t544), t545), t550), t551)
  let t540 = @tactics.conv_tac(fn(x539 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(@class.taut(x539))
  })
  let t538 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t537 = @tactics.disch_then((x536 : @kernel.Thm) => ante_res_then(fn(x533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s534 = @tactics.mp_tac(x533)
    fn(x535 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s534(x535)
    }
  }, x536))
  let t532 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset()])))
  let t541 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t532), @tactics.gen_tac), t537), t538), t540)
  let t531 = @simp.asm_rewrite_tac(@list.List([]))
  let t542 = @list.List([@tactics.then_tac(match_mp_tac(infinite_choose()), t531), t541])
  let t553 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.insert_subset()])), @tactics.conj_tac), t542), t552])
  let t530 = @tactics.exists_tac(@term_syntax.parse_term("INSERT(select((s : (A) -> Bool)), (t : (A) -> Bool))"))
  let t529 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(@tactics.strip_assume_tac))
  let t528 = @simp.asm_rewrite_tac(@list.List([infinite_delete()]))
  let t524 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), select(s))")
  let t527 = @tactics.disch_then(fn(x526 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s522 = @tactics.mp_tac(x521)
      fn(x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s522(x523)
      }
    })(((x525 : @kernel.Thm) => @bool.spec(t524, x525))(x526))
  })
  let t554 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x518 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x513 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s514 = @tactics.undisch_tac(x513)
        fn(x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s514(x515)
        }
      })(((x517 : @kernel.Term) => @lib.check(fn(x516 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x516)
      }, x517))(x518))
    })((fn(x519 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x519)
    })(x520))
  }), t527), t528), t529), t530), @tactics.conj_tac), t553)
  let t512 = @simp.rewrite_tac(@list.List([@sets.has_size(), @sets.empty_subset(), @sets.has_size_0()]))
  let t555 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("({} : (A) -> Bool)")), t512), t554])
  let t556 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @tactics.gen_tac), @tactics.disch_tac), t555)
  infinite_finite_choice_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : (A) -> Bool, INFINITE(s) → (∃ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, n))"), t556))
}

///|
let infinite_finite_choice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_FINITE_CHOICE")

///|
/// `INFINITE_FINITE_CHOICE`
pub fn infinite_finite_choice() -> @kernel.Thm {
  infinite_finite_choice_c.get()
}

///|
/// IMAGE_WOP_LEMMA
fn step_121() -> Unit raise {
  let t663 = @simp.asm_rewrite_tac(@list.List([]))
  let t662 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : A) == (x : A))"))
  let t664 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s660 = @tactics.subst_all_tac(x659)
    fn(x661 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s660(x661)
    }
  }), t662), t663)
  let t658 = @tactics.first_assum(fn(x655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s656 = @tactics.match_accept_tac(x655)
    fn(x657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s656(x657)
    }
  })
  let t654 = @simp.rewrite_tac(@list.List([]))
  let t650 = @term_syntax.parse_term("(z : A)")
  let t653 = @tactics.disch_then(fn(x652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s648 = @tactics.mp_tac(x647)
      fn(x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s648(x649)
      }
    })(((x651 : @kernel.Thm) => @bool.spec(t650, x651))(x652))
  })
  let t665 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then((x646 : @kernel.Thm) => ante_res_then(fn(x645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s642 = @tactics.mp_tac(x641)
      fn(x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s642(x643)
      }
    })(((x644 : @kernel.Thm) => @equal.conv_rule(not_exists_conv, x644))(x645))
  }, x646)), t653), t654), @tactics.conj_tac), t658), t664])
  let t640 = @simp.rewrite_tac(@list.List([less_or_eq(), @class.de_morgan_thm()]))
  let t639 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(not_less_equal())]))
  let t638 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num)"))
  let t637 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(@tactics.strip_assume_tac))
  let t636 = @simp.asm_rewrite_tac(@list.List([@sets.in_image()]))
  let t633 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t630 = @term_syntax.parse_term("(z : A)")
  let t635 = @tactics.first_assum(fn(x634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s628 = @tactics.mp_tac(x627)
        fn(x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s628(x629)
        }
      })(((x631 : @kernel.Thm) => @bool.spec(t630, x631))(x632))
    })(t633(x634))
  })
  let t626 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t666 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : A)")), t626), @tactics.strip_tac), t635), t636), t637), t638), t639), t640), @tactics.conj_tac), t665)
  let t625 = @tactics.first_assum(fn(x622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.match_accept_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  })
  let t621 = @tactics.first_assum(fn(x620 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s618 = @tactics.subst1_tac(x617)
      fn(x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s618(x619)
      }
    })(@equal.sym(x620))
  })
  let t616 = match_mp_tac(@sets.insert_delete())
  let t615 = @tactics.conv_tac(@equal.sym_conv)
  let t667 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t615), t616), t621), t625), t666])
  let t613 = @term_syntax.parse_term("DELETE((u : (A) -> Bool), (x : A))")
  let t614 = @tactics.map_every(fn(x610 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s611 = @tactics.exists_tac(x610)
    fn(x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s611(x612)
    }
  }, @list.List([@term_syntax.parse_term("(m : Num)"), t613]))
  let t609 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(@tactics.strip_assume_tac))
  let t607 = @tactics.conjuncts_then2(fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s602 = @tactics.mp_tac(x601)
    fn(x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s602(x603)
    }
  }, fn(x604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s605 = @tactics.assume_tac(x604)
    fn(x606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s605(x606)
    }
  })
  let t608 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(t607))
  let t599 = @simp.asm_rewrite_tac(@list.List([]))
  let t598 = @term_syntax.parse_term("(y : A)")
  let t600 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x595 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s596 = @tactics.exists_tac(x595)
    fn(x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s596(x597)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t598])), t599), @tactics.all_tac])
  let t580 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(@tactics.strip_assume_tac))
  let t579 = @simp.asm_rewrite_tac(@list.List([@sets.in_image()]))
  let t576 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t573 = @term_syntax.parse_term("(y : A)")
  let t578 = @tactics.first_assum(fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s571 = @tactics.mp_tac(x570)
        fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s571(x572)
        }
      })(((x574 : @kernel.Thm) => @bool.spec(t573, x574))(x575))
    })(t576(x577))
  })
  let t567 = @drule.match_mp(size_exists())
  let t565 = @term_syntax.parse_term("(y : A)")
  let t569 = @tactics.first_assum(fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x566 : @kernel.Thm) => @tactics.x_choose_tac(t565, x566))(t567(x568))
  })
  let t564 = @tactics.disch_then(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x562 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s559 = @tactics.mp_tac(x558)
        fn(x560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s559(x560)
        }
      })((fn(x561 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x561.0
      })(x562))
    })(@bool.eq_imp_rule(x563))
  })
  let t557 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) => ∃ y : A, IN(y, (u : (A) -> Bool)) && y == (f : (Num) -> A)(n)"), @arith.num_wop()))
  let t668 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t557), @tactics.beta_tac), t564), t569), t578), t579), t580), fn(x594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x591 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x587 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x581 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
            fn(x582 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s583 = @tactics.subgoal_then(x581, x582)
              fn(x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s583(x584)
              }
            }
          })(x587)(fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let t = x585
            @simp.rewrite_tac(@list.List([t]))
          })
        })(((x590 : @kernel.Term) => @lib.funpow(2, fn(x589 : @kernel.Term) -> @kernel.Term raise {
          (fn(x588 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x588.0
          })(@basics.dest_imp(x589))
        }, x590))(x591))
      })((fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x592.1
      })(x593))
    })(x594)(x594)
  }), t600), t608), t609), t614), @tactics.conj_tac), t667)
  image_wop_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ N : Num, ∀ t : (Num) -> Bool, ∀ u : (A) -> Bool, SUBSET(u, IMAGE((f : (Num) -> A), t)) && HAS_SIZE(u, SUC(N)) → (∃ n : Num, ∃ v : (A) -> Bool, u == INSERT(f(n), v) && (∀ y : A, IN(y, v) → (∃ m : Num, y == f(m) && n < m)))"), t668))
}

///|
let image_wop_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_WOP_LEMMA")

///|
/// `IMAGE_WOP_LEMMA`
pub fn image_wop_lemma() -> @kernel.Thm {
  image_wop_lemma_c.get()
}

///|
/// COLOURING_LEMMA
fn step_122() -> Unit raise {
  let t729 = @simp.asm_rewrite_tac(@list.List([]))
  let t728 = @tactics.repeat_tac(@tactics.strip_tac)
  let t727 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t726 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t725 = @simp.asm_rewrite_tac(@list.List([]))
  let t724 = @tactics.exists_tac(@term_syntax.parse_term("{(x : A) | IN(x, (s : (A) -> Bool)) && (col : (A) -> Num)(x) <= (M : Num)}"))
  let t723 = match_mp_tac(@sets.subset_trans())
  let t722 = @simp.asm_rewrite_tac(@list.List([]))
  let t720 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t721 = @tactics.map_every(fn(x717 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s718 = @tactics.exists_tac(x717)
    fn(x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s718(x719)
    }
  }, @list.List([@term_syntax.parse_term("(c : Num)"), t720]))
  let t714 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t716 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))((x715 : @kernel.Thm) => @tactics.x_choose_tac(t714, x715)))
  let t713 = match_mp_tac(@class.taut(@term_syntax.parse_term("((c : Bool) → (d : Bool)) → ((b : Bool) → c) → b → d")))
  let t712 = @simp.asm_simp_tac(@list.List([]))
  let t708 = @term_syntax.parse_term("{(x : A) | IN(x, (s : (A) -> Bool)) && (col : (A) -> Num)(x) <= (M : Num)}")
  let t709 = @list.List([@term_syntax.parse_term("(col : (A) -> Num)"), t708])
  let t730 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s706 = @tactics.mp_tac(x705)
      fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s706(x707)
      }
    })(((x710 : @kernel.Thm) => @bool.specl(t709, x710))(x711))
  }), t712), t713), t716), t721), t722), t723), t724), t725), t726), t727), t728), t729)
  let t704 = @tactics.disch_then(fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s701 = @tactics.match_accept_tac(x700)
      fn(x702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s701(x702)
      }
    })(@bool.conjunct2(x703))
  })
  let t731 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))), t704), t730])
  let t732 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : A, IN(n, {(x : A) | IN(x, (s : (A) -> Bool)) && (col : (A) -> Num)(x) <= (M : Num)}) → col(n) <= M"), fn(x697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s698 = @tactics.mp_tac(x697)
    fn(x699 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s698(x699)
    }
  }), t731)
  let t696 = @simp.asm_rewrite_tac(@list.List([]))
  let t695 = @tactics.repeat_tac(@tactics.strip_tac)
  let t694 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t693 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t692 = @term_syntax.parse_term("{(x : A) | IN(x, (s : (A) -> Bool)) && (col : (A) -> Num)(x) == SUC((M : Num))}")
  let t733 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x689 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s690 = @tactics.exists_tac(x689)
    fn(x691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s690(x691)
    }
  }, @list.List([@term_syntax.parse_term("SUC((M : Num))"), t692])), t693), t694), t695), t696)
  let t688 = @simp.asm_rewrite_tac(@list.List([]))
  let t687 = @tactics.first_assum(match_mp_tac)
  let t686 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(less_eq_suc())]))
  let t685 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t684 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()]))
  let t681 = @drule.match_mp(subset_finite())
  let t683 = @tactics.disch_then(fn(x682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    match_mp_tac(t681(x682))
  })
  let t680 = @simp.rewrite_tac(@list.List([]))
  let t679 = @tactics.conv_tac(@class.contrapos_conv)
  let t677 = @equal.gsym(@sets.finite_union())
  let t678 = @simp.rewrite_tac(@list.List([@sets.infinite(), @equal.gsym(@class.de_morgan_thm()), t677]))
  let t734 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("INFINITE((s : (A) -> Bool))")), t678), t679), t680), t683), t684), t685), @tactics.gen_tac), @tactics.disch_tac), t686), t687), t688), t733, t732])
  let t676 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE({(x : A) | IN(x, (s : (A) -> Bool)) && (col : (A) -> Num)(x) == SUC((M : Num))}) || INFINITE({(x : A) | IN(x, s) && col(x) <= M})"), @tactics.disj_cases_tac)
  let t735 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t676), t734)
  let t675 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t673 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t674 = @tactics.map_every(fn(x670 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s671 = @tactics.exists_tac(x670)
    fn(x672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s671(x672)
    }
  }, @list.List([@term_syntax.parse_term("0"), t673]))
  let t669 = @tactics.repeat_tac(@tactics.strip_tac)
  let t736 = @tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([less_eq_0()])), t669), t674), t675), t735]))
  colouring_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Num, ∀ col : (A) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ n : A, IN(n, s) → col(n) <= M) → (∃ c : Num, ∃ t : (A) -> Bool, SUBSET(t, s) && INFINITE(t) && (∀ n : A, IN(n, t) → col(n) == c))"), t736))
}

///|
let colouring_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLOURING_LEMMA")

///|
/// `COLOURING_LEMMA`
pub fn colouring_lemma() -> @kernel.Thm {
  colouring_lemma_c.get()
}

///|
/// COLOURING_THM
fn step_123() -> Unit raise {
  let t749 = @simp.asm_rewrite_tac(@list.List([]))
  let t747 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t748 = @tactics.map_every(fn(x744 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s745 = @tactics.exists_tac(x744)
    fn(x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s745(x746)
    }
  }, @list.List([@term_syntax.parse_term("(c : Num)"), t747]))
  let t741 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t743 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))((x742 : @kernel.Thm) => @tactics.x_choose_tac(t741, x742)))
  let t740 = @simp.asm_rewrite_tac(@list.List([@sets.num_infinite()]))
  let t737 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t738 = @term_syntax.parse_term("(col : (Num) -> Num)")
  let t739 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(M : Num)"), t738, t737]), colouring_lemma()))
  let t750 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t739), t740), t743), t748), t749)
  colouring_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Num, ∀ col : (Num) -> Num, (∀ n : Num, col(n) <= M) → (∃ c : Num, ∃ s : (Num) -> Bool, INFINITE(s) && (∀ n : Num, IN(n, s) → col(n) == c))"), t750))
}

///|
let colouring_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLOURING_THM")

///|
/// `COLOURING_THM`
pub fn colouring_thm() -> @kernel.Thm {
  colouring_thm_c.get()
}

///|
/// RAMSEY_LEMMA1
fn step_124() -> Unit raise {
  let t832 = @simp.rewrite_tac(@list.List([]))
  let t833 = @tactics.then_tac(@tactics.disch_then((x831 : @kernel.Thm) => ante_res_then(fn(x828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s829 = @tactics.mp_tac(x828)
    fn(x830 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s829(x830)
    }
  }, x831)), t832)
  let t827 = @tactics.disch_then((x826 : @kernel.Thm) => ante_res_then(fn(x824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x824
    @simp.rewrite_tac(@list.List([th]))
  }, x826))
  let t834 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), @tactics.gen_tac), t827), t833])
  let t823 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_delete()])))
  let t822 = @simp.asm_rewrite_tac(@list.List([]))
  let t820 = @term_syntax.parse_term("(c : Num)")
  let t821 = @tactics.map_every(fn(x817 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s818 = @tactics.exists_tac(x817)
    fn(x819 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s818(x819)
    }
  }, @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t820]))
  let t816 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(@tactics.strip_assume_tac))
  let t835 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s814 = @tactics.mp_tac(x813)
    fn(x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s814(x815)
    }
  })), t816), t821), t822), t823), @tactics.conj_tac), t834)
  let t810 = @simp.asm_rewrite_tac(@list.List([]))
  let t806 = @term_syntax.parse_term("select((s : (A) -> Bool))")
  let t809 = @tactics.disch_then(fn(x808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s804 = @tactics.mp_tac(x803)
      fn(x805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s804(x805)
      }
    })(((x807 : @kernel.Thm) => @bool.spec(t806, x807))(x808))
  })
  let t802 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_delete()]))
  let t801 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((t : (A) -> Bool), DELETE((s : (A) -> Bool), select(s)))"))
  let t800 = @simp.asm_rewrite_tac(@list.List([]))
  let t811 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(match_mp_tac(size_insert()), t800), @tactics.disch_tac), t801), t802), t809), t810)
  let t799 = @simp.asm_rewrite_tac(@list.List([]))
  let t797 = @tactics.first_assum((x796 : @kernel.Thm) => ante_res_then(fn(x793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s794 = @tactics.assume_tac(x793)
    fn(x795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s794(x795)
    }
  }, x796))
  let t798 = @list.List([match_mp_tac(infinite_choose()), t797])
  let t792 = @simp.asm_rewrite_tac(@list.List([]))
  let t791 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t790 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.in_delete(), @sets.not_in_empty()]))
  let t812 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((t : (A) -> Bool), DELETE((s : (A) -> Bool), select(s)))")), t790), @tactics.disch_tac), @tactics.gen_tac), t791), t792), t798), t799), t811])
  let t789 = @tactics.first_assum(match_mp_tac)
  let t836 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t789), @tactics.conj_tac), t812), t835])
  let t774 = @simp.asm_rewrite_tac(@list.List([infinite_delete()]))
  let t770 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), select(s))")
  let t773 = @tactics.disch_then(fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s768 = @tactics.mp_tac(x767)
      fn(x769 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s768(x769)
      }
    })(((x771 : @kernel.Thm) => @bool.spec(t770, x771))(x772))
  })
  let t763 = @term_syntax.parse_term("(u : (A) -> Bool) => (C : ((A) -> Bool) -> Num)(INSERT(select((s : (A) -> Bool)), u))")
  let t766 = @tactics.disch_then(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s761 = @tactics.mp_tac(x760)
      fn(x762 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s761(x762)
      }
    })(((x764 : @kernel.Thm) => @bool.spec(t763, x764))(x765))
  })
  let t751 = @tactics.repeat_tac(@tactics.strip_tac)
  let t837 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x753 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s754 = ((x752 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) => @tactics.then_tac(t751, x752))(x753)
      fn(x755 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s754(x755)
      }
    })((fn(x756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s757 = @tactics.mp_tac(x756)
      fn(x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s757(x758)
      }
    })(x759))
  }), t766), t773), @tactics.beta_tac), t774), fn(x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x785 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x781 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x775 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
            fn(x776 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s777 = @tactics.subgoal_then(x775, x776)
              fn(x778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s777(x778)
              }
            }
          })(x781)(fn(x779 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let t = x779
            @simp.rewrite_tac(@list.List([t]))
          })
        })(((x784 : @kernel.Term) => @lib.funpow(2, fn(x783 : @kernel.Term) -> @kernel.Term raise {
          (fn(x782 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x782.0
          })(@basics.dest_imp(x783))
        }, x784))(x785))
      })((fn(x786 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x786.1
      })(x787))
    })(x788)(x788)
  }), t836)
  ramsey_lemma1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, (N : Num)) → C(t) <= (M : Num)) → (∃ t : (A) -> Bool, ∃ c : Num, INFINITE(t) && SUBSET(t, s) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, N) → C(u) == c))) → (∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, SUC(N)) → C(t) <= M) → (∃ t : (A) -> Bool, ∃ c : Num, INFINITE(t) && SUBSET(t, s) && !IN(select(s), t) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, N) → C(INSERT(select(s), u)) == c)))"), t837))
}

///|
let ramsey_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAMSEY_LEMMA1")

///|
/// `RAMSEY_LEMMA1`
pub fn ramsey_lemma1() -> @kernel.Thm {
  ramsey_lemma1_c.get()
}

///|
/// RAMSEY_LEMMA2
fn step_125() -> Unit raise {
  let t992 = @simp.asm_rewrite_tac(@list.List([]))
  let t991 = match_mp_tac(infinite_choose())
  let t988 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t986 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t989 = @tactics.then_tac(@tactics.first_assum(fn(x987 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    match_mp_tac(t986(x987))
  }), t988)
  let t990 = @list.List([@tactics.gen_tac, @tactics.thenl(@nums.induct_tac, @list.List([@simp.asm_rewrite_tac(@list.List([])), t989]))])
  let t985 = @tactics.try_tac(@tactics.first_assum(fn(x982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s983 = @tactics.match_accept_tac(x982)
    fn(x984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s983(x984)
    }
  }))
  let t993 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t985), t990), t991), t992)
  let t977 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t979 = @tactics.first_assum(fn(x978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s975 = @tactics.match_accept_tac(x974)
      fn(x976 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s975(x976)
      }
    })(t977(x978))
  })
  let t973 = @simp.rewrite_tac(@list.List([]))
  let t972 = @tactics.conv_tac(@class.contrapos_conv)
  let t968 = @term_syntax.parse_term("(n : Num)")
  let t971 = @tactics.disch_then(fn(x970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s966 = @tactics.mp_tac(x965)
      fn(x967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s966(x967)
      }
    })(((x969 : @kernel.Thm) => @bool.spec(t968, x969))(x970))
  })
  let t964 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, !IN(select((f : (Num, A) -> Bool)(n)), f(SUC(n)))"))
  let t963 = @simp.asm_rewrite_tac(@list.List([]))
  let t980 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(match_mp_tac(size_insert()), t963), t964), t971), t972), t973), t979)
  let t960 = @simp.asm_rewrite_tac(@list.List([]))
  let t959 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num, A) -> Bool)(SUC((n : Num)))"))
  let t961 = @tactics.then_tac(@tactics.then_tac(match_mp_tac(@sets.subset_trans()), t959), t960)
  let t958 = @simp.asm_rewrite_tac(@list.List([]))
  let t957 = @tactics.try_tac(@tactics.first_assum(fn(x954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s955 = @tactics.match_accept_tac(x954)
    fn(x956 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s955(x956)
    }
  }))
  let t952 = @term_syntax.parse_term("(n : Num)")
  let t953 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t952)
  let t951 = match_mp_tac(infinite_choose())
  let t950 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t948 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t962 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    match_mp_tac(t948(x949))
  }), t950), t951), t953), @nums.induct_tac), t957), t958), t961])
  let t981 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.insert_subset()])), @tactics.conj_tac), t962), t980])
  let t947 = @tactics.first_assum(match_mp_tac)
  let t946 = @tactics.disch_then(fn(x945 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x942 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s943 = @tactics.subst1_tac(x942)
      fn(x944 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s943(x944)
      }
    })(@equal.sym(x945))
  })
  let t941 = @tactics.disch_then(fn(x935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x935
    let t940 = ante_res_then(fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s938 = @tactics.mp_tac(x937)
      fn(x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s938(x939)
      }
    }, th_1)
    @tactics.then_tac(@tactics.strip_assume_tac(th_1), t940)
  })
  let t930 = @term_syntax.parse_term("(N : Num)")
  let t932 = @tactics.choose_then(fn(x927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s928 = @tactics.mp_tac(x927)
    fn(x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s928(x929)
    }
  })
  let t934 = @tactics.disch_then(fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t932(((x931 : @kernel.Thm) => @bool.spec(t930, x931))(x933))
  })
  let t923 = @term_syntax.parse_term("(n : Num)")
  let t921 = @drule.match_mp(infinite_finite_choice())
  let t926 = @tactics.first_assum(fn(x925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s919 = @tactics.mp_tac(x918)
        fn(x920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s919(x920)
        }
      })(t921(x922))
    })(((x924 : @kernel.Thm) => @bool.spec(t923, x924))(x925))
  })
  let t994 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t926), t934), t941), t946), t947), @tactics.conj_tac), t981), t993])
  let t917 = @tactics.exists_tac(@term_syntax.parse_term("(col : (Num) -> Num)"))
  let t915 = @term_syntax.parse_term("(n : Num) => select((f : (Num, A) -> Bool)(n))")
  let t916 = @tactics.map_every(fn(x912 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s913 = @tactics.exists_tac(x912)
    fn(x914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s913(x914)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num) => (f : (Num, A) -> Bool)(SUC(n))"), t915]))
  let t907 = @term_syntax.parse_term("(col : (Num) -> Num)")
  let t911 = @tactics.disch_then(fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x908 : @kernel.Thm) => @tactics.x_choose_tac(t907, x908))(((x909 : @kernel.Thm) => @equal.conv_rule(skolem_conv, x909))(x910))
  })
  let t906 = @tactics.disch_then(@tactics.repeat_tcl(fn(x898 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let s899 = ((x897 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) => @tactics.conjuncts_then2(fn(x894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s895 = @tactics.assume_tac(x894)
      fn(x896 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s895(x896)
      }
    }, x897))(x898)
    fn(x900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s901 = s899(x900)
      fn(x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s901(x902)
      }
    }
  })(fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s904 = @tactics.mp_tac(x903)
    fn(x905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s904(x905)
    }
  }))
  let t995 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.pure_rewrite_tac(@list.List([@theorems.left_exists_and_thm(), @theorems.right_exists_and_thm(), @theorems.forall_and_thm()])), t906), t911), t916), @tactics.beta_tac), t917), @tactics.conj_tac), t994)
  let t889 = @tactics.match_accept_tac(@sets.subset_refl())
  let t887 = @tactics.first_assum(fn(x881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x881
    let t886 = @list.List([@tactics.first_assum(fn(x883 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s884 = @tactics.match_accept_tac(x883)
      fn(x885 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s884(x885)
      }
    }), @tactics.all_tac])
    @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@kernel.rand(@kernel.concl(th))), @tactics.conj_tac), t886)
  })
  let t888 = @tactics.repeat_tac(@tactics.then_tac(match_mp_tac(@sets.subset_trans()), t887))
  let t880 = @simp.asm_rewrite_tac(@list.List([]))
  let t879 = @tactics.first_assum(match_mp_tac)
  let t878 = @tactics.repeat_tac(@tactics.strip_tac)
  let t877 = @tactics.try_tac(@tactics.first_assum(fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s875 = @tactics.match_accept_tac(x874)
    fn(x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s875(x876)
    }
  }))
  let t873 = @tactics.first_assum(match_mp_tac)
  let t872 = @tactics.conv_tac(@class.select_conv)
  let t869 = @term_syntax.parse_term("SUC((n : Num))")
  let t890 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s867 = @tactics.subst1_tac(x866)
      fn(x868 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s867(x868)
      }
    })(((x870 : @kernel.Thm) => @bool.spec(t869, x870))(x871))
  }), t872), t873), @tactics.conj_tac), t877), t878), t879), t880), t888), t889)
  let t865 = @tactics.first_assum(fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s863 = @tactics.match_accept_tac(x862)
    fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s863(x864)
    }
  })
  let t861 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num, A) -> Bool)((n : Num))"))
  let t891 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(match_mp_tac(@sets.subset_trans()), t861), @tactics.conj_tac), t865)
  let t860 = @simp.asm_rewrite_tac(@list.List([]))
  let t859 = @tactics.first_assum(match_mp_tac)
  let t858 = @tactics.conv_tac(@class.select_conv)
  let t855 = @term_syntax.parse_term("0")
  let t892 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s853 = @tactics.subst1_tac(x852)
      fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s853(x854)
      }
    })(((x856 : @kernel.Thm) => @bool.spec(t855, x856))(x857))
  }), t858), t859), t860)
  let t893 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.subset_refl()])), t892, t891, t890])
  let t851 = @tactics.repeat_tac(@tactics.strip_tac)
  let t996 = @list.List([@tactics.thenl(@tactics.then_tac(match_mp_tac(@nums.num_induction()), t851), t893), t995])
  let t850 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, SUBSET((f : (Num, A) -> Bool)(n), (s : (A) -> Bool)) && (∃ c : Num, INFINITE(f(SUC(n))) && SUBSET(f(SUC(n)), f(n)) && !IN(select(f(n)), f(SUC(n))) && (∀ u : (A) -> Bool, SUBSET(u, f(SUC(n))) && HAS_SIZE(u, (N : Num)) → (C : ((A) -> Bool) -> Num)(INSERT(select(f(n)), u)) == c))"), fn(x847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s848 = @tactics.mp_tac(x847)
    fn(x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s848(x849)
    }
  })
  let t846 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Num, A) -> Bool)"))(@tactics.strip_assume_tac))
  let t845 = @tactics.disch_then(fn(x844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s841 = @tactics.mp_tac(x840)
        fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s841(x842)
        }
      })(@equal.beta_rule(x843))
    })(@bool.existence(x844))
  })
  let t838 = @term_syntax.parse_term("(s : (A) -> Bool) => (n : Num) => select((t : (A) -> Bool) => ∃ c : Num, INFINITE(t) && SUBSET(t, s) && !IN(select(s), t) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, (N : Num)) → (C : ((A) -> Bool) -> Num)(INSERT(select(s), u)) == c))")
  let t839 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t838]), @nums.num_axiom()))
  let t997 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t839), t845), t846), t850), t996)
  ramsey_lemma2_c.set(@tactics.prove(@term_syntax.parse_term("(∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, SUC((N : Num))) → C(t) <= (M : Num)) → (∃ t : (A) -> Bool, ∃ c : Num, INFINITE(t) && SUBSET(t, s) && !IN(select(s), t) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, N) → C(INSERT(select(s), u)) == c))) → (∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, SUC(N)) → C(t) <= M) → (∃ t : (Num, A) -> Bool, ∃ x : (Num) -> A, ∃ col : (Num) -> Num, (∀ n : Num, col(n) <= M) && (∀ n : Num, SUBSET(t(n), s)) && (∀ n : Num, SUBSET(t(SUC(n)), t(n))) && (∀ n : Num, !IN(x(n), t(n))) && (∀ n : Num, IN(x(SUC(n)), t(n))) && (∀ n : Num, IN(x(n), s)) && (∀ n : Num, ∀ u : (A) -> Bool, SUBSET(u, t(n)) && HAS_SIZE(u, N) → C(INSERT(x(n), u)) == col(n))))"), t997))
}

///|
let ramsey_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAMSEY_LEMMA2")

///|
/// `RAMSEY_LEMMA2`
pub fn ramsey_lemma2() -> @kernel.Thm {
  ramsey_lemma2_c.get()
}

///|
/// RAMSEY_LEMMA3
fn step_126() -> Unit raise {
  let t1195 = @tactics.first_assum(fn(x1192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1193 = @tactics.match_accept_tac(x1192)
    fn(x1194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1193(x1194)
    }
  })
  let t1196 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.in_insert()])), t1195])
  let t1197 = @tactics.thenl(@tactics.then_tac(match_mp_tac(size_delete()), @tactics.conj_tac), t1196)
  let t1191 = @simp.asm_rewrite_tac(@list.List([less_refl()]))
  let t1190 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(fn(x1184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1185 = @tactics.assume_tac(x1184)
    fn(x1186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1185(x1186)
    }
  }, fn(x1187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1188 = @tactics.mp_tac(x1187)
    fn(x1189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1188(x1189)
    }
  })))
  let t1183 = @simp.asm_rewrite_tac(@list.List([]))
  let t1182 = @tactics.disch_then((x1181 : @kernel.Thm) => ante_res_then(fn(x1178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1179 = @tactics.mp_tac(x1178)
    fn(x1180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1179(x1180)
    }
  }, x1181))
  let t1177 = @tactics.disch_then(fn(x1174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1175 = @tactics.subst1_tac(x1174)
    fn(x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1175(x1176)
    }
  })
  let t1173 = @simp.rewrite_tac(@list.List([]))
  let t1172 = @tactics.conv_tac(@class.contrapos_conv)
  let t1171 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_delete(), @class.taut(@term_syntax.parse_term("((a : Bool) == (a && (b : Bool))) == (a → b)"))]))
  let t1170 = @simp.rewrite_tac(@list.List([@sets.delete_insert()]))
  let t1198 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1170), t1171), @tactics.gen_tac), t1172), t1173), t1177), t1182), t1183), t1190), t1191), t1197])
  let t1199 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(v : (A) -> Bool) == DELETE((u : (A) -> Bool), (x : (Num) -> A)((n : Num)))"), fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1168 = @tactics.subst1_tac(x1167)
    fn(x1169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1168(x1169)
    }
  }), t1198)
  let t1166 = @simp.asm_rewrite_tac(@list.List([]))
  let t1165 = @tactics.first_assum(match_mp_tac)
  let t1164 = @simp.asm_rewrite_tac(@list.List([]))
  let t1163 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(@tactics.strip_assume_tac))
  let t1162 = @tactics.disch_then((x1161 : @kernel.Thm) => ante_res_then(fn(x1158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1159 = @tactics.mp_tac(x1158)
    fn(x1160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1159(x1160)
    }
  }, x1161))
  let t1200 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), @tactics.gen_tac), t1162), t1163), t1164), t1165), t1166), t1199])
  let t1201 = @tactics.thenl(@tactics.then_tac(@tactics.first_assum(match_mp_tac), @tactics.conj_tac), t1200)
  let t1157 = @simp.asm_rewrite_tac(@list.List([]))
  let t1156 = @tactics.disch_then(@tactics.choose_then(@tactics.strip_assume_tac))
  let t1155 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert()]))
  let t1151 = @term_syntax.parse_term("(x : (Num) -> A)((n : Num))")
  let t1154 = @tactics.disch_then(fn(x1153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1149 = @tactics.mp_tac(x1148)
      fn(x1150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1149(x1150)
      }
    })(((x1152 : @kernel.Thm) => @bool.spec(t1151, x1152))(x1153))
  })
  let t1147 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t1146 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((u : (A) -> Bool), IMAGE((x : (Num) -> A), (t : (Num) -> Bool)))"))
  let t1145 = @tactics.first_assum(match_mp_tac)
  let t1202 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t1145), t1146), t1147), t1154), t1155), t1156), t1157), t1201])
  let t1144 = @tactics.subgoal_then(@term_syntax.parse_term("(c : Num) == (col : (Num) -> Num)((n : Num))"), fn(x1141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1142 = @tactics.subst1_tac(x1141)
    fn(x1143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1142(x1143)
    }
  })
  let t1140 = @simp.asm_rewrite_tac(@list.List([]))
  let t1139 = @tactics.disch_then(@tactics.strip_assume_tac)
  let t1137 = @tactics.x_choose_then(@term_syntax.parse_term("(v : (A) -> Bool)"))(fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1135 = @tactics.mp_tac(x1134)
    fn(x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1135(x1136)
    }
  })
  let t1138 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(t1137))
  let t1131 = @drule.match_mp(image_wop_lemma())
  let t1133 = @tactics.disch_then(fn(x1132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1129 = @tactics.mp_tac(x1128)
      fn(x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1129(x1130)
      }
    })(t1131(x1132))
  })
  let t1203 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x1125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1125
    let t1127 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.strip_assume_tac(th), t1127)
  })), t1133), t1138), t1139), t1140), t1144), t1202)
  let t1124 = @simp.asm_rewrite_tac(@list.List([]))
  let t1123 = @tactics.disch_then(@tactics.choose_then(fn(x1122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1120 = @tactics.subst1_tac(x1119)
      fn(x1121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1120(x1121)
      }
    })(@bool.conjunct1(x1122))
  }))
  let t1204 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()])), @tactics.gen_tac), t1123), t1124)
  let t1118 = @simp.asm_rewrite_tac(@list.List([]))
  let t1117 = match_mp_tac(@sets.infinite_image_inj())
  let t1205 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("INFINITE((t : (Num) -> Bool))")), t1117), t1118), t1204, t1203])
  let t1116 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1113 = @tactics.then_tac(@tactics.disch_then(fn(x1110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1111 = @tactics.subst1_tac(x1110)
    fn(x1112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1111(x1112)
    }
  }), @tactics.refl_tac)
  let t1109 = @simp.asm_rewrite_tac(@list.List([]))
  let t1108 = @tactics.disch_then(fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1105 = @tactics.subst1_tac(x1104)
      fn(x1106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1105(x1106)
      }
    })(@equal.sym(x1107))
  })
  let t1103 = @tactics.first_assum(fn(x1102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1100 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1095 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1096 = @tactics.undisch_tac(x1095)
        fn(x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1096(x1097)
        }
      })(((x1099 : @kernel.Term) => @lib.check(fn(x1098 : @kernel.Term) -> Bool raise {
        @basics.is_eq(x1098)
      }, x1099))(x1100))
    })((fn(x1101 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x1101)
    })(x1102))
  })
  let t1094 = @simp.asm_rewrite_tac(@list.List([]))
  let t1093 = @tactics.first_assum((x1092 : @kernel.Thm) => ante_res_then(fn(x1089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1090 = @tactics.mp_tac(x1089)
    fn(x1091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1090(x1091)
    }
  }, x1092))
  let t1088 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1087 = @simp.asm_rewrite_tac(@list.List([]))
  let t1085 = @term_syntax.parse_term("(n : Num)")
  let t1086 = @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1085]), less_less_cases())
  let t1114 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1083 = @tactics.assume_tac(x1082)
    fn(x1084 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1083(x1084)
    }
  })(t1086), t1087), t1088), t1093), t1094), t1103), t1108), t1109), t1113])
  let t1115 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1114), @tactics.all_tac])
  let t1081 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ((x : (Num) -> A)(m) == x(n)) == (m == n)"), fn(x1078 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1079 = @tactics.assume_tac(x1078)
    fn(x1080 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1079(x1080)
    }
  })
  let t1076 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.add_clauses()]))
  let t1075 = @tactics.disch_then(match_mp_tac)
  let t1074 = @simp.rewrite_tac(@list.List([less_eq_add(), @sets.subset()]))
  let t1069 = @term_syntax.parse_term("(m : Num) + (d : Num)")
  let t1070 = @list.List([@term_syntax.parse_term("(m : Num)"), t1069])
  let t1073 = @tactics.first_assum(fn(x1072 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1067 = @tactics.mp_tac(x1066)
      fn(x1068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1067(x1068)
      }
    })(((x1071 : @kernel.Thm) => @bool.specl(t1070, x1071))(x1072))
  })
  let t1062 = @drule.match_mp(less_add_1())
  let t1063 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x1059 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1060 = @tactics.subst1_tac(x1059)
    fn(x1061 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1060(x1061)
    }
  })
  let t1065 = @tactics.disch_then(fn(x1064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1063(t1062(x1064))
  })
  let t1077 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1065), t1073), t1074), t1075), t1076), @tactics.all_tac])
  let t1058 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → IN((x : (Num) -> A)(n), (t : (Num, A) -> Bool)(m))"), fn(x1055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1056 = @tactics.assume_tac(x1055)
    fn(x1057 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1056(x1057)
    }
  })
  let t1053 = @simp.asm_rewrite_tac(@list.List([]))
  let t1052 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Num, A) -> Bool)((m : Num) + (d : Num))"))
  let t1051 = match_mp_tac(@sets.subset_trans())
  let t1050 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @sets.subset_refl()]))
  let t1048 = @term_syntax.parse_term("(d : Num)")
  let t1049 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t1048)
  let t1047 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x1044 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1045 = @tactics.subst1_tac(x1044)
    fn(x1046 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1045(x1046)
    }
  }))
  let t1043 = @simp.rewrite_tac(@list.List([less_eq_exists()]))
  let t1054 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1043), t1047), t1049), @nums.induct_tac), t1050), t1051), t1052), t1053), @tactics.all_tac])
  let t1042 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → SUBSET((t : (Num, A) -> Bool)(n), t(m))"), fn(x1039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1040 = @tactics.assume_tac(x1039)
    fn(x1041 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1040(x1041)
    }
  })
  let t1037 = @term_syntax.parse_term("(c : Num)")
  let t1038 = @tactics.map_every(fn(x1034 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1035 = @tactics.exists_tac(x1034)
    fn(x1036 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1035(x1036)
    }
  }, @list.List([@term_syntax.parse_term("IMAGE((x : (Num) -> A), (t : (Num) -> Bool))"), t1037]))
  let t1033 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Num) -> Bool)"))(@tactics.strip_assume_tac))
  let t1032 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1030 = @tactics.mp_tac(x1029)
    fn(x1031 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1030(x1031)
    }
  }))
  let t1028 = @simp.asm_rewrite_tac(@list.List([@sets.num_infinite()]))
  let t1025 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t1026 = @term_syntax.parse_term("(col : (Num) -> Num)")
  let t1027 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(M : Num)"), t1026, t1025]), colouring_lemma()))
  let t1024 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(col : (Num) -> Num)"))(@tactics.strip_assume_tac))
  let t1023 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : (Num) -> A)"))(fn(x1020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1021 = @tactics.mp_tac(x1020)
    fn(x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1021(x1022)
    }
  }))
  let t1019 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Num, A) -> Bool)"))(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1017 = @tactics.mp_tac(x1016)
    fn(x1018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1017(x1018)
    }
  }))
  let t1015 = @simp.asm_rewrite_tac(@list.List([]))
  let t1010 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1011 = @list.List([@term_syntax.parse_term("(C : ((A) -> Bool) -> Num)"), t1010])
  let t1014 = @tactics.disch_then(fn(x1013 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1008 = @tactics.mp_tac(x1007)
      fn(x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1008(x1009)
      }
    })(((x1012 : @kernel.Thm) => @bool.specl(t1011, x1012))(x1013))
  })
  let t998 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1206 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1006 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1000 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1001 = ((x999 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) => @tactics.then_tac(t998, x999))(x1000)
      fn(x1002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1001(x1002)
      }
    })((fn(x1003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1004 = @tactics.mp_tac(x1003)
      fn(x1005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1004(x1005)
      }
    })(x1006))
  }), t1014), t1015), t1019), t1023), t1024), t1027), t1028), t1032), t1033), t1038), t1042), t1054), t1058), t1077), t1081), t1115), t1116), t1205)
  ramsey_lemma3_c.set(@tactics.prove(@term_syntax.parse_term("(∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, SUC((N : Num))) → C(t) <= (M : Num)) → (∃ t : (Num, A) -> Bool, ∃ x : (Num) -> A, ∃ col : (Num) -> Num, (∀ n : Num, col(n) <= M) && (∀ n : Num, SUBSET(t(n), s)) && (∀ n : Num, SUBSET(t(SUC(n)), t(n))) && (∀ n : Num, !IN(x(n), t(n))) && (∀ n : Num, IN(x(SUC(n)), t(n))) && (∀ n : Num, IN(x(n), s)) && (∀ n : Num, ∀ u : (A) -> Bool, SUBSET(u, t(n)) && HAS_SIZE(u, N) → C(INSERT(x(n), u)) == col(n)))) → (∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, SUC(N)) → C(t) <= M) → (∃ t : (A) -> Bool, ∃ c : Num, INFINITE(t) && SUBSET(t, s) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, SUC(N)) → C(u) == c)))"), t1206))
}

///|
let ramsey_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAMSEY_LEMMA3")

///|
/// `RAMSEY_LEMMA3`
pub fn ramsey_lemma3() -> @kernel.Thm {
  ramsey_lemma3_c.get()
}

///|
/// RAMSEY
fn step_127() -> Unit raise {
  let t1218 = @tactics.pop_assum(fn(x1215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1216 = @tactics.match_accept_tac(x1215)
    fn(x1217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1216(x1217)
    }
  })
  let t1219 = @tactics.then_tac(@tactics.map_every(match_mp_tac, @list.List([ramsey_lemma3(), ramsey_lemma2(), ramsey_lemma1()])), t1218)
  let t1214 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t1213 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1212 = @simp.asm_rewrite_tac(@list.List([@sets.has_size_0()]))
  let t1210 = @term_syntax.parse_term("(C : ((A) -> Bool) -> Num)({})")
  let t1211 = @tactics.map_every(fn(x1207 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1208 = @tactics.exists_tac(x1207)
    fn(x1209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1208(x1209)
    }
  }, @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t1210]))
  let t1220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1211), t1212), t1213), t1214), t1219])
  let t1221 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t1220)
  ramsey_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Num, ∀ N : Num, ∀ C : ((A) -> Bool) -> Num, ∀ s : (A) -> Bool, INFINITE(s) && (∀ t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, N) → C(t) <= M) → (∃ t : (A) -> Bool, ∃ c : Num, INFINITE(t) && SUBSET(t, s) && (∀ u : (A) -> Bool, SUBSET(u, t) && HAS_SIZE(u, N) → C(u) == c))"), t1221))
}

///|
let ramsey_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAMSEY")

///|
/// `RAMSEY`
pub fn ramsey() -> @kernel.Thm {
  ramsey_c.get()
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
}
