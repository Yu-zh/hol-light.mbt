// Translated from upstream Boyer_Moore/clausal_form.ml; edit this file directly.

///|
/// IMP_DISJ_THM
fn step_1() -> Unit raise {
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
/// RIGHT_OR_OVER_AND
fn step_2() -> Unit raise {
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
/// LEFT_OR_OVER_AND
fn step_3() -> Unit raise {
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
/// EQ_EXPAND
fn step_4() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([]))
  let t1 = @class.bool_cases_tac(@term_syntax.parse_term("(y : Bool)"))
  let t3 = @tactics.then_tac(@tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(x : Bool)")), t1), t2)
  eq_expand_c.set(@tactics.prove(@term_syntax.parse_term("((x : Bool) == (y : Bool)) == ((!x || y) && (!y || x))"), t3))
}

///|
let eq_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EXPAND")

///|
/// `EQ_EXPAND`
pub fn eq_expand() -> @kernel.Thm {
  eq_expand_c.get()
}

///|
/// IMP_EXPAND
fn step_5() -> Unit raise {
  let t4 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), imp_disj_thm())
  imp_expand_c.set(@bool.spec(@term_syntax.parse_term("(y : Bool)"), t4))
}

///|
let imp_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_EXPAND")

///|
/// `IMP_EXPAND`
pub fn imp_expand() -> @kernel.Thm {
  imp_expand_c.get()
}

///|
/// COND_EXPAND
fn step_6() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([]))
  let t6 = @class.bool_cases_tac(@term_syntax.parse_term("(z : Bool)"))
  let t5 = @class.bool_cases_tac(@term_syntax.parse_term("(y : Bool)"))
  let t8 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(x : Bool)")), t5), t6), t7)
  cond_expand_c.set(@tactics.prove(@term_syntax.parse_term("(if (x : Bool) { (y : Bool) } else { (z : Bool) }) == ((!x || y) && (x || z))"), t8))
}

///|
let cond_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_EXPAND")

///|
/// `COND_EXPAND`
pub fn cond_expand() -> @kernel.Thm {
  cond_expand_c.get()
}

///|
/// NOT_NOT_NORM
fn step_7() -> Unit raise {
  let t9 = @bool.conjunct1(@class.not_clauses())
  not_not_norm_c.set(@bool.spec(@term_syntax.parse_term("(x : Bool)"), t9))
}

///|
let not_not_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_NOT_NORM")

///|
/// `NOT_NOT_NORM`
pub fn not_not_norm() -> @kernel.Thm {
  not_not_norm_c.get()
}

///|
/// NOT_CONJ_NORM
fn step_8() -> Unit raise {
  let t10 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), @class.de_morgan_thm())
  not_conj_norm_c.set(@bool.conjunct1(@bool.spec(@term_syntax.parse_term("(y : Bool)"), t10)))
}

///|
let not_conj_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_CONJ_NORM")

///|
/// `NOT_CONJ_NORM`
pub fn not_conj_norm() -> @kernel.Thm {
  not_conj_norm_c.get()
}

///|
/// NOT_DISJ_NORM
fn step_9() -> Unit raise {
  let t11 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), @class.de_morgan_thm())
  not_disj_norm_c.set(@bool.conjunct2(@bool.spec(@term_syntax.parse_term("(y : Bool)"), t11)))
}

///|
let not_disj_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_DISJ_NORM")

///|
/// `NOT_DISJ_NORM`
pub fn not_disj_norm() -> @kernel.Thm {
  not_disj_norm_c.get()
}

///|
/// LEFT_DIST_NORM
fn step_10() -> Unit raise {
  let t12 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), left_or_over_and())
  let t13 = @bool.spec(@term_syntax.parse_term("(y : Bool)"), t12)
  left_dist_norm_c.set(@bool.spec(@term_syntax.parse_term("(z : Bool)"), t13))
}

///|
let left_dist_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEFT_DIST_NORM")

///|
/// `LEFT_DIST_NORM`
pub fn left_dist_norm() -> @kernel.Thm {
  left_dist_norm_c.get()
}

///|
/// RIGHT_DIST_NORM
fn step_11() -> Unit raise {
  let t14 = @bool.spec(@term_syntax.parse_term("(z : Bool)"), right_or_over_and())
  let t15 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), t14)
  right_dist_norm_c.set(@bool.spec(@term_syntax.parse_term("(y : Bool)"), t15))
}

///|
let right_dist_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIGHT_DIST_NORM")

///|
/// `RIGHT_DIST_NORM`
pub fn right_dist_norm() -> @kernel.Thm {
  right_dist_norm_c.get()
}

///|
/// CONJ_ASSOC_NORM
fn step_12() -> Unit raise {
  let t16 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), @theorems.conj_assoc())
  let t17 = @bool.spec(@term_syntax.parse_term("(y : Bool)"), t16)
  conj_assoc_norm_c.set(@equal.sym(@bool.spec(@term_syntax.parse_term("(z : Bool)"), t17)))
}

///|
let conj_assoc_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_ASSOC_NORM")

///|
/// `CONJ_ASSOC_NORM`
pub fn conj_assoc_norm() -> @kernel.Thm {
  conj_assoc_norm_c.get()
}

///|
/// DISJ_ASSOC_NORM
fn step_13() -> Unit raise {
  let t18 = @bool.spec(@term_syntax.parse_term("(x : Bool)"), @theorems.disj_assoc())
  let t19 = @bool.spec(@term_syntax.parse_term("(y : Bool)"), t18)
  disj_assoc_norm_c.set(@equal.sym(@bool.spec(@term_syntax.parse_term("(z : Bool)"), t19)))
}

///|
let disj_assoc_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJ_ASSOC_NORM")

///|
/// `DISJ_ASSOC_NORM`
pub fn disj_assoc_norm() -> @kernel.Thm {
  disj_assoc_norm_c.get()
}

///|
/// COND_EXPAND_CONV
fn step_14() -> Unit raise {
  cond_expand_conv_c.set(@simp.rewr_conv(cond_expand()))
}

///|
let cond_expand_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COND_EXPAND_CONV")

///|
/// `COND_EXPAND_CONV`
pub fn cond_expand_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cond_expand_conv_c.get())(x)
}

///|
/// CONJ_ASSOC_NORM_CONV
fn step_15() -> Unit raise {
  conj_assoc_norm_conv_c.set(@simp.rewr_conv(conj_assoc_norm()))
}

///|
let conj_assoc_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("CONJ_ASSOC_NORM_CONV")

///|
/// `CONJ_ASSOC_NORM_CONV`
pub fn conj_assoc_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (conj_assoc_norm_conv_c.get())(x)
}

///|
/// DISJ_ASSOC_NORM_CONV
fn step_16() -> Unit raise {
  disj_assoc_norm_conv_c.set(@simp.rewr_conv(disj_assoc_norm()))
}

///|
let disj_assoc_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("DISJ_ASSOC_NORM_CONV")

///|
/// `DISJ_ASSOC_NORM_CONV`
pub fn disj_assoc_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (disj_assoc_norm_conv_c.get())(x)
}

///|
/// EQ_EXPAND_CONV
fn step_17() -> Unit raise {
  eq_expand_conv_c.set(@simp.rewr_conv(eq_expand()))
}

///|
let eq_expand_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("EQ_EXPAND_CONV")

///|
/// `EQ_EXPAND_CONV`
pub fn eq_expand_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (eq_expand_conv_c.get())(x)
}

///|
/// IMP_EXPAND_CONV
fn step_18() -> Unit raise {
  imp_expand_conv_c.set(@simp.rewr_conv(imp_expand()))
}

///|
let imp_expand_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("IMP_EXPAND_CONV")

///|
/// `IMP_EXPAND_CONV`
pub fn imp_expand_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (imp_expand_conv_c.get())(x)
}

///|
/// LEFT_DIST_NORM_CONV
fn step_19() -> Unit raise {
  left_dist_norm_conv_c.set(@simp.rewr_conv(left_dist_norm()))
}

///|
let left_dist_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("LEFT_DIST_NORM_CONV")

///|
/// `LEFT_DIST_NORM_CONV`
pub fn left_dist_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (left_dist_norm_conv_c.get())(x)
}

///|
/// NOT_CONJ_NORM_CONV
fn step_20() -> Unit raise {
  not_conj_norm_conv_c.set(@simp.rewr_conv(not_conj_norm()))
}

///|
let not_conj_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NOT_CONJ_NORM_CONV")

///|
/// `NOT_CONJ_NORM_CONV`
pub fn not_conj_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_conj_norm_conv_c.get())(x)
}

///|
/// NOT_DISJ_NORM_CONV
fn step_21() -> Unit raise {
  not_disj_norm_conv_c.set(@simp.rewr_conv(not_disj_norm()))
}

///|
let not_disj_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NOT_DISJ_NORM_CONV")

///|
/// `NOT_DISJ_NORM_CONV`
pub fn not_disj_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_disj_norm_conv_c.get())(x)
}

///|
/// NOT_NOT_NORM_CONV
fn step_22() -> Unit raise {
  not_not_norm_conv_c.set(@simp.rewr_conv(not_not_norm()))
}

///|
let not_not_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NOT_NOT_NORM_CONV")

///|
/// `NOT_NOT_NORM_CONV`
pub fn not_not_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_not_norm_conv_c.get())(x)
}

///|
/// RIGHT_DIST_NORM_CONV
fn step_23() -> Unit raise {
  right_dist_norm_conv_c.set(@simp.rewr_conv(right_dist_norm()))
}

///|
let right_dist_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("RIGHT_DIST_NORM_CONV")

///|
/// `RIGHT_DIST_NORM_CONV`
pub fn right_dist_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (right_dist_norm_conv_c.get())(x)
}

///|
/// NOT_CONV
fn step_24() -> Unit raise {
  not_conv_c.set(try {
    match @bool.conjuncts_rule(@class.not_clauses()) {
      More(th1, tail=More(th2, tail=More(th3, tail=Empty))) => fn(x20 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x20
        let arg = @basics.dest_neg(tm)
        if @support.is_t(arg) {
          th2
        } else {
          if @support.is_f(arg) {
            th3
          } else {
            @bool.spec(@basics.dest_neg(arg), th1)
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:125")
    }
  } catch {
    Failure(_) => raise Failure("NOT_CONV")
    e => raise e
  })
}

///|
let not_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NOT_CONV")

///|
/// `NOT_CONV`
pub fn not_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (not_conv_c.get())(x)
}

///|
/// AND_CONV
fn step_25() -> Unit raise {
  and_conv_c.set(try {
    match @lib.map(@bool.gen_all, @bool.conjuncts_rule(@bool.spec_all(@theorems.and_clauses()))) {
      More(th1, tail=More(th2, tail=More(th3, tail=More(th4, tail=More(th5, tail=Empty))))) => fn(x21 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x21
        let (arg1, arg2) = @basics.dest_conj(tm)
        if @support.is_t(arg1) {
          @bool.spec(arg2, th1)
        } else {
          if @support.is_t(arg2) {
            @bool.spec(arg1, th2)
          } else {
            if @support.is_f(arg1) {
              @bool.spec(arg2, th3)
            } else {
              if @support.is_f(arg2) {
                @bool.spec(arg1, th4)
              } else {
                if (arg1 == arg2) {
                  @bool.spec(arg1, th5)
                } else {
                  raise Failure("")
                }
              }
            }
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:146")
    }
  } catch {
    Failure(_) => raise Failure("AND_CONV")
    e => raise e
  })
}

///|
let and_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("AND_CONV")

///|
/// `AND_CONV`
pub fn and_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (and_conv_c.get())(x)
}

///|
/// OR_CONV
fn step_26() -> Unit raise {
  or_conv_c.set(try {
    match @lib.map(@bool.gen_all, @bool.conjuncts_rule(@bool.spec_all(@theorems.or_clauses()))) {
      More(th1, tail=More(th2, tail=More(th3, tail=More(th4, tail=More(th5, tail=Empty))))) => fn(x22 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x22
        let (arg1, arg2) = @basics.dest_disj(tm)
        if @support.is_t(arg1) {
          @bool.spec(arg2, th1)
        } else {
          if @support.is_t(arg2) {
            @bool.spec(arg1, th2)
          } else {
            if @support.is_f(arg1) {
              @bool.spec(arg2, th3)
            } else {
              if @support.is_f(arg2) {
                @bool.spec(arg1, th4)
              } else {
                if (arg1 == arg2) {
                  @bool.spec(arg1, th5)
                } else {
                  raise Failure("")
                }
              }
            }
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:170")
    }
  } catch {
    Failure(_) => raise Failure("OR_CONV")
    e => raise e
  })
}

///|
let or_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("OR_CONV")

///|
/// `OR_CONV`
pub fn or_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (or_conv_c.get())(x)
}

///|
/// `EQ_IMP_COND_ELIM_CONV`
pub fn eq_imp_cond_elim_conv(x23 : (@kernel.Term) -> Bool raise, x24 : @kernel.Term) -> @kernel.Thm raise {
  let is_atom = x23
  let tm = x24
  try {
    if is_atom(tm) {
      @equal.all_conv(tm)
    } else {
      if @basics.is_neg(tm) {
        @equal.rand_conv((x25 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x25))(tm)
      } else {
        if @basics.is_eq(tm) {
          let t28 = @equal.rand_conv((x27 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x27))
          @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv((x26 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x26))), t28), eq_expand_conv)(tm)
        } else {
          if @basics.is_imp(tm) {
            let t31 = @equal.rand_conv((x30 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x30))
            @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv((x29 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x29))), t31), imp_expand_conv)(tm)
          } else {
            if @class.is_cond(tm) {
              let t36 = @equal.rand_conv((x35 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x35))
              let t34 = @equal.rator_conv(@equal.rand_conv((x33 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x33)))
              @equal.thenc(@equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rator_conv(@equal.rand_conv((x32 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x32)))), t34), t36), cond_expand_conv)(tm)
            } else {
              let t39 = @equal.rand_conv((x38 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x38))
              @equal.thenc(@equal.rator_conv(@equal.rand_conv((x37 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x37))), t39)(tm)
            }
          }
        }
      }
    }
  } catch {
    Failure(_) => raise Failure("EQ_IMP_COND_ELIM_CONV")
    e => raise e
  }
}

///|
/// `MOVE_NOT_DOWN_CONV`
pub fn move_not_down_conv(x40 : (@kernel.Term) -> Bool raise, x41 : (@kernel.Term) -> @kernel.Thm raise, x42 : @kernel.Term) -> @kernel.Thm raise {
  let is_atom = x40
  let conv = x41
  let tm = x42
  try {
    if is_atom(tm) {
      conv(tm)
    } else {
      if @basics.is_neg(tm) {
        let tm_p = @kernel.rand(tm)
        if is_atom(tm_p) {
          @equal.thenc(conv, @equal.try_conv(not_conv))(tm)
        } else {
          if @basics.is_neg(tm_p) {
            @equal.thenc(not_not_norm_conv, (x43 : @kernel.Term) => move_not_down_conv(is_atom, conv, x43))(tm)
          } else {
            if @basics.is_conj(tm_p) {
              let t47 = @equal.try_conv(and_conv)
              let t46 = @equal.rand_conv((x45 : @kernel.Term) => move_not_down_conv(is_atom, conv, x45))
              @equal.thenc(@equal.thenc(@equal.thenc(not_conj_norm_conv, @equal.rator_conv(@equal.rand_conv((x44 : @kernel.Term) => move_not_down_conv(is_atom, conv, x44)))), t46), t47)(tm)
            } else {
              if @basics.is_disj(tm_p) {
                let t51 = @equal.try_conv(or_conv)
                let t50 = @equal.rand_conv((x49 : @kernel.Term) => move_not_down_conv(is_atom, conv, x49))
                @equal.thenc(@equal.thenc(@equal.thenc(not_disj_norm_conv, @equal.rator_conv(@equal.rand_conv((x48 : @kernel.Term) => move_not_down_conv(is_atom, conv, x48)))), t50), t51)(tm)
              } else {
                raise Failure("")
              }
            }
          }
        }
      } else {
        if @basics.is_conj(tm) {
          let t55 = @equal.try_conv(and_conv)
          let t54 = @equal.rand_conv((x53 : @kernel.Term) => move_not_down_conv(is_atom, conv, x53))
          @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv((x52 : @kernel.Term) => move_not_down_conv(is_atom, conv, x52))), t54), t55)(tm)
        } else {
          if @basics.is_disj(tm) {
            let t59 = @equal.try_conv(or_conv)
            let t58 = @equal.rand_conv((x57 : @kernel.Term) => move_not_down_conv(is_atom, conv, x57))
            @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv((x56 : @kernel.Term) => move_not_down_conv(is_atom, conv, x56))), t58), t59)(tm)
          } else {
            raise Failure("")
          }
        }
      }
    }
  } catch {
    Failure(_) => raise Failure("MOVE_NOT_DOWN_CONV")
    e => raise e
  }
}

///|
/// `CONJ_LINEAR_CONV`
pub fn conj_linear_conv(x60 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x60
  try {
    if (@basics.is_conj(tm) && @basics.is_conj(@kernel.rand(@kernel.rator(tm)))) {
      let t61 = @equal.try_conv(conj_linear_conv)
      @equal.thenc(@equal.thenc(conj_assoc_norm_conv, @equal.rand_conv(@equal.try_conv(conj_linear_conv))), t61)(tm)
    } else {
      raise Failure("")
    }
  } catch {
    Failure(_) => raise Failure("CONJ_LINEAR_CONV")
    e => raise e
  }
}

///|
/// `CONJ_NORM_FORM_CONV`
pub fn conj_norm_form_conv(x62 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x62
  try {
    if @basics.is_disj(tm) {
      if @basics.is_conj(@kernel.rand(@kernel.rator(tm))) {
        let t67 = @equal.try_conv(conj_linear_conv)
        let t66 = @equal.rand_conv(conj_norm_form_conv)
        let t65 = @equal.rator_conv(@equal.rand_conv(conj_norm_form_conv))
        let t64 = @equal.rand_conv(conj_norm_form_conv)
        let t63 = @equal.rand_conv(conj_norm_form_conv)
        @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv(@equal.thenc(@equal.rator_conv(@equal.rand_conv(conj_norm_form_conv)), t63))), t64), right_dist_norm_conv), t65), t66), t67)(tm)
      } else {
        if @basics.is_conj(@kernel.rand(tm)) {
          let t72 = @equal.try_conv(conj_linear_conv)
          let t71 = @equal.rand_conv(conj_norm_form_conv)
          let t70 = @equal.rator_conv(@equal.rand_conv(conj_norm_form_conv))
          let t68 = @equal.rand_conv(conj_norm_form_conv)
          let t69 = @equal.rand_conv(@equal.thenc(@equal.rator_conv(@equal.rand_conv(conj_norm_form_conv)), t68))
          @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv(conj_norm_form_conv)), t69), left_dist_norm_conv), t70), t71), t72)(tm)
        } else {
          if @basics.is_disj(@kernel.rand(@kernel.rator(tm))) {
            @equal.thenc(disj_assoc_norm_conv, conj_norm_form_conv)(tm)
          } else {
            let th = @equal.rand_conv(conj_norm_form_conv)(tm)
            let tm_p = @equal.rhs(@kernel.concl(th))
            if @basics.is_conj(@kernel.rand(tm_p)) {
              @kernel.trans(th, conj_norm_form_conv(tm_p))
            } else {
              th
            }
          }
        }
      }
    } else {
      if @basics.is_conj(tm) {
        let t74 = @equal.try_conv(conj_linear_conv)
        let t73 = @equal.rand_conv(conj_norm_form_conv)
        @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rand_conv(conj_norm_form_conv)), t73), t74)(tm)
      } else {
        @equal.all_conv(tm)
      }
    }
  } catch {
    Failure(_) => raise Failure("CONJ_NORM_FORM_CONV")
    e => raise e
  }
}

///|
/// `has_boolean_args_and_result`
pub fn has_boolean_args_and_result(x75 : @kernel.Term) -> Bool raise {
  let tm = x75
  try {
    let args = @basics.strip_comb(tm).1
    let t77 = @lib.map(fn(x76 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x76)
    }, args)
    let types = t77.prepend(@kernel.type_of(tm))
    let t78 = @list.List([@term_syntax.parse_type("Bool")])
    @list.List::is_empty(@lib.subtract(@lib.setify(types), t78))
  } catch {
    Failure(_) => {
      let t79 = @term_syntax.parse_type("Bool")
      (@kernel.type_of(tm) == t79)
    }
    e => raise e
  }
}

///|
/// `CLAUSAL_FORM_CONV`
pub fn clausal_form_conv(x80 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x80
  try {
    let is_atom : (@kernel.Term) -> Bool raise = fn(x81 : @kernel.Term) -> Bool raise {
      let tm_1 = x81
      (!has_boolean_args_and_result(tm_1) || (@kernel.is_var(tm_1) || @kernel.is_const(tm_1)))
    }
    @equal.thenc(@equal.thenc((x82 : @kernel.Term) => eq_imp_cond_elim_conv(is_atom, x82), (x83 : @kernel.Term) => move_not_down_conv(is_atom, @equal.all_conv, x83)), conj_norm_form_conv)(tm)
  } catch {
    Failure(_) => raise Failure("CLAUSAL_FORM_CONV")
    e => raise e
  }
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
}
