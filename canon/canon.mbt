// Translated from upstream canon.ml; edit this file directly.

///|
/// PRESIMP_CONV
fn step_1() -> Unit raise {
  presimp_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x1 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2 = @equal.top_depth_conv(x1)
        fn(x3 : @kernel.Term) -> @kernel.Thm raise { s2(x3) }
      },
      @list.List([
        @class.not_clauses(),
        @theorems.and_clauses(),
        @theorems.or_clauses(),
        @theorems.imp_clauses(),
        @theorems.eq_clauses(),
        @theorems.forall_simp(),
        @theorems.exists_simp(),
        @theorems.exists_or_thm(),
        @theorems.forall_and_thm(),
        @theorems.left_exists_and_thm(),
        @theorems.right_exists_and_thm(),
        @class.left_forall_or_thm(),
        @class.right_forall_or_thm(),
      ]),
    ),
  )
}

///|
let presimp_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("PRESIMP_CONV")

///|
/// `PRESIMP_CONV`
pub fn presimp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  presimp_conv_c.get()(x)
}

///|
/// CONJ_ACI_RULE
fn step_2() -> Unit raise {
  let mk_fun = (x4 : @kernel.Thm, x5 : @lib.Func[@kernel.Term, @kernel.Thm]) => {
    mk_fun_l(x4, x5)
  }
  let use_fun = (x6 : @lib.Func[@kernel.Term, @kernel.Thm], x7 : @kernel.Term) => {
    use_fun_l(x6, x7)
  }
  conj_aci_rule_c.set(fn(x9 : @kernel.Term) -> @kernel.Thm raise {
    let fm = x9
    let (p, p_p) = @kernel.dest_eq(fm)
    if p == p_p {
      @kernel.refl(p)
    } else {
      let th_1 = use_fun(mk_fun(@kernel.assume_rule(p), @lib.undefined()), p_p)
      let th_p = use_fun(mk_fun(@kernel.assume_rule(p_p), @lib.undefined()), p)
      let t10 = @bool.disch_all(th_p)
      @bool.imp_antisym_rule(@bool.disch_all(th_1), t10)
    }
  })
}

///|
let conj_aci_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "CONJ_ACI_RULE",
)

///|
/// `CONJ_ACI_RULE`
pub fn conj_aci_rule(x : @kernel.Term) -> @kernel.Thm raise {
  conj_aci_rule_c.get()(x)
}

///|
fn mk_fun_l(
  x4 : @kernel.Thm,
  x5 : @lib.Func[@kernel.Term, @kernel.Thm],
) -> @lib.Func[@kernel.Term, @kernel.Thm] raise {
  let mk_fun = (x4 : @kernel.Thm, x5 : @lib.Func[@kernel.Term, @kernel.Thm]) => {
    mk_fun_l(x4, x5)
  }
  let th = x4
  let fn_ = x5
  let tm = @kernel.concl(th)
  if @basics.is_conj(tm) {
    let (th1, th2) = @bool.conj_pair(th)
    mk_fun(th1, mk_fun(th2, fn_))
  } else {
    @lib.update(tm, th, fn_)
  }
}

///|
fn use_fun_l(
  x6 : @lib.Func[@kernel.Term, @kernel.Thm],
  x7 : @kernel.Term,
) -> @kernel.Thm raise {
  let use_fun = (x6 : @lib.Func[@kernel.Term, @kernel.Thm], x7 : @kernel.Term) => {
    use_fun_l(x6, x7)
  }
  let fn__1 = x6
  let tm_1 = x7
  if @basics.is_conj(tm_1) {
    let (l, r) = @basics.dest_conj(tm_1)
    let t8 = use_fun(fn__1, r)
    @bool.conj(use_fun(fn__1, l), t8)
  } else {
    @lib.apply(fn__1, tm_1)
  }
}

///|
/// DISJ_ACI_RULE
fn step_3() -> Unit raise {
  let pth_left = @bool.undisch(
    @class.taut(@term_syntax.parse_term("!((a : Bool) || (b : Bool)) → !a")),
  )
  let pth_right = @bool.undisch(
    @class.taut(@term_syntax.parse_term("!((a : Bool) || (b : Bool)) → !b")),
  )
  let pth = @lib.repeat(
    @bool.undisch,
    @class.taut(@term_syntax.parse_term("!(a : Bool) → !(b : Bool) → !(a || b)")),
  )
  let pth_neg = @bool.undisch(
    @class.taut(@term_syntax.parse_term("!(a : Bool) == !(b : Bool) → a == b")),
  )
  let a_tm = @term_syntax.parse_term("(a : Bool)")
  let b_tm = @term_syntax.parse_term("(b : Bool)")
  let not_disj_pair : (@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise = fn(
    x11 : @kernel.Thm,
  ) -> (@kernel.Thm, @kernel.Thm) raise {
    let th = x11
    let (p, q) = @basics.dest_disj(@kernel.rand(@kernel.concl(th)))
    let ilist = @list.List([(p, a_tm), (q, b_tm)])
    let t12 = @bool.prove_hyp(th, @kernel.inst_rule(ilist, pth_right))
    (@bool.prove_hyp(th, @kernel.inst_rule(ilist, pth_left)), t12)
  }
  let not_disj : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x13 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1 = x13
    fn(x14 : @kernel.Thm) -> @kernel.Thm raise {
      let th2 = x14
      let t15 = (@kernel.rand(@kernel.concl(th2)), b_tm)
      let th3 = @kernel.inst_rule(
        @list.List([(@kernel.rand(@kernel.concl(th1)), a_tm), t15]),
        pth,
      )
      @bool.prove_hyp(th1, @bool.prove_hyp(th2, th3))
    }
  }
  let mk_fun = (x16 : @kernel.Thm, x17 : @lib.Func[@kernel.Term, @kernel.Thm]) => {
    mk_fun_l_1(not_disj_pair, not_disj, x16, x17)
  }
  let use_fun = (x18 : @lib.Func[@kernel.Term, @kernel.Thm], x19 : @kernel.Term) => {
    use_fun_l_1(not_disj_pair, not_disj, x18, x19)
  }
  disj_aci_rule_c.set(fn(x21 : @kernel.Term) -> @kernel.Thm raise {
    let fm = x21
    let (p_1, p_p) = @kernel.dest_eq(fm)
    if p_1 == p_p {
      @kernel.refl(p_1)
    } else {
      let th_2 = use_fun(
        mk_fun(@kernel.assume_rule(@bool.mk_neg(p_1)), @lib.undefined()),
        p_p,
      )
      let th_p = use_fun(
        mk_fun(@kernel.assume_rule(@bool.mk_neg(p_p)), @lib.undefined()),
        p_1,
      )
      let t22 = @bool.disch_all(th_p)
      let th1_2 = @bool.imp_antisym_rule(@bool.disch_all(th_2), t22)
      @bool.prove_hyp(
        th1_2,
        @kernel.inst_rule(@list.List([(p_1, a_tm), (p_p, b_tm)]), pth_neg),
      )
    }
  })
}

///|
let disj_aci_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "DISJ_ACI_RULE",
)

///|
/// `DISJ_ACI_RULE`
pub fn disj_aci_rule(x : @kernel.Term) -> @kernel.Thm raise {
  disj_aci_rule_c.get()(x)
}

///|
fn mk_fun_l_1(
  not_disj_pair : (@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise,
  not_disj : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
  x16 : @kernel.Thm,
  x17 : @lib.Func[@kernel.Term, @kernel.Thm],
) -> @lib.Func[@kernel.Term, @kernel.Thm] raise {
  let mk_fun = (x16 : @kernel.Thm, x17 : @lib.Func[@kernel.Term, @kernel.Thm]) => {
    mk_fun_l_1(not_disj_pair, not_disj, x16, x17)
  }
  let th_1 = x16
  let fn_ = x17
  let tm = @kernel.rand(@kernel.concl(th_1))
  if @basics.is_disj(tm) {
    let (th1_1, th2_1) = not_disj_pair(th_1)
    mk_fun(th1_1, mk_fun(th2_1, fn_))
  } else {
    @lib.update(tm, th_1, fn_)
  }
}

///|
fn use_fun_l_1(
  not_disj_pair : (@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise,
  not_disj : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
  x18 : @lib.Func[@kernel.Term, @kernel.Thm],
  x19 : @kernel.Term,
) -> @kernel.Thm raise {
  let use_fun = (x18 : @lib.Func[@kernel.Term, @kernel.Thm], x19 : @kernel.Term) => {
    use_fun_l_1(not_disj_pair, not_disj, x18, x19)
  }
  let fn__1 = x18
  let tm_1 = x19
  if @basics.is_disj(tm_1) {
    let (l, r) = @basics.dest_disj(tm_1)
    let t20 = use_fun(fn__1, r)
    not_disj(use_fun(fn__1, l))(t20)
  } else {
    @lib.apply(fn__1, tm_1)
  }
}

///|
/// `CONJ_CANON_CONV`
pub fn conj_canon_conv(x23 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x23
  let tm_p = @bool.list_mk_conj(@lib.setify(@basics.conjuncts(tm)))
  conj_aci_rule(@basics.mk_eq(tm, tm_p))
}

///|
/// `DISJ_CANON_CONV`
pub fn disj_canon_conv(x24 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x24
  let tm_p = @bool.list_mk_disj(@lib.setify(@basics.disjuncts(tm)))
  disj_aci_rule(@basics.mk_eq(tm, tm_p))
}

///|
/// GEN_NNF_CONV
fn step_4() -> Unit raise {
  let and_tm = @term_syntax.parse_term("op_slash_bslash")
  let or_tm = @term_syntax.parse_term("op_bslash_slash")
  let not_tm = @term_syntax.parse_term("op_tilde")
  let pth_not_not = @class.taut(@term_syntax.parse_term("!!(p : Bool) == p"))
  let pth_not_and = @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (!p || !q)"))
  let pth_not_or = @class.taut(@term_syntax.parse_term("!((p : Bool) || (q : Bool)) == (!p && !q)"))
  let pth_imp = @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (!p || q)"))
  let pth_not_imp = @class.taut(@term_syntax.parse_term("!((p : Bool) → (q : Bool)) == (p && !q)"))
  let pth_eq = @class.taut(
    @term_syntax.parse_term("((p : Bool) == (q : Bool)) == (p && q || !p && !q)"),
  )
  let pth_not_eq = @class.taut(
    @term_syntax.parse_term("!((p : Bool) == (q : Bool)) == (p && !q || !p && q)"),
  )
  let pth_eq_p = @class.taut(
    @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p || !q) && (!p || q))"),
  )
  let pth_not_eq_p = @class.taut(
    @term_syntax.parse_term("!((p : Bool) == (q : Bool)) == ((p || q) && (!p || !q))"),
  )
  let t36 = @simp.rewrite_tac(
    @list.List([@theorems.conj_assoc(), @theorems.eq_sym_eq()]),
  )
  let t35 = @simp.rewrite_tac(
    @list.List([
      @class.not_exists_thm(),
      @class.not_forall_thm(),
      @bool.exists_unique_def(),
      @class.de_morgan_thm(),
      @class.not_imp(),
    ]),
  )
  let t34 = @simp.gen_rewrite_tac(
    fn(
      x33 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x26 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s27 = @equal.land_conv(x26)
        fn(x28 : @kernel.Term) -> @kernel.Thm raise { s27(x28) }
      })(
        ((x32 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            2,
            fn(
              x29 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s30 = @equal.rand_conv(x29)
              fn(x31 : @kernel.Term) -> @kernel.Thm raise { s30(x31) }
            },
            x32,
          )
        })(x33),
      )
    },
    @list.List([@equal.gsym(@class.eta_ax())]),
  )
  let t37 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t34),
      t35,
    ),
    t36,
  )
  let t38 = (
    @term_syntax.parse_term("!forall((P : (A) -> Bool)) == (∃ x : A, !P(x)) && !op_q(P) == (∀ x : A, !P(x)) && !existsunique(P) == ((∀ x : A, !P(x)) || (∃ x : A, ∃ y : A, P(x) && P(y) && !(y == x)))"),
    t37,
  )
  gen_nnf_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x25 : (
            @kernel.Term,
            ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise,
          ),
        ) -> @kernel.Thm raise {
          @tactics.prove(x25.0, x25.1)
        })(t38),
      ) {
      More(
        pth_not_forall,
        tail=More(pth_not_exists, tail=More(pth_not_exu, tail=Empty))
      ) => {
        let t47 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
        let t46 = @simp.rewrite_tac(
          @list.List([
            @bool.exists_unique_def(),
            @class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (!a || !b || c)")),
          ]),
        )
        let t48 = @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x45 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                (fn(
                  x39 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s40 = @equal.land_conv(x39)
                  fn(x41 : @kernel.Term) -> @kernel.Thm raise { s40(x41) }
                })(
                  (fn(
                    x42 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s43 = @equal.rand_conv(x42)
                    fn(x44 : @kernel.Term) -> @kernel.Thm raise { s43(x44) }
                  })(x45),
                )
              },
              @list.List([@equal.gsym(@class.eta_ax())]),
            ),
            t46,
          ),
          t47,
        )
        let pth_exu = @tactics.prove(
          @term_syntax.parse_term("existsunique((P : (A) -> Bool)) == ((∃ x : A, P(x)) && (∀ x : A, ∀ y : A, !P(x) || !P(y) || y == x))"),
          t48,
        )
        let p_tm = @term_syntax.parse_term("(p : Bool)")
        let q_tm = @term_syntax.parse_term("(q : Bool)")
        fn nnf_dconv(
          x49 : Bool,
          x50 : (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
          x51 : @kernel.Term,
        ) -> (@kernel.Thm, @kernel.Thm) raise {
          let cf = x49
          let baseconvs = x50
          let tm = x51
          match tm {
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("/\\", _), l),
              r
            ) => {
              let (th_lp, th_ln) = nnf_dconv(cf, baseconvs, l)
              let (th_rp, th_rn) = nnf_dconv(cf, baseconvs, r)
              let t52 = @kernel.mk_comb_rule(
                @equal.ap_term(or_tm, th_ln),
                th_rn,
              )
              let t53 = @kernel.trans(
                @kernel.inst_rule(
                  @list.List([(l, p_tm), (r, q_tm)]),
                  pth_not_and,
                ),
                t52,
              )
              (@kernel.mk_comb_rule(@equal.ap_term(and_tm, th_lp), th_rp), t53)
            }
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("\\/", _), l_1),
              r_1
            ) => {
              let (th_lp_1, th_ln_1) = nnf_dconv(cf, baseconvs, l_1)
              let (th_rp_1, th_rn_1) = nnf_dconv(cf, baseconvs, r_1)
              let t54 = @kernel.mk_comb_rule(
                @equal.ap_term(and_tm, th_ln_1),
                th_rn_1,
              )
              let t55 = @kernel.trans(
                @kernel.inst_rule(
                  @list.List([(l_1, p_tm), (r_1, q_tm)]),
                  pth_not_or,
                ),
                t54,
              )
              (
                @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_lp_1), th_rp_1),
                t55,
              )
            }
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("==>", _), l_2),
              r_2
            ) => {
              let (th_lp_2, th_ln_2) = nnf_dconv(cf, baseconvs, l_2)
              let (th_rp_2, th_rn_2) = nnf_dconv(cf, baseconvs, r_2)
              let t57 = @kernel.mk_comb_rule(
                @equal.ap_term(and_tm, th_lp_2),
                th_rn_2,
              )
              let t58 = @kernel.trans(
                @kernel.inst_rule(
                  @list.List([(l_2, p_tm), (r_2, q_tm)]),
                  pth_not_imp,
                ),
                t57,
              )
              let t56 = @kernel.mk_comb_rule(
                @equal.ap_term(or_tm, th_ln_2),
                th_rp_2,
              )
              (
                @kernel.trans(
                  @kernel.inst_rule(
                    @list.List([(l_2, p_tm), (r_2, q_tm)]),
                    pth_imp,
                  ),
                  t56,
                ),
                t58,
              )
            }
            @kernel.Term::Comb(
              @kernel.Term::Comb(
                @kernel.Term::Const(
                  "=",
                  @kernel.HolType::Tyapp(
                    "fun",
                    More(@kernel.HolType::Tyapp("bool", _), tail=_)
                  )
                ),
                l_3
              ),
              r_3
            ) => {
              let (th_lp_3, th_ln_3) = nnf_dconv(cf, baseconvs, l_3)
              let (th_rp_3, th_rn_3) = nnf_dconv(cf, baseconvs, r_3)
              if cf {
                let t61 = @kernel.mk_comb_rule(
                  @equal.ap_term(or_tm, th_ln_3),
                  th_rn_3,
                )
                let t62 = @kernel.mk_comb_rule(
                  @equal.ap_term(
                    and_tm,
                    @kernel.mk_comb_rule(
                      @equal.ap_term(or_tm, th_lp_3),
                      th_rp_3,
                    ),
                  ),
                  t61,
                )
                let t63 = @kernel.trans(
                  @kernel.inst_rule(
                    @list.List([(l_3, p_tm), (r_3, q_tm)]),
                    pth_not_eq_p,
                  ),
                  t62,
                )
                let t59 = @kernel.mk_comb_rule(
                  @equal.ap_term(or_tm, th_ln_3),
                  th_rp_3,
                )
                let t60 = @kernel.mk_comb_rule(
                  @equal.ap_term(
                    and_tm,
                    @kernel.mk_comb_rule(
                      @equal.ap_term(or_tm, th_lp_3),
                      th_rn_3,
                    ),
                  ),
                  t59,
                )
                (
                  @kernel.trans(
                    @kernel.inst_rule(
                      @list.List([(l_3, p_tm), (r_3, q_tm)]),
                      pth_eq_p,
                    ),
                    t60,
                  ),
                  t63,
                )
              } else {
                let t66 = @kernel.mk_comb_rule(
                  @equal.ap_term(and_tm, th_ln_3),
                  th_rp_3,
                )
                let t67 = @kernel.mk_comb_rule(
                  @equal.ap_term(
                    or_tm,
                    @kernel.mk_comb_rule(
                      @equal.ap_term(and_tm, th_lp_3),
                      th_rn_3,
                    ),
                  ),
                  t66,
                )
                let t68 = @kernel.trans(
                  @kernel.inst_rule(
                    @list.List([(l_3, p_tm), (r_3, q_tm)]),
                    pth_not_eq,
                  ),
                  t67,
                )
                let t64 = @kernel.mk_comb_rule(
                  @equal.ap_term(and_tm, th_ln_3),
                  th_rn_3,
                )
                let t65 = @kernel.mk_comb_rule(
                  @equal.ap_term(
                    or_tm,
                    @kernel.mk_comb_rule(
                      @equal.ap_term(and_tm, th_lp_3),
                      th_rp_3,
                    ),
                  ),
                  t64,
                )
                (
                  @kernel.trans(
                    @kernel.inst_rule(
                      @list.List([(l_3, p_tm), (r_3, q_tm)]),
                      pth_eq,
                    ),
                    t65,
                  ),
                  t68,
                )
              }
            }
            @kernel.Term::Comb(
              @kernel.Term::Const(
                "forall",
                @kernel.HolType::Tyapp(
                  "fun",
                  More(@kernel.HolType::Tyapp("fun", More(ty, tail=_)), tail=_)
                )
              ) as q,
              @kernel.Term::Abs(x, t) as bod
            ) => {
              let (th_p, th_n) = nnf_dconv(true, baseconvs, t)
              let t69 = @kernel.inst_type(
                @list.List([(ty, @kernel.aty)]),
                pth_not_forall,
              )
              let th1 = @kernel.inst_rule(
                @list.List([
                  (
                    bod,
                    @kernel.mk_var("P", @basics.mk_fun_ty(ty, @kernel.bool_ty)),
                  ),
                ]),
                t69,
              )
              let th2 = @kernel.trans(
                @equal.ap_term(not_tm, @kernel.beta(@kernel.mk_comb(bod, x))),
                th_n,
              )
              let t70 = @kernel.trans(th1, @drule.mk_exists_rule(x, th2))
              (@equal.ap_term(q, @kernel.abs_rule(x, th_p)), t70)
            }
            @kernel.Term::Comb(
              @kernel.Term::Const(
                "?",
                @kernel.HolType::Tyapp(
                  "fun",
                  More(
                    @kernel.HolType::Tyapp("fun", More(ty_1, tail=_)),
                    tail=_
                  )
                )
              ) as q_1,
              @kernel.Term::Abs(x_1, t_1) as bod_1
            ) => {
              let (th_p_1, th_n_1) = nnf_dconv(cf, baseconvs, t_1)
              let t71 = @kernel.inst_type(
                @list.List([(ty_1, @kernel.aty)]),
                pth_not_exists,
              )
              let th1_1 = @kernel.inst_rule(
                @list.List([
                  (
                    bod_1,
                    @kernel.mk_var(
                      "P",
                      @basics.mk_fun_ty(ty_1, @kernel.bool_ty),
                    ),
                  ),
                ]),
                t71,
              )
              let th2_1 = @kernel.trans(
                @equal.ap_term(
                  not_tm,
                  @kernel.beta(@kernel.mk_comb(bod_1, x_1)),
                ),
                th_n_1,
              )
              let t72 = @kernel.trans(th1_1, @drule.mk_forall_rule(x_1, th2_1))
              (@equal.ap_term(q_1, @kernel.abs_rule(x_1, th_p_1)), t72)
            }
            @kernel.Term::Comb(
              @kernel.Term::Const(
                "?!",
                @kernel.HolType::Tyapp(
                  "fun",
                  More(
                    @kernel.HolType::Tyapp("fun", More(ty_2, tail=_)),
                    tail=_
                  )
                )
              ),
              @kernel.Term::Abs(x_2, t_2) as bod_2
            ) => {
              let y = @kernel.variant(@kernel.frees(t_2).prepend(x_2), x_2)
              let (th_p_2, th_n_2) = nnf_dconv(cf, baseconvs, t_2)
              let eq = @basics.mk_eq(y, x_2)
              let (eth_p, eth_n) = baseconvs(eq)
              let bth = @kernel.beta(@kernel.mk_comb(bod_2, x_2))
              let bth_p = @equal.beta_conv(@kernel.mk_comb(bod_2, y))
              let th_p_p = @kernel.inst_rule(@list.List([(y, x_2)]), th_p_2)
              let th_n_p = @kernel.inst_rule(@list.List([(y, x_2)]), th_n_2)
              let t73 = @kernel.inst_type(
                @list.List([(ty_2, @kernel.aty)]),
                pth_exu,
              )
              let th1_2 = @kernel.inst_rule(
                @list.List([
                  (
                    bod_2,
                    @kernel.mk_var(
                      "P",
                      @basics.mk_fun_ty(ty_2, @kernel.bool_ty),
                    ),
                  ),
                ]),
                t73,
              )
              let t74 = @kernel.inst_type(
                @list.List([(ty_2, @kernel.aty)]),
                pth_not_exu,
              )
              let th1_p = @kernel.inst_rule(
                @list.List([
                  (
                    bod_2,
                    @kernel.mk_var(
                      "P",
                      @basics.mk_fun_ty(ty_2, @kernel.bool_ty),
                    ),
                  ),
                ]),
                t74,
              )
              let t75 = @kernel.mk_comb_rule(
                @equal.ap_term(
                  or_tm,
                  @kernel.trans(@equal.ap_term(not_tm, bth_p), th_n_p),
                ),
                eth_p,
              )
              let t76 = @drule.mk_forall_rule(
                x_2,
                @drule.mk_forall_rule(
                  y,
                  @kernel.mk_comb_rule(
                    @equal.ap_term(
                      or_tm,
                      @kernel.trans(@equal.ap_term(not_tm, bth), th_n_2),
                    ),
                    t75,
                  ),
                ),
              )
              let th2_2 = @kernel.mk_comb_rule(
                @equal.ap_term(
                  and_tm,
                  @drule.mk_exists_rule(x_2, @kernel.trans(bth, th_p_2)),
                ),
                t76,
              )
              let t77 = @kernel.mk_comb_rule(
                @equal.ap_term(and_tm, @kernel.trans(bth_p, th_p_p)),
                eth_n,
              )
              let t78 = @drule.mk_exists_rule(
                x_2,
                @drule.mk_exists_rule(
                  y,
                  @kernel.mk_comb_rule(
                    @equal.ap_term(and_tm, @kernel.trans(bth, th_p_2)),
                    t77,
                  ),
                ),
              )
              let th2_p = @kernel.mk_comb_rule(
                @equal.ap_term(
                  or_tm,
                  @drule.mk_forall_rule(
                    x_2,
                    @kernel.trans(@equal.ap_term(not_tm, bth), th_n_2),
                  ),
                ),
                t78,
              )
              let t79 = @kernel.trans(th1_p, th2_p)
              (@kernel.trans(th1_2, th2_2), t79)
            }
            @kernel.Term::Comb(@kernel.Term::Const("~", _), t_3) => {
              let (th1_3, th2_3) = nnf_dconv(cf, baseconvs, t_3)
              (
                th2_3,
                @kernel.trans(
                  @kernel.inst_rule(@list.List([(t_3, p_tm)]), pth_not_not),
                  th1_3,
                ),
              )
            }
            _ =>
              baseconvs(tm) catch {
                Failure(_) => {
                  let t80 = @kernel.refl(@bool.mk_neg(tm))
                  (@kernel.refl(tm), t80)
                }
                e => raise e
              }
          }
        }
        let nnf_conv = (
          x81 : Bool,
          x82 : (
            (@kernel.Term) -> @kernel.Thm raise,
            (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
          ),
          x83 : @kernel.Term,
        ) => {
          nnf_conv_l(
            and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu,
            not_tm, pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq,
            pth_not_forall, pth_not_exists, pth_not_exu, pth_not_not, x81, x82, x83,
          )
        }
        let nnf_conv_p = (
          x92 : Bool,
          x93 : (
            (@kernel.Term) -> @kernel.Thm raise,
            (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
          ),
          x94 : @kernel.Term,
        ) => {
          nnf_conv_p_l(
            and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu,
            not_tm, pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq,
            pth_not_forall, pth_not_exists, pth_not_exu, pth_not_not, x92, x93, x94,
          )
        }
        fn(
          x107 : Bool,
        ) -> ((
          (
            (@kernel.Term) -> @kernel.Thm raise,
            (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
          ),
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
          fn(
            x108 : (
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
            ),
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x109 : @kernel.Term) -> @kernel.Thm raise {
              nnf_conv(x107, x108, x109)
            }
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:117")
    },
  )
}

///|
let gen_nnf_conv_c : @lib.Cell[
  (Bool) -> (((@equal.Conv, (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise)) -> @equal.Conv raise) raise,
] = @lib.Cell::new("GEN_NNF_CONV")

///|
/// `GEN_NNF_CONV`
pub fn gen_nnf_conv(
  x : Bool,
) -> (((@equal.Conv, (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise)) -> @equal.Conv raise) raise {
  gen_nnf_conv_c.get()(x)
}

///|
fn nnf_conv_l(
  and_tm : @kernel.Term,
  or_tm : @kernel.Term,
  p_tm : @kernel.Term,
  q_tm : @kernel.Term,
  pth_imp : @kernel.Thm,
  nnf_dconv : (
    Bool,
    (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    @kernel.Term,
  ) -> (@kernel.Thm, @kernel.Thm) raise,
  pth_eq_p : @kernel.Thm,
  pth_eq : @kernel.Thm,
  pth_exu : @kernel.Thm,
  not_tm : @kernel.Term,
  pth_not_and : @kernel.Thm,
  pth_not_or : @kernel.Thm,
  pth_not_imp : @kernel.Thm,
  pth_not_eq_p : @kernel.Thm,
  pth_not_eq : @kernel.Thm,
  pth_not_forall : @kernel.Thm,
  pth_not_exists : @kernel.Thm,
  pth_not_exu : @kernel.Thm,
  pth_not_not : @kernel.Thm,
  x81 : Bool,
  x82 : (
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
  ),
  x83 : @kernel.Term,
) -> @kernel.Thm raise {
  let nnf_conv = (
    x81 : Bool,
    x82 : (
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    ),
    x83 : @kernel.Term,
  ) => {
    nnf_conv_l(
      and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu, not_tm,
      pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq, pth_not_forall,
      pth_not_exists, pth_not_exu, pth_not_not, x81, x82, x83,
    )
  }
  let nnf_conv_p = (
    x92 : Bool,
    x93 : (
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    ),
    x94 : @kernel.Term,
  ) => {
    nnf_conv_p_l(
      and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu, not_tm,
      pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq, pth_not_forall,
      pth_not_exists, pth_not_exu, pth_not_not, x92, x93, x94,
    )
  }
  let cf_1 = x81
  let (base1, base2) as baseconvs_1 = x82
  let tm_1 = x83
  match tm_1 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("/\\", _), l_4),
      r_4
    ) => {
      let th_lp_4 = nnf_conv(cf_1, baseconvs_1, l_4)
      let th_rp_4 = nnf_conv(cf_1, baseconvs_1, r_4)
      @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_lp_4), th_rp_4)
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("\\/", _), l_5),
      r_5
    ) => {
      let th_lp_5 = nnf_conv(cf_1, baseconvs_1, l_5)
      let th_rp_5 = nnf_conv(cf_1, baseconvs_1, r_5)
      @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_lp_5), th_rp_5)
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("==>", _), l_6),
      r_6
    ) => {
      let th_ln_4 = nnf_conv_p(cf_1, baseconvs_1, l_6)
      let th_rp_6 = nnf_conv(cf_1, baseconvs_1, r_6)
      let t84 = @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_ln_4), th_rp_6)
      @kernel.trans(
        @kernel.inst_rule(@list.List([(l_6, p_tm), (r_6, q_tm)]), pth_imp),
        t84,
      )
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const(
          "=",
          @kernel.HolType::Tyapp(
            "fun",
            More(@kernel.HolType::Tyapp("bool", _), tail=_)
          )
        ),
        l_7
      ),
      r_7
    ) => {
      let (th_lp_6, th_ln_5) = nnf_dconv(cf_1, base2, l_7)
      let (th_rp_7, th_rn_4) = nnf_dconv(cf_1, base2, r_7)
      if cf_1 {
        let t85 = @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_ln_5), th_rp_7)
        let t86 = @kernel.mk_comb_rule(
          @equal.ap_term(
            and_tm,
            @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_lp_6), th_rn_4),
          ),
          t85,
        )
        @kernel.trans(
          @kernel.inst_rule(@list.List([(l_7, p_tm), (r_7, q_tm)]), pth_eq_p),
          t86,
        )
      } else {
        let t87 = @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_ln_5), th_rn_4)
        let t88 = @kernel.mk_comb_rule(
          @equal.ap_term(
            or_tm,
            @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_lp_6), th_rp_7),
          ),
          t87,
        )
        @kernel.trans(
          @kernel.inst_rule(@list.List([(l_7, p_tm), (r_7, q_tm)]), pth_eq),
          t88,
        )
      }
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "forall",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_3, tail=_)), tail=_)
        )
      ) as q_2,
      @kernel.Term::Abs(x_3, t_4)
    ) => {
      let th_p_3 = nnf_conv(true, baseconvs_1, t_4)
      @equal.ap_term(q_2, @kernel.abs_rule(x_3, th_p_3))
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "?",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_4, tail=_)), tail=_)
        )
      ) as q_3,
      @kernel.Term::Abs(x_4, t_5)
    ) => {
      let th_p_4 = nnf_conv(cf_1, baseconvs_1, t_5)
      @equal.ap_term(q_3, @kernel.abs_rule(x_4, th_p_4))
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "?!",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_5, tail=_)), tail=_)
        )
      ),
      @kernel.Term::Abs(x_5, t_6) as bod_3
    ) => {
      let y_1 = @kernel.variant(@kernel.frees(t_6).prepend(x_5), x_5)
      let (th_p_5, th_n_3) = nnf_dconv(cf_1, base2, t_6)
      let eq_1 = @basics.mk_eq(y_1, x_5)
      let (eth_p_1, eth_n_1) = base2(eq_1)
      let bth_1 = @kernel.beta(@kernel.mk_comb(bod_3, x_5))
      let bth_p_1 = @equal.beta_conv(@kernel.mk_comb(bod_3, y_1))
      let th_n_p_1 = @kernel.inst_rule(@list.List([(y_1, x_5)]), th_n_3)
      let t89 = @kernel.inst_type(@list.List([(ty_5, @kernel.aty)]), pth_exu)
      let th1_4 = @kernel.inst_rule(
        @list.List([
          (bod_3, @kernel.mk_var("P", @basics.mk_fun_ty(ty_5, @kernel.bool_ty))),
        ]),
        t89,
      )
      let t90 = @kernel.mk_comb_rule(
        @equal.ap_term(
          or_tm,
          @kernel.trans(@equal.ap_term(not_tm, bth_p_1), th_n_p_1),
        ),
        eth_p_1,
      )
      let t91 = @drule.mk_forall_rule(
        x_5,
        @drule.mk_forall_rule(
          y_1,
          @kernel.mk_comb_rule(
            @equal.ap_term(
              or_tm,
              @kernel.trans(@equal.ap_term(not_tm, bth_1), th_n_3),
            ),
            t90,
          ),
        ),
      )
      let th2_4 = @kernel.mk_comb_rule(
        @equal.ap_term(
          and_tm,
          @drule.mk_exists_rule(x_5, @kernel.trans(bth_1, th_p_5)),
        ),
        t91,
      )
      @kernel.trans(th1_4, th2_4)
    }
    @kernel.Term::Comb(@kernel.Term::Const("~", _), t_7) =>
      nnf_conv_p(cf_1, baseconvs_1, t_7)
    _ =>
      base1(tm_1) catch {
        Failure(_) => @kernel.refl(tm_1)
        e => raise e
      }
  }
}

///|
fn nnf_conv_p_l(
  and_tm : @kernel.Term,
  or_tm : @kernel.Term,
  p_tm : @kernel.Term,
  q_tm : @kernel.Term,
  pth_imp : @kernel.Thm,
  nnf_dconv : (
    Bool,
    (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    @kernel.Term,
  ) -> (@kernel.Thm, @kernel.Thm) raise,
  pth_eq_p : @kernel.Thm,
  pth_eq : @kernel.Thm,
  pth_exu : @kernel.Thm,
  not_tm : @kernel.Term,
  pth_not_and : @kernel.Thm,
  pth_not_or : @kernel.Thm,
  pth_not_imp : @kernel.Thm,
  pth_not_eq_p : @kernel.Thm,
  pth_not_eq : @kernel.Thm,
  pth_not_forall : @kernel.Thm,
  pth_not_exists : @kernel.Thm,
  pth_not_exu : @kernel.Thm,
  pth_not_not : @kernel.Thm,
  x92 : Bool,
  x93 : (
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
  ),
  x94 : @kernel.Term,
) -> @kernel.Thm raise {
  let nnf_conv = (
    x81 : Bool,
    x82 : (
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    ),
    x83 : @kernel.Term,
  ) => {
    nnf_conv_l(
      and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu, not_tm,
      pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq, pth_not_forall,
      pth_not_exists, pth_not_exu, pth_not_not, x81, x82, x83,
    )
  }
  let nnf_conv_p = (
    x92 : Bool,
    x93 : (
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
    ),
    x94 : @kernel.Term,
  ) => {
    nnf_conv_p_l(
      and_tm, or_tm, p_tm, q_tm, pth_imp, nnf_dconv, pth_eq_p, pth_eq, pth_exu, not_tm,
      pth_not_and, pth_not_or, pth_not_imp, pth_not_eq_p, pth_not_eq, pth_not_forall,
      pth_not_exists, pth_not_exu, pth_not_not, x92, x93, x94,
    )
  }
  let cf_2 = x92
  let (base1_1, base2_1) as baseconvs_2 = x93
  let tm_2 = x94
  match tm_2 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("/\\", _), l_8),
      r_8
    ) => {
      let th_ln_6 = nnf_conv_p(cf_2, baseconvs_2, l_8)
      let th_rn_5 = nnf_conv_p(cf_2, baseconvs_2, r_8)
      let t95 = @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_ln_6), th_rn_5)
      @kernel.trans(
        @kernel.inst_rule(@list.List([(l_8, p_tm), (r_8, q_tm)]), pth_not_and),
        t95,
      )
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("\\/", _), l_9),
      r_9
    ) => {
      let th_ln_7 = nnf_conv_p(cf_2, baseconvs_2, l_9)
      let th_rn_6 = nnf_conv_p(cf_2, baseconvs_2, r_9)
      let t96 = @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_ln_7), th_rn_6)
      @kernel.trans(
        @kernel.inst_rule(@list.List([(l_9, p_tm), (r_9, q_tm)]), pth_not_or),
        t96,
      )
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("==>", _), l_10),
      r_10
    ) => {
      let th_lp_7 = nnf_conv(cf_2, baseconvs_2, l_10)
      let th_rn_7 = nnf_conv_p(cf_2, baseconvs_2, r_10)
      let t97 = @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_lp_7), th_rn_7)
      @kernel.trans(
        @kernel.inst_rule(@list.List([(l_10, p_tm), (r_10, q_tm)]), pth_not_imp),
        t97,
      )
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const(
          "=",
          @kernel.HolType::Tyapp(
            "fun",
            More(@kernel.HolType::Tyapp("bool", _), tail=_)
          )
        ),
        l_11
      ),
      r_11
    ) => {
      let (th_lp_8, th_ln_8) = nnf_dconv(cf_2, base2_1, l_11)
      let (th_rp_8, th_rn_8) = nnf_dconv(cf_2, base2_1, r_11)
      if cf_2 {
        let t98 = @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_ln_8), th_rn_8)
        let t99 = @kernel.mk_comb_rule(
          @equal.ap_term(
            and_tm,
            @kernel.mk_comb_rule(@equal.ap_term(or_tm, th_lp_8), th_rp_8),
          ),
          t98,
        )
        @kernel.trans(
          @kernel.inst_rule(
            @list.List([(l_11, p_tm), (r_11, q_tm)]),
            pth_not_eq_p,
          ),
          t99,
        )
      } else {
        let t100 = @kernel.mk_comb_rule(
          @equal.ap_term(and_tm, th_ln_8),
          th_rp_8,
        )
        let t101 = @kernel.mk_comb_rule(
          @equal.ap_term(
            or_tm,
            @kernel.mk_comb_rule(@equal.ap_term(and_tm, th_lp_8), th_rn_8),
          ),
          t100,
        )
        @kernel.trans(
          @kernel.inst_rule(
            @list.List([(l_11, p_tm), (r_11, q_tm)]),
            pth_not_eq,
          ),
          t101,
        )
      }
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "forall",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_6, tail=_)), tail=_)
        )
      ),
      @kernel.Term::Abs(x_6, t_8) as bod_4
    ) => {
      let th_n_4 = nnf_conv_p(cf_2, baseconvs_2, t_8)
      let t102 = @kernel.inst_type(
        @list.List([(ty_6, @kernel.aty)]),
        pth_not_forall,
      )
      let th1_5 = @kernel.inst_rule(
        @list.List([
          (bod_4, @kernel.mk_var("P", @basics.mk_fun_ty(ty_6, @kernel.bool_ty))),
        ]),
        t102,
      )
      let th2_5 = @kernel.trans(
        @equal.ap_term(not_tm, @kernel.beta(@kernel.mk_comb(bod_4, x_6))),
        th_n_4,
      )
      @kernel.trans(th1_5, @drule.mk_exists_rule(x_6, th2_5))
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "?",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_7, tail=_)), tail=_)
        )
      ),
      @kernel.Term::Abs(x_7, t_9) as bod_5
    ) => {
      let th_n_5 = nnf_conv_p(true, baseconvs_2, t_9)
      let t103 = @kernel.inst_type(
        @list.List([(ty_7, @kernel.aty)]),
        pth_not_exists,
      )
      let th1_6 = @kernel.inst_rule(
        @list.List([
          (bod_5, @kernel.mk_var("P", @basics.mk_fun_ty(ty_7, @kernel.bool_ty))),
        ]),
        t103,
      )
      let th2_6 = @kernel.trans(
        @equal.ap_term(not_tm, @kernel.beta(@kernel.mk_comb(bod_5, x_7))),
        th_n_5,
      )
      @kernel.trans(th1_6, @drule.mk_forall_rule(x_7, th2_6))
    }
    @kernel.Term::Comb(
      @kernel.Term::Const(
        "?!",
        @kernel.HolType::Tyapp(
          "fun",
          More(@kernel.HolType::Tyapp("fun", More(ty_8, tail=_)), tail=_)
        )
      ),
      @kernel.Term::Abs(x_8, t_10) as bod_6
    ) => {
      let y_2 = @kernel.variant(@kernel.frees(t_10).prepend(x_8), x_8)
      let (th_p_6, th_n_6) = nnf_dconv(cf_2, base2_1, t_10)
      let eq_2 = @basics.mk_eq(y_2, x_8)
      let (eth_p_2, eth_n_2) = base2_1(eq_2)
      let bth_2 = @kernel.beta(@kernel.mk_comb(bod_6, x_8))
      let bth_p_2 = @equal.beta_conv(@kernel.mk_comb(bod_6, y_2))
      let th_p_p_1 = @kernel.inst_rule(@list.List([(y_2, x_8)]), th_p_6)
      let t104 = @kernel.inst_type(
        @list.List([(ty_8, @kernel.aty)]),
        pth_not_exu,
      )
      let th1_p_1 = @kernel.inst_rule(
        @list.List([
          (bod_6, @kernel.mk_var("P", @basics.mk_fun_ty(ty_8, @kernel.bool_ty))),
        ]),
        t104,
      )
      let t105 = @kernel.mk_comb_rule(
        @equal.ap_term(and_tm, @kernel.trans(bth_p_2, th_p_p_1)),
        eth_n_2,
      )
      let t106 = @drule.mk_exists_rule(
        x_8,
        @drule.mk_exists_rule(
          y_2,
          @kernel.mk_comb_rule(
            @equal.ap_term(and_tm, @kernel.trans(bth_2, th_p_6)),
            t105,
          ),
        ),
      )
      let th2_p_1 = @kernel.mk_comb_rule(
        @equal.ap_term(
          or_tm,
          @drule.mk_forall_rule(
            x_8,
            @kernel.trans(@equal.ap_term(not_tm, bth_2), th_n_6),
          ),
        ),
        t106,
      )
      @kernel.trans(th1_p_1, th2_p_1)
    }
    @kernel.Term::Comb(@kernel.Term::Const("~", _), t_11) => {
      let th1_7 = nnf_conv(cf_2, baseconvs_2, t_11)
      @kernel.trans(
        @kernel.inst_rule(@list.List([(t_11, p_tm)]), pth_not_not),
        th1_7,
      )
    }
    _ => {
      let tm_p = @bool.mk_neg(tm_2)
      base1_1(tm_p) catch {
        Failure(_) => @kernel.refl(tm_p)
        e => raise e
      }
    }
  }
}

///|
/// NNF_CONV
fn step_5() -> Unit raise {
  nnf_conv_c.set(
    gen_nnf_conv(false)(
      (
        @equal.all_conv,
        fn(x110 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
          let t = x110
          let t111 = @kernel.refl(@bool.mk_neg(t))
          (@kernel.refl(t), t111)
        },
      ),
    ),
  )
}

///|
let nnf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NNF_CONV")

///|
/// `NNF_CONV`
pub fn nnf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  nnf_conv_c.get()(x)
}

///|
/// NNFC_CONV
fn step_6() -> Unit raise {
  nnfc_conv_c.set(
    gen_nnf_conv(true)(
      (
        @equal.all_conv,
        fn(x112 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
          let t = x112
          let t113 = @kernel.refl(@bool.mk_neg(t))
          (@kernel.refl(t), t113)
        },
      ),
    ),
  )
}

///|
let nnfc_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NNFC_CONV")

///|
/// `NNFC_CONV`
pub fn nnfc_conv(x : @kernel.Term) -> @kernel.Thm raise {
  nnfc_conv_c.get()(x)
}

///|
/// SKOLEM_CONV
fn step_7() -> Unit raise {
  let t120 = @simp.gen_rewrite_conv(
    fn(
      x117 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s118 = @equal.redepth_conv(x117)
      fn(x119 : @kernel.Term) -> @kernel.Thm raise { s118(x119) }
    },
    @list.List([
      @theorems.right_and_exists_thm(),
      @theorems.left_and_exists_thm(),
      @theorems.or_exists_thm(),
      @theorems.right_or_exists_thm(),
      @theorems.left_or_exists_thm(),
      @class.skolem_thm(),
    ]),
  )
  skolem_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x114 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s115 = @equal.top_depth_conv(x114)
          fn(x116 : @kernel.Term) -> @kernel.Thm raise { s115(x116) }
        },
        @list.List([
          @theorems.exists_or_thm(),
          @theorems.left_exists_and_thm(),
          @theorems.right_exists_and_thm(),
          @theorems.forall_and_thm(),
          @class.left_forall_or_thm(),
          @class.right_forall_or_thm(),
          @theorems.forall_simp(),
          @theorems.exists_simp(),
        ]),
      ),
      t120,
    ),
  )
}

///|
let skolem_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("SKOLEM_CONV")

///|
/// `SKOLEM_CONV`
pub fn skolem_conv(x : @kernel.Term) -> @kernel.Thm raise {
  skolem_conv_c.get()(x)
}

///|
/// PRENEX_CONV
fn step_8() -> Unit raise {
  prenex_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x121 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s122 = @equal.redepth_conv(x121)
        fn(x123 : @kernel.Term) -> @kernel.Thm raise { s122(x123) }
      },
      @list.List([
        @theorems.and_forall_thm(),
        @theorems.left_and_forall_thm(),
        @theorems.right_and_forall_thm(),
        @class.left_or_forall_thm(),
        @class.right_or_forall_thm(),
        @theorems.or_exists_thm(),
        @theorems.left_or_exists_thm(),
        @theorems.right_or_exists_thm(),
        @theorems.left_and_exists_thm(),
        @theorems.right_and_exists_thm(),
      ]),
    ),
  )
}

///|
let prenex_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("PRENEX_CONV")

///|
/// `PRENEX_CONV`
pub fn prenex_conv(x : @kernel.Term) -> @kernel.Thm raise {
  prenex_conv_c.get()(x)
}

///|
let weak_dnf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("WEAK_DNF_CONV")

///|
/// `WEAK_DNF_CONV`
pub fn weak_dnf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  weak_dnf_conv_c.get()(x)
}

///|
let dnf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("DNF_CONV")

///|
/// `DNF_CONV`
pub fn dnf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  dnf_conv_c.get()(x)
}

///|
/// WEAK_DNF_CONV, DNF_CONV
fn step_9() -> Unit raise {
  let pth1 = @class.taut(
    @term_syntax.parse_term("((a : Bool) && ((b : Bool) || (c : Bool))) == (a && b || a && c)"),
  )
  let pth2 = @class.taut(
    @term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"),
  )
  let a_tm = @term_syntax.parse_term("(a : Bool)")
  let b_tm = @term_syntax.parse_term("(b : Bool)")
  let c_tm = @term_syntax.parse_term("(c : Bool)")
  fn distribute(x124 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x124
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("/\\", _), a),
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("\\/", _), b),
          c
        )
      ) => {
        let th = @kernel.inst_rule(
          @list.List([(a, a_tm), (b, b_tm), (c, c_tm)]),
          pth1,
        )
        let t125 = @kernel.rand(@kernel.concl(th))
        @kernel.trans(th, @equal.binop_conv(distribute)(t125))
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(
          @kernel.Term::Const("/\\", _),
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("\\/", _), a_1),
            b_1
          )
        ),
        c_1
      ) => {
        let th_1 = @kernel.inst_rule(
          @list.List([(a_1, a_tm), (b_1, b_tm), (c_1, c_tm)]),
          pth2,
        )
        let t126 = @kernel.rand(@kernel.concl(th_1))
        @kernel.trans(th_1, @equal.binop_conv(distribute)(t126))
      }
      _ => @kernel.refl(tm)
    }
  }
  let strengthen : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.depth_binop_conv(@term_syntax.parse_term("op_bslash_slash"), conj_canon_conv),
    disj_canon_conv,
  )
  let weakdnf = (x127 : @kernel.Term) => weakdnf_l(distribute, strengthen, x127)
  let substrongdnf = (x129 : @kernel.Term) => {
    substrongdnf_l(distribute, strengthen, x129)
  }
  let strongdnf = (x131 : @kernel.Term) => {
    strongdnf_l(distribute, strengthen, x131)
  }
  let (weak_dnf_conv, dnf_conv) = (weakdnf, strongdnf)
  weak_dnf_conv_c.set(weak_dnf_conv)
  dnf_conv_c.set(dnf_conv)
}

///|
fn weakdnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x127 : @kernel.Term,
) -> @kernel.Thm raise {
  let weakdnf = (x127 : @kernel.Term) => weakdnf_l(distribute, strengthen, x127)
  let tm_1 = x127
  match tm_1 {
    @kernel.Term::Comb(@kernel.Term::Const("forall", _), @kernel.Term::Abs(_, _))
    | @kernel.Term::Comb(@kernel.Term::Const("?", _), @kernel.Term::Abs(_, _)) =>
      @equal.binder_conv(weakdnf)(tm_1)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("\\/", _), _), _) =>
      @equal.binop_conv(weakdnf)(tm_1)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("/\\", _) as op, l),
      r
    ) => {
      let t128 = weakdnf(r)
      let th_2 = @kernel.mk_comb_rule(@equal.ap_term(op, weakdnf(l)), t128)
      @kernel.trans(th_2, distribute(@kernel.rand(@kernel.concl(th_2))))
    }
    _ => @kernel.refl(tm_1)
  }
}

///|
fn substrongdnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x129 : @kernel.Term,
) -> @kernel.Thm raise {
  let substrongdnf = (x129 : @kernel.Term) => {
    substrongdnf_l(distribute, strengthen, x129)
  }
  let strongdnf = (x131 : @kernel.Term) => {
    strongdnf_l(distribute, strengthen, x131)
  }
  let tm_2 = x129
  match tm_2 {
    @kernel.Term::Comb(@kernel.Term::Const("forall", _), @kernel.Term::Abs(_, _))
    | @kernel.Term::Comb(@kernel.Term::Const("?", _), @kernel.Term::Abs(_, _)) =>
      @equal.binder_conv(strongdnf)(tm_2)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("\\/", _), _), _) =>
      @equal.binop_conv(substrongdnf)(tm_2)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("/\\", _) as op_1, l_1),
      r_1
    ) => {
      let t130 = substrongdnf(r_1)
      let th_3 = @kernel.mk_comb_rule(
        @equal.ap_term(op_1, substrongdnf(l_1)),
        t130,
      )
      @kernel.trans(th_3, distribute(@kernel.rand(@kernel.concl(th_3))))
    }
    _ => @kernel.refl(tm_2)
  }
}

///|
fn strongdnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x131 : @kernel.Term,
) -> @kernel.Thm raise {
  let substrongdnf = (x129 : @kernel.Term) => {
    substrongdnf_l(distribute, strengthen, x129)
  }
  let tm_3 = x131
  let th_4 = substrongdnf(tm_3)
  @kernel.trans(th_4, strengthen(@kernel.rand(@kernel.concl(th_4))))
}

///|
let weak_cnf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("WEAK_CNF_CONV")

///|
/// `WEAK_CNF_CONV`
pub fn weak_cnf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  weak_cnf_conv_c.get()(x)
}

///|
let cnf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("CNF_CONV")

///|
/// `CNF_CONV`
pub fn cnf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  cnf_conv_c.get()(x)
}

///|
/// WEAK_CNF_CONV, CNF_CONV
fn step_10() -> Unit raise {
  let pth1 = @class.taut(
    @term_syntax.parse_term("((a : Bool) || (b : Bool) && (c : Bool)) == ((a || b) && (a || c))"),
  )
  let pth2 = @class.taut(
    @term_syntax.parse_term("((a : Bool) && (b : Bool) || (c : Bool)) == ((a || c) && (b || c))"),
  )
  let a_tm = @term_syntax.parse_term("(a : Bool)")
  let b_tm = @term_syntax.parse_term("(b : Bool)")
  let c_tm = @term_syntax.parse_term("(c : Bool)")
  fn distribute(x132 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x132
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("\\/", _), a),
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("/\\", _), b),
          c
        )
      ) => {
        let th = @kernel.inst_rule(
          @list.List([(a, a_tm), (b, b_tm), (c, c_tm)]),
          pth1,
        )
        let t133 = @kernel.rand(@kernel.concl(th))
        @kernel.trans(th, @equal.binop_conv(distribute)(t133))
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(
          @kernel.Term::Const("\\/", _),
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("/\\", _), a_1),
            b_1
          )
        ),
        c_1
      ) => {
        let th_1 = @kernel.inst_rule(
          @list.List([(a_1, a_tm), (b_1, b_tm), (c_1, c_tm)]),
          pth2,
        )
        let t134 = @kernel.rand(@kernel.concl(th_1))
        @kernel.trans(th_1, @equal.binop_conv(distribute)(t134))
      }
      _ => @kernel.refl(tm)
    }
  }
  let strengthen : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), disj_canon_conv),
    conj_canon_conv,
  )
  let weakcnf = (x135 : @kernel.Term) => weakcnf_l(distribute, strengthen, x135)
  let substrongcnf = (x137 : @kernel.Term) => {
    substrongcnf_l(distribute, strengthen, x137)
  }
  let strongcnf = (x139 : @kernel.Term) => {
    strongcnf_l(distribute, strengthen, x139)
  }
  let (weak_cnf_conv, cnf_conv) = (weakcnf, strongcnf)
  weak_cnf_conv_c.set(weak_cnf_conv)
  cnf_conv_c.set(cnf_conv)
}

///|
fn weakcnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x135 : @kernel.Term,
) -> @kernel.Thm raise {
  let weakcnf = (x135 : @kernel.Term) => weakcnf_l(distribute, strengthen, x135)
  let tm_1 = x135
  match tm_1 {
    @kernel.Term::Comb(@kernel.Term::Const("forall", _), @kernel.Term::Abs(_, _))
    | @kernel.Term::Comb(@kernel.Term::Const("?", _), @kernel.Term::Abs(_, _)) =>
      @equal.binder_conv(weakcnf)(tm_1)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("/\\", _), _), _) =>
      @equal.binop_conv(weakcnf)(tm_1)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("\\/", _) as op, l),
      r
    ) => {
      let t136 = weakcnf(r)
      let th_2 = @kernel.mk_comb_rule(@equal.ap_term(op, weakcnf(l)), t136)
      @kernel.trans(th_2, distribute(@kernel.rand(@kernel.concl(th_2))))
    }
    _ => @kernel.refl(tm_1)
  }
}

///|
fn substrongcnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x137 : @kernel.Term,
) -> @kernel.Thm raise {
  let substrongcnf = (x137 : @kernel.Term) => {
    substrongcnf_l(distribute, strengthen, x137)
  }
  let strongcnf = (x139 : @kernel.Term) => {
    strongcnf_l(distribute, strengthen, x139)
  }
  let tm_2 = x137
  match tm_2 {
    @kernel.Term::Comb(@kernel.Term::Const("forall", _), @kernel.Term::Abs(_, _))
    | @kernel.Term::Comb(@kernel.Term::Const("?", _), @kernel.Term::Abs(_, _)) =>
      @equal.binder_conv(strongcnf)(tm_2)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("/\\", _), _), _) =>
      @equal.binop_conv(substrongcnf)(tm_2)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("\\/", _) as op_1, l_1),
      r_1
    ) => {
      let t138 = substrongcnf(r_1)
      let th_3 = @kernel.mk_comb_rule(
        @equal.ap_term(op_1, substrongcnf(l_1)),
        t138,
      )
      @kernel.trans(th_3, distribute(@kernel.rand(@kernel.concl(th_3))))
    }
    _ => @kernel.refl(tm_2)
  }
}

///|
fn strongcnf_l(
  distribute : (@kernel.Term) -> @kernel.Thm raise,
  strengthen : (@kernel.Term) -> @kernel.Thm raise,
  x139 : @kernel.Term,
) -> @kernel.Thm raise {
  let substrongcnf = (x137 : @kernel.Term) => {
    substrongcnf_l(distribute, strengthen, x137)
  }
  let tm_3 = x139
  let th_4 = substrongcnf(tm_3)
  @kernel.trans(th_4, strengthen(@kernel.rand(@kernel.concl(th_4))))
}

///|
/// `ASSOC_CONV`
pub fn assoc_conv(
  x140 : @kernel.Thm,
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let th = x140
  let th_p = @equal.sym(@bool.spec_all(th))
  let (opx, yopz) = @kernel.dest_comb(@equal.rhs(@kernel.concl(th_p)))
  let (op, x) = @kernel.dest_comb(opx)
  let y = @equal.lhand(yopz)
  let z = @kernel.rand(yopz)
  fn distrib(x142 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x142
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(
          op_p,
          @kernel.Term::Comb(@kernel.Term::Comb(op_p_p, p), q)
        ),
        r
      ) if op_p == op && op_p_p == op => {
        let th1 = @kernel.inst_rule(@list.List([(p, x), (q, y), (r, z)]), th_p)
        let (l, r_p) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th1)))
        let th2 = @equal.ap_term(l, distrib(r_p))
        let th3 = distrib(@kernel.rand(@kernel.concl(th2)))
        @kernel.trans(th1, @kernel.trans(th2, th3))
      }
      _ => @kernel.refl(tm)
    }
  }
  fn assoc(x143 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x143
    match tm_1 {
      @kernel.Term::Comb(@kernel.Term::Comb(op_p_1, p_1) as l_1, q_1) if op_p_1 ==
        op => {
        let th_1 = @equal.ap_term(l_1, assoc(q_1))
        @kernel.trans(th_1, distrib(@kernel.rand(@kernel.concl(th_1))))
      }
      _ => @kernel.refl(tm_1)
    }
  }
  assoc
}

///|
/// SELECT_ELIM_TAC
fn step_11() -> Unit raise {
  let t144 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@class.exists_thm()])),
      @tactics.beta_tac,
    ),
    @tactics.refl_tac,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(P : (A) -> Bool)(select(P)) == op_q(P)"),
    t144,
  )
  let ptm = @term_syntax.parse_term("(P : (A) -> Bool)")
  let select_elim_thm : (@kernel.Term) -> @kernel.Thm raise = fn(
    x145 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x145
    let (stm, atm) = @kernel.dest_comb(tm)
    if @kernel.is_const(stm) && @kernel.dest_const(stm).0 == "@" {
      let t146 = @bool.pinst(
        @list.List([(@kernel.type_of(@basics.bndvar(atm)), @kernel.aty)]),
        @list.List([(atm, ptm)]),
        pth,
      )
      @equal.conv_rule(@equal.land_conv(@equal.beta_conv), t146)
    } else {
      raise Failure("SELECT_ELIM_THM: not a select-term")
    }
  }
  let select_elim_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x147 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x147
    @simp.pure_rewrite_conv(
      @lib.map(select_elim_thm, @basics.find_terms(@class.is_select, tm_1)),
    )(tm_1)
  }
  let pth_1 = @bool.ispec(@term_syntax.parse_term("(P : (A) -> Bool)"), @class.select_ax())
  let ptm_1 = @term_syntax.parse_term("(P : (A) -> Bool)")
  let select_ax_thm : (@kernel.Term) -> @kernel.Thm raise = fn(
    x148 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_2 = x148
    let (stm_1, atm_1) = @kernel.dest_comb(tm_2)
    if @kernel.is_const(stm_1) && @kernel.dest_const(stm_1).0 == "@" {
      let fvs = @kernel.frees(atm_1)
      let th1 = @bool.pinst(
        @list.List([(@kernel.type_of(@basics.bndvar(atm_1)), @kernel.aty)]),
        @list.List([(atm_1, ptm_1)]),
        pth_1,
      )
      let th2 = @equal.conv_rule(
        @equal.binder_conv(@equal.binop_conv(@equal.beta_conv)),
        th1,
      )
      @bool.genl(fvs, th2)
    } else {
      raise Failure("SELECT_AX_THM: not a select-term")
    }
  }
  let select_elim_iconv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x149 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_3 = x149
    let t = @basics.find_term(@class.is_select, tm_3)
    let th1_1 = select_ax_thm(t)
    let itm = @bool.mk_imp(@kernel.concl(th1_1), tm_3)
    let th2_1 = @bool.disch_all(@bool.mp(@kernel.assume_rule(itm), th1_1))
    let fvs_1 = @kernel.frees(t)
    let fty = @lib.itlist(
      fn(x153 : @kernel.Term, x154 : @kernel.HolType) -> @kernel.HolType raise {
        (fn(
          x150 : @kernel.HolType,
        ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
          fn(x151 : @kernel.HolType) -> @kernel.HolType raise {
            @basics.mk_fun_ty(x150, x151)
          }
        })(
          (fn(x152 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x152)
          })(x153),
        )(x154)
      },
      fvs_1,
      @kernel.type_of(t),
    )
    let fn_ = @basics.genvar(fty)
    let atm_2 = @basics.list_mk_abs(fvs_1, t)
    let rawdef = @basics.mk_eq(fn_, atm_2)
    let t155 = @kernel.assume_rule(rawdef)
    let def = @bool.genl(fvs_1, @equal.sym(@ind_defs.right_betas(fvs_1)(t155)))
    let t156 = @equal.lhand(@kernel.concl(th2_1))
    let th3 = @simp.pure_rewrite_conv(@list.List([def]))(t156)
    let gtm = @bool.mk_forall(fn_, @kernel.rand(@kernel.concl(th3)))
    let t157 = @bool.spec(fn_, @kernel.assume_rule(gtm))
    let th4 = @kernel.eq_mp(@equal.sym(th3), t157)
    let th5 = @bool.imp_trans(@bool.disch(gtm, th4), th2_1)
    let t158 = @kernel.refl(atm_2)
    @bool.mp(
      @kernel.inst_rule(@list.List([(atm_2, fn_)]), @bool.disch(rawdef, th5)),
      t158,
    )
  }
  fn select_elims_iconv(x159 : @kernel.Term) -> @kernel.Thm raise {
    let tm_4 = x159
    try {
      let th = select_elim_iconv(tm_4)
      let tm_p = @equal.lhand(@kernel.concl(th))
      @bool.imp_trans(select_elims_iconv(tm_p), th)
    } catch {
      Failure(_) => @bool.disch(tm_4, @kernel.assume_rule(tm_4))
      e => raise e
    }
  }
  let select_elim_iconv_1 : (@kernel.Term) -> @kernel.Thm raise = select_elims_iconv
  select_elim_tac_c.set(
    @tactics.then_tac(@tactics.conv_tac(select_elim_conv), fn(
      x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      (fn(
        x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x160 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          @tactics.match_mp_tac(select_elim_iconv_1(x160))
        })(
          (fn(
            x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x161.1
          })(x162),
        )
      })(x163)(x163)
    }),
  )
}

///|
let select_elim_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "SELECT_ELIM_TAC",
)

///|
/// `SELECT_ELIM_TAC`
pub fn select_elim_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  select_elim_tac_c.get()(x)
}

///|
/// LAMBDA_ELIM_CONV
fn step_12() -> Unit raise {
  let t164 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("((s : (_) -> _) == ((x : _) => (t : (_) -> _)(x))) == (∀ x : _, s(x) == t(x))"),
    t164,
  )
  let half_mk_abs_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x171 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x172 : @kernel.Term) -> @kernel.Thm raise {
      ((x165, x166) => conv_l(pth, x165, x166))(x171, x172)
    }
  }
  fn find_lambda(x173 : @kernel.Term) -> @kernel.Term raise {
    let tm_1 = x173
    if @kernel.is_abs(tm_1) {
      tm_1
    } else if @kernel.is_var(tm_1) || @kernel.is_const(tm_1) {
      raise Failure("find_lambda")
    } else if @kernel.is_abs(tm_1) {
      tm_1
    } else if @basics.is_forall(tm_1) ||
      @basics.is_exists(tm_1) ||
      @basics.is_uexists(tm_1) {
      find_lambda(@basics.body(@kernel.rand(tm_1)))
    } else {
      let (l, r) = @kernel.dest_comb(tm_1)
      find_lambda(l) catch {
        Failure(_) => find_lambda(r)
        e => raise e
      }
    }
  }
  fn elim_lambda(
    x174 : (@kernel.Term) -> @kernel.Thm raise,
    x175 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let conv_1 = x174
    let tm_2 = x175
    conv_1(tm_2) catch {
      Failure(_) =>
        if @kernel.is_abs(tm_2) {
          @equal.abs_conv((x176 : @kernel.Term) => elim_lambda(conv_1, x176))(
            tm_2,
          )
        } else if @kernel.is_var(tm_2) || @kernel.is_const(tm_2) {
          @kernel.refl(tm_2)
        } else if @basics.is_forall(tm_2) ||
          @basics.is_exists(tm_2) ||
          @basics.is_uexists(tm_2) {
          @equal.binder_conv((x177 : @kernel.Term) => elim_lambda(conv_1, x177))(
            tm_2,
          )
        } else {
          @equal.comb_conv((x178 : @kernel.Term) => elim_lambda(conv_1, x178))(
            tm_2,
          )
        }
      e => raise e
    }
  }
  let t179 = @simp.simp_tac(
    @list.List([@theorems.left_forall_imp_thm(), @theorems.exists_refl()]),
  )
  let pth_1 = @tactics.prove(
    @term_syntax.parse_term("(∀ a : _, a == (c : _) → (P : Bool) == (Q : (_) -> Bool)(a)) → P == (∀ a : _, a == c → Q(a))"),
    t179,
  )
  let apply_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth_1)
  let lamb1_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x180 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_3 = x180
    let atm = find_lambda(tm_3)
    let (v, bod) = @kernel.dest_abs(atm)
    let vs_1 = @kernel.frees(atm)
    let vs_p = vs_1.concat(@list.List([v]))
    let aatm = @basics.list_mk_abs(vs_1, atm)
    let f = @basics.genvar(@kernel.type_of(aatm))
    let eq = @basics.mk_eq(f, aatm)
    let t181 = @kernel.assume_rule(eq)
    let th1 = @equal.sym(@ind_defs.right_betas(vs_1)(t181))
    let th2 = elim_lambda(
      @simp.gen_rewrite_conv(
        fn(
          x182 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x182
        },
        @list.List([th1]),
      ),
      tm_3,
    )
    let th3 = apply_pth(@bool.gen(f, @bool.disch_all(th2)))
    @equal.conv_rule(
      @equal.rand_conv(
        @equal.binder_conv(@equal.land_conv(half_mk_abs_conv(vs_p))),
      ),
      th3,
    )
  }
  fn conv_2(x183 : @kernel.Term) -> @kernel.Thm raise {
    let tm_4 = x183
    @equal.thenc(lamb1_conv, conv_2)(tm_4) catch {
      Failure(_) => @kernel.refl(tm_4)
      e => raise e
    }
  }
  lambda_elim_conv_c.set(conv_2)
}

///|
let lambda_elim_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "LAMBDA_ELIM_CONV",
)

///|
/// `LAMBDA_ELIM_CONV`
pub fn lambda_elim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  lambda_elim_conv_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] conv_l(
  pth : @kernel.Thm,
  x165 : @list.List[TA],
  x166 : @kernel.Term,
) -> @kernel.Thm raise {
  let conv = (x165 : @list.List[TA], x166 : @kernel.Term) => {
    conv_l(pth, x165, x166)
  }
  let vs = x165
  let tm = x166
  if vs == @list.List([]) {
    @kernel.refl(tm)
  } else {
    let t168 = @lib.tl(vs)
    let t170 = @equal.binder_conv((x169 : @kernel.Term) => conv(t168, x169))
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x167 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x167
        },
        @list.List([pth]),
      ),
      t170,
    )(tm)
  }
}

///|
let conds_elim_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "CONDS_ELIM_CONV",
)

///|
/// `CONDS_ELIM_CONV`
pub fn conds_elim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  conds_elim_conv_c.get()(x)
}

///|
let conds_celim_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "CONDS_CELIM_CONV",
)

///|
/// `CONDS_CELIM_CONV`
pub fn conds_celim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  conds_celim_conv_c.get()(x)
}

///|
/// CONDS_ELIM_CONV, CONDS_CELIM_CONV
fn step_13() -> Unit raise {
  let t184 = @simp.asm_rewrite_tac(@list.List([]))
  let t185 = @tactics.then_tac(
    @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")),
    t184,
  )
  let th_cond = @tactics.prove(
    @term_syntax.parse_term("((b : Bool) == false → (x : Bool) == (x0 : Bool)) && (b == true → x == (x1 : Bool)) → x == (b && x1 || !b && x0)"),
    t185,
  )
  let t186 = @simp.asm_rewrite_tac(@list.List([]))
  let t187 = @tactics.then_tac(
    @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")),
    t186,
  )
  let th_cond_p = @tactics.prove(
    @term_syntax.parse_term("((b : Bool) == false → (x : Bool) == (x0 : Bool)) && (b == true → x == (x1 : Bool)) → x == ((!b || x1) && (b || x0))"),
    t187,
  )
  let propsimps = @simp.basic_net()
  let false_tm = @term_syntax.parse_term("false")
  let true_tm = @term_syntax.parse_term("true")
  let match_th : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(th_cond)
  let match_th_p : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    th_cond_p,
  )
  let propsimp_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.depth_conv(
    @simp.rewrites_conv(propsimps),
  )
  let cnv : (@kernel.Term) -> @kernel.Thm raise = @equal.try_conv(
    @simp.rewrites_conv(propsimps),
  )
  let proptsimp_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.binop_conv(cnv),
    cnv,
  )
  fn find_conditional(
    x188 : @list.List[@kernel.Term],
    x189 : @kernel.Term,
  ) -> @kernel.Term raise {
    let fvs = x188
    let tm = x189
    match tm {
      @kernel.Term::Comb(s, t) =>
        if @class.is_cond(tm) &&
          @lib.intersect(@kernel.frees(@equal.lhand(s)), fvs) == @list.List([]) {
          tm
        } else {
          find_conditional(fvs, s) catch {
            Failure(_) => find_conditional(fvs, t)
            e => raise e
          }
        }
      @kernel.Term::Abs(x, t_1) => find_conditional(fvs.prepend(x), t_1)
      _ => raise Failure("find_conditional")
    }
  }
  fn conds_elim_conv(x190 : Bool, x191 : @kernel.Term) -> @kernel.Thm raise {
    let dfl = x190
    let tm_1 = x191
    try {
      let t_2 = find_conditional(@list.List([]), tm_1)
      let p = @equal.lhand(@kernel.rator(t_2))
      let th_new = if p == false_tm || p == true_tm {
        propsimp_conv(tm_1)
      } else {
        let asm_0 = @basics.mk_eq(p, false_tm)
        let asm_1 = @basics.mk_eq(p, true_tm)
        let simp_0 = @simp.net_of_thm(
          false,
          @kernel.assume_rule(asm_0),
          propsimps,
        )
        let simp_1 = @simp.net_of_thm(
          false,
          @kernel.assume_rule(asm_1),
          propsimps,
        )
        let th_0 = @bool.disch(
          asm_0,
          @equal.depth_conv(@simp.rewrites_conv(simp_0))(tm_1),
        )
        let th_1 = @bool.disch(
          asm_1,
          @equal.depth_conv(@simp.rewrites_conv(simp_1))(tm_1),
        )
        let th_2 = @bool.conj(th_0, th_1)
        let th_3 = if dfl { match_th(th_2) } else { match_th_p(th_2) }
        @kernel.trans(th_3, proptsimp_conv(@kernel.rand(@kernel.concl(th_3))))
      }
      @equal.conv_rule(
        @equal.rand_conv((x192 : @kernel.Term) => conds_elim_conv(dfl, x192)),
        th_new,
      )
    } catch {
      Failure(_) =>
        if @basics.is_neg(tm_1) {
          @equal.rand_conv((x193 : @kernel.Term) => conds_elim_conv(!dfl, x193))(
            tm_1,
          )
        } else if @basics.is_conj(tm_1) || @basics.is_disj(tm_1) {
          @equal.binop_conv((x194 : @kernel.Term) => conds_elim_conv(dfl, x194))(
            tm_1,
          )
        } else if @basics.is_imp(tm_1) || @bool.is_iff(tm_1) {
          @equal.comb2_conv(
            @equal.rand_conv((x195 : @kernel.Term) => {
              conds_elim_conv(!dfl, x195)
            }),
            (x196 : @kernel.Term) => conds_elim_conv(dfl, x196),
          )(tm_1)
        } else if @basics.is_forall(tm_1) {
          @equal.binder_conv((x197 : @kernel.Term) => {
            conds_elim_conv(false, x197)
          })(tm_1)
        } else if @basics.is_exists(tm_1) || @basics.is_uexists(tm_1) {
          @equal.binder_conv((x198 : @kernel.Term) => {
            conds_elim_conv(true, x198)
          })(tm_1)
        } else {
          @kernel.refl(tm_1)
        }
      e => raise e
    }
  }
  let (conds_elim_conv_1, conds_celim_conv) = (
    (x199 : @kernel.Term) => conds_elim_conv(true, x199),
    (x200 : @kernel.Term) => conds_elim_conv(false, x200),
  )
  conds_elim_conv_c.set(conds_elim_conv_1)
  conds_celim_conv_c.set(conds_celim_conv)
}

///|
/// ASM_FOL_TAC
fn step_14() -> Unit raise {
  fn get_heads(
    x201 : @list.List[@kernel.Term],
    x202 : @kernel.Term,
    x203 : (
      @list.List[(@kernel.Term, Int64)],
      @list.List[(@kernel.Term, Int64)],
    ),
  ) -> (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]) raise {
    let lconsts = x201
    let tm = x202
    let (cheads, vheads) as sofar = x203
    try {
      let (v, bod) = @basics.dest_forall(tm)
      get_heads(@lib.subtract(lconsts, @list.List([v])), bod, sofar)
    } catch {
      Failure(_) =>
        try {
          let (l, r) = @basics.dest_conj(tm) catch {
            Failure(_) => @basics.dest_disj(tm)
            e => raise e
          }
          get_heads(lconsts, l, get_heads(lconsts, r, sofar))
        } catch {
          Failure(_) =>
            try {
              let tm_p = @basics.dest_neg(tm)
              get_heads(lconsts, tm_p, sofar)
            } catch {
              Failure(_) => {
                let (hop, args) = @basics.strip_comb(tm)
                let len = Int::to_int64(@lib.length(args))
                let newheads = if @kernel.is_const(hop) ||
                  @lib.mem(hop, lconsts) {
                  (@lib.insert((hop, len), cheads), vheads)
                } else if len > 0L {
                  (cheads, @lib.insert((hop, len), vheads))
                } else {
                  sofar
                }
                @lib.itlist(
                  (
                    x204 : @kernel.Term,
                    x205 : (
                      @list.List[(@kernel.Term, Int64)],
                      @list.List[(@kernel.Term, Int64)],
                    ),
                  ) => get_heads(lconsts, x204, x205),
                  args,
                  newheads,
                )
              }
              e => raise e
            }
          e => raise e
        }
      e => raise e
    }
  }
  let get_thm_heads : (@kernel.Thm) -> ((
    (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]),
  ) -> (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]) raise) raise = fn(
    x206 : @kernel.Thm,
  ) -> (((@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)])) -> (
    @list.List[(@kernel.Term, Int64)],
    @list.List[(@kernel.Term, Int64)],
  ) raise) raise {
    let th = x206
    fn(
      x207 : (
        @list.List[(@kernel.Term, Int64)],
        @list.List[(@kernel.Term, Int64)],
      ),
    ) -> (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]) raise {
      let sofar_1 = x207
      let t208 = @kernel.concl(th)
      get_heads(@kernel.freesl(@kernel.hyp(th)), t208, sofar_1)
    }
  }
  let t209 = @simp.rewrite_tac(@list.List([@trivia.i_thm()]))
  let th_1 = @tactics.prove(
    @term_syntax.parse_term("∀ f : (A) -> B, ∀ x : A, f(x) == I(f, x)"),
    t209,
  )
  let app_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(th_1)
  fn app_n_conv(x210 : Int64, x211 : @kernel.Term) -> @kernel.Thm raise {
    let n = x210
    let tm_1 = x211
    if n == 1L {
      app_conv(tm_1)
    } else {
      let t212 = @lib.sub63(n, 1L)
      @equal.thenc(
        @equal.rator_conv((x213 : @kernel.Term) => app_n_conv(t212, x213)),
        app_conv,
      )(tm_1)
    }
  }
  fn fol_conv(
    x214 : @list.List[(@kernel.Term, Int64)],
    x215 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let hddata = x214
    let tm_2 = x215
    if @basics.is_forall(tm_2) {
      @equal.binder_conv((x216 : @kernel.Term) => fol_conv(hddata, x216))(tm_2)
    } else if @basics.is_conj(tm_2) || @basics.is_disj(tm_2) {
      @equal.binop_conv((x217 : @kernel.Term) => fol_conv(hddata, x217))(tm_2)
    } else {
      let (op, args_1) = @basics.strip_comb(tm_2)
      let t226 = @kernel.refl(op)
      let th_2 = @lib.rev_itlist(
        fn(x223 : @kernel.Thm, x224 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x221 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x222 : @kernel.Thm) -> @kernel.Thm raise {
              ((x219 : @kernel.Thm, x220 : @kernel.Thm) => {
                @lib.curry(
                  fn(x218 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                    @kernel.mk_comb_rule(x218.0, x218.1)
                  },
                  x219,
                  x220,
                )
              })(x221, x222)
            }
          })(x224)(x223)
        },
        @lib.map((x225 : @kernel.Term) => fol_conv(hddata, x225), args_1),
        t226,
      )
      let tm_p_1 = @kernel.rand(@kernel.concl(th_2))
      let n_1 = try {
        let t227 = @lib.assoc(op, hddata)
        @lib.sub63(Int::to_int64(@lib.length(args_1)), t227)
      } catch {
        Failure(_) => 0L
        e => raise e
      }
      if n_1 == 0L {
        th_2
      } else {
        @kernel.trans(th_2, app_n_conv(n_1, tm_p_1))
      }
    }
  }
  let gen_fol_conv : (
    (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x228 : (
      @list.List[(@kernel.Term, Int64)],
      @list.List[(@kernel.Term, Int64)],
    ),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let (cheads_1, vheads_1) = x228
    let hddata_1 = if vheads_1 == @list.List([]) {
      let hops = @lib.setify(
        @lib.map(
          fn(x230 : (@kernel.Term, Int64)) -> @kernel.Term raise { x230.0 },
          cheads_1,
        ),
      )
      let getmin : (@kernel.Term) -> (@kernel.Term, Int64) raise = fn(
        x231 : @kernel.Term,
      ) -> (@kernel.Term, Int64) raise {
        let h = x231
        let ns = @lib.mapfilter(
          fn(x232 : (@kernel.Term, Int64)) -> Int64 raise {
            let (k, n_2) = x232
            if k == h {
              n_2
            } else {
              @lib.failure()
            }
          },
          cheads_1,
        )
        if Int::to_int64(@lib.length(ns)) < 2L {
          @lib.failure()
        } else {
          (
            h,
            @lib.end_itlist(
              fn(x235 : Int64, x236 : Int64) -> Int64 raise {
                let s237 = (fn(x233 : Int64) -> ((Int64) -> Int64 raise) raise {
                  fn(x234 : Int64) -> Int64 raise {
                    if x233 <= x234 {
                      x233
                    } else {
                      x234
                    }
                  }
                })(x235)
                s237(x236)
              },
              ns,
            ),
          )
        }
      }
      @lib.mapfilter(getmin, hops)
    } else {
      @lib.map(
        fn(x238 : @kernel.Term) -> (@kernel.Term, Int64) raise {
          let t = x238
          if @kernel.is_const(t) && @kernel.dest_const(t).0 == "=" {
            (t, 2L)
          } else {
            (t, 0L)
          }
        },
        @lib.setify(
          @lib.map(
            fn(x239 : (@kernel.Term, Int64)) -> @kernel.Term raise { x239.0 },
            vheads_1.concat(cheads_1),
          ),
        ),
      )
    }
    (x240 : @kernel.Term) => fol_conv(hddata_1, x240)
  }
  asm_fol_tac_c.set(fn(
    x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) as gl = x241
    let headsp = @lib.itlist(
      fn(
        x243 : (String, @kernel.Thm),
        x244 : (
          @list.List[(@kernel.Term, Int64)],
          @list.List[(@kernel.Term, Int64)],
        ),
      ) -> (
        @list.List[(@kernel.Term, Int64)],
        @list.List[(@kernel.Term, Int64)],
      ) raise {
        get_thm_heads(
          (fn(x242 : (String, @kernel.Thm)) -> @kernel.Thm raise { x242.1 })(
            x243,
          ),
        )(x244)
      },
      asl,
      (@list.List([]), @list.List([])),
    )
    let t245 = gen_fol_conv(headsp)
    @tactics.rule_assum_tac((x246 : @kernel.Thm) => @equal.conv_rule(t245, x246))(
      gl,
    )
  })
}

///|
let asm_fol_tac_c : @lib.Cell[
  ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise,
] = @lib.Cell::new("ASM_FOL_TAC")

///|
/// `ASM_FOL_TAC`
pub fn asm_fol_tac(
  x : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  asm_fol_tac_c.get()(x)
}

///|
/// `PROP_ATOM_CONV`
pub fn prop_atom_conv(
  x247 : (@kernel.Term) -> @kernel.Thm raise,
  x248 : @kernel.Term,
) -> @kernel.Thm raise {
  let conv = x247
  let tm = x248
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Const("forall", _)
      | @kernel.Term::Const("?", _)
      | @kernel.Term::Const("?!", _),
      @kernel.Term::Abs(_, _)
    ) =>
      @equal.binder_conv((x249 : @kernel.Term) => prop_atom_conv(conv, x249))(
        tm,
      )
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const("/\\", _)
        | @kernel.Term::Const("\\/", _)
        | @kernel.Term::Const("==>", _)
        | @kernel.Term::Const(
          "=",
          @kernel.HolType::Tyapp(
            "fun",
            More(
              @kernel.HolType::Tyapp("bool", Empty),
              tail=More(_, tail=Empty)
            )
          )
        ),
        _
      ),
      _
    ) =>
      @equal.binop_conv((x250 : @kernel.Term) => prop_atom_conv(conv, x250))(tm)
    @kernel.Term::Comb(@kernel.Term::Const("~", _), _) =>
      @equal.rand_conv((x251 : @kernel.Term) => prop_atom_conv(conv, x251))(tm)
    _ => @equal.try_conv(conv)(tm)
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
}
