// Translated from upstream Examples/dlo.ml; edit this file directly.

///|
/// Examples/dlo.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// list_conj
fn step_2() -> Unit raise {
  let t_tm = @term_syntax.parse_term("true")
  list_conj_c.set(fn(x1 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let l = x1
    if @list.List::is_empty(l) {
      t_tm
    } else {
      @lib.end_itlist((x3 : @kernel.Term, x4 : @kernel.Term) => @lib.curry(fn(x2 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @bool.mk_conj(x2.0, x2.1)
      }, x3, x4), l)
    }
  })
}

///|
let list_conj_c : @lib.Cell[(@list.List[@kernel.Term]) -> @kernel.Term raise] = @lib.Cell::new("list_conj")

///|
/// `list_conj`
pub fn list_conj(x : @list.List[@kernel.Term]) -> @kernel.Term raise {
  (list_conj_c.get())(x)
}

///|
/// mk_lt
fn step_3() -> Unit raise {
  let t5 = @term_syntax.parse_term("real_lt")
  mk_lt_c.set(fn(x8 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x9 : @kernel.Term) -> @kernel.Term raise {
      ((x6 : @kernel.Term, x7 : @kernel.Term) => @basics.mk_binop(t5, x6, x7))(x8, x9)
    }
  })
}

///|
let mk_lt_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("mk_lt")

///|
/// `mk_lt`
pub fn mk_lt(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (mk_lt_c.get())(x)
}

///|
/// DOUBLE_NEG_CONV
fn step_4() -> Unit raise {
  let dn_thm = @class.taut(@term_syntax.parse_term("∀ x : Bool, !!x == x"))
  let dn_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x10 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x10
    let tm_p = @basics.dest_neg(@basics.dest_neg(tm))
    @bool.ispec(tm_p, dn_thm)
  }
  double_neg_conv_c.set(dn_conv)
}

///|
let double_neg_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("DOUBLE_NEG_CONV")

///|
/// `DOUBLE_NEG_CONV`
pub fn double_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (double_neg_conv_c.get())(x)
}

///|
/// IMP_CONV
fn step_5() -> Unit raise {
  let i_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, (a → b) == (!a || b)"))
  let i_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x11 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x11
    let (a, b) = @basics.dest_imp(tm)
    @bool.ispecl(@list.List([a, b]), i_thm)
  }
  imp_conv_c.set(i_conv)
}

///|
let imp_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("IMP_CONV")

///|
/// `IMP_CONV`
pub fn imp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (imp_conv_c.get())(x)
}

///|
/// BEQ_CONV
fn step_6() -> Unit raise {
  let beq_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, (a == b) == (a && b || !a && !b)"))
  let beq_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(x12 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x12
    let (a, b) = @kernel.dest_eq(tm)
    @bool.ispecl(@list.List([a, b]), beq_thm)
  }
  beq_conv_c.set(beq_conv_1)
}

///|
let beq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("BEQ_CONV")

///|
/// `BEQ_CONV`
pub fn beq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (beq_conv_c.get())(x)
}

///|
/// NEG_AND_CONV
fn step_7() -> Unit raise {
  let na_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, !(a && b) == (!a || !b)"))
  let na_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x13 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x13
    let (a, b) = @basics.dest_conj(@basics.dest_neg(tm))
    @bool.ispecl(@list.List([a, b]), na_thm)
  }
  neg_and_conv_c.set(na_conv)
}

///|
let neg_and_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NEG_AND_CONV")

///|
/// `NEG_AND_CONV`
pub fn neg_and_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (neg_and_conv_c.get())(x)
}

///|
/// NEG_OR_CONV
fn step_8() -> Unit raise {
  let no_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, !(a || b) == (!a && !b)"))
  let no_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x14 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x14
    let (a, b) = @basics.dest_disj(@basics.dest_neg(tm))
    @bool.ispecl(@list.List([a, b]), no_thm)
  }
  neg_or_conv_c.set(no_conv)
}

///|
let neg_or_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NEG_OR_CONV")

///|
/// `NEG_OR_CONV`
pub fn neg_or_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (neg_or_conv_c.get())(x)
}

///|
/// NEG_IMP_CONV
fn step_9() -> Unit raise {
  let ni_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, !(a → b) == (a && !b)"))
  let ni_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x15 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x15
    let (a, b) = @basics.dest_imp(@basics.dest_neg(tm))
    @bool.ispecl(@list.List([a, b]), ni_thm)
  }
  neg_imp_conv_c.set(ni_conv)
}

///|
let neg_imp_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NEG_IMP_CONV")

///|
/// `NEG_IMP_CONV`
pub fn neg_imp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (neg_imp_conv_c.get())(x)
}

///|
/// NEG_BEQ_CONV
fn step_10() -> Unit raise {
  let nbeq_thm = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, !(a == b) == (a && !b || !a && b)"))
  let nbeq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x16 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x16
    let (a, b) = @kernel.dest_eq(@basics.dest_neg(tm))
    @bool.ispecl(@list.List([a, b]), nbeq_thm)
  }
  neg_beq_conv_c.set(nbeq_conv)
}

///|
let neg_beq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NEG_BEQ_CONV")

///|
/// `NEG_BEQ_CONV`
pub fn neg_beq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (neg_beq_conv_c.get())(x)
}

///|
/// `dest_cases`
pub fn dest_cases(x17 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let tm = x17
  try {
    let (l, r) = @basics.dest_disj(tm)
    let (p, q0) = @basics.dest_conj(l)
    let (np, q1) = @basics.dest_conj(r)
    if (@bool.mk_neg(p) == np) {
      (p, q0, q1)
    } else {
      raise Failure("not a cases term")
    }
  } catch {
    Failure(_) => raise Failure("not a cases term")
    e => raise e
  }
}

///|
/// is_cases
fn step_11() -> Unit raise {
  is_cases_c.set((x18 : @kernel.Term) => @lib.can(dest_cases, x18))
}

///|
let is_cases_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_cases")

///|
/// `is_cases`
pub fn is_cases(x : @kernel.Term) -> Bool raise {
  (is_cases_c.get())(x)
}

///|
/// CASES_CONV
fn step_12() -> Unit raise {
  let c_thm = @class.taut(@term_syntax.parse_term("∀ p : Bool, ∀ q0 : Bool, ∀ q1 : Bool, !(p && q0 || !p && q1) == (p && !q0 || !p && !q1)"))
  let cc : (@kernel.Term) -> @kernel.Thm raise = fn(x19 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x19
    let (p, q0, q1) = dest_cases(tm)
    @bool.ispecl(@list.List([p, q0, q1]), c_thm)
  }
  cases_conv_c.set(cc)
}

///|
let cases_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("CASES_CONV")

///|
/// `CASES_CONV`
pub fn cases_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cases_conv_c.get())(x)
}

///|
/// QE_SIMPLIFY_CONV
fn step_13() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @theorems.conj_assoc()]))
  let t21 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.exists_unique_thm(), @class.de_morgan_thm(), @class.not_exists_thm()])), t20)
  let not_exists_unique_thm = @tactics.prove(@term_syntax.parse_term("!existsunique((x : _) => (P : (_) -> Bool)(x)) == ((∀ x : _, !P(x)) || (∃ x : _, ∃ x' : _, P(x) && P(x') && !(x == x')))"), t21)
  let t22 = @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) || !p && (r : Bool)) == (p && !q || !p && !r)"))
  let t23 = @class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (p && q || !p && !q)"))
  let t24 = @class.taut(@term_syntax.parse_term("!((p : Bool) == (q : Bool)) == (p && !q || !p && q)"))
  let t25 = @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (!p || q)"))
  let t26 = @class.taut(@term_syntax.parse_term("!((p : Bool) → (q : Bool)) == (p && !q)"))
  let t27 = @class.taut(@term_syntax.parse_term("!((p : Bool) || (q : Bool)) == (!p && !q)"))
  let t28 = @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (!p || !q)"))
  let tauts = @list.List([@class.taut(@term_syntax.parse_term("!!(p : Bool) == p")), t28, t27, t26, t25, @class.not_forall_thm(), @class.not_exists_thm(), @theorems.exists_unique_thm(), not_exists_unique_thm, t24, t23, t22])
  qe_simplify_conv_c.set(@simp.gen_rewrite_conv(fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s30 = @equal.top_sweep_conv(x29)
    fn(x31 : @kernel.Term) -> @kernel.Thm raise {
      s30(x31)
    }
  }, tauts))
}

///|
let qe_simplify_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QE_SIMPLIFY_CONV")

///|
/// `QE_SIMPLIFY_CONV`
pub fn qe_simplify_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (qe_simplify_conv_c.get())(x)
}

///|
/// CNNF_CONV
fn step_14() -> Unit raise {
  let refl_conj = @kernel.refl(@term_syntax.parse_term("op_slash_bslash"))
  let refl_disj = @kernel.refl(@term_syntax.parse_term("op_bslash_slash"))
  cnnf_conv_c.set(fn(x32 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let lfn_conv = x32
    fn cnnf_conv_1(x34 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x34
      if @basics.is_conj(tm) {
        let (p, q) = @basics.dest_conj(tm)
        let thm1 = cnnf_conv_1(p)
        let thm2 = cnnf_conv_1(q)
        @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, thm1), thm2)
      } else {
        if @basics.is_disj(tm) {
          let (p_1, q_1) = @basics.dest_disj(tm)
          let thm1_1 = cnnf_conv_1(p_1)
          let thm2_1 = cnnf_conv_1(q_1)
          @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_1), thm2_1)
        } else {
          if @basics.is_imp(tm) {
            let (p_2, q_2) = @basics.dest_imp(tm)
            let thm1_2 = cnnf_conv_1(@bool.mk_neg(p_2))
            let thm2_2 = cnnf_conv_1(q_2)
            let t35 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_2), thm2_2)
            @kernel.trans(imp_conv(tm), t35)
          } else {
            if @bool.is_iff(tm) {
              let (p_3, q_3) = @kernel.dest_eq(tm)
              let pthm = cnnf_conv_1(p_3)
              let qthm = cnnf_conv_1(q_3)
              let npthm = cnnf_conv_1(@bool.mk_neg(p_3))
              let nqthm = cnnf_conv_1(@bool.mk_neg(q_3))
              let thm1_3 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, pthm), qthm)
              let thm2_3 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, npthm), nqthm)
              let t36 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_3), thm2_3)
              @kernel.trans(beq_conv(tm), t36)
            } else {
              if @basics.is_neg(tm) {
                let tm_p = @basics.dest_neg(tm)
                if @basics.is_neg(tm_p) {
                  let tm_p_p = @basics.dest_neg(tm_p)
                  let thm = cnnf_conv_1(tm)
                  @kernel.trans(double_neg_conv(tm_p_p), thm)
                } else {
                  if @basics.is_conj(tm_p) {
                    let (p_4, q_4) = @basics.dest_conj(tm_p)
                    let thm1_4 = cnnf_conv_1(@bool.mk_neg(p_4))
                    let thm2_4 = cnnf_conv_1(@bool.mk_neg(q_4))
                    let t37 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_4), thm2_4)
                    @kernel.trans(neg_and_conv(tm), t37)
                  } else {
                    if is_cases(tm_p) {
                      let (p_5, q0, q1) = dest_cases(tm)
                      let thm1_5 = cnnf_conv_1(@bool.mk_conj(p_5, @bool.mk_neg(q0)))
                      let t38 = @bool.mk_neg(q1)
                      let thm2_5 = cnnf_conv_1(@bool.mk_conj(@bool.mk_neg(p_5), t38))
                      let t39 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_5), thm2_5)
                      @kernel.trans(cases_conv(tm), t39)
                    } else {
                      if @basics.is_disj(tm_p) {
                        let (p_6, q_5) = @basics.dest_disj(tm_p)
                        let thm1_6 = cnnf_conv_1(@bool.mk_neg(p_6))
                        let thm2_6 = cnnf_conv_1(@bool.mk_neg(q_5))
                        let t40 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, thm1_6), thm2_6)
                        @kernel.trans(neg_or_conv(tm), t40)
                      } else {
                        if @basics.is_imp(tm_p) {
                          let (p_7, q_6) = @basics.dest_imp(tm_p)
                          let thm1_7 = cnnf_conv_1(p_7)
                          let thm2_7 = cnnf_conv_1(@bool.mk_neg(q_6))
                          let t41 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, thm1_7), thm2_7)
                          @kernel.trans(neg_imp_conv(tm), t41)
                        } else {
                          if @bool.is_iff(tm_p) {
                            let (p_8, q_7) = @kernel.dest_eq(tm_p)
                            let pthm_1 = cnnf_conv_1(p_8)
                            let qthm_1 = cnnf_conv_1(q_7)
                            let npthm_1 = cnnf_conv_1(@bool.mk_neg(p_8))
                            let nqthm_1 = cnnf_conv_1(@bool.mk_neg(q_7))
                            let thm1_8 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, pthm_1), nqthm_1)
                            let thm2_8 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_conj, npthm_1), qthm_1)
                            let t42 = @kernel.mk_comb_rule(@kernel.mk_comb_rule(refl_disj, thm1_8), thm2_8)
                            @kernel.trans(neg_beq_conv(tm), t42)
                          } else {
                            lfn_conv(tm)
                          }
                        }
                      }
                    }
                  }
                }
              } else {
                lfn_conv(tm)
              }
            }
          }
        }
      }
    }
    @equal.thenc(@equal.thenc(qe_simplify_conv, cnnf_conv_1), qe_simplify_conv)
  })
}

///|
let cnnf_conv_c : @lib.Cell[((@kernel.Term) -> @kernel.Thm raise) -> @equal.Conv raise] = @lib.Cell::new("CNNF_CONV")

///|
/// `CNNF_CONV`
pub fn cnnf_conv(x : (@kernel.Term) -> @kernel.Thm raise) -> @equal.Conv raise {
  (cnnf_conv_c.get())(x)
}

///|
/// MINL
fn step_15() -> Unit raise {
  let t43 = @term_syntax.parse_term("(MINL : (List[Real], Real) -> Real)(NIL, (default : Real)) == default && MINL(CONS((h : Real), (t : List[Real])), default) == min(h, MINL(t, default))")
  minl_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t43))
}

///|
let minl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINL")

///|
/// `MINL`
pub fn minl() -> @kernel.Thm {
  minl_c.get()
}

///|
/// MAXL
fn step_16() -> Unit raise {
  let t44 = @term_syntax.parse_term("(MAXL : (List[Real], Real) -> Real)(NIL, (default : Real)) == default && MAXL(CONS((h : Real), (t : List[Real])), default) == max(h, MAXL(t, default))")
  maxl_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t44))
}

///|
let maxl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAXL")

///|
/// `MAXL`
pub fn maxl() -> @kernel.Thm {
  maxl_c.get()
}

///|
/// MAX_LT
fn step_17() -> Unit raise {
  let t45 = @meson.meson_tac(@list.List([@realarith.real_let_trans(), @realax.real_le_total()]))
  let t46 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_max()])), t45)
  max_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (max(x, y) < z) == (x < z && y < z)"), t46))
}

///|
let max_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_LT")

///|
/// `MAX_LT`
pub fn max_lt() -> @kernel.Thm {
  max_lt_c.get()
}

///|
/// MIN_GT
fn step_18() -> Unit raise {
  let t47 = @meson.meson_tac(@list.List([@realarith.real_lte_trans(), @realax.real_le_total()]))
  let t48 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_min()])), t47)
  min_gt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x < min(y, z)) == (x < y && x < z)"), t48))
}

///|
let min_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MIN_GT")

///|
/// `MIN_GT`
pub fn min_gt() -> @kernel.Thm {
  min_gt_c.get()
}

///|
/// ALL_LT_LEMMA
fn step_19() -> Unit raise {
  let t53 = @meson.asm_meson_tac(@list.List([max_lt()]))
  let t52 = @simp.rewrite_tac(@list.List([@lists.all(), maxl(), max_lt()]))
  let t50 = @term_syntax.parse_term("(t : List[Real])")
  let t51 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t50)
  let t49 = @simp.rewrite_tac(@list.List([maxl(), @lists.all()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t49), t51), @lists.list_induct_tac), t52), t53)
  all_lt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ left : Real, ∀ x : Real, ∀ lefts : List[Real], ALL((l : Real) => l < x, CONS(left, lefts)) == (MAXL(lefts, left) < x)"), t54))
}

///|
let all_lt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_LT_LEMMA")

///|
/// `ALL_LT_LEMMA`
pub fn all_lt_lemma() -> @kernel.Thm {
  all_lt_lemma_c.get()
}

///|
/// ALL_GT_LEMMA
fn step_20() -> Unit raise {
  let t59 = @meson.asm_meson_tac(@list.List([min_gt()]))
  let t58 = @simp.rewrite_tac(@list.List([@lists.all(), minl(), min_gt()]))
  let t56 = @term_syntax.parse_term("(t : List[Real])")
  let t57 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t56)
  let t55 = @simp.rewrite_tac(@list.List([minl(), @lists.all()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t55), t57), @lists.list_induct_tac), t58), t59)
  all_gt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ right : Real, ∀ x : Real, ∀ rights : List[Real], ALL((r : Real) => x < r, CONS(right, rights)) == (x < MINL(rights, right))"), t60))
}

///|
let all_gt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_GT_LEMMA")

///|
/// `ALL_GT_LEMMA`
pub fn all_gt_lemma() -> @kernel.Thm {
  all_gt_lemma_c.get()
}

///|
/// REAL_DENSE
fn step_21() -> Unit raise {
  let t66 = @tactics.pop_assum(fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.mp_tac(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  })
  let t62 = @simp.simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.real_lt_rdiv_eq(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t61 = @tactics.exists_tac(@term_syntax.parse_term("((x : Real) + (y : Real)) / real_of_num(2)"))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t61), t62), t66), @calc_rat.real_arith_tac)
  real_dense_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → (∃ z : Real, x < z && z < y)"), t67))
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
fn step_22() -> Unit raise {
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("(x : Real) + real_of_num(1)"))), @calc_rat.real_arith_tac)
  real_lt_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ y : Real, x < y"), t68))
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
fn step_23() -> Unit raise {
  let t69 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("(x : Real) - real_of_num(1)"))), @calc_rat.real_arith_tac)
  real_gt_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ y : Real, y < x"), t69))
}

///|
let real_gt_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_GT_EXISTS")

///|
/// `REAL_GT_EXISTS`
pub fn real_gt_exists() -> @kernel.Thm {
  real_gt_exists_c.get()
}

///|
/// LFN_DLO_CONV
fn step_24() -> Unit raise {
  let t70 = @calc_rat.real_arith(@term_syntax.parse_term("!((s : Real) == (t : Real)) == (s < t || t < s)"))
  lfn_dlo_conv_c.set(@simp.pure_rewrite_conv(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((s : Real) < (t : Real)) == (s == t || t < s)")), t70])))
}

///|
let lfn_dlo_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LFN_DLO_CONV")

///|
/// `LFN_DLO_CONV`
pub fn lfn_dlo_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (lfn_dlo_conv_c.get())(x)
}

///|
/// PROFORMA_LEFT
fn step_25() -> Unit raise {
  let t71 = @meson.meson_tac(@list.List([real_lt_exists()]))
  let t72 = @tactics.then_tac(@simp.rewrite_tac(@list.List([all_lt_lemma()])), t71)
  proforma_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Real, ∀ ls : List[Real], (∃ x : Real, ALL((l : Real) => l < x, CONS(l, ls))) == true"), t72))
}

///|
let proforma_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROFORMA_LEFT")

///|
/// `PROFORMA_LEFT`
pub fn proforma_left() -> @kernel.Thm {
  proforma_left_c.get()
}

///|
/// PROFORMA_RIGHT
fn step_26() -> Unit raise {
  let t73 = @meson.meson_tac(@list.List([real_gt_exists()]))
  let t74 = @tactics.then_tac(@simp.rewrite_tac(@list.List([all_gt_lemma()])), t73)
  proforma_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Real, ∀ rs : List[Real], (∃ x : Real, ALL((r : Real) => x < r, CONS(r, rs))) == true"), t74))
}

///|
let proforma_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROFORMA_RIGHT")

///|
/// `PROFORMA_RIGHT`
pub fn proforma_right() -> @kernel.Thm {
  proforma_right_c.get()
}

///|
/// PROFORMA_BOTH
fn step_27() -> Unit raise {
  let t75 = @meson.meson_tac(@list.List([real_dense(), @realarith.real_lt_trans()]))
  let t76 = @tactics.then_tac(@simp.rewrite_tac(@list.List([all_lt_lemma(), all_gt_lemma()])), t75)
  proforma_both_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Real, ∀ ls : List[Real], ∀ r : Real, ∀ rs : List[Real], (∃ x : Real, ALL((l : Real) => l < x, CONS(l, ls)) && ALL((r : Real) => x < r, CONS(r, rs))) == ALL((l : Real) => ALL((r : Real) => l < r, CONS(r, rs)), CONS(l, ls))"), t76))
}

///|
let proforma_both_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROFORMA_BOTH")

///|
/// `PROFORMA_BOTH`
pub fn proforma_both() -> @kernel.Thm {
  proforma_both_c.get()
}

///|
/// mk_rlist
fn step_28() -> Unit raise {
  let ty = @term_syntax.parse_type("Real")
  mk_rlist_c.set(fn(x77 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let x = x77
    @lists.mk_list(x, ty)
  })
}

///|
let mk_rlist_c : @lib.Cell[(@list.List[@kernel.Term]) -> @kernel.Term raise] = @lib.Cell::new("mk_rlist")

///|
/// `mk_rlist`
pub fn mk_rlist(x : @list.List[@kernel.Term]) -> @kernel.Term raise {
  (mk_rlist_c.get())(x)
}

///|
/// expand_all
fn step_29() -> Unit raise {
  let t78 = @class.taut(@term_syntax.parse_term("((a : Bool) && true) == a"))
  expand_all_c.set(@simp.pure_rewrite_rule(@list.List([@lists.all(), @theorems.beta_thm(), @equal.gsym(@theorems.conj_assoc()), t78])))
}

///|
let expand_all_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("expand_all")

///|
/// `expand_all`
pub fn expand_all(x : @kernel.Thm) -> @kernel.Thm raise {
  (expand_all_c.get())(x)
}

///|
/// `DLO_EQ_CONV`
pub fn dlo_eq_conv(x79 : @kernel.Term) -> @kernel.Thm raise {
  let fm = x79
  let (x, p) = @basics.dest_exists(fm)
  let (xl, xr) = @lib.partition(fn(x80 : @kernel.Term) -> Bool raise {
    let t = x80
    (@kernel.rand(t) == x)
  }, @basics.conjuncts(p))
  let lefts = @lib.map(@equal.lhand, xl)
  let rights = @lib.map(@kernel.rand, xr)
  let th1 = if @list.List::is_empty(lefts) {
    let t81 = mk_rlist(@lib.tl(rights))
    @bool.specl(@list.List([@lib.hd(rights), t81]), proforma_right())
  } else {
    if @list.List::is_empty(rights) {
      let t82 = mk_rlist(@lib.tl(lefts))
      @bool.specl(@list.List([@lib.hd(lefts), t82]), proforma_left())
    } else {
      let t83 = mk_rlist(@lib.tl(rights))
      let t84 = @lib.hd(rights)
      let t85 = mk_rlist(@lib.tl(lefts))
      @bool.specl(@list.List([@lib.hd(lefts), t85, t84, t83]), proforma_both())
    }
  }
  let t86 = expand_all(th1)
  let th2 = @equal.conv_rule(@equal.land_conv(@equal.gen_alpha_conv(x)), t86)
  let p_p = @basics.dest_exists(@equal.lhand(@kernel.concl(th2))).1
  let th3 = @drule.mk_exists_rule(x, @canon.conj_aci_rule(@basics.mk_eq(p, p_p)))
  @kernel.trans(th3, th2)
}

///|
/// eq_triv_conv
fn step_30() -> Unit raise {
  let t87 = @meson.meson_tac(@list.List([]))
  let pth_triv = @tactics.prove(@term_syntax.parse_term("(∃ x : _, x == x) == true && (∃ x : _, x == (t : _)) == true && (∃ x : _, t == x) == true && (∃ x : _, x == t && (P : (_) -> Bool)(x)) == P(t) && (∃ x : _, t == x && P(x)) == P(t)"), t87)
  eq_triv_conv_c.set(@simp.gen_rewrite_conv(fn(x88 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x88
  }, @list.List([pth_triv])))
}

///|
let eq_triv_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("eq_triv_conv")

///|
/// `eq_triv_conv`
pub fn eq_triv_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (eq_triv_conv_c.get())(x)
}

///|
/// eq_refl_conv
fn step_31() -> Unit raise {
  let t89 = @meson.meson_tac(@list.List([]))
  let pth_refl = @tactics.prove(@term_syntax.parse_term("(∃ x : _, x == x && (P : (_) -> Bool)(x)) == (∃ x : _, P(x))"), t89)
  eq_refl_conv_c.set(@simp.gen_rewrite_conv(fn(x90 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x90
  }, @list.List([pth_refl])))
}

///|
let eq_refl_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("eq_refl_conv")

///|
/// `eq_refl_conv`
pub fn eq_refl_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (eq_refl_conv_c.get())(x)
}

///|
/// lt_refl_conv
fn step_32() -> Unit raise {
  lt_refl_conv_c.set(@simp.gen_rewrite_conv(fn(x91 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s92 = @equal.depth_conv(x91)
    fn(x93 : @kernel.Term) -> @kernel.Thm raise {
      s92(x93)
    }
  }, @list.List([@realarith.real_lt_refl(), @theorems.and_clauses(), @theorems.exists_simp()])))
}

///|
let lt_refl_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("lt_refl_conv")

///|
/// `lt_refl_conv`
pub fn lt_refl_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (lt_refl_conv_c.get())(x)
}

///|
/// `DLOBASIC_CONV`
pub fn dlobasic_conv(x94 : @kernel.Term) -> @kernel.Thm raise {
  let fm = x94
  try {
    let (x, p) = @basics.dest_exists(fm)
    let cjs = @basics.conjuncts(p)
    try {
      let eq = @lib.find(fn(x95 : @kernel.Term) -> Bool raise {
        let e = x95
        (@basics.is_eq(e) && ((@equal.lhs(e) == x) || (@equal.rhs(e) == x)))
      }, cjs)
      let cjs_p = @lib.setify(@lib.subtract(cjs, @list.List([eq]))).prepend(eq)
      let p_p = @bool.list_mk_conj(cjs_p)
      let th1 = @drule.mk_exists_rule(x, @canon.conj_aci_rule(@basics.mk_eq(p, p_p)))
      let fm_p = @kernel.rand(@kernel.concl(th1))
      try {
        @kernel.trans(th1, eq_triv_conv(fm_p))
      } catch {
        Failure(_) => @kernel.trans(th1, @equal.thenc(eq_refl_conv, dlobasic_conv)(fm_p))
        e => raise e
      }
    } catch {
      Failure(_) => {
        if @lib.mem(mk_lt(x)(x), cjs) {
          lt_refl_conv(fm)
        } else {
          dlo_eq_conv(fm)
        }
      }
      e => raise e
    }
  } catch {
    Failure(_) => {
      @printer.print_qterm(fm)
      raise Failure("dlobasic")
    }
    e => raise e
  }
}

///|
/// `AFN_DLO_CONV`
pub fn[TA] afn_dlo_conv(x96 : TA) -> @equal.Conv raise {
  let vars = x96
  let t98 = @calc_rat.real_arith(@term_syntax.parse_term("((s : Real) > (t : Real)) == (t < s)"))
  let t99 = @calc_rat.real_arith(@term_syntax.parse_term("((s : Real) >= (t : Real)) == !(s < t)"))
  @simp.pure_rewrite_conv(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((s : Real) <= (t : Real)) == !(t < s)")), t99, t98]))
}

///|
/// `dest_binop_op`
pub fn dest_binop_op(x100 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let tm = x100
  try {
    let (f, r) = @kernel.dest_comb(tm)
    let (op, l) = @kernel.dest_comb(f)
    (l, r, op)
  } catch {
    Failure(_) => raise Failure("dest_binop_op")
    e => raise e
  }
}

///|
/// forall_thm
fn step_33() -> Unit raise {
  let t101 = @meson.meson_tac(@list.List([]))
  forall_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, (∀ x : _, P(x)) == !(∃ x : _, !P(x))"), t101))
}

///|
let forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("forall_thm")

///|
/// `forall_thm`
pub fn forall_thm() -> @kernel.Thm {
  forall_thm_c.get()
}

///|
/// or_exists_conv
fn step_34() -> Unit raise {
  or_exists_conv_c.set(@simp.pure_rewrite_conv(@list.List([@theorems.or_exists_thm()])))
}

///|
let or_exists_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("or_exists_conv")

///|
/// `or_exists_conv`
pub fn or_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (or_exists_conv_c.get())(x)
}

///|
/// triv_exists_conv
fn step_35() -> Unit raise {
  triv_exists_conv_c.set(@simp.rewr_conv(@theorems.exists_simp()))
}

///|
let triv_exists_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("triv_exists_conv")

///|
/// `triv_exists_conv`
pub fn triv_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (triv_exists_conv_c.get())(x)
}

///|
/// push_exists_conv
fn step_36() -> Unit raise {
  push_exists_conv_c.set(@simp.rewr_conv(@theorems.right_exists_and_thm()))
}

///|
let push_exists_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("push_exists_conv")

///|
/// `push_exists_conv`
pub fn push_exists_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (push_exists_conv_c.get())(x)
}

///|
/// not_tm
fn step_37() -> Unit raise {
  not_tm_c.set(@term_syntax.parse_term("op_tilde"))
}

///|
let not_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("not_tm")

///|
/// `not_tm`
pub fn not_tm() -> @kernel.Term {
  not_tm_c.get()
}

///|
/// or_tm
fn step_38() -> Unit raise {
  or_tm_c.set(@term_syntax.parse_term("op_bslash_slash"))
}

///|
let or_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("or_tm")

///|
/// `or_tm`
pub fn or_tm() -> @kernel.Term {
  or_tm_c.get()
}

///|
/// t_tm
fn step_39() -> Unit raise {
  t_tm_c.set(@term_syntax.parse_term("true"))
}

///|
let t_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t_tm")

///|
/// `t_tm`
pub fn t_tm() -> @kernel.Term {
  t_tm_c.get()
}

///|
/// f_tm
fn step_40() -> Unit raise {
  f_tm_c.set(@term_syntax.parse_term("false"))
}

///|
let f_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_tm")

///|
/// `f_tm`
pub fn f_tm() -> @kernel.Term {
  f_tm_c.get()
}

///|
/// `LIFT_QELIM_CONV`
pub fn lift_qelim_conv(x102 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x103 : (@kernel.Term) -> @kernel.Thm raise, x104 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let afn_conv = x102
  let nfn_conv = x103
  let qfn_conv = x104
  let qelift_conv = (x106 : @list.List[@kernel.Term], x107 : @kernel.Term) => qelift_conv_l(nfn_conv, afn_conv, qfn_conv, x106, x107)
  let qelim = (x111 : @kernel.Term, x112 : @list.List[@kernel.Term], x113 : @kernel.Term) => qelim_l(nfn_conv, afn_conv, qfn_conv, x111, x112, x113)
  fn(x121 : @kernel.Term) -> @kernel.Thm raise {
    let fm_1 = x121
    let t122 = @kernel.frees(fm_1)
    @equal.thenc((x123 : @kernel.Term) => qelift_conv(t122, x123), qe_simplify_conv)(fm_1)
  }
}

///|
fn qelift_conv_l(nfn_conv : (@kernel.Term) -> @kernel.Thm raise, afn_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, qfn_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x106 : @list.List[@kernel.Term], x107 : @kernel.Term) -> @kernel.Thm raise {
  let qelift_conv = (x106 : @list.List[@kernel.Term], x107 : @kernel.Term) => qelift_conv_l(nfn_conv, afn_conv, qfn_conv, x106, x107)
  let qelim = (x111 : @kernel.Term, x112 : @list.List[@kernel.Term], x113 : @kernel.Term) => qelim_l(nfn_conv, afn_conv, qfn_conv, x111, x112, x113)
  let vars = x106
  let fm = x107
  if ((fm == t_tm()) || (fm == f_tm())) {
    @kernel.refl(fm)
  } else {
    if @basics.is_neg(fm) {
      let thm1 = qelift_conv(vars, @basics.dest_neg(fm))
      @kernel.mk_comb_rule(@kernel.refl(not_tm()), thm1)
    } else {
      if (@basics.is_conj(fm) || (@basics.is_disj(fm) || (@basics.is_imp(fm) || @bool.is_iff(fm)))) {
        let (p, q, op) = dest_binop_op(fm)
        let thm1_1 = qelift_conv(vars, p)
        let thm2 = qelift_conv(vars, q)
        @kernel.mk_comb_rule(@kernel.mk_comb_rule(@kernel.refl(op), thm1_1), thm2)
      } else {
        if @basics.is_forall(fm) {
          let (x, p_1) = @basics.dest_forall(fm)
          let nex_thm = @equal.beta_rule(@bool.ispec(@kernel.mk_abs(x, p_1), forall_thm()))
          let elim_thm = qelift_conv(vars, @bool.mk_exists(x, @bool.mk_neg(p_1)))
          @kernel.trans(nex_thm, @kernel.mk_comb_rule(@kernel.refl(not_tm()), elim_thm))
        } else {
          if @basics.is_exists(fm) {
            let (x_1, p_2) = @basics.dest_exists(fm)
            let thm1_2 = qelift_conv(vars.prepend(x_1), p_2)
            let thm1a = @drule.mk_exists_rule(x_1, thm1_2)
            let thm2_1 = nfn_conv(@equal.rhs(@kernel.concl(thm1_2)))
            let thm2a = @drule.mk_exists_rule(x_1, thm2_1)
            let djs = @basics.disjuncts(@equal.rhs(@kernel.concl(thm2_1)))
            let djthms = @lib.map((x108 : @kernel.Term) => qelim(x_1, vars, x108), djs)
            let thm3 = @lib.end_itlist(fn(x109 : @kernel.Thm, x110 : @kernel.Thm) -> @kernel.Thm raise {
              let thm1_3 = x109
              let thm2_2 = x110
              @kernel.mk_comb_rule(@kernel.mk_comb_rule(@kernel.refl(or_tm()), thm1_3), thm2_2)
            }, djthms)
            let split_ex_thm = @equal.gsym(or_exists_conv(@equal.lhs(@kernel.concl(thm3))))
            let thm3a = @kernel.trans(split_ex_thm, thm3)
            @kernel.trans(@kernel.trans(thm1a, thm2a), thm3a)
          } else {
            afn_conv(vars)(fm)
          }
        }
      }
    }
  }
}

///|
fn qelim_l(nfn_conv : (@kernel.Term) -> @kernel.Thm raise, afn_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, qfn_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x111 : @kernel.Term, x112 : @list.List[@kernel.Term], x113 : @kernel.Term) -> @kernel.Thm raise {
  let x_2 = x111
  let vars_1 = x112
  let p_3 = x113
  let cjs = @basics.conjuncts(p_3)
  let (ycjs, ncjs) = @lib.partition(fn(x117 : @kernel.Term) -> Bool raise {
    (fn(x115 : @list.List[@kernel.Term]) -> Bool raise {
      ((x114 : @list.List[@kernel.Term]) => @lib.mem(x_2, x114))(x115)
    })((fn(x116 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      @kernel.frees(x116)
    })(x117))
  }, cjs)
  if @list.List::is_empty(ycjs) {
    triv_exists_conv(@bool.mk_exists(x_2, p_3))
  } else {
    if @list.List::is_empty(ncjs) {
      let t118 = @bool.mk_exists(x_2, p_3)
      qfn_conv(vars_1)(t118)
    } else {
      let t119 = @bool.list_mk_conj(ycjs)
      let th1 = @canon.conj_aci_rule(@basics.mk_eq(p_3, @bool.mk_conj(@bool.list_mk_conj(ncjs), t119)))
      let t120 = @drule.mk_exists_rule(x_2, th1)
      let th2 = @equal.conv_rule(@equal.rand_conv(push_exists_conv), t120)
      let (t1, t2) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th2)))
      @kernel.trans(th2, @equal.ap_term(t1, qfn_conv(vars_1)(t2)))
    }
  }
}

///|
/// QELIM_DLO_CONV
fn step_41() -> Unit raise {
  let t126 = @simp.rewrite_conv(@list.List([]))
  qelim_dlo_conv_c.set(@equal.thenc(lift_qelim_conv(afn_dlo_conv, @equal.thenc(cnnf_conv(lfn_dlo_conv), @canon.dnf_conv), fn(x124 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let v = x124
    dlobasic_conv
  }), t126))
}

///|
let qelim_dlo_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QELIM_DLO_CONV")

///|
/// `QELIM_DLO_CONV`
pub fn qelim_dlo_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (qelim_dlo_conv_c.get())(x)
}

///|
/// tests
fn step_42() -> Unit raise {
  let t127 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y || x < y")
  let t128 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y || x > y")
  let t129 = @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∃ x : Real, !(x == a) || !(x == b) || a == b")
  let t130 = @term_syntax.parse_term("∀ x : Real, x < (a : Real) → x <= (b : Real)")
  let t131 = @term_syntax.parse_term("∀ x : Real, x < (a : Real) → x < (b : Real)")
  let t132 = @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (∀ x : Real, x < a → x < b) == (a <= b)")
  let t133 = @term_syntax.parse_term("∃ z : Real, z < (x : Real) && x < (y : Real)")
  let t134 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y")
  let t135 = @term_syntax.parse_term("∀ y : Real, (x : Real) < y && y < (z : Real) → (w : Real) < z")
  let t136 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∃ u : Real, u < x && u < y && u < z")
  let t137 = @term_syntax.parse_term("∃ z : Real, (x : Real) < z && z <= (y : Real)")
  let t138 = @term_syntax.parse_term("∃ z : Real, (x : Real) <= z && z <= (y : Real)")
  let t139 = @term_syntax.parse_term("∃ z : Real, (x : Real) < z && z < (y : Real)")
  let t140 = @term_syntax.parse_term("∃ x : _, x == x && x == (y : _)")
  let t141 = @term_syntax.parse_term("∃ x : Real, x == x")
  let t142 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x == y) → (∃ u : Real, u < x && (y < u || x < y))")
  let t143 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → (∃ z : Real, x < z && z < y)")
  let t144 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∃ z : Real, z < x && z < y")
  let t145 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∃ z : Real, z < x && x < y")
  let t146 = @term_syntax.parse_term("∃ x : Real, ∃ y : Real, x < y && y < x")
  let t147 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y || x == y || y < x")
  let t148 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y || x == y || y < x")
  let t149 = @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x < y && y < z → x < z")
  let t150 = @term_syntax.parse_term("∀ x : Real, ∃ y : Real, x < y")
  let t151 = @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (∀ x : Real, (x < a) == (x < b)) == (a == b)")
  let t152 = @term_syntax.parse_term("∀ x : Real, x < (a : Real) → x < (b : Real)")
  let t153 = @term_syntax.parse_term("∃ z : Real, (x : Real) < z && z < (y : Real)")
  let t154 = @term_syntax.parse_term("∃ z : Real, (x : Real) < x && z < (y : Real)")
  tests_c.set(@list.List([@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∃ z : Real, z < x && z < y"), t154, t153, t152, t151, t150, t149, t148, t147, t146, t145, t144, t143, t142, t141, t140, t139, t138, t137, t136, t135, t134, t133, t132, t131, t130, t129, t128, t127]))
}

///|
let tests_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("tests")

///|
/// `tests`
pub fn tests() -> @list.List[@kernel.Term] {
  tests_c.get()
}

///|
/// Examples/dlo.ml:455
fn step_43() -> Unit raise {
  ignore(@lib.map((x155 : @kernel.Term) => @lib.time(qelim_dlo_conv, x155), tests()))
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
}
