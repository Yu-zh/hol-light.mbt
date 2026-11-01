// Translated from upstream Library/word_automata.ml; edit this file directly.

///|
/// OVERAPPROXIMATE_REACHABLE
fn step_1() -> Unit raise {
  let t8 = @meson.asm_meson_tac(@list.List([]))
  let t7 = @tactics.match_mp_tac(@rstc.rtc_induct_l())
  let t5 = @meson.asm_meson_tac(@list.List([]))
  let t6 = @list.List([
    @simp.rewrite_tac(
      @list.List([@theorems.imp_conj_alt(), @theorems.right_forall_imp_thm()]),
    ),
    t5,
  ])
  let t4 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ s : S, ∀ s' : S, (init : (S) -> Bool)(s) && RTC((step : (S, S) -> Bool), s, s') → (invariant : (S) -> Bool)(s')"),
    fn(
      x1 : @kernel.Thm,
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
      let s2 = @tactics.mp_tac(x1)
      fn(
        x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2(x3)
      }
    },
  )
  let t9 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t4,
        ),
        t6,
      ),
      t7,
    ),
    t8,
  )
  overapproximate_reachable_c.set(
    @tactics.prove(
      @parser.parse_term(
        "forall init step final invariant.\n        (forall s. init s ==> invariant s) /\\\n        (forall s s'. invariant s /\\ step s s' ==> invariant s') /\\\n        (forall s. invariant s ==> final s)\n        ==> (forall s s':S. init s /\\ RTC step s s' ==> final s')",
      ),
      t9,
    ),
  )
}

///|
let overapproximate_reachable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "OVERAPPROXIMATE_REACHABLE",
)

///|
/// `OVERAPPROXIMATE_REACHABLE`
pub fn overapproximate_reachable() -> @kernel.Thm {
  overapproximate_reachable_c.get()
}

///|
/// `REACHABLE_STATE_TAC`
pub fn reachable_state_tac(
  x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let (asl, w) as gl = x10
  let (istm, ftm) = @basics.dest_imp(@basics.strip_forall(w).1)
  let (itm, stm) = @basics.dest_conj(istm)
  let pinit = @kernel.rator(itm)
  let ptrans = @equal.lhand(@kernel.rator(stm))
  let pfinal_p = @kernel.rator(ftm)
  let k = Int::to_int64(
    @lib.length(
      @lib.striplist(@pair.dest_pair, @basics.dest_gabs(@kernel.rator(itm)).0),
    ),
  )
  let t11 = " = " + @num.string_of_num(@num.pow2(@lib.int63_to_int(k)))
  let _ = @lib.remark("State space size 2^" + (Int64::to_string(k) + t11))
  match @basics.strip_gabs(ptrans) {
    (More(tup, tail=More(tup_p, tail=Empty)), trans) => {
      let (tup_p_p, init_) = @basics.dest_gabs(pinit)
      let _ = if tup != tup_p_p {
        raise Failure("inconsistent variables")
      } else {
        ()
      }
      let (tup_p_p_p, final_p) = @basics.dest_gabs(pfinal_p)
      let _ = if tup_p != tup_p_p_p {
        raise Failure("inconsistent variables")
      } else {
        ()
      }
      let vars = @lib.striplist(@pair.dest_pair, tup)
      let vars_p = @lib.striplist(@pair.dest_pair, tup_p)
      let t12 = Int::to_int64(@lib.length(vars_p))
      let vt = @bdd.mk_vtable(@lib.add63(Int::to_int64(@lib.length(vars)), t12))
      let ut = @bdd.mk_utable(())
      let ct = @bdd.mk_ctable(())
      let bddstate = (vt, ut, ct)
      let bddvars = @lib.itlist(
        fn(
          x13 : (@kernel.Term, @kernel.Term),
          x14 : @list.List[@kernel.Term],
        ) -> @list.List[@kernel.Term] raise {
          let (a, b) = x13
          let c = x14
          c.prepend(b).prepend(a)
        },
        @lib.zip(vars, vars_p),
        @list.List([]),
      )
      let t16 = @bdd.bdd_var(bddstate)
      let _ = @lib.do_list(
        fn(x17 : @kernel.Term) -> Unit raise {
          (fn(x15 : (Int64, @kernel.Thm)) -> Unit raise { ignore(x15) })(
            t16(x17),
          )
        },
        bddvars,
      )
      let bdd_trans = @bdd.bdd_of_term(@lib.undefined(), bddstate, trans)
      let bdd_init = @bdd.bdd_of_term(@lib.undefined(), bddstate, init_)
      let t18 = @lib.zip(vars_p, vars)
      let t19 = @lib.zip(vars, vars_p).concat(t18)
      let twizzle : (@kernel.Term) -> @kernel.Term raise = (x20 : @kernel.Term) => {
        @kernel.vsubst(t19, x20)
      }
      let trans_p = twizzle(trans)
      let init_p = twizzle(init_)
      let final_ = twizzle(final_p)
      let bdd_trans_p = @bdd.bdd_of_term(@lib.undefined(), bddstate, trans_p)
      let bdd_init_p = @bdd.bdd_of_term(@lib.undefined(), bddstate, init_p)
      let step : (((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (
        (Int64, @kernel.Thm),
        (Int64, @kernel.Thm),
      ) raise = fn(
        x21 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
      ) -> ((Int64, @kernel.Thm), (Int64, @kernel.Thm)) raise {
        let (pk, pk_p) = x21
        let t32 = @bdd.bdd_and_v1(bddstate)((pk, bdd_trans))
        let t28 = @bdd.bdd_exists(bddstate)
        let t33 = (
          pk_p,
          @lib.itlist(
            fn(
              x29 : @kernel.Term,
              x30 : (Int64, @kernel.Thm),
            ) -> (Int64, @kernel.Thm) raise {
              let s31 = t28(x29)
              s31(x30)
            },
            vars,
            t32,
          ),
        )
        let t34 = @bdd.bdd_or(bddstate)(t33)
        let t26 = @bdd.bdd_and_v1(bddstate)((pk_p, bdd_trans_p))
        let t22 = @bdd.bdd_exists(bddstate)
        let t27 = (
          pk,
          @lib.itlist(
            fn(
              x23 : @kernel.Term,
              x24 : (Int64, @kernel.Thm),
            ) -> (Int64, @kernel.Thm) raise {
              let s25 = t22(x23)
              s25(x24)
            },
            vars_p,
            t26,
          ),
        )
        (@bdd.bdd_or(bddstate)(t27), t34)
      }
      fn aux(
        x37 : Int64,
        x38 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
      ) -> (
        ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
        ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
      ) raise {
        let n = x37
        let p = x38
        let p_p = step(p)
        if reachedfix_l(p, p_p) {
          let t39 = " iteration" + (if n == 1L { "" } else { "s" })
          @lib.report("Fixpoint reached after " + (Int64::to_string(n) + t39))
          (p, p_p)
        } else {
          @lib.remark("No fixpoint after iteration " + Int64::to_string(n))
          aux(@lib.add63(n, 1L), p_p)
        }
      }
      let fixpoint : (((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (
        ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
        ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
      ) raise = (x40 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm))) => {
        aux(1L, x40)
      }
      let p0 = (bdd_init, bdd_init_p)
      let ((pk_1, pk_p_1), (pl, pl_p)) = fixpoint(p0)
      let bdd_final = @bdd.bdd_of_term(@lib.undefined(), bddstate, final_)
      let th_init = @bool.eqt_elim(@bdd.bdd_imp(bddstate)((bdd_init, pk_1)).1)
      let th_fix = @kernel.trans(pl.1, @equal.sym(pk_1.1))
      let th_final = @bool.eqt_elim(@bdd.bdd_imp(bddstate)((pk_1, bdd_final)).1)
      let th_init_p = @bool.genl(vars, th_init)
      let t41 = @drule.match_mp(
        @class.taut(@parser.parse_term("(p \\/ q <=> r) ==> q ==> r")),
      )(th_fix)
      let t42 = @simp.pure_once_rewrite_rule(
        @list.List([@theorems.left_imp_exists_thm()]),
      )
      let th_fix_p = @bool.genl(
        vars.concat(vars_p),
        @bool.specl(
          vars_p.concat(vars),
          @bool.genl(vars, @lib.funpow(@lib.length(vars), t42, t41)),
        ),
      )
      let th_final_1 = @bool.genl(vars, th_final)
      let vtm = @basics.mk_gabs(tup, @equal.lhand(@kernel.concl(pk_1.1)))
      let pva = @kernel.mk_var(
        "P",
        @lib.rev_itlist(
          @basics.mk_fun_ty,
          @lib.map(
            fn(x43 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x43)
            },
            vars,
          ),
          @kernel.aty,
        ),
      )
      let rth = @pair.gen_beta_conv(
        @kernel.mk_comb(
          @basics.mk_gabs(tup, @basics.list_mk_comb(pva, vars)),
          tup,
        ),
      )
      let t48 = @tactics.accept_tac(th_final_1)
      let t49 = @list.List([@tactics.accept_tac(th_fix_p), t48])
      let t47 = @list.List([@tactics.accept_tac(th_init_p), @tactics.all_tac])
      let t46 = @simp.pure_rewrite_tac(@list.List([rth]))
      let t45 = @tactics.exists_tac(vtm)
      let t44 = @simp.pure_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.match_mp_tac(overapproximate_reachable()),
                    t44,
                  ),
                  t45,
                ),
                t46,
              ),
              @tactics.conj_tac,
            ),
            t47,
          ),
          @tactics.conj_tac,
        ),
        t49,
      )(gl)
    }
    _ => raise @lib.MatchFailure("tscript.ml:44")
  }
}

///|
fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB,
  TC : Eq + @lib.OCompare + @lib.OHash,
  TD,
  TE,
  TF,
] reachedfix_l(
  x35 : ((TA, TE), (TC, TF)),
  x36 : ((TA, TB), (TC, TD)),
) -> Bool raise {
  let before = x35
  let after = x36
  let ok = before.0.0 == after.0.0
  let ok_p = before.1.0 == after.1.0
  if ok != ok_p {
    raise Failure("reachedfix: sanify check")
  } else {
    ok
  }
}

///|
/// EXPAND_SHIFT_CONV
fn step_2() -> Unit raise {
  let t50 = @simp.rewrite_tac(@list.List([@arith.add1(), @arith.add_sym()]))
  let t51 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @words.word_shl_compose(),
        @words.word_ushr_compose(),
        @words.word_ishr_compose(),
      ]),
    ),
    t50,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Word[N], ∀ n : Num, word_shl(x, SUC(n)) == word_shl(word_shl(x, 1), n)) && (∀ x : Word[N], ∀ n : Num, word_ushr(x, SUC(n)) == word_ushr(word_ushr(x, 1), n)) && (∀ x : Word[N], ∀ n : Num, word_ishr(x, SUC(n)) == word_ishr(word_ishr(x, 1), n))"),
    t51,
  )
  let baseconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x52 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x52
    },
    @list.List([
      @words.word_shl_zero(),
      @words.word_ushr_zero(),
      @words.word_ishr_zero(),
    ]),
  )
  let stepconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x53 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x53
    },
    @list.List([pth]),
  )
  fn conv(x54 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x54
    match tm {
      @kernel.Term::Comb(@kernel.Term::Comb(_, _), ntm) => {
        let n = @nums.dest_small_numeral(ntm)
        if n == 0L {
          baseconv(tm)
        } else if n == 1L {
          @kernel.refl(tm)
        } else {
          @equal.thenc(
            @equal.thenc(@equal.rand_conv(@calc_num.num_conv), stepconv),
            conv,
          )(tm)
        }
      }
      _ => raise Failure("EXPAND_SHIFT_CONV: inapplicable")
    }
  }
  expand_shift_conv_c.set(fn(x55 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x55
    match tm_1 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("word_shl", _), x),
        ntm_1
      )
      | @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("word_ushr", _), x),
        ntm_1
      )
      | @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("word_ishr", _), x),
        ntm_1
      ) =>
        if @nums.is_numeral(ntm_1) && !(@nums.dest_small_numeral(ntm_1) == 1L) {
          conv(tm_1)
        } else {
          raise Failure("EXPAND_SHIFT_CONV: inapplicable")
        }
      _ => raise Failure("EXPAND_SHIFT_CONV: inapplicable")
    }
  })
}

///|
let expand_shift_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "EXPAND_SHIFT_CONV",
)

///|
/// `EXPAND_SHIFT_CONV`
pub fn expand_shift_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_shift_conv_c.get()(x)
}

///|
/// word_shladd
fn step_3() -> Unit raise {
  word_shladd_c.set(
    @define.define_(
      @term_syntax.parse_term("(word_shladd : (Word[N], Bool) -> Word[N])((x : Word[N]), (b : Bool)) == word_or(word_shl(x, 1), word(bitval(b)))"),
    ),
  )
}

///|
let word_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("word_shladd")

///|
/// `word_shladd`
pub fn word_shladd() -> @kernel.Thm {
  word_shladd_c.get()
}

///|
/// WORD_SHLADD
fn step_4() -> Unit raise {
  let t61 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t60 = @simp.asm_rewrite_tac(
    @list.List([@words.word_and_0(), @words.word_and_1(), @words.bit_word_shl()]),
  )
  let t59 = @simp.rewrite_tac(@list.List([@words.bitval()]))
  let t58 = @tactics.match_mp_tac(@words.word_add_or())
  let t57 = @tactics.conv_tac(@equal.sym_conv)
  let t56 = @simp.rewrite_tac(@list.List([word_shladd()]))
  let t62 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t56),
              t57,
            ),
            t58,
          ),
          t59,
        ),
        @class.cond_cases_tac,
      ),
      t60,
    ),
    t61,
  )
  word_shladd_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], ∀ b : Bool, word_shladd(x, b) == word_add(word_shl(x, 1), word(bitval(b)))"),
      t62,
    ),
  )
}

///|
let word_shladd_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WORD_SHLADD")

///|
/// `WORD_SHLADD`
pub fn word_shladd_v1() -> @kernel.Thm {
  word_shladd_v1_c.get()
}

///|
/// BIT_WORD_SHLADD
fn step_5() -> Unit raise {
  let t65 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t64 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t63 = @simp.simp_tac(
    @list.List([
      @arith.add_eq_0(),
      @arith.le_1(),
      @arith.add_sub(),
      @calc_num.arith_eq(),
      @cart.dimindex_nonzero(),
    ]),
  )
  let t66 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            word_shladd(),
            @words.bit_word_or(),
            @words.bit_word_shl(),
            @words.bit_word_bitval(),
          ]),
        ),
        t63,
      ),
      t64,
    ),
    t65,
  )
  bit_word_shladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Word[N], ∀ b : Bool, (bit : (Num, Word[N]) -> Bool)(0, (word_shladd : (Word[N], Bool) -> Word[N])(x, b)) == b) && (∀ x : Word[N], ∀ b : Bool, ∀ i : Num, (bit : (Num, Word[N]) -> Bool)(i + 1, (word_shladd : (Word[N], Bool) -> Word[N])(x, b)) == (i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (bit : (Num, Word[N]) -> Bool)(i, x)))"),
      t66,
    ),
  )
}

///|
let bit_word_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BIT_WORD_SHLADD",
)

///|
/// `BIT_WORD_SHLADD`
pub fn bit_word_shladd() -> @kernel.Thm {
  bit_word_shladd_c.get()
}

///|
/// WORD_SHLADD_0
fn step_6() -> Unit raise {
  let t67 = @simp.rewrite_tac(
    @list.List([word_shladd(), @words.bitval_clauses(), @words.word_or_0()]),
  )
  word_shladd_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], word_shladd(x, false) == word_shl(x, 1)"),
      t67,
    ),
  )
}

///|
let word_shladd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WORD_SHLADD_0")

///|
/// `WORD_SHLADD_0`
pub fn word_shladd_0() -> @kernel.Thm {
  word_shladd_0_c.get()
}

///|
/// WORD_NUMERAL_SHLADD
fn step_7() -> Unit raise {
  let t70 = @tactics.conv_tac(@words.word_rule)
  let t69 = @simp.rewrite_tac(
    @list.List([
      word_shladd_v1(),
      @words.bitval_clauses(),
      @words.word_or_0(),
      @arith.add1(),
    ]),
  )
  let t68 = @simp.rewrite_tac(
    @list.List([@nums.numeral(), @arith.bit0(), @arith.bit1()]),
  )
  let t71 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t68),
      t69,
    ),
    t70,
  )
  word_numeral_shladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(word : (Num) -> Word[N])(NUMERAL(BIT0((n : Num)))) == (word_shladd : (Word[N], Bool) -> Word[N])((word : (Num) -> Word[N])(NUMERAL(n)), false) && (word : (Num) -> Word[N])(NUMERAL(BIT1(n))) == (word_shladd : (Word[N], Bool) -> Word[N])((word : (Num) -> Word[N])(NUMERAL(n)), true)"),
      t71,
    ),
  )
}

///|
let word_numeral_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WORD_NUMERAL_SHLADD",
)

///|
/// `WORD_NUMERAL_SHLADD`
pub fn word_numeral_shladd() -> @kernel.Thm {
  word_numeral_shladd_c.get()
}

///|
let word_ushr_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WORD_USHR_SHLADD",
)

///|
/// `WORD_USHR_SHLADD`
pub fn word_ushr_shladd() -> @kernel.Thm {
  word_ushr_shladd_c.get()
}

///|
let word_ishr_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WORD_ISHR_SHLADD",
)

///|
/// `WORD_ISHR_SHLADD`
pub fn word_ishr_shladd() -> @kernel.Thm {
  word_ishr_shladd_c.get()
}

///|
/// WORD_USHR_SHLADD, WORD_ISHR_SHLADD
fn step_8() -> Unit raise {
  let t94 = @meson.meson_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) < (n : Num) - 1) == (SUC(i) < n)"))]),
  )
  let t93 = @simp.simp_tac(
    @list.List([
      @nums.not_suc(),
      @arith.le_1(),
      @calc_num.arith_le(),
      @calc_num.arith_lt(),
      @arith.suc_sub1(),
      @equal.gsym(@arith.add1()),
    ]),
  )
  let t92 = @simp.gen_rewrite_tac(
    fn(
      x89 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s90 = @equal.rand_conv(x89)
      fn(x91 : @kernel.Term) -> @kernel.Thm raise { s90(x91) }
    },
    @list.List([
      @meson.meson(
        @list.List([@nums.num_cases()]),
        @term_syntax.parse_term("(∀ i : Num, (P : (Num) -> Bool)(i)) == (P(0) && (∀ i : Num, P(SUC(i))))"),
      ),
    ]),
  )
  let t88 = @tactics.thenl(
    @tactics.binop_tac,
    @list.List([
      @meson.meson_tac(
        @list.List([
          @cart.dimindex_nonzero(),
          @int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)")),
        ]),
      ),
      @tactics.all_tac,
    ]),
  )
  let t87 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t86 = @simp.simp_tac(
    @list.List([
      @arith.lt_imp_ne(),
      @class.taut(
        @term_syntax.parse_term("((p : Bool) || (q : Bool) → (r : Bool)) == ((p → r) && (q → r))"),
      ),
    ]),
  )
  let t85 = @tactics.conv_tac(
    @equal.land_conv(
      @simp.simp_conv(
        @list.List([
          @cart.dimindex_nonzero(),
          @int.arith_rule(
            @term_syntax.parse_term("!((n : Num) == 0) → ((i : Num) < n) == (i == n - 1 || i < n - 1)"),
          ),
        ]),
      ),
    ),
  )
  let t84 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(i : Num) < (n : Num) → (i + 1 < n) == !(i == n - 1)"),
      ),
    ]),
  )
  let t83 = @list.List([
    @simp.gen_rewrite_tac(
      fn(
        x82 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x76 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s77 = @equal.land_conv(x76)
          fn(x78 : @kernel.Term) -> @kernel.Thm raise { s77(x78) }
        })(
          (fn(
            x79 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s80 = @equal.once_depth_conv(x79)
            fn(x81 : @kernel.Term) -> @kernel.Thm raise { s80(x81) }
          })(x82),
        )
      },
      @list.List([@words.bit_guard()]),
    ),
    @tactics.all_tac,
  ])
  let t75 = @simp.simp_tac(
    @list.List([
      @words.bit_word_shl(),
      @words.bit_word_ushr(),
      @words.bit_word_ishr(),
      @words.bit_word_0(),
    ]),
  )
  let t74 = @simp.rewrite_tac(
    @list.List([word_shladd(), @words.bit_word_or(), @words.bit_word_bitval()]),
  )
  let t73 = @simp.rewrite_tac(
    @list.List([
      @words.word_eq_bits_alt(),
      @words.bit_word_and(),
      @words.bit_word_int_min(),
    ]),
  )
  let t95 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t73,
                        ),
                        t74,
                      ),
                      t75,
                    ),
                    t83,
                  ),
                  t84,
                ),
                t85,
              ),
              t86,
            ),
            t87,
          ),
          t88,
        ),
        t92,
      ),
      t93,
    ),
    t94,
  )
  let t96 = (
    @term_syntax.parse_term("(∀ x : Word[N], ∀ y : Word[N], (word_ushr(x, 1) == y) == (word_and(word_INT_MIN, y) == word(0) && word_shladd(y, bit(0, x)) == x)) && (∀ x : Word[N], ∀ y : Word[N], (word_ishr(x, 1) == y) == (word_and(word_INT_MIN, y) == word_and(word_INT_MIN, x) && word_shladd(y, bit(0, x)) == x))"),
    t95,
  )
  let (word_ushr_shladd, word_ishr_shladd) = @bool.conj_pair(
    (fn(
      x72 : (
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
      @tactics.prove(x72.0, x72.1)
    })(t96),
  )
  word_ushr_shladd_c.set(word_ushr_shladd)
  word_ishr_shladd_c.set(word_ishr_shladd)
}

///|
/// DEFINE_WORD_INT_MIN
fn step_9() -> Unit raise {
  let t110 = @simp.rewrite_tac(
    @list.List([
      @cart.dimindex_nonzero(),
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= n - 1) == (n == 0)")),
    ]),
  )
  let t109 = @simp.rewrite_tac(
    @list.List([@arith.le_exp(), @arith.exp_eq_0(), @calc_num.arith_eq()]),
  )
  let t106 = @drule.match_mp(@int.divides_le())
  let t108 = @tactics.disch_then(fn(
    x107 : @kernel.Thm,
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
      x103 : @kernel.Thm,
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
      let s104 = @tactics.mp_tac(x103)
      fn(
        x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s104(x105)
      }
    })(t106(x107))
  })
  let t102 = @simp.rewrite_tac(
    @list.List([@int.number_rule(@term_syntax.parse_term("divides((n : Num), n)"))]),
  )
  let t101 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_clauses(), @equal.gsym(@int.num_divides())]),
  )
  let t99 = @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n - 1) == n"))
  let t100 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@bool.conjunct2(@int.int_pow_v1())),
      @cart.dimindex_nonzero(),
      t99,
    ]),
  )
  let t98 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq(-(x : Int), int_of_num(0), mod((n : Int))) == divides(n, x)"),
      ),
    ]),
  )
  let t97 = @simp.rewrite_tac(
    @list.List([@words.word_iword(), @words.iword_eq(), @int.int_mul_rneg()]),
  )
  let t111 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      word_shladd_0(),
                      @words.word_int_min(),
                      @words.word_rule(
                        @term_syntax.parse_term("(word_shl : (Word[_], Num) -> Word[_])((iword : (Int) -> Word[_])((x : Int)), 1) == (iword : (Int) -> Word[_])(int_of_num(2) * x)"),
                      ),
                    ]),
                  ),
                  t97,
                ),
                t98,
              ),
              t100,
            ),
            t101,
          ),
          t102,
        ),
        t108,
      ),
      t109,
    ),
    t110,
  )
  define_word_int_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("!((word_INT_MIN : Word[N]) == (word : (Num) -> Word[N])(0)) && (word_shladd : (Word[N], Bool) -> Word[N])((word_INT_MIN : Word[N]), false) == (word : (Num) -> Word[N])(0)"),
      t111,
    ),
  )
}

///|
let define_word_int_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DEFINE_WORD_INT_MIN",
)

///|
/// `DEFINE_WORD_INT_MIN`
pub fn define_word_int_min() -> @kernel.Thm {
  define_word_int_min_c.get()
}

///|
/// VAL_LT_ELIM_THM
fn step_10() -> Unit raise {
  let t113 = @tactics.conv_tac(@words.word_arith)
  let t112 = @simp.simp_tac(
    @list.List([
      @theorems.forall_unwind_thm2(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) && (r : Bool)) == (q → p → !r)")),
    ]),
  )
  let t114 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @words.word_eq_bits(),
          @words.bit_word_and(),
          @words.bit_word_int_min(),
          @words.bit_word_0(),
        ]),
      ),
      t112,
    ),
    t113,
  )
  val_lt_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], (val(x) < val(y)) == !(word_and(word_INT_MIN, word_or(word_and(word_not(x), y), word_and(word_or(word_not(x), y), word_sub(x, y)))) == word(0))"),
      t114,
    ),
  )
}

///|
let val_lt_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VAL_LT_ELIM_THM",
)

///|
/// `VAL_LT_ELIM_THM`
pub fn val_lt_elim_thm() -> @kernel.Thm {
  val_lt_elim_thm_c.get()
}

///|
/// IVAL_LT_ELIM_THM
fn step_11() -> Unit raise {
  let t116 = @tactics.conv_tac(@words.word_arith)
  let t115 = @simp.simp_tac(
    @list.List([
      @theorems.forall_unwind_thm2(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) && (r : Bool)) == (q → p → !r)")),
    ]),
  )
  let t117 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @words.word_eq_bits(),
          @words.bit_word_and(),
          @words.bit_word_int_min(),
          @words.bit_word_0(),
        ]),
      ),
      t115,
    ),
    t116,
  )
  ival_lt_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], (ival(x) < ival(y)) == !(word_and(word_INT_MIN, word_or(word_and(x, word_not(y)), word_and(word_not(word_xor(x, y)), word_sub(x, y)))) == word(0))"),
      t117,
    ),
  )
}

///|
let ival_lt_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IVAL_LT_ELIM_THM",
)

///|
/// `IVAL_LT_ELIM_THM`
pub fn ival_lt_elim_thm() -> @kernel.Thm {
  ival_lt_elim_thm_c.get()
}

///|
/// IVAL_LT_0_ELIM_THM
fn step_12() -> Unit raise {
  let t119 = @tactics.conv_tac(@words.word_arith)
  let t118 = @simp.simp_tac(
    @list.List([
      @theorems.forall_unwind_thm2(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) && (r : Bool)) == (q → p → !r)")),
    ]),
  )
  let t120 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@words.msb_ival()),
          @words.word_eq_bits(),
          @words.bit_word_and(),
          @words.bit_word_int_min(),
          @words.bit_word_0(),
        ]),
      ),
      t118,
    ),
    t119,
  )
  ival_lt_0_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], (ival(x) < int_of_num(0)) == !(word_and(word_INT_MIN, x) == word(0))"),
      t120,
    ),
  )
}

///|
let ival_lt_0_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IVAL_LT_0_ELIM_THM",
)

///|
/// `IVAL_LT_0_ELIM_THM`
pub fn ival_lt_0_elim_thm() -> @kernel.Thm {
  ival_lt_0_elim_thm_c.get()
}

///|
/// CONJ_WORD_EQ_0
fn step_13() -> Unit raise {
  conj_word_eq_0_c.set(@equal.gsym(@words.word_or_eq_0()))
}

///|
let conj_word_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_WORD_EQ_0")

///|
/// `CONJ_WORD_EQ_0`
pub fn conj_word_eq_0() -> @kernel.Thm {
  conj_word_eq_0_c.get()
}

///|
/// DISJ_WORD_EQ_0
fn step_14() -> Unit raise {
  let t123 = @meson.meson_tac(
    @list.List([@arith.le_cases(), @arith.let_trans()]),
  )
  let t122 = @simp.simp_tac(
    @list.List([
      @words.bit_word_and(),
      @words.bit_word_or_neg(),
      @words.bit_word_0(),
    ]),
  )
  let t121 = @simp.once_rewrite_tac(@list.List([@words.word_eq_bits_alt()]))
  let t124 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t121),
      t122,
    ),
    t123,
  )
  disj_word_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], (x == word(0) || y == word(0)) == (word_and(word_or(x, word_neg(x)), word_or(y, word_neg(y))) == word(0))"),
      t124,
    ),
  )
}

///|
let disj_word_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJ_WORD_EQ_0")

///|
/// `DISJ_WORD_EQ_0`
pub fn disj_word_eq_0() -> @kernel.Thm {
  disj_word_eq_0_c.get()
}

///|
/// `is_shr`
pub fn is_shr(x125 : @kernel.Term) -> Bool raise {
  let tm = x125
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("word_ushr", _), _),
      _
    ) => true
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("word_ishr", _), _),
      _
    ) => true
    _ => false
  }
}

///|
/// `carrying`
pub fn carrying(x126 : @kernel.Term) -> Bool raise {
  let tm = x126
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("word_add", _), _),
      _
    ) => true
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("word_sub", _), _),
      _
    ) => true
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("word_shladd", _), _),
      _
    ) => true
    @kernel.Term::Comb(
      @kernel.Term::Const("word_neg", _),
      @kernel.Term::Comb(
        @kernel.Term::Const("word", _),
        @kernel.Term::Comb(@kernel.Term::Const("bitval", _), _)
      )
    ) => false
    @kernel.Term::Comb(@kernel.Term::Const("word_neg", _), _) => true
    _ => false
  }
}

///|
/// WORD_AUTO_TRANSIFY_TAC
fn step_15() -> Unit raise {
  let t134 = @meson.asm_meson_tac(
    @list.List([
      @rstc.rtc_rules(),
      @arith.add1(),
      @int.arith_rule(@term_syntax.parse_term("(i : Num) + 1 < (n : Num) → i < n")),
    ]),
  )
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t133 = @list.List([@tactics.match_mp_tac(@nums.num_induction()), t132])
  let t131 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, i < (n : Num) → RTC((step : (S, S) -> Bool), (b : (Num) -> S)(0), b(i))"),
    fn(
      x128 : @kernel.Thm,
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
      let s129 = @tactics.mp_tac(x128)
      fn(
        x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s129(x130)
      }
    },
  )
  let t127 = @tactics.repeat_tac(@tactics.disch_tac)
  let t135 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t127),
        t131,
      ),
      t133,
    ),
    t134,
  )
  let pth = @tactics.prove(
    @parser.parse_term(
      "forall step init final b n.\n          (forall s s':S. init s /\\ RTC step s s' ==> final s')\n          ==> init(b 0)\n              ==> (forall i. i + 1 < n ==> step (b i) (b(i+1)))\n                  ==> forall i. i < n ==> final(b i)",
    ),
    t135,
  )
  let n_ty = @parser.parse_type("N")
  let plus = @term_syntax.parse_term("op_plus")
  let one_tm = @term_syntax.parse_term("1")
  let has_word_ty : (@kernel.Term) -> Bool raise = fn(
    x136 : @kernel.Term,
  ) -> Bool raise {
    let tm = x136
    match @kernel.type_of(tm) {
      @kernel.HolType::Tyapp("word", More(_, tail=Empty)) => true
      _ => false
    }
  }
  let boolify : (@kernel.Term) -> @kernel.Term raise = fn(
    x137 : @kernel.Term,
  ) -> @kernel.Term raise {
    let tm_1 = x137
    match tm_1 {
      @kernel.Term::Var(s, t) => @kernel.mk_var(s, @kernel.bool_ty)
      _ => raise Failure("boolify")
    }
  }
  let mk_bit : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x138 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let itm = x138
    fn(x139 : @kernel.Term) -> @kernel.Term raise {
      let tm_2 = x139
      match @kernel.type_of(tm_2) {
        @kernel.HolType::Tyapp("word", More(nty, tail=Empty)) =>
          @kernel.mk_comb(
            @kernel.mk_comb(
              @kernel.mk_const("bit", @list.List([(nty, n_ty)])),
              itm,
            ),
            tm_2,
          )
        _ => raise Failure("mk_bit")
      }
    }
  }
  let plus1 : (@kernel.Term) -> @kernel.Term raise = fn(
    x140 : @kernel.Term,
  ) -> @kernel.Term raise {
    let itm_1 = x140
    @kernel.mk_comb(@kernel.mk_comb(plus, itm_1), one_tm)
  }
  word_auto_transify_tac_c.set(fn(
    x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
    let (asl, w) as gl = x141
    let wvs = @lib.filter(has_word_ty, @kernel.frees(w))
    let t142 = @lib.map(boolify, wvs)
    let bvs = @basics.variants(@kernel.frees(w), t142)
    let bvs_p = @basics.variants(bvs.concat(@kernel.frees(w)), bvs)
    let btup = @lib.end_itlist(
      (x143 : @kernel.Term, x144 : @kernel.Term) => {
        @lib.curry(@pair.mk_pair, x143, x144)
      },
      bvs,
    )
    let btup_p = @lib.end_itlist(
      (x145 : @kernel.Term, x146 : @kernel.Term) => {
        @lib.curry(@pair.mk_pair, x145, x146)
      },
      bvs_p,
    )
    let (init_, stepconc) = @basics.dest_imp(w)
    let init_p = @basics.mk_gabs(
      btup,
      @basics.subst(
        @lib.zip(bvs, @lib.map(mk_bit(@parser.parse_term("0")), wvs)),
        init_,
      ),
    )
    let (step, conc) = @basics.dest_imp(stepconc)
    let (itm_2, stepimp) = @basics.dest_forall(step)
    let t148 = @kernel.rand(stepimp)
    let t147 = @lib.zip(bvs_p, @lib.map(mk_bit(plus1(itm_2)), wvs))
    let step_p = @basics.list_mk_gabs(
      @list.List([btup, btup_p]),
      @basics.subst(
        @lib.zip(bvs, @lib.map(mk_bit(itm_2), wvs)).concat(t147),
        t148,
      ),
    )
    let (jtm, finalimp) = @basics.dest_forall(conc)
    let t149 = @kernel.rand(finalimp)
    let final_p = @basics.mk_gabs(
      btup_p,
      @basics.subst(@lib.zip(bvs_p, @lib.map(mk_bit(jtm), wvs)), t149),
    )
    let th1 = @bool.ispecl(@list.List([step_p, init_p, final_p]), pth)
    let th2 = @simp.rewrite_rule(@list.List([@pair.forall_pair_fun_thm()]))(th1)
    let t152 = mk_bit(itm_2)
    let th3 = @bool.specl(
      @lib.map(
        fn(x153 : @kernel.Term) -> @kernel.Term raise {
          ((x151 : @kernel.Term) => {
            @lib.curry(
              fn(x150 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                @kernel.mk_abs(x150.0, x150.1)
              },
              itm_2,
              x151,
            )
          })(t152(x153))
        },
        wvs,
      ),
      th2,
    )
    let th4 = @equal.conv_rule(@equal.top_depth_conv(@pair.gen_beta_conv), th3)
    @tactics.match_mp_tac(th4)(gl)
  })
}

///|
let word_auto_transify_tac_c : @lib.Cell[
  ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise,
] = @lib.Cell::new("WORD_AUTO_TRANSIFY_TAC")

///|
/// `WORD_AUTO_TRANSIFY_TAC`
pub fn word_auto_transify_tac(
  x : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  word_auto_transify_tac_c.get()(x)
}

///|
/// LSB_CARRYING
fn step_16() -> Unit raise {
  let t163 = @simp.simp_tac(
    @list.List([@arith.le_1(), @cart.dimindex_nonzero()]),
  )
  let t162 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t161 = @simp.once_rewrite_tac(
    @list.List([
      @words.bit_word_neg(),
      @words.bit_word_add(),
      @words.bit_word_sub(),
      bit_word_shladd(),
    ]),
  )
  let t160 = @simp.rewrite_tac(@list.List([]))
  let t159 = @tactics.disch_then(fn(
    x158 : @kernel.Thm,
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
      x155 : @kernel.Thm,
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
      let s156 = @tactics.subst1_tac(x155)
      fn(
        x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s156(x157)
      }
    })(@equal.sym(x158))
  })
  let t154 = @tactics.repeat_tac(@tactics.gen_tac)
  let t164 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t154),
            t159,
          ),
          t160,
        ),
        t161,
      ),
      t162,
    ),
    t163,
  )
  lsb_carrying_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Word[N], ∀ z : Word[N], word_neg(x) == z → bit(0, z) == bit(0, x)) && (∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_add(x, y) == z → bit(0, z) == !(bit(0, x) == bit(0, y))) && (∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_sub(x, y) == z → bit(0, z) == !(bit(0, x) == bit(0, y))) && (∀ x : Word[N], ∀ z : Word[N], ∀ b : Bool, word_shladd(x, b) == z → bit(0, z) == b) && (∀ a : Word[N], ∀ b : Word[N], a == b → bit(0, a) == bit(0, b))"),
      t164,
    ),
  )
}

///|
let lsb_carrying_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSB_CARRYING")

///|
/// `LSB_CARRYING`
pub fn lsb_carrying() -> @kernel.Thm {
  lsb_carrying_c.get()
}

///|
/// XSB_CARRYING
fn step_17() -> Unit raise {
  let t175 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.add_sub(),
      @int.arith_rule(@term_syntax.parse_term("!((i : Num) + 1 == 0) && 1 <= i + 1")),
    ]),
  )
  let t174 = @simp.gen_rewrite_tac(
    fn(
      x171 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s172 = @equal.land_conv(x171)
      fn(x173 : @kernel.Term) -> @kernel.Thm raise { s172(x173) }
    },
    @list.List([
      @words.bit_word_neg(),
      @words.bit_word_add(),
      @words.bit_word_sub(),
      bit_word_shladd(),
    ]),
  )
  let t170 = @simp.rewrite_tac(@list.List([]))
  let t169 = @tactics.disch_then(fn(
    x166 : @kernel.Thm,
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
    let th = x166
    let t168 = @tactics.subst1_tac(@equal.sym(th))
    @tactics.then_tac(@tactics.assume_tac(th), t168)
  })
  let t165 = @tactics.repeat_tac(@tactics.gen_tac)
  let t176 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t165),
              t169,
            ),
            t170,
          ),
          @tactics.gen_tac,
        ),
        @tactics.disch_tac,
      ),
      t174,
    ),
    t175,
  )
  xsb_carrying_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Word[N], ∀ z : Word[N], (word_neg : (Word[N]) -> Word[N])(x) == z → (∀ i : Num, i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (bit : (Num, Word[N]) -> Bool)(i + 1, z) == ((bit : (Num, Word[N]) -> Bool)(i + 1, x) == (!(bit : (Num, Word[N]) -> Bool)(i, x) && !(bit : (Num, Word[N]) -> Bool)(i, z))))) && (∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], (word_add : (Word[N], Word[N]) -> Word[N])(x, y) == z → (∀ i : Num, i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (bit : (Num, Word[N]) -> Bool)(i + 1, z) == (((bit : (Num, Word[N]) -> Bool)(i + 1, x) == (bit : (Num, Word[N]) -> Bool)(i + 1, y)) == ((bit : (Num, Word[N]) -> Bool)(i, x) && (bit : (Num, Word[N]) -> Bool)(i, y) || ((bit : (Num, Word[N]) -> Bool)(i, x) || (bit : (Num, Word[N]) -> Bool)(i, y)) && !(bit : (Num, Word[N]) -> Bool)(i, z))))) && (∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], (word_sub : (Word[N], Word[N]) -> Word[N])(x, y) == z → (∀ i : Num, i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (bit : (Num, Word[N]) -> Bool)(i + 1, z) == (((bit : (Num, Word[N]) -> Bool)(i + 1, x) == (bit : (Num, Word[N]) -> Bool)(i + 1, y)) == (!(bit : (Num, Word[N]) -> Bool)(i, x) && (bit : (Num, Word[N]) -> Bool)(i, y) || (!(bit : (Num, Word[N]) -> Bool)(i, x) || (bit : (Num, Word[N]) -> Bool)(i, y)) && (bit : (Num, Word[N]) -> Bool)(i, z))))) && (∀ x : Word[N], ∀ z : Word[N], ∀ b : Bool, (word_shladd : (Word[N], Bool) -> Word[N])(x, b) == z → (∀ i : Num, i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (bit : (Num, Word[N]) -> Bool)(i + 1, z) == (bit : (Num, Word[N]) -> Bool)(i, x))) && (∀ a : Word[N], ∀ b : Word[N], a == b → (∀ i : Num, i + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (bit : (Num, Word[N]) -> Bool)(i + 1, a) == (bit : (Num, Word[N]) -> Bool)(i + 1, b)))"),
      t176,
    ),
  )
}

///|
let xsb_carrying_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XSB_CARRYING")

///|
/// `XSB_CARRYING`
pub fn xsb_carrying() -> @kernel.Thm {
  xsb_carrying_c.get()
}

///|
/// `ABBREVIATE_SHR_TAC`
pub fn abbreviate_shr_tac(
  x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let (asl, w) as gl = x177
  match
    @lib.sort(
      fn(x178 : @kernel.Term, x179 : @kernel.Term) -> Bool raise {
        @basics.free_in(x178, x179)
      },
      @basics.find_terms(is_shr, w),
    ) {
    More(t, tail=_) =>
      @simp.abbrev_tac(@basics.mk_eq(@basics.genvar(@kernel.type_of(t)), t))(gl)
    _ => raise Failure("ABBREVIATE_SHR_TAC: No word_ushr/word_ishr subterms")
  }
}

///|
/// `ABBREVIATE_CARRYING_TAC`
pub fn abbreviate_carrying_tac(
  x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let (asl, w) as gl = x180
  match
    @lib.sort(
      fn(x181 : @kernel.Term, x182 : @kernel.Term) -> Bool raise {
        @basics.free_in(x181, x182)
      },
      @basics.find_terms(carrying, w),
    ) {
    More(t, tail=_) =>
      @simp.abbrev_tac(@basics.mk_eq(@basics.genvar(@kernel.type_of(t)), t))(gl)
    _ => raise Failure("ABBREVIATE_CARRYING_TAC: No carrying constructs")
  }
}

///|
/// LSB_CARRY_RULE
fn step_18() -> Unit raise {
  let rules = @lib.map(@drule.match_mp, @bool.conjuncts_rule(lsb_carrying()))
  lsb_carry_rule_c.set(fn(x183 : @kernel.Thm) -> @kernel.Thm raise {
    let x = x183
    @lib.tryfind(
      fn(x184 : (@kernel.Thm) -> @kernel.Thm raise) -> @kernel.Thm raise {
        let f = x184
        f(x)
      },
      rules,
    )
  })
}

///|
let lsb_carry_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "LSB_CARRY_RULE",
)

///|
/// `LSB_CARRY_RULE`
pub fn lsb_carry_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  lsb_carry_rule_c.get()(x)
}

///|
/// XSB_CARRY_RULE
fn step_19() -> Unit raise {
  let rules = @lib.map(@drule.match_mp, @bool.conjuncts_rule(xsb_carrying()))
  xsb_carry_rule_c.set(fn(x185 : @kernel.Thm) -> @kernel.Thm raise {
    let x = x185
    @lib.tryfind(
      fn(x186 : (@kernel.Thm) -> @kernel.Thm raise) -> @kernel.Thm raise {
        let f = x186
        f(x)
      },
      rules,
    )
  })
}

///|
let xsb_carry_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "XSB_CARRY_RULE",
)

///|
/// `XSB_CARRY_RULE`
pub fn xsb_carry_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  xsb_carry_rule_c.get()(x)
}

///|
/// BIT_PUSH_CONV
fn step_20() -> Unit raise {
  bit_push_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x187 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s188 = @equal.top_depth_conv(x187)
        fn(x189 : @kernel.Term) -> @kernel.Thm raise { s188(x189) }
      },
      @list.List([
        @words.bit_word_or(),
        @words.bit_word_and(),
        @words.bit_word_xor(),
        @words.bit_word_not(),
        @words.bit_word_0(),
      ]),
    ),
  )
}

///|
let bit_push_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("BIT_PUSH_CONV")

///|
/// `BIT_PUSH_CONV`
pub fn bit_push_conv(x : @kernel.Term) -> @kernel.Thm raise {
  bit_push_conv_c.get()(x)
}

///|
/// LSB_SIMP_CONV
fn step_21() -> Unit raise {
  lsb_simp_conv_c.set(
    @equal.thenc(
      bit_push_conv,
      @simp.rewrite_conv(
        @list.List([
          @meson.meson(
            @list.List([@arith.le_1(), @cart.dimindex_nonzero()]),
            @term_syntax.parse_term("0 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"),
          ),
        ]),
      ),
    ),
  )
}

///|
let lsb_simp_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LSB_SIMP_CONV")

///|
/// `LSB_SIMP_CONV`
pub fn lsb_simp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  lsb_simp_conv_c.get()(x)
}

///|
/// MSB_SIMP_CONV
fn step_22() -> Unit raise {
  let t190 = @simp.simp_conv(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(i : Num) + 1 < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → i < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"),
      ),
    ]),
  )
  msb_simp_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        bit_push_conv,
        @simp.rewrite_conv(
          @list.List([
            @theorems.and_forall_thm(),
            @class.taut(
              @term_syntax.parse_term("(((i : Num) + 1 < (n : Num) → (p : Bool)) && (i + 1 < n → (q : Bool))) == (i + 1 < n → p && q)"),
            ),
          ]),
        ),
      ),
      t190,
    ),
  )
}

///|
let msb_simp_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("MSB_SIMP_CONV")

///|
/// `MSB_SIMP_CONV`
pub fn msb_simp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  msb_simp_conv_c.get()(x)
}

///|
/// HORN_WORD_AUTO_TAC
fn step_23() -> Unit raise {
  let t217 = @tactics.pop_assum_list(fn(
    x216 : @list.List[@kernel.Thm],
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
      x214 : @list.List[@kernel.Thm],
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
        x212 : @kernel.Thm,
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
          x208 : @kernel.Thm,
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
          let s209 = @tactics.mp_tac(x208)
          fn(
            x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s209(x210)
          }
        })(
          ((x211 : @kernel.Thm) => @equal.conv_rule(lsb_simp_conv, x211))(x212),
        )
      })(
        ((x213 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x213))(
          x214,
        ),
      )
    })(
      ((x215 : @list.List[@kernel.Thm]) => @lib.map(lsb_carry_rule, x215))(x216),
    )
  })
  let t207 = @tactics.assum_list(fn(
    x206 : @list.List[@kernel.Thm],
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
      x204 : @list.List[@kernel.Thm],
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
        x202 : @kernel.Thm,
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
          x198 : @kernel.Thm,
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
          let s199 = @tactics.mp_tac(x198)
          fn(
            x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s199(x200)
          }
        })(
          ((x201 : @kernel.Thm) => @equal.conv_rule(msb_simp_conv, x201))(x202),
        )
      })(
        ((x203 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x203))(
          x204,
        ),
      )
    })(
      ((x205 : @list.List[@kernel.Thm]) => @lib.map(xsb_carry_rule, x205))(x206),
    )
  })
  let t196 = @simp.simp_tac(@list.List([]))
  let t195 = @tactics.conv_tac(bit_push_conv)
  let t197 = @tactics.try_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x194 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x194
          },
          @list.List([@words.word_eq_bits_alt()]),
        ),
        t195,
      ),
      t196,
    ),
  )
  let t193 = @tactics.disch_then(fn(
    x191 : @kernel.Thm,
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
    let th = x191
    if @basics.is_eq(@kernel.concl(th)) {
      @tactics.assume_tac(th)
    } else {
      @tactics.all_tac
    }
  })
  horn_word_auto_tac_c.set(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(abbreviate_carrying_tac),
                t193,
              ),
              t197,
            ),
            t207,
          ),
          t217,
        ),
        word_auto_transify_tac,
      ),
      reachable_state_tac,
    ),
  )
}

///|
let horn_word_auto_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "HORN_WORD_AUTO_TAC",
)

///|
/// `HORN_WORD_AUTO_TAC`
pub fn horn_word_auto_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  horn_word_auto_tac_c.get()(x)
}

///|
/// CORE_WORD_AUTO_TAC
fn step_24() -> Unit raise {
  let true_tm = @term_syntax.parse_term("true")
  let false_tm = @term_syntax.parse_term("false")
  let t225 = @simp.gen_rewrite_conv(
    fn(
      x222 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s223 = @equal.top_sweep_conv(x222)
      fn(x224 : @kernel.Term) -> @kernel.Thm raise { s223(x224) }
    },
    @list.List([@class.de_morgan_thm()]),
  )
  let t221 = @simp.gen_rewrite_conv(
    fn(
      x220 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x220
    },
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (!p || q)"))]),
  )
  let t219 = @class.taut(@term_syntax.parse_term("((p : Bool) → false) == !p"))
  let deimp_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.orelsec(
      @simp.gen_rewrite_conv(
        fn(
          x218 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x218
        },
        @list.List([@class.taut(@term_syntax.parse_term("(true → (p : Bool)) == p")), t219]),
      ),
      t221,
    ),
    t225,
  )
  let merge_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x226 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s227 = @equal.depth_conv(x226)
      fn(x228 : @kernel.Term) -> @kernel.Thm raise { s227(x228) }
    },
    @list.List([conj_word_eq_0(), disj_word_eq_0()]),
  )
  core_word_auto_tac_c.set(fn(
    x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
    let (asl, w) as gl = x229
    let (ndj, pdj) = @lib.partition(
      fn(x230 : @kernel.Term) -> Bool raise { @basics.is_neg(x230) },
      @basics.disjuncts(w),
    )
    let t231 = if pdj == @list.List([]) {
      false_tm
    } else {
      @bool.list_mk_disj(pdj)
    }
    let t = @bool.mk_imp(
      if ndj == @list.List([]) {
        true_tm
      } else {
        @bool.list_mk_conj(@lib.map(@kernel.rand, ndj))
      },
      t231,
    )
    let t232 = merge_conv(t)
    let th1 = @kernel.trans(@equal.sym(deimp_conv(t)), t232)
    let th2 = @kernel.trans(
      @canon.disj_aci_rule(@basics.mk_eq(w, @equal.lhand(@kernel.concl(th1)))),
      th1,
    )
    @tactics.then_tac(
      @tactics.conv_tac(fn(x233 : @kernel.Term) -> @kernel.Thm raise { th2 }),
      horn_word_auto_tac,
    )(gl)
  })
}

///|
let core_word_auto_tac_c : @lib.Cell[
  ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise,
] = @lib.Cell::new("CORE_WORD_AUTO_TAC")

///|
/// `CORE_WORD_AUTO_TAC`
pub fn core_word_auto_tac(
  x : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  core_word_auto_tac_c.get()(x)
}

///|
/// WORD_MUL_SHLADD
fn step_25() -> Unit raise {
  let t234 = @tactics.conv_tac(@words.word_rule)
  let t235 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([word_shladd_v1(), @words.bitval_clauses()])),
    t234,
  )
  word_mul_shladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_mul(word_shladd(x, true), y) == word_add(word_shladd(word_mul(x, y), false), y) && word_mul(y, word_shladd(x, true)) == word_add(word_shladd(word_mul(y, x), false), y) && word_mul(word_shladd(x, false), y) == word_shladd(word_mul(x, y), false) && word_mul(y, word_shladd(x, false)) == word_shladd(word_mul(y, x), false)"),
      t235,
    ),
  )
}

///|
let word_mul_shladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WORD_MUL_SHLADD",
)

///|
/// `WORD_MUL_SHLADD`
pub fn word_mul_shladd() -> @kernel.Thm {
  word_mul_shladd_c.get()
}

///|
/// CHARACTERIZE_INT_MIN_TAC
fn step_26() -> Unit raise {
  let is_intmin : (@kernel.Term) -> Bool raise = fn(
    x236 : @kernel.Term,
  ) -> Bool raise {
    let tm = x236
    match tm {
      @kernel.Term::Const("word_INT_MIN", _) => true
      _ => false
    }
  }
  let n_ty = @parser.parse_type("N")
  characterize_int_min_tac_c.set(fn(
    x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
    let (asl, w) = x237
    let tms = @basics.find_terms(is_intmin, w)
    @tactics.map_every(
      fn(
        x238 : @kernel.Term,
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
        let tm_1 = x238
        let ty = @lib.hd(@kernel.dest_type(@kernel.type_of(tm_1)).1)
        let t240 = @tactics.spec_tac(
          tm_1,
          @basics.genvar(@kernel.type_of(tm_1)),
        )
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(
              @kernel.inst_type(@list.List([(ty, n_ty)]), define_word_int_min()),
            ),
            t240,
          ),
          @tactics.gen_tac,
        )
      },
      tms,
    )((asl, w))
  })
}

///|
let characterize_int_min_tac_c : @lib.Cell[
  ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise,
] = @lib.Cell::new("CHARACTERIZE_INT_MIN_TAC")

///|
/// `CHARACTERIZE_INT_MIN_TAC`
pub fn characterize_int_min_tac(
  x : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  characterize_int_min_tac_c.get()(x)
}

///|
/// PURE_WORD_AUTO_TAC
fn step_27() -> Unit raise {
  let t277 = @simp.gen_rewrite_tac(
    fn(
      x274 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s275 = @equal.depth_conv(x274)
      fn(x276 : @kernel.Term) -> @kernel.Thm raise { s275(x276) }
    },
    @list.List([@words.word_xor_0(), @words.word_and_0(), @words.word_or_0()]),
  )
  let t273 = @simp.gen_rewrite_tac(
    fn(
      x270 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s271 = @equal.once_depth_conv(x270)
      fn(x272 : @kernel.Term) -> @kernel.Thm raise { s271(x272) }
    },
    @list.List([@equal.gsym(@words.word_xor_eq_0())]),
  )
  let t269 = @simp.gen_rewrite_tac(
    fn(
      x266 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s267 = @equal.depth_conv(x266)
      fn(x268 : @kernel.Term) -> @kernel.Thm raise { s267(x268) }
    },
    @list.List([@equal.gsym(word_shladd_0())]),
  )
  let t265 = @tactics.repeat_tac(@tactics.conj_tac)
  let t264 = @tactics.conv_tac(@canon.cnf_conv)
  let t263 = @tactics.conv_tac(@canon.nnfc_conv)
  let t260 = @simp.gen_rewrite_rule(
    fn(
      x259 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x259
    },
    @list.List([word_ushr_shladd(), word_ishr_shladd()]),
  )
  let t262 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x261 : @kernel.Thm,
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
        x256 : @kernel.Thm,
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
        let s257 = @tactics.mp_tac(x256)
        fn(
          x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s257(x258)
        }
      })(t260(x261))
    }),
  )
  let t255 = @tactics.repeat_tac(abbreviate_shr_tac)
  let t254 = @tactics.conv_tac(@equal.depth_conv(expand_shift_conv))
  let t253 = @tactics.repeat_tac(@tactics.gen_tac)
  let t252 = @tactics.conv_tac(@canon.prenex_conv)
  let t251 = @tactics.conv_tac(@canon.nnfc_conv)
  let t250 = @simp.gen_rewrite_tac(
    fn(
      x247 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s248 = @equal.top_depth_conv(x247)
      fn(x249 : @kernel.Term) -> @kernel.Thm raise { s248(x249) }
    },
    @list.List([word_mul_shladd(), @words.word_mul_0()]),
  )
  let t246 = @simp.gen_rewrite_tac(
    fn(
      x243 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s244 = @equal.top_depth_conv(x243)
      fn(x245 : @kernel.Term) -> @kernel.Thm raise { s244(x245) }
    },
    @list.List([word_numeral_shladd()]),
  )
  let t241 = @equal.gsym(@arith.not_lt())
  let t242 = @simp.rewrite_tac(
    @list.List([
      @words.word_ile(),
      @words.word_ilt(),
      @words.word_ige(),
      @words.word_igt(),
      @words.irelational2(),
      @words.word_ule(),
      @words.word_ult(),
      @words.word_ige(),
      @words.word_ugt(),
      @words.relational2(),
      @int.int_gt_v1(),
      @int.int_ge_v1(),
      @equal.gsym(@int.int_not_lt()),
      @arith.gt(),
      @arith.ge(),
      t241,
      val_lt_elim_thm(),
      ival_lt_elim_thm(),
      ival_lt_0_elim_thm(),
    ]),
  )
  pure_word_auto_tac_c.set(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.conv_tac(
                                        @equal.depth_conv(
                                          @equal.orelsec(
                                            @words.word_red_conv, @calc_num.num_red_conv,
                                          ),
                                        ),
                                      ),
                                      t242,
                                    ),
                                    t246,
                                  ),
                                  t250,
                                ),
                                t251,
                              ),
                              t252,
                            ),
                            t253,
                          ),
                          t254,
                        ),
                        t255,
                      ),
                      t262,
                    ),
                    characterize_int_min_tac,
                  ),
                  t263,
                ),
                t264,
              ),
              t265,
            ),
            t269,
          ),
          t273,
        ),
        t277,
      ),
      core_word_auto_tac,
    ),
  )
}

///|
let pure_word_auto_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "PURE_WORD_AUTO_TAC",
)

///|
/// `PURE_WORD_AUTO_TAC`
pub fn pure_word_auto_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  pure_word_auto_tac_c.get()(x)
}

///|
/// `PURE_WORD_AUTO_RULE`
pub fn pure_word_auto_rule(x278 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x278
  @tactics.prove(tm, pure_word_auto_tac)
}

///|
/// WORD_AUTO_TAC
fn step_28() -> Unit raise {
  let nty = @parser.parse_type("4")
  word_auto_tac_c.set(fn(
    x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
    let (asl, w) as gl = x279
    match @kernel.type_vars_in_term(w) {
      Empty => @tactics.orelse_tac(@words.bitblast_tac, pure_word_auto_tac)(gl)
      More(n, tail=Empty) => {
        let w_p = @kernel.inst(@list.List([(nty, n)]), w)
        if (try @kernel.concl(@words.bitblast_rule(w_p)) == w_p catch {
            Failure(_) => false
            e => raise e
          }) {
          @lib.remark("Sanity check for size 4 OK")
          pure_word_auto_tac(gl)
        } else {
          raise Failure("WORD_AUTO_TAC: Sanity check for size 4 failed!")
        }
      }
      _ => raise Failure("WORD_AUTO_TAC: Multiple generic types not supported")
    }
  })
}

///|
let word_auto_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "WORD_AUTO_TAC",
)

///|
/// `WORD_AUTO_TAC`
pub fn word_auto_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  word_auto_tac_c.get()(x)
}

///|
/// `WORD_AUTO_RULE`
pub fn word_auto_rule(x280 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x280
  @tactics.prove(tm, word_auto_tac)
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
}
