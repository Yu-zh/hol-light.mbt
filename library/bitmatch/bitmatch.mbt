// Translated from upstream Library/bitmatch.ml; edit this file directly.

///|
/// Library/bitmatch.ml:21
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// TRIV_CHOOSE
fn step_2() -> Unit raise {
  let p = @term_syntax.parse_term("(P : (A) -> Bool)")
  let q = @term_syntax.parse_term("(Q : Bool)")
  let an = @term_syntax.parse_term("op_slash_bslash")
  let t1 = @term_syntax.parse_term("(x : A)")
  let th1 = @equal.ap_thm(
    @kernel.assume_rule(@term_syntax.parse_term("((x : A) => (Q : Bool) && (P : (A) -> Bool)(x)) == P")),
    t1,
  )
  let t2 = @kernel.beta(@term_syntax.parse_term("((x : A) => (Q : Bool) && (P : (A) -> Bool)(x))((x : A))"))
  let th1_1 = @kernel.trans(@equal.sym(th1), t2)
  let th1_2 = @bool.conjunct1(
    @kernel.eq_mp(
      th1_1,
      @kernel.assume_rule(@term_syntax.parse_term("(P : (A) -> Bool)((x : A))")),
    ),
  )
  let t3 = @bool.disch(@term_syntax.parse_term("(P : (A) -> Bool)((x : A))"), th1_2)
  let th1_3 = @bool.gen(@term_syntax.parse_term("(x : A)"), t3)
  let t4 = @equal.ap_thm(@bool.exists_def(), p)
  let th2 = @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), t4)
  let t5 = @kernel.eq_mp(
    th2,
    @kernel.assume_rule(@term_syntax.parse_term("op_q((P : (A) -> Bool))")),
  )
  let pth = @bool.mp(@bool.spec(@term_syntax.parse_term("(Q : Bool)"), t5), th1_3)
  triv_choose_c.set(fn(
    x6 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_4 = x6
    fn(x7 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_1 = x7
      try {
        let p_p = @kernel.rand(@kernel.concl(th1_4))
        let (v, bod) = @kernel.dest_abs(p_p)
        let q_p = @kernel.concl(th2_1)
        let anq = @kernel.mk_comb(an, q_p)
        let t8 = @bool.conjunct2(@kernel.assume_rule(@kernel.mk_comb(anq, bod)))
        let th3 = @kernel.deduct_antisym_rule(
          @bool.conj(th2_1, @kernel.assume_rule(bod)),
          t8,
        )
        let th4 = @equal.ap_term(anq, @kernel.beta(@kernel.mk_comb(p_p, v)))
        let th5 = @bool.pinst(
          @list.List([(@kernel.dest_var(v).1, @kernel.aty)]),
          @list.List([(p_p, p), (q_p, q)]),
          pth,
        )
        @bool.prove_hyp(
          th1_4,
          @bool.prove_hyp(@kernel.abs_rule(v, @kernel.trans(th4, th3)), th5),
        )
      } catch {
        Failure(_) => raise Failure("TRIV_CHOOSE")
        e => raise e
      }
    }
  })
}

///|
let triv_choose_c : @lib.Cell[
  (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("TRIV_CHOOSE")

///|
/// `TRIV_CHOOSE`
pub fn triv_choose(
  x : @kernel.Thm,
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  triv_choose_c.get()(x)
}

///|
/// `WITH_GOAL`
pub fn with_goal(
  x9 : (@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise) raise,
  x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let tac = x9
  let (_, w) as st = x10
  tac(w)(st)
}

///|
/// _BITMATCH
fn step_3() -> Unit raise {
  _bitmatch_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(_BITMATCH : (Word[N], (Num, _) -> Bool) -> _)((s : Word[N]), (c : (Num, _) -> Bool)) == _MATCH(val(s), c)"),
    ),
  )
}

///|
let _bitmatch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("_BITMATCH")

///|
/// `_BITMATCH`
pub fn _bitmatch() -> @kernel.Thm {
  _bitmatch_c.get()
}

///|
/// _ELSEPATTERN
fn step_4() -> Unit raise {
  _elsepattern_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(_ELSEPATTERN : (B, A, B) -> Bool)((e : B), (a : A)) == ((x : B) => e == x)"),
    ),
  )
}

///|
let _elsepattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("_ELSEPATTERN")

///|
/// `_ELSEPATTERN`
pub fn _elsepattern() -> @kernel.Thm {
  _elsepattern_c.get()
}

///|
/// bitpat
fn step_5() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([@pair.snd()]))
  let t12 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(0, (i : Num) => false)")),
    t11,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("∃ x : (Num, (Num) -> Bool), ∀ a : Num, SND(x, a) → a < EXP(2, FST(x))"),
    t12,
  )
  bitpat_c.set(
    @class.new_type_definition("bitpat", ("mk_bitpat", "dest_bitpat"), th),
  )
}

///|
let bitpat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bitpat")

///|
/// `bitpat`
pub fn bitpat() -> @kernel.Thm {
  bitpat_c.get()
}

///|
/// pat_size
fn step_6() -> Unit raise {
  pat_size_c.set(
    @pair.new_definition(@term_syntax.parse_term("(pat_size : (Bitpat) -> Num)((p : Bitpat)) == FST(dest_bitpat(p))")),
  )
}

///|
let pat_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pat_size")

///|
/// `pat_size`
pub fn pat_size() -> @kernel.Thm {
  pat_size_c.get()
}

///|
/// pat_set
fn step_7() -> Unit raise {
  pat_set_c.set(
    @pair.new_definition(@term_syntax.parse_term("(pat_set : (Bitpat, Num) -> Bool)((p : Bitpat)) == SND(dest_bitpat(p))")),
  )
}

///|
let pat_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pat_set")

///|
/// `pat_set`
pub fn pat_set() -> @kernel.Thm {
  pat_set_c.get()
}

///|
/// pat_set_lt
fn step_8() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([pat_set(), pat_size(), bitpat()]))
  pat_set_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Bitpat, ∀ s : Num, pat_set(p, s) → s < EXP(2, pat_size(p))"),
      t13,
    ),
  )
}

///|
let pat_set_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pat_set_lt")

///|
/// `pat_set_lt`
pub fn pat_set_lt() -> @kernel.Thm {
  pat_set_lt_c.get()
}

///|
/// pat_thm
fn step_9() -> Unit raise {
  let t21 = @drule.match_mp(pat_set_lt())
  let t23 = @tactics.first_x_assum(fn(
    x22 : @kernel.Thm,
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
      x18 : @kernel.Thm,
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
      let s19 = @tactics.assume_tac(x18)
      fn(
        x20 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s19(x20)
      }
    })(t21(x22))
  })
  let t17 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(bitpat()))]),
  )
  let t16 = @tactics.subgoal_then(
    @term_syntax.parse_term("dest_bitpat(mk_bitpat(((n : Num), (f : (Num) -> Bool)))) == (n, f)"),
    fn(
      x14 : @kernel.Thm,
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
      let th = x14
      @simp.asm_rewrite_tac(@list.List([pat_size(), pat_set(), th]))
    },
  )
  let t24 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t16),
      t17,
    ),
    t23,
  )
  pat_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(p : Bitpat) == mk_bitpat(((n : Num), (f : (Num) -> Bool))) && (∀ a : Num, f(a) → a < EXP(2, n)) → pat_size(p) == n && (∀ s : Num, pat_set(p, s) == f(s))"),
      t24,
    ),
  )
}

///|
let pat_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pat_thm")

///|
/// `pat_thm`
pub fn pat_thm() -> @kernel.Thm {
  pat_thm_c.get()
}

///|
/// NILPAT
fn step_10() -> Unit raise {
  nilpat_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(NILPAT : Bitpat) == mk_bitpat((0, (s : Num) => s == 0))"),
    ),
  )
}

///|
let nilpat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NILPAT")

///|
/// `NILPAT`
pub fn nilpat() -> @kernel.Thm {
  nilpat_c.get()
}

///|
let nilpat_pat_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NILPAT_pat_size",
)

///|
/// `NILPAT_pat_size`
pub fn nilpat_pat_size() -> @kernel.Thm {
  nilpat_pat_size_c.get()
}

///|
let nilpat_pat_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NILPAT_pat_set")

///|
/// `NILPAT_pat_set`
pub fn nilpat_pat_set() -> @kernel.Thm {
  nilpat_pat_set_c.get()
}

///|
/// NILPAT_pat_size, NILPAT_pat_set
fn step_11() -> Unit raise {
  let t30 = @tactics.disch_then(fn(
    x27 : @kernel.Thm,
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
    let s28 = @tactics.subst1_tac(x27)
    fn(
      x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s28(x29)
    }
  })
  let t26 = @simp.rewrite_tac(@list.List([nilpat()]))
  let t31 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(pat_thm()), t26),
        @tactics.strip_tac,
      ),
      t30,
    ),
    @int.arith_tac,
  )
  let t32 = (
    @term_syntax.parse_term("pat_size(NILPAT) == 0 && (∀ s : Num, pat_set(NILPAT, s) == (s == 0))"),
    t31,
  )
  let (nilpat_pat_size, nilpat_pat_set) = @bool.conj_pair(
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
    })(t32),
  )
  nilpat_pat_size_c.set(nilpat_pat_size)
  nilpat_pat_set_c.set(nilpat_pat_set)
}

///|
/// CONSPAT
fn step_12() -> Unit raise {
  conspat_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(CONSPAT : (Bitpat, Word[N]) -> Bitpat)((p : Bitpat), (a : Word[N])) == (LET : ((Num) -> Bitpat, Num) -> Bitpat)((n : Num) => (LET_END : (Bitpat) -> Bitpat)(mk_bitpat((n + pat_size(p), (s : Num) => ∃ t : Num, pat_set(p, t) && s == (val : (Word[N]) -> Num)(a) + EXP(2, n) * t))), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"),
    ),
  )
}

///|
let conspat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSPAT")

///|
/// `CONSPAT`
pub fn conspat() -> @kernel.Thm {
  conspat_c.get()
}

///|
let conspat_pat_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONSPAT_pat_size",
)

///|
/// `CONSPAT_pat_size`
pub fn conspat_pat_size() -> @kernel.Thm {
  conspat_pat_size_c.get()
}

///|
let conspat_pat_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONSPAT_pat_set",
)

///|
/// `CONSPAT_pat_set`
pub fn conspat_pat_set() -> @kernel.Thm {
  conspat_pat_set_c.get()
}

///|
/// CONSPAT_pat_size, CONSPAT_pat_set
fn step_13() -> Unit raise {
  let t45 = @simp.rewrite_tac(
    @list.List([@arith.mult_suc(), @arith.lt_add_rcancel(), @words.val_bound()]),
  )
  let t44 = @tactics.pop_assum(fn(
    x42 : @kernel.Thm,
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
    let th = x42
    @simp.rewrite_tac(
      @list.List([
        @arith.exp_add(),
        @arith.le_mult_lcancel(),
        @arith.le_suc_lt(),
        @drule.match_mp(pat_set_lt())(th),
      ]),
    )
  })
  let t41 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) * SUC((t : Num))"),
  )
  let t40 = @tactics.match_mp_tac(@arith.lte_trans())
  let t39 = @tactics.pop_assum(fn(
    x36 : @kernel.Thm,
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
    let s37 = @tactics.subst1_tac(x36)
    fn(
      x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s37(x38)
    }
  })
  let t35 = @tactics.repeat_tac(@tactics.strip_tac)
  let t34 = @simp.rewrite_tac(
    @list.List([
      @equal.conv_rule(@equal.once_depth_conv(@pair.let_conv), conspat()),
    ]),
  )
  let t46 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.match_mp_tac(pat_thm()), t34),
              t35,
            ),
            t39,
          ),
          t40,
        ),
        t41,
      ),
      t44,
    ),
    t45,
  )
  let t47 = (
    @term_syntax.parse_term("pat_size((CONSPAT : (Bitpat, Word[N]) -> Bitpat)((p : Bitpat), (a : Word[N]))) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + pat_size(p) && (∀ s : Num, pat_set((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, a), s) == (∃ t : Num, pat_set(p, t) && s == (val : (Word[N]) -> Num)(a) + EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) * t))"),
    t46,
  )
  let (conspat_pat_size, conspat_pat_set) = @bool.conj_pair(
    (fn(
      x33 : (
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
      @tactics.prove(x33.0, x33.1)
    })(t47),
  )
  conspat_pat_size_c.set(conspat_pat_size)
  conspat_pat_set_c.set(conspat_pat_set)
}

///|
/// word1
fn step_15() -> Unit raise {
  word1_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(word1 : (Bool) -> Word[Unit])((p : Bool)) == word(bitval(p))"),
    ),
  )
}

///|
let word1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("word1")

///|
/// `word1`
pub fn word1() -> @kernel.Thm {
  word1_c.get()
}

///|
/// BIT0_WORD1
fn step_16() -> Unit raise {
  let t49 = @simp.rewrite_tac(@list.List([]))
  let t48 = @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t50 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              word1(),
              @words.bit_lsb(),
              @words.bitval(),
              @words.val_word(),
            ]),
          ),
          @cart.dimindex_tac,
        ),
        t48,
      ),
      t49,
    ),
    @int.arith_tac,
  )
  bit0_word1_c.set(
    @tactics.prove(@term_syntax.parse_term("bit(0, word1((b : Bool))) == b"), t50),
  )
}

///|
let bit0_word1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT0_WORD1")

///|
/// `BIT0_WORD1`
pub fn bit0_word1() -> @kernel.Thm {
  bit0_word1_c.get()
}

///|
/// VAL_WORD1
fn step_17() -> Unit raise {
  let t51 = @simp.rewrite_tac(@list.List([word1(), @words.val_word_bitval()]))
  val_word1_c.set(
    @tactics.prove(@term_syntax.parse_term("val(word1((b : Bool))) == bitval(b)"), t51),
  )
}

///|
let val_word1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAL_WORD1")

///|
/// `VAL_WORD1`
pub fn val_word1() -> @kernel.Thm {
  val_word1_c.get()
}

///|
/// WORD1_ODD
fn step_18() -> Unit raise {
  let t56 = @equal.gsym(@arith.not_odd())
  let t57 = @equal.gsym(@arith.odd_mod())
  let t58 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.even_mod()), t57, t56]),
  )
  let t55 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t54 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.odd_mod(),
      @words.bitval_clauses(),
      @arith.exp_1(),
      @int.cong_v1(),
    ]),
  )
  let t53 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((n : Num))"))
  let t52 = @simp.rewrite_tac(
    @list.List([word1(), @words.word_eq(), @cart.dimindex_clauses()]),
  )
  let t59 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t52),
          t53,
        ),
        t54,
      ),
      t55,
    ),
    t58,
  )
  word1_odd_c.set(
    @tactics.prove(@term_syntax.parse_term("word1(ODD((n : Num))) == word(n)"), t59),
  )
}

///|
let word1_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WORD1_ODD")

///|
/// `WORD1_ODD`
pub fn word1_odd() -> @kernel.Thm {
  word1_odd_c.get()
}

///|
let pp_print_bitpat_c : @lib.Cell[
  (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
] = @lib.Cell::new("pp_print_bitpat")

///|
/// `pp_print_bitpat`
pub fn pp_print_bitpat(
  x : @pp.Formatter,
) -> ((@kernel.Term) -> Unit raise) raise {
  pp_print_bitpat_c.get()(x)
}

///|
let pp_print_colored_bitpat_c : @lib.Cell[
  (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
] = @lib.Cell::new("pp_print_colored_bitpat")

///|
/// `pp_print_colored_bitpat`
pub fn pp_print_colored_bitpat(
  x : @pp.Formatter,
) -> ((@kernel.Term) -> Unit raise) raise {
  pp_print_colored_bitpat_c.get()(x)
}

///|
let pp_print_bitmatch_c : @lib.Cell[
  (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
] = @lib.Cell::new("pp_print_bitmatch")

///|
/// `pp_print_bitmatch`
pub fn pp_print_bitmatch(
  x : @pp.Formatter,
) -> ((@kernel.Term) -> Unit raise) raise {
  pp_print_bitmatch_c.get()(x)
}

///|
let pp_print_colored_bitmatch_c : @lib.Cell[
  (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
] = @lib.Cell::new("pp_print_colored_bitmatch")

///|
/// `pp_print_colored_bitmatch`
pub fn pp_print_colored_bitmatch(
  x : @pp.Formatter,
) -> ((@kernel.Term) -> Unit raise) raise {
  pp_print_colored_bitmatch_c.get()(x)
}

///|
/// pp_print_bitpat, pp_print_colored_bitpat, pp_print_bitmatch, pp_print_colored_bitmatch
fn step_22() -> Unit raise {
  let switch_color : (Bool) -> (
    (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
    (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
  ) raise = fn(
    x91 : Bool,
  ) -> (
    (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
    (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise,
  ) raise {
    let _ as use_color = x91
    let pp_term : (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise = if use_color {
      fn(x92 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
        fn(x93 : @kernel.Term) -> Unit raise {
          @printer.pp_print_colored_term(x92, x93)
        }
      }
    } else {
      fn(x94 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
        fn(x95 : @kernel.Term) -> Unit raise {
          @printer.pp_print_term(x94, x95)
        }
      }
    }
    let pp_type : (@pp.Formatter) -> ((@kernel.HolType) -> Unit raise) raise = if use_color {
      fn(x96 : @pp.Formatter) -> ((@kernel.HolType) -> Unit raise) raise {
        fn(x97 : @kernel.HolType) -> Unit raise {
          @printer.pp_print_colored_type(x96, x97)
        }
      }
    } else {
      fn(x98 : @pp.Formatter) -> ((@kernel.HolType) -> Unit raise) raise {
        fn(x99 : @kernel.HolType) -> Unit raise {
          @printer.pp_print_type(x98, x99)
        }
      }
    }
    let pp_resword : (@pp.Formatter) -> ((String) -> Unit raise) raise = if use_color {
      fn(x100 : @pp.Formatter) -> ((String) -> Unit raise) raise {
        fn(x101 : String) -> Unit raise {
          @printer.pp_print_colored_resword(x100, x101)
        }
      }
    } else {
      fn(x102 : @pp.Formatter) -> ((String) -> Unit raise) raise {
        fn(x103 : String) -> Unit raise {
          @pp.Formatter::print_string(x102, x103)
        }
      }
    }
    fn dest_pat_rev(x104 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      let tm = x104
      match tm {
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p),
          a
        ) => dest_pat_rev(p).prepend(a)
        @kernel.Term::Const("NILPAT", _) => @list.List([])
        _ => raise Failure("dest_pat")
      }
    }
    let dest_pat : (@kernel.Term) -> @list.List[@kernel.Term] raise = fn(
      x106 : @kernel.Term,
    ) -> @list.List[@kernel.Term] raise {
      (fn(x105 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.rev(x105)
      })(dest_pat_rev(x106))
    }
    let dest_clause : (@kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise = fn(
      x107 : @kernel.Term,
    ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
      let tm_1 = x107
      match @basics.strip_exists(@basics.body(@basics.body(tm_1))).1 {
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("_UNGUARDED_PATTERN", _), lhs),
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("=", _), res),
            _
          )
        ) =>
          match lhs {
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), pat),
              _
            ) => (dest_pat(pat), res)
            _ => raise Failure("dest_clause")
          }
        _ => raise Failure("dest_clause")
      }
    }
    fn dest_clauses(
      x108 : @kernel.Term,
    ) -> (@list.List[(@list.List[@kernel.Term], @kernel.Term)], @kernel.Term) raise {
      let tm_2 = x108
      match tm_2 {
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("_SEQPATTERN", _), c),
          cs
        ) => {
          let c_1 = dest_clause(c)
          let (l, r) = dest_clauses(cs)
          (l.prepend(c_1), r)
        }
        @kernel.Term::Comb(@kernel.Term::Const("_ELSEPATTERN", _), res_1) =>
          (@list.List([]), res_1)
        _ => raise Failure("dest_clauses")
      }
    }
    let f : (@pp.Formatter) -> (
      (@kernel.Term) -> Unit raise,
      (@kernel.Term) -> Unit raise,
    ) raise = fn(
      x109 : @pp.Formatter,
    ) -> ((@kernel.Term) -> Unit raise, (@kernel.Term) -> Unit raise) raise {
      let fmt = x109
      let unword : (@kernel.HolType) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
        x110 : @kernel.HolType,
      ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
        let i = x110
        fn(x111 : @kernel.Term) -> @kernel.Term raise {
          match x111 {
            @kernel.Term::Comb(@kernel.Term::Const("word", _), a_1) if @nums.is_numeral(
                a_1,
              ) => {
              let t112 = @basics.dest_finty(i)
              let t113 = @num.power_num(@num.num_of_int64(2L), t112)
              if @num.lt_num(@basics.dest_numeral(a_1), t113) {
                a_1
              } else {
                raise Failure("numeral out of range")
              }
            }
            a_2 => a_2
          }
        }
      }
      let print_pat : (@kernel.Term) -> Unit raise = fn(
        x114 : @kernel.Term,
      ) -> Unit raise {
        match x114 {
          @kernel.Term::Comb(@kernel.Term::Const("word1", _), a_3) =>
            pp_term(fmt)(a_3)
          a_4 =>
            match @kernel.type_of(a_4) {
              @kernel.HolType::Tyapp("word", More(i_1, tail=Empty)) => {
                let t115 = unword(i_1)(a_4)
                pp_term(fmt)(t115)
                @pp.Formatter::print_string(fmt, ":")
                pp_type(fmt)(i_1)
              }
              _ => raise Failure("print_pat")
            }
        }
      }
      let print_opat : (@list.List[@kernel.Term]?) -> Unit raise = fn(
        x116 : @list.List[@kernel.Term]?,
      ) -> Unit raise {
        match x116 {
          None => @pp.Formatter::print_string(fmt, "_")
          Some(Empty) => @pp.Formatter::print_string(fmt, "[]")
          Some(More(x, tail=xs)) => {
            @pp.Formatter::print_string(fmt, "[")
            print_pat(x)
            @lib.do_list(
              fn(x117 : @kernel.Term) -> Unit raise {
                let x_1 = x117
                @pp.Formatter::print_string(fmt, "; ")
                print_pat(x_1)
              },
              xs,
            )
            @pp.Formatter::print_string(fmt, "]")
          }
        }
      }
      let print_clause : (@list.List[@kernel.Term]?) -> ((@kernel.Term) -> Unit raise) raise = fn(
        x118 : @list.List[@kernel.Term]?,
      ) -> ((@kernel.Term) -> Unit raise) raise {
        let p_1 = x118
        fn(x119 : @kernel.Term) -> Unit raise {
          let r_1 = x119
          print_opat(p_1)
          @pp.Formatter::print_string(fmt, " -> ")
          pp_term(fmt)(r_1)
        }
      }
      fn print_clauses(
        x120 : @list.List[(@list.List[@kernel.Term], @kernel.Term)],
        x121 : @kernel.Term,
      ) -> Unit raise {
        let cls = x120
        let r_2 = x121
        match (cls, r_2) {
          (More((p_2, res_2), tail=Empty), @kernel.Term::Const("ARB", _)) =>
            print_clause(Some(p_2))(res_2)
          (More((p_3, res_3), tail=cs_1), _) => {
            print_clause(Some(p_3))(res_3)
            @pp.Formatter::print_break(fmt, 1, 0)
            @pp.Formatter::print_string(fmt, "| ")
            print_clauses(cs_1, r_2)
          }
          (Empty, r_3) => print_clause(None)(r_3)
        }
      }
      let pp_print_bitpat : (@kernel.Term) -> Unit raise = fn(
        x122 : @kernel.Term,
      ) -> Unit raise {
        let tm_3 = x122
        let pat_1 = dest_pat(tm_3)
        @pp.Formatter::open_hvbox(fmt, 0)
        @pp.Formatter::print_string(fmt, "(BITPAT")
        @pp.Formatter::print_space(fmt)
        print_opat(Some(pat_1))
        @pp.Formatter::print_string(fmt, ")")
        @pp.Formatter::close_box(fmt)
      }
      let pp_print_bitmatch : (@kernel.Term) -> Unit raise = fn(
        x123 : @kernel.Term,
      ) -> Unit raise {
        match x123 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e),
            c_2
          ) => {
            let (cls_1, r_4) = dest_clauses(c_2)
            @pp.Formatter::open_hvbox(fmt, 0)
            @pp.Formatter::print_string(fmt, "(")
            pp_resword(fmt)("bitmatch ")
            pp_term(fmt)(e)
            pp_resword(fmt)(" with")
            @pp.Formatter::print_break(fmt, 1, 2)
            print_clauses(cls_1, r_4)
            @pp.Formatter::close_box(fmt)
            @pp.Formatter::print_string(fmt, ")")
          }
          _ => raise Failure("print_bitmatch")
        }
      }
      (pp_print_bitpat, pp_print_bitmatch)
    }
    (
      fn(x125 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
        (fn(
          x124 : ((@kernel.Term) -> Unit raise, (@kernel.Term) -> Unit raise),
        ) -> ((@kernel.Term) -> Unit raise) raise {
          x124.0
        })(f(x125))
      },
      fn(x127 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
        (fn(
          x126 : ((@kernel.Term) -> Unit raise, (@kernel.Term) -> Unit raise),
        ) -> ((@kernel.Term) -> Unit raise) raise {
          x126.1
        })(f(x127))
      },
    )
  }
  let (ppbitpat, ppbitmatch) = switch_color(false)
  let (ppbitpatcol, ppbitmatchcol) = switch_color(true)
  let (
    pp_print_bitpat_1,
    pp_print_colored_bitpat,
    pp_print_bitmatch_1,
    pp_print_colored_bitmatch,
  ) = (ppbitpat, ppbitpatcol, ppbitmatch, ppbitmatchcol)
  pp_print_bitpat_c.set(pp_print_bitpat_1)
  pp_print_colored_bitpat_c.set(pp_print_colored_bitpat)
  pp_print_bitmatch_c.set(pp_print_bitmatch_1)
  pp_print_colored_bitmatch_c.set(pp_print_colored_bitmatch)
}

///|
/// print_bitpat
fn step_23() -> Unit raise {
  print_bitpat_c.set(pp_print_bitpat(@pp.std_formatter))
}

///|
let print_bitpat_c : @lib.Cell[(@kernel.Term) -> Unit raise] = @lib.Cell::new(
  "print_bitpat",
)

///|
/// `print_bitpat`
pub fn print_bitpat(x : @kernel.Term) -> Unit raise {
  print_bitpat_c.get()(x)
}

///|
/// string_of_bitpat
fn step_24() -> Unit raise {
  string_of_bitpat_c.set(@printer.print_to_string(pp_print_bitpat))
}

///|
let string_of_bitpat_c : @lib.Cell[(@kernel.Term) -> String raise] = @lib.Cell::new(
  "string_of_bitpat",
)

///|
/// Compact display only. Use `@printer.string_of_term` for ordinary HOL syntax.
pub fn string_of_bitpat(x : @kernel.Term) -> String raise {
  string_of_bitpat_c.get()(x)
}

///|
/// print_bitmatch
fn step_25() -> Unit raise {
  print_bitmatch_c.set(pp_print_bitmatch(@pp.std_formatter))
}

///|
let print_bitmatch_c : @lib.Cell[(@kernel.Term) -> Unit raise] = @lib.Cell::new(
  "print_bitmatch",
)

///|
/// `print_bitmatch`
pub fn print_bitmatch(x : @kernel.Term) -> Unit raise {
  print_bitmatch_c.get()(x)
}

///|
/// string_of_bitmatch
fn step_26() -> Unit raise {
  string_of_bitmatch_c.set(@printer.print_to_string(pp_print_bitmatch))
}

///|
let string_of_bitmatch_c : @lib.Cell[(@kernel.Term) -> String raise] = @lib.Cell::new(
  "string_of_bitmatch",
)

///|
/// Compact display only. Use `@printer.string_of_term` for ordinary HOL syntax.
pub fn string_of_bitmatch(x : @kernel.Term) -> String raise {
  string_of_bitmatch_c.get()(x)
}

///|
/// `dest_word_ty`
pub fn dest_word_ty(x140 : @kernel.HolType) -> @kernel.HolType raise {
  match x140 {
    @kernel.HolType::Tyapp("word", More(i, tail=Empty)) => i
    _ => raise Failure("dest_word_ty")
  }
}

///|
/// SPLIT_IF
fn step_31() -> Unit raise {
  let t141 = @term_syntax.parse_term("((p : Bool) → (a : A) == (t1 : A)) → (!p → a == (t2 : A)) → a == (if p { t1 } else { t2 })")
  let th = @bool.undisch_all(@class.taut(t141))
  split_if_c.set(
    match @kernel.frees(@kernel.concl(th)) {
      More(
        @kernel.Term::Var(_, a) as a_1,
        tail=More(p, tail=More(t1, tail=More(t2, tail=Empty)))
      ) => {
        let tnot = @term_syntax.parse_term("op_tilde")
        fn(
          x142 : @kernel.Term,
        ) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
          let p_p = x142
          fn(x143 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            let th1 = x143
            fn(x144 : @kernel.Thm) -> @kernel.Thm raise {
              let th2 = x144
              let (a_p, t1_p) = @kernel.dest_eq(@kernel.concl(th1))
              let t2_p = @kernel.dest_eq(@kernel.concl(th2)).1
              let t149 = @bool.pinst(
                @list.List([(@kernel.type_of(a_p), a)]),
                @list.List([(p_p, p), (a_p, a_1), (t1_p, t1), (t2_p, t2)]),
                th,
              )
              let t147 = @bool.disch(@kernel.mk_comb(tnot, p_p), th2)
              let t145 = @bool.disch(p_p, th1)
              ((x146 : @kernel.Thm) => @bool.prove_hyp(t145, x146))(
                ((x148 : @kernel.Thm) => @bool.prove_hyp(t147, x148))(t149),
              )
            }
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:295")
    },
  )
}

///|
let split_if_c : @lib.Cell[
  (@kernel.Term) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise,
] = @lib.Cell::new("SPLIT_IF")

///|
/// `SPLIT_IF`
pub fn split_if(
  x : @kernel.Term,
) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  split_if_c.get()(x)
}

///|
/// MATCH_SEQPATTERN
fn step_32() -> Unit raise {
  let t150 = @tactics.then_tac(
    @class.cond_cases_tac,
    @simp.asm_rewrite_tac(@list.List([@pair._match(), @pair._seqpattern()])),
  )
  match_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_MATCH((e : A), _SEQPATTERN((c : (A, B) -> Bool), (cs : (A, B) -> Bool))) == (if (∃ y : B, c(e, y)) { _MATCH(e, c) } else { _MATCH(e, cs) })"),
      t150,
    ),
  )
}

///|
let match_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATCH_SEQPATTERN",
)

///|
/// `MATCH_SEQPATTERN`
pub fn match_seqpattern() -> @kernel.Thm {
  match_seqpattern_c.get()
}

///|
/// BITMATCH_SEQPATTERN
fn step_33() -> Unit raise {
  let t151 = @simp.rewrite_tac(@list.List([_bitmatch(), match_seqpattern()]))
  bitmatch_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_BITMATCH((e : Word[N]), _SEQPATTERN((c : (Num, B) -> Bool), (cs : (Num, B) -> Bool))) == (if (∃ y : B, c(val(e), y)) { _BITMATCH(e, c) } else { _BITMATCH(e, cs) })"),
      t151,
    ),
  )
}

///|
let bitmatch_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITMATCH_SEQPATTERN",
)

///|
/// `BITMATCH_SEQPATTERN`
pub fn bitmatch_seqpattern() -> @kernel.Thm {
  bitmatch_seqpattern_c.get()
}

///|
/// BITMATCH_SEQPATTERN2
fn step_34() -> Unit raise {
  let t152 = @simp.rewrite_tac(@list.List([]))
  let t153 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([bitmatch_seqpattern()])),
      @class.cond_cases_tac,
    ),
    t152,
  )
  bitmatch_seqpattern2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_BITMATCH((e : Word[N]), _SEQPATTERN((c : (Num, B) -> Bool), (cs : (Num, B) -> Bool))) == (if (∃ y : B, c(val(e), y)) { _BITMATCH(e, _SEQPATTERN(c, _ELSEPATTERN(ARB))) } else { _BITMATCH(e, cs) })"),
      t153,
    ),
  )
}

///|
let bitmatch_seqpattern2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITMATCH_SEQPATTERN2",
)

///|
/// `BITMATCH_SEQPATTERN2`
pub fn bitmatch_seqpattern2() -> @kernel.Thm {
  bitmatch_seqpattern2_c.get()
}

///|
/// MATCH_ELSEPATTERN
fn step_35() -> Unit raise {
  let t154 = @metis.metis_tac(@list.List([]))
  let t155 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@pair._match(), _elsepattern()])),
    t154,
  )
  match_elsepattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_MATCH((e : B), _ELSEPATTERN((a : A))) == a"),
      t155,
    ),
  )
}

///|
let match_elsepattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATCH_ELSEPATTERN",
)

///|
/// `MATCH_ELSEPATTERN`
pub fn match_elsepattern() -> @kernel.Thm {
  match_elsepattern_c.get()
}

///|
/// BITMATCH_ELSEPATTERN
fn step_36() -> Unit raise {
  let t156 = @simp.rewrite_tac(@list.List([_bitmatch(), match_elsepattern()]))
  bitmatch_elsepattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_BITMATCH((e : Word[N]), _ELSEPATTERN((a : A))) == a"),
      t156,
    ),
  )
}

///|
let bitmatch_elsepattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITMATCH_ELSEPATTERN",
)

///|
/// `BITMATCH_ELSEPATTERN`
pub fn bitmatch_elsepattern() -> @kernel.Thm {
  bitmatch_elsepattern_c.get()
}

///|
/// pat_extract
fn step_37() -> Unit raise {
  pat_extract_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(pat_extract : (Bitpat, Num, Bool) -> Bool)((p : Bitpat), (i : Num), (b : Bool)) == (∀ n : Num, pat_set(p, n) → numbit(i, n) == b)"),
    ),
  )
}

///|
let pat_extract_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pat_extract")

///|
/// `pat_extract`
pub fn pat_extract() -> @kernel.Thm {
  pat_extract_c.get()
}

///|
/// PAT_EXTRACT_THM
fn step_38() -> Unit raise {
  let t157 = @term_syntax.parse_term("(b : Bool)")
  let t158 = @term_syntax.parse_term("(p : Bitpat)")
  let t159 = @term_syntax.parse_term("(i : Num)")
  let t160 = @term_syntax.parse_term("(m : Num)")
  let t161 = @term_syntax.parse_term("(n : Num)")
  let (n, n_1, m, i, p, b) = (
    @parser.parse_type("N"),
    t161,
    t160,
    t159,
    t158,
    t157,
  )
  let t162 = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let t163 = @term_syntax.parse_term("numbit")
  let t164 = @term_syntax.parse_term("op_plus")
  let t165 = @term_syntax.parse_term("op_lt")
  let (a, lt, pl, nb, di) = (
    @term_syntax.parse_term("(a : Word[N])"),
    t165,
    t164,
    t163,
    t162,
  )
  let t173 = @simp.rewrite_tac(@list.List([@words.bitval()]))
  let t172 = @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t171 = @simp.rewrite_tac(
    @list.List([
      @arith.div_1(),
      @arith.even_add(),
      @equal.gsym(@arith.not_even()),
      @arith.even_double(),
    ]),
  )
  let t170 = @tactics.first_x_assum(fn(
    x167 : @kernel.Thm,
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
    let s168 = @tactics.subst1_tac(x167)
    fn(
      x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s168(x169)
    }
  })
  let t166 = @tactics.repeat_tac(@tactics.strip_tac)
  let t174 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      pat_extract(),
                      @words.numbit(),
                      conspat_pat_set(),
                      word1(),
                      @words.val_word(),
                    ]),
                  ),
                  t166,
                ),
                t170,
              ),
              @cart.dimindex_tac,
            ),
            @calc_num.num_reduce_tac,
          ),
          t171,
        ),
        t172,
      ),
      t173,
    ),
    @int.arith_tac,
  )
  let word1_eq = @tactics.prove(
    @term_syntax.parse_term("pat_extract(CONSPAT((p : Bitpat), word1((b : Bool))), 0, b)"),
    t174,
  )
  let t202 = @simp.rewrite_tac(
    @list.List([@arith.mod_mult(), @arith.add_0(), @arith.mod_mod_refl()]),
  )
  let t201 = @simp.once_rewrite_tac(@list.List([@arith.mult_ac()]))
  let t200 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.mod_mod()]))
  let t197 = @simp.rewrite_rule(@list.List([@equal.gsym(@arith.le_suc_lt())]))
  let t195 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m + (n - m) == n")),
  )
  let t199 = @tactics.first_x_assum(fn(
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
    (fn(
      x196 : @kernel.Thm,
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
        x194 : @kernel.Thm,
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
          let s192 = @tactics.subst1_tac(x191)
          fn(
            x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s192(x193)
          }
        })(@equal.gsym(x194))
      })(t195(x196))
    })(t197(x198))
  })
  let t190 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@arith.mod_add_mod())]),
  )
  let t189 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]),
  )
  let t188 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t187 = @simp.rewrite_tac(
    @list.List([@words.val_word(), @arith.odd_mod(), @arith.div_mod()]),
  )
  let t186 = @tactics.first_x_assum(fn(
    x183 : @kernel.Thm,
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
    let s184 = @tactics.subst1_tac(x183)
    fn(
      x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s184(x185)
    }
  })
  let t182 = @tactics.repeat_tac(@tactics.strip_tac)
  let t181 = @simp.rewrite_tac(
    @list.List([pat_extract(), conspat_pat_set(), @words.numbit()]),
  )
  let t180 = @tactics.repeat_tac(
    @tactics.disch_then(fn(
      x179 : @kernel.Thm,
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
        x176 : @kernel.Thm,
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
        let s177 = @tactics.subst1_tac(x176)
        fn(
          x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s177(x178)
        }
      })(@equal.sym(x179))
    }),
  )
  let t203 = @tactics.then_tac(
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
                                  @simp.rewrite_tac(@list.List([])),
                                  t180,
                                ),
                                t181,
                              ),
                              t182,
                            ),
                            t186,
                          ),
                          t187,
                        ),
                        @tactics.ap_thm_tac,
                      ),
                      @tactics.ap_term_tac,
                    ),
                    @tactics.ap_thm_tac,
                  ),
                  @tactics.ap_term_tac,
                ),
                t188,
              ),
              t189,
            ),
            t190,
          ),
          t199,
        ),
        t200,
      ),
      t201,
    ),
    t202,
  )
  let t204 = (
    @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == (n : Num) → numbit((i : Num), (m : Num)) == (b : Bool) → (i < n) == true → pat_extract((CONSPAT : (Bitpat, Word[N]) -> Bitpat)((p : Bitpat), (word : (Num) -> Word[N])(m)), i, b)"),
    t203,
  )
  let word_lt = @bool.undisch_all(
    (fn(
      x175 : (
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
      @tactics.prove(x175.0, x175.1)
    })(t204),
  )
  let t223 = @impconv.imp_rewrite_tac(
    @list.List([
      @arith.div_mult_add(),
      @arith.div_lt(),
      @arith.add(),
      @words.val_bound(),
      @calc_num.exp_2_ne_0(),
    ]),
  )
  let t222 = @simp.rewrite_tac(
    @list.List([@arith.exp_add(), @equal.gsym(@arith.div_div())]),
  )
  let t221 = @simp.rewrite_tac(
    @list.List([
      @bool.specl(
        @list.List([m, @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")]),
        @arith.add_sym(),
      ),
    ]),
  )
  let t220 = @tactics.pop_assum(fn(
    x216 : @kernel.Thm,
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
    let th = x216
    @tactics.pop_assum(fn(
      x218 : @kernel.Thm,
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
      let f = x218
      @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(f)(th))]))
    })
  })
  let t215 = @tactics.first_x_assum(fn(
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
    let s213 = @tactics.subst1_tac(x212)
    fn(
      x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s213(x214)
    }
  })
  let t211 = @tactics.repeat_tac(@tactics.strip_tac)
  let t210 = @simp.rewrite_tac(
    @list.List([pat_extract(), conspat_pat_set(), @words.numbit()]),
  )
  let t224 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(
                        @tactics.disch_then(fn(
                          x209 : @kernel.Thm,
                        ) -> ((
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ) -> (
                          (
                            @list.List[@kernel.Term],
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                          ),
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
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
                            x206 : @kernel.Thm,
                          ) -> ((
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ) -> (
                            (
                              @list.List[@kernel.Term],
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                            ),
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise) raise {
                            let s207 = @tactics.subst1_tac(x206)
                            fn(
                              x208 : (
                                @list.List[(String, @kernel.Thm)],
                                @kernel.Term,
                              ),
                            ) -> (
                              (
                                @list.List[@kernel.Term],
                                (
                                  @list.List[(Int64, @kernel.Term)],
                                  @list.List[(@kernel.Term, @kernel.Term)],
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                              ),
                              @list.List[
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ],
                              (
                                (
                                  @list.List[(Int64, @kernel.Term)],
                                  @list.List[(@kernel.Term, @kernel.Term)],
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                                @list.List[@kernel.Thm],
                              ) -> @kernel.Thm raise,
                            ) raise {
                              s207(x208)
                            }
                          })(@equal.sym(x209))
                        }),
                      ),
                      t210,
                    ),
                    t211,
                  ),
                  t215,
                ),
                t220,
              ),
              t221,
            ),
            t222,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t223,
  )
  let t225 = (
    @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == (n : Num) → (m : Num) + n == (i : Num) → pat_extract((p : Bitpat), m, (b : Bool)) → pat_extract((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, (a : Word[N])), i, b)"),
    t224,
  )
  let word_skip = @bool.undisch_all(
    (fn(
      x205 : (
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
      @tactics.prove(x205.0, x205.1)
    })(t225),
  )
  fn go(x226 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
    match x226 {
      (
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p_p),
          a_p
        ),
        i_p,
      ) => {
        let i_p_p = @basics.dest_numeral(i_p)
        let aty = @kernel.type_of(a_p)
        match aty {
          @kernel.HolType::Tyapp(_, More(n_p, tail=Empty)) => {
            let n_p_p = @basics.dest_finty(n_p)
            if @num.lt_num(i_p_p, n_p_p) {
              match a_p {
                @kernel.Term::Comb(@kernel.Term::Const("word1", _), b_p) =>
                  @kernel.inst_rule(@list.List([(p_p, p), (b_p, b)]), word1_eq)
                @kernel.Term::Comb(@kernel.Term::Const("word", _), m_p) if @nums.is_numeral(
                    m_p,
                  ) => {
                  let th_1 = @kernel.inst_type(@list.List([(n_p, n)]), word_lt)
                  let th1 = @cart.dimindex_conv(
                    @kernel.inst(@list.List([(n_p, n)]), di),
                  )
                  let n_p_1 = @equal.rhs(@kernel.concl(th1))
                  let th2 = @words.numbit_conv(
                    @kernel.mk_comb(@kernel.mk_comb(nb, i_p), m_p),
                  )
                  let b_p_1 = @equal.rhs(@kernel.concl(th2))
                  let th3 = @calc_num.num_lt_conv(
                    @kernel.mk_comb(@kernel.mk_comb(lt, i_p), n_p_1),
                  )
                  let t231 = @kernel.inst_rule(
                    @list.List([
                      (i_p, i),
                      (m_p, m),
                      (n_p_1, n_1),
                      (p_p, p),
                      (b_p_1, b),
                    ]),
                    th_1,
                  )
                  (fn(x229 : @kernel.Thm) -> @kernel.Thm raise {
                    ((x227 : @kernel.Thm) => @bool.prove_hyp(th3, x227))(
                      ((x228 : @kernel.Thm) => @bool.prove_hyp(th2, x228))(x229),
                    )
                  })(((x230 : @kernel.Thm) => @bool.prove_hyp(th1, x230))(t231))
                }
                _ =>
                  raise Failure(
                    "PAT_EXTRACT_THM: not a constant at this position",
                  )
              }
            } else {
              let th_2 = @kernel.inst_type(@list.List([(n_p, n)]), word_skip)
              let th1_1 = @cart.dimindex_conv(
                @kernel.inst(@list.List([(n_p, n)]), di),
              )
              let n_p_2 = @equal.rhs(@kernel.concl(th1_1))
              let m_p_1 = @nums.mk_numeral(@num.sub_num(i_p_p, n_p_p))
              let th2_1 = @calc_num.num_add_conv(
                @kernel.mk_comb(@kernel.mk_comb(pl, m_p_1), n_p_2),
              )
              let th3_1 = go((p_p, m_p_1))
              let b_p_2 = @kernel.rand(@kernel.concl(th3_1))
              let t236 = @kernel.inst_rule(
                @list.List([
                  (i_p, i),
                  (m_p_1, m),
                  (n_p_2, n_1),
                  (p_p, p),
                  (b_p_2, b),
                  (a_p, @kernel.mk_var("a", aty)),
                ]),
                th_2,
              )
              (fn(x234 : @kernel.Thm) -> @kernel.Thm raise {
                ((x232 : @kernel.Thm) => @bool.prove_hyp(th3_1, x232))(
                  ((x233 : @kernel.Thm) => @bool.prove_hyp(th2_1, x233))(x234),
                )
              })(((x235 : @kernel.Thm) => @bool.prove_hyp(th1_1, x235))(t236))
            }
          }
          _ => raise @lib.MatchFailure("tscript.ml:375")
        }
      }
      _ => raise Failure("PAT_EXTRACT_THM: out of range")
    }
  }
  pat_extract_thm_c.set(go)
}

///|
let pat_extract_thm_c : @lib.Cell[
  ((@kernel.Term, @kernel.Term)) -> @kernel.Thm raise,
] = @lib.Cell::new("PAT_EXTRACT_THM")

///|
/// `PAT_EXTRACT_THM`
pub fn pat_extract_thm(x : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
  pat_extract_thm_c.get()(x)
}

///|
/// pat_to_bit
fn step_39() -> Unit raise {
  let t237 = @kernel.assume_rule(@term_syntax.parse_term("pat_extract((p : Bitpat), (i : Num), (b : Bool))"))
  let a = @simp.pure_rewrite_rule(@list.List([pat_extract()]))(t237)
  let a_1 = @bool.undisch(@bool.spec(@term_syntax.parse_term("val((e : Word[N]))"), a))
  let th = @kernel.trans(@equal.sym(@words.numbit_val()), a_1)
  let t239 = @term_syntax.parse_term("(b : Bool)")
  let t240 = @bool.eqf_elim(
    @kernel.inst_rule(@list.List([(@term_syntax.parse_term("false"), t239)]), th),
  )
  let t238 = @term_syntax.parse_term("(b : Bool)")
  let (tht_pos, thf_pos) = (
    @bool.eqt_elim(
      @kernel.inst_rule(@list.List([(@term_syntax.parse_term("true"), t238)]), th),
    ),
    t240,
  )
  let f : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x241 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let x = x241
    fn(x242 : @kernel.Thm) -> @kernel.Thm raise {
      let y = x242
      let t243 = @bool.mp(@bool.not_elim(x), y)
      @bool.not_intro(
        @bool.disch(@term_syntax.parse_term("pat_set((p : Bitpat), val((e : Word[N])))"), t243),
      )
    }
  }
  let t244 = @kernel.assume_rule(@term_syntax.parse_term("bit((i : Num), (e : Word[N]))"))
  let t245 = f(thf_pos)(t244)
  let (tht_neg, thf_neg) = (
    f(@kernel.assume_rule(@term_syntax.parse_term("!bit((i : Num), (e : Word[N]))")))(tht_pos),
    t245,
  )
  let t246 = @term_syntax.parse_term("(p : Bitpat)")
  let t247 = @term_syntax.parse_term("(e : Word[N])")
  let t248 = @term_syntax.parse_term("(i : Num)")
  let (n, i, e, p) = (@parser.parse_type("N"), t248, t247, t246)
  pat_to_bit_c.set(fn(
    x249 : Bool,
  ) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let pos = x249
    fn(x250 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let i_p = x250
      fn(x251 : @kernel.Term) -> @kernel.Thm raise {
        match x251 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), p_p),
            @kernel.Term::Comb(
              @kernel.Term::Const(
                "val",
                @kernel.HolType::Tyapp(
                  _,
                  More(
                    @kernel.HolType::Tyapp(_, More(n_p, tail=Empty)),
                    tail=More(_, tail=Empty)
                  )
                )
              ),
              e_p
            )
          ) => {
            let thp = pat_extract_thm((p_p, i_p))
            let th_1 = match @kernel.rand(@kernel.concl(thp)) {
              @kernel.Term::Const("T", _) => if pos { tht_pos } else { tht_neg }
              @kernel.Term::Const("F", _) => if pos { thf_pos } else { thf_neg }
              _ => raise Failure("pat_to_bit")
            }
            @bool.prove_hyp(
              thp,
              @bool.pinst(
                @list.List([(n_p, n)]),
                @list.List([(i_p, i), (e_p, e), (p_p, p)]),
                th_1,
              ),
            )
          }
          _ => raise Failure("pat_to_bit")
        }
      }
    }
  })
}

///|
let pat_to_bit_c : @lib.Cell[
  (Bool) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
] = @lib.Cell::new("pat_to_bit")

///|
/// `pat_to_bit`
pub fn pat_to_bit(
  x : Bool,
) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  pat_to_bit_c.get()(x)
}

///|
/// `bm_analyze_pat`
pub fn bm_analyze_pat(
  x252 : Int64,
) -> ((@kernel.Term) -> FixedArray[Bool?] raise) raise {
  let sz = x252
  let a = @lib.array_make(sz, None)
  fn go(x254 : Int64, x255 : @kernel.Term) -> Unit raise {
    let i = x254
    match x255 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p),
        a_1
      ) => {
        let n = @num.int63_of_num(
          @basics.dest_finty(dest_word_ty(@kernel.type_of(a_1))),
        )
        if @lib.add63(i, n) > sz {
          raise @num.InvalidArgument("incorrect bit length")
        } else {
          match
            (match a_1 {
              @kernel.Term::Comb(@kernel.Term::Const("word1", _), a_2) =>
                @lib.array_set(
                  a,
                  @lib.int63_to_int(i),
                  match a_2 {
                    @kernel.Term::Const("T", _) => Some(true)
                    @kernel.Term::Const("F", _) => Some(false)
                    @kernel.Term::Var(_, _) => None
                    _ => raise Failure("bm_analyze_pat")
                  },
                )
              @kernel.Term::Comb(
                @kernel.Term::Const("word", _),
                @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), a_3)
              ) => {
                fn analyze_num(
                  x256 : Int64,
                  x257 : @kernel.Term,
                ) -> Unit raise {
                  let n_1 = x256
                  let a_4 = x257
                  match a_4 {
                    @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), a_5) => {
                      @lib.array_set(a, @lib.int63_to_int(n_1), Some(false))
                      analyze_num(@lib.add63(n_1, 1L), a_5)
                    }
                    @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), a_6) => {
                      @lib.array_set(a, @lib.int63_to_int(n_1), Some(true))
                      analyze_num(@lib.add63(n_1, 1L), a_6)
                    }
                    @kernel.Term::Const("_0", _) => {
                      let t258 = Some(false)
                      @lib.array_fill(
                        a,
                        @lib.int63_to_int(n_1),
                        @lib.int63_to_int(@lib.sub63(sz, n_1)),
                        t258,
                      )
                    }
                    _ => raise Failure("bm_analyze_pat")
                  }
                }
                analyze_num(i, a_3)
              }
              @kernel.Term::Var(_, _) =>
                @lib.array_fill(
                  a,
                  @lib.int63_to_int(i),
                  @lib.int63_to_int(n),
                  None,
                )
              _ => raise Failure("bm_analyze_pat")
            }) {
            _ => go(@lib.add63(i, n), p)
          }
        }
      }
      @kernel.Term::Const("NILPAT", _) =>
        if i == sz {
          ()
        } else {
          raise @num.InvalidArgument("incorrect bit length")
        }
      @kernel.Term::Abs(_, c) => go(i, c)
      @kernel.Term::Comb(@kernel.Term::Const("?", _), c_1) => go(i, c_1)
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_UNGUARDED_PATTERN", _), c_2),
        _
      ) => go(i, c_2)
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), c_3),
        _
      ) => go(i, c_3)
      _ => raise Failure("bm_analyze_pat")
    }
  }
  fn(x259 : @kernel.Term) -> FixedArray[Bool?] raise {
    let pat = x259
    try {
      go(0L, pat)
      a
    } catch {
      @num.InvalidArgument(_) =>
        raise Failure(
          "bm_analyze_pat: pattern " +
          @printer.string_of_term(pat) +
          " has incorrect bit length",
        )
      e => raise e
    }
  }
}

///|
/// `bm_analyze_clauses`
pub fn bm_analyze_clauses(
  x260 : Int64,
  x261 : @kernel.Term,
) -> @list.List[FixedArray[Bool?]] raise {
  let sz = x260
  match x261 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_SEQPATTERN", _), c),
      cs
    ) => {
      let pat = (fn(x267 : @kernel.Term) -> @kernel.Term raise {
        (fn(x266 : @kernel.Term) -> @kernel.Term raise {
          (fn(
            x264 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            (fn(x262 : @kernel.Term) -> @kernel.Term raise {
              @equal.lhand(@equal.lhand(x262))
            })(
              (fn(
                x263 : (@list.List[@kernel.Term], @kernel.Term),
              ) -> @kernel.Term raise {
                x263.1
              })(x264),
            )
          })(
            (fn(
              x265 : @kernel.Term,
            ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
              @basics.strip_exists(x265)
            })(x266),
          )
        })(@basics.body(x267))
      })(@basics.body(c))
      let t268 = bm_analyze_clauses(sz, cs)
      t268.prepend(bm_analyze_pat(sz)(pat))
    }
    _ => @list.List([])
  }
}

///|
/// bm_skip_clause
fn step_40() -> Unit raise {
  let t272 = @simp.asm_rewrite_tac(@list.List([]))
  let t271 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t270 = @simp.rewrite_tac(@list.List([bitmatch_seqpattern()]))
  let t273 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t270),
      t271,
    ),
    t272,
  )
  let t274 = (
    @term_syntax.parse_term("op_q((r : (Num, B) -> Bool)(val((e : Word[N])))) == false → _BITMATCH(e, _SEQPATTERN(r, (rs : (Num, B) -> Bool))) == _BITMATCH(e, rs)"),
    t273,
  )
  let th = @bool.undisch(
    (fn(
      x269 : (
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
      @tactics.prove(x269.0, x269.1)
    })(t274),
  )
  let t275 = @term_syntax.parse_term("(rs : (Num, B) -> Bool)")
  let t276 = @term_syntax.parse_term("(r : (Num, B) -> Bool)")
  let t277 = @term_syntax.parse_term("(e : Word[N])")
  let t278 = @parser.parse_type("B")
  let (n, b, e, r, rs) = (@parser.parse_type("N"), t278, t277, t276, t275)
  let t280 = @tactics.then_tac(
    @tactics.disch_tac,
    @simp.asm_rewrite_tac(@list.List([])),
  )
  let t281 = (@term_syntax.parse_term("(P : (A) -> Bool) == ((x : A) => false) → op_q(P) == false"), t280)
  let th1 = @bool.undisch(
    (fn(
      x279 : (
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
      @tactics.prove(x279.0, x279.1)
    })(t281),
  )
  let a = @parser.parse_type("A")
  let p = @term_syntax.parse_term("(P : (A) -> Bool)")
  let strip_ex : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x282 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let x = x282
    fn(x283 : @kernel.Thm) -> @kernel.Thm raise {
      let th_1 = x283
      let th_p = @kernel.abs_rule(x, th_1)
      let t284 = @list.List([(@equal.lhs(@kernel.concl(th_p)), p)])
      @bool.prove_hyp(
        th_p,
        @bool.pinst(@list.List([(@kernel.type_of(x), a)]), t284, th1),
      )
    }
  }
  let t286 = @tactics.then_tac(
    @tactics.disch_tac,
    @simp.asm_rewrite_tac(@list.List([@pair._unguarded_pattern()])),
  )
  let t287 = (@term_syntax.parse_term("!(A : Bool) → _UNGUARDED_PATTERN(A, (B : Bool)) == false"), t286)
  let th_2 = @bool.undisch(
    (fn(
      x285 : (
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
      @tactics.prove(x285.0, x285.1)
    })(t287),
  )
  let a_1 = @term_syntax.parse_term("(A : Bool)")
  let b_1 = @term_syntax.parse_term("(B : Bool)")
  let skip_guard : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x288 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let a_p = x288
    fn(x289 : @kernel.Term) -> @kernel.Thm raise {
      let b_p = x289
      @kernel.inst_rule(@list.List([(a_p, a_1), (b_p, b_1)]), th_2)
    }
  }
  bm_skip_clause_c.set(fn(
    x290 : (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let f = x290
    fn(x291 : @kernel.Term) -> @kernel.Thm raise {
      match x291 {
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", ty), e_p),
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("_SEQPATTERN", _), c),
            rs_p
          )
        ) =>
          match @basics.dest_fun_ty(ty) {
            (
              @kernel.HolType::Tyapp(_, More(n_p, tail=Empty)),
              @kernel.HolType::Tyapp(_, More(_, tail=More(b_p_1, tail=Empty))),
            ) => {
              let th_3 = @bool.pinst(
                @list.List([(n_p, n), (b_p_1, b)]),
                @list.List([(e_p, e), (c, r), (rs_p, rs)]),
                th,
              )
              let (ex, h) = @kernel.dest_comb(
                @equal.lhs(@lib.hd(@kernel.hyp(th_3))),
              )
              let th2 = @equal.beta_conv(h)
              let th3 = @equal.ap_term(ex, th2)
              fn skip_exs(x292 : @kernel.Term) -> @kernel.Thm raise {
                match x292 {
                  @kernel.Term::Comb(
                    @kernel.Term::Const("?", _),
                    @kernel.Term::Abs(y, c_1)
                  ) => {
                    let t293 = skip_exs(c_1)
                    strip_ex(y)(t293)
                  }
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(
                      @kernel.Term::Const("_UNGUARDED_PATTERN", _),
                      p_1
                    ),
                    res
                  ) => {
                    let t294 = skip_guard(p_1)(res)
                    @bool.prove_hyp(f(p_1), t294)
                  }
                  _ => raise Failure("skip_exs")
                }
              }
              @bool.prove_hyp(
                @kernel.trans(th3, skip_exs(@equal.rhs(@kernel.concl(th3)))),
                th_3,
              )
            }
            _ => raise @lib.MatchFailure("tscript.ml:514")
          }
        _ => raise Failure("bm_skip_clause")
      }
    }
  })
}

///|
let bm_skip_clause_c : @lib.Cell[
  ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("bm_skip_clause")

///|
/// `bm_skip_clause`
pub fn bm_skip_clause(
  x : (@kernel.Term) -> @kernel.Thm raise,
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  bm_skip_clause_c.get()(x)
}

///|
/// `discrim_tree`
pub(all) enum DiscrimTree[TA] {
  Leaf_dt(TA)
  Split_dt(Int64, @kernel.Term, DiscrimTree[TA], DiscrimTree[TA])
} derive(Eq, Debug)

///|
pub extend DiscrimTree with Eq::{not_equal, equal}

///|
pub extend DiscrimTree with Debug::{to_repr}

///|
pub extend DiscrimTree with @lib.OCompare::{ocompare}

///|
pub extend DiscrimTree with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_DiscrimTree(x : DiscrimTree[TA]) -> Int {
  match x {
    Leaf_dt(_) => 1000000
    Split_dt(_, _, _, _) => 1000001
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for DiscrimTree[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Leaf_dt(a0), Leaf_dt(b0)) => @lib.compare(a0, b0)
    (Split_dt(a0, a1, a2, a3), Split_dt(b0, b1, b2, b3)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a2, b2)
      if c != 0 {
        return c
      }
      @lib.compare(a3, b3)
    }
    _ => ocaml_rank_DiscrimTree(self).compare(ocaml_rank_DiscrimTree(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for DiscrimTree[TA] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Leaf_dt(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Split_dt(a0, a1, a2, a3) => {
      h.block(1, 4)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
    }
  }
}

///|
/// `map_dt`
pub fn[TA, TB] map_dt(
  x295 : (TB) -> TA raise,
  x296 : DiscrimTree[TB],
) -> DiscrimTree[TA] raise {
  let f = x295
  match x296 {
    DiscrimTree::Leaf_dt(a) => DiscrimTree::Leaf_dt(f(a))
    DiscrimTree::Split_dt(i, bit, tr1, tr2) => {
      let t297 = map_dt(f, tr2)
      DiscrimTree::Split_dt(i, bit, map_dt(f, tr1), t297)
    }
  }
}

///|
/// bm_build_tree'
fn step_41() -> Unit raise {
  let n = @parser.parse_type("N")
  let bit_tm : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x298 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let i = x298
    fn(x299 : @kernel.Term) -> @kernel.Term raise {
      let e = x299
      match @kernel.type_of(e) {
        @kernel.HolType::Tyapp("word", More(n_p, tail=Empty)) => {
          let bit = @kernel.mk_const("bit", @list.List([(n_p, n)]))
          @kernel.mk_comb(@kernel.mk_comb(bit, i), e)
        }
        _ => raise @lib.MatchFailure("tscript.ml:540")
      }
    }
  }
  let t301 = @tactics.then_tac(
    @tactics.disch_tac,
    @simp.asm_rewrite_tac(@list.List([bitmatch_seqpattern()])),
  )
  let t302 = (
    @term_syntax.parse_term("_BITMATCH((e : Word[N]), (rs1 : (Num, B) -> Bool)) == _BITMATCH(e, (rs2 : (Num, B) -> Bool)) → _BITMATCH(e, _SEQPATTERN((r : (Num, B) -> Bool), rs1)) == _BITMATCH(e, _SEQPATTERN(r, rs2))"),
    t301,
  )
  let th = @bool.undisch(
    (fn(
      x300 : (
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
      @tactics.prove(x300.0, x300.1)
    })(t302),
  )
  let seqp_rand : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = match
    @kernel.frees(@kernel.concl(th)) {
    More(rs1, tail=More(e_1, tail=More(r, tail=More(rs2, tail=Empty)))) => {
      let t303 = @parser.parse_type("B")
      let (n_1, b) = (@parser.parse_type("N"), t303)
      fn(x304 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let r_p = x304
        fn(x305 : @kernel.Thm) -> @kernel.Thm raise {
          let th_p = x305
          match @kernel.dest_eq(@kernel.concl(th_p)) {
            (
              @kernel.Term::Comb(
                @kernel.Term::Comb(@kernel.Term::Const(_, ty), e_p),
                rs1_p
              ),
              @kernel.Term::Comb(_, rs2_p),
            ) =>
              match @basics.dest_fun_ty(ty) {
                (
                  @kernel.HolType::Tyapp(_, More(n_p_1, tail=Empty)),
                  @kernel.HolType::Tyapp(_, More(_, tail=More(b_p, tail=Empty))),
                ) =>
                  @bool.prove_hyp(
                    th_p,
                    @bool.pinst(
                      @list.List([(n_p_1, n_1), (b_p, b)]),
                      @list.List([
                        (e_p, e_1),
                        (r_p, r),
                        (rs1_p, rs1),
                        (rs2_p, rs2),
                      ]),
                      th,
                    ),
                  )
                _ => raise @lib.MatchFailure("tscript.ml:556")
              }
            _ => raise Failure("seqp_rand")
          }
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:552")
  }
  let amerge : ((Int64, Int64)?) -> ((Bool?) -> (Int64, Int64)? raise) raise = fn(
    x306 : (Int64, Int64)?,
  ) -> ((Bool?) -> (Int64, Int64)? raise) raise {
    let a = x306
    fn(x307 : Bool?) -> (Int64, Int64)? raise {
      let b_1 = x307
      match (a, b_1) {
        (None, _) => a
        (_, None) => None
        (Some((a0, a1)), Some(false)) => Some((@lib.add63(a0, 1L), a1))
        (Some((a0_1, a1_1)), Some(true)) => Some((a0_1, @lib.add63(a1_1, 1L)))
      }
    }
  }
  bm_build_tree_p_c.set(fn(
    x308 : Int64,
  ) -> ((@list.List[FixedArray[Bool?]]) -> ((@kernel.Term) -> DiscrimTree[
    @kernel.Thm,
  ] raise) raise) raise {
    let sz = x308
    fn(
      x309 : @list.List[FixedArray[Bool?]],
    ) -> ((@kernel.Term) -> DiscrimTree[@kernel.Thm] raise) raise {
      let cls = x309
      fn(x310 : @kernel.Term) -> DiscrimTree[@kernel.Thm] raise {
        match x310 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e_2) as m,
            cs
          ) as tm => {
            fn build(
              x311 : @kernel.Thm,
              x312 : @list.List[FixedArray[Bool?]],
              x313 : @kernel.Term,
            ) -> DiscrimTree[@kernel.Thm] raise {
              let eqth = x311
              let cls_1 = x312
              let cs_1 = x313
              let analysis = @lib.array_make(sz, Some((0L, 0L)))
              let _ = @lib.do_list(
                fn(x316 : FixedArray[Bool?]) -> Unit raise {
                  @lib.array_iteri(
                    fn(x314 : Int64, x315 : Bool?) -> Unit raise {
                      let i_1 = x314
                      let a_1 = x315
                      @lib.array_set(
                        analysis,
                        @lib.int63_to_int(i_1),
                        amerge(@lib.array_get(analysis, @lib.int63_to_int(i_1)))(
                          a_1,
                        ),
                      )
                    },
                    x316,
                  )
                },
                cls_1,
              )
              let r_1 = Ref::{ val: None, }
              let f : (Int64) -> (((Int64, Int64)?) -> Unit raise) raise = fn(
                x317 : Int64,
              ) -> (((Int64, Int64)?) -> Unit raise) raise {
                let i_2 = x317
                fn(x318 : (Int64, Int64)?) -> Unit raise {
                  let a_2 = x318
                  match a_2 {
                    Some((n1, n2)) if !physical_equal(n1, 0L) &&
                      !physical_equal(n2, 0L) => {
                      let v = @lib.abs63(@lib.sub63(n1, n2))
                      match r_1.val {
                        Some((v_p, _)) if v_p <= v => ()
                        _ => {
                          r_1.val = Some((v, i_2))
                          ()
                        }
                      }
                    }
                    _ => ()
                  }
                }
              }
              @lib.array_iteri(
                fn(x319 : Int64, x320 : (Int64, Int64)?) -> Unit raise {
                  let s321 = f(x319)
                  s321(x320)
                },
                analysis,
              )
              let r_2 = r_1.val
              match r_2 {
                None => DiscrimTree::Leaf_dt(eqth)
                Some((_, i_3)) => {
                  let ii = @nums.mk_numeral(@num.num_of_int64(i_3))
                  let bit_1 = bit_tm(ii)(e_2)
                  let skip_th : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
                    x322 : @kernel.Term,
                  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                    let sc = x322
                    fn(x323 : @kernel.Thm) -> @kernel.Thm raise {
                      let th_1 = x323
                      let (sm, rs_p) = @kernel.dest_comb(
                        @equal.lhs(@kernel.concl(th_1)),
                      )
                      let tm_1 = @kernel.mk_comb(sm, @kernel.mk_comb(sc, rs_p))
                      @kernel.trans(
                        bm_skip_clause(pat_to_bit(false)(ii))(tm_1),
                        th_1,
                      )
                    }
                  }
                  fn split_ths(
                    x324 : (@list.List[FixedArray[Bool?]], @kernel.Term),
                  ) -> (
                    @list.List[FixedArray[Bool?]],
                    @list.List[FixedArray[Bool?]],
                    @kernel.Thm,
                    @kernel.Thm,
                  ) raise {
                    match x324 {
                      (Empty, cs_2) => {
                        let th_2 = @kernel.refl(@kernel.mk_comb(m, cs_2))
                        (@list.List([]), @list.List([]), th_2, th_2)
                      }
                      (
                        More(cl, tail=cls_2),
                        @kernel.Term::Comb(
                          @kernel.Term::Comb(
                            @kernel.Term::Const("_SEQPATTERN", _),
                            c
                          ) as sc_1,
                          cs_3
                        ),
                      ) => {
                        let (cls1, cls2, th1, th2) = split_ths((cls_2, cs_3))
                        if (match @lib.array_get(cl, @lib.int63_to_int(i_3)) {
                            Some(b_2) => b_2
                            _ => raise @lib.MatchFailure("tscript.ml:595")
                          }) {
                          let t325 = seqp_rand(c)(th2)
                          (cls1, cls2.prepend(cl), skip_th(sc_1)(th1), t325)
                        } else {
                          let t326 = skip_th(sc_1)(th2)
                          (cls1.prepend(cl), cls2, seqp_rand(c)(th1), t326)
                        }
                      }
                      (More(cl_1, tail=cls_3), cs_4) => {
                        let (cls1_1, cls2_1, th1_1, th2_1) = split_ths(
                          (cls_3, cs_4),
                        )
                        if (match @lib.array_get(cl_1, @lib.int63_to_int(i_3)) {
                            Some(b_3) => b_3
                            _ => raise @lib.MatchFailure("tscript.ml:601")
                          }) {
                          (cls1_1, cls2_1.prepend(cl_1), th1_1, th2_1)
                        } else {
                          (cls1_1.prepend(cl_1), cls2_1, th1_1, th2_1)
                        }
                      }
                      _ => raise Failure("split_ths")
                    }
                  }
                  let (cls1_2, cls2_2, th1_2, th2_2) = split_ths((cls_1, cs_1))
                  let t327 = @kernel.rand(@equal.rhs(@kernel.concl(th1_2)))
                  let tr1 = build(@kernel.trans(eqth, th1_2), cls1_2, t327)
                  let t328 = @kernel.rand(@equal.rhs(@kernel.concl(th2_2)))
                  let tr2 = build(@kernel.trans(eqth, th2_2), cls2_2, t328)
                  DiscrimTree::Split_dt(i_3, bit_1, tr1, tr2)
                }
              }
            }
            build(@kernel.refl(tm), cls, cs)
          }
          _ => raise Failure("bm_build_tree'")
        }
      }
    }
  })
}

///|
let bm_build_tree_p_c : @lib.Cell[
  (Int64) -> ((@list.List[FixedArray[Bool?]]) -> ((@kernel.Term) -> DiscrimTree[
    @kernel.Thm,
  ] raise) raise) raise,
] = @lib.Cell::new("bm_build_tree'")

///|
/// `bm_build_tree'`
pub fn bm_build_tree_p(
  x : Int64,
) -> ((@list.List[FixedArray[Bool?]]) -> ((@kernel.Term) -> DiscrimTree[
  @kernel.Thm,
] raise) raise) raise {
  bm_build_tree_p_c.get()(x)
}

///|
/// `bm_build_tree`
pub fn bm_build_tree(
  x329 : @kernel.Term,
) -> (@list.List[FixedArray[Bool?]], DiscrimTree[@kernel.Thm]) raise {
  match x329 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e),
      cs
    ) as tm => {
      let sz = @num.int63_of_num(
        @basics.dest_finty(dest_word_ty(@kernel.type_of(e))),
      )
      let cls = bm_analyze_clauses(sz, cs)
      (cls, bm_build_tree_p(sz)(cls)(tm))
    }
    _ => raise Failure("bm_build_tree")
  }
}

///|
/// BM_IF_CONV
fn step_42() -> Unit raise {
  fn of_tree(x330 : DiscrimTree[@kernel.Thm]) -> @kernel.Thm raise {
    match x330 {
      DiscrimTree::Leaf_dt(th) => th
      DiscrimTree::Split_dt(_, bit, tr1, tr2) => {
        let t331 = of_tree(tr1)
        let t332 = of_tree(tr2)
        split_if(bit)(t332)(t331)
      }
    }
  }
  bm_if_conv_c.set(fn(x335 : @kernel.Term) -> @kernel.Thm raise {
    (fn(
      x334 : (@list.List[FixedArray[Bool?]], DiscrimTree[@kernel.Thm]),
    ) -> @kernel.Thm raise {
      of_tree(
        (fn(
          x333 : (@list.List[FixedArray[Bool?]], DiscrimTree[@kernel.Thm]),
        ) -> DiscrimTree[@kernel.Thm] raise {
          x333.1
        })(x334),
      )
    })(bm_build_tree(x335))
  })
}

///|
let bm_if_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "BM_IF_CONV",
)

///|
/// `BM_IF_CONV`
pub fn bm_if_conv(x : @kernel.Term) -> @kernel.Thm raise {
  bm_if_conv_c.get()(x)
}

///|
/// MATCH_EQ
fn step_43() -> Unit raise {
  let t340 = @metis.metis_tac(@list.List([]))
  let t339 = @tactics.disch_then(fn(
    x336 : @kernel.Thm,
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
    let s337 = @tactics.subst1_tac(x336)
    fn(
      x338 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s337(x338)
    }
  })
  let t341 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair._match()])), t339),
    t340,
  )
  match_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(r : (A, B) -> Bool)((e : A)) == ((y : B) => (x : B) == y) → _MATCH(e, r) == x"),
      t341,
    ),
  )
}

///|
let match_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATCH_EQ")

///|
/// `MATCH_EQ`
pub fn match_eq() -> @kernel.Thm {
  match_eq_c.get()
}

///|
/// bitpat_inverts
fn step_44() -> Unit raise {
  bitpat_inverts_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(bitpat_inverts : (Bitpat, (Num) -> A, A) -> Bool)((p : Bitpat), (f : (Num) -> A), (x : A)) == (∀ y : Num, pat_set(p, y) → f(y) == x)"),
    ),
  )
}

///|
let bitpat_inverts_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bitpat_inverts")

///|
/// `bitpat_inverts`
pub fn bitpat_inverts() -> @kernel.Thm {
  bitpat_inverts_c.get()
}

///|
/// bitpat_down
fn step_45() -> Unit raise {
  bitpat_down_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(bitpat_down : ((N) -> Bool, (Num) -> A, Num) -> A)((UNIV : (N) -> Bool), (f : (Num) -> A), (n : Num)) == f(DIV(n, EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))))"),
    ),
  )
}

///|
let bitpat_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bitpat_down")

///|
/// `bitpat_down`
pub fn bitpat_down() -> @kernel.Thm {
  bitpat_down_c.get()
}

///|
/// CONSPAT_down_inverts
fn step_46() -> Unit raise {
  let t349 = @simp.asm_rewrite_tac(@list.List([@arith.add()]))
  let t348 = @impconv.imp_rewrite_tac(
    @list.List([
      @arith.div_mult_add(),
      @arith.div_lt(),
      @words.val_bound(),
      @calc_num.exp_2_ne_0(),
    ]),
  )
  let t347 = @tactics.first_x_assum(fn(
    x344 : @kernel.Thm,
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
    let s345 = @tactics.subst1_tac(x344)
    fn(
      x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s345(x346)
    }
  })
  let t343 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t342 = @tactics.repeat_tac(@tactics.strip_tac)
  let t350 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([bitpat_inverts(), bitpat_down(), conspat_pat_set()]),
            ),
            t342,
          ),
          t343,
        ),
        t347,
      ),
      t348,
    ),
    t349,
  )
  conspat_down_inverts_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(bitpat_inverts : (Bitpat, (Num) -> A, A) -> Bool)((p : Bitpat), (f : (Num) -> A), (x : A)) → (bitpat_inverts : (Bitpat, (Num) -> A, A) -> Bool)((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, (a : Word[N])), (bitpat_down : ((N) -> Bool, (Num) -> A, Num) -> A)((UNIV : (N) -> Bool), f), x)"),
      t350,
    ),
  )
}

///|
let conspat_down_inverts_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONSPAT_down_inverts",
)

///|
/// `CONSPAT_down_inverts`
pub fn conspat_down_inverts() -> @kernel.Thm {
  conspat_down_inverts_c.get()
}

///|
/// CONSPAT_word_inverts
fn step_47() -> Unit raise {
  let t357 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@words.word_val_galois()), @words.word_val()]),
  )
  let t356 = @simp.rewrite_tac(
    @list.List([@words.word_val_galois(), @arith.mod_mult_add()]),
  )
  let t355 = @tactics.first_x_assum(fn(
    x352 : @kernel.Thm,
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
    let s353 = @tactics.subst1_tac(x352)
    fn(
      x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s353(x354)
    }
  })
  let t351 = @tactics.repeat_tac(@tactics.strip_tac)
  let t358 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([bitpat_inverts(), conspat_pat_set()])),
          t351,
        ),
        t355,
      ),
      t356,
    ),
    t357,
  )
  conspat_word_inverts_c.set(
    @tactics.prove(
      @term_syntax.parse_term("bitpat_inverts(CONSPAT((p : Bitpat), (a : Word[N])), word, a)"),
      t358,
    ),
  )
}

///|
let conspat_word_inverts_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONSPAT_word_inverts",
)

///|
/// `CONSPAT_word_inverts`
pub fn conspat_word_inverts() -> @kernel.Thm {
  conspat_word_inverts_c.get()
}

///|
/// bitpat_inverts_comp
fn step_48() -> Unit raise {
  bitpat_inverts_comp_c.set(
    @meson.meson(
      @list.List([bitpat_inverts(), @trivia.o_def()]),
      @term_syntax.parse_term("bitpat_inverts((p : Bitpat), (f : (Num) -> A), (x : A)) → bitpat_inverts(p, o((g : (A) -> B), f), g(x))"),
    ),
  )
}

///|
let bitpat_inverts_comp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "bitpat_inverts_comp",
)

///|
/// `bitpat_inverts_comp`
pub fn bitpat_inverts_comp() -> @kernel.Thm {
  bitpat_inverts_comp_c.get()
}

///|
/// CONSPAT_word1_inverts
fn step_49() -> Unit raise {
  let t359 = @equal.lhs(@kernel.concl(bit0_word1()))
  let t360 = @drule.part_match(
    @kernel.rand,
    @drule.match_mp(bitpat_inverts_comp())(conspat_word_inverts()),
  )(t359)
  conspat_word1_inverts_c.set(
    @simp.rewrite_rule(@list.List([bit0_word1()]))(t360),
  )
}

///|
let conspat_word1_inverts_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONSPAT_word1_inverts",
)

///|
/// `CONSPAT_word1_inverts`
pub fn conspat_word1_inverts() -> @kernel.Thm {
  conspat_word1_inverts_c.get()
}

///|
/// build_inverts
fn step_50() -> Unit raise {
  let t361 = @term_syntax.parse_term("(b : Bool)")
  let t362 = @term_syntax.parse_term("(x : A)")
  let t363 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t364 = @term_syntax.parse_term("(a : Word[N])")
  let t365 = @term_syntax.parse_term("(p : Bitpat)")
  let t366 = @parser.parse_type("A")
  let (n, a, p, a_1, f, x, b) = (
    @parser.parse_type("N"),
    t366,
    t365,
    t364,
    t363,
    t362,
    t361,
  )
  let th0 = @kernel.assume_rule(@term_syntax.parse_term("bitpat_inverts((p : Bitpat), (f : (Num) -> A), (x : A))"))
  let th1 = @bool.undisch(conspat_down_inverts())
  fn go(
    x367 : (@kernel.Term, (Unit) -> @kernel.Thm raise),
  ) -> @list.List[(@kernel.Term, @kernel.Thm)] raise {
    match x367 {
      (@kernel.Term::Const("NILPAT", _), _) => @list.List([])
      (
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p_p),
          a_p
        ) as cp,
        thunk,
      ) =>
        match @kernel.type_of(a_p) {
          @kernel.HolType::Tyapp(_, More(n_p, tail=Empty)) => {
            let next : (@kernel.Thm) -> @kernel.Thm raise = fn(
              x368 : @kernel.Thm,
            ) -> @kernel.Thm raise {
              let th = x368
              let th_p = @bool.pinst(
                @list.List([(n_p, n)]),
                @list.List([(a_p, a_1)]),
                th1,
              )
              match @kernel.rator(@kernel.concl(th_p)) {
                @kernel.Term::Comb(@kernel.Term::Comb(_, p_p_1), f_p) =>
                  @bool.prove_hyp(
                    th_p,
                    @kernel.inst_rule(@list.List([(p_p_1, p), (f_p, f)]), th),
                  )
                _ => raise @lib.MatchFailure("tscript.ml:675")
              }
            }
            let var_ : (@kernel.Term) -> ((@kernel.Thm) -> @list.List[
              (@kernel.Term, @kernel.Thm),
            ] raise) raise = fn(
              x369 : @kernel.Term,
            ) -> ((@kernel.Thm) -> @list.List[(@kernel.Term, @kernel.Thm)] raise) raise {
              let v = x369
              fn(
                x370 : @kernel.Thm,
              ) -> @list.List[(@kernel.Term, @kernel.Thm)] raise {
                let thv = x370
                let th_1 = thunk(())
                let f_p_1 = @kernel.rand(@kernel.rator(@kernel.concl(thv)))
                let th_p_1 = @bool.prove_hyp(
                  thv,
                  @bool.pinst(
                    @list.List([(@kernel.type_of(v), a)]),
                    @list.List([(cp, p), (f_p_1, f), (v, x)]),
                    th_1,
                  ),
                )
                go(
                  (
                    p_p,
                    fn(x371 : Unit) -> @kernel.Thm raise {
                      let _ = x371
                      next(th_1)
                    },
                  ),
                ).prepend((v, th_p_1))
              }
            }
            match a_p {
              @kernel.Term::Var(_, _) => {
                let t372 = @bool.pinst(
                  @list.List([(n_p, n)]),
                  @list.List([(p_p, p), (a_p, a_1)]),
                  conspat_word_inverts(),
                )
                var_(a_p)(t372)
              }
              @kernel.Term::Comb(
                @kernel.Term::Const("word1", _),
                @kernel.Term::Var(_, _) as b_p
              ) => {
                let t373 = @kernel.inst_rule(
                  @list.List([(p_p, p), (b_p, b)]),
                  conspat_word1_inverts(),
                )
                var_(b_p)(t373)
              }
              _ =>
                go(
                  (
                    p_p,
                    fn(x374 : Unit) -> @kernel.Thm raise { next(thunk(x374)) },
                  ),
                )
            }
          }
          _ => raise @lib.MatchFailure("tscript.ml:672")
        }
      _ => raise Failure("build_inverts")
    }
  }
  build_inverts_c.set(fn(
    x375 : @kernel.Term,
  ) -> @list.List[(@kernel.Term, @kernel.Thm)] raise {
    let p_p_2 = x375
    go(
      (
        p_p_2,
        fn(x376 : Unit) -> @kernel.Thm raise {
          let _ = x376
          th0
        },
      ),
    )
  })
}

///|
let build_inverts_c : @lib.Cell[
  (@kernel.Term) -> @list.List[(@kernel.Term, @kernel.Thm)] raise,
] = @lib.Cell::new("build_inverts")

///|
/// `build_inverts`
pub fn build_inverts(
  x : @kernel.Term,
) -> @list.List[(@kernel.Term, @kernel.Thm)] raise {
  build_inverts_c.get()(x)
}

///|
/// BM_FIRST_CASE_CONV
fn step_51() -> Unit raise {
  let t381 = @drule.match_mp(match_eq())
  let t383 = @tactics.pop_assum(fn(
    x382 : @kernel.Thm,
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
      x378 : @kernel.Thm,
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
      let s379 = @tactics.accept_tac(x378)
      fn(
        x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s379(x380)
      }
    })(t381(x382))
  })
  let t384 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_tac,
      @simp.asm_rewrite_tac(
        @list.List([
          bitmatch_seqpattern(),
          _bitmatch(),
          @meson.meson(@list.List([]), @term_syntax.parse_term("∃ y : A, (x : A) == y")),
        ]),
      ),
    ),
    t383,
  )
  let t385 = (
    @term_syntax.parse_term("(r : (Num, A) -> Bool)(val((e : Word[N]))) == ((y : A) => (x : A) == y) → _BITMATCH(e, _SEQPATTERN(r, (s : (Num, A) -> Bool))) == x"),
    t384,
  )
  let th1 = @bool.undisch(
    (fn(
      x377 : (
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
      @tactics.prove(x377.0, x377.1)
    })(t385),
  )
  let t387 = @term_syntax.parse_term("(A : Bool) → _UNGUARDED_PATTERN(A, (B : Bool)) == B")
  let th2 = @bool.undisch(
    ((x386 : @kernel.Term) => {
      @metis.metis(@list.List([@pair._unguarded_pattern()]), x386)
    })(t387),
  )
  let t388 = @kernel.assume_rule(@term_syntax.parse_term("(B : Bool)"))
  let th3 = @kernel.eq_mp(@equal.sym(th2), t388)
  let t393 = @simp.rewrite_rule(@list.List([bitpat_inverts()]))
  let t395 = @tactics.disch_then(fn(
    x394 : @kernel.Thm,
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
      x390 : @kernel.Thm,
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
      let s391 = @tactics.match_accept_tac(x390)
      fn(
        x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s391(x392)
      }
    })(t393(x394))
  })
  let t396 = (
    @term_syntax.parse_term("bitpat_inverts((p : Bitpat), (f : (Num) -> A), (x : A)) → pat_set(p, (e : Num)) → f(e) == x"),
    t395,
  )
  let th4 = @bool.undisch_all(
    (fn(
      x389 : (
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
      @tactics.prove(x389.0, x389.1)
    })(t396),
  )
  let t399 = @term_syntax.parse_term("_UNGUARDED_PATTERN((A : Bool), (B : Bool)) → A && B")
  let (thg1, thg2) = (fn(
    x397 : @kernel.Thm,
  ) -> (@kernel.Thm, @kernel.Thm) raise {
    @bool.conj_pair(@bool.undisch(x397))
  })(
    ((x398 : @kernel.Term) => {
      @metis.metis(@list.List([@pair._unguarded_pattern()]), x398)
    })(t399),
  )
  let t400 = @term_syntax.parse_term("(x : A)")
  let t401 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t402 = @term_syntax.parse_term("(p : Bitpat)")
  let t403 = @term_syntax.parse_term("(B : Bool)")
  let t404 = @term_syntax.parse_term("(A : Bool)")
  let (nty, ea, eb, ep, ef, ex) = (
    @parser.parse_type("N"),
    t404,
    t403,
    t402,
    t401,
    t400,
  )
  let t405 = @term_syntax.parse_term("(s : (Num, A) -> Bool)")
  let t406 = @term_syntax.parse_term("(r : (Num, A) -> Bool)")
  let t407 = @term_syntax.parse_term("(a : A)")
  let (ee, ea_1, er, es) = (@term_syntax.parse_term("(e : Word[N])"), t407, t406, t405)
  bm_first_case_conv_c.set(fn(x408 : @kernel.Term) -> @kernel.Thm raise {
    match x408 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e),
        @kernel.Term::Comb(
          @kernel.Term::Comb(
            @kernel.Term::Const("_SEQPATTERN", _),
            @kernel.Term::Abs(x, @kernel.Term::Abs(y, c_p)) as c
          ),
          cs
        )
      ) as tm => {
        let a_p = @kernel.type_of(tm)
        let n = dest_word_ty(@kernel.type_of(e))
        let val_e = @kernel.mk_comb(
          @kernel.mk_const("val", @list.List([(n, nty)])),
          e,
        )
        match @basics.strip_exists(c_p) {
          (
            zs,
            @kernel.Term::Comb(
              @kernel.Term::Comb(
                @kernel.Term::Const("_UNGUARDED_PATTERN", _),
                @kernel.Term::Comb(@kernel.Term::Comb(_, p) as mp, _) as ps
              ),
              restm
            ),
          ) => {
            let res = @equal.lhand(restm)
            let instab : (@kernel.Thm) -> @kernel.Thm raise = (
              x409 : @kernel.Thm,
            ) => @kernel.inst_rule(@list.List([(ps, ea), (restm, eb)]), x409)
            let ps_p = @kernel.mk_comb(mp, val_e)
            let th_p = if zs == @list.List([]) {
              instab(th2)
            } else {
              let inverts = build_inverts(p)
              fn prove_ex(
                x410 : @kernel.Term,
                x411 : (@kernel.Thm) -> @kernel.Thm raise,
                x412 : @kernel.Thm,
              ) -> ((@kernel.Thm) -> @kernel.Thm raise, @kernel.Thm) raise {
                let c1 = x410
                let pr = x411
                let eqth = x412
                match c1 {
                  @kernel.Term::Comb(
                    @kernel.Term::Const("?", _),
                    @kernel.Term::Abs(z, c_p_1)
                  ) => {
                    let inv = @lib.assoc(z, inverts)
                    let f = @equal.lhand(@kernel.concl(inv))
                    let t413 = @list.List([
                      (p, ep),
                      (f, ef),
                      (z, ex),
                      (x, @term_syntax.parse_term("(e : Num)")),
                    ])
                    let inv_1 = @bool.prove_hyp(
                      inv,
                      @bool.pinst(
                        @list.List([(@kernel.type_of(z), @kernel.aty)]),
                        t413,
                        th4,
                      ),
                    )
                    let abr = @kernel.mk_abs(z, @equal.lhs(@kernel.concl(eqth)))
                    let t414 = @kernel.beta(@kernel.mk_comb(abr, z))
                    let eqth1 = @kernel.trans(
                      @equal.ap_term(
                        abr,
                        @kernel.assume_rule(@kernel.concl(inv_1)),
                      ),
                      t414,
                    )
                    let (pr_p, th) = prove_ex(
                      c_p_1,
                      fn(x416 : @kernel.Thm) -> @kernel.Thm raise {
                        ((x415 : @kernel.Thm) => @bool.prove_hyp(inv_1, x415))(
                          pr(x416),
                        )
                      },
                      @kernel.trans(eqth1, eqth),
                    )
                    let t417 = triv_choose(@kernel.assume_rule(c1))(th)
                    (pr_p, @kernel.trans(@equal.sym(eqth1), t417))
                  }
                  _ => {
                    let t419 = instab(thg2)
                    let t418 = pr(eqth)
                    (
                      pr,
                      @kernel.trans(@bool.prove_hyp(instab(thg1), t418), t419),
                    )
                  }
                }
              }
              let (pr_1, thr) = prove_ex(
                c_p,
                fn(x420 : @kernel.Thm) -> @kernel.Thm raise { x420 },
                @kernel.refl(res),
              )
              let t421 = pr_1(thr)
              @kernel.deduct_antisym_rule(
                @lib.itlist(@bool.simple_exists, zs, instab(th3)),
                t421,
              )
            }
            let t422 = @kernel.abs_rule(y, th_p)
            let th_p_1 = @kernel.inst_rule(
              @list.List([(val_e, x)]),
              @kernel.trans(@kernel.beta(@kernel.mk_comb(c, x)), t422),
            )
            @bool.prove_hyp(
              th_p_1,
              @bool.pinst(
                @list.List([(n, nty), (a_p, @kernel.aty)]),
                @list.List([(e, ee), (res, ex), (c, er), (cs, es)]),
                th1,
              ),
            )
          }
          _ => raise @lib.MatchFailure("tscript.ml:717")
        }
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e_1),
        @kernel.Term::Comb(@kernel.Term::Const("_ELSEPATTERN", _), a)
      ) => {
        let a_p_1 = @kernel.type_of(a)
        let n_1 = dest_word_ty(@kernel.type_of(e_1))
        @bool.pinst(
          @list.List([(n_1, nty), (a_p_1, @kernel.aty)]),
          @list.List([(e_1, ee), (a, ea_1)]),
          bitmatch_elsepattern(),
        )
      }
      _ => raise Failure("BM_FIRST_CASE_CONV")
    }
  })
}

///|
let bm_first_case_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "BM_FIRST_CASE_CONV",
)

///|
/// `BM_FIRST_CASE_CONV`
pub fn bm_first_case_conv(x : @kernel.Term) -> @kernel.Thm raise {
  bm_first_case_conv_c.get()(x)
}

///|
/// `bm_add_pos`
pub fn bm_add_pos(
  x423 : DiscrimTree[@kernel.Thm],
  x424 : @kernel.Term,
) -> DiscrimTree[(@kernel.Thm, @list.List[@kernel.Thm])] raise {
  let tr = x423
  match x424 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e),
      cs
    ) => {
      let n = dest_word_ty(@kernel.type_of(e))
      let val_e = @kernel.mk_comb(
        @kernel.mk_const("val", @list.List([(n, @parser.parse_type("N"))])),
        e,
      )
      fn build_cases(
        x425 : @list.List[@kernel.Term],
        x426 : @kernel.Thm,
        x427 : @kernel.Term,
      ) -> @list.List[@kernel.Thm] raise {
        let stk = x425
        let mth = x426
        match x427 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("_SEQPATTERN", _),
              @kernel.Term::Abs(x, @kernel.Term::Abs(y, c_p))
            ),
            cs_1
          ) => {
            let ps_p = @kernel.mk_comb(
              @kernel.rator(@equal.lhand(@basics.strip_exists(c_p).1)),
              val_e,
            )
            let th = @lib.itlist(
              fn(x428 : @kernel.Term, x429 : @kernel.Thm) -> @kernel.Thm raise {
                let n_1 = x428
                (try {
                  let t430 = pat_to_bit(true)(n_1)(ps_p)
                  (x431 : @kernel.Thm) => @bool.prove_hyp(t430, x431)
                } catch {
                  Failure(_) =>
                    fn(x432 : @kernel.Thm) -> @kernel.Thm raise { x432 }
                  e => raise e
                })(x429)
              },
              stk,
              mth,
            )
            let t433 = build_cases(stk, mth, cs_1)
            t433.prepend(
              @kernel.trans(
                th,
                bm_first_case_conv(@equal.rhs(@kernel.concl(th))),
              ),
            )
          }
          _ => @list.List([])
        }
      }
      fn build(
        x434 : @list.List[@kernel.Term],
        x435 : DiscrimTree[@kernel.Thm],
      ) -> DiscrimTree[(@kernel.Thm, @list.List[@kernel.Thm])] raise {
        let stk_1 = x434
        match x435 {
          DiscrimTree::Leaf_dt(mth_1) =>
            DiscrimTree::Leaf_dt(
              (
                mth_1,
                build_cases(
                  stk_1,
                  mth_1,
                  @kernel.rand(@equal.rhs(@kernel.concl(mth_1))),
                ),
              ),
            )
          DiscrimTree::Split_dt(i, bit, tr1, tr2) => {
            let stk_p = stk_1.prepend(@equal.lhand(bit))
            let t436 = build(stk_p, tr2)
            DiscrimTree::Split_dt(i, bit, build(stk_p, tr1), t436)
          }
        }
      }
      build(@list.List([]), tr)
    }
    _ => raise Failure("bm_build_pos_tree")
  }
}

///|
/// `bm_build_pos_tree`
pub fn bm_build_pos_tree(
  x437 : @kernel.Term,
) -> (
  @list.List[FixedArray[Bool?]],
  DiscrimTree[(@kernel.Thm, @list.List[@kernel.Thm])],
) raise {
  let tm = x437
  let (a, tr) = bm_build_tree(tm)
  (a, bm_add_pos(tr, tm))
}

///|
/// `get_dt`
pub fn[TA] get_dt(
  x438 : FixedArray[Bool?],
  x439 : DiscrimTree[TA],
) -> (@list.List[(Bool, @kernel.Term)], TA) raise {
  let a = x438
  match x439 {
    DiscrimTree::Leaf_dt(a_1) => (@list.List([]), a_1)
    DiscrimTree::Split_dt(i, bit, tr1, tr2) =>
      match @lib.array_get(a, @lib.int63_to_int(i)) {
        None => raise Failure("get_dt splitting on " + Int64::to_string(i))
        Some(b) => {
          let (stk, r) = get_dt(a, if b { tr2 } else { tr1 })
          (stk.prepend((b, bit)), r)
        }
      }
  }
}

///|
/// `BM_CASES`
pub fn bm_cases(x440 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
  let tm = x440
  let (a, tr) = bm_build_pos_tree(tm)
  @lib.map(
    fn(x441 : FixedArray[Bool?]) -> @kernel.Thm raise {
      let cl = x441
      @lib.hd(get_dt(cl, tr).1.1)
    },
    a,
  )
}

///|
/// `bitpat_matches`
pub fn bitpat_matches(x442 : @kernel.Term, x443 : @num.Num) -> Int64? raise {
  let p = x442
  let i = x443
  match p {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p_1),
      a
    ) => {
      let n = dest_word_ty(@kernel.type_of(a))
      let n_1 = @num.int63_of_num(@basics.dest_finty(n))
      let t444 = @num.num_of_int64(n_1)
      let m = @num.power_num(@num.num_of_int64(2L), t444)
      let i_p = @num.quo_num(i, m)
      let a_p = @num.mod_num(i, m)
      let r_1 = match a {
        @kernel.Term::Comb(
          @kernel.Term::Const("word1", _),
          @kernel.Term::Const("T", _)
        ) =>
          if @num.eq_num(a_p, @num.num_of_int64(1L)) {
            None
          } else {
            Some(0L)
          }
        @kernel.Term::Comb(
          @kernel.Term::Const("word1", _),
          @kernel.Term::Const("F", _)
        ) =>
          if @num.eq_num(a_p, @num.num_of_int64(0L)) {
            None
          } else {
            Some(0L)
          }
        @kernel.Term::Comb(
          @kernel.Term::Const("word1", _),
          @kernel.Term::Var(_, _)
        ) => None
        @kernel.Term::Comb(@kernel.Term::Const("word", _), n_2) => {
          let n_p = @basics.dest_numeral(n_2)
          if @num.eq_num(a_p, n_p) {
            None
          } else {
            fn f(x445 : Int64, x446 : Int64) -> Int64 raise {
              let i_1 = x445
              let r = x446
              if (i_1 & 1L) != 0L {
                r
              } else {
                let t447 = @lib.add63(r, 1L)
                f(@lib.lsr63(i_1, 1L), t447)
              }
            }
            let t448 = @num.int63_of_num(n_p)
            Some(f(@num.int63_of_num(a_p) ^ t448, 0L))
          }
        }
        @kernel.Term::Var(_, _) => None
        _ => raise Failure("bitpat_matches")
      }
      match r_1 {
        Some(j) => Some(j)
        None =>
          match bitpat_matches(p_1, i_p) {
            Some(j_1) => Some(@lib.add63(j_1, n_1))
            None => None
          }
      }
    }
    @kernel.Term::Const("NILPAT", _) =>
      if @num.eq_num(i, @num.num_of_int64(0L)) {
        None
      } else {
        raise Failure("bitpat_matches: out of range")
      }
    @kernel.Term::Abs(_, c) => bitpat_matches(c, i)
    @kernel.Term::Comb(@kernel.Term::Const("?", _), c_1) =>
      bitpat_matches(c_1, i)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_UNGUARDED_PATTERN", _), c_2),
      _
    ) => bitpat_matches(c_2, i)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), c_3),
      _
    ) => bitpat_matches(c_3, i)
    _ => raise Failure("bitpat_matches")
  }
}

///|
/// inst_bitpat_numeral
fn step_52() -> Unit raise {
  let t449 = @term_syntax.parse_term("(a : Num)")
  let t450 = @term_syntax.parse_term("(i : Num)")
  let t451 = @term_syntax.parse_term("(x : Num)")
  let t452 = @term_syntax.parse_term("(p : Bitpat)")
  let (en, ep, ex, ei, ea) = (
    @term_syntax.parse_term("(n : Num)"),
    t452,
    t451,
    t450,
    t449,
  )
  let t453 = @term_syntax.parse_term("false")
  let t454 = @term_syntax.parse_term("true")
  let (en_1, t, f) = (@parser.parse_type("N"), t454, t453)
  let dn = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let dim : (@kernel.HolType) -> @kernel.Thm raise = fn(
    x455 : @kernel.HolType,
  ) -> @kernel.Thm raise {
    let n = x455
    @cart.dimindex_conv(@kernel.inst(@list.List([(n, en_1)]), dn))
  }
  let t456 = @simp.rewrite_tac(@list.List([nilpat_pat_set(), @nums.numeral()]))
  let w0 = @tactics.prove(@term_syntax.parse_term("pat_set(NILPAT, _0)"), t456)
  let t460 = @tactics.disch_then(fn(
    x457 : @kernel.Thm,
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
    let th = x457
    let t459 = @simp.rewrite_tac(
      @list.List([th, @words.val_word(), @arith.mult_sym()]),
    )
    @tactics.then_tac(@tactics.exists_tac(ex), t459)
  })
  let t461 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([conspat_pat_set(), @words.num_shift_add()])),
    t460,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("pat_set((p : Bitpat), (x : Num)) → pat_set((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, (word : (Num) -> Word[N])((a : Num))), num_shift_add(a, x, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"),
    t461,
  )
  let t499 = @simp.rewrite_tac(@list.List([@calc_num.bit0_0(), @arith.one()]))
  let t498 = @tactics.conv_tac(@equal.once_depth_conv(@cart.dimindex_conv))
  let t497 = @tactics.subgoal_then(
    @term_syntax.parse_term("num_shift_add(0, (x : Num), (dimindex : ((Unit) -> Bool) -> Num)((UNIV : (Unit) -> Bool))) == num_shift_add(BIT0(0), x, SUC(0))"),
    fn(
      x495 : @kernel.Thm,
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
      let th_3 = x495
      @simp.rewrite_tac(
        @list.List([th_3, @words.num_shift_add_suc(), @words.num_shift_add_0()]),
      )
    },
  )
  let t491 = @list.List([(@term_syntax.parse_term("0"), ea)])
  let t492 = @bool.pinst(
    @list.List([(@parser.parse_type("1"), en_1)]),
    t491,
    pth,
  )
  let t500 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.pop_assum(fn(
          x494 : @kernel.Thm,
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
            x488 : @kernel.Thm,
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
            let s489 = @tactics.mp_tac(x488)
            fn(
              x490 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s489(x490)
            }
          })(((x493 : @kernel.Thm) => @bool.mp(t492, x493))(x494))
        }),
        t497,
      ),
      t498,
    ),
    t499,
  )
  let t487 = @simp.rewrite_tac(@list.List([@calc_num.bit1_0(), @arith.one()]))
  let t486 = @tactics.conv_tac(@equal.once_depth_conv(@cart.dimindex_conv))
  let t485 = @tactics.subgoal_then(
    @term_syntax.parse_term("num_shift_add(1, (x : Num), (dimindex : ((Unit) -> Bool) -> Num)((UNIV : (Unit) -> Bool))) == num_shift_add(BIT1(0), x, SUC(0))"),
    fn(
      x483 : @kernel.Thm,
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
      let th_2 = x483
      @simp.rewrite_tac(
        @list.List([th_2, @words.num_shift_add_suc(), @words.num_shift_add_0()]),
      )
    },
  )
  let t479 = @list.List([(@term_syntax.parse_term("1"), ea)])
  let t480 = @bool.pinst(
    @list.List([(@parser.parse_type("1"), en_1)]),
    t479,
    pth,
  )
  let t501 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.pop_assum(fn(
            x482 : @kernel.Thm,
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
              x476 : @kernel.Thm,
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
              let s477 = @tactics.mp_tac(x476)
              fn(
                x478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s477(x478)
              }
            })(((x481 : @kernel.Thm) => @bool.mp(t480, x481))(x482))
          }),
          t485,
        ),
        t486,
      ),
      t487,
    ),
    t500,
  ])
  let t475 = @tactics.disch_then(fn(
    x473 : @kernel.Thm,
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
    let th_1 = x473
    @tactics.then_tac(@tactics.conj_tac, @tactics.assume_tac(th_1))
  })
  let t502 = @tactics.thenl(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([word1(), @words.bitval()])),
      t475,
    ),
    t501,
  )
  let t503 = (
    @term_syntax.parse_term("pat_set((p : Bitpat), (x : Num)) → pat_set(CONSPAT(p, word1(true)), BIT1(x)) && pat_set(CONSPAT(p, word1(false)), BIT0(x))"),
    t502,
  )
  let t504 = (fn(x471 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
    @bool.conj_pair(@bool.undisch(x471))
  })(
    (fn(
      x472 : (
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
      @tactics.prove(x472.0, x472.1)
    })(t503),
  )
  let t468 = @tactics.accept_tac(pth)
  let t467 = @tactics.repeat_tac(
    @tactics.disch_then(fn(
      x466 : @kernel.Thm,
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
        x463 : @kernel.Thm,
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
        let s464 = @tactics.subst1_tac(x463)
        fn(
          x465 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s464(x465)
        }
      })(@equal.sym(x466))
    }),
  )
  let t469 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral()])), t467),
    t468,
  )
  let t470 = (
    @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == NUMERAL((n : Num)) → num_shift_add((a : Num), (x : Num), n) == (i : Num) → pat_set((p : Bitpat), x) → pat_set((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, (word : (Num) -> Word[N])(NUMERAL(a))), i)"),
    t469,
  )
  let (ws, (w1t, w1f)) = (
    @bool.undisch_all(
      (fn(
        x462 : (
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
        @tactics.prove(x462.0, x462.1)
      })(t470),
    ),
    t504,
  )
  let t505 = @kernel.inst_rule(
    @list.List([(@term_syntax.parse_term("_0"), ex)]),
    w1f,
  )
  let w1f0 = @simp.rewrite_rule(@list.List([@calc_num.arith_zero()]))(t505)
  fn go(
    x506 : @num.Num,
    x507 : @kernel.Term,
  ) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise {
    let i = x506
    match x507 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p),
        a
      ) => {
        let n_1 = dest_word_ty(@kernel.type_of(a))
        let n_2 = @num.int63_of_num(@basics.dest_finty(n_1))
        let t508 = @num.num_of_int64(n_2)
        let m = @num.power_num(@num.num_of_int64(2L), t508)
        let i_p = @num.quo_num(i, m)
        let a_p = @num.mod_num(i, m)
        let (ls, th_p) = go(i_p, p)
        let (p_p, x) = @kernel.dest_comb(@kernel.concl(th_p))
        let p_p_1 = @kernel.rand(p_p)
        match a {
          @kernel.Term::Comb(@kernel.Term::Const("word1", _), a_1) => {
            let (ls_1, b_1) = match a_1 {
              @kernel.Term::Const("T", _) => (ls, true)
              @kernel.Term::Const("F", _) => (ls, false)
              @kernel.Term::Var(_, _) => {
                let b = @num.eq_num(a_p, @num.num_of_int64(1L))
                (ls.prepend((if b { t } else { f }, a_1)), b)
              }
              _ => raise Failure("inst_bitpat_numeral")
            }
            (
              ls_1,
              @bool.prove_hyp(
                th_p,
                if b_1 {
                  @kernel.inst_rule(@list.List([(x, ex), (p_p_1, ep)]), w1t)
                } else if @num.eq_num(i, @num.num_of_int64(0L)) {
                  @kernel.inst_rule(@list.List([(p_p_1, ep)]), w1f0)
                } else {
                  @kernel.inst_rule(@list.List([(x, ex), (p_p_1, ep)]), w1f)
                },
              ),
            )
          }
          _ => {
            let thd = dim(n_1)
            let n_p = @kernel.rand(@equal.rhs(@kernel.concl(thd)))
            let (ls_2, a_3) = match a {
              @kernel.Term::Comb(
                @kernel.Term::Const("word", _),
                @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), a_2)
              ) => (ls, a_2)
              @kernel.Term::Var(_, _) => {
                let n_3 = @nums.mk_numeral(a_p)
                let t509 = @kernel.rand(n_3)
                (
                  ls.prepend(
                    (
                      @kernel.mk_comb(
                        @kernel.mk_const("word", @list.List([(n_1, en_1)])),
                        n_3,
                      ),
                      a,
                    ),
                  ),
                  t509,
                )
              }
              _ => raise Failure("inst_bitpat_numeral")
            }
            let thn = @words.num_shift_add_core(a_3)(x)(n_p)
            let e = @equal.rhs(@kernel.concl(thn))
            (
              ls_2,
              @bool.prove_hyp(
                th_p,
                @bool.prove_hyp(
                  thn,
                  @bool.prove_hyp(
                    thd,
                    @kernel.inst_rule(
                      @list.List([
                        (n_p, en),
                        (a_3, ea),
                        (x, ex),
                        (e, ei),
                        (p_p_1, ep),
                      ]),
                      @kernel.inst_type(@list.List([(n_1, en_1)]), ws),
                    ),
                  ),
                ),
              ),
            )
          }
        }
      }
      @kernel.Term::Const("NILPAT", _) => (@list.List([]), w0)
      _ => raise Failure("inst_bitpat_numeral")
    }
  }
  let pth1 = @equal.sym(@bool.spec(en, @nums.numeral()))
  let t521 = @drule.match_mp(pat_set_lt())
  let t523 = @tactics.pop_assum(fn(
    x522 : @kernel.Thm,
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
      x518 : @kernel.Thm,
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
      let s519 = @tactics.accept_tac(x518)
      fn(
        x520 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s519(x520)
      }
    })(t521(x522))
  })
  let t517 = @impconv.imp_rewrite_tac(@list.List([@words.val_word_eq()]))
  let t516 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t515 = @tactics.repeat_tac(@tactics.strip_tac)
  let t524 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x514 : @kernel.Thm,
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
              x511 : @kernel.Thm,
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
              let s512 = @tactics.subst1_tac(x511)
              fn(
                x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s512(x513)
              }
            })(@equal.sym(x514))
          }),
          t515,
        ),
        t516,
      ),
      t517,
    ),
    t523,
  )
  let t525 = (
    @term_syntax.parse_term("pat_size((p : Bitpat)) == NUMERAL((n : Num)) → (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == NUMERAL(n) → pat_set(p, (x : Num)) → pat_set(p, (val : (Word[N]) -> Num)((word : (Num) -> Word[N])(NUMERAL(x))))"),
    t524,
  )
  let pth2 = @bool.undisch_all(
    (fn(
      x510 : (
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
      @tactics.prove(x510.0, x510.1)
    })(t525),
  )
  let ps = @term_syntax.parse_term("pat_size")
  let t527 = @equal.redepth_conv(@calc_num.num_add_conv)
  let t526 = @equal.once_depth_conv(@cart.dimindex_conv)
  let t529 = @equal.thenc(
    @equal.thenc(
      @simp.rewrite_conv(@list.List([conspat_pat_size(), nilpat_pat_size()])),
      t526,
    ),
    t527,
  )
  let conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x532 : @kernel.Term,
  ) -> @kernel.Thm raise {
    (fn(x530 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
      t529(
        (fn(x528 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          @kernel.mk_comb(x528.0, x528.1)
        })(x530),
      )
    })(
      (fn(x531 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        let tm = x531
        (ps, tm)
      })(x532),
    )
  }
  let check : (@kernel.Term) -> ((@num.Num) -> (
    @list.List[(@kernel.Term, @kernel.Term)],
    @kernel.Thm,
  ) raise) raise = fn(
    x533 : @kernel.Term,
  ) -> ((@num.Num) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise) raise {
    let p_1 = x533
    fn(
      x534 : @num.Num,
    ) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise {
      let i_1 = x534
      match bitpat_matches(p_1, i_1) {
        None => go(i_1, p_1)
        _ => raise Failure("inst_bitpat_numeral: number does not match pattern")
      }
    }
  }
  inst_bitpat_numeral_c.set(fn(
    x535 : @kernel.Term,
  ) -> ((@num.Num) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise) raise {
    match x535 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), p_2),
        @kernel.Term::Comb(@kernel.Term::Const("val", _), e_1)
      ) => {
        let n_p_1 = dest_word_ty(@kernel.type_of(e_1))
        let thd_1 = dim(n_p_1)
        let t541 = @list.List([
          (p_2, ep),
          (@kernel.rand(@equal.rhs(@kernel.concl(thd_1))), en),
        ])
        let t538 = conv(p_2)
        let pth2_1 = (fn(x543 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x540 : @kernel.Thm) -> @kernel.Thm raise {
            ((x537 : @kernel.Thm) => @bool.prove_hyp(thd_1, x537))(
              ((x539 : @kernel.Thm) => @bool.prove_hyp(t538, x539))(x540),
            )
          })(((x542 : @kernel.Thm) => @kernel.inst_rule(t541, x542))(x543))
        })(
          (fn(x545 : @kernel.Thm) -> @kernel.Thm raise {
            ((x544 : @kernel.Thm) => {
              @kernel.inst_type(@list.List([(n_p_1, en_1)]), x544)
            })(x545)
          })(pth2),
        )
        fn(
          x546 : @num.Num,
        ) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise {
          let i_2 = x546
          let (ls_3, th_4) = check(p_2)(i_2)
          let e_p = @kernel.rand(@kernel.concl(th_4))
          let th1 = @bool.prove_hyp(
            th_4,
            @kernel.inst_rule(ls_3.prepend((e_p, ex)), pth2_1),
          )
          match e_1 {
            @kernel.Term::Var(_, _) =>
              (
                ls_3.prepend(
                  (@kernel.rand(@kernel.rand(@kernel.concl(th1))), e_1),
                ),
                th1,
              )
            _ if @basics.aconv(
                e_1,
                @kernel.rand(@kernel.rand(@kernel.concl(th1))),
              ) => (ls_3, th1)
            _ => raise Failure("inst_bitpat_numeral: pattern failed")
          }
        }
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), p_3),
        e_2
      ) =>
        fn(
          x547 : @num.Num,
        ) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise {
          let i_3 = x547
          let (ls_4, th_5) = check(p_3)(i_3)
          let (f_1, e_p_1) = @kernel.dest_comb(@kernel.concl(th_5))
          let th1_1 = @kernel.inst_rule(@list.List([(e_p_1, en)]), pth1)
          let th2 = @kernel.eq_mp(@equal.ap_term(f_1, th1_1), th_5)
          match e_2 {
            @kernel.Term::Var(_, _) =>
              (ls_4.prepend((@equal.rhs(@kernel.concl(th1_1)), e_2)), th2)
            _ if @basics.aconv(e_2, @equal.rhs(@kernel.concl(th1_1))) =>
              (ls_4, th2)
            _ => raise Failure("inst_bitpat_numeral: pattern failed")
          }
        }
      _ => raise Failure("inst_bitpat_numeral")
    }
  })
}

///|
let inst_bitpat_numeral_c : @lib.Cell[
  (@kernel.Term) -> ((@num.Num) -> (
    @list.List[(@kernel.Term, @kernel.Term)],
    @kernel.Thm,
  ) raise) raise,
] = @lib.Cell::new("inst_bitpat_numeral")

///|
/// `inst_bitpat_numeral`
pub fn inst_bitpat_numeral(
  x : @kernel.Term,
) -> ((@num.Num) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise) raise {
  inst_bitpat_numeral_c.get()(x)
}

///|
/// `BITMATCH_CONV`
pub fn bitmatch_conv(x549 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x549
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const("_BITMATCH", _),
        @kernel.Term::Comb(
          @kernel.Term::Const(
            "word",
            @kernel.HolType::Tyapp(
              _,
              More(
                _,
                tail=More(
                  @kernel.HolType::Tyapp(_, More(n, tail=Empty)),
                  tail=Empty
                )
              )
            )
          ),
          n_1
        )
      ),
      _
    ) if @nums.is_numeral(n_1) => {
      let (a, tr) = bm_build_pos_tree(tm)
      let n_2 = @num.int63_of_num(@basics.dest_numeral(n_1))
      let sz = @num.int63_of_num(@basics.dest_finty(n))
      let a_1 = @lib.array_init(sz, fn(x550 : Int64) -> Bool? raise {
        let i = x550
        Some(!physical_equal(n_2 & @lib.lsl63(1L, i), 0L))
      })
      match get_dt(a_1, tr).1.1 {
        More(th, tail=_) => {
          let ps = @lib.hd(@kernel.hyp(th))
          let t551 = @num.num_of_int64(n_2)
          let (ls, th_p) = inst_bitpat_numeral(ps)(t551)
          @bool.prove_hyp(th_p, @kernel.inst_rule(ls, th))
        }
        _ => raise Failure("BITMATCH_CONV")
      }
    }
    _ => raise Failure("BITMATCH_CONV")
  }
}

///|
/// `BITMATCH_SIMP_CONV`
pub fn bitmatch_simp_conv(x552 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let asl = x552
  fn go(
    x554 : @list.List[@kernel.Thm],
  ) -> (@list.List[@kernel.Thm], @list.List[@kernel.Thm]) raise {
    match x554 {
      Empty => (@list.List([]), @list.List([]))
      More(th, tail=ths) => {
        let (pos, neg) = go(ths)
        match @kernel.concl(th) {
          @kernel.Term::Comb(@kernel.Term::Const("~", _), c) if (match
              @basics.strip_exists(c).1 {
              @kernel.Term::Comb(
                @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), _),
                _
              ) => true
              _ => false
            }) => (pos, neg.prepend(th))
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), _),
            _
          ) => (pos.prepend(th), neg)
          _ => (pos, neg)
        }
      }
    }
  }
  let (pos_1, neg_1) = go(asl)
  fn conv(x555 : @kernel.Term) -> @kernel.Thm raise {
    match x555 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), _),
        @kernel.Term::Comb(@kernel.Term::Const("_ELSEPATTERN", _), _)
      ) as tm => @drule.part_match(@equal.lhs, bitmatch_elsepattern())(tm)
      @kernel.Term::Comb(
        @kernel.Term::Comb(
          @kernel.Term::Const("_BITMATCH", _),
          @kernel.Term::Comb(@kernel.Term::Const("word", _), n)
        ),
        _
      ) as tm_1 if @nums.is_numeral(n) => bitmatch_conv(tm_1)
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e),
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("_SEQPATTERN", _), c_1),
          cs
        )
      ) as tm_2 => {
        let t556 = @parser.parse_type("N")
        let t557 = @kernel.mk_comb(
          @kernel.mk_const(
            "val",
            @list.List([(dest_word_ty(@kernel.type_of(e)), t556)]),
          ),
          e,
        )
        let pat = @kernel.mk_comb(
          @kernel.rator(
            @equal.lhand(
              @basics.strip_exists(@basics.body(@basics.body(c_1))).1,
            ),
          ),
          t557,
        )
        let vars = @kernel.frees(@equal.lhand(pat))
        fn check_pos(x558 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
          match x558 {
            More(th_1, tail=ths_1) =>
              try {
                let (_, ls, _) = @drule.term_unify(
                  vars,
                  pat,
                  @kernel.concl(th_1),
                )
                @bool.prove_hyp(
                  th_1,
                  @kernel.inst_rule(ls, bm_first_case_conv(tm_2)),
                )
              } catch {
                Failure(_) => check_pos(ths_1)
                e => raise e
              }
            Empty => {
              fn check_neg(
                x559 : @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise {
                match x559 {
                  More(th_2, tail=ths_2) =>
                    try {
                      let pat_p = @basics.strip_exists(
                          @kernel.rand(@kernel.concl(th_2)),
                        ).1
                      let (_, ls_1, _) = @drule.term_unify(
                        @kernel.frees(@equal.lhand(pat_p)),
                        pat_p,
                        pat,
                      )
                      let t560 = @kernel.assume_rule(@kernel.concl(th_2))
                      let ath = @kernel.inst_rule(
                        ls_1,
                        @bool.spec_all(
                          @simp.pure_rewrite_rule(
                            @list.List([@class.not_exists_thm()]),
                          )(t560),
                        ),
                      )
                      let th_p = @bool.prove_hyp(
                        th_2,
                        bm_skip_clause(fn(
                          x561 : @kernel.Term,
                        ) -> @kernel.Thm raise {
                          ath
                        })(tm_2),
                      )
                      let t562 = @equal.rhs(@kernel.concl(th_p))
                      @kernel.trans(th_p, @equal.try_conv(conv)(t562))
                    } catch {
                      Failure(_) => check_neg(ths_2)
                      e => raise e
                    }
                  Empty => {
                    let sz = @num.int63_of_num(
                      @basics.dest_finty(dest_word_ty(@kernel.type_of(e))),
                    )
                    let a = bm_analyze_pat(sz)(pat)
                    fn check_disj(
                      x563 : @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise {
                      match x563 {
                        More(th_3, tail=ths_3) =>
                          try {
                            let h = @kernel.concl(th_3)
                            let a_p = bm_analyze_pat(sz)(h)
                            let r = Ref::{ val: None, }
                            @lib.array_iteri(
                              fn(x564 : Int64, x565 : Bool?) -> Unit raise {
                                let i = x564
                                let x = x565
                                let t566 = @lib.array_get(
                                  a_p,
                                  @lib.int63_to_int(i),
                                )
                                match (x, t566, r.val) {
                                  (Some(b), Some(c_2), None) if !physical_equal(
                                      b, c_2,
                                    ) => {
                                    r.val = Some(i)
                                    ()
                                  }
                                  _ => ()
                                }
                              },
                              a,
                            )
                            let i_2 = match r.val {
                              Some(i_1) =>
                                @nums.mk_numeral(@num.num_of_int64(i_1))
                              _ => @lib.failure()
                            }
                            let t567 = bm_skip_clause(pat_to_bit(false)(i_2))(
                              tm_2,
                            )
                            let th_p_1 = @bool.prove_hyp(
                              th_3,
                              @bool.prove_hyp(pat_to_bit(true)(i_2)(h), t567),
                            )
                            let t568 = @equal.rhs(@kernel.concl(th_p_1))
                            @kernel.trans(th_p_1, @equal.try_conv(conv)(t568))
                          } catch {
                            Failure(_) => check_disj(ths_3)
                            e => raise e
                          }
                        Empty => raise Failure("BITMATCH_SIMP_CONV")
                      }
                    }
                    check_disj(pos_1)
                  }
                }
              }
              check_neg(neg_1)
            }
          }
        }
        check_pos(pos_1)
      }
      _ => raise Failure("BITMATCH_SIMP_CONV")
    }
  }
  conv
}

///|
/// `bitpat_irrefutable`
pub fn bitpat_irrefutable(x569 : @kernel.Term) -> Bool raise {
  match x569 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p),
      a
    ) =>
      match a {
        @kernel.Term::Comb(
          @kernel.Term::Const("word1", _),
          @kernel.Term::Var(_, _)
        ) => bitpat_irrefutable(p)
        @kernel.Term::Var(_, _) => bitpat_irrefutable(p)
        _ => false
      }
    @kernel.Term::Const("NILPAT", _) => true
    @kernel.Term::Abs(_, c) => bitpat_irrefutable(c)
    @kernel.Term::Comb(@kernel.Term::Const("?", _), c_1) =>
      bitpat_irrefutable(c_1)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_UNGUARDED_PATTERN", _), c_2),
      _
    ) => bitpat_irrefutable(c_2)
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), c_3),
      _
    ) => bitpat_irrefutable(c_3)
    _ => raise Failure("bitpat_irrefutable")
  }
}

///|
/// bitpat_irrefutable_thm
fn step_53() -> Unit raise {
  let t570 = @term_syntax.parse_term("(k : Num)")
  let t571 = @term_syntax.parse_term("(m : Num)")
  let t572 = @term_syntax.parse_term("(n : Num)")
  let t573 = @term_syntax.parse_term("(e : Word[N])")
  let t574 = @term_syntax.parse_term("(e : Num)")
  let (en, ee, ee_p, en_1, em, ek) = (
    @parser.parse_type("N"),
    t574,
    t573,
    t572,
    t571,
    t570,
  )
  let t575 = @term_syntax.parse_term("1")
  let t576 = @term_syntax.parse_term("op_plus")
  let t577 = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let (ep, dn, pl, _1) = (@term_syntax.parse_term("(p : Bitpat)"), t577, t576, t575)
  let e2n = @term_syntax.parse_term("DIV((e : Num), EXP(2, (n : Num)))")
  let t587 = @tactics.disch_then(fn(
    x583 : @kernel.Thm,
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
    let th = x583
    let t585 = @bool.spec(@term_syntax.parse_term("(n : Num)"), @calc_num.exp_2_ne_0())
    let t586 = @simp.rewrite_tac(
      @list.List([
        th,
        @words.val_word(),
        @arith.add_sym(),
        @arith.mult_sym(),
        @equal.gsym(@drule.match_mp(@arith.division())(t585)),
      ]),
    )
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("DIV((e : Num), EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))")),
      t586,
    )
  })
  let t582 = @tactics.disch_then(fn(
    x581 : @kernel.Thm,
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
      x578 : @kernel.Thm,
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
      let s579 = @tactics.subst1_tac(x578)
      fn(
        x580 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s579(x580)
      }
    })(@equal.sym(x581))
  })
  let t588 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([conspat_pat_set()])), t582),
    t587,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == (n : Num) → pat_set((p : Bitpat), DIV((e : Num), EXP(2, n))) → pat_set((CONSPAT : (Bitpat, Word[N]) -> Bitpat)(p, (word : (Num) -> Word[N])(e)), e)"),
    t588,
  )
  let t590 = @cart.dimindex_conv(@term_syntax.parse_term("(dimindex : ((Unit) -> Bool) -> Num)((UNIV : (Unit) -> Bool))"))
  let t591 = @tactics.accept_tac(@drule.match_mp(pth)(t590))
  let t592 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([word1_odd()])),
    t591,
  )
  let t593 = (
    @term_syntax.parse_term("pat_set((p : Bitpat), DIV((e : Num), EXP(2, 1))) → pat_set(CONSPAT(p, word1(ODD(e))), e)"),
    t592,
  )
  let t594 = @bool.undisch(
    (fn(
      x589 : (
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
      @tactics.prove(x589.0, x589.1)
    })(t593),
  )
  let (pth_1, pth1) = (@bool.undisch_all(pth), t594)
  let t596 = @simp.rewrite_tac(
    @list.List([
      @arith.exp(),
      @int.arith_rule(@term_syntax.parse_term("((n : Num) < 1) == (n == 0)")),
      nilpat_pat_set(),
    ]),
  )
  let t597 = (@term_syntax.parse_term("(e : Num) < EXP(2, 0) → pat_set(NILPAT, e)"), t596)
  let pth0 = @bool.undisch(
    (fn(
      x595 : (
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
      @tactics.prove(x595.0, x595.1)
    })(t597),
  )
  let t603 = @impconv.imp_rewrite_tac(
    @list.List([@arith.exp_add(), @arith.rdiv_lt_eq(), @calc_num.exp_2_ne_0()]),
  )
  let t604 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x602 : @kernel.Thm,
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
        x599 : @kernel.Thm,
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
        let s600 = @tactics.subst1_tac(x599)
        fn(
          x601 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s600(x601)
        }
      })(@equal.sym(x602))
    }),
    t603,
  )
  let t605 = (
    @term_syntax.parse_term("(n : Num) + (m : Num) == (k : Num) → (e : Num) < EXP(2, k) → DIV(e, EXP(2, n)) < EXP(2, m)"),
    t604,
  )
  let pths = @bool.undisch_all(
    (fn(
      x598 : (
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
      @tactics.prove(x598.0, x598.1)
    })(t605),
  )
  let t611 = @simp.rewrite_tac(@list.List([@words.val_bound()]))
  let t612 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x610 : @kernel.Thm,
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
        x607 : @kernel.Thm,
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
        let s608 = @tactics.subst1_tac(x607)
        fn(
          x609 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s608(x609)
        }
      })(@equal.sym(x610))
    }),
    t611,
  )
  let t613 = (
    @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == (n : Num) → (val : (Word[N]) -> Num)((e : Word[N])) < EXP(2, n)"),
    t612,
  )
  let pthw = @bool.undisch_all(
    (fn(
      x606 : (
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
      @tactics.prove(x606.0, x606.1)
    })(t613),
  )
  fn build(
    x614 : (@kernel.Term, @kernel.Term),
  ) -> (@list.List[(@kernel.Term, @kernel.Term)], @kernel.Thm) raise {
    match x614 {
      (@kernel.Term::Const("NILPAT", _), e) =>
        (@list.List([]), @kernel.inst_rule(@list.List([(e, ee)]), pth0))
      (
        @kernel.Term::Comb(
          @kernel.Term::Comb(@kernel.Term::Const("CONSPAT", _), p),
          v
        ),
        e_1,
      ) => {
        let pths_1 : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
          x615 : @kernel.Term,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let n = x615
          fn(x616 : @kernel.Term) -> @kernel.Thm raise {
            let m = x616
            let th_1 = @calc_num.num_add_conv(
              @kernel.mk_comb(@kernel.mk_comb(pl, n), m),
            )
            @bool.prove_hyp(
              th_1,
              @kernel.inst_rule(
                @list.List([
                  (n, en_1),
                  (m, em),
                  (@equal.rhs(@kernel.concl(th_1)), ek),
                  (e_1, ee),
                ]),
                pths,
              ),
            )
          }
        }
        match v {
          @kernel.Term::Comb(
            @kernel.Term::Const("word1", _),
            @kernel.Term::Var(_, _) as v_1
          ) => {
            let (ls, th_2) = build(
              (p, @kernel.vsubst(@list.List([(e_1, ee), (_1, en_1)]), e2n)),
            )
            let th_p = @bool.prove_hyp(
              th_2,
              @kernel.inst_rule(
                @list.List([(@equal.lhand(@kernel.concl(th_2)), ep), (e_1, ee)]),
                pth1,
              ),
            )
            let t617 = @kernel.rand(@kernel.rand(@lib.hd(@kernel.hyp(th_2))))
            let t618 = @bool.prove_hyp(pths_1(_1)(t617), th_p)
            (
              ls.prepend(
                (
                  @kernel.rand(@kernel.rand(@equal.lhand(@kernel.concl(th_p)))),
                  v_1,
                ),
              ),
              t618,
            )
          }
          @kernel.Term::Var(_, ty) => {
            let n_1 = dest_word_ty(ty)
            let th1 = @cart.dimindex_conv(
              @kernel.inst(@list.List([(n_1, en)]), dn),
            )
            let n_2 = @equal.rhs(@kernel.concl(th1))
            let (ls_1, th_3) = build(
              (p, @kernel.vsubst(@list.List([(e_1, ee), (n_2, en_1)]), e2n)),
            )
            let t619 = @kernel.inst_type(@list.List([(n_1, en)]), pth_1)
            let th_p_1 = @bool.prove_hyp(
              th1,
              @kernel.inst_rule(
                @list.List([
                  (n_2, en_1),
                  (@equal.lhand(@kernel.concl(th_3)), ep),
                  (e_1, ee),
                ]),
                t619,
              ),
            )
            let th_p_2 = @bool.prove_hyp(th_3, th_p_1)
            let t620 = @kernel.rand(@kernel.rand(@lib.hd(@kernel.hyp(th_3))))
            let t621 = @bool.prove_hyp(pths_1(n_2)(t620), th_p_2)
            (
              ls_1.prepend(
                (@kernel.rand(@equal.lhand(@kernel.concl(th_p_2))), v),
              ),
              t621,
            )
          }
          _ => raise Failure("bitpat_irrefutable_thm: not irrefutable")
        }
      }
      _ => raise Failure("bitpat_irrefutable_thm")
    }
  }
  bitpat_irrefutable_thm_c.set(fn(x622 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x622
    match @basics.strip_exists(tm).1 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("pat_set", _), p_1),
        @kernel.Term::Comb(@kernel.Term::Const("val", _), e_p) as e_2
      ) => {
        let (ls_2, th_4) = build((p_1, e_2))
        fn build_ex(x623 : @kernel.Term) -> @kernel.Thm raise {
          match x623 {
            @kernel.Term::Comb(
              @kernel.Term::Const("?", _),
              @kernel.Term::Abs(v_2, c)
            ) as tm_1 => {
              let e_3 = @lib.rev_assoc(v_2, ls_2)
              @bool.exists_rule(
                tm_1,
                e_3,
                build_ex(@kernel.vsubst(@list.List([(e_3, v_2)]), c)),
              )
            }
            tm_2 if @basics.aconv(@kernel.concl(th_4), tm_2) => th_4
            _ => raise Failure("bitpat_irrefutable_thm: nonlinear pattern")
          }
        }
        let th_5 = build_ex(tm)
        let n_3 = dest_word_ty(@kernel.type_of(e_p))
        let th1_1 = @cart.dimindex_conv(
          @kernel.inst(@list.List([(n_3, en)]), dn),
        )
        let n_4 = @equal.rhs(@kernel.concl(th1_1))
        if @basics.aconv(
            n_4,
            @kernel.rand(@kernel.rand(@lib.hd(@kernel.hyp(th_5)))),
          ) {
          @bool.prove_hyp(
            @bool.prove_hyp(
              th1_1,
              @bool.pinst(
                @list.List([(n_3, en)]),
                @list.List([(n_4, en_1), (e_p, ee_p)]),
                pthw,
              ),
            ),
            th_5,
          )
        } else {
          raise Failure("bitpat_irrefutable_thm: incorrect bit length")
        }
      }
      _ => raise Failure("bitpat_irrefutable_thm")
    }
  })
}

///|
let bitpat_irrefutable_thm_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "bitpat_irrefutable_thm",
)

///|
/// `bitpat_irrefutable_thm`
pub fn bitpat_irrefutable_thm(x : @kernel.Term) -> @kernel.Thm raise {
  bitpat_irrefutable_thm_c.get()(x)
}

///|
/// `ONLY_BITMATCH_CASES_THEN`
pub fn only_bitmatch_cases_then(
  x624 : (@list.List[@kernel.Thm]) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise,
) -> @tactics.Tactic raise {
  let thltac = x624
  (x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
    with_goal(
      fn(
        x626 : @kernel.Term,
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
        let w = x626
        let f : (@kernel.Term) -> Bool raise = fn(
          x628 : @kernel.Term,
        ) -> Bool raise {
          match x628 {
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), _),
              _
            ) => true
            _ => false
          }
        }
        let t630 = @kernel.dest_comb(@basics.find_term(f, w))
        let t631 = (fn(x629 : @kernel.Term) -> @kernel.Term raise { x629 })(
          t630.1,
        )
        let (e, cs) = (@kernel.rand(t630.0), t631)
        fn tac(
          x632 : @list.List[@kernel.Thm],
          x633 : @kernel.Term,
        ) -> @tactics.Tactic raise {
          let thl = x632
          match x633 {
            @kernel.Term::Comb(
              @kernel.Term::Comb(
                @kernel.Term::Const("_SEQPATTERN", _),
                @kernel.Term::Abs(_, @kernel.Term::Abs(_, c))
              ),
              cs_1
            ) => {
              fn go(
                x635 : @kernel.Term,
              ) -> (@kernel.Term, @tactics.Tactic) raise {
                match x635 {
                  @kernel.Term::Comb(
                    @kernel.Term::Const("?", _) as f_1,
                    @kernel.Term::Abs(z, c_1)
                  ) => {
                    let (tm, tac1) = go(c_1)
                    let t636 = @tactics.then_tac(
                      @tactics.pop_assum(@tactics.choose_tac),
                      tac1,
                    )
                    (@kernel.mk_comb(f_1, @kernel.mk_abs(z, tm)), t636)
                  }
                  tm_1 => {
                    let t637 = @parser.parse_type("N")
                    let t638 = @kernel.mk_comb(
                      @kernel.mk_const(
                        "val",
                        @list.List([(dest_word_ty(@kernel.type_of(e)), t637)]),
                      ),
                      e,
                    )
                    (
                      @kernel.mk_comb(@kernel.rator(@equal.lhand(tm_1)), t638),
                      @tactics.all_tac,
                    )
                  }
                }
              }
              let (tm_2, tac1_1) = go(c)
              if bitpat_irrefutable(c) {
                let t641 = @tactics.pop_assum(fn(
                  x639 : @kernel.Thm,
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
                  let th = x639
                  thltac(thl.prepend(th))
                })
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.assume_tac(bitpat_irrefutable_thm(tm_2)),
                    tac1_1,
                  ),
                  t641,
                )
              } else {
                let t646 = @tactics.pop_assum(fn(
                  x644 : @kernel.Thm,
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
                  let th_2 = x644
                  tac(thl.prepend(th_2), cs_1)
                })
                let t647 = @list.List([
                  @tactics.then_tac(
                    tac1_1,
                    @tactics.pop_assum(fn(
                      x642 : @kernel.Thm,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
                      (
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                        @list.List[@kernel.Thm],
                      ) -> @kernel.Thm raise,
                    ) raise) raise {
                      let th_1 = x642
                      thltac(thl.prepend(th_1))
                    }),
                  ),
                  t646,
                ])
                @tactics.thenl(@class.asm_cases_tac(tm_2), t647)
              }
            }
            _ => thltac(thl)
          }
        }
        tac(@list.List([]), cs)
      },
      x649,
    )
  }
}

///|
/// BITMATCH_ASM_CASES_TAC
fn step_54() -> Unit raise {
  bitmatch_asm_cases_tac_c.set(
    only_bitmatch_cases_then(fn(
      x650 : @list.List[@kernel.Thm],
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
      let thl = x650
      let t655 = @tactics.map_every(
        fn(
          x652 : @kernel.Thm,
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
          let s653 = @tactics.assume_tac(x652)
          fn(
            x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s653(x654)
          }
        },
        thl,
      )
      @tactics.then_tac(
        @tactics.conv_tac(@equal.top_sweep_conv(bitmatch_simp_conv(thl))),
        t655,
      )
    }),
  )
}

///|
let bitmatch_asm_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "BITMATCH_ASM_CASES_TAC",
)

///|
/// `BITMATCH_ASM_CASES_TAC`
pub fn bitmatch_asm_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  bitmatch_asm_cases_tac_c.get()(x)
}

///|
/// BITMATCH_CASES_TAC
fn step_55() -> Unit raise {
  bitmatch_cases_tac_c.set(
    only_bitmatch_cases_then(fn(
      x663 : @list.List[@kernel.Thm],
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
        x662 : (@kernel.Term) -> @kernel.Thm raise,
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
          x656 : (@kernel.Term) -> @kernel.Thm raise,
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
          let s657 = @tactics.conv_tac(x656)
          fn(
            x658 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s657(x658)
          }
        })(
          (fn(
            x659 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s660 = @equal.top_sweep_conv(x659)
            fn(x661 : @kernel.Term) -> @kernel.Thm raise { s660(x661) }
          })(x662),
        )
      })(bitmatch_simp_conv(x663))
    }),
  )
}

///|
let bitmatch_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "BITMATCH_CASES_TAC",
)

///|
/// `BITMATCH_CASES_TAC`
pub fn bitmatch_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  bitmatch_cases_tac_c.get()(x)
}

///|
/// `bm_seq_numeral`
pub fn bm_seq_numeral(
  x664 : @kernel.Term,
) -> ((@num.Num) -> (@kernel.Term, @kernel.Thm) raise) raise {
  match x664 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), e) as me,
      cs
    ) => {
      let n = dest_word_ty(@kernel.type_of(e))
      let sz = @num.int63_of_num(@basics.dest_finty(n))
      let word = @kernel.mk_const(
        "word",
        @list.List([(n, @parser.parse_type("N"))]),
      )
      fn mk_fun(
        x666 : @kernel.Term,
      ) -> ((@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
        let cs_1 = x666
        let tm = @kernel.mk_comb(me, cs_1)
        let th = bm_first_case_conv(tm)
        let inst : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
          x668 : @kernel.Term,
        ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          let e_p = x668
          fn(x669 : @kernel.Thm) -> @kernel.Thm raise {
            let th_1 = x669
            if @kernel.is_var(e) {
              @kernel.inst_rule(@list.List([(e_p, e)]), th_1)
            } else {
              th_1
            }
          }
        }
        match cs_1 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("_SEQPATTERN", _), c),
            cs_p
          ) => {
            let ps = @lib.hd(@kernel.hyp(th))
            let pats = @lib.array_init(sz, fn(
              x670 : Int64,
            ) -> @kernel.Thm? raise {
              let i = x670
              try {
                let t671 = @nums.mk_numeral(@num.num_of_int64(i))
                Some(bm_skip_clause(pat_to_bit(false)(t671))(tm))
              } catch {
                Failure(_) => None
                e => raise e
              }
            })
            let f : (@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise = mk_fun(
              cs_p,
            )
            fn(x672 : @num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let n_1 = x672
              fn(x673 : @kernel.Term) -> @kernel.Thm raise {
                let e_p_1 = x673
                match bitpat_matches(c, n_1) {
                  None => {
                    let (ls, th_p) = inst_bitpat_numeral(ps)(n_1)
                    @bool.prove_hyp(th_p, @kernel.inst_rule(ls, th))
                  }
                  Some(i_1) =>
                    match @lib.array_get(pats, @lib.int63_to_int(i_1)) {
                      Some(th_p_1) => {
                        let th1 = inst(e_p_1)(th_p_1)
                        let th2 = match @lib.hd(@kernel.hyp(th1)) {
                          @kernel.Term::Comb(@kernel.Term::Const("~", _), p) =>
                            @bool.eqf_elim(@words.word_red_conv(p))
                          p_1 => @bool.eqt_elim(@words.word_red_conv(p_1))
                        }
                        let t674 = f(n_1)(e_p_1)
                        @kernel.trans(@bool.prove_hyp(th2, th1), t674)
                      }
                      _ => raise @lib.MatchFailure("tscript.ml:1168")
                    }
                }
              }
            }
          }
          @kernel.Term::Comb(@kernel.Term::Const("_ELSEPATTERN", _), _) =>
            fn(x675 : @num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              fn(x676 : @kernel.Term) -> @kernel.Thm raise {
                let e_p_2 = x676
                inst(e_p_2)(th)
              }
            }
          _ => raise Failure("bm_seq_numeral")
        }
      }
      let f_1 : (@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise = mk_fun(
        cs,
      )
      fn(x677 : @num.Num) -> (@kernel.Term, @kernel.Thm) raise {
        let n_2 = x677
        let e_1 = @kernel.mk_comb(word, @nums.mk_numeral(n_2))
        (e_1, f_1(n_2)(e_1))
      }
    }
    _ => raise Failure("bm_seq_numeral")
  }
}

///|
/// `BITMATCH_SEQ_CONV`
pub fn bitmatch_seq_conv(x679 : @kernel.Term) -> @kernel.Thm raise {
  match x679 {
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const("_BITMATCH", _),
        @kernel.Term::Comb(@kernel.Term::Const("word", _), n)
      ),
      _
    ) as tm => {
      let t680 = @basics.dest_numeral(n)
      bm_seq_numeral(tm)(t680).1
    }
    _ => raise Failure("BITMATCH_CONV")
  }
}

///|
/// bm_check_disjointness
fn step_56() -> Unit raise {
  let overlaps : (FixedArray[Bool?]) -> ((FixedArray[Bool?]) -> ((Int64) -> Bool raise) raise) raise = fn(
    x683 : FixedArray[Bool?],
  ) -> ((FixedArray[Bool?]) -> ((Int64) -> Bool raise) raise) raise {
    let _ as pat0 = x683
    fn(x684 : FixedArray[Bool?]) -> ((Int64) -> Bool raise) raise {
      let pat1 = x684
      fn(x685 : Int64) -> Bool raise {
        let sz = x685
        let overlaps_i : (Int64) -> Bool raise = fn(
          x686 : Int64,
        ) -> Bool raise {
          let idx = x686
          let t687 = @lib.array_get(pat0, @lib.int63_to_int(idx))
          match (t687, @lib.array_get(pat1, @lib.int63_to_int(idx))) {
            (Some(b0), Some(b1)) => b0 == b1
            (_, _) => true
          }
        }
        fn overlaps_all(x688 : Int64) -> Bool raise {
          let idx_1 = x688
          if idx_1 == sz {
            true
          } else {
            overlaps_i(idx_1) && overlaps_all(@lib.add63(idx_1, 1L))
          }
        }
        overlaps_all(0L)
      }
    }
  }
  bm_check_disjointness_c.set(fn(x689 : @kernel.Term) -> Unit raise {
    let tm = x689
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("_BITMATCH", _), bitval),
        patterns
      ) => {
        let valty = @kernel.type_of(bitval)
        match valty {
          @kernel.HolType::Tyapp("word", More(n_1, tail=Empty)) => {
            let bitwidth = @num.int63_of_num(@basics.dest_finty(n_1))
            let pattern_arrs = bm_analyze_clauses(bitwidth, patterns)
            @lib.list_iteri(
              fn(x690 : Int, x691 : FixedArray[Bool?]) -> Unit raise {
                let idx0 = x690
                let pattern0 = x691
                @lib.list_iteri(
                  fn(x692 : Int, x693 : FixedArray[Bool?]) -> Unit raise {
                    let idx1 = x692
                    let pattern1 = x693
                    if overlaps(pattern0)(pattern1)(bitwidth) {
                      let idx0_str = Int64::to_string(Int::to_int64(idx0))
                      let idx1_str = Int64::to_string(Int::to_int64(idx1))
                      raise @num.InvalidArgument(
                        "Pattern number " +
                        (
                          idx0_str +
                          (" and pattern number " + (idx1_str + " overlap"))
                        ),
                      )
                    } else {
                      ()
                    }
                  },
                  first_n_l(pattern_arrs, Int::to_int64(idx0)),
                )
              },
              pattern_arrs,
            )
          }
          _ =>
            raise @num.InvalidArgument(
              "bm_check_disjointness: word's bitwidth is unknown",
            )
        }
      }
      _ => raise @num.InvalidArgument("bm_check_disjointness: not bitmatch")
    }
  })
}

///|
let bm_check_disjointness_c : @lib.Cell[(@kernel.Term) -> Unit raise] = @lib.Cell::new(
  "bm_check_disjointness",
)

///|
/// `bm_check_disjointness`
pub fn bm_check_disjointness(x : @kernel.Term) -> Unit raise {
  bm_check_disjointness_c.get()(x)
}

///|
fn[TA] first_n_l(x681 : @list.List[TA], x682 : Int64) -> @list.List[TA] raise {
  let l = x681
  let n = x682
  if n == 0L {
    @list.List([])
  } else {
    match l {
      More(h, tail=t) => first_n_l(t, @lib.sub63(n, 1L)).prepend(h)
      Empty => @list.List([])
    }
  }
}

///|
/// Library/bitmatch.ml:1229
fn step_57() -> Unit raise {
  bm_check_disjointness(
    disjointness_example([mk_bitpat([example_word2(0L)]), mk_bitpat([example_word2(2L)])]),
  )
}

///|
/// Library/bitmatch.ml:1231
fn step_58() -> Unit raise {
  bm_check_disjointness(
    disjointness_example([
      mk_bitpat([@kernel.mk_const("T", @list.List([])), @kernel.mk_var("x", @kernel.bool_ty)]),
      mk_bitpat([@kernel.mk_const("F", @list.List([])), @kernel.mk_var("y", @kernel.bool_ty)]),
    ]),
  )
}

///|
/// Library/bitmatch.ml:1233
fn step_59() -> Unit raise {
  try {
    bm_check_disjointness(
      disjointness_example([mk_bitpat([example_word2(0L)]), mk_bitpat([example_word2(0L)])]),
    )
    raise Failure("Must fail")
  } catch {
    @num.InvalidArgument(_) => ()
    e => raise e
  }
}

///|
/// Library/bitmatch.ml:1238
fn step_60() -> Unit raise {
  try {
    bm_check_disjointness(
      disjointness_example([
        mk_bitpat([@kernel.mk_const("T", @list.List([])), @kernel.mk_var("x", @kernel.bool_ty)]),
        mk_bitpat([@kernel.mk_var("y", @kernel.bool_ty), @kernel.mk_const("T", @list.List([]))]),
      ]),
    )
    raise Failure("Must fail")
  } catch {
    @num.InvalidArgument(_) => ()
    e => raise e
  }
}

///|
/// Library/bitmatch.ml:1243
fn step_61() -> Unit raise {
  try {
    bm_check_disjointness(
      disjointness_example([mk_bitpat([example_word2(3L)]), mk_bitpat([example_word2(0L)]), mk_bitpat([example_word2(0L)])]),
    )
    raise Failure("Must fail")
  } catch {
    @num.InvalidArgument(_) => ()
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
  step_15()
  step_16()
  step_17()
  step_18()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
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
}
