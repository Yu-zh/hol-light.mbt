// Translated from upstream Library/card.ml; edit this file directly.

///|
/// `TRANS_CHAIN_TAC`
pub fn trans_chain_tac(
  x1 : @kernel.Thm,
) -> ((@list.List[@kernel.Term]) -> @tactics.Tactic raise) raise {
  let th = x1
  (x6 : @list.List[@kernel.Term]) => {
    @tactics.map_every(
      fn(
        x3 : @kernel.Term,
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
        let t = x3
        let t5 = @simp.asm_rewrite_tac(@list.List([]))
        @tactics.then_tac(@tactics.trans_tac(th)(t), t5)
      },
      x6,
    )
  }
}

///|
/// sum_DISTINCT
fn step_1() -> Unit raise {
  sum_distinct_c.set(@ind_types.distinctness("sum"))
}

///|
let sum_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_DISTINCT")

///|
/// `sum_DISTINCT`
pub fn sum_distinct() -> @kernel.Thm {
  sum_distinct_c.get()
}

///|
/// sum_INJECTIVE
fn step_2() -> Unit raise {
  sum_injective_c.set(@ind_types.injectivity("sum"))
}

///|
let sum_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_INJECTIVE")

///|
/// `sum_INJECTIVE`
pub fn sum_injective() -> @kernel.Thm {
  sum_injective_c.get()
}

///|
/// sum_CASES
fn step_3() -> Unit raise {
  sum_cases_c.set(@ind_types.prove_cases_thm(@ind_types.sum_induct()))
}

///|
let sum_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_CASES")

///|
/// `sum_CASES`
pub fn sum_cases() -> @kernel.Thm {
  sum_cases_c.get()
}

///|
/// FORALL_SUM_THM
fn step_4() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([sum_cases()]))
  forall_sum_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ z : Sum[_, _], (P : (Sum[_, _]) -> Bool)(z)) == ((∀ x : _, P(INL(x))) && (∀ x : _, P(INR(x))))"),
      t7,
    ),
  )
}

///|
let forall_sum_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_SUM_THM")

///|
/// `FORALL_SUM_THM`
pub fn forall_sum_thm() -> @kernel.Thm {
  forall_sum_thm_c.get()
}

///|
/// EXISTS_SUM_THM
fn step_5() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([sum_cases()]))
  exists_sum_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ z : Sum[_, _], (P : (Sum[_, _]) -> Bool)(z)) == ((∃ x : _, P(INL(x))) || (∃ x : _, P(INR(x))))"),
      t8,
    ),
  )
}

///|
let exists_sum_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_SUM_THM")

///|
/// `EXISTS_SUM_THM`
pub fn exists_sum_thm() -> @kernel.Thm {
  exists_sum_thm_c.get()
}

///|
/// FLATTEN_LEMMA
fn step_6() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([]))
  flatten_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (g : (_) -> _)((f : (_) -> _)(x)) == x) == (∀ y : _, ∀ x : _, IN(x, s) && y == f(x) → g(y) == x)"),
      t9,
    ),
  )
}

///|
let flatten_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLATTEN_LEMMA")

///|
/// `FLATTEN_LEMMA`
pub fn flatten_lemma() -> @kernel.Thm {
  flatten_lemma_c.get()
}

///|
/// TARSKI_SET
fn step_7() -> Unit raise {
  let t26 = @meson.asm_meson_tac(
    @list.List([@sets.in_inters(), @sets.subset()]),
  )
  let t25 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((f : ((A) -> Bool, A) -> Bool)((a : (A) -> Bool)), a)"), fn(
    x23 : @kernel.Thm,
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
    let th = x23
    @meson.asm_meson_tac(
      @list.List([@sets.subset_antisym(), @sets.in_inters(), th]),
    )
  })
  let t22 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@sets.subset_trans(), @sets.in_inters(), @sets.subset()]),
    ),
    @tactics.all_tac,
  ])
  let t21 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ b : (A) -> Bool, IN(b, (Y : ((A) -> Bool) -> Bool)) → SUBSET((f : ((A) -> Bool, A) -> Bool)((a : (A) -> Bool)), b)"),
    fn(
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
    },
  )
  let t16 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t17 = @list.List([
    @tactics.then_tac(@simp.expand_tac("Y"), t16),
    @tactics.all_tac,
  ])
  let t15 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ b : (A) -> Bool, IN(b, (Y : ((A) -> Bool) -> Bool)) == SUBSET((f : ((A) -> Bool, A) -> Bool)(b), b)"),
    fn(
      x12 : @kernel.Thm,
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
      let s13 = @tactics.assume_tac(x12)
      fn(
        x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s13(x14)
      }
    },
  )
  let t10 = @term_syntax.parse_term("(a : (A) -> Bool) == INTERS((Y : ((A) -> Bool) -> Bool))")
  let t11 = @tactics.map_every(
    @simp.abbrev_tac,
    @list.List([@term_syntax.parse_term("(Y : ((A) -> Bool) -> Bool) == {(b : (A) -> Bool) | SUBSET((f : ((A) -> Bool, A) -> Bool)(b), b)}"), t10]),
  )
  let t27 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t11),
              t15,
            ),
            t17,
          ),
          t21,
        ),
        t22,
      ),
      t25,
    ),
    t26,
  )
  tarski_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((A) -> Bool, A) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) → SUBSET(f(s), f(t))) → (∃ s : (A) -> Bool, f(s) == s)"),
      t27,
    ),
  )
}

///|
let tarski_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_SET")

///|
/// `TARSKI_SET`
pub fn tarski_set() -> @kernel.Thm {
  tarski_set_c.get()
}

///|
/// INJECTIVE_LEFT_INVERSE_NONEMPTY
fn step_8() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([]))
  let t29 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        flatten_lemma(),
        @equal.gsym(@class.skolem_thm()),
        @theorems.and_forall_thm(),
      ]),
    ),
    t28,
  )
  injective_left_inverse_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ x : _, IN(x, (s : (_) -> Bool))) → (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && (f : (_) -> _)(x) == f(y) → x == y) == (∃ g : (_) -> _, (∀ y : _, IN(y, (t : (_) -> Bool)) → IN(g(y), s)) && (∀ x : _, IN(x, s) → g(f(x)) == x))"),
      t29,
    ),
  )
}

///|
let injective_left_inverse_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INJECTIVE_LEFT_INVERSE_NONEMPTY",
)

///|
/// `INJECTIVE_LEFT_INVERSE_NONEMPTY`
pub fn injective_left_inverse_nonempty() -> @kernel.Thm {
  injective_left_inverse_nonempty_c.get()
}

///|
/// BIJECTIVE_INJECTIVE_SURJECTIVE
fn step_9() -> Unit raise {
  let t30 = @meson.meson_tac(@list.List([]))
  bijective_injective_surjective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((∀ x : _, IN(x, (s : (_) -> Bool)) → IN((f : (_) -> _)(x), (t : (_) -> Bool))) && (∀ y : _, IN(y, t) → existsunique((x : _) => IN(x, s) && f(x) == y))) == ((∀ x : _, IN(x, s) → IN(f(x), t)) && (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && (∀ y : _, IN(y, t) → (∃ x : _, IN(x, s) && f(x) == y)))"),
      t30,
    ),
  )
}

///|
let bijective_injective_surjective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BIJECTIVE_INJECTIVE_SURJECTIVE",
)

///|
/// `BIJECTIVE_INJECTIVE_SURJECTIVE`
pub fn bijective_injective_surjective() -> @kernel.Thm {
  bijective_injective_surjective_c.get()
}

///|
/// BIJECTIVE_INVERSES
fn step_10() -> Unit raise {
  let t33 = @meson.asm_meson_tac(@list.List([]))
  let t32 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t31 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)"),
    ),
  )
  let t34 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    bijective_injective_surjective(),
                    @sets.injective_on_left_inverse(),
                    @sets.surjective_on_right_inverse(),
                  ]),
                ),
                t31,
              ),
              @tactics.disch_tac,
            ),
            t32,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.abs_tac,
      ),
      @tactics.eq_tac,
    ),
    t33,
  )
  bijective_inverses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((∀ x : _, IN(x, (s : (_) -> Bool)) → IN((f : (_) -> _)(x), (t : (_) -> Bool))) && (∀ y : _, IN(y, t) → existsunique((x : _) => IN(x, s) && f(x) == y))) == ((∀ x : _, IN(x, s) → IN(f(x), t)) && (∃ g : (_) -> _, (∀ y : _, IN(y, t) → IN(g(y), s)) && (∀ y : _, IN(y, t) → f(g(y)) == y) && (∀ x : _, IN(x, s) → g(f(x)) == x)))"),
      t34,
    ),
  )
}

///|
let bijective_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BIJECTIVE_INVERSES",
)

///|
/// `BIJECTIVE_INVERSES`
pub fn bijective_inverses() -> @kernel.Thm {
  bijective_inverses_c.get()
}

///|
/// EQ_C_BIJECTIONS
fn step_11() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([]))
  let t41 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (f : (A) -> B)(x) == y)"),
  )
  let t40 = @list.List([@tactics.strip_tac, @meson.meson_tac(@list.List([]))])
  let t39 = @simp.rewrite_tac(@list.List([]))
  let t38 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t37 = @simp.gen_rewrite_tac(
    fn(
      x36 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x36
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t35 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t35),
                  @tactics.ap_term_tac,
                ),
                t37,
              ),
              t38,
            ),
            t39,
          ),
          @tactics.eq_tac,
        ),
        t40,
      ),
      t41,
    ),
    t42,
  )
  eq_c_bijections_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(s, t) == (∃ f : (A) -> B, ∃ g : (B) -> A, (∀ x : A, IN(x, s) → IN(f(x), t) && g(f(x)) == x) && (∀ y : B, IN(y, t) → IN(g(y), s) && f(g(y)) == y))"),
      t43,
    ),
  )
}

///|
let eq_c_bijections_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_BIJECTIONS",
)

///|
/// `EQ_C_BIJECTIONS`
pub fn eq_c_bijections() -> @kernel.Thm {
  eq_c_bijections_c.get()
}

///|
/// EQ_C
fn step_12() -> Unit raise {
  let t69 = @meson.asm_meson_tac(@list.List([]))
  let t68 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t67 = @simp.gen_rewrite_tac(
    fn(
      x66 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x60 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s61 = @equal.land_conv(x60)
        fn(x62 : @kernel.Term) -> @kernel.Thm raise { s61(x62) }
      })(
        (fn(
          x63 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s64 = @equal.top_depth_conv(x63)
          fn(x65 : @kernel.Term) -> @kernel.Thm raise { s64(x65) }
        })(x66),
      )
    },
    @list.List([
      @theorems.exists_unique_alt(),
      @class.right_imp_exists_thm(),
      @class.skolem_thm(),
    ]),
  )
  let t59 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x53 : @kernel.Thm,
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
        let s54 = @tactics.mp_tac(x53)
        fn(
          x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s54(x55)
        }
      },
      fn(
        x56 : @kernel.Thm,
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
        let s57 = @tactics.assume_tac(x56)
        fn(
          x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s57(x58)
        }
      },
    ),
  )
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(
            @tactics.choose_then(
              @tactics.conjuncts_then2(
                fn(
                  x47 : @kernel.Thm,
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
                  let s48 = @tactics.assume_tac(x47)
                  fn(
                    x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s48(x49)
                  }
                },
                fn(
                  x50 : @kernel.Thm,
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
                  let s51 = @tactics.mp_tac(x50)
                  fn(
                    x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s51(x52)
                  }
                },
              ),
            ),
          ),
          t59,
        ),
        t67,
      ),
      t68,
    ),
    t69,
  )
  let t46 = @meson.asm_meson_tac(@list.List([]))
  let t45 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t44 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (x, y) => IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool)) && y == (f : (A) -> B)(x) }"),
  )
  let t71 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(
            @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
              @tactics.strip_assume_tac,
            ),
          ),
          t44,
        ),
        t45,
      ),
      t46,
    ),
    t70,
  ])
  let t72 = @tactics.thenl(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.eq_c()])),
      @tactics.eq_tac,
    ),
    t71,
  )
  eq_c_c.set(
    @tactics.prove(
      @term_syntax.parse_term("op_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool)) == (∃ R : ((A, B)) -> Bool, (∀ x : A, ∀ y : B, R((x, y)) → IN(x, s) && IN(y, t)) && (∀ x : A, IN(x, s) → existsunique((y : B) => IN(y, t) && R((x, y)))) && (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && R((x, y)))))"),
      t72,
    ),
  )
}

///|
let eq_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_C")

///|
/// `EQ_C`
pub fn eq_c() -> @kernel.Thm {
  eq_c_c.get()
}

///|
/// EQ_C_ALT
fn step_13() -> Unit raise {
  let t81 = @meson.asm_meson_tac(@list.List([]))
  let t80 = @simp.asm_rewrite_tac(@list.List([]))
  let t79 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), (R : ((A, B)) -> Bool)((x, y)) && IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool))))"),
  )
  let t78 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(R : ((A, B)) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t76 = @simp.simp_tac(@list.List([]))
  let t77 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t76),
    @tactics.all_tac,
  ])
  let t82 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x73 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s74 = @equal.land_conv(x73)
                  fn(x75 : @kernel.Term) -> @kernel.Thm raise { s74(x75) }
                },
                @list.List([eq_c()]),
              ),
              @tactics.eq_tac,
            ),
            t77,
          ),
          t78,
        ),
        t79,
      ),
      t80,
    ),
    t81,
  )
  eq_c_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("op_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool)) == (∃ R : ((A, B)) -> Bool, (∀ x : A, IN(x, s) → existsunique((y : B) => IN(y, t) && R((x, y)))) && (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && R((x, y)))))"),
      t82,
    ),
  )
}

///|
let eq_c_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_C_ALT")

///|
/// `EQ_C_ALT`
pub fn eq_c_alt() -> @kernel.Thm {
  eq_c_alt_c.get()
}

///|
/// CARD_LE_REFL
fn step_14() -> Unit raise {
  let t84 = @simp.simp_tac(@list.List([]))
  let t83 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => x"))
  let t85 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@sets.le_c()])),
      ),
      t83,
    ),
    t84,
  )
  card_le_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, op_lt_eq_us_c(s, s)"), t85),
  )
}

///|
let card_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_REFL")

///|
/// `CARD_LE_REFL`
pub fn card_le_refl() -> @kernel.Thm {
  card_le_refl_c.get()
}

///|
/// CARD_EMPTY_LE
fn step_15() -> Unit raise {
  let t86 = @simp.rewrite_tac(
    @list.List([@sets.le_c_v1(), @sets.not_in_empty()]),
  )
  card_empty_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (B) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(({} : (A) -> Bool), s)"), t86),
  )
}

///|
let card_empty_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EMPTY_LE")

///|
/// `CARD_EMPTY_LE`
pub fn card_empty_le() -> @kernel.Thm {
  card_empty_le_c.get()
}

///|
/// CARD_LE_TRANS
fn step_16() -> Unit raise {
  let t95 = @meson.asm_meson_tac(@list.List([]))
  let t94 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t93 = @tactics.exists_tac(@term_syntax.parse_term("o((g : (B) -> C), (f : (A) -> B))"))
  let t90 = @term_syntax.parse_term("(g : (B) -> C)")
  let t88 = @term_syntax.parse_term("(f : (A) -> B)")
  let t92 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x89 : @kernel.Thm) => @tactics.x_choose_tac(t88, x89),
      (x91 : @kernel.Thm) => @tactics.x_choose_tac(t90, x91),
    ),
  )
  let t87 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t96 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t87),
          t92,
        ),
        t93,
      ),
      t94,
    ),
    t95,
  )
  card_le_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, u) → op_lt_eq_us_c(s, u)"),
      t96,
    ),
  )
}

///|
let card_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_TRANS")

///|
/// `CARD_LE_TRANS`
pub fn card_le_trans() -> @kernel.Thm {
  card_le_trans_c.get()
}

///|
/// CARD_LT_REFL
fn step_17() -> Unit raise {
  let t97 = @meson.meson_tac(@list.List([@sets.lt_c(), card_le_refl()]))
  card_lt_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, !op_lt_us_c(s, s)"), t97),
  )
}

///|
let card_lt_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_REFL")

///|
/// `CARD_LT_REFL`
pub fn card_lt_refl() -> @kernel.Thm {
  card_lt_refl_c.get()
}

///|
/// CARD_LET_TRANS
fn step_18() -> Unit raise {
  let t100 = @simp.rewrite_tac(@list.List([card_le_trans()]))
  let t99 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) && ((c' : Bool) && a → (b' : Bool)) → a && b && !b' → c && !c'"),
    ),
  )
  let t98 = @simp.rewrite_tac(@list.List([@sets.lt_c()]))
  let t101 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t98),
      t99,
    ),
    t100,
  )
  card_let_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_us_c(t, u) → op_lt_us_c(s, u)"),
      t101,
    ),
  )
}

///|
let card_let_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LET_TRANS")

///|
/// `CARD_LET_TRANS`
pub fn card_let_trans() -> @kernel.Thm {
  card_let_trans_c.get()
}

///|
/// CARD_LTE_TRANS
fn step_19() -> Unit raise {
  let t104 = @simp.rewrite_tac(@list.List([card_le_trans()]))
  let t103 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) && (b && (c' : Bool) → (a' : Bool)) → (a && !a') && b → c && !c'"),
    ),
  )
  let t102 = @simp.rewrite_tac(@list.List([@sets.lt_c()]))
  let t105 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t102),
      t103,
    ),
    t104,
  )
  card_lte_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_lt_us_c(s, t) && op_lt_eq_us_c(t, u) → op_lt_us_c(s, u)"),
      t105,
    ),
  )
}

///|
let card_lte_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LTE_TRANS")

///|
/// `CARD_LTE_TRANS`
pub fn card_lte_trans() -> @kernel.Thm {
  card_lte_trans_c.get()
}

///|
/// CARD_LT_TRANS
fn step_20() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([@sets.lt_c(), card_lte_trans()]))
  card_lt_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_lt_us_c(s, t) && op_lt_us_c(t, u) → op_lt_us_c(s, u)"),
      t106,
    ),
  )
}

///|
let card_lt_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_TRANS")

///|
/// `CARD_LT_TRANS`
pub fn card_lt_trans() -> @kernel.Thm {
  card_lt_trans_c.get()
}

///|
/// CARD_EQ_REFL
fn step_21() -> Unit raise {
  let t109 = @meson.meson_tac(@list.List([]))
  let t108 = @simp.simp_tac(@list.List([]))
  let t107 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => x"))
  let t110 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@sets.eq_c()])),
        ),
        t107,
      ),
      t108,
    ),
    t109,
  )
  card_eq_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, op_eq_us_c(s, s)"), t110),
  )
}

///|
let card_eq_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_REFL")

///|
/// `CARD_EQ_REFL`
pub fn card_eq_refl() -> @kernel.Thm {
  card_eq_refl_c.get()
}

///|
/// CARD_EQ_REFL_IMP
fn step_22() -> Unit raise {
  let t111 = @simp.simp_tac(@list.List([card_eq_refl()]))
  card_eq_refl_imp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, s == t → op_eq_us_c(s, t)"), t111),
  )
}

///|
let card_eq_refl_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_REFL_IMP",
)

///|
/// `CARD_EQ_REFL_IMP`
pub fn card_eq_refl_imp() -> @kernel.Thm {
  card_eq_refl_imp_c.get()
}

///|
/// CARD_EQ_SYM
fn step_23() -> Unit raise {
  let t119 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t118 = @tactics.repeat_tac(
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t117 = @simp.gen_rewrite_tac(
    fn(
      x114 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s115 = @equal.rand_conv(x114)
      fn(x116 : @kernel.Term) -> @kernel.Thm raise { s115(x116) }
    },
    @list.List([@theorems.swap_exists_thm()]),
  )
  let t113 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t112 = @simp.rewrite_tac(@list.List([@sets.eq_c(), bijective_inverses()]))
  let t120 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t112),
          t113,
        ),
        t117,
      ),
      t118,
    ),
    t119,
  )
  card_eq_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_eq_us_c(s, t) == op_eq_us_c(t, s)"), t120),
  )
}

///|
let card_eq_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_SYM")

///|
/// `CARD_EQ_SYM`
pub fn card_eq_sym() -> @kernel.Thm {
  card_eq_sym_c.get()
}

///|
/// CARD_EQ_IMP_LE
fn step_24() -> Unit raise {
  let t121 = @meson.meson_tac(@list.List([]))
  let t122 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.eq_c()])),
    t121,
  )
  card_eq_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_eq_us_c(s, t) → op_lt_eq_us_c(s, t)"), t122),
  )
}

///|
let card_eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_IMP_LE")

///|
/// `CARD_EQ_IMP_LE`
pub fn card_eq_imp_le() -> @kernel.Thm {
  card_eq_imp_le_c.get()
}

///|
/// CARD_LT_IMP_LE
fn step_25() -> Unit raise {
  let t123 = @simp.simp_tac(@list.List([@sets.lt_c()]))
  card_lt_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_lt_us_c(s, t) → op_lt_eq_us_c(s, t)"), t123),
  )
}

///|
let card_lt_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_IMP_LE")

///|
/// `CARD_LT_IMP_LE`
pub fn card_lt_imp_le() -> @kernel.Thm {
  card_lt_imp_le_c.get()
}

///|
/// CARD_LE_RELATIONAL
fn step_26() -> Unit raise {
  let t127 = @meson.asm_meson_tac(@list.List([]))
  let t126 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t125 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (R : (A, B) -> Bool)(x, y))"),
  )
  let t124 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t128 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t124),
        t125,
      ),
      t126,
    ),
    t127,
  )
  card_le_relational_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, (∀ x : A, ∀ y : B, ∀ y' : B, IN(x, (s : (A) -> Bool)) && R(x, y) && R(x, y') → y == y') → op_lt_eq_us_c({(y : B) | ∃ x : A, IN(x, s) && R(x, y)}, s)"),
      t128,
    ),
  )
}

///|
let card_le_relational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_RELATIONAL",
)

///|
/// `CARD_LE_RELATIONAL`
pub fn card_le_relational() -> @kernel.Thm {
  card_le_relational_c.get()
}

///|
/// CARD_LE_RELATIONAL_FULL
fn step_27() -> Unit raise {
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t130 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (R : (A, B) -> Bool)(x, y))"),
  )
  let t129 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t133 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t129),
        t130,
      ),
      t131,
    ),
    t132,
  )
  card_le_relational_full_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ y : B, IN(y, t) → (∃ x : A, IN(x, s) && R(x, y))) && (∀ x : A, ∀ y : B, ∀ y' : B, IN(x, s) && IN(y, t) && IN(y', t) && R(x, y) && R(x, y') → y == y') → op_lt_eq_us_c(t, s)"),
      t133,
    ),
  )
}

///|
let card_le_relational_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_RELATIONAL_FULL",
)

///|
/// `CARD_LE_RELATIONAL_FULL`
pub fn card_le_relational_full() -> @kernel.Thm {
  card_le_relational_full_c.get()
}

///|
/// CARD_LE_EMPTY
fn step_28() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([]))
  let t135 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.le_c(), @sets.extension(), @sets.not_in_empty()]),
    ),
    t134,
  )
  card_le_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, (op_lt_eq_us_c : ((_) -> Bool, (_) -> Bool) -> Bool)(s, ({} : (_) -> Bool)) == (s == {})"), t135),
  )
}

///|
let card_le_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_EMPTY")

///|
/// `CARD_LE_EMPTY`
pub fn card_le_empty() -> @kernel.Thm {
  card_le_empty_c.get()
}

///|
/// CARD_EQ_EMPTY
fn step_29() -> Unit raise {
  let t136 = @meson.meson_tac(@list.List([]))
  let t137 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.eq_c(), @sets.extension(), @sets.not_in_empty()]),
    ),
    t136,
  )
  card_eq_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, (op_eq_us_c : ((_) -> Bool, (_) -> Bool) -> Bool)(s, ({} : (_) -> Bool)) == (s == {})"), t137),
  )
}

///|
let card_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_EMPTY")

///|
/// `CARD_EQ_EMPTY`
pub fn card_eq_empty() -> @kernel.Thm {
  card_eq_empty_c.get()
}

///|
/// CARD_LE_ANTISYM
fn step_30() -> Unit raise {
  let t153 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t152 = @class.asm_cases_tac(
    @term_syntax.parse_term("IN((y : B), IMAGE((f : (A) -> B), DIFF((s : (A) -> Bool), (u : (A) -> Bool))))"),
  )
  let t151 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)"))
  let t150 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.asm_tac(@sets.set_tac)(@list.List([])),
        @tactics.all_tac,
      ]),
    ),
  )
  let t149 = @simp.rewrite_tac(@list.List([]))
  let t148 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (x, y) => IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool)) && (!IN(x, (u : (A) -> Bool)) && y == (f : (A) -> B)(x) || IN(x, u) && x == (g : (B) -> A)(y)) }"),
  )
  let t145 = @term_syntax.parse_term("(u : (A) -> Bool)")
  let t147 = @tactics.disch_then((x146 : @kernel.Thm) => {
    @tactics.x_choose_tac(t145, x146)
  })
  let t144 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t143 = @simp.rewrite_tac(@list.List([]))
  let t142 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(X : (A) -> Bool) => IMAGE((g : (B) -> A), DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), DIFF((s : (A) -> Bool), X))))"),
      tarski_set(),
    ),
  )
  let t140 = @tactics.x_choose_then(@term_syntax.parse_term("(g : (B) -> A)"))(
    @tactics.strip_assume_tac,
  )
  let t141 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
        @tactics.strip_assume_tac,
      ),
      t140,
    ),
  )
  let t138 = @meson.meson_tac(@list.List([card_eq_imp_le(), card_eq_sym()]))
  let t139 = @list.List([
    @simp.rewrite_tac(
      @list.List([@sets.le_c(), eq_c(), @sets.injective_on_alt()]),
    ),
    t138,
  ])
  let t154 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.repeat_tac(@tactics.gen_tac),
                                @tactics.eq_tac,
                              ),
                              t139,
                            ),
                            t141,
                          ),
                          t142,
                        ),
                        t143,
                      ),
                      @tactics.ants_tac,
                    ),
                    t144,
                  ),
                  t147,
                ),
                t148,
              ),
              t149,
            ),
            t150,
          ),
          t151,
        ),
        @tactics.strip_tac,
      ),
      t152,
    ),
    t153,
  )
  card_le_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, s)) == op_eq_us_c(s, t)"),
      t154,
    ),
  )
}

///|
let card_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_ANTISYM",
)

///|
/// `CARD_LE_ANTISYM`
pub fn card_le_antisym() -> @kernel.Thm {
  card_le_antisym_c.get()
}

///|
/// CARD_LE_TOTAL
fn step_31() -> Unit raise {
  let t201 = @meson.asm_meson_tac(@list.List([]))
  let t200 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.in_()])),
  )
  let t199 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t198 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.in_(),
      @sets.extension(),
    ]),
  )
  let t194 = @term_syntax.parse_term("GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), x == (a : A) && y == (b : B) || (R : ((A, B)) -> Bool)((x, y))))")
  let t197 = @tactics.first_x_assum(fn(
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
      let s192 = @tactics.mp_tac(x191)
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
    })(((x195 : @kernel.Thm) => @bool.spec(t194, x195))(x196))
  })
  let t188 = @term_syntax.parse_term("(b : B)")
  let t186 = @term_syntax.parse_term("(a : A)")
  let t190 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x187 : @kernel.Thm) => @tactics.x_choose_tac(t186, x187),
      (x189 : @kernel.Thm) => @tactics.x_choose_tac(t188, x189),
    ),
  )
  let t185 = @simp.rewrite_tac(
    @list.List([@class.not_forall_thm(), @class.not_imp()]),
  )
  let t183 = @simp.gen_rewrite_rule(
    fn(
      x182 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x182
    },
    @list.List([@class.de_morgan_thm()]),
  )
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.first_x_assum(fn(
                  x184 : @kernel.Thm,
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
                    let s180 = @tactics.mp_tac(x179)
                    fn(
                      x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    ) raise {
                      s180(x181)
                    }
                  })(t183(x184))
                }),
                t185,
              ),
              t190,
            ),
            t197,
          ),
          t198,
        ),
        t199,
      ),
      t200,
    ),
    t201,
  )
  let t178 = @meson.asm_meson_tac(@list.List([]))
  let t177 = @simp.rewrite_tac(
    @list.List([
      @class.right_imp_exists_thm(),
      @class.skolem_thm(),
      @sets.le_c(),
    ]),
  )
  let t176 = @tactics.first_x_assum(
    @tactics.disj_cases_then(fn(
      x173 : @kernel.Thm,
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
      let s174 = @tactics.mp_tac(x173)
      fn(
        x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s174(x175)
      }
    }),
  )
  let t170 = @term_syntax.parse_term("GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), true))")
  let t203 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x172 : @kernel.Thm,
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
              x169 : @kernel.Thm,
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
              @tactics.all_tac
            })(((x171 : @kernel.Thm) => @bool.spec(t170, x171))(x172))
          }),
          t176,
        ),
        t177,
      ),
      t178,
    ),
    t202,
  ])
  let t168 = @class.asm_cases_tac(
    @term_syntax.parse_term("(∀ x : A, IN(x, (s : (A) -> Bool)) → (∃ y : B, IN(y, (t : (B) -> Bool)) && (R : ((A, B)) -> Bool)((x, y)))) || (∀ y : B, IN(y, t) → (∃ x : A, IN(x, s) && R((x, y))))"),
  )
  let t167 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(R : ((A, B)) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t166 = @simp.rewrite_tac(@list.List([]))
  let t165 = @tactics.first_x_assum(fn(
    x164 : @kernel.Thm,
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
      x161 : @kernel.Thm,
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
      let s162 = @tactics.subst1_tac(x161)
      fn(
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
        s162(x163)
      }
    })(@equal.sym(x164))
  })
  let t159 = @meson.meson_tac(@list.List([]))
  let t158 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_()]))
  let t157 = @simp.rewrite_tac(
    @list.List([@sets.unions(), @sets.in_elim_thm()]),
  )
  let t160 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("P")),
          t157,
        ),
        t158,
      ),
      t159,
    ),
    @tactics.all_tac,
  ])
  let t156 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(P : (((A, B)) -> Bool) -> Bool)"),
      @wo.zl_subsets_unions(),
    ),
  )
  let t155 = @simp.abbrev_tac(
    @term_syntax.parse_term("(P : (((A, B)) -> Bool) -> Bool) == ((R : ((A, B)) -> Bool) => (∀ x : A, ∀ y : B, R((x, y)) → IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool))) && (∀ x : A, ∀ y : B, ∀ y' : B, R((x, y)) && R((x, y')) → y == y') && (∀ x : A, ∀ x' : A, ∀ y : B, R((x, y)) && R((x', y)) → x == x'))"),
  )
  let t204 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t155),
                  t156,
                ),
                @tactics.ants_tac,
              ),
              t160,
            ),
            t165,
          ),
          t166,
        ),
        t167,
      ),
      t168,
    ),
    t203,
  )
  card_le_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) || op_lt_eq_us_c(t, s)"),
      t204,
    ),
  )
}

///|
let card_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_TOTAL")

///|
/// `CARD_LE_TOTAL`
pub fn card_le_total() -> @kernel.Thm {
  card_le_total_c.get()
}

///|
/// CARD_LET_TOTAL
fn step_32() -> Unit raise {
  let t205 = @meson.meson_tac(@list.List([card_le_total()]))
  let t206 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.lt_c()])),
    t205,
  )
  card_let_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) || op_lt_us_c(t, s)"),
      t206,
    ),
  )
}

///|
let card_let_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LET_TOTAL")

///|
/// `CARD_LET_TOTAL`
pub fn card_let_total() -> @kernel.Thm {
  card_let_total_c.get()
}

///|
/// CARD_LTE_TOTAL
fn step_33() -> Unit raise {
  let t207 = @meson.meson_tac(@list.List([card_le_total()]))
  let t208 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.lt_c()])),
    t207,
  )
  card_lte_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_us_c(s, t) || op_lt_eq_us_c(t, s)"),
      t208,
    ),
  )
}

///|
let card_lte_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LTE_TOTAL")

///|
/// `CARD_LTE_TOTAL`
pub fn card_lte_total() -> @kernel.Thm {
  card_lte_total_c.get()
}

///|
/// CARD_LT_TOTAL
fn step_34() -> Unit raise {
  let t209 = @meson.meson_tac(@list.List([card_le_total()]))
  let t210 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.lt_c(), @equal.gsym(card_le_antisym())]),
    ),
    t209,
  )
  card_lt_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(s, t) || op_lt_us_c(s, t) || op_lt_us_c(t, s)"),
      t210,
    ),
  )
}

///|
let card_lt_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_TOTAL")

///|
/// `CARD_LT_TOTAL`
pub fn card_lt_total() -> @kernel.Thm {
  card_lt_total_c.get()
}

///|
/// CARD_NOT_LE
fn step_35() -> Unit raise {
  let t211 = @meson.meson_tac(@list.List([card_le_total()]))
  let t212 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.lt_c()])),
    t211,
  )
  card_not_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, !op_lt_eq_us_c(s, t) == op_lt_us_c(t, s)"),
      t212,
    ),
  )
}

///|
let card_not_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NOT_LE")

///|
/// `CARD_NOT_LE`
pub fn card_not_le() -> @kernel.Thm {
  card_not_le_c.get()
}

///|
/// CARD_NOT_LT
fn step_36() -> Unit raise {
  let t213 = @meson.meson_tac(@list.List([card_le_total()]))
  let t214 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.lt_c()])),
    t213,
  )
  card_not_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, !op_lt_us_c(s, t) == op_lt_eq_us_c(t, s)"),
      t214,
    ),
  )
}

///|
let card_not_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NOT_LT")

///|
/// `CARD_NOT_LT`
pub fn card_not_lt() -> @kernel.Thm {
  card_not_lt_c.get()
}

///|
/// CARD_LT_LE
fn step_37() -> Unit raise {
  let t215 = @tactics.conv_tac(@class.taut)
  let t216 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.lt_c(), @equal.gsym(card_le_antisym())]),
    ),
    t215,
  )
  card_lt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_lt_us_c(s, t) == (op_lt_eq_us_c(s, t) && !op_eq_us_c(s, t))"),
      t216,
    ),
  )
}

///|
let card_lt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_LE")

///|
/// `CARD_LT_LE`
pub fn card_lt_le() -> @kernel.Thm {
  card_lt_le_c.get()
}

///|
/// CARD_LE_LT
fn step_38() -> Unit raise {
  let t226 = @simp.rewrite_tac(
    @list.List([@class.de_morgan_thm(), card_not_le(), card_eq_sym()]),
  )
  let t225 = @simp.gen_rewrite_tac(
    fn(
      x224 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x218 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s219 = @equal.land_conv(x218)
        fn(x220 : @kernel.Term) -> @kernel.Thm raise { s219(x220) }
      })(
        (fn(
          x221 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s222 = @equal.rand_conv(x221)
          fn(x223 : @kernel.Term) -> @kernel.Thm raise { s222(x223) }
        })(x224),
      )
    },
    @list.List([card_lt_le()]),
  )
  let t217 = @simp.rewrite_tac(@list.List([@equal.gsym(card_not_lt())]))
  let t227 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t217),
      t225,
    ),
    t226,
  )
  card_le_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_lt_eq_us_c(s, t) == (op_lt_us_c(s, t) || op_eq_us_c(s, t))"),
      t227,
    ),
  )
}

///|
let card_le_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_LT")

///|
/// `CARD_LE_LT`
pub fn card_le_lt() -> @kernel.Thm {
  card_le_lt_c.get()
}

///|
/// CARD_LE_CONG
fn step_39() -> Unit raise {
  let t235 = @simp.rewrite_tac(@list.List([card_le_trans()]))
  let t233 = @term_syntax.parse_term("op_lt_eq_us_c((s : (A) -> Bool), (t' : (D) -> Bool))")
  let t234 = @tactics.map_every(
    fn(
      x230 : @kernel.Term,
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
      let s231 = @tactics.exists_tac(x230)
      fn(
        x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s231(x232)
      }
    },
    @list.List([@term_syntax.parse_term("op_lt_eq_us_c((s' : (B) -> Bool), (t : (C) -> Bool))"), t233]),
  )
  let t229 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("∀ x : Bool, ∀ y : Bool, ((b : Bool) && (e : Bool) → x) && (x && (c : Bool) → (f : Bool)) && ((a : Bool) && f → y) && (y && (d : Bool) → e) → (a && b) && c && d → e == f"),
    ),
  )
  let t228 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t236 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t228),
        t229,
      ),
      t234,
    ),
    t235,
  )
  card_le_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_lt_eq_us_c(s, t) == op_lt_eq_us_c(s', t')"),
      t236,
    ),
  )
}

///|
let card_le_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_CONG")

///|
/// `CARD_LE_CONG`
pub fn card_le_cong() -> @kernel.Thm {
  card_le_cong_c.get()
}

///|
/// CARD_LT_CONG
fn step_40() -> Unit raise {
  let t239 = @simp.asm_rewrite_tac(@list.List([]))
  let t238 = @tactics.match_mp_tac(card_le_cong())
  let t237 = @simp.rewrite_tac(@list.List([@equal.gsym(card_not_le())]))
  let t240 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t237),
        @tactics.ap_term_tac,
      ),
      t238,
    ),
    t239,
  )
  card_lt_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_lt_us_c(s, t) == op_lt_us_c(s', t')"),
      t240,
    ),
  )
}

///|
let card_lt_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_CONG")

///|
/// `CARD_LT_CONG`
pub fn card_lt_cong() -> @kernel.Thm {
  card_lt_cong_c.get()
}

///|
/// CARD_EQ_TRANS
fn step_41() -> Unit raise {
  let t243 = @meson.asm_meson_tac(@list.List([card_le_trans()]))
  let t242 = @tactics.repeat_tac(@tactics.strip_tac)
  let t241 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t241),
      t242,
    ),
    t243,
  )
  card_eq_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(s, t) && op_eq_us_c(t, u) → op_eq_us_c(s, u)"),
      t244,
    ),
  )
}

///|
let card_eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_TRANS")

///|
/// `CARD_EQ_TRANS`
pub fn card_eq_trans() -> @kernel.Thm {
  card_eq_trans_c.get()
}

///|
/// CARD_EQ_CONG
fn step_42() -> Unit raise {
  let t251 = @meson.asm_meson_tac(@list.List([card_eq_sym()]))
  let t247 = @term_syntax.parse_term("(t' : (D) -> Bool)")
  let t248 = @list.List([@term_syntax.parse_term("(s' : (B) -> Bool)"), t247])
  let t249 = trans_chain_tac(card_eq_trans())(t248)
  let t245 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t246 = @list.List([@term_syntax.parse_term("(t : (C) -> Bool)"), t245])
  let t250 = @list.List([trans_chain_tac(card_eq_trans())(t246), t249])
  let t252 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.strip_tac),
          @tactics.eq_tac,
        ),
        @tactics.disch_tac,
      ),
      t250,
    ),
    t251,
  )
  card_eq_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_eq_us_c(s, t) == op_eq_us_c(s', t')"),
      t252,
    ),
  )
}

///|
let card_eq_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_CONG")

///|
/// `CARD_EQ_CONG`
pub fn card_eq_cong() -> @kernel.Thm {
  card_eq_cong_c.get()
}

///|
/// INFINITE_CARD_LE
fn step_43() -> Unit raise {
  let t253 = @simp.rewrite_tac(
    @list.List([
      @sets.infinite_enumerate_subset(),
      @sets.le_c(),
      @sets.in_univ(),
    ]),
  )
  infinite_card_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) == (op_lt_eq_us_c : ((Num) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Num) -> Bool), s)"),
      t253,
    ),
  )
}

///|
let infinite_card_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_CARD_LE",
)

///|
/// `INFINITE_CARD_LE`
pub fn infinite_card_le() -> @kernel.Thm {
  infinite_card_le_c.get()
}

///|
/// FINITE_CARD_LT
fn step_44() -> Unit raise {
  let t254 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@sets.infinite()),
      card_not_lt(),
      infinite_card_le(),
    ]),
  )
  let t255 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
    ),
    t254,
  )
  finite_card_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (FINITE : ((A) -> Bool) -> Bool)(s) == (op_lt_us_c : ((A) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool))"),
      t255,
    ),
  )
}

///|
let finite_card_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CARD_LT")

///|
/// `FINITE_CARD_LT`
pub fn finite_card_lt() -> @kernel.Thm {
  finite_card_lt_c.get()
}

///|
/// CARD_LE_SUBSET
fn step_45() -> Unit raise {
  let t256 = @metis.metis_tac(@list.List([@trivia.i_thm()]))
  let t257 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.subset(), @sets.le_c()])),
    t256,
  )
  card_le_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) → op_lt_eq_us_c(s, t)"),
      t257,
    ),
  )
}

///|
let card_le_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_SUBSET")

///|
/// `CARD_LE_SUBSET`
pub fn card_le_subset() -> @kernel.Thm {
  card_le_subset_c.get()
}

///|
/// CARD_LE_UNIV
fn step_46() -> Unit raise {
  let t258 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t259 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(card_le_subset())),
    t258,
  )
  card_le_univ_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (A) -> Bool) -> Bool)(s, (UNIV : (A) -> Bool))"), t259),
  )
}

///|
let card_le_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_UNIV")

///|
/// `CARD_LE_UNIV`
pub fn card_le_univ() -> @kernel.Thm {
  card_le_univ_c.get()
}

///|
/// CARD_LE_EQ_SUBSET
fn step_47() -> Unit raise {
  let t276 = @meson.asm_meson_tac(@list.List([]))
  let t275 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.subset()]))
  let t274 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t273 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool))"))
  let t272 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t271 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t270 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.eq_c()]))
  let t268 = @simp.asm_rewrite_tac(@list.List([card_le_cong(), card_eq_refl()]))
  let t267 = @tactics.match_mp_tac(card_le_cong())
  let t266 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → b → a")),
  )
  let t263 = @drule.match_mp(card_le_subset())
  let t265 = @tactics.first_assum(fn(
    x264 : @kernel.Thm,
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
      x260 : @kernel.Thm,
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
      let s261 = @tactics.mp_tac(x260)
      fn(
        x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s261(x262)
      }
    })(t263(x264))
  })
  let t269 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t265),
          t266,
        ),
        t267,
      ),
      t268,
    ),
  ])
  let t277 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    @tactics.eq_tac,
                  ),
                  t269,
                ),
                t270,
              ),
              t271,
            ),
            t272,
          ),
          t273,
        ),
        t274,
      ),
      t275,
    ),
    t276,
  )
  card_le_eq_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) == (∃ u : (B) -> Bool, SUBSET(u, t) && op_eq_us_c(s, u))"),
      t277,
    ),
  )
}

///|
let card_le_eq_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_EQ_SUBSET",
)

///|
/// `CARD_LE_EQ_SUBSET`
pub fn card_le_eq_subset() -> @kernel.Thm {
  card_le_eq_subset_c.get()
}

///|
/// CARD_LE_EQ_SUBSET_UNIV
fn step_48() -> Unit raise {
  let t278 = @meson.meson_tac(@list.List([card_eq_sym()]))
  let t279 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([card_le_eq_subset(), @sets.subset_univ()])),
    t278,
  )
  card_le_eq_subset_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (∃ t : (B) -> Bool, (op_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s)) == (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(s, (UNIV : (B) -> Bool))"),
      t279,
    ),
  )
}

///|
let card_le_eq_subset_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_EQ_SUBSET_UNIV",
)

///|
/// `CARD_LE_EQ_SUBSET_UNIV`
pub fn card_le_eq_subset_univ() -> @kernel.Thm {
  card_le_eq_subset_univ_c.get()
}

///|
/// CARD_INFINITE_CONG
fn step_49() -> Unit raise {
  let t282 = @simp.asm_rewrite_tac(@list.List([card_eq_refl()]))
  let t281 = @tactics.match_mp_tac(card_le_cong())
  let t280 = @tactics.repeat_tac(@tactics.strip_tac)
  let t283 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([infinite_card_le()])),
        t280,
      ),
      t281,
    ),
    t282,
  )
  card_infinite_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(s, t) → INFINITE(s) == INFINITE(t)"),
      t283,
    ),
  )
}

///|
let card_infinite_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_INFINITE_CONG",
)

///|
/// `CARD_INFINITE_CONG`
pub fn card_infinite_cong() -> @kernel.Thm {
  card_infinite_cong_c.get()
}

///|
/// CARD_FINITE_CONG
fn step_50() -> Unit raise {
  let t284 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@sets.infinite()), card_infinite_cong()]),
  )
  let t285 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
    ),
    t284,
  )
  card_finite_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(s, t) → FINITE(s) == FINITE(t)"),
      t285,
    ),
  )
}

///|
let card_finite_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_FINITE_CONG",
)

///|
/// `CARD_FINITE_CONG`
pub fn card_finite_cong() -> @kernel.Thm {
  card_finite_cong_c.get()
}

///|
/// CARD_LE_FINITE
fn step_51() -> Unit raise {
  let t286 = @meson.asm_meson_tac(
    @list.List([card_le_eq_subset(), @sets.finite_subset(), card_finite_cong()]),
  )
  card_le_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(t) && op_lt_eq_us_c(s, t) → FINITE(s)"),
      t286,
    ),
  )
}

///|
let card_le_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_FINITE")

///|
/// `CARD_LE_FINITE`
pub fn card_le_finite() -> @kernel.Thm {
  card_le_finite_c.get()
}

///|
/// CARD_EQ_FINITE
fn step_52() -> Unit raise {
  let t287 = @meson.meson_tac(@list.List([card_le_finite()]))
  let t288 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())])),
    t287,
  )
  card_eq_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && op_eq_us_c(s, t) → FINITE(s)"),
      t288,
    ),
  )
}

///|
let card_eq_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_FINITE")

///|
/// `CARD_EQ_FINITE`
pub fn card_eq_finite() -> @kernel.Thm {
  card_eq_finite_c.get()
}

///|
/// CARD_EQ_INFINITE
fn step_53() -> Unit raise {
  let t290 = @meson.meson_tac(@list.List([card_eq_finite()]))
  let t289 = @simp.rewrite_tac(@list.List([@sets.infinite()]))
  let t291 = @tactics.then_tac(
    @tactics.then_tac(@simp.once_rewrite_tac(@list.List([card_eq_sym()])), t289),
    t290,
  )
  card_eq_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(t) && op_eq_us_c(s, t) → INFINITE(s)"),
      t291,
    ),
  )
}

///|
let card_eq_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_INFINITE",
)

///|
/// `CARD_EQ_INFINITE`
pub fn card_eq_infinite() -> @kernel.Thm {
  card_eq_infinite_c.get()
}

///|
/// CARD_LE_INFINITE
fn step_54() -> Unit raise {
  let t292 = @meson.meson_tac(@list.List([card_le_finite(), @sets.infinite()]))
  card_le_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(s) && op_lt_eq_us_c(s, t) → INFINITE(t)"),
      t292,
    ),
  )
}

///|
let card_le_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_INFINITE",
)

///|
/// `CARD_LE_INFINITE`
pub fn card_le_infinite() -> @kernel.Thm {
  card_le_infinite_c.get()
}

///|
/// CARD_LT_FINITE_INFINITE
fn step_55() -> Unit raise {
  let t293 = @meson.meson_tac(@list.List([card_le_finite()]))
  let t294 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(card_not_le()), @sets.infinite()]),
    ),
    t293,
  )
  card_lt_finite_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && INFINITE(t) → op_lt_us_c(s, t)"),
      t294,
    ),
  )
}

///|
let card_lt_finite_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LT_FINITE_INFINITE",
)

///|
/// `CARD_LT_FINITE_INFINITE`
pub fn card_lt_finite_infinite() -> @kernel.Thm {
  card_lt_finite_infinite_c.get()
}

///|
/// CARD_LE_FINITE_INFINITE
fn step_56() -> Unit raise {
  let t296 = @simp.asm_simp_tac(@list.List([card_lt_finite_infinite()]))
  let t295 = @tactics.match_mp_tac(card_lt_imp_le())
  let t297 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t295),
    t296,
  )
  card_le_finite_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && INFINITE(t) → op_lt_eq_us_c(s, t)"),
      t297,
    ),
  )
}

///|
let card_le_finite_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_FINITE_INFINITE",
)

///|
/// `CARD_LE_FINITE_INFINITE`
pub fn card_le_finite_infinite() -> @kernel.Thm {
  card_le_finite_infinite_c.get()
}

///|
/// CARD_LE_CARD_IMP
fn step_57() -> Unit raise {
  let t316 = @meson.asm_meson_tac(
    @list.List([@sets.subset(), @sets.in_image()]),
  )
  let t315 = @simp.asm_rewrite_tac(@list.List([]))
  let t317 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t315),
    t316,
  )
  let t314 = @simp.asm_rewrite_tac(@list.List([]))
  let t313 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t318 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @int.arith_rule(@term_syntax.parse_term("(m : Num) == (n : Num) → n <= m")),
        ),
        t313,
      ),
      t314,
    ),
    t317,
  ])
  let t312 = @tactics.exists_tac(@term_syntax.parse_term("CARD(IMAGE((f : (A) -> B), (s : (A) -> Bool)))"))
  let t311 = @tactics.match_mp_tac(@arith.le_trans())
  let t310 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t307 = @simp.gen_rewrite_rule(
    fn(
      x306 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x306
    },
    @list.List([@sets.le_c()]),
  )
  let t309 = @tactics.first_x_assum(fn(
    x308 : @kernel.Thm,
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
      x303 : @kernel.Thm,
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
      let s304 = @tactics.mp_tac(x303)
      fn(
        x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s304(x305)
      }
    })(t307(x308))
  })
  let t302 = @list.List([
    @meson.asm_meson_tac(@list.List([card_le_finite()])),
    @tactics.all_tac,
  ])
  let t301 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((s : (A) -> Bool))"), fn(
    x298 : @kernel.Thm,
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
    let s299 = @tactics.assume_tac(x298)
    fn(
      x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s299(x300)
    }
  })
  let t319 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t301),
                t302,
              ),
              t309,
            ),
            t310,
          ),
          t311,
        ),
        t312,
      ),
      @tactics.conj_tac,
    ),
    t318,
  )
  card_le_card_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(t) && op_lt_eq_us_c(s, t) → CARD(s) <= CARD(t)"),
      t319,
    ),
  )
}

///|
let card_le_card_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_CARD_IMP",
)

///|
/// `CARD_LE_CARD_IMP`
pub fn card_le_card_imp() -> @kernel.Thm {
  card_le_card_imp_c.get()
}

///|
/// CARD_EQ_CARD_IMP
fn step_58() -> Unit raise {
  let t320 = @meson.meson_tac(
    @list.List([
      card_finite_cong(),
      @arith.le_antisym(),
      card_le_antisym(),
      card_le_card_imp(),
    ]),
  )
  card_eq_card_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(t) && op_eq_us_c(s, t) → CARD(s) == CARD(t)"),
      t320,
    ),
  )
}

///|
let card_eq_card_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_CARD_IMP",
)

///|
/// `CARD_EQ_CARD_IMP`
pub fn card_eq_card_imp() -> @kernel.Thm {
  card_eq_card_imp_c.get()
}

///|
/// CARD_LE_CARD
fn step_59() -> Unit raise {
  let t336 = @meson.asm_meson_tac(
    @list.List([@sets.card_subset_eq(), card_eq_card_imp(), card_eq_sym()]),
  )
  let t335 = @tactics.subgoal_then(@term_syntax.parse_term("(u : (A) -> Bool) == (s : (A) -> Bool)"), fn(
    x333 : @kernel.Thm,
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
    let th = x333
    @meson.asm_meson_tac(@list.List([th, card_eq_sym()]))
  })
  let t332 = @tactics.match_mp_tac(card_eq_imp_le())
  let t331 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t330 = @simp.gen_rewrite_tac(
    fn(
      x327 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s328 = @equal.land_conv(x327)
      fn(x329 : @kernel.Term) -> @kernel.Thm raise { s328(x329) }
    },
    @list.List([card_le_eq_subset()]),
  )
  let t326 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((c : Bool) → (a : Bool) → (b : Bool)) → a && !b → !c")),
  )
  let t325 = @simp.asm_simp_tac(@list.List([card_le_card_imp()]))
  let t324 = @simp.rewrite_tac(@list.List([@sets.lt_c(), @arith.lt_le()]))
  let t323 = @simp.rewrite_tac(@list.List([card_not_le(), @arith.not_le()]))
  let t322 = @simp.asm_simp_tac(@list.List([card_le_card_imp()]))
  let t321 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && (!a → !b) → a == b")),
  )
  let t337 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t321,
                        ),
                        t322,
                      ),
                      t323,
                    ),
                    t324,
                  ),
                  t325,
                ),
                t326,
              ),
              @tactics.disch_tac,
            ),
            t330,
          ),
          t331,
        ),
        t332,
      ),
      t335,
    ),
    t336,
  )
  card_le_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → op_lt_eq_us_c(s, t) == (CARD(s) <= CARD(t))"),
      t337,
    ),
  )
}

///|
let card_le_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_CARD")

///|
/// `CARD_LE_CARD`
pub fn card_le_card() -> @kernel.Thm {
  card_le_card_c.get()
}

///|
/// CARD_EQ_CARD
fn step_60() -> Unit raise {
  let t338 = @meson.meson_tac(
    @list.List([
      card_finite_cong(),
      @arith.le_antisym(),
      card_le_antisym(),
      card_le_card(),
    ]),
  )
  card_eq_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → op_eq_us_c(s, t) == (CARD(s) == CARD(t))"),
      t338,
    ),
  )
}

///|
let card_eq_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_CARD")

///|
/// `CARD_EQ_CARD`
pub fn card_eq_card() -> @kernel.Thm {
  card_eq_card_c.get()
}

///|
/// CARD_LT_CARD
fn step_61() -> Unit raise {
  let t339 = @equal.gsym(card_not_le())
  let t340 = @simp.simp_tac(
    @list.List([card_le_card(), @equal.gsym(@arith.not_le()), t339]),
  )
  card_lt_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → op_lt_us_c(s, t) == (CARD(s) < CARD(t))"),
      t340,
    ),
  )
}

///|
let card_lt_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_CARD")

///|
/// `CARD_LT_CARD`
pub fn card_lt_card() -> @kernel.Thm {
  card_lt_card_c.get()
}

///|
/// CARD_HAS_SIZE_CONG
fn step_62() -> Unit raise {
  let t341 = @meson.meson_tac(@list.List([card_eq_card(), card_finite_cong()]))
  let t342 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.has_size()])),
    t341,
  )
  card_has_size_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ n : Num, op_eq_us_c(s, t) → HAS_SIZE(s, n) == HAS_SIZE(t, n)"),
      t342,
    ),
  )
}

///|
let card_has_size_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_HAS_SIZE_CONG",
)

///|
/// `CARD_HAS_SIZE_CONG`
pub fn card_has_size_cong() -> @kernel.Thm {
  card_has_size_cong_c.get()
}

///|
/// NUMSEG_CARD_LE
fn step_63() -> Unit raise {
  let t344 = @simp.asm_simp_tac(
    @list.List([
      card_le_finite_infinite(),
      @sets.infinite(),
      @iterate.finite_numseg(),
    ]),
  )
  let t343 = @simp.asm_simp_tac(
    @list.List([
      card_le_card(),
      @iterate.finite_numseg(),
      @iterate.card_numseg_1(),
    ]),
  )
  let t345 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @class.asm_cases_tac(@term_syntax.parse_term("FINITE((s : (A) -> Bool))")),
      ),
      t343,
    ),
    t344,
  )
  numseg_card_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, op_lt_eq_us_c(op_dot_dot(1, (n : Num)), s) == (FINITE(s) → n <= CARD(s))"),
      t345,
    ),
  )
}

///|
let numseg_card_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_CARD_LE")

///|
/// `NUMSEG_CARD_LE`
pub fn numseg_card_le() -> @kernel.Thm {
  numseg_card_le_c.get()
}

///|
/// CARD_LE_IMAGE
fn step_64() -> Unit raise {
  let t346 = @meson.meson_tac(@list.List([]))
  let t347 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.le_c_v1(), @sets.forall_in_image()])),
    t346,
  )
  card_le_image_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ s : (_) -> Bool, op_lt_eq_us_c(IMAGE(f, s), s)"), t347),
  )
}

///|
let card_le_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_IMAGE")

///|
/// `CARD_LE_IMAGE`
pub fn card_le_image() -> @kernel.Thm {
  card_le_image_c.get()
}

///|
/// CARD_LE_IMAGE_GEN
fn step_65() -> Unit raise {
  let t350 = @simp.asm_simp_tac(@list.List([card_le_image(), card_le_subset()]))
  let t348 = @term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool))")
  let t349 = @tactics.trans_tac(card_le_trans())(t348)
  let t351 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t349),
    t350,
  )
  card_le_image_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) → op_lt_eq_us_c(t, s)"),
      t351,
    ),
  )
}

///|
let card_le_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_IMAGE_GEN",
)

///|
/// `CARD_LE_IMAGE_GEN`
pub fn card_le_image_gen() -> @kernel.Thm {
  card_le_image_gen_c.get()
}

///|
/// CARD_EQ_IMAGE
fn step_66() -> Unit raise {
  let t355 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t354 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t353 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t352 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t356 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t352),
        t353,
      ),
      t354,
    ),
    t355,
  )
  card_eq_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → op_eq_us_c(IMAGE(f, s), s)"),
      t356,
    ),
  )
}

///|
let card_eq_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_IMAGE")

///|
/// `CARD_EQ_IMAGE`
pub fn card_eq_image() -> @kernel.Thm {
  card_eq_image_c.get()
}

///|
/// CARD_GE_PREIMAGE
fn step_67() -> Unit raise {
  let t359 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t358 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t357 = @simp.rewrite_tac(@list.List([@sets.le_c_v1()]))
  let t360 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t357),
      t358,
    ),
    t359,
  )
  card_ge_preimage_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) → op_lt_eq_us_c(t, {(x : A) | IN(x, s) && IN(f(x), t)})"),
      t360,
    ),
  )
}

///|
let card_ge_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_GE_PREIMAGE",
)

///|
/// `CARD_GE_PREIMAGE`
pub fn card_ge_preimage() -> @kernel.Thm {
  card_ge_preimage_c.get()
}

///|
/// CARD_LE_PREIMAGE
fn step_68() -> Unit raise {
  let t363 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t362 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t361 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t364 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t361),
      t362,
    ),
    t363,
  )
  card_le_preimage_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && IN(f(x), t) && IN(f(y), t) && f(x) == f(y) → x == y) → op_lt_eq_us_c({(x : A) | IN(x, s) && IN(f(x), t)}, t)"),
      t364,
    ),
  )
}

///|
let card_le_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_PREIMAGE",
)

///|
/// `CARD_LE_PREIMAGE`
pub fn card_le_preimage() -> @kernel.Thm {
  card_le_preimage_c.get()
}

///|
/// CARD_EQ_PREIMAGE
fn step_69() -> Unit raise {
  let t368 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t366 = @tactics.match_mp_tac(card_ge_preimage())
  let t367 = @list.List([@tactics.match_mp_tac(card_le_preimage()), t366])
  let t365 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t369 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t365),
        @tactics.conj_tac,
      ),
      t367,
    ),
    t368,
  )
  card_eq_preimage_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && IN(f(x), t) && IN(f(y), t) && f(x) == f(y) → x == y) && SUBSET(t, IMAGE(f, s)) → op_eq_us_c({(x : A) | IN(x, s) && IN(f(x), t)}, t)"),
      t369,
    ),
  )
}

///|
let card_eq_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_PREIMAGE",
)

///|
/// `CARD_EQ_PREIMAGE`
pub fn card_eq_preimage() -> @kernel.Thm {
  card_eq_preimage_c.get()
}

///|
/// CARD_LE_IMAGES
fn step_70() -> Unit raise {
  let t376 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t377 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t376])
  let t375 = @tactics.subgoal_then(
    @term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool)) == IMAGE((h : (C) -> B), IMAGE((g : (A) -> C), s))"),
    fn(
      x372 : @kernel.Thm,
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
      let s373 = @tactics.subst1_tac(x372)
      fn(
        x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s373(x374)
      }
    },
  )
  let t371 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (C) -> B)"))
  let t370 = @simp.rewrite_tac(
    @list.List([
      @sets.function_factors_left_gen(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t378 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t370),
          t371,
        ),
        @tactics.strip_tac,
      ),
      t375,
    ),
    t377,
  )
  card_le_images_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> C, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && g(x) == g(y) → f(x) == f(y)) → op_lt_eq_us_c(IMAGE(f, s), IMAGE(g, s))"),
      t378,
    ),
  )
}

///|
let card_le_images_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_IMAGES")

///|
/// `CARD_LE_IMAGES`
pub fn card_le_images() -> @kernel.Thm {
  card_le_images_c.get()
}

///|
/// CARD_EQ_IMAGES
fn step_71() -> Unit raise {
  let t381 = @meson.asm_meson_tac(@list.List([]))
  let t380 = @tactics.match_mp_tac(card_le_images())
  let t379 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t382 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t379),
        @tactics.conj_tac,
      ),
      t380,
    ),
    t381,
  )
  card_eq_images_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> C, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → (f(x) == f(y)) == (g(x) == g(y))) → op_eq_us_c(IMAGE(f, s), IMAGE(g, s))"),
      t382,
    ),
  )
}

///|
let card_eq_images_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_IMAGES")

///|
/// `CARD_EQ_IMAGES`
pub fn card_eq_images() -> @kernel.Thm {
  card_eq_images_c.get()
}

///|
/// LE_C_IMAGE
fn step_72() -> Unit raise {
  let t400 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t401 = @tactics.then_tac(
    @tactics.disch_then(
      @tactics.choose_then(fn(
        x399 : @kernel.Thm,
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
          x396 : @kernel.Thm,
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
          let s397 = @tactics.subst1_tac(x396)
          fn(
            x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s397(x398)
          }
        })(@equal.sym(x399))
      }),
    ),
    t400,
  )
  let t395 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t394 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : B) => if IN((f : (B) -> A)(x), (s : (A) -> Bool)) { f(x) } else { (a : A) }"),
  )
  let t391 = @term_syntax.parse_term("(f : (B) -> A)")
  let t393 = @tactics.disch_then((x392 : @kernel.Thm) => {
    @tactics.x_choose_tac(t391, x392)
  })
  let t390 = @simp.rewrite_tac(@list.List([@sets.le_c_v1()]))
  let t388 = @simp.gen_rewrite_rule(
    fn(
      x387 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x387
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t385 = @term_syntax.parse_term("(a : A)")
  let t402 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_x_assum(fn(
              x389 : @kernel.Thm,
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
              ((x386 : @kernel.Thm) => @tactics.x_choose_tac(t385, x386))(
                t388(x389),
              )
            }),
            t390,
          ),
          t393,
        ),
        t394,
      ),
      t395,
    ),
    t401,
  ])
  let t384 = @simp.asm_rewrite_tac(@list.List([card_empty_le()]))
  let t383 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t403 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t383),
        t384,
      ),
      @tactics.eq_tac,
    ),
    t402,
  )
  le_c_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) == (s == {} || (∃ f : (B) -> A, IMAGE(f, t) == s))"),
      t403,
    ),
  )
}

///|
let le_c_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_C_IMAGE")

///|
/// `LE_C_IMAGE`
pub fn le_c_image() -> @kernel.Thm {
  le_c_image_c.get()
}

///|
/// LE_C_IMAGE_SUBSET
fn step_73() -> Unit raise {
  let t411 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t410 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t408 = @drule.match_mp(card_le_subset())
  let t412 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.choose_then(fn(
          x409 : @kernel.Thm,
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
            x405 : @kernel.Thm,
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
            let s406 = @tactics.mp_tac(x405)
            fn(
              x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s406(x407)
            }
          })(t408(x409))
        }),
      ),
      t410,
    ),
    t411,
  )
  let t404 = @meson.meson_tac(
    @list.List([@sets.empty_subset(), @sets.subset_refl()]),
  )
  let t413 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([le_c_image()])), t404),
    t412,
  ])
  let t414 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t413,
  )
  le_c_image_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) == (∃ f : (B) -> A, SUBSET(s, IMAGE(f, t)))"),
      t414,
    ),
  )
}

///|
let le_c_image_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LE_C_IMAGE_SUBSET",
)

///|
/// `LE_C_IMAGE_SUBSET`
pub fn le_c_image_subset() -> @kernel.Thm {
  le_c_image_subset_c.get()
}

///|
/// CARD_LE_SING
fn step_74() -> Unit raise {
  let t416 = @meson.asm_meson_tac(
    @list.List([@sets.finite_subset(), @sets.finite_sing(), card_le_finite()]),
  )
  let t417 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        card_le_card(),
        @sets.finite_sing(),
        @equal.gsym(@sets.card_le_1()),
        @sets.card_sing(),
      ]),
    ),
    t416,
  ])
  let t415 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((s : (A) -> Bool))"))
  let t418 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t415),
    t417,
  )
  card_le_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : B, ∀ s : (A) -> Bool, op_lt_eq_us_c(s, {c}) == (∃ a : A, SUBSET(s, {a}))"),
      t418,
    ),
  )
}

///|
let card_le_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_SING")

///|
/// `CARD_LE_SING`
pub fn card_le_sing() -> @kernel.Thm {
  card_le_sing_c.get()
}

///|
/// CARD_SING_LE
fn step_75() -> Unit raise {
  let t429 = @simp.asm_simp_tac(@list.List([@sets.in_sing()]))
  let t428 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (b : B)"))
  let t427 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t424 = @simp.gen_rewrite_rule(
    fn(
      x423 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x423
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t421 = @term_syntax.parse_term("(b : B)")
  let t426 = @tactics.first_x_assum(fn(
    x425 : @kernel.Thm,
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
    ((x422 : @kernel.Thm) => @tactics.x_choose_tac(t421, x422))(t424(x425))
  })
  let t420 = @simp.asm_rewrite_tac(
    @list.List([card_le_empty(), @sets.not_insert_empty()]),
  )
  let t419 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (B) -> Bool) == {}"))
  let t430 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t419),
            t420,
          ),
          t426,
        ),
        t427,
      ),
      t428,
    ),
    t429,
  )
  card_sing_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ s : (B) -> Bool, op_lt_eq_us_c({a}, s) == !(s == {})"),
      t430,
    ),
  )
}

///|
let card_sing_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SING_LE")

///|
/// `CARD_SING_LE`
pub fn card_sing_le() -> @kernel.Thm {
  card_sing_le_c.get()
}

///|
/// CARD_EQ_ORDINAL_EXISTS
fn step_76() -> Unit raise {
  let t460 = @sets.set_tac(@list.List([]))
  let t459 = @simp.rewrite_tac(@list.List([@wo.properly(), @wo.woset()]))
  let t458 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x455 : @kernel.Thm,
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
      let s456 = @tactics.mp_tac(x455)
      fn(
        x457 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s456(x457)
      }
    }),
  )
  let t452 = @tactics.match_mp_tac(card_eq_image())
  let t451 = @simp.asm_simp_tac(
    @list.List([
      @wo.fld_restrict(),
      @sets.set_rule(@term_syntax.parse_term("((x : _) => IN(x, (s : (_) -> Bool))) == s")),
    ]),
  )
  let t453 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x448 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s449 = @equal.land_conv(x448)
          fn(x450 : @kernel.Term) -> @kernel.Thm raise { s449(x450) }
        },
        @list.List([@equal.gsym(@class.eta_ax())]),
      ),
      t451,
    ),
    t452,
  )
  let t447 = @simp.asm_simp_tac(@list.List([@wo.inseg(), @wo.fld_restrict()]))
  let t445 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @wo.inseg_ordinal(),
    ),
  )
  let t454 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x446 : @kernel.Thm,
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
        @tactics.match_mp_tac(t445(x446))
      }),
      t447,
    ),
    t453,
  ])
  let t444 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => (y : A) => IN(x, IMAGE((f : (A) -> A), (s : (A) -> Bool))) && IN(y, IMAGE(f, s)) && (l : (A, A) -> Bool)(x, y)"),
  )
  let t443 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t442 = @simp.asm_rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("((s : (_) -> Bool) == UNIV) == (∀ x : _, s(x))"))]),
  )
  let t439 = @simp.rewrite_rule(@list.List([@wo.ordinal()]))
  let t441 = @tactics.first_assum(fn(
    x440 : @kernel.Thm,
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
      x438 : @kernel.Thm,
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
        x435 : @kernel.Thm,
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
        let s436 = @tactics.assume_tac(x435)
        fn(
          x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s436(x437)
        }
      })(@bool.conjunct1(x438))
    })(t439(x440))
  })
  let t432 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t433 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(l : (A, A) -> Bool)"), t432]),
      @wo.subwoset_iso_inseg(),
    ),
  )
  let t434 = @list.List([
    @simp.rewrite_tac(@list.List([@wo.wo_ordinal()])),
    t433,
  ])
  let t431 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ l : (A, A) -> Bool, ordinal(l) && (∀ x : A, fld(l, x))"),
    @tactics.strip_assume_tac,
  )
  let t461 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t431,
                      ),
                      t434,
                    ),
                    t441,
                  ),
                  t442,
                ),
                t443,
              ),
              t444,
            ),
            @tactics.conj_tac,
          ),
          t454,
        ),
        t458,
      ),
      t459,
    ),
    t460,
  )
  card_eq_ordinal_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∃ l : (A, A) -> Bool, ordinal(l) && op_eq_us_c(fld(l), s)"),
      t461,
    ),
  )
}

///|
let card_eq_ordinal_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_ORDINAL_EXISTS",
)

///|
/// `CARD_EQ_ORDINAL_EXISTS`
pub fn card_eq_ordinal_exists() -> @kernel.Thm {
  card_eq_ordinal_exists_c.get()
}

///|
/// WF_CARD_LT
fn step_77() -> Unit raise {
  let t499 = @simp.asm_rewrite_tac(@list.List([]))
  let t498 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t497 = @tactics.match_mp_tac(card_eq_imp_le())
  let t496 = @simp.asm_rewrite_tac(@list.List([]))
  let t494 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t495 = @tactics.trans_tac(card_lte_trans())(t494)
  let t493 = @simp.asm_simp_tac(@list.List([card_eq_imp_le()]))
  let t491 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t492 = @tactics.trans_tac(card_let_trans())(t491)
  let t490 = @simp.rewrite_tac(@list.List([card_not_le()]))
  let t487 = @drule.match_mp(card_le_subset())
  let t489 = @tactics.disch_then(fn(
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
    (fn(
      x484 : @kernel.Thm,
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
      let s485 = @tactics.mp_tac(x484)
      fn(
        x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s485(x486)
      }
    })(t487(x488))
  })
  let t483 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("(∀ x : _, (s : (_) -> Bool)(x) → (t : (_) -> Bool)(x)) == SUBSET(s, t)")),
      @class.eta_ax(),
    ]),
  )
  let t480 = @drule.match_mp(@wo.inseg_subset_fld())
  let t482 = @tactics.disch_then(fn(
    x481 : @kernel.Thm,
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
      x477 : @kernel.Thm,
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
      let s478 = @tactics.mp_tac(x477)
      fn(
        x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s478(x479)
      }
    })(t480(x481))
  })
  let t476 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@wo.inseg_refl()])),
  ])
  let t475 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) && (!p && (q : Bool) → (r : Bool)) → p || q → r")),
  )
  let t474 = @simp.asm_rewrite_tac(@list.List([]))
  let t472 = @term_syntax.parse_term("(w : ((A) -> Bool, A, A) -> Bool)((t : (A) -> Bool))")
  let t473 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(w : ((A) -> Bool, A, A) -> Bool)((s : (A) -> Bool))"), t472]),
      @wo.ordinal_chained(),
    ),
  )
  let t471 = @simp.asm_simp_tac(@list.List([@wo.ordinal_imp_woset()]))
  let t469 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t470 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t469]),
  )
  let t468 = @simp.rewrite_tac(@list.List([]))
  let t467 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@wf.wf_subset()),
  )
  let t463 = @term_syntax.parse_type("A")
  let t464 = @kernel.inst_type(
    @list.List([(@term_syntax.parse_type("B"), t463)]),
    @wo.wf_inseg_woset(),
  )
  let t465 = @drule.match_mp(@wf.wf_measure_gen())(t464)
  let t466 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(w : ((A) -> Bool, A, A) -> Bool)"), t465),
  )
  let t462 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @theorems.and_forall_thm(),
        @equal.gsym(@class.skolem_thm()),
        card_eq_ordinal_exists(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t500 = @tactics.then_tac(
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
                        @tactics.thenl(
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
                                              @tactics.thenl(
                                                @tactics.subgoal_then(
                                                  @term_syntax.parse_term("∃ w : ((A) -> Bool, A, A) -> Bool, (∀ s : (A) -> Bool, ordinal(w(s))) && (∀ s : (A) -> Bool, op_eq_us_c(fld(w(s)), s))"),
                                                  @tactics.strip_assume_tac,
                                                ),
                                                t462,
                                              ),
                                              t466,
                                            ),
                                            t467,
                                          ),
                                          t468,
                                        ),
                                        t470,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    t471,
                                  ),
                                  t473,
                                ),
                                t474,
                              ),
                              t475,
                            ),
                            @tactics.conj_tac,
                          ),
                          t476,
                        ),
                        t482,
                      ),
                      t483,
                    ),
                    t489,
                  ),
                  t490,
                ),
                t492,
              ),
              t493,
            ),
            t495,
          ),
          t496,
        ),
        t497,
      ),
      t498,
    ),
    t499,
  )
  wf_card_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(WF : (((A) -> Bool, (A) -> Bool) -> Bool) -> Bool)((op_lt_us_c : ((A) -> Bool, (A) -> Bool) -> Bool))"),
      t500,
    ),
  )
}

///|
let wf_card_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_CARD_LT")

///|
/// `WF_CARD_LT`
pub fn wf_card_lt() -> @kernel.Thm {
  wf_card_lt_c.get()
}

///|
/// Library/card.ml:626
fn step_78() -> Unit raise {
  @printer.parse_as_infix("+_c", (16L, "right"))
}

///|
/// Library/card.ml:627
fn step_79() -> Unit raise {
  @printer.parse_as_infix("*_c", (20L, "right"))
}

///|
/// add_c
fn step_80() -> Unit raise {
  add_c_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_plus_us_c : ((_) -> Bool, (_) -> Bool, Sum[_, _]) -> Bool)((s : (_) -> Bool), (t : (_) -> Bool)) == UNION({INL((x : _)) | IN(x, s)}, {INR((y : _)) | IN(y, t)})"),
    ),
  )
}

///|
let add_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("add_c")

///|
/// `add_c`
pub fn add_c() -> @kernel.Thm {
  add_c_c.get()
}

///|
/// mul_c
fn step_81() -> Unit raise {
  mul_c_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_star_us_c : ((_) -> Bool, (_) -> Bool, (_, _)) -> Bool)((s : (_) -> Bool), (t : (_) -> Bool)) == {((x : _), (y : _)) | IN(x, s) && IN(y, t)}"),
    ),
  )
}

///|
let mul_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mul_c")

///|
/// `mul_c`
pub fn mul_c() -> @kernel.Thm {
  mul_c_c.get()
}

///|
/// CARD_LE_ADD
fn step_82() -> Unit raise {
  let t516 = @meson.asm_meson_tac(@list.List([]))
  let t515 = @simp.asm_rewrite_tac(
    @list.List([sum_distinct(), sum_injective()]),
  )
  let t513 = @simp.asm_rewrite_tac(@list.List([]))
  let t514 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(
          x510 : @kernel.Thm,
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
          let s511 = @tactics.mp_tac(x510)
          fn(
            x512 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s511(x512)
          }
        }),
      ),
      t513,
    ),
  )
  let t509 = @tactics.repeat_tac(@tactics.gen_tac)
  let t508 = @simp.rewrite_tac(
    @list.List([@sets.in_union(), @sets.in_elim_thm()]),
  )
  let t507 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Sum[A, C]) -> Sum[B, D])"))
  let t506 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t504 = @term_syntax.parse_term("(∀ x : A, (h : (Sum[A, C]) -> Sum[B, D])(INL(x)) == INL((f : (A) -> B)(x))) && (∀ y : C, h(INR(y)) == INR((g : (C) -> D)(y)))")
  let t505 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t504),
  )
  let t502 = @tactics.x_choose_then(@term_syntax.parse_term("(g : (C) -> D)"))(
    @tactics.strip_assume_tac,
  )
  let t503 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
        @tactics.strip_assume_tac,
      ),
      t502,
    ),
  )
  let t501 = @simp.rewrite_tac(@list.List([@sets.le_c(), add_c()]))
  let t517 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t501,
                        ),
                        t503,
                      ),
                      t505,
                    ),
                    t506,
                  ),
                  t507,
                ),
                @tactics.strip_tac,
              ),
              t508,
            ),
            @tactics.conj_tac,
          ),
          t509,
        ),
        t514,
      ),
      t515,
    ),
    t516,
  )
  card_le_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') → op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))"),
      t517,
    ),
  )
}

///|
let card_le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_ADD")

///|
/// `CARD_LE_ADD`
pub fn card_le_add() -> @kernel.Thm {
  card_le_add_c.get()
}

///|
/// CARD_LE_MUL
fn step_83() -> Unit raise {
  let t525 = @meson.asm_meson_tac(@list.List([]))
  let t524 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t523 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t522 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_elim_thm()]),
  )
  let t521 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (x, y) => ((f : (A) -> B)(x), (g : (C) -> D)(y)) }"),
  )
  let t519 = @tactics.x_choose_then(@term_syntax.parse_term("(g : (C) -> D)"))(
    @tactics.strip_assume_tac,
  )
  let t520 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
        @tactics.strip_assume_tac,
      ),
      t519,
    ),
  )
  let t518 = @simp.rewrite_tac(@list.List([@sets.le_c(), mul_c()]))
  let t526 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t518),
              t520,
            ),
            t521,
          ),
          t522,
        ),
        t523,
      ),
      t524,
    ),
    t525,
  )
  card_le_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') → op_lt_eq_us_c(op_star_us_c(s, t), op_star_us_c(s', t'))"),
      t526,
    ),
  )
}

///|
let card_le_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_MUL")

///|
/// `CARD_LE_MUL`
pub fn card_le_mul() -> @kernel.Thm {
  card_le_mul_c.get()
}

///|
/// CARD_FUNSPACE_LE
fn step_84() -> Unit raise {
  let t536 = @meson.asm_meson_tac(@list.List([]))
  let t535 = @simp.asm_rewrite_tac(
    @list.List([@trivia.o_def(), @class.fun_eq_thm()]),
  )
  let t534 = @tactics.exists_tac(
    @term_syntax.parse_term("(h : (A) -> B) => o((g : (B) -> B'), o(h, (f' : (A') -> A)))"),
  )
  let t533 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@equal.gsym(@sets.injective_left_inverse())]),
    ),
    @tactics.all_tac,
  ])
  let t532 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f' : (A') -> A, ∀ x : A, f'((f : (A) -> A')(x)) == x"),
    @tactics.strip_assume_tac,
  )
  let t529 = @term_syntax.parse_term("(g : (B) -> B')")
  let t527 = @term_syntax.parse_term("(f : (A) -> A')")
  let t531 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x528 : @kernel.Thm) => @tactics.x_choose_tac(t527, x528),
      (x530 : @kernel.Thm) => @tactics.x_choose_tac(t529, x530),
    ),
  )
  let t537 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ()])),
              t531,
            ),
            t532,
          ),
          t533,
        ),
        t534,
      ),
      t535,
    ),
    t536,
  )
  card_funspace_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(op_lt_eq_us_c : ((A) -> Bool, (A') -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : (A') -> Bool)) && (op_lt_eq_us_c : ((B) -> Bool, (B') -> Bool) -> Bool)((UNIV : (B) -> Bool), (UNIV : (B') -> Bool)) → (op_lt_eq_us_c : (((A) -> B) -> Bool, ((A') -> B') -> Bool) -> Bool)((UNIV : ((A) -> B) -> Bool), (UNIV : ((A') -> B') -> Bool))"),
      t537,
    ),
  )
}

///|
let card_funspace_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_FUNSPACE_LE",
)

///|
/// `CARD_FUNSPACE_LE`
pub fn card_funspace_le() -> @kernel.Thm {
  card_funspace_le_c.get()
}

///|
/// CARD_ADD_CONG
fn step_85() -> Unit raise {
  let t538 = @simp.simp_tac(
    @list.List([card_le_add(), @equal.gsym(card_le_antisym())]),
  )
  card_add_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))"),
      t538,
    ),
  )
}

///|
let card_add_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADD_CONG")

///|
/// `CARD_ADD_CONG`
pub fn card_add_cong() -> @kernel.Thm {
  card_add_cong_c.get()
}

///|
/// CARD_MUL_CONG
fn step_86() -> Unit raise {
  let t539 = @simp.simp_tac(
    @list.List([card_le_mul(), @equal.gsym(card_le_antisym())]),
  )
  card_mul_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_eq_us_c(op_star_us_c(s, t), op_star_us_c(s', t'))"),
      t539,
    ),
  )
}

///|
let card_mul_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_CONG")

///|
/// `CARD_MUL_CONG`
pub fn card_mul_cong() -> @kernel.Thm {
  card_mul_cong_c.get()
}

///|
/// CARD_FUNSPACE_CONG
fn step_87() -> Unit raise {
  let t540 = @simp.simp_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_funspace_le()]),
  )
  card_funspace_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(op_eq_us_c : ((A) -> Bool, (A') -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : (A') -> Bool)) && (op_eq_us_c : ((B) -> Bool, (B') -> Bool) -> Bool)((UNIV : (B) -> Bool), (UNIV : (B') -> Bool)) → (op_eq_us_c : (((A) -> B) -> Bool, ((A') -> B') -> Bool) -> Bool)((UNIV : ((A) -> B) -> Bool), (UNIV : ((A') -> B') -> Bool))"),
      t540,
    ),
  )
}

///|
let card_funspace_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_FUNSPACE_CONG",
)

///|
/// `CARD_FUNSPACE_CONG`
pub fn card_funspace_cong() -> @kernel.Thm {
  card_funspace_cong_c.get()
}

///|
/// MUL_C_UNIV
fn step_88() -> Unit raise {
  let t541 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @pair.forall_pair_thm(),
      mul_c(),
      @sets.in_elim_pair_thm(),
      @sets.in_univ(),
    ]),
  )
  mul_c_univ_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_star_us_c : ((A) -> Bool, (B) -> Bool, (A, B)) -> Bool)((UNIV : (A) -> Bool), (UNIV : (B) -> Bool)) == (UNIV : ((A, B)) -> Bool)"), t541),
  )
}

///|
let mul_c_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_C_UNIV")

///|
/// `MUL_C_UNIV`
pub fn mul_c_univ() -> @kernel.Thm {
  mul_c_univ_c.get()
}

///|
/// CARD_FUNSPACE_CURRY
fn step_89() -> Unit raise {
  let t545 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let t544 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t543 = @tactics.exists_tac(@term_syntax.parse_term("(g : ((A, B)) -> C) => (x : A) => (y : B) => g((x, y))"))
  let t542 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A, B) -> C) => fn { (x, y) => f(x, y) }"),
  )
  let t546 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([eq_c_bijections()])),
          t542,
        ),
        t543,
      ),
      t544,
    ),
    t545,
  )
  card_funspace_curry_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : (((A, B) -> C) -> Bool, (((A, B)) -> C) -> Bool) -> Bool)((UNIV : ((A, B) -> C) -> Bool), (UNIV : (((A, B)) -> C) -> Bool))"), t546),
  )
}

///|
let card_funspace_curry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_FUNSPACE_CURRY",
)

///|
/// `CARD_FUNSPACE_CURRY`
pub fn card_funspace_curry() -> @kernel.Thm {
  card_funspace_curry_c.get()
}

///|
/// IN_CARD_ADD
fn step_90() -> Unit raise {
  let t548 = @meson.meson_tac(@list.List([]))
  let t547 = @simp.rewrite_tac(@list.List([sum_distinct(), sum_injective()]))
  let t549 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([add_c(), @sets.in_union(), @sets.in_elim_thm()]),
      ),
      t547,
    ),
    t548,
  )
  in_card_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : _, IN(INL(x), op_plus_us_c((s : (_) -> Bool), (t : (_) -> Bool))) == IN(x, s)) && (∀ y : _, IN(INR(y), op_plus_us_c(s, t)) == IN(y, t))"),
      t549,
    ),
  )
}

///|
let in_card_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CARD_ADD")

///|
/// `IN_CARD_ADD`
pub fn in_card_add() -> @kernel.Thm {
  in_card_add_c.get()
}

///|
/// IN_CARD_MUL
fn step_91() -> Unit raise {
  let t550 = @meson.meson_tac(@list.List([]))
  let t551 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([mul_c(), @sets.in_elim_thm(), @pair.pair_eq()]),
    ),
    t550,
  )
  in_card_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ x : _, ∀ y : _, IN((x, y), op_star_us_c(s, t)) == (IN(x, s) && IN(y, t))"),
      t551,
    ),
  )
}

///|
let in_card_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CARD_MUL")

///|
/// `IN_CARD_MUL`
pub fn in_card_mul() -> @kernel.Thm {
  in_card_mul_c.get()
}

///|
/// CARD_LE_SQUARE
fn step_92() -> Unit raise {
  let t555 = @meson.meson_tac(@list.List([]))
  let t554 = @tactics.conv_tac(@equal.once_depth_conv(@class.select_conv))
  let t553 = @simp.simp_tac(@list.List([in_card_mul(), @pair.pair_eq()]))
  let t552 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (x, select((z : A) => IN(z, (s : (A) -> Bool))))"))
  let t556 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([@sets.le_c()])),
          ),
          t552,
        ),
        t553,
      ),
      t554,
    ),
    t555,
  )
  card_le_square_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, op_lt_eq_us_c(s, op_star_us_c(s, s))"), t556),
  )
}

///|
let card_le_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_SQUARE")

///|
/// `CARD_LE_SQUARE`
pub fn card_le_square() -> @kernel.Thm {
  card_le_square_c.get()
}

///|
/// CARD_SQUARE_NUM
fn step_93() -> Unit raise {
  let t561 = @meson.meson_tac(@list.List([@ind_types.numpair_inj()]))
  let t560 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t559 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t558 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), NUMPAIR(x, y)))"))
  let t557 = @simp.rewrite_tac(
    @list.List([@sets.le_c(), @sets.in_univ(), mul_c(), @sets.in_elim_thm()]),
  )
  let t562 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@equal.gsym(card_le_antisym()), card_le_square()]),
            ),
            t557,
          ),
          t558,
        ),
        t559,
      ),
      t560,
    ),
    t561,
  )
  card_square_num_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(op_eq_us_c : (((Num, Num)) -> Bool, (Num) -> Bool) -> Bool)((op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool)), (UNIV : (Num) -> Bool))"),
      t562,
    ),
  )
}

///|
let card_square_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_SQUARE_NUM",
)

///|
/// `CARD_SQUARE_NUM`
pub fn card_square_num() -> @kernel.Thm {
  card_square_num_c.get()
}

///|
/// UNION_LE_ADD_C
fn step_94() -> Unit raise {
  let t568 = @sets.set_tac(@list.List([]))
  let t567 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@sets.image_o()), @trivia.o_def()]),
  )
  let t566 = @simp.once_rewrite_tac(@list.List([@sets.simple_image()]))
  let t565 = @simp.rewrite_tac(@list.List([add_c(), @sets.image_union()]))
  let t564 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (INL : (A) -> Sum[A, A])((x : A)) => x; (INR : (A) -> Sum[A, A])((x : A)) => x }"),
  )
  let t563 = @tactics.match_mp_tac(card_le_image_gen())
  let t569 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t563),
            t564,
          ),
          t565,
        ),
        t566,
      ),
      t567,
    ),
    t568,
  )
  union_le_add_c_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, op_lt_eq_us_c(UNION(s, t), op_plus_us_c(s, t))"),
      t569,
    ),
  )
}

///|
let union_le_add_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_LE_ADD_C")

///|
/// `UNION_LE_ADD_C`
pub fn union_le_add_c() -> @kernel.Thm {
  union_le_add_c_c.get()
}

///|
/// CARD_ADD_C
fn step_95() -> Unit raise {
  let t589 = @simp.asm_simp_tac(@list.List([sum_injective()]))
  let t588 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t587 = @tactics.disch_then(fn(
    x584 : @kernel.Thm,
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
    let s585 = @tactics.subst1_tac(x584)
    fn(
      x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s585(x586)
    }
  })
  let t583 = @simp.rewrite_tac(@list.List([sum_distinct()]))
  let t582 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(INTER(IMAGE((f : (_) -> _), (s : (_) -> Bool)), IMAGE((g : (_) -> _), (t : (_) -> Bool))) == {}) == (∀ x : _, ∀ y : _, IN(x, s) && IN(y, t) → !(f(x) == g(y)))"),
      ),
    ]),
  )
  let t581 = @simp.asm_simp_tac(
    @list.List([@sets.simple_image(), @sets.finite_image()]),
  )
  let t575 = @drule.part_match(
    fn(x574 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(@kernel.rand(x574))
    },
    @sets.card_union(),
  )
  let t570 = @simp.rewrite_tac(@list.List([add_c()]))
  let t590 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t570,
                  ),
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
                  ) raise {
                    (fn(
                      x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      (fn(
                        x577 : @kernel.Term,
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
                        (fn(
                          x576 : @kernel.Term,
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
                            x571 : @kernel.Thm,
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
                            let s572 = @tactics.mp_tac(x571)
                            fn(
                              x573 : (
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
                              s572(x573)
                            }
                          })(t575(x576))
                        })(@equal.lhand(x577))
                      })(
                        (fn(
                          x578 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
                        ) -> @kernel.Term raise {
                          x578.1
                        })(x579),
                      )
                    })(x580)(x580)
                  },
                ),
                t581,
              ),
              t582,
            ),
            t583,
          ),
          t587,
        ),
        @tactics.binop_tac,
      ),
      t588,
    ),
    t589,
  )
  card_add_c_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) → CARD(op_plus_us_c(s, t)) == CARD(s) + CARD(t)"),
      t590,
    ),
  )
}

///|
let card_add_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADD_C")

///|
/// `CARD_ADD_C`
pub fn card_add_c() -> @kernel.Thm {
  card_add_c_c.get()
}

///|
/// CARD_MUL_C
fn step_96() -> Unit raise {
  let t591 = @simp.simp_tac(
    @list.List([mul_c(), @equal.gsym(@sets.cross()), @sets.card_cross()]),
  )
  card_mul_c_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) → CARD(op_star_us_c(s, t)) == CARD(s) * CARD(t)"),
      t591,
    ),
  )
}

///|
let card_mul_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_C")

///|
/// `CARD_MUL_C`
pub fn card_mul_c() -> @kernel.Thm {
  card_mul_c_c.get()
}

///|
/// CARD_ADD_SYM
fn step_97() -> Unit raise {
  let t598 = @meson.meson_tac(@list.List([]))
  let t597 = @simp.rewrite_tac(
    @list.List([sum_distinct(), sum_injective(), in_card_add()]),
  )
  let t596 = @simp.simp_tac(
    @list.List([
      forall_sum_thm(),
      exists_sum_thm(),
      @theorems.exists_unique_thm(),
    ]),
  )
  let t595 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t593 = @term_syntax.parse_term("(∀ x : A, (h : (Sum[A, B]) -> Sum[B, A])(INL(x)) == INR(x)) && (∀ y : B, h(INR(y)) == INL(y))")
  let t594 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t593),
  )
  let t592 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t599 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t592),
            t594,
          ),
          t595,
        ),
        t596,
      ),
      t597,
    ),
    t598,
  )
  card_add_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(t, s))"),
      t599,
    ),
  )
}

///|
let card_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADD_SYM")

///|
/// `CARD_ADD_SYM`
pub fn card_add_sym() -> @kernel.Thm {
  card_add_sym_c.get()
}

///|
/// CARD_ADD_ASSOC
fn step_98() -> Unit raise {
  let t607 = @meson.meson_tac(@list.List([]))
  let t606 = @simp.asm_rewrite_tac(
    @list.List([
      forall_sum_thm(),
      exists_sum_thm(),
      @theorems.exists_unique_thm(),
      sum_distinct(),
      sum_injective(),
      in_card_add(),
    ]),
  )
  let t605 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t603 = @term_syntax.parse_term("(∀ x : A, (h : (Sum[A, Sum[B, C]]) -> Sum[Sum[A, B], C])(INL(x)) == INL(INL(x))) && (∀ z : Sum[B, C], h(INR(z)) == (i : (Sum[B, C]) -> Sum[Sum[A, B], C])(z))")
  let t604 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t603),
  )
  let t601 = @term_syntax.parse_term("(∀ u : B, (i : (Sum[B, C]) -> Sum[Sum[A, B], C])(INL(u)) == INL(INR(u))) && (∀ v : C, i(INR(v)) == INR(v))")
  let t602 = @tactics.choose_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t601),
  )
  let t600 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t608 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t600),
                t602,
              ),
              t604,
            ),
            t605,
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      t606,
    ),
    t607,
  )
  card_add_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_plus_us_c(s, op_plus_us_c(t, u)), op_plus_us_c(op_plus_us_c(s, t), u))"),
      t608,
    ),
  )
}

///|
let card_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADD_ASSOC")

///|
/// `CARD_ADD_ASSOC`
pub fn card_add_assoc() -> @kernel.Thm {
  card_add_assoc_c.get()
}

///|
/// CARD_MUL_SYM
fn step_99() -> Unit raise {
  let t615 = @meson.meson_tac(@list.List([]))
  let t614 = @simp.asm_rewrite_tac(
    @list.List([@pair.forall_pair_thm(), in_card_mul(), @pair.pair_eq()]),
  )
  let t613 = @simp.rewrite_tac(
    @list.List([
      @theorems.exists_unique_thm(),
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t612 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t610 = @term_syntax.parse_term("∀ x : A, ∀ y : B, (h : ((A, B)) -> (B, A))((x, y)) == (y, x)")
  let t611 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@pair.pair_recursion())(t610),
  )
  let t609 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t616 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t609),
                t611,
              ),
              t612,
            ),
            @tactics.gen_tac,
          ),
          @tactics.strip_tac,
        ),
        t613,
      ),
      t614,
    ),
    t615,
  )
  card_mul_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(op_star_us_c(s, t), op_star_us_c(t, s))"),
      t616,
    ),
  )
}

///|
let card_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_SYM")

///|
/// `CARD_MUL_SYM`
pub fn card_mul_sym() -> @kernel.Thm {
  card_mul_sym_c.get()
}

///|
/// CARD_MUL_ASSOC
fn step_100() -> Unit raise {
  let t625 = @meson.meson_tac(@list.List([]))
  let t624 = @simp.asm_rewrite_tac(
    @list.List([@pair.forall_pair_thm(), in_card_mul(), @pair.pair_eq()]),
  )
  let t623 = @simp.rewrite_tac(
    @list.List([
      @theorems.exists_unique_thm(),
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t622 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t620 = @term_syntax.parse_term("∀ x : A, ∀ p : (B, C), (h : ((A, B, C)) -> ((A, B), C))((x, p)) == (i : (A, (B, C)) -> ((A, B), C))(x, p)")
  let t621 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@pair.pair_recursion())(t620),
  )
  let t618 = @term_syntax.parse_term("∀ x : A, ∀ y : B, ∀ z : C, (i : (A, (B, C)) -> ((A, B), C))(x, (y, z)) == ((x, y), z)")
  let t619 = @tactics.choose_tac(
    @recursion.prove_recursive_functions_exist(@pair.pair_recursion())(t618),
  )
  let t617 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t626 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t617),
                  t619,
                ),
                t621,
              ),
              t622,
            ),
            @tactics.gen_tac,
          ),
          @tactics.strip_tac,
        ),
        t623,
      ),
      t624,
    ),
    t625,
  )
  card_mul_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_star_us_c(s, op_star_us_c(t, u)), op_star_us_c(op_star_us_c(s, t), u))"),
      t626,
    ),
  )
}

///|
let card_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_ASSOC")

///|
/// `CARD_MUL_ASSOC`
pub fn card_mul_assoc() -> @kernel.Thm {
  card_mul_assoc_c.get()
}

///|
/// CARD_LDISTRIB
fn step_101() -> Unit raise {
  let t634 = @meson.meson_tac(@list.List([]))
  let t633 = @simp.asm_rewrite_tac(
    @list.List([
      @theorems.exists_unique_thm(),
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
      forall_sum_thm(),
      exists_sum_thm(),
      @pair.pair_eq(),
      in_card_mul(),
      sum_distinct(),
      sum_injective(),
      in_card_add(),
    ]),
  )
  let t632 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t630 = @term_syntax.parse_term("∀ x : A, ∀ s : Sum[B, C], (h : ((A, Sum[B, C])) -> Sum[(A, B), (A, C)])((x, s)) == (i : (A, Sum[B, C]) -> Sum[(A, B), (A, C)])(x, s)")
  let t631 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@pair.pair_recursion())(t630),
  )
  let t628 = @term_syntax.parse_term("(∀ x : A, ∀ y : B, (i : (A, Sum[B, C]) -> Sum[(A, B), (A, C)])(x, INL(y)) == INL((x, y))) && (∀ x : A, ∀ z : C, i(x, INR(z)) == INR((x, z)))")
  let t629 = @tactics.choose_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t628),
  )
  let t627 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t635 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t627),
                t629,
              ),
              t631,
            ),
            t632,
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      t633,
    ),
    t634,
  )
  card_ldistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_star_us_c(s, op_plus_us_c(t, u)), op_plus_us_c(op_star_us_c(s, t), op_star_us_c(s, u)))"),
      t635,
    ),
  )
}

///|
let card_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LDISTRIB")

///|
/// `CARD_LDISTRIB`
pub fn card_ldistrib() -> @kernel.Thm {
  card_ldistrib_c.get()
}

///|
/// CARD_RDISTRIB
fn step_102() -> Unit raise {
  let t643 = @simp.rewrite_tac(@list.List([card_mul_sym()]))
  let t642 = @tactics.match_mp_tac(card_add_cong())
  let t641 = @simp.rewrite_tac(@list.List([card_ldistrib()]))
  let t639 = @term_syntax.parse_term("op_plus_us_c(op_star_us_c((u : (C) -> Bool), (s : (A) -> Bool)), op_star_us_c(u, (t : (B) -> Bool)))")
  let t640 = @tactics.trans_tac(card_eq_trans())(t639)
  let t638 = @simp.rewrite_tac(@list.List([card_mul_sym()]))
  let t636 = @term_syntax.parse_term("op_star_us_c((u : (C) -> Bool), op_plus_us_c((s : (A) -> Bool), (t : (B) -> Bool)))")
  let t637 = @tactics.trans_tac(card_eq_trans())(t636)
  let t644 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t637),
            t638,
          ),
          t640,
        ),
        t641,
      ),
      t642,
    ),
    t643,
  )
  card_rdistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_star_us_c(op_plus_us_c(s, t), u), op_plus_us_c(op_star_us_c(s, u), op_star_us_c(t, u)))"),
      t644,
    ),
  )
}

///|
let card_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_RDISTRIB")

///|
/// `CARD_RDISTRIB`
pub fn card_rdistrib() -> @kernel.Thm {
  card_rdistrib_c.get()
}

///|
/// CARD_LE_ADDR
fn step_103() -> Unit raise {
  let t647 = @simp.simp_tac(@list.List([in_card_add(), sum_injective()]))
  let t646 = @tactics.exists_tac(@term_syntax.parse_term("(INL : (A) -> Sum[A, B])"))
  let t645 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t648 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t645),
      t646,
    ),
    t647,
  )
  card_le_addr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, op_plus_us_c(s, t))"),
      t648,
    ),
  )
}

///|
let card_le_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_ADDR")

///|
/// `CARD_LE_ADDR`
pub fn card_le_addr() -> @kernel.Thm {
  card_le_addr_c.get()
}

///|
/// CARD_LE_ADDL
fn step_104() -> Unit raise {
  let t651 = @simp.simp_tac(@list.List([in_card_add(), sum_injective()]))
  let t650 = @tactics.exists_tac(@term_syntax.parse_term("(INR : (B) -> Sum[A, B])"))
  let t649 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t652 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t649),
      t650,
    ),
    t651,
  )
  card_le_addl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(t, op_plus_us_c(s, t))"),
      t652,
    ),
  )
}

///|
let card_le_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_ADDL")

///|
/// `CARD_LE_ADDL`
pub fn card_le_addl() -> @kernel.Thm {
  card_le_addl_c.get()
}

///|
/// CARD_MUL_LID
fn step_105() -> Unit raise {
  let t658 = @sets.set_tac(@list.List([]))
  let t657 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @pair.pair_eq()]))
  let t656 = @simp.rewrite_tac(
    @list.List([mul_c(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()]),
  )
  let t655 = @tactics.exists_tac(@term_syntax.parse_term("(b : B) => ((a : A), b)"))
  let t654 = @tactics.exists_tac(@term_syntax.parse_term("(SND : ((A, B)) -> B)"))
  let t653 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t659 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t653),
            t654,
          ),
          t655,
        ),
        t656,
      ),
      t657,
    ),
    t658,
  )
  card_mul_lid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ t : (B) -> Bool, op_eq_us_c(op_star_us_c({a}, t), t)"),
      t659,
    ),
  )
}

///|
let card_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_LID")

///|
/// `CARD_MUL_LID`
pub fn card_mul_lid() -> @kernel.Thm {
  card_mul_lid_c.get()
}

///|
/// CARD_MUL_RID
fn step_106() -> Unit raise {
  let t665 = @sets.set_tac(@list.List([]))
  let t664 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @pair.pair_eq()]))
  let t663 = @simp.rewrite_tac(
    @list.List([mul_c(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()]),
  )
  let t662 = @tactics.exists_tac(@term_syntax.parse_term("(a : A) => (a, (b : B))"))
  let t661 = @tactics.exists_tac(@term_syntax.parse_term("(FST : ((A, B)) -> A)"))
  let t660 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t666 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t660),
            t661,
          ),
          t662,
        ),
        t663,
      ),
      t664,
    ),
    t665,
  )
  card_mul_rid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ b : B, op_eq_us_c(op_star_us_c(s, {b}), s)"),
      t666,
    ),
  )
}

///|
let card_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_RID")

///|
/// `CARD_MUL_RID`
pub fn card_mul_rid() -> @kernel.Thm {
  card_mul_rid_c.get()
}

///|
/// CARD_ADD_LE_MUL_INFINITE
fn step_107() -> Unit raise {
  let t675 = @meson.asm_meson_tac(
    @list.List([@calc_num.num_reduce_conv(@term_syntax.parse_term("1 == 0"))]),
  )
  let t674 = @simp.asm_rewrite_tac(@list.List([]))
  let t672 = @simp.asm_rewrite_tac(
    @list.List([in_card_add(), in_card_mul(), @pair.pair_eq()]),
  )
  let t673 = @tactics.repeat_tac(
    @tactics.orelse_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@ind_types.sum_induct()), t672),
      @tactics.strip_tac,
    ),
  )
  let t671 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Sum[A, A]) -> (A, A))"))
  let t670 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t668 = @term_syntax.parse_term("(∀ x : A, (h : (Sum[A, A]) -> (A, A))(INL(x)) == ((f : (Num) -> A)(0), x)) && (∀ x : A, h(INR(x)) == (f(1), x))")
  let t669 = @tactics.mp_tac(
    @recursion.prove_recursive_functions_exist(@ind_types.sum_recursion())(t668),
  )
  let t667 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t676 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @simp.rewrite_tac(
                      @list.List([
                        infinite_card_le(),
                        @sets.le_c(),
                        @sets.in_univ(),
                      ]),
                    ),
                  ),
                  t667,
                ),
                t669,
              ),
              t670,
            ),
            t671,
          ),
          @tactics.strip_tac,
        ),
        t673,
      ),
      t674,
    ),
    t675,
  )
  card_add_le_mul_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → op_lt_eq_us_c(op_plus_us_c(s, s), op_star_us_c(s, s))"),
      t676,
    ),
  )
}

///|
let card_add_le_mul_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_LE_MUL_INFINITE",
)

///|
/// `CARD_ADD_LE_MUL_INFINITE`
pub fn card_add_le_mul_infinite() -> @kernel.Thm {
  card_add_le_mul_infinite_c.get()
}

///|
/// CARD_DISJOINT_UNION
fn step_108() -> Unit raise {
  let t684 = @meson.asm_meson_tac(@list.List([]))
  let t683 = @simp.rewrite_tac(
    @list.List([sum_distinct(), sum_injective(), in_card_add()]),
  )
  let t682 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("(if (b : Bool) { (x : Bool) } else { (y : Bool) }) == (b && x || !b && y)"),
      ),
    ]),
  )
  let t681 = @simp.rewrite_tac(
    @list.List([@class.cond_rand(), @class.cond_rator()]),
  )
  let t680 = @simp.rewrite_tac(@list.List([forall_sum_thm(), in_card_add()]))
  let t679 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => if IN(x, (s : (A) -> Bool)) { INL(x) } else { INR(x) }"),
  )
  let t678 = @simp.rewrite_tac(@list.List([@sets.eq_c(), @sets.in_union()]))
  let t677 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]),
  )
  let t685 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t677),
                  @tactics.strip_tac,
                ),
                t678,
              ),
              t679,
            ),
            t680,
          ),
          t681,
        ),
        t682,
      ),
      t683,
    ),
    t684,
  )
  card_disjoint_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INTER(s, t) == {} → op_eq_us_c(UNION(s, t), op_plus_us_c(s, t))"),
      t685,
    ),
  )
}

///|
let card_disjoint_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_DISJOINT_UNION",
)

///|
/// `CARD_DISJOINT_UNION`
pub fn card_disjoint_union() -> @kernel.Thm {
  card_disjoint_union_c.get()
}

///|
/// CARD_LE_EXISTS
fn step_109() -> Unit raise {
  let t720 = @simp.asm_rewrite_tac(@list.List([]))
  let t719 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t718 = @tactics.match_mp_tac(card_eq_imp_le())
  let t717 = @simp.rewrite_tac(@list.List([card_le_addr()]))
  let t716 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), (u : (B) -> Bool))")
  let t721 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.trans_tac(card_le_trans())(t716), t717),
        t718,
      ),
      t719,
    ),
    t720,
  )
  let t713 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t712 = @tactics.match_mp_tac(card_eq_image())
  let t711 = @simp.rewrite_tac(@list.List([card_eq_refl()]))
  let t710 = @tactics.match_mp_tac(card_add_cong())
  let t709 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_eq_trans()),
  )
  let t708 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t702 = @drule.part_match(
    fn(x701 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x701))
    },
    card_disjoint_union(),
  )
  let t714 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                fn(
                  x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    x706 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    (fn(
                      x704 : @kernel.Term,
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
                      (fn(
                        x703 : @kernel.Term,
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
                        (fn(
                          x698 : @kernel.Thm,
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
                          let s699 = @tactics.mp_tac(x698)
                          fn(
                            x700 : (
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
                          ) raise {
                            s699(x700)
                          }
                        })(t702(x703))
                      })(@equal.lhand(x704))
                    })(
                      (fn(
                        x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> @kernel.Term raise {
                        x705.1
                      })(x706),
                    )
                  })(x707)(x707)
                },
                @tactics.ants_tac,
              ),
              t708,
            ),
            t709,
          ),
          t710,
        ),
        t711,
      ),
      t712,
    ),
    t713,
  )
  let t697 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t715 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(card_eq_refl_imp()), t697),
    t714,
  ])
  let t695 = @term_syntax.parse_term("UNION(IMAGE((f : (A) -> B), (s : (A) -> Bool)), DIFF((t : (B) -> Bool), IMAGE(f, s)))")
  let t696 = @tactics.trans_tac(card_eq_trans())(t695)
  let t694 = @tactics.exists_tac(@term_syntax.parse_term("DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), (s : (A) -> Bool)))"))
  let t693 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t692 = @simp.rewrite_tac(
    @list.List([@sets.injective_on_alt(), @theorems.left_imp_exists_thm()]),
  )
  let t690 = @simp.gen_rewrite_rule(
    fn(
      x689 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x689
    },
    @list.List([@sets.le_c()]),
  )
  let t722 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.first_x_assum(fn(
                    x691 : @kernel.Thm,
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
                    (fn(
                      x686 : @kernel.Thm,
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
                      let s687 = @tactics.mp_tac(x686)
                      fn(
                        x688 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      ) raise {
                        s687(x688)
                      }
                    })(t690(x691))
                  }),
                  t692,
                ),
                t693,
              ),
              @tactics.strip_tac,
            ),
            t694,
          ),
          t696,
        ),
        @tactics.conj_tac,
      ),
      t715,
    ),
    t721,
  ])
  let t723 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      @tactics.strip_tac,
    ),
    t722,
  )
  card_le_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) == (∃ u : (B) -> Bool, op_eq_us_c(t, op_plus_us_c(s, u)))"),
      t723,
    ),
  )
}

///|
let card_le_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_EXISTS")

///|
/// `CARD_LE_EXISTS`
pub fn card_le_exists() -> @kernel.Thm {
  card_le_exists_c.get()
}

///|
/// CARD_LT_IMP_SUC_LE
fn step_110() -> Unit raise {
  let t777 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t776 = @tactics.match_mp_tac(card_le_subset())
  let t775 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t772 = @drule.match_mp(card_eq_imp_le())
  let t774 = @tactics.disch_then(fn(
    x773 : @kernel.Thm,
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
      x769 : @kernel.Thm,
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
      let s770 = @tactics.mp_tac(x769)
      fn(
        x771 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s770(x771)
      }
    })(t772(x773))
  })
  let t767 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t768 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t767])
  let t761 = @drule.part_match(
    fn(x760 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x760))
    },
    card_disjoint_union(),
  )
  let t778 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              fn(
                x766 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    x763 : @kernel.Term,
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
                    (fn(
                      x762 : @kernel.Term,
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
                      (fn(
                        x757 : @kernel.Thm,
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
                        let s758 = @tactics.mp_tac(x757)
                        fn(
                          x759 : (
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
                        ) raise {
                          s758(x759)
                        }
                      })(t761(x762))
                    })(@equal.lhand(x763))
                  })(
                    (fn(
                      x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> @kernel.Term raise {
                      x764.1
                    })(x765),
                  )
                })(x766)(x766)
              },
              @tactics.ants_tac,
            ),
            t768,
          ),
          t774,
        ),
        t775,
      ),
      t776,
    ),
    t777,
  )
  let t756 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t755 = @tactics.match_mp_tac(card_eq_image())
  let t754 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t753 = @tactics.match_mp_tac(card_eq_imp_le())
  let t752 = @simp.simp_tac(
    @list.List([
      card_le_card(),
      @sets.finite_sing(),
      @sets.card_sing(),
      @arith.le_refl(),
    ]),
  )
  let t779 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(card_le_add()), t752),
            t753,
          ),
          t754,
        ),
        t755,
      ),
      t756,
    ),
    t778,
  ])
  let t750 = @term_syntax.parse_term("op_plus_us_c(IMAGE((f : (A) -> B), (s : (A) -> Bool)), {(b : B)})")
  let t751 = @tactics.trans_tac(card_le_trans())(t750)
  let t749 = @simp.simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((b : _), IMAGE((f : (_) -> _), (s : (_) -> Bool))) == (∀ x : _, IN(x, s) → !(f(x) == b))"),
      ),
    ]),
  )
  let t748 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : B)"))
  let t780 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@sets.in_diff(), @theorems.left_imp_exists_thm()]),
              ),
              t748,
            ),
            t749,
          ),
          @tactics.strip_tac,
        ),
        t751,
      ),
      @tactics.conj_tac,
    ),
    t779,
  )
  let t747 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t746 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t745 = @simp.rewrite_tac(
    @list.List([@class.not_exists_thm(), @class.left_imp_forall_thm()]),
  )
  let t743 = @simp.gen_rewrite_rule(
    fn(
      x740 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s741 = @equal.rand_conv(x740)
      fn(x742 : @kernel.Term) -> @kernel.Thm raise { s741(x742) }
    },
    @list.List([@sets.eq_c()]),
  )
  let t781 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x744 : @kernel.Thm,
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
              x737 : @kernel.Thm,
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
              let s738 = @tactics.mp_tac(x737)
              fn(
                x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s738(x739)
              }
            })(t743(x744))
          }),
          t745,
        ),
        t746,
      ),
      t747,
    ),
    t780,
  ])
  let t736 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ b : B, IN(b, DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), (s : (A) -> Bool))))"),
    fn(
      x733 : @kernel.Thm,
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
      let s734 = @tactics.mp_tac(x733)
      fn(
        x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s734(x735)
      }
    },
  )
  let t732 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t729 = @simp.gen_rewrite_rule(
    fn(
      x728 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x728
    },
    @list.List([@sets.le_c()]),
  )
  let t731 = @tactics.first_x_assum(fn(
    x730 : @kernel.Thm,
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
      x725 : @kernel.Thm,
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
      let s726 = @tactics.mp_tac(x725)
      fn(
        x727 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s726(x727)
      }
    })(t729(x730))
  })
  let t724 = @tactics.repeat_tac(@tactics.strip_tac)
  let t782 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.rewrite_tac(@list.List([card_lt_le()])), t724),
          t731,
        ),
        t732,
      ),
      t736,
    ),
    t781,
  )
  card_lt_imp_suc_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ a : C, op_lt_us_c(s, t) → op_lt_eq_us_c(op_plus_us_c(s, {a}), t)"),
      t782,
    ),
  )
}

///|
let card_lt_imp_suc_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LT_IMP_SUC_LE",
)

///|
/// `CARD_LT_IMP_SUC_LE`
pub fn card_lt_imp_suc_le() -> @kernel.Thm {
  card_lt_imp_suc_le_c.get()
}

///|
/// CARD_SQUARE_INFINITE
fn step_111() -> Unit raise {
  let t783 = @meson.meson_tac(@list.List([]))
  let t784 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()])),
    t783,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("INFINITE((s : (A) -> Bool)) && SUBSET(s, (k : (A) -> Bool)) && (∀ x : (A, A), ∀ y : A, (R : (((A, A), A)) -> Bool)((x, y)) → IN(x, op_star_us_c(s, s)) && IN(y, s)) && (∀ x : (A, A), IN(x, op_star_us_c(s, s)) → existsunique((y : A) => IN(y, s) && R((x, y)))) && (∀ y : A, IN(y, s) → existsunique((x : (A, A)) => IN(x, op_star_us_c(s, s)) && R((x, y)))) → s == {(z : A) | ∃ p : (A, A), R((p, z))}"),
    t784,
  )
  let t1128 = @meson.meson_tac(@list.List([]))
  let t1127 = @tactics.disch_then(fn(
    x1118 : @kernel.Thm,
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
    let th_4 = x1118
    @tactics.first_assum(fn(
      x1126 : @kernel.Thm,
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
        x1125 : @list.List[@kernel.Thm],
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
          x1124 : @kernel.Thm,
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
            x1120 : @kernel.Thm,
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
            let s1121 = @tactics.mp_tac(x1120)
            fn(
              x1122 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1121(x1122)
            }
          })(
            (fn(x1123 : @kernel.Thm) -> @kernel.Thm raise {
              @drule.match_mp(x1123)(th_4)
            })(x1124),
          )
        })(@lib.last(x1125))
      })(@bool.conjuncts_rule(x1126))
    })
  })
  let t1117 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1116 = @tactics.disch_then(fn(
    x1114 : @kernel.Thm,
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
    let th_3 = x1114
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th_3))
  })
  let t1113 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1112 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x1109 : @kernel.Thm,
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
      let s1110 = @tactics.mp_tac(x1109)
      fn(
        x1111 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1110(x1111)
      }
    }),
  )
  let t1107 = @meson.asm_meson_tac(@list.List([]))
  let t1108 = @list.List([
    @meson.asm_meson_tac(@list.List([])),
    t1107,
    @tactics.all_tac,
  ])
  let t1106 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1105 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1104 = @tactics.pop_assum_list(fn(
    x1103 : @list.List[@kernel.Thm],
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
    @tactics.all_tac
  })
  let t1102 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.extension(),
      @sets.not_in_empty(),
      @sets.in_inter(),
      @sets.in_diff(),
    ]),
  )
  let t1100 = @term_syntax.parse_term("SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))")
  let t1101 = @tactics.map_every(
    fn(
      x1097 : @kernel.Term,
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
      let s1098 = @tactics.undisch_tac(x1097)
      fn(
        x1099 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1098(x1099)
      }
    },
    @list.List([@term_syntax.parse_term("SUBSET((s : (A) -> Bool), (k : (A) -> Bool))"), t1100]),
  )
  let t1096 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @theorems.exists_unique_thm(),
      @pair.exists_pair_thm(),
      in_card_mul(),
      @sets.in_union(),
      @pair.pair_eq(),
    ]),
  )
  let t1095 = @tactics.repeat_tac(
    @tactics.first_assum(fn(
      x1094 : @kernel.Thm,
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
        x1092 : @kernel.Term,
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
          x1087 : @kernel.Term,
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
          let s1088 = @tactics.undisch_tac(x1087)
          fn(
            x1089 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1088(x1089)
          }
        })(
          ((x1091 : @kernel.Term) => {
            @lib.check(
              fn(x1090 : @kernel.Term) -> Bool raise { @basics.is_conj(x1090) },
              x1091,
            )
          })(x1092),
        )
      })(
        (fn(x1093 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x1093) })(
          x1094,
        ),
      )
    }),
  )
  let t1085 = @meson.meson_tac(@list.List([]))
  let t1084 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_union(), @sets.in_diff()]),
  )
  let t1083 = @term_syntax.parse_term("SUBSET((s : (A) -> Bool), (k : (A) -> Bool))")
  let t1086 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x1080 : @kernel.Term,
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
            let s1081 = @tactics.undisch_tac(x1080)
            fn(
              x1082 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1081(x1082)
            }
          },
          @list.List([
            @term_syntax.parse_term("SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))"),
            t1083,
          ]),
        ),
        t1084,
      ),
      t1085,
    ),
    @tactics.all_tac,
  ])
  let t1079 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.infinite())]))
  let t1078 = @simp.rewrite_tac(
    @list.List([@sets.infinite(), @sets.finite_union(), @class.de_morgan_thm()]),
  )
  let t1074 = @meson.meson_tac(@list.List([]))
  let t1073 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff()]))
  let t1071 = @term_syntax.parse_term("SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))")
  let t1072 = @tactics.map_every(
    fn(
      x1068 : @kernel.Term,
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
      let s1069 = @tactics.undisch_tac(x1068)
      fn(
        x1070 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1069(x1070)
      }
    },
    @list.List([@term_syntax.parse_term("IN((a : A), (d : (A) -> Bool))"), t1071]),
  )
  let t1067 = @tactics.disch_then(fn(
    x1058 : @kernel.Thm,
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
    let th_2 = x1058
    @tactics.first_assum(fn(
      x1066 : @kernel.Thm,
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
        x1065 : @kernel.Thm,
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
          x1063 : @kernel.Thm,
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
            x1060 : @kernel.Thm,
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
            let s1061 = @tactics.mp_tac(x1060)
            fn(
              x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1061(x1062)
            }
          })(@bool.conjunct2(x1063))
        })(
          (fn(x1064 : @kernel.Thm) -> @kernel.Thm raise {
            @drule.match_mp(x1064)(th_2)
          })(x1065),
        )
      })(@bool.conjunct1(x1066))
    })
  })
  let t1057 = @simp.asm_rewrite_tac(@list.List([@sets.in_()]))
  let t1056 = @tactics.exists_tac(@term_syntax.parse_term("((b : (A, A)), (a : A))"))
  let t1055 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @class.not_forall_thm()]),
  )
  let t1053 = @tactics.conjuncts_then(fn(
    x1050 : @kernel.Thm,
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
    let s1051 = @tactics.assume_tac(x1050)
    fn(
      x1052 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1051(x1052)
    }
  })
  let t1054 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : (A, A))"))(t1053),
  )
  let t1049 = @tactics.disch_then(fn(
    x1048 : @kernel.Thm,
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
      x1045 : @kernel.Thm,
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
      let s1046 = @tactics.mp_tac(x1045)
      fn(
        x1047 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1046(x1047)
      }
    })(@bool.existence(x1048))
  })
  let t1039 = @kernel.assume_rule(@term_syntax.parse_term("IN((a : A), (d : (A) -> Bool))"))
  let t1044 = @tactics.first_assum(fn(
    x1043 : @kernel.Thm,
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
      x1042 : @list.List[@kernel.Thm],
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
        x1041 : @kernel.Thm,
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
          x1036 : @kernel.Thm,
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
          let s1037 = @tactics.mp_tac(x1036)
          fn(
            x1038 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1037(x1038)
          }
        })(
          (fn(x1040 : @kernel.Thm) -> @kernel.Thm raise {
            @drule.match_mp(x1040)(t1039)
          })(x1041),
        )
      })(@lib.last(x1042))
    })(@bool.conjuncts_rule(x1043))
  })
  let t1033 = @term_syntax.parse_term("(a : A)")
  let t1035 = @tactics.disch_then((x1034 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1033, x1034)
  })
  let t1032 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t1030 = @meson.asm_meson_tac(@list.List([card_infinite_cong()]))
  let t1029 = @simp.rewrite_tac(
    @list.List([@sets.finite_rules(), @equal.gsym(@sets.infinite())]),
  )
  let t1026 = @term_syntax.parse_term("(FINITE : ((A) -> Bool) -> Bool)")
  let t1031 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x1028 : @kernel.Thm,
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
            x1023 : @kernel.Thm,
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
            let s1024 = @tactics.mp_tac(x1023)
            fn(
              x1025 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1024(x1025)
            }
          })(((x1027 : @kernel.Thm) => @equal.ap_term(t1026, x1027))(x1028))
        }),
        t1029,
      ),
      t1030,
    ),
    @tactics.all_tac,
  ])
  let t1075 = @tactics.then_tac(
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
                          @tactics.thenl(
                            @tactics.subgoal_then(
                              @term_syntax.parse_term("!((d : (A) -> Bool) == {})"),
                              fn(
                                x1020 : @kernel.Thm,
                              ) -> ((
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
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
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise) raise {
                                let s1021 = @tactics.mp_tac(x1020)
                                fn(
                                  x1022 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
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
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise {
                                  s1021(x1022)
                                }
                              },
                            ),
                            t1031,
                          ),
                          t1032,
                        ),
                        t1035,
                      ),
                      t1044,
                    ),
                    t1049,
                  ),
                  t1054,
                ),
                t1055,
              ),
              t1056,
            ),
            t1057,
          ),
          t1067,
        ),
        t1072,
      ),
      t1073,
    ),
    t1074,
  )
  let t1076 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_()]))
  let t1077 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("UNION((s : (A) -> Bool), (d : (A) -> Bool))")),
    t1076,
    t1075,
  ])
  let t1019 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1018 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1017 = @tactics.disch_then(fn(
    x1016 : @kernel.Thm,
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
    @tactics.all_tac
  })
  let t1015 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t1011 = @term_syntax.parse_term("(x : ((A, A), A)) => (R : (((A, A), A)) -> Bool)(x) || (S : (((A, A), A)) -> Bool)(x)")
  let t1014 = @tactics.first_x_assum(fn(
    x1013 : @kernel.Thm,
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
      x1008 : @kernel.Thm,
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
      let s1009 = @tactics.mp_tac(x1008)
      fn(
        x1010 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1009(x1010)
      }
    })(((x1012 : @kernel.Thm) => @bool.spec(t1011, x1012))(x1013))
  })
  let t1005 = @term_syntax.parse_term("(S : (((A, A), A)) -> Bool)")
  let t1007 = @tactics.disch_then((x1006 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1005, x1006)
  })
  let t1004 = @simp.rewrite_tac(@list.List([eq_c(), @sets.in_union()]))
  let t1003 = @tactics.first_x_assum(
    @tactics.conjuncts_then(fn(
      x1000 : @kernel.Thm,
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
      let s1001 = @tactics.assume_tac(x1000)
      fn(
        x1002 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1001(x1002)
      }
    }),
  )
  let t999 = @tactics.first_x_assum(
    @tactics.conjuncts_then(fn(
      x996 : @kernel.Thm,
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
      let s997 = @tactics.assume_tac(x996)
      fn(
        x998 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s997(x998)
      }
    }),
  )
  let t994 = @simp.asm_simp_tac(@list.List([card_le_add(), card_le_refl()]))
  let t992 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), s)")
  let t993 = @tactics.trans_tac(card_le_trans())(t992)
  let t991 = @simp.rewrite_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_le_addr()]),
  )
  let t989 = @simp.asm_rewrite_tac(@list.List([]))
  let t990 = @list.List([
    @tactics.repeat_tac(
      @tactics.then_tac(@tactics.match_mp_tac(card_add_cong()), t989),
    ),
    @tactics.all_tac,
  ])
  let t987 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), op_plus_us_c(s, s))")
  let t988 = @tactics.trans_tac(card_eq_trans())(t987)
  let t985 = @simp.asm_rewrite_tac(@list.List([]))
  let t984 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t983 = @simp.asm_rewrite_tac(@list.List([card_eq_refl()]))
  let t982 = @tactics.match_mp_tac(card_mul_cong())
  let t986 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(card_add_cong()),
                @tactics.conj_tac,
              ),
            ),
            t982,
          ),
          t983,
        ),
        t984,
      ),
      t985,
    ),
    @tactics.all_tac,
  ])
  let t980 = @term_syntax.parse_term("op_plus_us_c(op_star_us_c((s : (A) -> Bool), s), op_plus_us_c(op_star_us_c(s, s), op_star_us_c(s, s)))")
  let t981 = @tactics.trans_tac(card_eq_trans())(t980)
  let t979 = @simp.asm_rewrite_tac(@list.List([]))
  let t977 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t978 = @tactics.trans_tac(card_eq_trans())(t977)
  let t975 = @meson.meson_tac(@list.List([]))
  let t974 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.not_in_empty(),
      @sets.in_inter(),
      @sets.in_union(),
      in_card_mul(),
      @sets.in_diff(),
    ]),
  )
  let t973 = @tactics.undisch_tac(
    @term_syntax.parse_term("SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))"),
  )
  let t972 = @tactics.undisch_tac(
    @term_syntax.parse_term("INTER((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)) == {}"),
  )
  let t971 = @tactics.match_mp_tac(card_disjoint_union())
  let t969 = @simp.rewrite_tac(@list.List([card_eq_refl()]))
  let t970 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(card_add_cong()), t969),
  ])
  let t968 = @term_syntax.parse_term("op_plus_us_c(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), UNION(op_star_us_c(d, s), op_star_us_c(d, d)))")
  let t976 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.trans_tac(card_eq_trans())(t968),
                  @tactics.conj_tac,
                ),
                t970,
              ),
              t971,
            ),
            t972,
          ),
          t973,
        ),
        t974,
      ),
      t975,
    ),
    @tactics.all_tac,
  ])
  let t967 = @term_syntax.parse_term("op_plus_us_c(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), op_plus_us_c(op_star_us_c(d, s), op_star_us_c(d, d)))")
  let t995 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.trans_tac(card_eq_trans())(t967),
                              @tactics.conj_tac,
                            ),
                            t976,
                          ),
                          t978,
                        ),
                        t979,
                      ),
                      t981,
                    ),
                    @tactics.conj_tac,
                  ),
                  t986,
                ),
                t988,
              ),
              @tactics.conj_tac,
            ),
            t990,
          ),
          t991,
        ),
        t993,
      ),
      t994,
    ),
    @tactics.all_tac,
  ])
  let t966 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_us_c(UNION(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), UNION(op_star_us_c(d, s), op_star_us_c(d, d))), d)"),
    fn(
      x963 : @kernel.Thm,
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
      let s964 = @tactics.mp_tac(x963)
      fn(
        x965 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s964(x965)
      }
    },
  )
  let t962 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t961 = @simp.rewrite_tac(@list.List([card_le_eq_subset()]))
  let t960 = @tactics.undisch_tac(@term_syntax.parse_term("op_lt_eq_us_c((s : (A) -> Bool), DIFF((k : (A) -> Bool), s))"))
  let t958 = @simp.simp_tac(
    @list.List([card_eq_refl(), @sets.subset(), @sets.in_union()]),
  )
  let t957 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t956 = @simp.rewrite_tac(@list.List([card_le_eq_subset()]))
  let t955 = @simp.asm_simp_tac(@list.List([card_eq_imp_le()]))
  let t953 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t954 = @tactics.trans_tac(card_le_trans())(t953)
  let t952 = @simp.asm_simp_tac(@list.List([card_le_mul()]))
  let t950 = @term_syntax.parse_term("op_star_us_c((s : (A) -> Bool), s)")
  let t951 = @tactics.trans_tac(card_le_trans())(t950)
  let t949 = @simp.asm_simp_tac(
    @list.List([card_le_add(), card_le_mul(), card_le_refl()]),
  )
  let t947 = @term_syntax.parse_term("op_star_us_c(op_plus_us_c((s : (A) -> Bool), s), op_plus_us_c(s, s))")
  let t948 = @tactics.trans_tac(card_le_trans())(t947)
  let t946 = @simp.asm_simp_tac(
    @list.List([card_disjoint_union(), card_eq_imp_le(), card_mul_cong()]),
  )
  let t944 = @term_syntax.parse_term("op_star_us_c(op_plus_us_c((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)), op_plus_us_c(s, DIFF(k, s)))")
  let t945 = @tactics.trans_tac(card_le_trans())(t944)
  let t943 = @simp.rewrite_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_le_square()]),
  )
  let t941 = @meson.meson_tac(@list.List([]))
  let t940 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.extension(),
      @sets.in_inter(),
      @sets.not_in_empty(),
      @sets.in_union(),
      @sets.in_diff(),
    ]),
  )
  let t942 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x939 : @kernel.Thm,
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
            x938 : @kernel.Thm,
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
              x935 : @kernel.Thm,
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
              let s936 = @tactics.mp_tac(x935)
              fn(
                x937 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s936(x937)
              }
            })(@bool.conjunct1(x938))
          })(@bool.conjunct2(x939))
        }),
        t940,
      ),
      t941,
    ),
    @tactics.all_tac,
  ])
  let t959 = @list.List([
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
                            @tactics.thenl(
                              @tactics.subgoal_then(
                                @term_syntax.parse_term("(k : (A) -> Bool) == UNION((s : (A) -> Bool), DIFF(k, s))"),
                                fn(
                                  x932 : @kernel.Thm,
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
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
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  let s933 = @tactics.subst1_tac(x932)
                                  fn(
                                    x934 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> (
                                    (
                                      @list.List[@kernel.Term],
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
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
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise {
                                    s933(x934)
                                  }
                                },
                              ),
                              t942,
                            ),
                            t943,
                          ),
                          t945,
                        ),
                        t946,
                      ),
                      t948,
                    ),
                    t949,
                  ),
                  t951,
                ),
                t952,
              ),
              t954,
            ),
            t955,
          ),
          t956,
        ),
        t957,
      ),
      t958,
    ),
    @tactics.all_tac,
  ])
  let t930 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t931 = @tactics.disj_cases_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("DIFF((k : (A) -> Bool), (s : (A) -> Bool))"), t930]),
      card_le_total(),
    ),
  )
  let t928 = @meson.meson_tac(@list.List([]))
  let t929 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          @sets.in_inter(),
          @sets.in_diff(),
          @sets.not_in_empty(),
        ]),
      ),
      t928,
    ),
    @tactics.all_tac,
  ])
  let t927 = @tactics.subgoal_then(
    @term_syntax.parse_term("INTER((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)) == {}"),
    fn(
      x924 : @kernel.Thm,
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
      let s925 = @tactics.assume_tac(x924)
      fn(
        x926 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s925(x926)
      }
    },
  )
  let t922 = @simp.asm_simp_tac(
    @list.List([card_eq_imp_le(), card_add_le_mul_infinite()]),
  )
  let t921 = @term_syntax.parse_term("op_star_us_c((s : (A) -> Bool), s)")
  let t923 = @list.List([
    @tactics.then_tac(@tactics.trans_tac(card_le_trans())(t921), t922),
    @tactics.all_tac,
  ])
  let t920 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_lt_eq_us_c(op_plus_us_c((s : (A) -> Bool), s), s)"),
    fn(
      x917 : @kernel.Thm,
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
      let s918 = @tactics.assume_tac(x917)
      fn(
        x919 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s918(x919)
      }
    },
  )
  let t915 = @simp.asm_rewrite_tac(@list.List([]))
  let t914 = @tactics.exists_tac(@term_syntax.parse_term("(R : (((A, A), A)) -> Bool)"))
  let t916 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([eq_c()])), t914),
      t915,
    ),
    @tactics.all_tac,
  ])
  let t913 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_us_c(op_star_us_c((s : (A) -> Bool), s), s)"),
    fn(
      x910 : @kernel.Thm,
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
      let s911 = @tactics.assume_tac(x910)
      fn(
        x912 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s911(x912)
      }
    },
  )
  let t903 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t908 = @tactics.conjuncts_then2(
    (x904 : @kernel.Thm) => @tactics.x_choose_tac(t903, x904),
    fn(
      x905 : @kernel.Thm,
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
      let s906 = @tactics.assume_tac(x905)
      fn(
        x907 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s906(x907)
      }
    },
  )
  let t909 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(R : (((A, A), A)) -> Bool)"))(t908),
  )
  let t902 = @simp.rewrite_tac(@list.List([]))
  let t901 = @tactics.first_x_assum(fn(
    x900 : @kernel.Thm,
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
      x897 : @kernel.Thm,
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
      let s898 = @tactics.subst1_tac(x897)
      fn(
        x899 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s898(x899)
      }
    })(@equal.sym(x900))
  })
  let t895 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t894 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @sets.unions()]),
  )
  let t893 = @tactics.match_mp_tac(
    @simp.once_rewrite_rule(
      @list.List([
        @class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (b → a → c)")),
      ]),
    )(@sets.finite_subset()),
  )
  let t892 = @simp.asm_rewrite_tac(
    @list.List([@sets.infinite(), @class.contrapos_thm()]),
  )
  let t888 = @term_syntax.parse_term("(s : (((A, A), A)) -> Bool)")
  let t891 = @tactics.disch_then(fn(
    x890 : @kernel.Thm,
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
      x885 : @kernel.Thm,
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
      let s886 = @tactics.mp_tac(x885)
      fn(
        x887 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s886(x887)
      }
    })(((x889 : @kernel.Thm) => @bool.spec(t888, x889))(x890))
  })
  let t879 = @term_syntax.parse_term("(s : (((A, A), A)) -> Bool)")
  let t884 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x880 : @kernel.Thm) => @tactics.x_choose_tac(t879, x880),
      fn(
        x881 : @kernel.Thm,
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
        let s882 = @tactics.mp_tac(x881)
        fn(
          x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s882(x883)
        }
      },
    ),
  )
  let t877 = @meson.meson_tac(@list.List([]))
  let t876 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_()]))
  let t878 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.unions(), @sets.in_elim_thm()])),
        t876,
      ),
      t877,
    ),
    @tactics.all_tac,
  ])
  let t875 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((c : Bool) && (d : Bool) → (f : Bool)) && ((a : Bool) && (b : Bool) → (e : Bool)) → a && (b && c) && d → e && f"),
    ),
  )
  let t874 = @simp.gen_rewrite_tac(
    fn(
      x873 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x867 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s868 = @equal.land_conv(x867)
        fn(x869 : @kernel.Term) -> @kernel.Thm raise { s868(x869) }
      })(
        (fn(
          x870 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s871 = @equal.once_depth_conv(x870)
          fn(x872 : @kernel.Term) -> @kernel.Thm raise { s871(x872) }
        })(x873),
      )
    },
    @list.List([@theorems.forall_and_thm()]),
  )
  let t866 = @simp.gen_rewrite_tac(
    fn(
      x865 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x859 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s860 = @equal.land_conv(x859)
        fn(x861 : @kernel.Term) -> @kernel.Thm raise { s860(x861) }
      })(
        (fn(
          x862 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s863 = @equal.once_depth_conv(x862)
          fn(x864 : @kernel.Term) -> @kernel.Thm raise { s863(x864) }
        })(x865),
      )
    },
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"),
      ),
    ]),
  )
  let t858 = @simp.rewrite_tac(@list.List([]))
  let t857 = @tactics.first_x_assum(fn(
    x856 : @kernel.Thm,
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
      x855 : @kernel.Thm,
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
      @tactics.all_tac
    })(@equal.sym(x856))
  })
  let t853 = @meson.meson_tac(@list.List([]))
  let t852 = @simp.rewrite_tac(
    @list.List([
      in_card_mul(),
      @pair.exists_pair_thm(),
      @sets.subset(),
      @class.fun_eq_thm(),
      @sets.in_elim_thm(),
      @pair.forall_pair_thm(),
      @theorems.exists_unique_thm(),
      @sets.unions(),
      @pair.pair_eq(),
    ]),
  )
  let t851 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t850 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t849 = @simp.once_rewrite_tac(
    @list.List([
      @drule.match_mp(
        @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → a == (b && a)")),
      )(lemma),
    ]),
  )
  let t848 = @simp.rewrite_tac(@list.List([]))
  let t854 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.first_x_assum(fn(
                      x847 : @kernel.Thm,
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
                      (fn(
                        x844 : @kernel.Thm,
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
                        let s845 = @tactics.subst1_tac(x844)
                        fn(
                          x846 : (
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
                        ) raise {
                          s845(x846)
                        }
                      })(@equal.sym(x847))
                    }),
                    t848,
                  ),
                  t849,
                ),
                t850,
              ),
              t851,
            ),
            t852,
          ),
          @tactics.gen_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t853,
    ),
    @tactics.all_tac,
  ])
  let t843 = @tactics.subgoal_then(
    @term_syntax.parse_term("(P : ((((A, A), A)) -> Bool) -> Bool) == ((R : (((A, A), A)) -> Bool) => INFINITE({(z : A) | ∃ x : A, ∃ y : A, R(((x, y), z))}) && (∀ x : A, ∀ y : A, ∀ z : A, R(((x, y), z)) → IN(x, (k : (A) -> Bool)) && IN(y, k) && IN(z, k)) && (∀ x : A, ∀ y : A, (∃ u : A, ∃ v : A, R(((u, v), x))) && (∃ u : A, ∃ v : A, R(((u, v), y))) → (∃ z : A, R(((x, y), z)))) && (∀ x : A, ∀ y : A, (∃ z : A, R(((x, y), z))) → (∃ u : A, ∃ v : A, R(((u, v), x))) && (∃ u : A, ∃ v : A, R(((u, v), y)))) && (∀ x : A, ∀ y : A, ∀ z1 : A, ∀ z2 : A, R(((x, y), z1)) && R(((x, y), z2)) → z1 == z2) && (∀ x1 : A, ∀ y1 : A, ∀ x2 : A, ∀ y2 : A, ∀ z : A, R(((x1, y1), z)) && R(((x2, y2), z)) → x1 == x2 && y1 == y2))"),
    fn(
      x840 : @kernel.Thm,
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
      let s841 = @tactics.subst1_tac(x840)
      fn(
        x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s841(x842)
      }
    },
  )
  let t839 = @tactics.first_assum(fn(
    x828 : @kernel.Thm,
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
    let th_1 = x828
    let t833 = @drule.match_mp(card_eq_trans())
    @tactics.disch_then(fn(
      x838 : @kernel.Thm,
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
        x834 : @kernel.Thm,
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
          x830 : @kernel.Thm,
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
          let s831 = @tactics.accept_tac(x830)
          fn(
            x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s831(x832)
          }
        })(t833(x834))
      })(
        (fn(x837 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x835 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x836 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.conj(x835, x836)
            }
          })(x837)(th_1)
        })(x838),
      )
    })
  })
  let t825 = @drule.match_mp(card_eq_trans())
  let t827 = @tactics.disch_then(fn(
    x826 : @kernel.Thm,
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
      x822 : @kernel.Thm,
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
      let s823 = @tactics.mp_tac(x822)
      fn(
        x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s823(x824)
      }
    })(t825(x826))
  })
  let t821 = @tactics.disch_then(fn(
    x820 : @kernel.Thm,
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
      x814 : @kernel.Thm,
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
      let s815 = @tactics.mp_tac(x814)
      fn(
        x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s815(x816)
      }
    })(
      (fn(x819 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x817 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          fn(x818 : @kernel.Thm) -> @kernel.Thm raise { @bool.conj(x817, x818) }
        })(x819)(card_square_num())
      })(x820),
    )
  })
  let t813 = @simp.gen_rewrite_tac(
    fn(
      x810 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s811 = @equal.land_conv(x810)
      fn(x812 : @kernel.Term) -> @kernel.Thm raise { s811(x812) }
    },
    @list.List([card_eq_sym()]),
  )
  let t809 = @tactics.first_assum(fn(
    x806 : @kernel.Thm,
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
    let th = x806
    let t808 = @bool.conj(th, th)
    @tactics.mp_tac(@drule.match_mp(card_mul_cong())(t808))
  })
  let t805 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@sets.num_infinite(), card_infinite_cong()]),
    ),
    @tactics.all_tac,
  ])
  let t804 = @simp.asm_rewrite_tac(@list.List([]))
  let t803 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t802 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t801 = @simp.rewrite_tac(@list.List([card_le_eq_subset()]))
  let t798 = @simp.gen_rewrite_rule(
    fn(
      x797 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x797
    },
    @list.List([infinite_card_le()]),
  )
  let t800 = @tactics.first_x_assum(fn(
    x799 : @kernel.Thm,
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
      x794 : @kernel.Thm,
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
      let s795 = @tactics.mp_tac(x794)
      fn(
        x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s795(x796)
      }
    })(t798(x799))
  })
  let t793 = @simp.rewrite_tac(
    @list.List([@theorems.right_exists_and_thm(), @equal.gsym(eq_c())]),
  )
  let t792 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t791 = @simp.rewrite_tac(@list.List([]))
  let t896 = @list.List([
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.conj_tac,
                                      @list.List([
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.thenl(
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
                                                                        @tactics.first_x_assum(fn(
                                                                            x790 : @kernel.Thm,
                                                                          ) -> ((
                                                                            (
                                                                              @list.List[
                                                                                (
                                                                                  String,
                                                                                  @kernel.Thm,
                                                                                ),
                                                                              ],
                                                                              @kernel.Term,
                                                                            ),
                                                                          ) -> (
                                                                            (
                                                                              @list.List[
                                                                                @kernel.Term,
                                                                              ],
                                                                              (
                                                                                @list.List[
                                                                                  (
                                                                                    Int64,
                                                                                    @kernel.Term,
                                                                                  ),
                                                                                ],
                                                                                @list.List[
                                                                                  (
                                                                                    @kernel.Term,
                                                                                    @kernel.Term,
                                                                                  ),
                                                                                ],
                                                                                @list.List[
                                                                                  (
                                                                                    @kernel.HolType,
                                                                                    @kernel.HolType,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            @list.List[
                                                                              (
                                                                                @list.List[
                                                                                  (
                                                                                    String,
                                                                                    @kernel.Thm,
                                                                                  ),
                                                                                ],
                                                                                @kernel.Term,
                                                                              ),
                                                                            ],
                                                                            (
                                                                              (
                                                                                @list.List[
                                                                                  (
                                                                                    Int64,
                                                                                    @kernel.Term,
                                                                                  ),
                                                                                ],
                                                                                @list.List[
                                                                                  (
                                                                                    @kernel.Term,
                                                                                    @kernel.Term,
                                                                                  ),
                                                                                ],
                                                                                @list.List[
                                                                                  (
                                                                                    @kernel.HolType,
                                                                                    @kernel.HolType,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              @list.List[
                                                                                @kernel.Thm,
                                                                              ],
                                                                            ) -> @kernel.Thm raise,
                                                                          ) raise) raise {
                                                                            (fn(
                                                                              x787 : @kernel.Thm,
                                                                            ) -> ((
                                                                              (
                                                                                @list.List[
                                                                                  (
                                                                                    String,
                                                                                    @kernel.Thm,
                                                                                  ),
                                                                                ],
                                                                                @kernel.Term,
                                                                              ),
                                                                            ) -> (
                                                                              (
                                                                                @list.List[
                                                                                  @kernel.Term,
                                                                                ],
                                                                                (
                                                                                  @list.List[
                                                                                    (
                                                                                      Int64,
                                                                                      @kernel.Term,
                                                                                    ),
                                                                                  ],
                                                                                  @list.List[
                                                                                    (
                                                                                      @kernel.Term,
                                                                                      @kernel.Term,
                                                                                    ),
                                                                                  ],
                                                                                  @list.List[
                                                                                    (
                                                                                      @kernel.HolType,
                                                                                      @kernel.HolType,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              @list.List[
                                                                                (
                                                                                  @list.List[
                                                                                    (
                                                                                      String,
                                                                                      @kernel.Thm,
                                                                                    ),
                                                                                  ],
                                                                                  @kernel.Term,
                                                                                ),
                                                                              ],
                                                                              (
                                                                                (
                                                                                  @list.List[
                                                                                    (
                                                                                      Int64,
                                                                                      @kernel.Term,
                                                                                    ),
                                                                                  ],
                                                                                  @list.List[
                                                                                    (
                                                                                      @kernel.Term,
                                                                                      @kernel.Term,
                                                                                    ),
                                                                                  ],
                                                                                  @list.List[
                                                                                    (
                                                                                      @kernel.HolType,
                                                                                      @kernel.HolType,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                @list.List[
                                                                                  @kernel.Thm,
                                                                                ],
                                                                              ) -> @kernel.Thm raise,
                                                                            ) raise) raise {
                                                                              let s788 = @tactics.subst1_tac(
                                                                                x787,
                                                                              )
                                                                              fn(
                                                                                x789 : (
                                                                                  @list.List[
                                                                                    (
                                                                                      String,
                                                                                      @kernel.Thm,
                                                                                    ),
                                                                                  ],
                                                                                  @kernel.Term,
                                                                                ),
                                                                              ) -> (
                                                                                (
                                                                                  @list.List[
                                                                                    @kernel.Term,
                                                                                  ],
                                                                                  (
                                                                                    @list.List[
                                                                                      (
                                                                                        Int64,
                                                                                        @kernel.Term,
                                                                                      ),
                                                                                    ],
                                                                                    @list.List[
                                                                                      (
                                                                                        @kernel.Term,
                                                                                        @kernel.Term,
                                                                                      ),
                                                                                    ],
                                                                                    @list.List[
                                                                                      (
                                                                                        @kernel.HolType,
                                                                                        @kernel.HolType,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                @list.List[
                                                                                  (
                                                                                    @list.List[
                                                                                      (
                                                                                        String,
                                                                                        @kernel.Thm,
                                                                                      ),
                                                                                    ],
                                                                                    @kernel.Term,
                                                                                  ),
                                                                                ],
                                                                                (
                                                                                  (
                                                                                    @list.List[
                                                                                      (
                                                                                        Int64,
                                                                                        @kernel.Term,
                                                                                      ),
                                                                                    ],
                                                                                    @list.List[
                                                                                      (
                                                                                        @kernel.Term,
                                                                                        @kernel.Term,
                                                                                      ),
                                                                                    ],
                                                                                    @list.List[
                                                                                      (
                                                                                        @kernel.HolType,
                                                                                        @kernel.HolType,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  @list.List[
                                                                                    @kernel.Thm,
                                                                                  ],
                                                                                ) -> @kernel.Thm raise,
                                                                              ) raise {
                                                                                s788(
                                                                                  x789,
                                                                                )
                                                                              }
                                                                            })(
                                                                              @equal.sym(
                                                                                x790,
                                                                              ),
                                                                            )
                                                                          },
                                                                        ),
                                                                        t791,
                                                                      ),
                                                                      t792,
                                                                    ),
                                                                    t793,
                                                                  ),
                                                                  t800,
                                                                ),
                                                                t801,
                                                              ),
                                                              t802,
                                                            ),
                                                            t803,
                                                          ),
                                                          @tactics.strip_tac,
                                                        ),
                                                        t804,
                                                      ),
                                                      @tactics.conj_tac,
                                                    ),
                                                    t805,
                                                  ),
                                                  t809,
                                                ),
                                                t813,
                                              ),
                                              t821,
                                            ),
                                            t827,
                                          ),
                                          t839,
                                        ),
                                        @tactics.all_tac,
                                      ]),
                                    ),
                                    t843,
                                  ),
                                  t854,
                                ),
                                t857,
                              ),
                              t858,
                            ),
                            @tactics.gen_tac,
                          ),
                          t866,
                        ),
                        t874,
                      ),
                      t875,
                    ),
                    @tactics.conj_tac,
                  ),
                  t878,
                ),
                t884,
              ),
              t891,
            ),
            t892,
          ),
          t893,
        ),
        t894,
      ),
      t895,
    ),
    @tactics.all_tac,
  ])
  let t786 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(P : ((((A, A), A)) -> Bool) -> Bool)"),
      @wo.zl_subsets_unions_nonempty(),
    ),
  )
  let t785 = @simp.abbrev_tac(
    @term_syntax.parse_term("(P : ((((A, A), A)) -> Bool) -> Bool) == ((R : (((A, A), A)) -> Bool) => ∃ s : (A) -> Bool, INFINITE(s) && SUBSET(s, (k : (A) -> Bool)) && (∀ x : (A, A), ∀ y : A, R((x, y)) → IN(x, op_star_us_c(s, s)) && IN(y, s)) && (∀ x : (A, A), IN(x, op_star_us_c(s, s)) → existsunique((y : A) => IN(y, s) && R((x, y)))) && (∀ y : A, IN(y, s) → existsunique((x : (A, A)) => IN(x, op_star_us_c(s, s)) && R((x, y)))))"),
  )
  let t1129 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
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
                                        @tactics.thenl(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
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
                                                                    @tactics.then_tac(
                                                                      @tactics.thenl(
                                                                        @tactics.then_tac(
                                                                          @tactics.thenl(
                                                                            @tactics.then_tac(
                                                                              @tactics.thenl(
                                                                                @tactics.then_tac(
                                                                                  @tactics.thenl(
                                                                                    @tactics.then_tac(
                                                                                      @tactics.then_tac(
                                                                                        @tactics.then_tac(
                                                                                          @tactics.then_tac(
                                                                                            @tactics.thenl(
                                                                                              @tactics.then_tac(
                                                                                                @tactics.then_tac(
                                                                                                  @tactics.then_tac(
                                                                                                    @tactics.repeat_tac(
                                                                                                      @tactics.strip_tac,
                                                                                                    ),
                                                                                                    t785,
                                                                                                  ),
                                                                                                  t786,
                                                                                                ),
                                                                                                @tactics.ants_tac,
                                                                                              ),
                                                                                              t896,
                                                                                            ),
                                                                                            t901,
                                                                                          ),
                                                                                          t902,
                                                                                        ),
                                                                                        t909,
                                                                                      ),
                                                                                      t913,
                                                                                    ),
                                                                                    t916,
                                                                                  ),
                                                                                  t920,
                                                                                ),
                                                                                t923,
                                                                              ),
                                                                              t927,
                                                                            ),
                                                                            t929,
                                                                          ),
                                                                          t931,
                                                                        ),
                                                                        t959,
                                                                      ),
                                                                      t960,
                                                                    ),
                                                                    t961,
                                                                  ),
                                                                  t962,
                                                                ),
                                                                t966,
                                                              ),
                                                              t995,
                                                            ),
                                                            t999,
                                                          ),
                                                          t1003,
                                                        ),
                                                        t1004,
                                                      ),
                                                      t1007,
                                                    ),
                                                    t1014,
                                                  ),
                                                  t1015,
                                                ),
                                                t1017,
                                              ),
                                              t1018,
                                            ),
                                            t1019,
                                          ),
                                          t1077,
                                        ),
                                        t1078,
                                      ),
                                      t1079,
                                    ),
                                    @tactics.conj_tac,
                                  ),
                                  t1086,
                                ),
                                t1095,
                              ),
                              t1096,
                            ),
                            t1101,
                          ),
                          t1102,
                        ),
                        t1104,
                      ),
                      t1105,
                    ),
                    t1106,
                  ),
                  t1108,
                ),
                @tactics.gen_tac,
              ),
              t1112,
            ),
            t1113,
          ),
          t1116,
        ),
        t1117,
      ),
      t1127,
    ),
    t1128,
  )
  card_square_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (A) -> Bool, INFINITE(k) → op_eq_us_c(op_star_us_c(k, k), k)"),
      t1129,
    ),
  )
}

///|
let card_square_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_SQUARE_INFINITE",
)

///|
/// `CARD_SQUARE_INFINITE`
pub fn card_square_infinite() -> @kernel.Thm {
  card_square_infinite_c.get()
}

///|
/// CARD_ADD_FINITE
fn step_112() -> Unit raise {
  let t1130 = @simp.simp_tac(
    @list.List([
      add_c(),
      @sets.finite_union(),
      @sets.simple_image(),
      @sets.finite_image(),
    ]),
  )
  card_add_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) → FINITE(op_plus_us_c(s, t))"),
      t1130,
    ),
  )
}

///|
let card_add_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_FINITE",
)

///|
/// `CARD_ADD_FINITE`
pub fn card_add_finite() -> @kernel.Thm {
  card_add_finite_c.get()
}

///|
/// CARD_ADD_FINITE_EQ
fn step_113() -> Unit raise {
  let t1136 = @simp.rewrite_tac(@list.List([card_le_addl(), card_le_addr()]))
  let t1135 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_finite()),
  )
  let t1134 = @tactics.disch_then(fn(
    x1132 : @kernel.Thm,
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
    let th = x1132
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th))
  })
  let t1131 = @simp.rewrite_tac(@list.List([card_add_finite()]))
  let t1137 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          t1131,
        ),
        t1134,
      ),
      t1135,
    ),
    t1136,
  )
  card_add_finite_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(op_plus_us_c(s, t)) == (FINITE(s) && FINITE(t))"),
      t1137,
    ),
  )
}

///|
let card_add_finite_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_FINITE_EQ",
)

///|
/// `CARD_ADD_FINITE_EQ`
pub fn card_add_finite_eq() -> @kernel.Thm {
  card_add_finite_eq_c.get()
}

///|
/// CARD_MUL_FINITE
fn step_114() -> Unit raise {
  let t1138 = @simp.simp_tac(@list.List([mul_c(), @sets.finite_product()]))
  card_mul_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) → FINITE(op_star_us_c(s, t))"),
      t1138,
    ),
  )
}

///|
let card_mul_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_FINITE",
)

///|
/// `CARD_MUL_FINITE`
pub fn card_mul_finite() -> @kernel.Thm {
  card_mul_finite_c.get()
}

///|
/// CARD_MUL_FINITE_EQ
fn step_115() -> Unit raise {
  let t1139 = @simp.rewrite_tac(
    @list.List([mul_c(), @equal.gsym(@sets.cross()), @sets.finite_cross_eq()]),
  )
  card_mul_finite_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(op_star_us_c(s, t)) == (s == {} || t == {} || FINITE(s) && FINITE(t))"),
      t1139,
    ),
  )
}

///|
let card_mul_finite_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_FINITE_EQ",
)

///|
/// `CARD_MUL_FINITE_EQ`
pub fn card_mul_finite_eq() -> @kernel.Thm {
  card_mul_finite_eq_c.get()
}

///|
/// CARD_MUL_ABSORB_LE
fn step_116() -> Unit raise {
  let t1142 = @simp.asm_simp_tac(
    @list.List([
      card_le_mul(),
      card_le_refl(),
      card_square_infinite(),
      card_eq_imp_le(),
    ]),
  )
  let t1140 = @term_syntax.parse_term("op_star_us_c((t : (B) -> Bool), t)")
  let t1141 = @tactics.trans_tac(card_le_trans())(t1140)
  let t1143 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1141),
    t1142,
  )
  card_mul_absorb_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) → op_lt_eq_us_c(op_star_us_c(s, t), t)"),
      t1143,
    ),
  )
}

///|
let card_mul_absorb_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_ABSORB_LE",
)

///|
/// `CARD_MUL_ABSORB_LE`
pub fn card_mul_absorb_le() -> @kernel.Thm {
  card_mul_absorb_le_c.get()
}

///|
/// CARD_MUL2_ABSORB_LE
fn step_117() -> Unit raise {
  let t1148 = @simp.asm_rewrite_tac(@list.List([card_le_refl()]))
  let t1147 = @tactics.match_mp_tac(card_le_mul())
  let t1146 = @simp.asm_simp_tac(@list.List([card_mul_absorb_le()]))
  let t1144 = @term_syntax.parse_term("op_star_us_c((s : (A) -> Bool), (u : (C) -> Bool))")
  let t1145 = @tactics.trans_tac(card_le_trans())(t1144)
  let t1149 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1145),
        t1146,
      ),
      t1147,
    ),
    t1148,
  )
  card_mul2_absorb_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, INFINITE(u) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) → op_lt_eq_us_c(op_star_us_c(s, t), u)"),
      t1149,
    ),
  )
}

///|
let card_mul2_absorb_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL2_ABSORB_LE",
)

///|
/// `CARD_MUL2_ABSORB_LE`
pub fn card_mul2_absorb_le() -> @kernel.Thm {
  card_mul2_absorb_le_c.get()
}

///|
/// CARD_MUL2_ABSORB_LE_ALT
fn step_118() -> Unit raise {
  let t1150 = @meson.meson_tac(
    @list.List([card_le_infinite(), card_mul2_absorb_le()]),
  )
  card_mul2_absorb_le_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, (INFINITE(s) || INFINITE(t)) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) → op_lt_eq_us_c(op_star_us_c(s, t), u)"),
      t1150,
    ),
  )
}

///|
let card_mul2_absorb_le_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL2_ABSORB_LE_ALT",
)

///|
/// `CARD_MUL2_ABSORB_LE_ALT`
pub fn card_mul2_absorb_le_alt() -> @kernel.Thm {
  card_mul2_absorb_le_alt_c.get()
}

///|
/// CARD_ADD_ABSORB_LE
fn step_119() -> Unit raise {
  let t1156 = @simp.asm_simp_tac(
    @list.List([card_add_le_mul_infinite(), card_le_add(), card_le_refl()]),
  )
  let t1154 = @term_syntax.parse_term("op_plus_us_c((t : (B) -> Bool), t)")
  let t1155 = @tactics.trans_tac(card_le_trans())(t1154)
  let t1153 = @simp.asm_simp_tac(
    @list.List([card_square_infinite(), card_eq_imp_le()]),
  )
  let t1151 = @term_syntax.parse_term("op_star_us_c((t : (B) -> Bool), t)")
  let t1152 = @tactics.trans_tac(card_le_trans())(t1151)
  let t1157 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1152),
        t1153,
      ),
      t1155,
    ),
    t1156,
  )
  card_add_absorb_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) → op_lt_eq_us_c(op_plus_us_c(s, t), t)"),
      t1157,
    ),
  )
}

///|
let card_add_absorb_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_ABSORB_LE",
)

///|
/// `CARD_ADD_ABSORB_LE`
pub fn card_add_absorb_le() -> @kernel.Thm {
  card_add_absorb_le_c.get()
}

///|
/// CARD_ADD2_ABSORB_LE
fn step_120() -> Unit raise {
  let t1162 = @simp.asm_rewrite_tac(@list.List([card_le_refl()]))
  let t1161 = @tactics.match_mp_tac(card_le_add())
  let t1160 = @simp.asm_simp_tac(@list.List([card_add_absorb_le()]))
  let t1158 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), (u : (C) -> Bool))")
  let t1159 = @tactics.trans_tac(card_le_trans())(t1158)
  let t1163 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1159),
        t1160,
      ),
      t1161,
    ),
    t1162,
  )
  card_add2_absorb_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, INFINITE(u) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) → op_lt_eq_us_c(op_plus_us_c(s, t), u)"),
      t1163,
    ),
  )
}

///|
let card_add2_absorb_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD2_ABSORB_LE",
)

///|
/// `CARD_ADD2_ABSORB_LE`
pub fn card_add2_absorb_le() -> @kernel.Thm {
  card_add2_absorb_le_c.get()
}

///|
/// CARD_MUL_ABSORB
fn step_121() -> Unit raise {
  let t1173 = @simp.asm_simp_tac(@list.List([in_card_mul(), @pair.pair_eq()]))
  let t1172 = @tactics.exists_tac(@term_syntax.parse_term("(x : B) => ((a : A), x)"))
  let t1171 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t1168 = @simp.gen_rewrite_rule(
    fn(
      x1167 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1167
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t1165 = @term_syntax.parse_term("(a : A)")
  let t1170 = @tactics.first_x_assum(fn(
    x1169 : @kernel.Thm,
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
    ((x1166 : @kernel.Thm) => @tactics.x_choose_tac(t1165, x1166))(t1168(x1169))
  })
  let t1164 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1174 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.simp_tac(
              @list.List([@equal.gsym(card_le_antisym()), card_mul_absorb_le()]),
            ),
            t1164,
          ),
          t1170,
        ),
        t1171,
      ),
      t1172,
    ),
    t1173,
  )
  card_mul_absorb_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(t) && !(s == {}) && op_lt_eq_us_c(s, t) → op_eq_us_c(op_star_us_c(s, t), t)"),
      t1174,
    ),
  )
}

///|
let card_mul_absorb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_ABSORB",
)

///|
/// `CARD_MUL_ABSORB`
pub fn card_mul_absorb() -> @kernel.Thm {
  card_mul_absorb_c.get()
}

///|
/// CARD_ADD_ABSORB_LEFT
fn step_122() -> Unit raise {
  let t1175 = @simp.simp_tac(
    @list.List([
      @equal.gsym(card_le_antisym()),
      card_le_addl(),
      card_add_absorb_le(),
    ]),
  )
  card_add_absorb_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) → op_eq_us_c(op_plus_us_c(s, t), t)"),
      t1175,
    ),
  )
}

///|
let card_add_absorb_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_ABSORB_LEFT",
)

///|
/// `CARD_ADD_ABSORB_LEFT`
pub fn card_add_absorb_left() -> @kernel.Thm {
  card_add_absorb_left_c.get()
}

///|
/// CARD_ADD_ABSORB_RIGHT
fn step_123() -> Unit raise {
  let t1178 = @simp.asm_simp_tac(
    @list.List([card_add_absorb_left(), card_add_sym()]),
  )
  let t1176 = @term_syntax.parse_term("op_plus_us_c((t : (B) -> Bool), (s : (A) -> Bool))")
  let t1177 = @tactics.trans_tac(card_eq_trans())(t1176)
  let t1179 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1177),
    t1178,
  )
  card_add_absorb_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(s) && op_lt_eq_us_c(t, s) → op_eq_us_c(op_plus_us_c(s, t), s)"),
      t1179,
    ),
  )
}

///|
let card_add_absorb_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD_ABSORB_RIGHT",
)

///|
/// `CARD_ADD_ABSORB_RIGHT`
pub fn card_add_absorb_right() -> @kernel.Thm {
  card_add_absorb_right_c.get()
}

///|
/// CARD_UNION_ABSORB_LEFT
fn step_124() -> Unit raise {
  let t1186 = @simp.asm_simp_tac(@list.List([card_add_absorb_left()]))
  let t1185 = @tactics.match_mp_tac(card_eq_imp_le())
  let t1184 = @simp.rewrite_tac(@list.List([union_le_add_c()]))
  let t1182 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), (t : (A) -> Bool))")
  let t1183 = @tactics.trans_tac(card_le_trans())(t1182)
  let t1181 = @simp.simp_tac(
    @list.List([card_le_subset(), @sets.subset_union()]),
  )
  let t1180 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t1187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1180),
            t1181,
          ),
          t1183,
        ),
        t1184,
      ),
      t1185,
    ),
    t1186,
  )
  card_union_absorb_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) → op_eq_us_c(UNION(s, t), t)"),
      t1187,
    ),
  )
}

///|
let card_union_absorb_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_UNION_ABSORB_LEFT",
)

///|
/// `CARD_UNION_ABSORB_LEFT`
pub fn card_union_absorb_left() -> @kernel.Thm {
  card_union_absorb_left_c.get()
}

///|
/// CARD_UNION_ABSORB_RIGHT
fn step_125() -> Unit raise {
  let t1188 = @simp.rewrite_tac(@list.List([card_union_absorb_left()]))
  let t1189 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@sets.union_comm()])),
    t1188,
  )
  card_union_absorb_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INFINITE(s) && op_lt_eq_us_c(t, s) → op_eq_us_c(UNION(s, t), s)"),
      t1189,
    ),
  )
}

///|
let card_union_absorb_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_UNION_ABSORB_RIGHT",
)

///|
/// `CARD_UNION_ABSORB_RIGHT`
pub fn card_union_absorb_right() -> @kernel.Thm {
  card_union_absorb_right_c.get()
}

///|
/// CARD_ADD2_ABSORB_LT
fn step_126() -> Unit raise {
  let t1204 = @simp.asm_rewrite_tac(
    @list.List([@sets.infinite(), card_le_refl()]),
  )
  let t1203 = @tactics.match_mp_tac(card_add2_absorb_le())
  let t1202 = @simp.asm_rewrite_tac(@list.List([]))
  let t1197 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1198 = @tactics.trans_tac(card_let_trans())(t1197)
  let t1199 = @list.List([
    @meson.asm_meson_tac(@list.List([card_le_finite(), card_add_finite()])),
    t1198,
  ])
  let t1200 = @tactics.thenl(
    @class.asm_cases_tac(@term_syntax.parse_term("FINITE((s : (A) -> Bool))")),
    t1199,
  )
  let t1194 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1195 = @tactics.trans_tac(card_let_trans())(t1194)
  let t1196 = @list.List([
    @meson.asm_meson_tac(@list.List([card_le_finite(), card_add_finite()])),
    t1195,
  ])
  let t1201 = @list.List([
    @tactics.thenl(
      @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (B) -> Bool))")),
      t1196,
    ),
    t1200,
  ])
  let t1192 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1193 = @tactics.disj_cases_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t1192]),
      card_le_total(),
    ),
  )
  let t1191 = @simp.asm_simp_tac(@list.List([card_lt_finite_infinite()]))
  let t1190 = @class.asm_cases_tac(
    @term_syntax.parse_term("FINITE(op_plus_us_c((s : (A) -> Bool), (t : (B) -> Bool)))"),
  )
  let t1205 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1190),
              t1191,
            ),
            t1193,
          ),
          t1201,
        ),
        t1202,
      ),
      t1203,
    ),
    t1204,
  )
  card_add2_absorb_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, INFINITE(u) && op_lt_us_c(s, u) && op_lt_us_c(t, u) → op_lt_us_c(op_plus_us_c(s, t), u)"),
      t1205,
    ),
  )
}

///|
let card_add2_absorb_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_ADD2_ABSORB_LT",
)

///|
/// `CARD_ADD2_ABSORB_LT`
pub fn card_add2_absorb_lt() -> @kernel.Thm {
  card_add2_absorb_lt_c.get()
}

///|
/// CARD_DIFF_ABSORB
fn step_127() -> Unit raise {
  let t1218 = @simp.asm_simp_tac(
    @list.List([union_le_add_c(), card_add2_absorb_lt()]),
  )
  let t1216 = @term_syntax.parse_term("op_plus_us_c(DIFF((s : (A) -> Bool), (t : (A) -> Bool)), t)")
  let t1217 = @tactics.trans_tac(card_let_trans())(t1216)
  let t1215 = @simp.rewrite_tac(@list.List([card_not_le()]))
  let t1212 = @drule.match_mp(card_le_subset())
  let t1214 = @tactics.disch_then(fn(
    x1213 : @kernel.Thm,
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
      x1209 : @kernel.Thm,
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
      let s1210 = @tactics.mp_tac(x1209)
      fn(
        x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1210(x1211)
      }
    })(t1212(x1213))
  })
  let t1208 = @tactics.mp_tac(
    @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (A) -> Bool), UNION(DIFF(s, (t : (A) -> Bool)), t))")),
  )
  let t1207 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1206 = @simp.rewrite_tac(@list.List([@equal.gsym(card_not_lt())]))
  let t1219 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.simp_tac(
                  @list.List([
                    @equal.gsym(card_le_antisym()),
                    card_le_subset(),
                    @sets.subset_diff(),
                  ]),
                ),
                t1206,
              ),
              t1207,
            ),
            t1208,
          ),
          t1214,
        ),
        t1215,
      ),
      t1217,
    ),
    t1218,
  )
  card_diff_absorb_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INFINITE(s) && op_lt_us_c(t, s) → op_eq_us_c(DIFF(s, t), s)"),
      t1219,
    ),
  )
}

///|
let card_diff_absorb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_DIFF_ABSORB",
)

///|
/// `CARD_DIFF_ABSORB`
pub fn card_diff_absorb() -> @kernel.Thm {
  card_diff_absorb_c.get()
}

///|
/// CARD_LT_ADD
fn step_128() -> Unit raise {
  let t1241 = @simp.asm_rewrite_tac(@list.List([card_le_addl()]))
  let t1240 = @term_syntax.parse_term("(t' : (D) -> Bool)")
  let t1242 = @tactics.then_tac(
    @tactics.trans_tac(card_lte_trans())(t1240),
    t1241,
  )
  let t1239 = @simp.asm_rewrite_tac(@list.List([card_le_addr()]))
  let t1238 = @term_syntax.parse_term("(s' : (B) -> Bool)")
  let t1243 = @list.List([
    @tactics.then_tac(@tactics.trans_tac(card_lte_trans())(t1238), t1239),
    t1242,
  ])
  let t1237 = @simp.asm_rewrite_tac(@list.List([@sets.infinite()]))
  let t1244 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(card_add2_absorb_lt()), t1237),
      @tactics.conj_tac,
    ),
    t1243,
  )
  let t1234 = @simp.asm_simp_tac(
    @list.List([card_lt_card(), card_add_finite(), card_add_c()]),
  )
  let t1233 = @term_syntax.parse_term("op_lt_us_c((t : (C) -> Bool), (t' : (D) -> Bool))")
  let t1235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x1230 : @kernel.Term,
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
          let s1231 = @tactics.undisch_tac(x1230)
          fn(
            x1232 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1231(x1232)
          }
        },
        @list.List([@term_syntax.parse_term("op_lt_us_c((s : (A) -> Bool), (s' : (B) -> Bool))"), t1233]),
      ),
      t1234,
    ),
    @int.arith_tac,
  )
  let t1229 = @simp.asm_rewrite_tac(@list.List([]))
  let t1227 = @drule.match_mp(card_lt_imp_le())
  let t1225 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_finite()),
  )
  let t1236 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conj_tac,
        @tactics.first_x_assum(fn(
          x1228 : @kernel.Thm,
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
            x1226 : @kernel.Thm,
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
            @tactics.match_mp_tac(t1225(x1226))
          })(t1227(x1228))
        }),
      ),
      t1229,
    ),
    t1235,
  ])
  let t1224 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE((s : (A) -> Bool)) && FINITE((t : (C) -> Bool))"),
    @tactics.strip_assume_tac,
  )
  let t1222 = @simp.gen_rewrite_rule(
    fn(
      x1221 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1221
    },
    @list.List([card_add_finite_eq()]),
  )
  let t1245 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
          x1223 : @kernel.Thm,
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
          @tactics.strip_assume_tac(t1222(x1223))
        }),
        t1224,
      ),
      t1236,
    ),
    t1244,
  ])
  let t1220 = @class.asm_cases_tac(
    @term_syntax.parse_term("FINITE(op_plus_us_c((s' : (B) -> Bool), (t' : (D) -> Bool)))"),
  )
  let t1246 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1220),
    t1245,
  )
  card_lt_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_lt_us_c(s, s') && op_lt_us_c(t, t') → op_lt_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))"),
      t1246,
    ),
  )
}

///|
let card_lt_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LT_ADD")

///|
/// `CARD_LT_ADD`
pub fn card_lt_add() -> @kernel.Thm {
  card_lt_add_c.get()
}

///|
/// CARD_LE_ADD_LCANCEL
fn step_129() -> Unit raise {
  let t1271 = @simp.asm_rewrite_tac(@list.List([@sets.infinite()]))
  let t1270 = @tactics.match_mp_tac(card_add_absorb_left())
  let t1269 = @tactics.match_mp_tac(card_le_cong())
  let t1268 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1267 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(
      @list.List([card_not_le(), card_lt_imp_le(), card_le_trans()]),
    ),
  ])
  let t1266 = @class.asm_cases_tac(
    @term_syntax.parse_term("op_lt_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool))"),
  )
  let t1264 = @meson.asm_meson_tac(
    @list.List([card_le_finite_infinite(), @sets.infinite()]),
  )
  let t1265 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t1264])
  let t1263 = @class.asm_cases_tac(
    @term_syntax.parse_term("op_lt_eq_us_c((s : (A) -> Bool), (u : (C) -> Bool))"),
  )
  let t1262 = @list.List([
    @meson.asm_meson_tac(
      @list.List([card_le_finite_infinite(), @sets.infinite()]),
    ),
    @tactics.all_tac,
  ])
  let t1261 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (B) -> Bool))"))
  let t1259 = @simp.simp_tac(@list.List([@arith.le_add_lcancel()]))
  let t1258 = @simp.asm_simp_tac(
    @list.List([card_le_card(), card_add_finite_eq(), card_add_c()]),
  )
  let t1257 = @tactics.disch_then(fn(
    x1254 : @kernel.Thm,
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
    let th = x1254
    let t1256 = @tactics.mp_tac(
      @drule.match_mp(
        @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
          card_le_finite(),
        ),
      )(th),
    )
    @tactics.then_tac(@tactics.mp_tac(th), t1256)
  })
  let t1253 = @tactics.disch_then(fn(
    x1252 : @kernel.Thm,
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
      x1249 : @kernel.Thm,
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
      let s1250 = @tactics.mp_tac(x1249)
      fn(
        x1251 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1250(x1251)
      }
    })(@bool.conjunct2(x1252))
  })
  let t1248 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([card_le_finite()])),
  ])
  let t1260 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @class.asm_cases_tac(@term_syntax.parse_term("FINITE((s : (A) -> Bool))")),
              t1248,
            ),
            t1253,
          ),
          t1257,
        ),
        t1258,
      ),
      t1259,
    ),
    @tactics.all_tac,
  ])
  let t1247 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((u : (C) -> Bool))"))
  let t1272 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.then_tac(
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t1247,
                          ),
                          t1260,
                        ),
                        t1261,
                      ),
                      t1262,
                    ),
                    t1263,
                  ),
                  t1265,
                ),
                t1266,
              ),
              t1267,
            ),
            t1268,
          ),
          t1269,
        ),
        @tactics.conj_tac,
      ),
      t1270,
    ),
    t1271,
  )
  card_le_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, (FINITE(s) || op_lt_eq_us_c(s, u)) && op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) → op_lt_eq_us_c(t, u)"),
      t1272,
    ),
  )
}

///|
let card_le_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_ADD_LCANCEL",
)

///|
/// `CARD_LE_ADD_LCANCEL`
pub fn card_le_add_lcancel() -> @kernel.Thm {
  card_le_add_lcancel_c.get()
}

///|
/// CARD_LE_ADD_LCANCEL_EQ
fn step_130() -> Unit raise {
  let t1275 = @simp.asm_rewrite_tac(@list.List([]))
  let t1274 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      card_le_add_lcancel(),
    ),
  )
  let t1273 = @simp.asm_simp_tac(@list.List([card_le_add(), card_le_refl()]))
  let t1276 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.disch_tac,
          ),
          @tactics.eq_tac,
        ),
        t1273,
      ),
      t1274,
    ),
    t1275,
  )
  card_le_add_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, FINITE(s) || op_lt_eq_us_c(s, u) → op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) == op_lt_eq_us_c(t, u)"),
      t1276,
    ),
  )
}

///|
let card_le_add_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_ADD_LCANCEL_EQ",
)

///|
/// `CARD_LE_ADD_LCANCEL_EQ`
pub fn card_le_add_lcancel_eq() -> @kernel.Thm {
  card_le_add_lcancel_eq_c.get()
}

///|
/// CARD_LE_ADD_RCANCEL
fn step_131() -> Unit raise {
  let t1277 = @simp.rewrite_tac(@list.List([card_add_sym()]))
  let t1278 = @tactics.then_tac(@tactics.match_mp_tac(card_le_cong()), t1277)
  let lemma = @tactics.prove(
    @term_syntax.parse_term("op_lt_eq_us_c(op_plus_us_c((s : (_) -> Bool), (u : (_) -> Bool)), op_plus_us_c((t : (_) -> Bool), u)) == op_lt_eq_us_c(op_plus_us_c(u, s), op_plus_us_c(u, t))"),
    t1278,
  )
  let t1279 = @simp.rewrite_tac(@list.List([card_le_add_lcancel()]))
  let t1280 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([lemma])),
    t1279,
  )
  card_le_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, (FINITE(u) || op_lt_eq_us_c(u, t)) && op_lt_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) → op_lt_eq_us_c(s, t)"),
      t1280,
    ),
  )
}

///|
let card_le_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_ADD_RCANCEL",
)

///|
/// `CARD_LE_ADD_RCANCEL`
pub fn card_le_add_rcancel() -> @kernel.Thm {
  card_le_add_rcancel_c.get()
}

///|
/// CARD_LE_ADD_RCANCEL_EQ
fn step_132() -> Unit raise {
  let t1283 = @simp.asm_rewrite_tac(@list.List([]))
  let t1282 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      card_le_add_rcancel(),
    ),
  )
  let t1281 = @simp.asm_simp_tac(@list.List([card_le_add(), card_le_refl()]))
  let t1284 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.disch_tac,
          ),
          @tactics.eq_tac,
        ),
        t1281,
      ),
      t1282,
    ),
    t1283,
  )
  card_le_add_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, FINITE(u) || op_lt_eq_us_c(u, t) → op_lt_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) == op_lt_eq_us_c(s, t)"),
      t1284,
    ),
  )
}

///|
let card_le_add_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_ADD_RCANCEL_EQ",
)

///|
/// `CARD_LE_ADD_RCANCEL_EQ`
pub fn card_le_add_rcancel_eq() -> @kernel.Thm {
  card_le_add_rcancel_eq_c.get()
}

///|
/// CARD_EQ_ADD_LCANCEL
fn step_133() -> Unit raise {
  let t1295 = @meson.asm_meson_tac(@list.List([]))
  let t1294 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      card_le_add_lcancel(),
    ),
  )
  let t1293 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1292 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t1291 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1285 : @kernel.Thm,
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
        let s1286 = @tactics.assume_tac(x1285)
        fn(
          x1287 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1286(x1287)
        }
      },
      fn(
        x1288 : @kernel.Thm,
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
        let s1289 = @tactics.mp_tac(x1288)
        fn(
          x1290 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1289(x1290)
        }
      },
    ),
  )
  let t1296 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1291),
            t1292,
          ),
          t1293,
        ),
        @tactics.conj_tac,
      ),
      t1294,
    ),
    t1295,
  )
  card_eq_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, (FINITE(s) || op_lt_eq_us_c(s, t) && op_lt_eq_us_c(s, u)) && op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) → op_eq_us_c(t, u)"),
      t1296,
    ),
  )
}

///|
let card_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_ADD_LCANCEL",
)

///|
/// `CARD_EQ_ADD_LCANCEL`
pub fn card_eq_add_lcancel() -> @kernel.Thm {
  card_eq_add_lcancel_c.get()
}

///|
/// CARD_EQ_ADD_LCANCEL_EQ
fn step_134() -> Unit raise {
  let t1299 = @meson.asm_meson_tac(@list.List([]))
  let t1298 = @tactics.match_mp_tac(card_le_add_lcancel_eq())
  let t1297 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t1300 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.disch_tac,
          ),
          t1297,
        ),
        @tactics.binop_tac,
      ),
      t1298,
    ),
    t1299,
  )
  card_eq_add_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, FINITE(s) || op_lt_eq_us_c(s, t) && op_lt_eq_us_c(s, u) → op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) == op_eq_us_c(t, u)"),
      t1300,
    ),
  )
}

///|
let card_eq_add_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_ADD_LCANCEL_EQ",
)

///|
/// `CARD_EQ_ADD_LCANCEL_EQ`
pub fn card_eq_add_lcancel_eq() -> @kernel.Thm {
  card_eq_add_lcancel_eq_c.get()
}

///|
/// CARD_EQ_ADD_RCANCEL
fn step_135() -> Unit raise {
  let t1311 = @meson.asm_meson_tac(@list.List([]))
  let t1310 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      card_le_add_rcancel(),
    ),
  )
  let t1309 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1308 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t1307 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1301 : @kernel.Thm,
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
        let s1302 = @tactics.assume_tac(x1301)
        fn(
          x1303 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1302(x1303)
        }
      },
      fn(
        x1304 : @kernel.Thm,
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
        let s1305 = @tactics.mp_tac(x1304)
        fn(
          x1306 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1305(x1306)
        }
      },
    ),
  )
  let t1312 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1307),
            t1308,
          ),
          t1309,
        ),
        @tactics.conj_tac,
      ),
      t1310,
    ),
    t1311,
  )
  card_eq_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, (FINITE(u) || op_lt_eq_us_c(u, s) && op_lt_eq_us_c(u, t)) && op_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) → op_eq_us_c(s, t)"),
      t1312,
    ),
  )
}

///|
let card_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_ADD_RCANCEL",
)

///|
/// `CARD_EQ_ADD_RCANCEL`
pub fn card_eq_add_rcancel() -> @kernel.Thm {
  card_eq_add_rcancel_c.get()
}

///|
/// CARD_EQ_ADD_RCANCEL_EQ
fn step_136() -> Unit raise {
  let t1315 = @meson.asm_meson_tac(@list.List([]))
  let t1314 = @tactics.match_mp_tac(card_le_add_rcancel_eq())
  let t1313 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t1316 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.disch_tac,
          ),
          t1313,
        ),
        @tactics.binop_tac,
      ),
      t1314,
    ),
    t1315,
  )
  card_eq_add_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, FINITE(u) || op_lt_eq_us_c(u, s) && op_lt_eq_us_c(u, t) → op_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) == op_eq_us_c(s, t)"),
      t1316,
    ),
  )
}

///|
let card_eq_add_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_ADD_RCANCEL_EQ",
)

///|
/// `CARD_EQ_ADD_RCANCEL_EQ`
pub fn card_eq_add_rcancel_eq() -> @kernel.Thm {
  card_eq_add_rcancel_eq_c.get()
}

///|
/// CARD_LE_UNIONS2
fn step_137() -> Unit raise {
  let t1338 = @meson.meson_tac(@list.List([]))
  let t1337 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_unions(),
      @sets.in_image(),
      mul_c(),
      @sets.in_elim_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t1336 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1333 : @kernel.Thm,
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
      let s1334 = @tactics.mp_tac(x1333)
      fn(
        x1335 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1334(x1335)
      }
    }),
  )
  let t1332 = @tactics.match_mp_tac(card_le_subset())
  let t1331 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t1329 = @term_syntax.parse_term("IMAGE(fn { (x, y) => (g : ((A) -> Bool, C) -> A)((f : (B, A) -> Bool)(x), y) }, op_star_us_c((k : (B) -> Bool), (l : (C) -> Bool)))")
  let t1330 = @tactics.trans_tac(card_le_trans())(t1329)
  let t1327 = @term_syntax.parse_term("(g : ((A) -> Bool, C) -> A)")
  let t1328 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(f : (B, A) -> Bool)"), t1327]),
  )
  let t1326 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_and_exists_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1325 = @simp.rewrite_tac(
    @list.List([
      @class.right_imp_exists_thm(),
      @class.skolem_thm(),
      @theorems.left_and_exists_thm(),
    ]),
  )
  let t1324 = @simp.gen_rewrite_tac(
    fn(
      x1323 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1317 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1318 = @equal.land_conv(x1317)
        fn(x1319 : @kernel.Term) -> @kernel.Thm raise { s1318(x1319) }
      })(
        (fn(
          x1320 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1321 = @equal.once_depth_conv(x1320)
          fn(x1322 : @kernel.Term) -> @kernel.Thm raise { s1321(x1322) }
        })(x1323),
      )
    },
    @list.List([le_c_image_subset()]),
  )
  let t1339 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t1324,
                      ),
                      t1325,
                    ),
                    t1326,
                  ),
                  t1328,
                ),
                @tactics.strip_tac,
              ),
              t1330,
            ),
            t1331,
          ),
          t1332,
        ),
        t1336,
      ),
      t1337,
    ),
    t1338,
  )
  card_le_unions2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : ((A) -> Bool) -> Bool, ∀ k : (B) -> Bool, ∀ l : (C) -> Bool, op_lt_eq_us_c(u, k) && (∀ s : (A) -> Bool, IN(s, u) → op_lt_eq_us_c(s, l)) → op_lt_eq_us_c(UNIONS(u), op_star_us_c(k, l))"),
      t1339,
    ),
  )
}

///|
let card_le_unions2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_UNIONS2",
)

///|
/// `CARD_LE_UNIONS2`
pub fn card_le_unions2() -> @kernel.Thm {
  card_le_unions2_c.get()
}

///|
/// CARD_LE_UNIONS
fn step_138() -> Unit raise {
  let t1352 = @simp.asm_rewrite_tac(@list.List([]))
  let t1351 = @tactics.match_mp_tac(card_square_infinite())
  let t1350 = @tactics.match_mp_tac(card_eq_imp_le())
  let t1349 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t1346 = @drule.match_mp(card_le_unions2())
  let t1348 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1340 : @kernel.Thm,
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
        let s1341 = @tactics.assume_tac(x1340)
        fn(
          x1342 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1341(x1342)
        }
      },
      fn(
        x1347 : @kernel.Thm,
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
          x1343 : @kernel.Thm,
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
          let s1344 = @tactics.mp_tac(x1343)
          fn(
            x1345 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1344(x1345)
          }
        })(t1346(x1347))
      },
    ),
  )
  let t1353 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1348),
          t1349,
        ),
        t1350,
      ),
      t1351,
    ),
    t1352,
  )
  card_le_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (B) -> Bool, ∀ u : ((A) -> Bool) -> Bool, INFINITE(k) && op_lt_eq_us_c(u, k) && (∀ s : (A) -> Bool, IN(s, u) → op_lt_eq_us_c(s, k)) → op_lt_eq_us_c(UNIONS(u), k)"),
      t1353,
    ),
  )
}

///|
let card_le_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_UNIONS")

///|
/// `CARD_LE_UNIONS`
pub fn card_le_unions() -> @kernel.Thm {
  card_le_unions_c.get()
}

///|
/// CARD_LE_DISJOINT_UNIONS
fn step_139() -> Unit raise {
  let t1375 = @meson.asm_meson_tac(@list.List([]))
  let t1374 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      in_card_mul(),
      @sets.in_unions(),
      @pair.pair_eq(),
    ]),
  )
  let t1373 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (u, y) => (f : ((A) -> Bool, B) -> A)(u, y) }"),
  )
  let t1372 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : ((A) -> Bool, B) -> A)"))
  let t1371 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1370 = @simp.gen_rewrite_tac(
    fn(
      x1369 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1363 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1364 = @equal.land_conv(x1363)
        fn(x1365 : @kernel.Term) -> @kernel.Thm raise { s1364(x1365) }
      })(
        (fn(
          x1366 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1367 = @equal.once_depth_conv(x1366)
          fn(x1368 : @kernel.Term) -> @kernel.Thm raise { s1367(x1368) }
        })(x1369),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1362 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t1361 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1355 : @kernel.Thm,
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
        let s1356 = @tactics.assume_tac(x1355)
        fn(
          x1357 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1356(x1357)
        }
      },
      fn(
        x1358 : @kernel.Thm,
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
        let s1359 = @tactics.mp_tac(x1358)
        fn(
          x1360 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1359(x1360)
        }
      },
    ),
  )
  let t1354 = @simp.rewrite_tac(
    @list.List([
      @sets.pairwise(),
      @sets.set_rule(
        @term_syntax.parse_term("DISJOINT((s : (_) -> Bool), (t : (_) -> Bool)) == (∀ x : _, !(IN(x, s) && IN(x, t)))"),
      ),
    ]),
  )
  let t1376 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t1354,
                    ),
                    t1361,
                  ),
                  t1362,
                ),
                t1370,
              ),
              t1371,
            ),
            t1372,
          ),
          @tactics.disch_tac,
        ),
        t1373,
      ),
      t1374,
    ),
    t1375,
  )
  card_le_disjoint_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, ∀ t : (B) -> Bool, pairwise(DISJOINT, s) && (∀ u : (A) -> Bool, IN(u, s) → op_lt_eq_us_c(t, u)) → op_lt_eq_us_c(op_star_us_c(s, t), UNIONS(s))"),
      t1376,
    ),
  )
}

///|
let card_le_disjoint_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_DISJOINT_UNIONS",
)

///|
/// `CARD_LE_DISJOINT_UNIONS`
pub fn card_le_disjoint_unions() -> @kernel.Thm {
  card_le_disjoint_unions_c.get()
}

///|
/// CARD_EQ_DISJOINT_UNIONS
fn step_140() -> Unit raise {
  let t1380 = @simp.asm_simp_tac(@list.List([card_le_refl()]))
  let t1379 = @tactics.match_mp_tac(card_le_unions2())
  let t1378 = @simp.asm_simp_tac(@list.List([card_le_disjoint_unions()]))
  let t1377 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1381 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())])),
          t1377,
        ),
        t1378,
      ),
      t1379,
    ),
    t1380,
  )
  card_eq_disjoint_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, ∀ t : (B) -> Bool, pairwise(DISJOINT, s) && (∀ u : (A) -> Bool, IN(u, s) → op_eq_us_c(u, t)) → op_eq_us_c(UNIONS(s), op_star_us_c(s, t))"),
      t1381,
    ),
  )
}

///|
let card_eq_disjoint_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_DISJOINT_UNIONS",
)

///|
/// `CARD_EQ_DISJOINT_UNIONS`
pub fn card_eq_disjoint_unions() -> @kernel.Thm {
  card_eq_disjoint_unions_c.get()
}

///|
/// CARD_EQ_IMAGE_MUL_FIBRES
fn step_141() -> Unit raise {
  let t1417 = @meson.asm_meson_tac(@list.List([]))
  let t1416 = @simp.asm_simp_tac(@list.List([]))
  let t1415 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.forall_in_image()])),
  )
  let t1414 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @sets.forall_in_image(),
    ]),
  )
  let t1413 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@theorems.conj_assoc()),
      @theorems.right_exists_and_thm(),
      @sets.exists_in_image(),
    ]),
  )
  let t1412 = @simp.rewrite_tac(
    @list.List([in_card_mul(), @pair.exists_pair_thm(), @pair.pair_eq()]),
  )
  let t1411 = @simp.rewrite_tac(
    @list.List([@theorems.exists_unique_thm(), @pair.forall_pair_thm()]),
  )
  let t1410 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((B, C)) -> A) => ∀ y : B, ∀ z : C, GEQ(f((y, z)), (k : (A, C) -> A)((h : (B) -> A)(y), z)))"),
  )
  let t1407 = @term_syntax.parse_term("(h : (B) -> A)")
  let t1409 = @tactics.disch_then((x1408 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1407, x1408)
  })
  let t1405 = @simp.rewrite_tac(
    @list.List([@sets.surjective_on_right_inverse()]),
  )
  let t1406 = @list.List([@sets.set_tac(@list.List([])), t1405])
  let t1404 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : B, IN(y, IMAGE((f : (A) -> B), (s : (A) -> Bool))) → (∃ x : A, IN(x, s) && f(x) == y)"),
    fn(
      x1401 : @kernel.Thm,
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
      let s1402 = @tactics.mp_tac(x1401)
      fn(
        x1403 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1402(x1403)
      }
    },
  )
  let t1400 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (A, C) -> A)"))
  let t1399 = @simp.rewrite_tac(
    @list.List([
      @class.skolem_thm(),
      @theorems.left_imp_exists_thm(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1398 = @simp.gen_rewrite_tac(
    fn(
      x1397 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1391 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1392 = @equal.land_conv(x1391)
        fn(x1393 : @kernel.Term) -> @kernel.Thm raise { s1392(x1393) }
      })(
        (fn(
          x1394 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1395 = @equal.once_depth_conv(x1394)
          fn(x1396 : @kernel.Term) -> @kernel.Thm raise { s1395(x1396) }
        })(x1397),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1390 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t1389 = @simp.gen_rewrite_tac(
    fn(
      x1388 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1382 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1383 = @equal.land_conv(x1382)
        fn(x1384 : @kernel.Term) -> @kernel.Thm raise { s1383(x1384) }
      })(
        (fn(
          x1385 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1386 = @equal.once_depth_conv(x1385)
          fn(x1387 : @kernel.Term) -> @kernel.Thm raise { s1386(x1387) }
        })(x1388),
      )
    },
    @list.List([card_eq_sym()]),
  )
  let t1418 = @tactics.then_tac(
    @tactics.then_tac(
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
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.repeat_tac(@tactics.gen_tac),
                                    t1389,
                                  ),
                                  t1390,
                                ),
                                t1398,
                              ),
                              t1399,
                            ),
                            t1400,
                          ),
                          @tactics.disch_tac,
                        ),
                        t1404,
                      ),
                      t1406,
                    ),
                    t1409,
                  ),
                  t1410,
                ),
                t1411,
              ),
              t1412,
            ),
            t1413,
          ),
          t1414,
        ),
        t1415,
      ),
      t1416,
    ),
    t1417,
  )
  card_eq_image_mul_fibres_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (C) -> Bool, (∀ x : A, IN(x, s) → op_eq_us_c({(z : A) | IN(z, s) && f(z) == f(x)}, t)) → op_eq_us_c(op_star_us_c(IMAGE(f, s), t), s)"),
      t1418,
    ),
  )
}

///|
let card_eq_image_mul_fibres_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_IMAGE_MUL_FIBRES",
)

///|
/// `CARD_EQ_IMAGE_MUL_FIBRES`
pub fn card_eq_image_mul_fibres() -> @kernel.Thm {
  card_eq_image_mul_fibres_c.get()
}

///|
/// CARD_DIFF_CONG
fn step_142() -> Unit raise {
  let t1435 = @meson.asm_meson_tac(
    @list.List([card_eq_card(), @sets.finite_subset()]),
  )
  let t1434 = @simp.asm_simp_tac(
    @list.List([card_eq_card(), @sets.finite_diff(), @sets.card_diff()]),
  )
  let t1433 = @list.List([
    @meson.asm_meson_tac(@list.List([card_finite_cong()])),
    @tactics.all_tac,
  ])
  let t1432 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((t : (B) -> Bool))"), fn(
    x1429 : @kernel.Thm,
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
    let s1430 = @tactics.assume_tac(x1429)
    fn(
      x1431 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1430(x1431)
    }
  })
  let t1436 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.rule_assum_tac(
            @simp.rewrite_rule(@list.List([@sets.infinite()])),
          ),
          t1432,
        ),
        t1433,
      ),
      t1434,
    ),
    t1435,
  )
  let t1428 = @meson.asm_meson_tac(
    @list.List([card_lt_cong(), card_infinite_cong()]),
  )
  let t1427 = @tactics.match_mp_tac(card_diff_absorb())
  let t1426 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t1425 = @simp.asm_rewrite_tac(@list.List([]))
  let t1423 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1424 = @tactics.trans_tac(card_eq_trans())(t1423)
  let t1422 = @simp.asm_simp_tac(@list.List([card_diff_absorb()]))
  let t1421 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1437 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.trans_tac(card_eq_trans())(t1421),
                t1422,
              ),
              t1424,
            ),
            t1425,
          ),
          t1426,
        ),
        t1427,
      ),
      t1428,
    ),
    t1436,
  ])
  let t1420 = @simp.asm_rewrite_tac(@list.List([]))
  let t1419 = @class.asm_cases_tac(@term_syntax.parse_term("INFINITE((s : (A) -> Bool))"))
  let t1438 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1419),
        t1420,
      ),
      @tactics.strip_tac,
    ),
    t1437,
  )
  card_diff_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) && op_eq_us_c(s, t) && op_eq_us_c(s', t') && (INFINITE(s) → op_lt_us_c(s', s)) → op_eq_us_c(DIFF(s, s'), DIFF(t, t'))"),
      t1438,
    ),
  )
}

///|
let card_diff_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_DIFF_CONG")

///|
/// `CARD_DIFF_CONG`
pub fn card_diff_cong() -> @kernel.Thm {
  card_diff_cong_c.get()
}

///|
/// EQ_C_BIJECTIONS_DISJOINT
fn step_143() -> Unit raise {
  let t1453 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1452 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => if IN(y, (t : (B) -> Bool)) { (g : (B) -> A)(y) } else { (g' : (B) -> A)(y) }"),
  )
  let t1451 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => if IN(x, (s : (A) -> Bool)) { (f : (A) -> B)(x) } else { (f' : (A) -> B)(x) }"),
  )
  let t1447 = @term_syntax.parse_term("(g' : (B) -> A)")
  let t1448 = @term_syntax.parse_term("(f' : (A) -> B)")
  let t1449 = @term_syntax.parse_term("(g : (B) -> A)")
  let t1450 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1449, t1448, t1447]),
  )
  let t1444 = @meson.meson_tac(@list.List([]))
  let t1443 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_exists()),
      @tactics.gen_tac,
    ),
  )
  let t1445 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x1441 : @kernel.Thm,
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
        let th = x1441
        @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th))
      }),
      t1443,
    ),
    t1444,
  )
  let t1440 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_and_exists_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1446 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()])),
      t1440,
    ),
    t1445,
  ])
  let t1439 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t1454 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1439,
                ),
                @tactics.eq_tac,
              ),
              t1446,
            ),
            t1450,
          ),
          @tactics.strip_tac,
        ),
        t1451,
      ),
      t1452,
    ),
    t1453,
  )
  eq_c_bijections_disjoint_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (B) -> Bool, DISJOINT(s, s') && DISJOINT(t, t') → (op_eq_us_c(s, t) && op_eq_us_c(s', t')) == (∃ f : (A) -> B, ∃ g : (B) -> A, (∀ x : A, IN(x, s) → IN(f(x), t) && g(f(x)) == x) && (∀ y : B, IN(y, t) → IN(g(y), s) && f(g(y)) == y) && (∀ x : A, IN(x, s') → IN(f(x), t') && g(f(x)) == x) && (∀ y : B, IN(y, t') → IN(g(y), s') && f(g(y)) == y))"),
      t1454,
    ),
  )
}

///|
let eq_c_bijections_disjoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_BIJECTIONS_DISJOINT",
)

///|
/// `EQ_C_BIJECTIONS_DISJOINT`
pub fn eq_c_bijections_disjoint() -> @kernel.Thm {
  eq_c_bijections_disjoint_c.get()
}

///|
/// EQ_C_BIJECTIONS_SUBSETS
fn step_144() -> Unit raise {
  let t1471 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1470 = @tactics.repeat_tac(
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t1469 = @tactics.disch_then(fn(
    x1466 : @kernel.Thm,
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
    let s1467 = @tactics.subst1_tac(x1466)
    fn(
      x1468 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1467(x1468)
    }
  })
  let t1465 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("DISJOINT((t : (_) -> Bool), DIFF((s : (_) -> Bool), t))"))]),
  )
  let t1459 = @drule.part_match(
    fn(x1458 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1458))
    },
    eq_c_bijections_disjoint(),
  )
  let t1472 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(
            x1464 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              x1463 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x1461 : @kernel.Term,
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
                  x1460 : @kernel.Term,
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
                    x1455 : @kernel.Thm,
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
                    let s1456 = @tactics.mp_tac(x1455)
                    fn(
                      x1457 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    ) raise {
                      s1456(x1457)
                    }
                  })(t1459(x1460))
                })(@equal.lhand(x1461))
              })(
                (fn(
                  x1462 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x1462.1
                })(x1463),
              )
            })(x1464)(x1464)
          }),
          t1465,
        ),
        t1469,
      ),
      t1470,
    ),
    t1471,
  )
  eq_c_bijections_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) → (op_eq_us_c(s', t') && op_eq_us_c(DIFF(s, s'), DIFF(t, t'))) == (∃ f : (A) -> B, ∃ g : (B) -> A, (∀ x : A, IN(x, s) → IN(f(x), t) && g(f(x)) == x) && (∀ y : B, IN(y, t) → IN(g(y), s) && f(g(y)) == y) && IMAGE(f, s') == t' && IMAGE(g, t') == s')"),
      t1472,
    ),
  )
}

///|
let eq_c_bijections_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_BIJECTIONS_SUBSETS",
)

///|
/// `EQ_C_BIJECTIONS_SUBSETS`
pub fn eq_c_bijections_subsets() -> @kernel.Thm {
  eq_c_bijections_subsets_c.get()
}

///|
/// EQ_C_BIJECTIONS_SUBSETS_LT
fn step_145() -> Unit raise {
  let t1479 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1478 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_exists()),
      @tactics.gen_tac,
    ),
  )
  let t1477 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t1480 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x1475 : @kernel.Thm,
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
          let th = x1475
          @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th))
        }),
        t1477,
      ),
      t1478,
    ),
    t1479,
  )
  let t1474 = @simp.asm_rewrite_tac(@list.List([]))
  let t1473 = @tactics.match_mp_tac(card_diff_cong())
  let t1481 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @simp.asm_simp_tac(
            @list.List([@equal.gsym(eq_c_bijections_subsets())]),
          ),
        ),
        t1473,
      ),
      t1474,
    ),
    t1480,
  ])
  let t1482 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac),
    t1481,
  )
  eq_c_bijections_subsets_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) && (INFINITE(s) → op_lt_us_c(s', s)) → (op_eq_us_c(s, t) && op_eq_us_c(s', t')) == (∃ f : (A) -> B, ∃ g : (B) -> A, (∀ x : A, IN(x, s) → IN(f(x), t) && g(f(x)) == x) && (∀ y : B, IN(y, t) → IN(g(y), s) && f(g(y)) == y) && IMAGE(f, s') == t' && IMAGE(g, t') == s')"),
      t1482,
    ),
  )
}

///|
let eq_c_bijections_subsets_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_BIJECTIONS_SUBSETS_LT",
)

///|
/// `EQ_C_BIJECTIONS_SUBSETS_LT`
pub fn eq_c_bijections_subsets_lt() -> @kernel.Thm {
  eq_c_bijections_subsets_lt_c.get()
}

///|
/// EQ_C_BIJECTIONS_EXTEND
fn step_146() -> Unit raise {
  let t1495 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1494 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => if IN(y, (t : (B) -> Bool)) { (g : (B) -> A)(y) } else { (g' : (B) -> A)(y) }"),
  )
  let t1493 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => if IN(x, (s : (A) -> Bool)) { (f : (A) -> B)(x) } else { (f' : (A) -> B)(x) }"),
  )
  let t1491 = @term_syntax.parse_term("(g' : (B) -> A)")
  let t1492 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(f' : (A) -> B)"), t1491]),
  )
  let t1490 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1487 = @simp.gen_rewrite_rule(
    fn(
      x1486 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1486
    },
    @list.List([eq_c_bijections()]),
  )
  let t1489 = @tactics.first_x_assum(fn(
    x1488 : @kernel.Thm,
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
      x1483 : @kernel.Thm,
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
      let s1484 = @tactics.mp_tac(x1483)
      fn(
        x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1484(x1485)
      }
    })(t1487(x1488))
  })
  let t1496 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1489),
              t1490,
            ),
            t1492,
          ),
          @tactics.strip_tac,
        ),
        t1493,
      ),
      t1494,
    ),
    t1495,
  )
  eq_c_bijections_extend_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> A, ∀ s : (A) -> Bool, ∀ s' : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (B) -> Bool, SUBSET(s, s') && SUBSET(t, t') && op_eq_us_c(DIFF(s', s), DIFF(t', t)) && (∀ x : A, IN(x, s) → IN(f(x), t) && g(f(x)) == x) && (∀ y : B, IN(y, t) → IN(g(y), s) && f(g(y)) == y) → (∃ f' : (A) -> B, ∃ g' : (B) -> A, (∀ x : A, IN(x, s') → IN(f'(x), t') && g'(f'(x)) == x) && (∀ y : B, IN(y, t') → IN(g'(y), s') && f'(g'(y)) == y) && (∀ x : A, IN(x, s) → f'(x) == f(x)) && (∀ y : B, IN(y, t) → g'(y) == g(y)))"),
      t1496,
    ),
  )
}

///|
let eq_c_bijections_extend_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_BIJECTIONS_EXTEND",
)

///|
/// `EQ_C_BIJECTIONS_EXTEND`
pub fn eq_c_bijections_extend() -> @kernel.Thm {
  eq_c_bijections_extend_c.get()
}

///|
/// EQ_C_INVOLUTION
fn step_147() -> Unit raise {
  let t1499 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1498 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> A)")),
  )
  let t1497 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t1500 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1497),
      t1498,
    ),
    t1499,
  )
  eq_c_involution_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> A, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, (∀ x : A, IN(x, s) → IN(f(x), t)) && (∀ x : A, IN(x, t) → IN(f(x), s)) && (∀ x : A, IN(x, s) || IN(x, t) → f(f(x)) == x) → op_eq_us_c(s, t)"),
      t1500,
    ),
  )
}

///|
let eq_c_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_C_INVOLUTION",
)

///|
/// `EQ_C_INVOLUTION`
pub fn eq_c_involution() -> @kernel.Thm {
  eq_c_involution_c.get()
}

///|
/// CARD_MUL_LT_LEMMA
fn step_148() -> Unit raise {
  let t1511 = @meson.asm_meson_tac(
    @list.List([@sets.infinite(), card_mul_absorb_le(), card_let_trans()]),
  )
  let t1510 = @meson.asm_meson_tac(
    @list.List([card_le_finite(), card_mul_finite()]),
  )
  let t1509 = @simp.rewrite_tac(@list.List([card_not_lt(), @sets.infinite()]))
  let t1508 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t1512 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(
            @tactics.disch_then(
              @tactics.conjuncts_then2(
                fn(
                  x1502 : @kernel.Thm,
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
                  let s1503 = @tactics.assume_tac(x1502)
                  fn(
                    x1504 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s1503(x1504)
                  }
                },
                fn(
                  x1505 : @kernel.Thm,
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
                  let s1506 = @tactics.mp_tac(x1505)
                  fn(
                    x1507 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s1506(x1507)
                  }
                },
              ),
            ),
          ),
          t1508,
        ),
        t1509,
      ),
      t1510,
    ),
    t1511,
  ])
  let t1501 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (B) -> Bool))"))
  let t1513 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1501),
    t1512,
  )
  card_mul_lt_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (B) -> Bool, ∀ u : (_) -> Bool, op_lt_eq_us_c(s, t) && op_lt_us_c(t, u) && INFINITE(u) → op_lt_us_c(op_star_us_c(s, t), u)"),
      t1513,
    ),
  )
}

///|
let card_mul_lt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_LT_LEMMA",
)

///|
/// `CARD_MUL_LT_LEMMA`
pub fn card_mul_lt_lemma() -> @kernel.Thm {
  card_mul_lt_lemma_c.get()
}

///|
/// CARD_MUL_LT_INFINITE
fn step_149() -> Unit raise {
  let t1517 = @meson.asm_meson_tac(
    @list.List([card_eq_imp_le(), card_mul_sym(), card_mul_lt_lemma()]),
  )
  let t1516 = @term_syntax.parse_term("op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool))")
  let t1518 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      @tactics.trans_tac(card_let_trans())(t1516),
    ),
    t1517,
  )
  let t1519 = @list.List([
    @meson.asm_meson_tac(@list.List([card_mul_sym(), card_mul_lt_lemma()])),
    t1518,
  ])
  let t1514 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1515 = @tactics.disj_cases_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t1514]),
      card_le_total(),
    ),
  )
  let t1520 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1515),
    t1519,
  )
  card_mul_lt_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (_) -> Bool, op_lt_us_c(s, u) && op_lt_us_c(t, u) && INFINITE(u) → op_lt_us_c(op_star_us_c(s, t), u)"),
      t1520,
    ),
  )
}

///|
let card_mul_lt_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_MUL_LT_INFINITE",
)

///|
/// `CARD_MUL_LT_INFINITE`
pub fn card_mul_lt_infinite() -> @kernel.Thm {
  card_mul_lt_infinite_c.get()
}

///|
/// CANTOR_THM
fn step_150() -> Unit raise {
  let t1534 = @meson.meson_tac(@list.List([]))
  let t1533 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_(), @class.fun_eq_thm()]),
  )
  let t1529 = @term_syntax.parse_term("(x : A) => (s : (A) -> Bool)(x) && !(g : (A, A) -> Bool)(x, x)")
  let t1532 = @tactics.disch_then(fn(
    x1531 : @kernel.Thm,
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
      x1526 : @kernel.Thm,
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
      let s1527 = @tactics.mp_tac(x1526)
      fn(
        x1528 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1527(x1528)
      }
    })(((x1530 : @kernel.Thm) => @bool.spec(t1529, x1530))(x1531))
  })
  let t1525 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (A, A) -> Bool)"))
  let t1524 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1535 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @sets.le_c_v1(),
                @sets.in_elim_thm(),
                @sets.surjective_right_inverse(),
              ]),
            ),
            t1524,
          ),
          t1525,
        ),
        t1532,
      ),
      t1533,
    ),
    t1534,
  )
  let t1523 = @meson.meson_tac(@list.List([]))
  let t1522 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @sets.in_elim_thm(),
      @sets.subset(),
      @sets.in_(),
    ]),
  )
  let t1521 = @tactics.exists_tac(@term_syntax.parse_term("(op_eq : (A, A) -> Bool)"))
  let t1536 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.le_c()])), t1521),
        t1522,
      ),
      t1523,
    ),
    t1535,
  ])
  let t1537 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@sets.lt_c()])),
      ),
      @tactics.conj_tac,
    ),
    t1536,
  )
  cantor_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, op_lt_us_c(s, {(t : (A) -> Bool) | SUBSET(t, s)})"),
      t1537,
    ),
  )
}

///|
let cantor_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANTOR_THM")

///|
/// `CANTOR_THM`
pub fn cantor_thm() -> @kernel.Thm {
  cantor_thm_c.get()
}

///|
/// CANTOR_THM_UNIV
fn step_151() -> Unit raise {
  let t1539 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.subset(),
      @sets.in_univ(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1538 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1540 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispec(@term_syntax.parse_term("(UNIV : (A) -> Bool)"), cantor_thm()),
        ),
        t1538,
      ),
      @tactics.ap_term_tac,
    ),
    t1539,
  )
  cantor_thm_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(op_lt_us_c : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : ((A) -> Bool) -> Bool))"),
      t1540,
    ),
  )
}

///|
let cantor_thm_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CANTOR_THM_UNIV",
)

///|
/// `CANTOR_THM_UNIV`
pub fn cantor_thm_univ() -> @kernel.Thm {
  cantor_thm_univ_c.get()
}

///|
/// NUM_COUNTABLE
fn step_152() -> Unit raise {
  let t1541 = @simp.rewrite_tac(
    @list.List([@sets.countable(), @sets.ge_c(), card_le_refl()]),
  )
  num_countable_c.set(
    @tactics.prove(@term_syntax.parse_term("(COUNTABLE : ((Num) -> Bool) -> Bool)((UNIV : (Num) -> Bool))"), t1541),
  )
}

///|
let num_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_COUNTABLE")

///|
/// `NUM_COUNTABLE`
pub fn num_countable() -> @kernel.Thm {
  num_countable_c.get()
}

///|
/// COUNTABLE_ALT
fn step_153() -> Unit raise {
  let t1542 = @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()]))
  countable_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, (COUNTABLE : ((_) -> Bool) -> Bool)(s) == (op_lt_eq_us_c : ((_) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool))"),
      t1542,
    ),
  )
}

///|
let countable_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_ALT")

///|
/// `COUNTABLE_ALT`
pub fn countable_alt() -> @kernel.Thm {
  countable_alt_c.get()
}

///|
/// COUNTABLE_CASES
fn step_154() -> Unit raise {
  let t1543 = @simp.rewrite_tac(
    @list.List([countable_alt(), finite_card_lt(), card_le_lt()]),
  )
  countable_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, (COUNTABLE : ((_) -> Bool) -> Bool)(s) == ((FINITE : ((_) -> Bool) -> Bool)(s) || (op_eq_us_c : ((_) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool)))"),
      t1543,
    ),
  )
}

///|
let countable_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CASES",
)

///|
/// `COUNTABLE_CASES`
pub fn countable_cases() -> @kernel.Thm {
  countable_cases_c.get()
}

///|
/// CARD_LE_COUNTABLE
fn step_155() -> Unit raise {
  let t1547 = @simp.asm_rewrite_tac(@list.List([]))
  let t1545 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1546 = @tactics.trans_tac(card_le_trans())(t1545)
  let t1544 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1548 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
        t1544,
      ),
      t1546,
    ),
    t1547,
  )
  card_le_countable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(t) && op_lt_eq_us_c(s, t) → COUNTABLE(s)"),
      t1548,
    ),
  )
}

///|
let card_le_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_COUNTABLE",
)

///|
/// `CARD_LE_COUNTABLE`
pub fn card_le_countable() -> @kernel.Thm {
  card_le_countable_c.get()
}

///|
/// CARD_EQ_COUNTABLE
fn step_156() -> Unit raise {
  let t1549 = @meson.meson_tac(@list.List([card_le_countable()]))
  let t1550 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())])),
    t1549,
  )
  card_eq_countable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(t) && op_eq_us_c(s, t) → COUNTABLE(s)"),
      t1550,
    ),
  )
}

///|
let card_eq_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_COUNTABLE",
)

///|
/// `CARD_EQ_COUNTABLE`
pub fn card_eq_countable() -> @kernel.Thm {
  card_eq_countable_c.get()
}

///|
/// CARD_COUNTABLE_CONG
fn step_157() -> Unit raise {
  let t1551 = @meson.meson_tac(@list.List([card_le_countable()]))
  let t1552 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())])),
    t1551,
  )
  card_countable_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, op_eq_us_c(s, t) → COUNTABLE(s) == COUNTABLE(t)"),
      t1552,
    ),
  )
}

///|
let card_countable_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_COUNTABLE_CONG",
)

///|
/// `CARD_COUNTABLE_CONG`
pub fn card_countable_cong() -> @kernel.Thm {
  card_countable_cong_c.get()
}

///|
/// COUNTABLE_SUBSET
fn step_158() -> Unit raise {
  let t1556 = @simp.asm_simp_tac(@list.List([card_le_subset()]))
  let t1554 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1555 = @tactics.trans_tac(card_le_trans())(t1554)
  let t1553 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1557 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
        t1553,
      ),
      t1555,
    ),
    t1556,
  )
  countable_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(t) && SUBSET(s, t) → COUNTABLE(s)"),
      t1557,
    ),
  )
}

///|
let countable_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_SUBSET",
)

///|
/// `COUNTABLE_SUBSET`
pub fn countable_subset() -> @kernel.Thm {
  countable_subset_c.get()
}

///|
/// COUNTABLE_RESTRICT
fn step_159() -> Unit raise {
  let t1559 = @sets.set_tac(@list.List([]))
  let t1558 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      countable_subset(),
    ),
  )
  let t1560 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1558),
    t1559,
  )
  countable_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ P : (_) -> Bool, COUNTABLE(s) → COUNTABLE({(x : _) | IN(x, s) && P(x)})"),
      t1560,
    ),
  )
}

///|
let countable_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_RESTRICT",
)

///|
/// `COUNTABLE_RESTRICT`
pub fn countable_restrict() -> @kernel.Thm {
  countable_restrict_c.get()
}

///|
/// COUNTABLE_SUBSET_NUM
fn step_160() -> Unit raise {
  let t1561 = @meson.meson_tac(
    @list.List([num_countable(), countable_subset(), @sets.subset_univ()]),
  )
  countable_subset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, COUNTABLE(s)"), t1561),
  )
}

///|
let countable_subset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_SUBSET_NUM",
)

///|
/// `COUNTABLE_SUBSET_NUM`
pub fn countable_subset_num() -> @kernel.Thm {
  countable_subset_num_c.get()
}

///|
/// FINITE_IMP_COUNTABLE
fn step_161() -> Unit raise {
  let t1562 = @simp.simp_tac(
    @list.List([finite_card_lt(), @sets.lt_c(), @sets.countable(), @sets.ge_c()]),
  )
  finite_imp_countable_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → COUNTABLE(s)"), t1562),
  )
}

///|
let finite_imp_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_IMP_COUNTABLE",
)

///|
/// `FINITE_IMP_COUNTABLE`
pub fn finite_imp_countable() -> @kernel.Thm {
  finite_imp_countable_c.get()
}

///|
/// CARD_LE_COUNTABLE_INFINITE
fn step_162() -> Unit raise {
  let t1563 = @simp.rewrite_tac(
    @list.List([
      @sets.countable(),
      @sets.ge_c(),
      infinite_card_le(),
      card_le_trans(),
    ]),
  )
  card_le_countable_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(s) && INFINITE(t) → op_lt_eq_us_c(s, t)"),
      t1563,
    ),
  )
}

///|
let card_le_countable_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_COUNTABLE_INFINITE",
)

///|
/// `CARD_LE_COUNTABLE_INFINITE`
pub fn card_le_countable_infinite() -> @kernel.Thm {
  card_le_countable_infinite_c.get()
}

///|
/// CARD_LT_COUNTABLE_UNCOUNTABLE
fn step_163() -> Unit raise {
  let t1564 = @simp.rewrite_tac(
    @list.List([
      @sets.countable(),
      @sets.ge_c(),
      card_not_le(),
      card_let_trans(),
    ]),
  )
  card_lt_countable_uncountable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(s) && !COUNTABLE(t) → op_lt_us_c(s, t)"),
      t1564,
    ),
  )
}

///|
let card_lt_countable_uncountable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LT_COUNTABLE_UNCOUNTABLE",
)

///|
/// `CARD_LT_COUNTABLE_UNCOUNTABLE`
pub fn card_lt_countable_uncountable() -> @kernel.Thm {
  card_lt_countable_uncountable_c.get()
}

///|
/// COUNTABLE_IMAGE
fn step_164() -> Unit raise {
  let t1568 = @simp.asm_simp_tac(@list.List([card_le_image()]))
  let t1566 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1567 = @tactics.trans_tac(card_le_trans())(t1566)
  let t1565 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1569 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
        t1565,
      ),
      t1567,
    ),
    t1568,
  )
  countable_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, COUNTABLE(s) → COUNTABLE(IMAGE(f, s))"),
      t1569,
    ),
  )
}

///|
let countable_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE",
)

///|
/// `COUNTABLE_IMAGE`
pub fn countable_image() -> @kernel.Thm {
  countable_image_c.get()
}

///|
/// COUNTABLE_IMAGE_INJ_GENERAL
fn step_165() -> Unit raise {
  let t1583 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1582 = @simp.asm_simp_tac(@list.List([countable_image()]))
  let t1581 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((g : (B) -> A), (A : (B) -> Bool))"))
  let t1580 = @tactics.match_mp_tac(countable_subset())
  let t1577 = @term_syntax.parse_term("(g : (B) -> A)")
  let t1579 = @tactics.disch_then((x1578 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1577, x1578)
  })
  let t1574 = @simp.gen_rewrite_rule(
    fn(
      x1573 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1573
    },
    @list.List([@sets.injective_on_left_inverse()]),
  )
  let t1576 = @tactics.first_x_assum(fn(
    x1575 : @kernel.Thm,
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
      x1570 : @kernel.Thm,
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
      let s1571 = @tactics.mp_tac(x1570)
      fn(
        x1572 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1571(x1572)
      }
    })(t1574(x1575))
  })
  let t1584 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1576),
            t1579,
          ),
          t1580,
        ),
        t1581,
      ),
      t1582,
    ),
    t1583,
  )
  countable_image_inj_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ A : (B) -> Bool, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && COUNTABLE(A) → COUNTABLE({(x : A) | IN(x, s) && IN(f(x), A)})"),
      t1584,
    ),
  )
}

///|
let countable_image_inj_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE_INJ_GENERAL",
)

///|
/// `COUNTABLE_IMAGE_INJ_GENERAL`
pub fn countable_image_inj_general() -> @kernel.Thm {
  countable_image_inj_general_c.get()
}

///|
/// COUNTABLE_IMAGE_INJ_EQ
fn step_166() -> Unit raise {
  let t1598 = @sets.set_tac(@list.List([]))
  let t1597 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1594 = @drule.match_mp(countable_image_inj_general())
  let t1596 = @tactics.disch_then(fn(
    x1595 : @kernel.Thm,
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
      x1591 : @kernel.Thm,
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
      let s1592 = @tactics.mp_tac(x1591)
      fn(
        x1593 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1592(x1593)
      }
    })(t1594(x1595))
  })
  let t1590 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1589 = @tactics.pop_assum(fn(
    x1586 : @kernel.Thm,
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
    let s1587 = @tactics.mp_tac(x1586)
    fn(
      x1588 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1587(x1588)
    }
  })
  let t1585 = @simp.asm_simp_tac(@list.List([countable_image()]))
  let t1599 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  @tactics.eq_tac,
                ),
                t1585,
              ),
              t1589,
            ),
            t1590,
          ),
          t1596,
        ),
        t1597,
      ),
      @tactics.ap_term_tac,
    ),
    t1598,
  )
  countable_image_inj_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → COUNTABLE(IMAGE(f, s)) == COUNTABLE(s)"),
      t1599,
    ),
  )
}

///|
let countable_image_inj_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE_INJ_EQ",
)

///|
/// `COUNTABLE_IMAGE_INJ_EQ`
pub fn countable_image_inj_eq() -> @kernel.Thm {
  countable_image_inj_eq_c.get()
}

///|
/// COUNTABLE_IMAGE_INJ
fn step_167() -> Unit raise {
  let t1603 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t1600 = @term_syntax.parse_term("(UNIV : (A) -> Bool)")
  let t1601 = @term_syntax.parse_term("(A : (B) -> Bool)")
  let t1602 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1601, t1600]),
      countable_image_inj_general(),
    ),
  )
  let t1604 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1602),
    t1603,
  )
  countable_image_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ A : (B) -> Bool, (∀ x : A, ∀ y : A, f(x) == f(y) → x == y) && COUNTABLE(A) → COUNTABLE({(x : A) | IN(f(x), A)})"),
      t1604,
    ),
  )
}

///|
let countable_image_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE_INJ",
)

///|
/// `COUNTABLE_IMAGE_INJ`
pub fn countable_image_inj() -> @kernel.Thm {
  countable_image_inj_c.get()
}

///|
/// COUNTABLE_EMPTY
fn step_168() -> Unit raise {
  let t1605 = @simp.simp_tac(
    @list.List([finite_imp_countable(), @sets.finite_rules()]),
  )
  countable_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("(COUNTABLE : ((_) -> Bool) -> Bool)(({} : (_) -> Bool))"), t1605),
  )
}

///|
let countable_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_EMPTY",
)

///|
/// `COUNTABLE_EMPTY`
pub fn countable_empty() -> @kernel.Thm {
  countable_empty_c.get()
}

///|
/// COUNTABLE_INTER
fn step_169() -> Unit raise {
  let t1608 = @sets.set_tac(@list.List([]))
  let t1607 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      countable_subset(),
    ),
  )
  let t1606 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1609 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @class.taut(
                @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"),
              ),
            ]),
          ),
          t1606,
        ),
        @tactics.conj_tac,
      ),
      t1607,
    ),
    t1608,
  )
  countable_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, COUNTABLE(s) || COUNTABLE(t) → COUNTABLE(INTER(s, t))"),
      t1609,
    ),
  )
}

///|
let countable_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTER",
)

///|
/// `COUNTABLE_INTER`
pub fn countable_inter() -> @kernel.Thm {
  countable_inter_c.get()
}

///|
/// COUNTABLE_UNION_IMP
fn step_170() -> Unit raise {
  let t1613 = @simp.asm_simp_tac(
    @list.List([card_add2_absorb_le(), @sets.num_infinite(), union_le_add_c()]),
  )
  let t1611 = @term_syntax.parse_term("op_plus_us_c((s : (A) -> Bool), (t : (A) -> Bool))")
  let t1612 = @tactics.trans_tac(card_le_trans())(t1611)
  let t1610 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1614 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
        t1610,
      ),
      t1612,
    ),
    t1613,
  )
  countable_union_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE(UNION(s, t))"),
      t1614,
    ),
  )
}

///|
let countable_union_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_IMP",
)

///|
/// `COUNTABLE_UNION_IMP`
pub fn countable_union_imp() -> @kernel.Thm {
  countable_union_imp_c.get()
}

///|
/// COUNTABLE_UNION
fn step_171() -> Unit raise {
  let t1620 = @sets.set_tac(@list.List([]))
  let t1619 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      countable_subset(),
    ),
  )
  let t1618 = @tactics.disch_then(fn(
    x1616 : @kernel.Thm,
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
    let th = x1616
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th))
  })
  let t1615 = @simp.rewrite_tac(@list.List([countable_union_imp()]))
  let t1621 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          t1615,
        ),
        t1618,
      ),
      t1619,
    ),
    t1620,
  )
  countable_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(UNION(s, t)) == (COUNTABLE(s) && COUNTABLE(t))"),
      t1621,
    ),
  )
}

///|
let countable_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION",
)

///|
/// `COUNTABLE_UNION`
pub fn countable_union() -> @kernel.Thm {
  countable_union_c.get()
}

///|
/// COUNTABLE_SING
fn step_172() -> Unit raise {
  let t1622 = @simp.simp_tac(
    @list.List([finite_imp_countable(), @sets.finite_sing()]),
  )
  countable_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : _, COUNTABLE({x})"), t1622),
  )
}

///|
let countable_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_SING")

///|
/// `COUNTABLE_SING`
pub fn countable_sing() -> @kernel.Thm {
  countable_sing_c.get()
}

///|
/// COUNTABLE_INSERT
fn step_173() -> Unit raise {
  let t1623 = @simp.rewrite_tac(
    @list.List([countable_union(), countable_sing()]),
  )
  let t1624 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @sets.set_rule(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)")),
      ]),
    ),
    t1623,
  )
  countable_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : _, ∀ s : (_) -> Bool, COUNTABLE(INSERT(x, s)) == COUNTABLE(s)"),
      t1624,
    ),
  )
}

///|
let countable_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INSERT",
)

///|
/// `COUNTABLE_INSERT`
pub fn countable_insert() -> @kernel.Thm {
  countable_insert_c.get()
}

///|
/// COUNTABLE_DELETE
fn step_174() -> Unit raise {
  let t1629 = @tactics.then_tac(
    @tactics.ap_term_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  )
  let t1630 = @list.List([
    @simp.rewrite_tac(@list.List([countable_insert()])),
    t1629,
  ])
  let t1628 = @tactics.exists_tac(
    @term_syntax.parse_term("COUNTABLE(INSERT((x : A), DELETE((s : (A) -> Bool), x)))"),
  )
  let t1627 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1626 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("!IN((x : _), (s : (_) -> Bool)) → DELETE(s, x) == s")),
    ]),
  )
  let t1625 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t1631 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1625),
            t1626,
          ),
          t1627,
        ),
        t1628,
      ),
      @tactics.conj_tac,
    ),
    t1630,
  )
  countable_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ s : (A) -> Bool, COUNTABLE(DELETE(s, x)) == COUNTABLE(s)"),
      t1631,
    ),
  )
}

///|
let countable_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_DELETE",
)

///|
/// `COUNTABLE_DELETE`
pub fn countable_delete() -> @kernel.Thm {
  countable_delete_c.get()
}

///|
/// COUNTABLE_DIFF_FINITE
fn step_175() -> Unit raise {
  let t1633 = @simp.simp_tac(
    @list.List([
      @sets.diff_empty(),
      @sets.set_rule(
        @term_syntax.parse_term("DIFF((s : (_) -> Bool), INSERT((x : _), (t : (_) -> Bool))) == DELETE(DIFF(s, t), x)"),
      ),
      countable_delete(),
    ]),
  )
  let t1632 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1634 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
      t1632,
    ),
    t1633,
  )
  countable_diff_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) → COUNTABLE(DIFF(t, s)) == COUNTABLE(t)"),
      t1634,
    ),
  )
}

///|
let countable_diff_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_DIFF_FINITE",
)

///|
/// `COUNTABLE_DIFF_FINITE`
pub fn countable_diff_finite() -> @kernel.Thm {
  countable_diff_finite_c.get()
}

///|
/// COUNTABLE_DIFF
fn step_176() -> Unit raise {
  let t1635 = @meson.meson_tac(
    @list.List([
      countable_subset(),
      @sets.set_rule(@term_syntax.parse_term("SUBSET(DIFF((s : (_) -> Bool), (t : (_) -> Bool)), s)")),
    ]),
  )
  countable_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, COUNTABLE(s) → COUNTABLE(DIFF(s, t))"),
      t1635,
    ),
  )
}

///|
let countable_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_DIFF")

///|
/// `COUNTABLE_DIFF`
pub fn countable_diff() -> @kernel.Thm {
  countable_diff_c.get()
}

///|
/// COUNTABLE_CROSS
fn step_177() -> Unit raise {
  let t1636 = @simp.simp_tac(
    @list.List([card_mul2_absorb_le(), @sets.num_infinite()]),
  )
  let t1637 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.countable(),
        @sets.ge_c(),
        @sets.cross(),
        @equal.gsym(mul_c()),
      ]),
    ),
    t1636,
  )
  countable_cross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE(CROSS(s, t))"),
      t1637,
    ),
  )
}

///|
let countable_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CROSS",
)

///|
/// `COUNTABLE_CROSS`
pub fn countable_cross() -> @kernel.Thm {
  countable_cross_c.get()
}

///|
/// COUNTABLE_AS_IMAGE_SUBSET
fn step_178() -> Unit raise {
  let t1638 = @meson.meson_tac(@list.List([]))
  let t1639 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.countable(),
        @sets.ge_c(),
        @sets.le_c_v1(),
        @sets.subset(),
        @sets.in_image(),
      ]),
    ),
    t1638,
  )
  countable_as_image_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, COUNTABLE(s) → (∃ f : (Num) -> _, SUBSET(s, IMAGE(f, UNIV)))"),
      t1639,
    ),
  )
}

///|
let countable_as_image_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_IMAGE_SUBSET",
)

///|
/// `COUNTABLE_AS_IMAGE_SUBSET`
pub fn countable_as_image_subset() -> @kernel.Thm {
  countable_as_image_subset_c.get()
}

///|
/// COUNTABLE_AS_IMAGE_SUBSET_EQ
fn step_179() -> Unit raise {
  let t1640 = @meson.meson_tac(@list.List([]))
  let t1641 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.countable(),
        @sets.ge_c(),
        @sets.le_c_v1(),
        @sets.subset(),
        @sets.in_image(),
      ]),
    ),
    t1640,
  )
  countable_as_image_subset_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, COUNTABLE(s) == (∃ f : (Num) -> A, SUBSET(s, IMAGE(f, UNIV)))"),
      t1641,
    ),
  )
}

///|
let countable_as_image_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_IMAGE_SUBSET_EQ",
)

///|
/// `COUNTABLE_AS_IMAGE_SUBSET_EQ`
pub fn countable_as_image_subset_eq() -> @kernel.Thm {
  countable_as_image_subset_eq_c.get()
}

///|
/// COUNTABLE_AS_IMAGE
fn step_180() -> Unit raise {
  let t1658 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1657 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => if IN((f : (Num) -> A)(n), (s : (A) -> Bool)) { f(n) } else { (a : A) }"),
  )
  let t1654 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t1656 = @tactics.disch_then((x1655 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1654, x1655)
  })
  let t1651 = @drule.match_mp(countable_as_image_subset())
  let t1653 = @tactics.first_x_assum(fn(
    x1652 : @kernel.Thm,
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
      x1648 : @kernel.Thm,
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
      let s1649 = @tactics.mp_tac(x1648)
      fn(
        x1650 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1649(x1650)
      }
    })(t1651(x1652))
  })
  let t1645 = @simp.gen_rewrite_rule(
    fn(
      x1644 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1644
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t1642 = @term_syntax.parse_term("(a : A)")
  let t1647 = @tactics.first_x_assum(fn(
    x1646 : @kernel.Thm,
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
    ((x1643 : @kernel.Thm) => @tactics.x_choose_tac(t1642, x1643))(t1645(x1646))
  })
  let t1659 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1647),
          t1653,
        ),
        t1656,
      ),
      t1657,
    ),
    t1658,
  )
  countable_as_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, COUNTABLE(s) && !(s == {}) → (∃ f : (Num) -> A, s == IMAGE(f, UNIV))"),
      t1659,
    ),
  )
}

///|
let countable_as_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_IMAGE",
)

///|
/// `COUNTABLE_AS_IMAGE`
pub fn countable_as_image() -> @kernel.Thm {
  countable_as_image_c.get()
}

///|
/// FORALL_COUNTABLE_AS_IMAGE
fn step_181() -> Unit raise {
  let t1660 = @meson.meson_tac(
    @list.List([
      countable_as_image(),
      countable_image(),
      num_countable(),
      countable_empty(),
    ]),
  )
  forall_countable_as_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : (_) -> Bool, COUNTABLE(d) → (P : ((_) -> Bool) -> Bool)(d)) == (P({}) && (∀ f : (Num) -> _, P(IMAGE(f, UNIV))))"),
      t1660,
    ),
  )
}

///|
let forall_countable_as_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_COUNTABLE_AS_IMAGE",
)

///|
/// `FORALL_COUNTABLE_AS_IMAGE`
pub fn forall_countable_as_image() -> @kernel.Thm {
  forall_countable_as_image_c.get()
}

///|
/// COUNTABLE_AS_INJECTIVE_IMAGE
fn step_182() -> Unit raise {
  let t1664 = @sets.set_tac(@list.List([]))
  let t1663 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1662 = @simp.rewrite_tac(@list.List([card_le_antisym(), @sets.eq_c()]))
  let t1661 = @simp.rewrite_tac(
    @list.List([infinite_card_le(), @sets.countable(), @sets.ge_c()]),
  )
  let t1665 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])),
          ),
          t1661,
        ),
        t1662,
      ),
      t1663,
    ),
    t1664,
  )
  countable_as_injective_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, COUNTABLE(s) && INFINITE(s) → (∃ f : (Num) -> _, s == IMAGE(f, UNIV) && (∀ m : Num, ∀ n : Num, f(m) == f(n) → m == n))"),
      t1665,
    ),
  )
}

///|
let countable_as_injective_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_INJECTIVE_IMAGE",
)

///|
/// `COUNTABLE_AS_INJECTIVE_IMAGE`
pub fn countable_as_injective_image() -> @kernel.Thm {
  countable_as_injective_image_c.get()
}

///|
let countable_as_image_num_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_IMAGE_NUM_SUBSET",
)

///|
/// `COUNTABLE_AS_IMAGE_NUM_SUBSET`
pub fn countable_as_image_num_subset() -> @kernel.Thm {
  countable_as_image_num_subset_c.get()
}

///|
let countable_as_injective_image_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_AS_INJECTIVE_IMAGE_SUBSET",
)

///|
/// `COUNTABLE_AS_INJECTIVE_IMAGE_SUBSET`
pub fn countable_as_injective_image_subset() -> @kernel.Thm {
  countable_as_injective_image_subset_c.get()
}

///|
/// COUNTABLE_AS_IMAGE_NUM_SUBSET, COUNTABLE_AS_INJECTIVE_IMAGE_SUBSET
fn step_183() -> Unit raise {
  let t1670 = @meson.asm_meson_tac(
    @list.List([countable_as_injective_image(), @sets.infinite()]),
  )
  let t1671 = @list.List([
    @meson.asm_meson_tac(@list.List([@iterate.finite_index_numbers()])),
    t1670,
  ])
  let t1672 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.disch_tac,
      @class.asm_cases_tac(@term_syntax.parse_term("FINITE((s : (A) -> Bool))")),
    ),
    t1671,
  )
  let t1673 = @simp.simp_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      countable_image(),
      countable_subset_num(),
    ]),
  )
  let t1674 = @list.List([@meson.meson_tac(@list.List([])), t1673, t1672])
  let t1669 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1668 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((r : Bool) → (q : Bool)) && (q → (p : Bool)) && (p → r) → p == q && p == r"),
    ),
  )
  let t1667 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1675 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
          t1667,
        ),
        t1668,
      ),
      t1669,
    ),
    t1674,
  )
  let t1676 = (
    @term_syntax.parse_term("(∀ s : (A) -> Bool, COUNTABLE(s) == (∃ f : (Num) -> A, ∃ k : (Num) -> Bool, s == IMAGE(f, k))) && (∀ s : (A) -> Bool, COUNTABLE(s) == (∃ f : (Num) -> A, ∃ k : (Num) -> Bool, s == IMAGE(f, k) && (∀ m : Num, ∀ n : Num, IN(m, k) && IN(n, k) && f(m) == f(n) → m == n)))"),
    t1675,
  )
  let (countable_as_image_num_subset, countable_as_injective_image_subset) = @bool.conj_pair(
    (fn(
      x1666 : (
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
      @tactics.prove(x1666.0, x1666.1)
    })(t1676),
  )
  countable_as_image_num_subset_c.set(countable_as_image_num_subset)
  countable_as_injective_image_subset_c.set(countable_as_injective_image_subset)
}

///|
/// COUNTABLE_UNIONS
fn step_184() -> Unit raise {
  let t1679 = @simp.asm_rewrite_tac(@list.List([@sets.num_infinite()]))
  let t1678 = @tactics.match_mp_tac(card_le_unions())
  let t1677 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1680 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
        t1677,
      ),
      t1678,
    ),
    t1679,
  )
  countable_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ A : ((A) -> Bool) -> Bool, COUNTABLE(A) && (∀ s : (A) -> Bool, IN(s, A) → COUNTABLE(s)) → COUNTABLE(UNIONS(A))"),
      t1680,
    ),
  )
}

///|
let countable_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNIONS",
)

///|
/// `COUNTABLE_UNIONS`
pub fn countable_unions() -> @kernel.Thm {
  countable_unions_c.get()
}

///|
/// COUNTABLE_PRODUCT_DEPENDENT
fn step_185() -> Unit raise {
  let t1723 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1722 = @simp.rewrite_tac(
    @list.List([
      @sets.in_image(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
      @pair.exists_pair_thm(),
      @sets.in_cross(),
      @sets.in_univ(),
    ]),
  )
  let t1721 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_unions()]),
  )
  let t1720 = @simp.asm_simp_tac(
    @list.List([countable_image(), countable_cross(), num_countable()]),
  )
  let t1719 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(fn { (m, n) => ((f : (Num) -> A)(m), (g : (A, Num) -> B)(f(m), n)) }, CROSS(UNIV, UNIV))"),
  )
  let t1718 = @tactics.match_mp_tac(countable_subset())
  let t1715 = @term_syntax.parse_term("(g : (A, Num) -> B)")
  let t1717 = @tactics.disch_then((x1716 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1715, x1716)
  })
  let t1714 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t1713 = @simp.gen_rewrite_tac(
    fn(
      x1712 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1706 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1707 = @equal.land_conv(x1706)
        fn(x1708 : @kernel.Term) -> @kernel.Thm raise { s1707(x1708) }
      })(
        (fn(
          x1709 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1710 = @equal.binder_conv(x1709)
          fn(x1711 : @kernel.Term) -> @kernel.Thm raise { s1710(x1711) }
        })(x1712),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1700 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t1705 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x1701 : @kernel.Thm) => @tactics.x_choose_tac(t1700, x1701),
      fn(
        x1702 : @kernel.Thm,
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
        let s1703 = @tactics.mp_tac(x1702)
        fn(
          x1704 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1703(x1704)
        }
      },
    ),
  )
  let t1699 = @simp.gen_rewrite_tac(
    fn(
      x1698 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1692 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1693 = @equal.land_conv(x1692)
        fn(x1694 : @kernel.Term) -> @kernel.Thm raise { s1693(x1694) }
      })(
        (fn(
          x1695 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1696 = @equal.top_depth_conv(x1695)
          fn(x1697 : @kernel.Term) -> @kernel.Thm raise { s1696(x1697) }
        })(x1698),
      )
    },
    @list.List([countable_as_image_subset_eq()]),
  )
  let t1689 = @tactics.pop_assum(fn(
    x1686 : @kernel.Thm,
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
    let s1687 = @tactics.mp_tac(x1686)
    fn(
      x1688 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1687(x1688)
    }
  })
  let t1690 = @tactics.then_tac(@tactics.match_mp_tac(countable_image()), t1689)
  let t1685 = @sets.set_tac(@list.List([]))
  let t1691 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          @sets.in_image(),
          @pair.exists_pair_thm(),
          @sets.in_elim_pair_thm(),
        ]),
      ),
      t1685,
    ),
    t1690,
  ])
  let t1684 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(f : (A, B) -> C)((x : A), (y : B)) | IN(x, (s : (A) -> Bool)) && IN(y, (t : (A, B) -> Bool)(x))} == IMAGE(fn { (x, y) => f(x, y) }, {((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})"),
    fn(
      x1681 : @kernel.Thm,
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
      let s1682 = @tactics.subst1_tac(x1681)
      fn(
        x1683 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1682(x1683)
      }
    },
  )
  let t1724 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.repeat_tac(@tactics.gen_tac),
                              @tactics.disch_tac,
                            ),
                            t1684,
                          ),
                          t1691,
                        ),
                        t1699,
                      ),
                      t1705,
                    ),
                    t1713,
                  ),
                  t1714,
                ),
                t1717,
              ),
              t1718,
            ),
            t1719,
          ),
          t1720,
        ),
        t1721,
      ),
      t1722,
    ),
    t1723,
  )
  countable_product_dependent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> C, ∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, COUNTABLE(s) && (∀ x : A, IN(x, s) → COUNTABLE(t(x))) → COUNTABLE({f((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})"),
      t1724,
    ),
  )
}

///|
let countable_product_dependent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_PRODUCT_DEPENDENT",
)

///|
/// `COUNTABLE_PRODUCT_DEPENDENT`
pub fn countable_product_dependent() -> @kernel.Thm {
  countable_product_dependent_c.get()
}

///|
/// COUNTABLE_CARD_ADD
fn step_186() -> Unit raise {
  let t1730 = @simp.rewrite_tac(
    @list.List([@sets.num_infinite(), card_le_refl()]),
  )
  let t1729 = @tactics.match_mp_tac(card_add_absorb_le())
  let t1728 = @simp.asm_simp_tac(@list.List([card_le_add()]))
  let t1726 = @term_syntax.parse_term("(op_plus_us_c : ((Num) -> Bool, (Num) -> Bool, Sum[Num, Num]) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))")
  let t1727 = @tactics.trans_tac(card_le_trans())(t1726)
  let t1725 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1731 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
            t1725,
          ),
          t1727,
        ),
        t1728,
      ),
      t1729,
    ),
    t1730,
  )
  countable_card_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE(op_plus_us_c(s, t))"),
      t1731,
    ),
  )
}

///|
let countable_card_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CARD_ADD",
)

///|
/// `COUNTABLE_CARD_ADD`
pub fn countable_card_add() -> @kernel.Thm {
  countable_card_add_c.get()
}

///|
/// COUNTABLE_CARD_ADD_EQ
fn step_187() -> Unit raise {
  let t1737 = @simp.rewrite_tac(@list.List([card_le_addl(), card_le_addr()]))
  let t1736 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      card_le_countable(),
    ),
  )
  let t1735 = @tactics.disch_then(fn(
    x1733 : @kernel.Thm,
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
    let th = x1733
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th))
  })
  let t1732 = @simp.rewrite_tac(@list.List([countable_card_add()]))
  let t1738 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          t1732,
        ),
        t1735,
      ),
      t1736,
    ),
    t1737,
  )
  countable_card_add_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(op_plus_us_c(s, t)) == (COUNTABLE(s) && COUNTABLE(t))"),
      t1738,
    ),
  )
}

///|
let countable_card_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CARD_ADD_EQ",
)

///|
/// `COUNTABLE_CARD_ADD_EQ`
pub fn countable_card_add_eq() -> @kernel.Thm {
  countable_card_add_eq_c.get()
}

///|
/// COUNTABLE_CARD_MUL
fn step_188() -> Unit raise {
  let t1740 = @simp.asm_simp_tac(@list.List([countable_product_dependent()]))
  let t1739 = @simp.rewrite_tac(@list.List([mul_c()]))
  let t1741 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1739),
    t1740,
  )
  countable_card_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE(op_star_us_c(s, t))"),
      t1741,
    ),
  )
}

///|
let countable_card_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CARD_MUL",
)

///|
/// `COUNTABLE_CARD_MUL`
pub fn countable_card_mul() -> @kernel.Thm {
  countable_card_mul_c.get()
}

///|
/// COUNTABLE_CARD_MUL_EQ
fn step_189() -> Unit raise {
  let t1753 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1752 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm()]))
  let t1751 = @simp.asm_simp_tac(
    @list.List([
      countable_image(),
      mul_c(),
      @sets.subset(),
      @sets.in_image(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t1749 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(SND, op_star_us_c((s : (A) -> Bool), (t : (B) -> Bool)))"),
  )
  let t1750 = @list.List([
    @tactics.exists_tac(
      @term_syntax.parse_term("IMAGE(FST, op_star_us_c((s : (A) -> Bool), (t : (B) -> Bool)))"),
    ),
    t1749,
  ])
  let t1748 = @tactics.match_mp_tac(countable_subset())
  let t1747 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1746 = @simp.simp_tac(
    @list.List([@simp.rewrite_rule(@list.List([mul_c()]))(countable_card_mul())]),
  )
  let t1745 = @simp.asm_rewrite_tac(
    @list.List([
      countable_empty(),
      @sets.empty_gspec(),
      @sets.not_in_empty(),
      @sets.set_rule(@term_syntax.parse_term("{((x : _), (y : _)) | false} == {}")),
    ]),
  )
  let t1743 = @term_syntax.parse_term("(t : (B) -> Bool) == {}")
  let t1744 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(s : (A) -> Bool) == {}"), t1743]),
  )
  let t1742 = @simp.rewrite_tac(@list.List([mul_c()]))
  let t1754 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t1742,
                      ),
                      t1744,
                    ),
                    t1745,
                  ),
                  @tactics.eq_tac,
                ),
                t1746,
              ),
              t1747,
            ),
            t1748,
          ),
          t1750,
        ),
        t1751,
      ),
      t1752,
    ),
    t1753,
  )
  countable_card_mul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(op_star_us_c(s, t)) == (s == {} || t == {} || COUNTABLE(s) && COUNTABLE(t))"),
      t1754,
    ),
  )
}

///|
let countable_card_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CARD_MUL_EQ",
)

///|
/// `COUNTABLE_CARD_MUL_EQ`
pub fn countable_card_mul_eq() -> @kernel.Thm {
  countable_card_mul_eq_c.get()
}

///|
/// CARD_EQ_PCROSS
fn step_190() -> Unit raise {
  let t1760 = @simp.rewrite_tac(
    @list.List([
      @cart.forall_in_pcross(),
      @cart.fstcart_pastecart(),
      @cart.sndcart_pastecart(),
    ]),
  )
  let t1759 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_pair_thm(), @cart.pastecart_fst_snd()]),
  )
  let t1758 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @cart.pastecart_in_pcross()]),
  )
  let t1757 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((Cart[A, M], Cart[A, N])) -> Cart[A, Finite_sum[M, N]]) => ∀ x : Cart[A, M], ∀ y : Cart[A, N], GEQ(f((x, y)), pastecart(x, y)))"),
  )
  let t1756 = @tactics.exists_tac(
    @term_syntax.parse_term("(z : Cart[A, Finite_sum[M, N]]) => (fstcart(z), sndcart(z))"),
  )
  let t1755 = @simp.rewrite_tac(@list.List([eq_c_bijections(), mul_c()]))
  let t1761 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1755),
            t1756,
          ),
          t1757,
        ),
        t1758,
      ),
      t1759,
    ),
    t1760,
  )
  card_eq_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, op_eq_us_c(PCROSS(s, t), op_star_us_c(s, t))"),
      t1761,
    ),
  )
}

///|
let card_eq_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_PCROSS")

///|
/// `CARD_EQ_PCROSS`
pub fn card_eq_pcross() -> @kernel.Thm {
  card_eq_pcross_c.get()
}

///|
/// COUNTABLE_PCROSS_EQ
fn step_191() -> Unit raise {
  let t1765 = @simp.rewrite_tac(@list.List([countable_card_mul_eq()]))
  let t1764 = @simp.rewrite_tac(@list.List([card_eq_pcross()]))
  let t1766 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(card_countable_cong()), t1764),
    t1765,
  ])
  let t1763 = @tactics.exists_tac(
    @term_syntax.parse_term("COUNTABLE(op_star_us_c((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)))"),
  )
  let t1762 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1767 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1762),
        t1763,
      ),
      @tactics.conj_tac,
    ),
    t1766,
  )
  countable_pcross_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, COUNTABLE(PCROSS(s, t)) == (s == {} || t == {} || COUNTABLE(s) && COUNTABLE(t))"),
      t1767,
    ),
  )
}

///|
let countable_pcross_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_PCROSS_EQ",
)

///|
/// `COUNTABLE_PCROSS_EQ`
pub fn countable_pcross_eq() -> @kernel.Thm {
  countable_pcross_eq_c.get()
}

///|
/// COUNTABLE_PCROSS
fn step_192() -> Unit raise {
  let t1768 = @simp.simp_tac(@list.List([countable_pcross_eq()]))
  countable_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE(PCROSS(s, t))"),
      t1768,
    ),
  )
}

///|
let countable_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_PCROSS",
)

///|
/// `COUNTABLE_PCROSS`
pub fn countable_pcross() -> @kernel.Thm {
  countable_pcross_c.get()
}

///|
/// INT_COUNTABLE
fn step_193() -> Unit raise {
  let t1772 = @sets.set_tac(@list.List([]))
  let t1771 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @int.forall_int_cases()]),
  )
  let t1770 = @simp.simp_tac(
    @list.List([countable_union(), countable_image(), num_countable()]),
  )
  let t1769 = @tactics.exists_tac(
    @term_syntax.parse_term("UNION(IMAGE((n : Num) => int_of_num(n), UNIV), IMAGE((n : Num) => -int_of_num(n), UNIV))"),
  )
  let t1773 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(countable_subset()), t1769),
        t1770,
      ),
      t1771,
    ),
    t1772,
  )
  int_countable_c.set(
    @tactics.prove(@term_syntax.parse_term("(COUNTABLE : ((Int) -> Bool) -> Bool)((UNIV : (Int) -> Bool))"), t1773),
  )
}

///|
let int_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_COUNTABLE")

///|
/// `INT_COUNTABLE`
pub fn int_countable() -> @kernel.Thm {
  int_countable_c.get()
}

///|
/// CARD_EQ_INT_NUM
fn step_194() -> Unit raise {
  let t1777 = @simp.simp_tac(
    @list.List([@int.int_of_num_eq(), @sets.in_univ()]),
  )
  let t1776 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num"))
  let t1775 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t1774 = @equal.gsym(countable_alt())
  let t1778 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@equal.gsym(card_le_antisym()), t1774, int_countable()]),
        ),
        t1775,
      ),
      t1776,
    ),
    t1777,
  )
  card_eq_int_num_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : ((Int) -> Bool, (Num) -> Bool) -> Bool)((UNIV : (Int) -> Bool), (UNIV : (Num) -> Bool))"), t1778),
  )
}

///|
let card_eq_int_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_INT_NUM",
)

///|
/// `CARD_EQ_INT_NUM`
pub fn card_eq_int_num() -> @kernel.Thm {
  card_eq_int_num_c.get()
}

///|
/// int_INFINITE
fn step_195() -> Unit raise {
  let t1779 = @simp.rewrite_tac(@list.List([@sets.num_infinite()]))
  let t1780 = @tactics.then_tac(
    @tactics.subst1_tac(
      @drule.match_mp(card_infinite_cong())(card_eq_int_num()),
    ),
    t1779,
  )
  int_infinite_c.set(
    @tactics.prove(@term_syntax.parse_term("(INFINITE : ((Int) -> Bool) -> Bool)((UNIV : (Int) -> Bool))"), t1780),
  )
}

///|
let int_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_INFINITE")

///|
/// `int_INFINITE`
pub fn int_infinite() -> @kernel.Thm {
  int_infinite_c.get()
}

///|
/// COUNTABLE_CART
fn step_196() -> Unit raise {
  let t1807 = @int.arith_rule(
    @term_syntax.parse_term("(n : Num) < (i : Num) && !(i == SUC(n)) → SUC(n) < i"),
  )
  let t1808 = @meson.asm_meson_tac(
    @list.List([
      @arith.le(),
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      t1807,
    ]),
  )
  let t1806 = @simp.simp_tac(
    @list.List([
      @cart.cart_eq(),
      @cart.lambda_beta(),
      @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (n : Num) → !(i == SUC(n))")),
    ]),
  )
  let t1805 = @tactics.exists_tac(
    @term_syntax.parse_term("(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { (select : ((A) -> Bool) -> A)((x : A) => false) } else { (op_dollar : (Cart[A, N], Num) -> A)((v : Cart[A, N]), i) })"),
  )
  let t1804 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((v : Cart[A, N]), SUC((n : Num)))"))
  let t1803 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1802 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[A, N])"))
  let t1801 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_image(),
      @sets.in_elim_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t1797 = @int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) <= (m : Num) → n <= m"))
  let t1798 = @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))
  let t1799 = @simp.asm_simp_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.cross()]))(countable_cross()),
      t1798,
      t1797,
    ]),
  )
  let t1800 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(countable_image()), t1799),
    @tactics.all_tac,
  ])
  let t1796 = @tactics.exists_tac(
    @term_syntax.parse_term("(IMAGE : (((A, Cart[A, N])) -> Cart[A, N], ((A, Cart[A, N])) -> Bool, Cart[A, N]) -> Bool)(fn { ((x : A), (v : Cart[A, N])) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { x } else { (op_dollar : (Cart[A, N], Num) -> A)(v, i) }) }, {((x : A), (v : Cart[A, N])) | (IN : (A, (A) -> Bool) -> Bool)(x, {(x : A) | (P : (Num, A) -> Bool)(SUC(n), x)}) && (IN : (Cart[A, N], (Cart[A, N]) -> Bool) -> Bool)(v, {(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})})"),
  )
  let t1795 = @tactics.match_mp_tac(countable_subset())
  let t1793 = @simp.simp_tac(
    @list.List([
      @sets.extension(),
      @sets.in_sing(),
      @sets.in_elim_thm(),
      @cart.cart_eq(),
      @cart.lambda_beta(),
    ]),
  )
  let t1792 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false)} == {(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (select : ((A) -> Bool) -> A)((x : A) => false))}"),
    fn(
      x1790 : @kernel.Thm,
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
      let th = x1790
      @simp.simp_tac(@list.List([countable_sing(), th]))
    },
  )
  let t1789 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(1 <= (i : Num) && i <= (n : Num) && 0 < i) == (1 <= i && i <= n)"),
      ),
    ]),
  )
  let t1794 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.arith_rule(
                @term_syntax.parse_term("(1 <= (i : Num) && i <= (n : Num) && i <= 0) == false"),
              ),
            ]),
          ),
          t1789,
        ),
        t1792,
      ),
      t1793,
    ),
    @tactics.all_tac,
  ])
  let t1788 = @simp.rewrite_tac(
    @list.List([@arith.le_refl(), @arith.let_antisym()]),
  )
  let t1784 = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let t1787 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, n <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (COUNTABLE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → (P : (Num, A) -> Bool)(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})"),
    fn(
      x1786 : @kernel.Thm,
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
        x1781 : @kernel.Thm,
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
        let s1782 = @tactics.mp_tac(x1781)
        fn(
          x1783 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1782(x1783)
        }
      })(((x1785 : @kernel.Thm) => @bool.spec(t1784, x1785))(x1786))
    },
  )
  let t1809 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.gen_tac, @tactics.disch_tac,
                                    ),
                                    t1787,
                                  ),
                                  t1788,
                                ),
                                @nums.induct_tac,
                              ),
                              t1794,
                            ),
                            @tactics.disch_tac,
                          ),
                          t1795,
                        ),
                        t1796,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1800,
                  ),
                  t1801,
                ),
                t1802,
              ),
              t1803,
            ),
            @tactics.strip_tac,
          ),
          t1804,
        ),
        t1805,
      ),
      t1806,
    ),
    t1808,
  )
  countable_cart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (COUNTABLE : ((A) -> Bool) -> Bool)({(x : A) | P(i, x)})) → (COUNTABLE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))})"),
      t1809,
    ),
  )
}

///|
let countable_cart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_CART")

///|
/// `COUNTABLE_CART`
pub fn countable_cart() -> @kernel.Thm {
  countable_cart_c.get()
}

///|
/// EXISTS_COUNTABLE_SUBSET_IMAGE_INJ
fn step_197() -> Unit raise {
  let t1812 = @meson.meson_tac(@list.List([countable_image_inj_eq()]))
  let t1811 = @simp.rewrite_tac(@list.List([@sets.exists_subset_image_inj()]))
  let t1810 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1813 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(
              @list.List([
                @class.taut(
                  @term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == (q && p && r)"),
                ),
              ]),
            ),
            t1810,
          ),
          t1811,
        ),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    t1812,
  )
  exists_countable_subset_image_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ s : (_) -> Bool, (∃ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (∃ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && (∀ x : _, ∀ y : _, IN(x, t) && IN(y, t) → (f(x) == f(y)) == (x == y)) && P(IMAGE(f, t)))"),
      t1813,
    ),
  )
}

///|
let exists_countable_subset_image_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_COUNTABLE_SUBSET_IMAGE_INJ",
)

///|
/// `EXISTS_COUNTABLE_SUBSET_IMAGE_INJ`
pub fn exists_countable_subset_image_inj() -> @kernel.Thm {
  exists_countable_subset_image_inj_c.get()
}

///|
/// FORALL_COUNTABLE_SUBSET_IMAGE_INJ
fn step_198() -> Unit raise {
  let t1815 = @simp.rewrite_tac(
    @list.List([
      @class.not_imp(),
      exists_countable_subset_image_inj(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t1814 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ t : _, (p : (_) -> Bool)(t)) == !(∃ t : _, !p(t))"),
      ),
    ]),
  )
  let t1816 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1814),
    t1815,
  )
  forall_countable_subset_image_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ s : (_) -> Bool, (∀ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) → P(t)) == (∀ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && (∀ x : _, ∀ y : _, IN(x, t) && IN(y, t) → (f(x) == f(y)) == (x == y)) → P(IMAGE(f, t)))"),
      t1816,
    ),
  )
}

///|
let forall_countable_subset_image_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_COUNTABLE_SUBSET_IMAGE_INJ",
)

///|
/// `FORALL_COUNTABLE_SUBSET_IMAGE_INJ`
pub fn forall_countable_subset_image_inj() -> @kernel.Thm {
  forall_countable_subset_image_inj_c.get()
}

///|
/// EXISTS_COUNTABLE_SUBSET_IMAGE
fn step_199() -> Unit raise {
  let t1818 = @meson.meson_tac(
    @list.List([countable_image(), @sets.image_subset()]),
  )
  let t1817 = @meson.meson_tac(@list.List([]))
  let t1819 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([exists_countable_subset_image_inj()])),
      t1817,
    ),
    t1818,
  ])
  let t1820 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t1819,
  )
  exists_countable_subset_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ s : (_) -> Bool, (∃ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (∃ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && P(IMAGE(f, t)))"),
      t1820,
    ),
  )
}

///|
let exists_countable_subset_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_COUNTABLE_SUBSET_IMAGE",
)

///|
/// `EXISTS_COUNTABLE_SUBSET_IMAGE`
pub fn exists_countable_subset_image() -> @kernel.Thm {
  exists_countable_subset_image_c.get()
}

///|
/// FORALL_COUNTABLE_SUBSET_IMAGE
fn step_200() -> Unit raise {
  let t1822 = @simp.rewrite_tac(
    @list.List([
      @class.not_imp(),
      @equal.gsym(@theorems.conj_assoc()),
      exists_countable_subset_image(),
    ]),
  )
  let t1821 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x)) == !(∃ x : _, !P(x))"),
      ),
    ]),
  )
  let t1823 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1821),
    t1822,
  )
  forall_countable_subset_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ s : (_) -> Bool, (∀ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) → P(t)) == (∀ t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) → P(IMAGE(f, t)))"),
      t1823,
    ),
  )
}

///|
let forall_countable_subset_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_COUNTABLE_SUBSET_IMAGE",
)

///|
/// `FORALL_COUNTABLE_SUBSET_IMAGE`
pub fn forall_countable_subset_image() -> @kernel.Thm {
  forall_countable_subset_image_c.get()
}

///|
/// COUNTABLE_SUBSET_IMAGE
fn step_201() -> Unit raise {
  let t1828 = @meson.meson_tac(@list.List([]))
  let t1827 = @simp.rewrite_tac(@list.List([forall_countable_subset_image()]))
  let t1825 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1826 = @tactics.spec_tac(@term_syntax.parse_term("(t : (B) -> Bool)"), t1825)
  let t1824 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([countable_image(), @sets.image_subset()])),
  ])
  let t1829 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          t1824,
        ),
        t1826,
      ),
      t1827,
    ),
    t1828,
  )
  countable_subset_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (COUNTABLE(t) && SUBSET(t, IMAGE(f, s))) == (∃ s' : (A) -> Bool, COUNTABLE(s') && SUBSET(s', s) && t == IMAGE(f, s'))"),
      t1829,
    ),
  )
}

///|
let countable_subset_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_SUBSET_IMAGE",
)

///|
/// `COUNTABLE_SUBSET_IMAGE`
pub fn countable_subset_image() -> @kernel.Thm {
  countable_subset_image_c.get()
}

///|
/// COUNTABLE_IMAGE_EQ
fn step_202() -> Unit raise {
  let t1830 = @meson.meson_tac(
    @list.List([
      countable_subset_image(),
      countable_image(),
      @sets.subset_refl(),
    ]),
  )
  countable_image_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, COUNTABLE(IMAGE(f, s)) == (∃ t : (A) -> Bool, COUNTABLE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t))"),
      t1830,
    ),
  )
}

///|
let countable_image_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE_EQ",
)

///|
/// `COUNTABLE_IMAGE_EQ`
pub fn countable_image_eq() -> @kernel.Thm {
  countable_image_eq_c.get()
}

///|
/// COUNTABLE_IMAGE_EQ_INJ
fn step_203() -> Unit raise {
  let t1837 = @metis.asm_metis_tac(@list.List([countable_image_inj_eq()]))
  let t1836 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1835 = @simp.rewrite_tac(@list.List([@sets.subset_refl()]))
  let t1832 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1833 = @term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool))")
  let t1834 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1833, t1832]),
      @sets.subset_image_inj(),
    ),
  )
  let t1831 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([countable_image()])),
  ])
  let t1838 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              t1831,
            ),
            @tactics.disch_tac,
          ),
          t1834,
        ),
        t1835,
      ),
      t1836,
    ),
    t1837,
  )
  countable_image_eq_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, COUNTABLE(IMAGE(f, s)) == (∃ t : (A) -> Bool, COUNTABLE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t) && (∀ x : A, ∀ y : A, IN(x, t) && IN(y, t) → (f(x) == f(y)) == (x == y)))"),
      t1838,
    ),
  )
}

///|
let countable_image_eq_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMAGE_EQ_INJ",
)

///|
/// `COUNTABLE_IMAGE_EQ_INJ`
pub fn countable_image_eq_inj() -> @kernel.Thm {
  countable_image_eq_inj_c.get()
}

///|
/// COUNTABLE_FLD
fn step_204() -> Unit raise {
  let t1860 = @sets.set_tac(@list.List([]))
  let t1859 = @simp.rewrite_tac(
    @list.List([@pair.exists_pair_thm(), @pair.pair_eq()]),
  )
  let t1858 = @simp.rewrite_tac(
    @list.List([
      @sets.in_cross(),
      @wo.fld(),
      @sets.in_image(),
      @sets.in_elim_thm(),
      @sets.in_union(),
    ]),
  )
  let t1857 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t1856 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      countable_subset(),
    ),
  )
  let t1853 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @equal.gsym(countable_union())]),
  )
  let t1851 = @drule.match_mp(countable_image())
  let t1854 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x1852 : @kernel.Thm,
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
        x1848 : @kernel.Thm,
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
        let th = x1848
        let t1850 = @tactics.mp_tac(
          @bool.ispec(@term_syntax.parse_term("(SND : ((A, A)) -> A)"), th),
        )
        @tactics.then_tac(
          @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(FST : ((A, A)) -> A)"), th)),
          t1850,
        )
      })(t1851(x1852))
    }),
    t1853,
  )
  let t1842 = @drule.match_mp(countable_cross())
  let t1855 = @list.List([
    @tactics.disch_then(fn(
      x1847 : @kernel.Thm,
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
        x1843 : @kernel.Thm,
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
          x1839 : @kernel.Thm,
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
          let s1840 = @tactics.mp_tac(x1839)
          fn(
            x1841 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1840(x1841)
          }
        })(t1842(x1843))
      })(
        (fn(x1846 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x1844 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x1845 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.conj(x1844, x1845)
            }
          })(x1846)(x1846)
        })(x1847),
      )
    }),
    t1854,
  ])
  let t1861 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
              t1855,
            ),
            t1856,
          ),
          t1857,
        ),
        t1858,
      ),
      t1859,
    ),
    t1860,
  )
  countable_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, COUNTABLE(fld(l)) == COUNTABLE({((x : A), (y : A)) | l(x, y)})"),
      t1861,
    ),
  )
}

///|
let countable_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_FLD")

///|
/// `COUNTABLE_FLD`
pub fn countable_fld() -> @kernel.Thm {
  countable_fld_c.get()
}

///|
/// COUNTABLE_UNION_OF_EMPTY
fn step_205() -> Unit raise {
  let t1862 = @simp.simp_tac(
    @list.List([@sets.union_of_empty(), countable_empty()]),
  )
  countable_union_of_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, P, {})"),
      t1862,
    ),
  )
}

///|
let countable_union_of_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_EMPTY",
)

///|
/// `COUNTABLE_UNION_OF_EMPTY`
pub fn countable_union_of_empty() -> @kernel.Thm {
  countable_union_of_empty_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_EMPTY
fn step_206() -> Unit raise {
  let t1863 = @simp.simp_tac(
    @list.List([@sets.intersection_of_empty(), countable_empty()]),
  )
  countable_intersection_of_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, P, UNIV)"),
      t1863,
    ),
  )
}

///|
let countable_intersection_of_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_EMPTY",
)

///|
/// `COUNTABLE_INTERSECTION_OF_EMPTY`
pub fn countable_intersection_of_empty() -> @kernel.Thm {
  countable_intersection_of_empty_c.get()
}

///|
/// COUNTABLE_UNION_OF_INC
fn step_207() -> Unit raise {
  let t1864 = @simp.simp_tac(
    @list.List([@sets.union_of_inc(), countable_sing()]),
  )
  countable_union_of_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, P(s) → UNION_OF(COUNTABLE, P, s)"),
      t1864,
    ),
  )
}

///|
let countable_union_of_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_INC",
)

///|
/// `COUNTABLE_UNION_OF_INC`
pub fn countable_union_of_inc() -> @kernel.Thm {
  countable_union_of_inc_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_INC
fn step_208() -> Unit raise {
  let t1865 = @simp.simp_tac(
    @list.List([@sets.intersection_of_inc(), countable_sing()]),
  )
  countable_intersection_of_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, P(s) → INTERSECTION_OF(COUNTABLE, P, s)"),
      t1865,
    ),
  )
}

///|
let countable_intersection_of_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_INC",
)

///|
/// `COUNTABLE_INTERSECTION_OF_INC`
pub fn countable_intersection_of_inc() -> @kernel.Thm {
  countable_intersection_of_inc_c.get()
}

///|
/// COUNTABLE_UNION_OF_COMPLEMENT
fn step_209() -> Unit raise {
  let t1872 = @simp.asm_rewrite_tac(
    @list.List([@sets.image_id(), @sets.compl_compl()]),
  )
  let t1871 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(f : (_) -> _)((y : _)) | IN(y, IMAGE((g : (_) -> _), (s : (_) -> Bool)))} == IMAGE((x : _) => f(g(x)), s)"),
      ),
    ]),
  )
  let t1870 = @simp.once_rewrite_tac(
    @list.List([@sets.unions_inters(), @sets.inters_unions()]),
  )
  let t1869 = @simp.asm_simp_tac(
    @list.List([countable_image(), @sets.forall_in_image(), @sets.compl_compl()]),
  )
  let t1868 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((c : (A) -> Bool) => DIFF(UNIV, c), (u : ((A) -> Bool) -> Bool))"),
  )
  let t1867 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1866 = @simp.rewrite_tac(
    @list.List([@sets.union_of(), @sets.intersection_of()]),
  )
  let t1873 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1866),
                @tactics.eq_tac,
              ),
              t1867,
            ),
            t1868,
          ),
          t1869,
        ),
        t1870,
      ),
      t1871,
    ),
    t1872,
  )
  countable_union_of_complement_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, UNION_OF(COUNTABLE, P, s) == INTERSECTION_OF(COUNTABLE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))"),
      t1873,
    ),
  )
}

///|
let countable_union_of_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_COMPLEMENT",
)

///|
/// `COUNTABLE_UNION_OF_COMPLEMENT`
pub fn countable_union_of_complement() -> @kernel.Thm {
  countable_union_of_complement_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_COMPLEMENT
fn step_210() -> Unit raise {
  let t1874 = @simp.rewrite_tac(
    @list.List([@class.eta_ax(), @sets.compl_compl()]),
  )
  let t1875 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([countable_union_of_complement()])),
    t1874,
  )
  countable_intersection_of_complement_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) == UNION_OF(COUNTABLE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))"),
      t1875,
    ),
  )
}

///|
let countable_intersection_of_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_COMPLEMENT",
)

///|
/// `COUNTABLE_INTERSECTION_OF_COMPLEMENT`
pub fn countable_intersection_of_complement() -> @kernel.Thm {
  countable_intersection_of_complement_c.get()
}

///|
/// COUNTABLE_UNION_OF_EXPLICIT
fn step_211() -> Unit raise {
  let t1894 = @simp.simp_tac(
    @list.List([@sets.simple_image(), countable_image(), countable_subset_num()]),
  )
  let t1893 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t1892 = @tactics.exists_tac(
    @term_syntax.parse_term("{(t : (Num, A) -> Bool)((n : Num)) | IN(n, UNIV)}"),
  )
  let t1895 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(t : (Num, A) -> Bool)")),
          @tactics.strip_tac,
        ),
        t1892,
      ),
      t1893,
    ),
    t1894,
  )
  let t1889 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1888 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1887 = @simp.asm_rewrite_tac(@list.List([]))
  let t1890 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @tactics.mp_tac(
            @bool.ispec(
              @term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"),
              countable_as_image(),
            ),
          ),
        ),
        t1887,
      ),
      t1888,
    ),
    t1889,
  )
  let t1886 = @simp.asm_rewrite_tac(
    @list.List([@sets.unions_gspec(), @sets.not_in_empty(), @sets.empty_gspec()]),
  )
  let t1885 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ({} : (A) -> Bool)"))
  let t1884 = @tactics.disch_then(fn(
    x1883 : @kernel.Thm,
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
      x1882 : @list.List[@kernel.Thm],
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
        x1881 : @kernel.Thm,
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
          x1878 : @kernel.Thm,
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
          let s1879 = @tactics.subst1_tac(x1878)
          fn(
            x1880 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1879(x1880)
          }
        })(@equal.sym(x1881))
      })(@lib.last(x1882))
    })(@bool.conjuncts_rule(x1883))
  })
  let t1891 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([@sets.unions_0()])),
          t1884,
        ),
        t1885,
      ),
      t1886,
    ),
    t1890,
  ])
  let t1877 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t1896 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)")),
        t1877,
      ),
      t1891,
    ),
    t1895,
  ])
  let t1876 = @simp.rewrite_tac(
    @list.List([@sets.union_of(), @theorems.left_imp_exists_thm()]),
  )
  let t1897 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @tactics.eq_tac,
      ),
      t1876,
    ),
    t1896,
  )
  countable_union_of_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, P({}) → UNION_OF(COUNTABLE, P, s) == (∃ t : (Num, A) -> Bool, (∀ n : Num, P(t(n))) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == s)"),
      t1897,
    ),
  )
}

///|
let countable_union_of_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_EXPLICIT",
)

///|
/// `COUNTABLE_UNION_OF_EXPLICIT`
pub fn countable_union_of_explicit() -> @kernel.Thm {
  countable_union_of_explicit_c.get()
}

///|
/// COUNTABLE_UNION_OF_ASCENDING
fn step_212() -> Unit raise {
  let t1919 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t1918 = @simp.rewrite_tac(
    @list.List([@sets.unions_image(), @sets.in_elim_thm(), @sets.in_univ()]),
  )
  let t1917 = @simp.gen_rewrite_tac(
    fn(
      x1916 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1916
    },
    @list.List([@sets.extension()]),
  )
  let t1915 = @simp.rewrite_tac(
    @list.List([@sets.unions_gspec(), @sets.in_elim_thm(), @sets.in_univ()]),
  )
  let t1920 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x1914 : @kernel.Thm,
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
              x1913 : @list.List[@kernel.Thm],
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
                x1912 : @kernel.Thm,
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
                  x1909 : @kernel.Thm,
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
                  let s1910 = @tactics.subst1_tac(x1909)
                  fn(
                    x1911 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s1910(x1911)
                  }
                })(@equal.sym(x1912))
              })(@lib.last(x1913))
            })(@bool.conjuncts_rule(x1914))
          }),
          t1915,
        ),
        t1917,
      ),
      t1918,
    ),
    t1919,
  )
  let t1908 = @sets.set_tac(@list.List([]))
  let t1921 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.unions_gspec(), @arith.le()])),
    t1908,
  )
  let t1907 = @simp.asm_simp_tac(@list.List([@sets.unions_1()]))
  let t1905 = @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | x == (a : _)} == {f(a)}"))
  let t1906 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(f : (_) -> _)((x : _)) | (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)} == UNION({f((x : _)) | P(x)}, {f((x : _)) | Q(x)})"),
      ),
      t1905,
      @sets.unions_union(),
    ]),
  )
  let t1922 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @nums.induct_tac,
          @simp.rewrite_tac(@list.List([@arith.le()])),
        ),
        t1906,
      ),
      t1907,
    ),
    t1921,
    t1920,
  ])
  let t1904 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1903 = @simp.rewrite_tac(@list.List([]))
  let t1902 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.forall_in_image(), @sets.in_univ()])),
  )
  let t1901 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => UNIONS({(t : (Num, A) -> Bool)((m : Num)) | m <= n})"),
  )
  let t1900 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : (Num, A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1899 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t1898 = @simp.asm_simp_tac(@list.List([countable_union_of_explicit()]))
  let t1923 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t1898,
                  ),
                  @tactics.eq_tac,
                ),
                t1899,
              ),
              t1900,
            ),
            t1901,
          ),
          t1902,
        ),
        t1903,
      ),
      t1904,
    ),
    t1922,
  )
  countable_union_of_ascending_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, P({}) && (∀ t : (A) -> Bool, ∀ u : (A) -> Bool, P(t) && P(u) → P(UNION(t, u))) → UNION_OF(COUNTABLE, P, s) == (∃ t : (Num, A) -> Bool, (∀ n : Num, P(t(n))) && (∀ n : Num, SUBSET(t(n), t(SUC(n)))) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == s)"),
      t1923,
    ),
  )
}

///|
let countable_union_of_ascending_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_ASCENDING",
)

///|
/// `COUNTABLE_UNION_OF_ASCENDING`
pub fn countable_union_of_ascending() -> @kernel.Thm {
  countable_union_of_ascending_c.get()
}

///|
/// COUNTABLE_UNION_OF_IDEMPOT
fn step_213() -> Unit raise {
  let t1959 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1958 = @simp.rewrite_tac(@list.List([@sets.exists_in_gspec()]))
  let t1956 = @simp.rewrite_tac(@list.List([@sets.unions_image()]))
  let t1957 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1956])
  let t1955 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_image(), @sets.forall_in_gspec()]),
  )
  let t1954 = @simp.asm_simp_tac(
    @list.List([countable_image(), countable_product_dependent()]),
  )
  let t1953 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})"),
  )
  let t1952 = @tactics.x_gen_tac(
    @term_syntax.parse_term("(f : ((A) -> Bool, (A) -> Bool) -> Bool)"),
  )
  let t1951 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1950 = @simp.gen_rewrite_tac(
    fn(
      x1949 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1943 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1944 = @equal.land_conv(x1943)
        fn(x1945 : @kernel.Term) -> @kernel.Thm raise { s1944(x1945) }
      })(
        (fn(
          x1946 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1947 = @equal.once_depth_conv(x1946)
          fn(x1948 : @kernel.Term) -> @kernel.Thm raise { s1947(x1948) }
        })(x1949),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1942 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1935 : @kernel.Thm,
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
        let s1936 = @tactics.mp_tac(x1935)
        fn(
          x1937 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1936(x1937)
        }
      },
      fn(
        x1941 : @kernel.Thm,
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
          x1938 : @kernel.Thm,
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
          let s1939 = @tactics.subst1_tac(x1938)
          fn(
            x1940 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1939(x1940)
          }
        })(@equal.sym(x1941))
      },
    ),
  )
  let t1934 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1928 : @kernel.Thm,
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
        let s1929 = @tactics.assume_tac(x1928)
        fn(
          x1930 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1929(x1930)
        }
      },
      fn(
        x1931 : @kernel.Thm,
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
        let s1932 = @tactics.mp_tac(x1931)
        fn(
          x1933 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1932(x1933)
        }
      },
    ),
  )
  let t1927 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))
  let t1926 = @simp.rewrite_tac(
    @list.List([@sets.union_of(), @theorems.left_imp_exists_thm()]),
  )
  let t1925 = @simp.rewrite_tac(@list.List([countable_union_of_inc()]))
  let t1924 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1960 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
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
                                        @tactics.gen_tac,
                                        @simp.rewrite_tac(
                                          @list.List([@class.fun_eq_thm()]),
                                        ),
                                      ),
                                      t1924,
                                    ),
                                    @tactics.eq_tac,
                                  ),
                                  t1925,
                                ),
                                t1926,
                              ),
                              t1927,
                            ),
                            t1934,
                          ),
                          t1942,
                        ),
                        t1950,
                      ),
                      t1951,
                    ),
                    t1952,
                  ),
                  @tactics.disch_tac,
                ),
                t1953,
              ),
              t1954,
            ),
            t1955,
          ),
          @tactics.conj_tac,
        ),
        t1957,
      ),
      t1958,
    ),
    t1959,
  )
  countable_union_of_idempot_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, UNION_OF(COUNTABLE, P)) == UNION_OF(COUNTABLE, P)"),
      t1960,
    ),
  )
}

///|
let countable_union_of_idempot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_IDEMPOT",
)

///|
/// `COUNTABLE_UNION_OF_IDEMPOT`
pub fn countable_union_of_idempot() -> @kernel.Thm {
  countable_union_of_idempot_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_IDEMPOT
fn step_214() -> Unit raise {
  let t1961 = @simp.rewrite_tac(@list.List([countable_union_of_idempot()]))
  let t1962 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.compl_compl(),
        @class.eta_ax(),
        @simp.rewrite_rule(
          @list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]),
        )(countable_intersection_of_complement()),
      ]),
    ),
    t1961,
  )
  countable_intersection_of_idempot_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, INTERSECTION_OF(COUNTABLE, P)) == INTERSECTION_OF(COUNTABLE, P)"),
      t1962,
    ),
  )
}

///|
let countable_intersection_of_idempot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_IDEMPOT",
)

///|
/// `COUNTABLE_INTERSECTION_OF_IDEMPOT`
pub fn countable_intersection_of_idempot() -> @kernel.Thm {
  countable_intersection_of_idempot_c.get()
}

///|
/// COUNTABLE_UNION_OF_UNIONS
fn step_215() -> Unit raise {
  let t1967 = @simp.asm_rewrite_tac(@list.List([]))
  let t1966 = @tactics.exists_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))
  let t1965 = @simp.rewrite_tac(@list.List([]))
  let t1964 = @simp.once_rewrite_tac(@list.List([@sets.union_of()]))
  let t1963 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(countable_union_of_idempot())]),
  )
  let t1968 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1963),
          t1964,
        ),
        t1965,
      ),
      t1966,
    ),
    t1967,
  )
  countable_union_of_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, COUNTABLE(u) && (∀ s : (A) -> Bool, IN(s, u) → UNION_OF(COUNTABLE, P, s)) → UNION_OF(COUNTABLE, P, UNIONS(u))"),
      t1968,
    ),
  )
}

///|
let countable_union_of_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_UNIONS",
)

///|
/// `COUNTABLE_UNION_OF_UNIONS`
pub fn countable_union_of_unions() -> @kernel.Thm {
  countable_union_of_unions_c.get()
}

///|
/// COUNTABLE_UNION_OF_UNION
fn step_216() -> Unit raise {
  let t1972 = @simp.rewrite_tac(
    @list.List([countable_empty(), @sets.not_in_empty()]),
  )
  let t1971 = @simp.asm_rewrite_tac(
    @list.List([countable_insert(), @sets.forall_in_insert()]),
  )
  let t1970 = @tactics.match_mp_tac(countable_union_of_unions())
  let t1969 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_2())]))
  let t1973 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1969),
        t1970,
      ),
      t1971,
    ),
    t1972,
  )
  countable_union_of_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) → UNION_OF(COUNTABLE, P, UNION(s, t))"),
      t1973,
    ),
  )
}

///|
let countable_union_of_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_UNION",
)

///|
/// `COUNTABLE_UNION_OF_UNION`
pub fn countable_union_of_union() -> @kernel.Thm {
  countable_union_of_union_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_INTERS
fn step_217() -> Unit raise {
  let t1978 = @simp.asm_rewrite_tac(@list.List([]))
  let t1977 = @tactics.exists_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))
  let t1976 = @simp.rewrite_tac(@list.List([]))
  let t1975 = @simp.once_rewrite_tac(@list.List([@sets.intersection_of()]))
  let t1974 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(countable_intersection_of_idempot())]),
  )
  let t1979 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1974),
          t1975,
        ),
        t1976,
      ),
      t1977,
    ),
    t1978,
  )
  countable_intersection_of_inters_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, COUNTABLE(u) && (∀ s : (A) -> Bool, IN(s, u) → INTERSECTION_OF(COUNTABLE, P, s)) → INTERSECTION_OF(COUNTABLE, P, INTERS(u))"),
      t1979,
    ),
  )
}

///|
let countable_intersection_of_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_INTERS",
)

///|
/// `COUNTABLE_INTERSECTION_OF_INTERS`
pub fn countable_intersection_of_inters() -> @kernel.Thm {
  countable_intersection_of_inters_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_INTER
fn step_218() -> Unit raise {
  let t1983 = @simp.rewrite_tac(
    @list.List([countable_empty(), @sets.not_in_empty()]),
  )
  let t1982 = @simp.asm_rewrite_tac(
    @list.List([countable_insert(), @sets.forall_in_insert()]),
  )
  let t1981 = @tactics.match_mp_tac(countable_intersection_of_inters())
  let t1980 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_2())]))
  let t1984 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1980),
        t1981,
      ),
      t1982,
    ),
    t1983,
  )
  countable_intersection_of_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) → INTERSECTION_OF(COUNTABLE, P, INTER(s, t))"),
      t1984,
    ),
  )
}

///|
let countable_intersection_of_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_INTER",
)

///|
/// `COUNTABLE_INTERSECTION_OF_INTER`
pub fn countable_intersection_of_inter() -> @kernel.Thm {
  countable_intersection_of_inter_c.get()
}

///|
/// COUNTABLE_UNION_OF_INTER_EQ
fn step_219() -> Unit raise {
  let t2000 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1999 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      countable_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t2001 = @tactics.replicate_tac(
    2,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(countable_union_of_unions()),
        t1999,
      ),
      t2000,
    ),
  )
  let t1998 = @simp.asm_rewrite_tac(@list.List([@sets.inter_unions()]))
  let t1997 = @tactics.disch_then(fn(
    x1996 : @kernel.Thm,
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
    @tactics.strip_assume_tac(@equal.gsym(x1996))
  })
  let t1995 = @simp.rewrite_tac(@list.List([]))
  let t1994 = @simp.gen_rewrite_tac(
    fn(
      x1993 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1987 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1988 = @equal.land_conv(x1987)
        fn(x1989 : @kernel.Term) -> @kernel.Thm raise { s1988(x1989) }
      })(
        (fn(
          x1990 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1991 = @equal.once_depth_conv(x1990)
          fn(x1992 : @kernel.Term) -> @kernel.Thm raise { s1991(x1992) }
        })(x1993),
      )
    },
    @list.List([@sets.union_of()]),
  )
  let t1986 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1985 = @list.List([
    @meson.meson_tac(@list.List([countable_union_of_inc()])),
    @tactics.disch_tac,
  ])
  let t2002 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
                t1985,
              ),
              t1986,
            ),
            t1994,
          ),
          t1995,
        ),
        t1997,
      ),
      t1998,
    ),
    t2001,
  )
  countable_union_of_inter_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) → UNION_OF(COUNTABLE, P, INTER(s, t))) == (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → UNION_OF(COUNTABLE, P, INTER(s, t)))"),
      t2002,
    ),
  )
}

///|
let countable_union_of_inter_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_INTER_EQ",
)

///|
/// `COUNTABLE_UNION_OF_INTER_EQ`
pub fn countable_union_of_inter_eq() -> @kernel.Thm {
  countable_union_of_inter_eq_c.get()
}

///|
/// COUNTABLE_UNION_OF_INTER
fn step_220() -> Unit raise {
  let t2003 = @meson.meson_tac(@list.List([countable_union_of_inc()]))
  let t2004 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([countable_union_of_inter_eq()])),
    t2003,
  )
  countable_union_of_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(INTER(s, t))) → (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) → UNION_OF(COUNTABLE, P, INTER(s, t)))"),
      t2004,
    ),
  )
}

///|
let countable_union_of_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_INTER",
)

///|
/// `COUNTABLE_UNION_OF_INTER`
pub fn countable_union_of_inter() -> @kernel.Thm {
  countable_union_of_inter_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_UNION_EQ
fn step_221() -> Unit raise {
  let t2010 = @simp.rewrite_tac(@list.List([@sets.compl_compl()]))
  let t2009 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.compl_compl()]),
        @term_syntax.parse_term("(∀ s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (∀ s : (_) -> Bool, P(s))"),
      ),
    ]),
  )
  let t2008 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == DIFF(UNIV, UNION(DIFF(UNIV, s), DIFF(UNIV, t)))"),
      ),
    ]),
  )
  let t2007 = @simp.rewrite_tac(@list.List([countable_union_of_inter_eq()]))
  let t2006 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.compl_compl()]),
        @term_syntax.parse_term("(∀ s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (∀ s : (_) -> Bool, P(s))"),
      ),
    ]),
  )
  let t2005 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("DIFF(UNIV, UNION((s : (_) -> Bool), (t : (_) -> Bool))) == INTER(DIFF(UNIV, s), DIFF(UNIV, t))"),
      ),
    ]),
  )
  let t2011 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(
                @list.List([countable_intersection_of_complement()]),
              ),
              t2005,
            ),
            t2006,
          ),
          t2007,
        ),
        t2008,
      ),
      t2009,
    ),
    t2010,
  )
  countable_intersection_of_union_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) → INTERSECTION_OF(COUNTABLE, P, UNION(s, t))) == (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → INTERSECTION_OF(COUNTABLE, P, UNION(s, t)))"),
      t2011,
    ),
  )
}

///|
let countable_intersection_of_union_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_UNION_EQ",
)

///|
/// `COUNTABLE_INTERSECTION_OF_UNION_EQ`
pub fn countable_intersection_of_union_eq() -> @kernel.Thm {
  countable_intersection_of_union_eq_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_UNION
fn step_222() -> Unit raise {
  let t2012 = @meson.meson_tac(@list.List([countable_intersection_of_inc()]))
  let t2013 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([countable_intersection_of_union_eq()])),
    t2012,
  )
  countable_intersection_of_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(UNION(s, t))) → (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) → INTERSECTION_OF(COUNTABLE, P, UNION(s, t)))"),
      t2013,
    ),
  )
}

///|
let countable_intersection_of_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_UNION",
)

///|
/// `COUNTABLE_INTERSECTION_OF_UNION`
pub fn countable_intersection_of_union() -> @kernel.Thm {
  countable_intersection_of_union_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_UNIONS_NONEMPTY
fn step_223() -> Unit raise {
  let t2026 = @simp.asm_simp_tac(@list.List([]))
  let t2023 = @drule.match_mp(countable_intersection_of_union())
  let t2025 = @tactics.first_assum(fn(
    x2024 : @kernel.Thm,
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
    @tactics.match_mp_tac(t2023(x2024))
  })
  let t2022 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2021 = @simp.rewrite_tac(@list.List([@sets.unions_insert()]))
  let t2020 = @simp.asm_simp_tac(@list.List([@sets.unions_1()]))
  let t2019 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t2017 = @term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)")
  let t2018 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t2017]),
  )
  let t2016 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.not_insert_empty()]),
  )
  let t2015 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2014 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm()]),
    ),
  )
  let t2027 = @tactics.then_tac(
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
                          @simp.rewrite_tac(
                            @list.List([
                              @theorems.imp_conj(),
                              @theorems.right_forall_imp_thm(),
                            ]),
                          ),
                          @tactics.gen_tac,
                        ),
                        @tactics.disch_tac,
                      ),
                      t2014,
                    ),
                    t2015,
                  ),
                  t2016,
                ),
                t2018,
              ),
              t2019,
            ),
            t2020,
          ),
          t2021,
        ),
        t2022,
      ),
      t2025,
    ),
    t2026,
  )
  countable_intersection_of_unions_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(UNION(s, t))) && FINITE(u) && !(u == {}) && (∀ s : (A) -> Bool, IN(s, u) → INTERSECTION_OF(COUNTABLE, P, s)) → INTERSECTION_OF(COUNTABLE, P, UNIONS(u))"),
      t2027,
    ),
  )
}

///|
let countable_intersection_of_unions_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_UNIONS_NONEMPTY",
)

///|
/// `COUNTABLE_INTERSECTION_OF_UNIONS_NONEMPTY`
pub fn countable_intersection_of_unions_nonempty() -> @kernel.Thm {
  countable_intersection_of_unions_nonempty_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_UNIONS
fn step_224() -> Unit raise {
  let t2038 = @simp.asm_rewrite_tac(@list.List([]))
  let t2037 = @tactics.match_mp_tac(countable_intersection_of_unions_nonempty())
  let t2036 = @simp.asm_rewrite_tac(@list.List([@sets.unions_0()]))
  let t2035 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t2034 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2028 : @kernel.Thm,
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
        let s2029 = @tactics.assume_tac(x2028)
        fn(
          x2030 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2029(x2030)
        }
      },
      fn(
        x2031 : @kernel.Thm,
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
        let s2032 = @tactics.mp_tac(x2031)
        fn(
          x2033 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2032(x2033)
        }
      },
    ),
  )
  let t2039 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2034),
            t2035,
          ),
          t2036,
        ),
        @tactics.strip_tac,
      ),
      t2037,
    ),
    t2038,
  )
  countable_intersection_of_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, P, {}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(UNION(s, t))) && FINITE(u) && (∀ s : (A) -> Bool, IN(s, u) → INTERSECTION_OF(COUNTABLE, P, s)) → INTERSECTION_OF(COUNTABLE, P, UNIONS(u))"),
      t2039,
    ),
  )
}

///|
let countable_intersection_of_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_UNIONS",
)

///|
/// `COUNTABLE_INTERSECTION_OF_UNIONS`
pub fn countable_intersection_of_unions() -> @kernel.Thm {
  countable_intersection_of_unions_c.get()
}

///|
/// COUNTABLE_UNION_OF_INTERS_NONEMPTY
fn step_225() -> Unit raise {
  let t2052 = @simp.asm_simp_tac(@list.List([]))
  let t2049 = @drule.match_mp(countable_union_of_inter())
  let t2051 = @tactics.first_assum(fn(
    x2050 : @kernel.Thm,
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
    @tactics.match_mp_tac(t2049(x2050))
  })
  let t2048 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2047 = @simp.rewrite_tac(@list.List([@sets.inters_insert()]))
  let t2046 = @simp.asm_simp_tac(@list.List([@sets.inters_1()]))
  let t2045 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t2043 = @term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)")
  let t2044 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t2043]),
  )
  let t2042 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.not_insert_empty()]),
  )
  let t2041 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2040 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm()]),
    ),
  )
  let t2053 = @tactics.then_tac(
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
                          @simp.rewrite_tac(
                            @list.List([
                              @theorems.imp_conj(),
                              @theorems.right_forall_imp_thm(),
                            ]),
                          ),
                          @tactics.gen_tac,
                        ),
                        @tactics.disch_tac,
                      ),
                      t2040,
                    ),
                    t2041,
                  ),
                  t2042,
                ),
                t2044,
              ),
              t2045,
            ),
            t2046,
          ),
          t2047,
        ),
        t2048,
      ),
      t2051,
    ),
    t2052,
  )
  countable_union_of_inters_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(INTER(s, t))) && FINITE(u) && !(u == {}) && (∀ s : (A) -> Bool, IN(s, u) → UNION_OF(COUNTABLE, P, s)) → UNION_OF(COUNTABLE, P, INTERS(u))"),
      t2053,
    ),
  )
}

///|
let countable_union_of_inters_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_INTERS_NONEMPTY",
)

///|
/// `COUNTABLE_UNION_OF_INTERS_NONEMPTY`
pub fn countable_union_of_inters_nonempty() -> @kernel.Thm {
  countable_union_of_inters_nonempty_c.get()
}

///|
/// COUNTABLE_UNION_OF_INTERS
fn step_226() -> Unit raise {
  let t2064 = @simp.asm_rewrite_tac(@list.List([]))
  let t2063 = @tactics.match_mp_tac(countable_union_of_inters_nonempty())
  let t2062 = @simp.asm_rewrite_tac(@list.List([@sets.inters_0()]))
  let t2061 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t2060 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2054 : @kernel.Thm,
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
        let s2055 = @tactics.assume_tac(x2054)
        fn(
          x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2055(x2056)
        }
      },
      fn(
        x2057 : @kernel.Thm,
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
        let s2058 = @tactics.mp_tac(x2057)
        fn(
          x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2058(x2059)
        }
      },
    ),
  )
  let t2065 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2060),
            t2061,
          ),
          t2062,
        ),
        @tactics.strip_tac,
      ),
      t2063,
    ),
    t2064,
  )
  countable_union_of_inters_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, P, UNIV) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(INTER(s, t))) && FINITE(u) && (∀ s : (A) -> Bool, IN(s, u) → UNION_OF(COUNTABLE, P, s)) → UNION_OF(COUNTABLE, P, INTERS(u))"),
      t2065,
    ),
  )
}

///|
let countable_union_of_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_INTERS",
)

///|
/// `COUNTABLE_UNION_OF_INTERS`
pub fn countable_union_of_inters() -> @kernel.Thm {
  countable_union_of_inters_c.get()
}

///|
/// COUNTABLE_DISJOINT_UNION_OF_IDEMPOT
fn step_227() -> Unit raise {
  let t2116 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2117 = @list.List([@meson.asm_meson_tac(@list.List([])), t2116])
  let t2115 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.pairwise()])),
  )
  let t2114 = @class.asm_cases_tac(@term_syntax.parse_term("(s2 : (A) -> Bool) == (s1 : (A) -> Bool)"))
  let t2113 = @tactics.disch_then(fn(
    x2112 : @kernel.Thm,
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
    @tactics.all_tac
  })
  let t2108 = @term_syntax.parse_term("(t2 : (A) -> Bool)")
  let t2109 = @term_syntax.parse_term("(s2 : (A) -> Bool)")
  let t2110 = @term_syntax.parse_term("(t1 : (A) -> Bool)")
  let t2111 = @tactics.map_every(
    fn(
      x2106 : @kernel.Term,
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
      let x = x2106
      @tactics.then_tac(@tactics.x_gen_tac(x), @tactics.disch_tac)
    },
    @list.List([@term_syntax.parse_term("(s1 : (A) -> Bool)"), t2110, t2109, t2108]),
  )
  let t2105 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @sets.forall_in_gspec(),
    ]),
  )
  let t2103 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2104 = @list.List([
    @simp.rewrite_tac(@list.List([@sets.pairwise()])),
    t2103,
  ])
  let t2102 = @simp.rewrite_tac(
    @list.List([
      @sets.unions_image(),
      @sets.exists_in_gspec(),
      @sets.pairwise_image(),
    ]),
  )
  let t2101 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_image(), @sets.forall_in_gspec()]),
  )
  let t2100 = @simp.asm_simp_tac(
    @list.List([countable_image(), countable_product_dependent()]),
  )
  let t2099 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})"),
  )
  let t2098 = @tactics.x_gen_tac(
    @term_syntax.parse_term("(f : ((A) -> Bool, (A) -> Bool) -> Bool)"),
  )
  let t2097 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t2096 = @simp.gen_rewrite_tac(
    fn(
      x2095 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2089 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2090 = @equal.land_conv(x2089)
        fn(x2091 : @kernel.Term) -> @kernel.Thm raise { s2090(x2091) }
      })(
        (fn(
          x2092 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2093 = @equal.once_depth_conv(x2092)
          fn(x2094 : @kernel.Term) -> @kernel.Thm raise { s2093(x2094) }
        })(x2095),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t2088 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2081 : @kernel.Thm,
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
        let s2082 = @tactics.mp_tac(x2081)
        fn(
          x2083 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2082(x2083)
        }
      },
      fn(
        x2087 : @kernel.Thm,
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
          x2084 : @kernel.Thm,
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
          let s2085 = @tactics.subst1_tac(x2084)
          fn(
            x2086 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2085(x2086)
          }
        })(@equal.sym(x2087))
      },
    ),
  )
  let t2080 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2074 : @kernel.Thm,
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
        let s2075 = @tactics.assume_tac(x2074)
        fn(
          x2076 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2075(x2076)
        }
      },
      fn(
        x2077 : @kernel.Thm,
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
        let s2078 = @tactics.mp_tac(x2077)
        fn(
          x2079 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2078(x2079)
        }
      },
    ),
  )
  let t2073 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))
  let t2072 = @simp.rewrite_tac(
    @list.List([@sets.union_of(), @theorems.left_imp_exists_thm()]),
  )
  let t2069 = @simp.rewrite_tac(
    @list.List([countable_sing(), @sets.pairwise_sing()]),
  )
  let t2068 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t2067 = @simp.rewrite_tac(
    @list.List([@sets.inter(), @sets.in_elim_thm()]),
  )
  let t2070 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
            @sets.union_of_inc(),
          ),
        ),
        t2067,
      ),
      t2068,
    ),
    t2069,
  )
  let t2071 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == ((x : _) => s(x) && t(x))")),
      ]),
    ),
    t2070,
  ])
  let t2066 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t2118 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
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
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.gen_tac,
                                                  @simp.rewrite_tac(
                                                    @list.List([
                                                      @class.fun_eq_thm(),
                                                    ]),
                                                  ),
                                                ),
                                                t2066,
                                              ),
                                              @tactics.eq_tac,
                                            ),
                                            t2071,
                                          ),
                                          t2072,
                                        ),
                                        t2073,
                                      ),
                                      t2080,
                                    ),
                                    t2088,
                                  ),
                                  t2096,
                                ),
                                t2097,
                              ),
                              t2098,
                            ),
                            @tactics.disch_tac,
                          ),
                          t2099,
                        ),
                        t2100,
                      ),
                      t2101,
                    ),
                    t2102,
                  ),
                  @tactics.conj_tac,
                ),
                t2104,
              ),
              t2105,
            ),
            t2111,
          ),
          t2113,
        ),
        t2114,
      ),
      t2115,
    ),
    t2117,
  )
  countable_disjoint_union_of_idempot_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), P)) == UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), P)"),
      t2118,
    ),
  )
}

///|
let countable_disjoint_union_of_idempot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_DISJOINT_UNION_OF_IDEMPOT",
)

///|
/// `COUNTABLE_DISJOINT_UNION_OF_IDEMPOT`
pub fn countable_disjoint_union_of_idempot() -> @kernel.Thm {
  countable_disjoint_union_of_idempot_c.get()
}

///|
/// COUNTABLE_ASCENDING_CHAIN
fn step_228() -> Unit raise {
  let t2139 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t2138 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.in_elim_thm(),
      @sets.in_univ(),
      @iterate.in_numseg(),
      @arith.le_0(),
    ]),
  )
  let t2137 = @simp.rewrite_tac(
    @list.List([@sets.unions_gspec(), @sets.unions_image()]),
  )
  let t2140 = @tactics.then_tac(
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t2137), t2138),
    t2139,
  )
  let t2136 = @sets.set_tac(@list.List([]))
  let t2141 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([@iterate.numseg_clauses(), @arith.le_0()])),
    ),
    t2136,
  )
  let t2135 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2133 = @sets.set_rule(@term_syntax.parse_term("(UNION((a : (_) -> Bool), (b : (_) -> Bool)) == b) == SUBSET(a, b)"))
  let t2134 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("(UNION((a : (_) -> Bool), (b : (_) -> Bool)) == a) == SUBSET(b, a)")),
      t2133,
    ]),
  )
  let t2132 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("IN((a : (_) -> Bool), (f : ((_) -> Bool) -> Bool)) && IN((b : (_) -> Bool), f) && (UNION(a, b) == a || UNION(a, b) == b) → IN(UNION(a, b), f)"),
    ),
  )
  let t2131 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2130 = @simp.rewrite_tac(
    @list.List([@sets.unions_0(), @sets.unions_insert(), @sets.union_empty()]),
  )
  let t2142 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.asm_rewrite_tac(
                  @list.List([
                    @iterate.numseg_clauses(),
                    @arith.le_0(),
                    @sets.image_clauses(),
                  ]),
                ),
              ),
              t2130,
            ),
            t2131,
          ),
          t2132,
        ),
        t2134,
      ),
      t2135,
    ),
    t2141,
    t2140,
  ])
  let t2129 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2128 = @simp.asm_rewrite_tac(@list.List([]))
  let t2127 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => UNIONS(IMAGE((b : (Num, A) -> Bool), op_dot_dot(0, n)))"),
  )
  let t2126 = @tactics.disch_then(fn(
    x2125 : @kernel.Thm,
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
      x2122 : @kernel.Thm,
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
      let s2123 = @tactics.assume_tac(x2122)
      fn(
        x2124 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2123(x2124)
      }
    })(@equal.sym(x2125))
  })
  let t2121 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (Num, A) -> Bool)"))
  let t2120 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t2119 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"), countable_as_image()),
  )
  let t2143 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2119,
                ),
                t2120,
              ),
              t2121,
            ),
            t2126,
          ),
          t2127,
        ),
        t2128,
      ),
      t2129,
    ),
    t2142,
  )
  countable_ascending_chain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, IN(s, f) && IN(t, f) → SUBSET(s, t) || SUBSET(t, s)) → (∃ u : (Num, A) -> Bool, (∀ n : Num, IN(u(n), f)) && (∀ n : Num, SUBSET(u(n), u(SUC(n)))) && UNIONS({u((n : Num)) | IN(n, UNIV)}) == UNIONS(f))"),
      t2143,
    ),
  )
}

///|
let countable_ascending_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_ASCENDING_CHAIN",
)

///|
/// `COUNTABLE_ASCENDING_CHAIN`
pub fn countable_ascending_chain() -> @kernel.Thm {
  countable_ascending_chain_c.get()
}

///|
/// COUNTABLE_DESCENDING_CHAIN
fn step_229() -> Unit raise {
  let t2164 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t2163 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.in_elim_thm(),
      @sets.in_univ(),
      @iterate.in_numseg(),
      @arith.le_0(),
    ]),
  )
  let t2162 = @simp.rewrite_tac(
    @list.List([@sets.inters_gspec(), @sets.inters_image()]),
  )
  let t2165 = @tactics.then_tac(
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t2162), t2163),
    t2164,
  )
  let t2161 = @sets.set_tac(@list.List([]))
  let t2166 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([@iterate.numseg_clauses(), @arith.le_0()])),
    ),
    t2161,
  )
  let t2160 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2158 = @sets.set_rule(@term_syntax.parse_term("(INTER((a : (_) -> Bool), (b : (_) -> Bool)) == b) == SUBSET(b, a)"))
  let t2159 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("(INTER((a : (_) -> Bool), (b : (_) -> Bool)) == a) == SUBSET(a, b)")),
      t2158,
    ]),
  )
  let t2157 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("IN((a : (_) -> Bool), (f : ((_) -> Bool) -> Bool)) && IN((b : (_) -> Bool), f) && (INTER(a, b) == a || INTER(a, b) == b) → IN(INTER(a, b), f)"),
    ),
  )
  let t2156 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2155 = @simp.rewrite_tac(
    @list.List([@sets.inters_0(), @sets.inters_insert(), @sets.inter_univ()]),
  )
  let t2167 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.asm_rewrite_tac(
                  @list.List([
                    @iterate.numseg_clauses(),
                    @arith.le_0(),
                    @sets.image_clauses(),
                  ]),
                ),
              ),
              t2155,
            ),
            t2156,
          ),
          t2157,
        ),
        t2159,
      ),
      t2160,
    ),
    t2166,
    t2165,
  ])
  let t2154 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2153 = @simp.asm_rewrite_tac(@list.List([]))
  let t2152 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => INTERS(IMAGE((b : (Num, A) -> Bool), op_dot_dot(0, n)))"),
  )
  let t2151 = @tactics.disch_then(fn(
    x2150 : @kernel.Thm,
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
      x2147 : @kernel.Thm,
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
      let s2148 = @tactics.assume_tac(x2147)
      fn(
        x2149 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2148(x2149)
      }
    })(@equal.sym(x2150))
  })
  let t2146 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (Num, A) -> Bool)"))
  let t2145 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t2144 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"), countable_as_image()),
  )
  let t2168 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2144,
                ),
                t2145,
              ),
              t2146,
            ),
            t2151,
          ),
          t2152,
        ),
        t2153,
      ),
      t2154,
    ),
    t2167,
  )
  countable_descending_chain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, IN(s, f) && IN(t, f) → SUBSET(s, t) || SUBSET(t, s)) → (∃ u : (Num, A) -> Bool, (∀ n : Num, IN(u(n), f)) && (∀ n : Num, SUBSET(u(SUC(n)), u(n))) && INTERS({u((n : Num)) | IN(n, UNIV)}) == INTERS(f))"),
      t2168,
    ),
  )
}

///|
let countable_descending_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_DESCENDING_CHAIN",
)

///|
/// `COUNTABLE_DESCENDING_CHAIN`
pub fn countable_descending_chain() -> @kernel.Thm {
  countable_descending_chain_c.get()
}

///|
/// CARD_EQ_LIST_GEN
fn step_230() -> Unit raise {
  let t2206 = @meson.asm_meson_tac(@list.List([]))
  let t2205 = @list.List([
    @tactics.all_tac,
    @tactics.first_x_assum(@tactics.match_mp_tac),
  ])
  let t2204 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2203 = @simp.rewrite_tac(
    @list.List([
      @lists.itlist(),
      @nums.suc_inj(),
      @lists.mem(),
      @lists.cons_11(),
    ]),
  )
  let t2202 = @simp.rewrite_tac(@list.List([@lists.length(), @nums.not_suc()]))
  let t2201 = @simp.simp_tac(
    @list.List([@lists.length_eq_nil(), @lists.length()]),
  )
  let t2200 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t2198 = @tactics.thenl(
    @tactics.conj_tac,
    @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac]),
  )
  let t2197 = @meson.asm_meson_tac(@list.List([]))
  let t2199 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @lists.list_induct_tac,
        @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.itlist()])),
      ),
      t2197,
    ),
    t2198,
  ])
  let t2196 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ l : List[A], (∀ x : A, MEM(x, l) → IN(x, (s : (A) -> Bool))) → IN(ITLIST((pair : (A, A) -> A), l, (b : A)), s)"),
    fn(
      x2193 : @kernel.Thm,
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
      let s2194 = @tactics.assume_tac(x2193)
      fn(
        x2195 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2194(x2195)
      }
    },
  )
  let t2192 = @simp.rewrite_tac(
    @list.List([
      @pair.pair_eq(),
      @theorems.right_exists_and_thm(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t2191 = @tactics.exists_tac(
    @term_syntax.parse_term("(l : List[A]) => (LENGTH(l), ITLIST((pair : (A, A) -> A), l, (b : A)))"),
  )
  let t2190 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @sets.infinite(),
        @sets.finite_empty(),
        @sets.member_not_empty(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t2189 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ b : A, IN(b, (s : (A) -> Bool))"),
    @tactics.choose_tac,
  )
  let t2188 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2187 = @tactics.x_gen_tac(@term_syntax.parse_term("(pair : (A, A) -> A)"))
  let t2186 = @simp.gen_rewrite_tac(
    fn(
      x2185 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2185
    },
    @list.List([@pair.forall_curry()]),
  )
  let t2184 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @theorems.left_imp_exists_thm()]),
  )
  let t2183 = @simp.rewrite_tac(
    @list.List([
      @sets.le_c(),
      mul_c(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t2181 = @simp.asm_rewrite_tac(@list.List([card_le_refl()]))
  let t2182 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(card_mul2_absorb_le()), t2181),
    @tactics.all_tac,
  ])
  let t2180 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_lt_eq_us_c(op_star_us_c((s : (A) -> Bool), s), s)"),
    fn(
      x2177 : @kernel.Thm,
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
      let s2178 = @tactics.mp_tac(x2177)
      fn(
        x2179 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2178(x2179)
      }
    },
  )
  let t2175 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(infinite_card_le()), card_le_refl()]),
  )
  let t2176 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(card_mul2_absorb_le()), t2175),
  ])
  let t2173 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, (A) -> Bool, (Num, A)) -> Bool)((UNIV : (Num) -> Bool), (s : (A) -> Bool))")
  let t2174 = @tactics.trans_tac(card_le_trans())(t2173)
  let t2171 = @simp.simp_tac(
    @list.List([@lists.cons_11(), @sets.in_elim_thm(), @lists.mem()]),
  )
  let t2170 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => [x]"))
  let t2172 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ()])),
        t2170,
      ),
      t2171,
    ),
  ])
  let t2169 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t2207 = @tactics.then_tac(
    @tactics.thenl(
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.thenl(
                                              @tactics.then_tac(
                                                @tactics.thenl(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.thenl(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.then_tac(
                                                              @tactics.gen_tac, @tactics.disch_tac,
                                                            ),
                                                            t2169,
                                                          ),
                                                          @tactics.conj_tac,
                                                        ),
                                                        t2172,
                                                      ),
                                                      t2174,
                                                    ),
                                                    @tactics.conj_tac,
                                                  ),
                                                  t2176,
                                                ),
                                                t2180,
                                              ),
                                              t2182,
                                            ),
                                            t2183,
                                          ),
                                          t2184,
                                        ),
                                        t2186,
                                      ),
                                      t2187,
                                    ),
                                    t2188,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t2189,
                              ),
                              t2190,
                            ),
                            t2191,
                          ),
                          t2192,
                        ),
                        t2196,
                      ),
                      t2199,
                    ),
                    t2200,
                  ),
                  @lists.list_induct_tac,
                ),
                t2201,
              ),
              @lists.list_induct_tac,
            ),
            t2202,
          ),
          t2203,
        ),
        t2204,
      ),
      t2205,
    ),
    t2206,
  )
  card_eq_list_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → op_eq_us_c({(l : List[A]) | ∀ x : A, MEM(x, l) → IN(x, s)}, s)"),
      t2207,
    ),
  )
}

///|
let card_eq_list_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_LIST_GEN",
)

///|
/// `CARD_EQ_LIST_GEN`
pub fn card_eq_list_gen() -> @kernel.Thm {
  card_eq_list_gen_c.get()
}

///|
/// CARD_EQ_LIST
fn step_231() -> Unit raise {
  let t2213 = @simp.rewrite_tac(
    @list.List([
      @sets.in_univ(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | true} == UNIV")),
    ]),
  )
  let t2211 = @drule.match_mp(card_eq_list_gen())
  let t2214 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x2212 : @kernel.Thm,
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
        x2208 : @kernel.Thm,
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
        let s2209 = @tactics.mp_tac(x2208)
        fn(
          x2210 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2209(x2210)
        }
      })(t2211(x2212))
    }),
    t2213,
  )
  card_eq_list_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (op_eq_us_c : ((List[A]) -> Bool, (A) -> Bool) -> Bool)((UNIV : (List[A]) -> Bool), (UNIV : (A) -> Bool))"),
      t2214,
    ),
  )
}

///|
let card_eq_list_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_LIST")

///|
/// `CARD_EQ_LIST`
pub fn card_eq_list() -> @kernel.Thm {
  card_eq_list_c.get()
}

///|
/// CARD_EQ_CART
fn step_232() -> Unit raise {
  let t2250 = @meson.meson_tac(@list.List([]))
  let t2249 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      @int.arith_rule(@term_syntax.parse_term("((i : Num) < (n : Num) + 1) == (i <= n)")),
    ]),
  )
  let t2245 = @term_syntax.parse_term("(i : Num) => op_dollar((x : Cart[A, N]), i)")
  let t2246 = @list.List([@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + 1"), t2245])
  let t2251 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x2248 : @kernel.Thm,
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
          x2242 : @kernel.Thm,
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
          let s2243 = @tactics.mp_tac(x2242)
          fn(
            x2244 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2243(x2244)
          }
        })(((x2247 : @kernel.Thm) => @bool.specl(t2246, x2247))(x2248))
      }),
      t2249,
    ),
    t2250,
  )
  let t2241 = @simp.asm_simp_tac(
    @list.List([@lists.el(), @lists.hd(), @lists.tl(), @arith.lt_suc()]),
  )
  let t2240 = @tactics.exists_tac(@term_syntax.parse_term("CONS((f : (Num) -> A)(0), (l : List[A]))"))
  let t2239 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[A])"))
  let t2238 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2234 = @term_syntax.parse_term("(i : Num) => (f : (Num) -> A)(SUC(i))")
  let t2237 = @tactics.first_x_assum(fn(
    x2236 : @kernel.Thm,
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
      x2231 : @kernel.Thm,
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
      let s2232 = @tactics.mp_tac(x2231)
      fn(
        x2233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2232(x2233)
      }
    })(((x2235 : @kernel.Thm) => @bool.spec(t2234, x2235))(x2236))
  })
  let t2230 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Num) -> A)"))
  let t2252 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @nums.induct_tac,
                      @simp.rewrite_tac(
                        @list.List([@bool.conjunct1(@arith.lt())]),
                      ),
                    ),
                    t2230,
                  ),
                  t2237,
                ),
                t2238,
              ),
              t2239,
            ),
            @tactics.disch_tac,
          ),
          t2240,
        ),
        @nums.induct_tac,
      ),
      t2241,
    ),
    t2251,
  ])
  let t2229 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∀ f : (Num) -> A, ∃ l : List[A], ∀ i : Num, i < n → EL(i, l) == f(i)"),
    fn(
      x2226 : @kernel.Thm,
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
      let s2227 = @tactics.mp_tac(x2226)
      fn(
        x2228 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2227(x2228)
      }
    },
  )
  let t2225 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[A, N])"))
  let t2224 = @simp.asm_simp_tac(
    @list.List([@cart.cart_eq(), @sets.in_univ(), @cart.lambda_beta()]),
  )
  let t2223 = @tactics.exists_tac(
    @term_syntax.parse_term("(l : List[A]) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => EL(i, l))"),
  )
  let t2222 = @simp.rewrite_tac(@list.List([@sets.le_c_v1()]))
  let t2221 = @simp.asm_simp_tac(@list.List([card_eq_list(), card_eq_imp_le()]))
  let t2219 = @term_syntax.parse_term("(UNIV : (List[A]) -> Bool)")
  let t2220 = @tactics.trans_tac(card_le_trans())(t2219)
  let t2217 = @meson.meson_tac(
    @list.List([@arith.le_refl(), @cart.dimindex_ge_1()]),
  )
  let t2216 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta()]))
  let t2215 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => x)"),
  )
  let t2218 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ()])),
          t2215,
        ),
        t2216,
      ),
      t2217,
    ),
  ])
  let t2253 = @tactics.thenl(
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
                        @tactics.disch_tac,
                        @simp.rewrite_tac(
                          @list.List([@equal.gsym(card_le_antisym())]),
                        ),
                      ),
                      @tactics.conj_tac,
                    ),
                    t2218,
                  ),
                  t2220,
                ),
                t2221,
              ),
              t2222,
            ),
            t2223,
          ),
          t2224,
        ),
        t2225,
      ),
      t2229,
    ),
    t2252,
  )
  card_eq_cart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (op_eq_us_c : ((Cart[A, N]) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Cart[A, N]) -> Bool), (UNIV : (A) -> Bool))"),
      t2253,
    ),
  )
}

///|
let card_eq_cart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_CART")

///|
/// `CARD_EQ_CART`
pub fn card_eq_cart() -> @kernel.Thm {
  card_eq_cart_c.get()
}

///|
/// CARD_EQ_REAL
fn step_233() -> Unit raise {
  let t2274 = @simp.simp_tac(
    @list.List([
      @real.real_lt_inv_eq(),
      @real.real_lt_div(),
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
    ]),
  )
  let t2273 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(inv((x : Real)) < real_of_num(3) / real_of_num(2) / x) == (real_of_num(0) < inv(x))"),
      ),
    ]),
  )
  let t2272 = @simp.asm_rewrite_tac(
    @list.List([@iterate.sum_clauses(), @calc_int.real_add_rid()]),
  )
  let t2271 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@arith.not_le(), @equal.gsym(@iterate.numseg_empty())]),
    ),
  )
  let t2268 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_pow_1()]),
  )
  let t2267 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) + (j : Real) <= (k : Real) → (x : Real) < j → a + x < k"),
    ),
  )
  let t2266 = @list.List([
    @int.asm_arith_tac,
    @simp.rewrite_tac(@list.List([@arith.add1(), @real.real_pow_add()])),
  ])
  let t2262 = @term_syntax.parse_term("SUC((m : Num))")
  let t2263 = @list.List([@term_syntax.parse_term("(n : Num)"), t2262])
  let t2269 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.first_x_assum(fn(
                x2265 : @kernel.Thm,
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
                  x2259 : @kernel.Thm,
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
                  let s2260 = @tactics.mp_tac(x2259)
                  fn(
                    x2261 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s2260(x2261)
                  }
                })(((x2264 : @kernel.Thm) => @bool.specl(t2263, x2264))(x2265))
              }),
              @tactics.ants_tac,
            ),
            t2266,
          ),
          t2267,
        ),
        t2268,
      ),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2258 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) + 1 <= (n : Num)"))
  let t2270 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left()])),
        t2258,
      ),
      t2269,
    ),
    @tactics.all_tac,
  ])
  let t2257 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t2275 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @wf.wf_induct_tac(@term_syntax.parse_term("(n : Num) - (m : Num)")),
              t2257,
            ),
            t2270,
          ),
          t2271,
        ),
        t2272,
      ),
      t2273,
    ),
    t2274,
  )
  let t2256 = @simp.simp_tac(
    @list.List([
      @iterate.finite_numseg(),
      @sets.inter_subset(),
      @real.real_le_inv_eq(),
      @real.real_pow_le(),
      @realarith.real_pos(),
    ]),
  )
  let t2276 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@iterate.sum_subset_simple()),
      t2256,
    ),
    t2275,
  ])
  let t2255 = @tactics.exists_tac(
    @term_syntax.parse_term("sum(op_dot_dot((m : Num), (n : Num)), (i : Num) => inv(pow(real_of_num(3), i)))"),
  )
  let t2254 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t2277 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2254),
        t2255,
      ),
      @tactics.conj_tac,
    ),
    t2276,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ m : Num, ∀ n : Num, sum(INTER(s, op_dot_dot(m, n)), (i : Num) => inv(pow(real_of_num(3), i))) < real_of_num(3) / real_of_num(2) / pow(real_of_num(3), m)"),
    t2277,
  )
  let t2412 = @simp.simp_tac(@list.List([lemma, @realarith.real_lt_imp_le()]))
  let t2411 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(3) / real_of_num(2) / pow(real_of_num(3), 0)"))
  let t2410 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t2409 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])
  let t2408 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @sets.in_univ()]),
  )
  let t2413 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.mp_tac(
                  @bool.ispec(
                    @term_syntax.parse_term("{sum(INTER((x : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) | IN(n, UNIV)}"),
                    @sets.sup_v1(),
                  ),
                ),
                t2408,
              ),
              @tactics.ants_tac,
            ),
            t2409,
          ),
          @tactics.conj_tac,
        ),
        t2410,
      ),
      t2411,
    ),
    t2412,
  )
  let t2401 = @simp.simp_tac(
    @list.List([
      @real.real_lt_inv_eq(),
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
    ]),
  )
  let t2400 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(2) * (x : Real) < x) == (real_of_num(0) < x)")),
    ]),
  )
  let t2399 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2402 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @realax.real_pow(),
            @realax.real_div(),
            @real.real_inv_mul(),
            @realax.real_mul_assoc(),
          ]),
        ),
        t2399,
      ),
      t2400,
    ),
    t2401,
  )
  let t2398 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && (m : Num) <= n - 1 → m < n")),
    ]),
  )
  let t2403 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t2398),
    t2402,
  ])
  let t2397 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(s : Real) == (t : Real) && (d : Real) < (e : Real) → s + d < t + e"),
    ),
  )
  let t2404 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            @iterate.sum_clauses_right(),
            @arith.le_1(),
            @arith.le_0(),
            @calc_int.real_add_rid(),
          ]),
        ),
        t2397,
      ),
      @tactics.conj_tac,
    ),
    t2403,
  )
  let t2396 = @simp.asm_rewrite_tac(
    @list.List([@iterate.sum_sing(), @iterate.numseg_sing(), @realax.real_pow()]),
  )
  let t2405 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
          x2393 : @kernel.Thm,
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
          let s2394 = @tactics.subst_all_tac(x2393)
          fn(
            x2395 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2394(x2395)
          }
        }),
        t2396,
      ),
      @calc_rat.real_arith_tac,
    ),
    t2404,
  ])
  let t2392 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2391 = @simp.rewrite_tac(
    @list.List([@sets.inter(), @iterate.sum_restrict_set()]),
  )
  let t2406 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@sets.inter_comm()])),
        t2391,
      ),
      t2392,
    ),
    t2405,
  )
  let t2388 = @simp.rewrite_tac(@list.List([@iterate.subset_numseg()]))
  let t2387 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER((u : (_) -> Bool), s), INTER(u, t))"),
    ),
  )
  let t2386 = @simp.simp_tac(
    @list.List([@sets.finite_inter(), @iterate.finite_numseg()]),
  )
  let t2385 = @simp.simp_tac(
    @list.List([
      @real.real_le_inv_eq(),
      @real.real_pow_le(),
      @realarith.real_pos(),
    ]),
  )
  let t2384 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t2383 = @simp.simp_tac(
    @list.List([@real.real_le_div(), @realarith.real_pos(), @real.real_pow_le()]),
  )
  let t2389 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(
                  @calc_rat.real_arith(
                    @term_syntax.parse_term("(y : Real) <= (x : Real) && real_of_num(0) <= (d : Real) → y <= x + d"),
                  ),
                ),
                t2383,
              ),
              t2384,
            ),
            t2385,
          ),
          t2386,
        ),
        t2387,
      ),
      t2388,
    ),
    @int.asm_arith_tac,
  )
  let t2381 = @simp.simp_tac(
    @list.List([@arith.add1(), lemma, @realarith.real_lt_imp_le()]),
  )
  let t2380 = @simp.asm_simp_tac(
    @list.List([@iterate.sum_combine_r(), @arith.le_0()]),
  )
  let t2379 = @simp.rewrite_tac(
    @list.List([@sets.inter(), @iterate.sum_restrict_set()]),
  )
  let t2382 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@sets.inter_comm()])),
        t2379,
      ),
      t2380,
    ),
    t2381,
  ])
  let t2378 = @tactics.exists_tac(
    @term_syntax.parse_term("sum(INTER((y : (Num) -> Bool), op_dot_dot((n : Num) + 1, (p : Num))), (i : Num) => inv(pow(real_of_num(3), i)))"),
  )
  let t2390 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @calc_rat.real_arith(
              @term_syntax.parse_term("∀ d : Real, (s : Real) == (t : Real) + d && d <= (e : Real) → s <= t + e"),
            ),
          ),
          t2378,
        ),
        @tactics.conj_tac,
      ),
      t2382,
    ),
    t2389,
  ])
  let t2377 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) <= (p : Num)"))
  let t2376 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2374 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @sets.in_univ()]),
  )
  let t2375 = @list.List([@sets.set_tac(@list.List([])), t2374])
  let t2407 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.match_mp_tac(@sets.real_sup_le()),
              @tactics.conj_tac,
            ),
            t2375,
          ),
          t2376,
        ),
        t2377,
      ),
      t2390,
    ),
    t2406,
  ])
  let t2373 = @tactics.exists_tac(
    @term_syntax.parse_term("sum(INTER((y : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) + real_of_num(3) / real_of_num(2) / pow(real_of_num(3), SUC(n))"),
  )
  let t2414 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@realarith.real_let_trans()),
          t2373,
        ),
        @tactics.conj_tac,
      ),
      t2407,
    ),
    t2413,
  ])
  let t2372 = @tactics.exists_tac(
    @term_syntax.parse_term("sum(INTER((x : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i)))"),
  )
  let t2371 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ z : Real, (y : Real) < z && z <= (x : Real) → !(x == y)"),
    ),
  )
  let t2370 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2368 = @term_syntax.parse_term("(y : (Num) -> Bool)")
  let t2369 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : (Num) -> Bool)"), t2368]),
  )
  let t2366 = @simp.rewrite_tac(@list.List([]))
  let t2367 = @list.List([
    @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()])),
    t2366,
  ])
  let t2365 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@sets.in_()]),
      @term_syntax.parse_term("((∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, ∀ n : Num, (R : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(P, Q, n) == R(Q, P, n)) && (∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, (S : ((Num) -> Bool, (Num) -> Bool) -> Bool)(P, Q) == S(Q, P))) && (∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, (∃ n : Num, IN(n, P) && !IN(n, Q) && R(P, Q, n)) → S(P, Q)) → (∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, (∃ n : Num, !(IN(n, P) == IN(n, Q)) && R(P, Q, n)) → S(P, Q))"),
    ),
  )
  let t2363 = @term_syntax.parse_term("(x : (Num) -> Bool)")
  let t2364 = @tactics.map_every(
    fn(
      x2361 : @kernel.Term,
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
      let w = x2361
      @tactics.spec_tac(w, w)
    },
    @list.List([@term_syntax.parse_term("(y : (Num) -> Bool)"), t2363]),
  )
  let t2360 = @simp.gen_rewrite_tac(
    fn(
      x2357 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2358 = @equal.land_conv(x2357)
      fn(x2359 : @kernel.Term) -> @kernel.Thm raise { s2358(x2359) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t2356 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @class.not_forall_thm()]),
  )
  let t2355 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2353 = @term_syntax.parse_term("(y : (Num) -> Bool)")
  let t2354 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : (Num) -> Bool)"), t2353]),
  )
  let t2352 = @tactics.exists_tac(
    @term_syntax.parse_term("(s : (Num) -> Bool) => sup({sum(INTER(s, op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) | IN(n, UNIV)})"),
  )
  let t2415 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @simp.rewrite_tac(
                                  @list.List([@sets.le_c(), @sets.in_univ()]),
                                ),
                                t2352,
                              ),
                              t2354,
                            ),
                            t2355,
                          ),
                          t2356,
                        ),
                        t2360,
                      ),
                      t2364,
                    ),
                    t2365,
                  ),
                  @tactics.conj_tac,
                ),
                t2367,
              ),
              t2369,
            ),
            t2370,
          ),
          t2371,
        ),
        t2372,
      ),
      @tactics.conj_tac,
    ),
    t2414,
  )
  let t2351 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t2347 = @term_syntax.parse_term("(q : Num)")
  let t2350 = @tactics.first_x_assum(fn(
    x2349 : @kernel.Thm,
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
      x2344 : @kernel.Thm,
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
      let s2345 = @tactics.mp_tac(x2344)
      fn(
        x2346 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2345(x2346)
      }
    })(((x2348 : @kernel.Thm) => @bool.spec(t2347, x2348))(x2349))
  })
  let t2343 = @tactics.disch_then(fn(
    x2342 : @kernel.Thm,
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
    @tactics.all_tac
  })
  let t2341 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_of_num_suc())]),
  )
  let t2340 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t2339 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_le_mul(),
      @realarith.real_pos(),
      @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < real_of_num(0)) == !(real_of_num(0) <= x)")),
    ]),
  )
  let t2338 = @tactics.match_mp_tac(@nums.num_induction())
  let t2337 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2336 = @simp.gen_rewrite_tac(
    fn(
      x2333 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2334 = @equal.land_conv(x2333)
      fn(x2335 : @kernel.Term) -> @kernel.Thm raise { s2334(x2335) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t2332 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("real_of_num((p : Num)) * (x : Real)"), @real.real_arch_lt()),
  )
  let t2331 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2330 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2326 = @term_syntax.parse_term("real_of_num(2)")
  let t2329 = @tactics.disch_then(fn(
    x2328 : @kernel.Thm,
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
      x2323 : @kernel.Thm,
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
      let s2324 = @tactics.mp_tac(x2323)
      fn(
        x2325 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2324(x2325)
      }
    })(((x2327 : @kernel.Thm) => @bool.spec(t2326, x2327))(x2328))
  })
  let t2322 = @simp.asm_rewrite_tac(
    @list.List([@realarith.real_sub_lt(), @class.not_forall_thm()]),
  )
  let t2321 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real) - (x : Real)"), @real.real_arch()),
  )
  let t2320 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")),
  )
  let t2319 = @simp.asm_rewrite_tac(@list.List([]))
  let t2315 = @term_syntax.parse_term("(pair : ((Num, Num)) -> Num)(((p : Num), (q : Num)))")
  let t2311 = @term_syntax.parse_term("(q : Num)")
  let t2312 = @list.List([@term_syntax.parse_term("(p : Num)"), t2311])
  let t2318 = @tactics.first_x_assum(fn(
    x2317 : @kernel.Thm,
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
      x2314 : @kernel.Thm,
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
        x2308 : @kernel.Thm,
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
        let s2309 = @tactics.mp_tac(x2308)
        fn(
          x2310 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2309(x2310)
        }
      })(((x2313 : @kernel.Thm) => @bool.genl(t2312, x2313))(x2314))
    })(((x2316 : @kernel.Thm) => @bool.spec(t2315, x2316))(x2317))
  })
  let t2307 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2305 = @term_syntax.parse_term("(y : Real)")
  let t2306 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Real)"), t2305]),
  )
  let t2304 = @list.List([
    @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq(), @theorems.conj_aci()])),
    @tactics.all_tac,
  ])
  let t2303 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @class.fun_eq_thm()]),
  )
  let t2302 = @tactics.match_mp_tac(@real.real_wlog_lt())
  let t2301 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Real) => (n : Num) => real_of_num(FST((unpair : (Num) -> (Num, Num))(n))) * x <= real_of_num(SND(unpair(n)))"),
  )
  let t2299 = @term_syntax.parse_term("(unpair : (Num) -> (Num, Num))")
  let t2300 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(pair : ((Num, Num)) -> Num)"), t2299]),
  )
  let t2298 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2297 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@pair.forall_pair_thm()),
      @sets.injective_left_inverse(),
    ]),
  )
  let t2296 = @simp.rewrite_tac(
    @list.List([
      @sets.le_c(),
      mul_c(),
      @sets.in_univ(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t2295 = @simp.rewrite_tac(
    @list.List([card_le_refl(), @sets.num_infinite()]),
  )
  let t2293 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t2294 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(UNIV : (Num) -> Bool)"), t2293]),
      card_mul_absorb_le(),
    ),
  )
  let t2292 = @simp.rewrite_tac(@list.List([card_le_refl()]))
  let t2291 = @tactics.match_mp_tac(card_le_mul())
  let t2289 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2288 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t2287 = @simp.rewrite_tac(@list.List([@theorems.or_exists_thm()]))
  let t2286 = @tactics.match_mp_tac(
    @meson.meson(@list.List([]), @term_syntax.parse_term("(P : (Num) -> Bool)(0) || P(1) → (∃ n : Num, P(n))")),
  )
  let t2285 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2284 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((Num, Real)) -> Real) => ∀ n : Num, ∀ x : Real, GEQ(f((n, x)), pow(-real_of_num(1), n) * x))"),
  )
  let t2290 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @sets.le_c_v1(),
                      mul_c(),
                      @pair.exists_pair_thm(),
                      @sets.in_elim_pair_thm(),
                      @sets.in_univ(),
                    ]),
                  ),
                  t2284,
                ),
                t2285,
              ),
              t2286,
            ),
            t2287,
          ),
          t2288,
        ),
        t2289,
      ),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2282 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, (Real) -> Bool, (Num, Real)) -> Bool)((UNIV : (Num) -> Bool), {(x : Real) | real_of_num(0) <= x})")
  let t2283 = @tactics.trans_tac(card_le_trans())(t2282)
  let t2280 = @simp.simp_tac(
    @list.List([cantor_thm_univ(), card_lt_imp_le(), card_le_refl()]),
  )
  let t2279 = @simp.rewrite_tac(@list.List([infinite_card_le()]))
  let t2281 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(card_mul2_absorb_le()), t2279),
      t2280,
    ),
  ])
  let t2278 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, ((Num) -> Bool) -> Bool, (Num, (Num) -> Bool)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : ((Num) -> Bool) -> Bool))")
  let t2416 = @list.List([
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
                                                                              @tactics.thenl(
                                                                                @tactics.then_tac(
                                                                                  @tactics.then_tac(
                                                                                    @tactics.thenl(
                                                                                      @tactics.then_tac(
                                                                                        @tactics.trans_tac(
                                                                                          card_le_trans(),
                                                                                        )(
                                                                                          t2278,
                                                                                        ),
                                                                                        @tactics.conj_tac,
                                                                                      ),
                                                                                      t2281,
                                                                                    ),
                                                                                    t2283,
                                                                                  ),
                                                                                  @tactics.conj_tac,
                                                                                ),
                                                                                t2290,
                                                                              ),
                                                                              t2291,
                                                                            ),
                                                                            t2292,
                                                                          ),
                                                                          t2294,
                                                                        ),
                                                                        t2295,
                                                                      ),
                                                                      t2296,
                                                                    ),
                                                                    t2297,
                                                                  ),
                                                                  t2298,
                                                                ),
                                                                t2300,
                                                              ),
                                                              @tactics.disch_tac,
                                                            ),
                                                            t2301,
                                                          ),
                                                          t2302,
                                                        ),
                                                        t2303,
                                                      ),
                                                      @tactics.conj_tac,
                                                    ),
                                                    t2304,
                                                  ),
                                                  t2306,
                                                ),
                                                t2307,
                                              ),
                                              t2318,
                                            ),
                                            t2319,
                                          ),
                                          t2320,
                                        ),
                                        t2321,
                                      ),
                                      t2322,
                                    ),
                                    t2329,
                                  ),
                                  t2330,
                                ),
                                t2331,
                              ),
                              @tactics.disch_tac,
                            ),
                            t2332,
                          ),
                          t2336,
                        ),
                        t2337,
                      ),
                      t2338,
                    ),
                    t2339,
                  ),
                  t2340,
                ),
                t2341,
              ),
              t2343,
            ),
            @tactics.strip_tac,
          ),
          t2350,
        ),
        t2351,
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t2415,
  ])
  let t2417 = @tactics.thenl(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())])),
      @tactics.conj_tac,
    ),
    t2416,
  )
  card_eq_real_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : ((Real) -> Bool, ((Num) -> Bool) -> Bool) -> Bool)((UNIV : (Real) -> Bool), (UNIV : ((Num) -> Bool) -> Bool))"), t2417),
  )
}

///|
let card_eq_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_REAL")

///|
/// `CARD_EQ_REAL`
pub fn card_eq_real() -> @kernel.Thm {
  card_eq_real_c.get()
}

///|
/// UNCOUNTABLE_REAL
fn step_234() -> Unit raise {
  let t2423 = @simp.rewrite_tac(@list.List([card_eq_real()]))
  let t2422 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t2421 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2420 = @simp.rewrite_tac(@list.List([cantor_thm_univ()]))
  let t2418 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t2419 = @tactics.trans_tac(card_lte_trans())(t2418)
  let t2424 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.countable(), card_not_le(), @sets.ge_c()]),
            ),
            t2419,
          ),
          t2420,
        ),
        t2421,
      ),
      t2422,
    ),
    t2423,
  )
  uncountable_real_c.set(
    @tactics.prove(@term_syntax.parse_term("!(COUNTABLE : ((Real) -> Bool) -> Bool)((UNIV : (Real) -> Bool))"), t2424),
  )
}

///|
let uncountable_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UNCOUNTABLE_REAL",
)

///|
/// `UNCOUNTABLE_REAL`
pub fn uncountable_real() -> @kernel.Thm {
  uncountable_real_c.get()
}

///|
/// CARD_EQ_REAL_IMP_UNCOUNTABLE
fn step_235() -> Unit raise {
  let t2435 = @meson.asm_meson_tac(@list.List([card_eq_sym()]))
  let t2434 = @simp.rewrite_tac(@list.List([uncountable_real()]))
  let t2431 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(card_eq_countable()),
  )
  let t2428 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t2433 = @tactics.disch_then(fn(
    x2432 : @kernel.Thm,
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
      x2430 : @kernel.Thm,
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
        x2425 : @kernel.Thm,
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
        let s2426 = @tactics.mp_tac(x2425)
        fn(
          x2427 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2426(x2427)
        }
      })(((x2429 : @kernel.Thm) => @bool.ispec(t2428, x2429))(x2430))
    })(t2431(x2432))
  })
  let t2436 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
        t2433,
      ),
      t2434,
    ),
    t2435,
  )
  card_eq_real_imp_uncountable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, (op_eq_us_c : ((_) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) → !(COUNTABLE : ((_) -> Bool) -> Bool)(s)"),
      t2436,
    ),
  )
}

///|
let card_eq_real_imp_uncountable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_REAL_IMP_UNCOUNTABLE",
)

///|
/// `CARD_EQ_REAL_IMP_UNCOUNTABLE`
pub fn card_eq_real_imp_uncountable() -> @kernel.Thm {
  card_eq_real_imp_uncountable_c.get()
}

///|
/// COUNTABLE_IMP_CARD_LT_REAL
fn step_236() -> Unit raise {
  let t2437 = @meson.asm_meson_tac(
    @list.List([card_le_countable(), uncountable_real()]),
  )
  let t2438 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(card_not_le())])),
    t2437,
  )
  countable_imp_card_lt_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (COUNTABLE : ((A) -> Bool) -> Bool)(s) → (op_lt_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool))"),
      t2438,
    ),
  )
}

///|
let countable_imp_card_lt_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_IMP_CARD_LT_REAL",
)

///|
/// `COUNTABLE_IMP_CARD_LT_REAL`
pub fn countable_imp_card_lt_real() -> @kernel.Thm {
  countable_imp_card_lt_real_c.get()
}

///|
/// CARD_LT_NUM_REAL
fn step_237() -> Unit raise {
  let t2439 = @simp.simp_tac(
    @list.List([countable_imp_card_lt_real(), num_countable()]),
  )
  card_lt_num_real_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_lt_us_c : ((Num) -> Bool, (Real) -> Bool) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Real) -> Bool))"), t2439),
  )
}

///|
let card_lt_num_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LT_NUM_REAL",
)

///|
/// `CARD_LT_NUM_REAL`
pub fn card_lt_num_real() -> @kernel.Thm {
  card_lt_num_real_c.get()
}

///|
/// CARD_EQ_REAL_SUBSET
fn step_238() -> Unit raise {
  let t2449 = @simp.rewrite_tac(@list.List([@calc_rat.real_shrink_range()]))
  let t2448 = @simp.asm_simp_tac(
    @list.List([
      @real.real_lt_lmul_eq(),
      @realarith.real_sub_lt(),
      @real.real_bounds_lt(),
    ]),
  )
  let t2447 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((a : Real) < (a + (b : Real)) / real_of_num(2) + (b - a) / real_of_num(2) * (x : Real)) == ((b - a) * -real_of_num(1) < (b - a) * x) && ((a + b) / real_of_num(2) + (b - a) / real_of_num(2) * x < b) == ((b - a) * x < (b - a) * real_of_num(1))"),
      ),
    ]),
  )
  let t2446 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2445 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2444 = @simp.rewrite_tac(@list.List([@calc_rat.real_shrink_eq()]))
  let t2443 = @simp.rewrite_tac(
    @list.List([@calc_int.real_eq_add_lcancel(), @real.real_eq_mul_lcancel()]),
  )
  let t2442 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Real) => ((a : Real) + (b : Real)) / real_of_num(2) + (b - a) / real_of_num(2) * (x / (real_of_num(1) + abs(x)))"),
  )
  let t2441 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ()]))
  let t2440 = @simp.rewrite_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_le_univ()]),
  )
  let t2450 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t2440,
                        ),
                        t2441,
                      ),
                      t2442,
                    ),
                    t2443,
                  ),
                  t2444,
                ),
                @tactics.conj_tac,
              ),
              @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac]),
            ),
            t2445,
          ),
          t2446,
        ),
        t2447,
      ),
      t2448,
    ),
    t2449,
  )
  card_eq_real_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ a : Real, ∀ b : Real, a < b && (∀ x : Real, a < x && x < b → (IN : (Real, (Real) -> Bool) -> Bool)(x, s)) → (op_eq_us_c : ((Real) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool))"),
      t2450,
    ),
  )
}

///|
let card_eq_real_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_REAL_SUBSET",
)

///|
/// `CARD_EQ_REAL_SUBSET`
pub fn card_eq_real_subset() -> @kernel.Thm {
  card_eq_real_subset_c.get()
}

///|
/// Library/card.ml:2562
fn step_239() -> Unit raise {
  @printer.parse_as_infix("^_c", (24L, "left"))
}

///|
/// exp_c
fn step_240() -> Unit raise {
  exp_c_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == {(f : (B) -> A) | (∀ x : B, IN(x, t) → IN(f(x), s)) && (∀ x : B, !IN(x, t) → f(x) == select((y : A) => false))}"),
    ),
  )
}

///|
let exp_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_c")

///|
/// `exp_c`
pub fn exp_c() -> @kernel.Thm {
  exp_c_c.get()
}

///|
/// EXP_C
fn step_241() -> Unit raise {
  let t2451 = @simp.rewrite_tac(@list.List([exp_c()]))
  let t2452 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extensional(),
        @sets.arb(),
        @sets.in_elim_thm(),
        @sets.subset(),
        @sets.forall_in_image(),
      ]),
    ),
    t2451,
  )
  exp_c_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_caret_us_c(s, t) == {(f : (B) -> A) | SUBSET(IMAGE(f, t), s) && EXTENSIONAL(t, f)}"),
      t2452,
    ),
  )
}

///|
let exp_c_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_C")

///|
/// `EXP_C`
pub fn exp_c_v1() -> @kernel.Thm {
  exp_c_v1_c.get()
}

///|
/// CARD_EXP_UNIV
fn step_242() -> Unit raise {
  let t2453 = @sets.set_tac(@list.List([]))
  let t2454 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([exp_c(), @sets.in_univ()])),
    t2453,
  )
  card_exp_univ_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)((UNIV : (A) -> Bool), (UNIV : (B) -> Bool)) == (UNIV : ((B) -> A) -> Bool)"), t2454),
  )
}

///|
let card_exp_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_UNIV")

///|
/// `CARD_EXP_UNIV`
pub fn card_exp_univ() -> @kernel.Thm {
  card_exp_univ_c.get()
}

///|
/// CARD_EXP_GRAPH
fn step_243() -> Unit raise {
  let t2462 = @meson.meson_tac(@list.List([]))
  let t2461 = @simp.simp_tac(
    @list.List([@sets.in_elim_thm(), @class.fun_eq_thm()]),
  )
  let t2459 = @term_syntax.parse_term("(R : (B, A) -> Bool) => (x : B) => if IN(x, (t : (B) -> Bool)) { select((y : A) => R(x, y)) } else { select((y : A) => false) }")
  let t2460 = @tactics.map_every(
    fn(
      x2456 : @kernel.Term,
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
      let s2457 = @tactics.exists_tac(x2456)
      fn(
        x2458 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2457(x2458)
      }
    },
    @list.List([@term_syntax.parse_term("(f : (B) -> A) => (x : B) => (y : A) => IN(x, (t : (B) -> Bool)) && f(x) == y"), t2459]),
  )
  let t2455 = @simp.rewrite_tac(
    @list.List([eq_c_bijections(), exp_c(), @sets.forall_in_gspec()]),
  )
  let t2463 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2455),
        t2460,
      ),
      t2461,
    ),
    t2462,
  )
  card_exp_graph_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(op_caret_us_c(s, t), {(R : (B, A) -> Bool) | (∀ x : B, ∀ y : A, R(x, y) → IN(x, t) && IN(y, s)) && (∀ x : B, IN(x, t) → existsunique((y : A) => R(x, y)))})"),
      t2463,
    ),
  )
}

///|
let card_exp_graph_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_GRAPH")

///|
/// `CARD_EXP_GRAPH`
pub fn card_exp_graph() -> @kernel.Thm {
  card_exp_graph_c.get()
}

///|
/// CARD_EXP_GRAPH_PAIRED
fn step_244() -> Unit raise {
  let t2472 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @pair.forall_pair_thm(),
      @class.fun_eq_thm(),
    ]),
  )
  let t2470 = @term_syntax.parse_term("(R : ((B, A)) -> Bool) => (x : B) => (y : A) => R((x, y))")
  let t2471 = @tactics.map_every(
    fn(
      x2467 : @kernel.Term,
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
      let s2468 = @tactics.exists_tac(x2467)
      fn(
        x2469 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2468(x2469)
      }
    },
    @list.List([@term_syntax.parse_term("(R : (B, A) -> Bool) => GABS((f : ((B, A)) -> Bool) => ∀ x : B, ∀ y : A, GEQ(f((x, y)), R(x, y)))"), t2470]),
  )
  let t2466 = @simp.rewrite_tac(
    @list.List([eq_c_bijections(), @sets.forall_in_gspec()]),
  )
  let t2465 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_eq_trans()),
  )
  let t2464 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t2473 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.mp_tac(card_exp_graph()), t2464),
          t2465,
        ),
        t2466,
      ),
      t2471,
    ),
    t2472,
  )
  card_exp_graph_paired_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(op_caret_us_c(s, t), {(R : ((B, A)) -> Bool) | (∀ x : B, ∀ y : A, R((x, y)) → IN(x, t) && IN(y, s)) && (∀ x : B, IN(x, t) → existsunique((y : A) => R((x, y))))})"),
      t2473,
    ),
  )
}

///|
let card_exp_graph_paired_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_GRAPH_PAIRED",
)

///|
/// `CARD_EXP_GRAPH_PAIRED`
pub fn card_exp_graph_paired() -> @kernel.Thm {
  card_exp_graph_paired_c.get()
}

///|
/// CARD_EXP_0
fn step_245() -> Unit raise {
  let t2477 = @simp.simp_tac(
    @list.List([card_eq_card(), @sets.finite_sing(), @sets.card_sing()]),
  )
  let t2476 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))]),
  )
  let t2475 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.fun_eq_thm())]),
  )
  let t2474 = @simp.rewrite_tac(@list.List([exp_c(), @sets.not_in_empty()]))
  let t2478 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2474),
        t2475,
      ),
      t2476,
    ),
    t2477,
  )
  card_exp_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ c : C, (op_eq_us_c : (((B) -> A) -> Bool, (C) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, ({} : (B) -> Bool)), {c})"),
      t2478,
    ),
  )
}

///|
let card_exp_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_0")

///|
/// `CARD_EXP_0`
pub fn card_exp_0() -> @kernel.Thm {
  card_exp_0_c.get()
}

///|
/// CARD_EXP_ZERO
fn step_246() -> Unit raise {
  let t2485 = @simp.simp_tac(
    @list.List([card_eq_card(), @sets.finite_sing(), @sets.card_sing()]),
  )
  let t2484 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))]),
  )
  let t2483 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.fun_eq_thm())]),
  )
  let t2482 = @simp.rewrite_tac(
    @list.List([card_eq_empty(), @sets.empty_gspec()]),
  )
  let t2481 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("!((s : (_) -> Bool) == {}) → !(∀ x : _, !IN(x, s))")),
    ]),
  )
  let t2480 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t2479 = @simp.rewrite_tac(@list.List([exp_c()]))
  let t2486 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2479),
                @class.cond_cases_tac,
              ),
              t2480,
            ),
            t2481,
          ),
          t2482,
        ),
        t2483,
      ),
      t2484,
    ),
    t2485,
  )
  card_exp_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (B) -> Bool, ∀ c : C, (op_eq_us_c : (((B) -> A) -> Bool, (C) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(({} : (A) -> Bool), s), if s == {} { {c} } else { {} })"),
      t2486,
    ),
  )
}

///|
let card_exp_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_ZERO")

///|
/// `CARD_EXP_ZERO`
pub fn card_exp_zero() -> @kernel.Thm {
  card_exp_zero_c.get()
}

///|
/// CARD_EXP_ADD
fn step_247() -> Unit raise {
  let t2508 = @ind_types.distinctness("sum")
  let t2509 = @meson.asm_meson_tac(
    @list.List([@ind_types.injectivity("sum"), t2508]),
  )
  let t2507 = @tactics.try_tac(@tactics.first_x_assum(@tactics.match_mp_tac))
  let t2506 = @tactics.conv_tac(@equal.sym_conv)
  let t2505 = @simp.asm_rewrite_tac(@list.List([]))
  let t2504 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2502 = @ind_types.distinctness("sum")
  let t2503 = @simp.rewrite_tac(
    @list.List([@ind_types.injectivity("sum"), t2502, @pair.pair_eq()]),
  )
  let t2501 = @tactics.match_mp_tac(@ind_types.sum_induct())
  let t2499 = @meson.meson_tac(@list.List([]))
  let t2500 = @list.List([@simp.simp_tac(@list.List([])), t2499])
  let t2498 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2497 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(
        @theorems.unwind_thm1(),
      ),
      @theorems.conj_assoc(),
    ]),
  )
  let t2495 = @ind_types.distinctness("sum")
  let t2496 = @simp.rewrite_tac(
    @list.List([@ind_types.injectivity("sum"), t2495, @pair.pair_eq()]),
  )
  let t2494 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_union()]),
  )
  let t2492 = @term_syntax.parse_term("fn { (g, h) => (z : Sum[B, C]) => if (∃ x : B, IN(x, (t : (B) -> Bool)) && INL(x) == z) { g(select((x : B) => IN(x, t) && INL(x) == z)) } else { if (∃ y : C, IN(y, (u : (C) -> Bool)) && INR(y) == z) { h(select((y : C) => IN(y, u) && INR(y) == z)) } else { select((y : A) => false) } } }")
  let t2493 = @tactics.map_every(
    fn(
      x2489 : @kernel.Term,
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
      let s2490 = @tactics.exists_tac(x2489)
      fn(
        x2491 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2490(x2491)
      }
    },
    @list.List([
      @term_syntax.parse_term("(f : (Sum[B, C]) -> A) => ((x : B) => if IN(x, (t : (B) -> Bool)) { f(INL(x)) } else { select((x : A) => false) }, (x : C) => if IN(x, (u : (C) -> Bool)) { f(INR(x)) } else { select((x : A) => false) })"),
      t2492,
    ]),
  )
  let t2488 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_union(), @sets.forall_in_gspec()]),
  )
  let t2487 = @simp.rewrite_tac(
    @list.List([add_c(), mul_c(), exp_c(), eq_c_bijections()]),
  )
  let t2510 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.gen_tac),
                                        t2487,
                                      ),
                                      t2488,
                                    ),
                                    t2493,
                                  ),
                                  t2494,
                                ),
                                t2496,
                              ),
                              t2497,
                            ),
                            t2498,
                          ),
                          @tactics.conj_tac,
                        ),
                        t2500,
                      ),
                      @tactics.gen_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t2501,
                ),
                t2503,
              ),
              t2504,
            ),
            @class.cond_cases_tac,
          ),
          t2505,
        ),
        t2506,
      ),
      t2507,
    ),
    t2509,
  )
  card_exp_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_caret_us_c(s, op_plus_us_c(t, u)), op_star_us_c(op_caret_us_c(s, t), op_caret_us_c(s, u)))"),
      t2510,
    ),
  )
}

///|
let card_exp_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_ADD")

///|
/// `CARD_EXP_ADD`
pub fn card_exp_add() -> @kernel.Thm {
  card_exp_add_c.get()
}

///|
/// CARD_EXP_MUL
fn step_248() -> Unit raise {
  let t2521 = @meson.asm_meson_tac(@list.List([]))
  let t2520 = @simp.asm_simp_tac(@list.List([]))
  let t2519 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2518 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @sets.in_elim_thm(),
      @pair.forall_pair_thm(),
      @class.de_morgan_thm(),
    ]),
  )
  let t2517 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_gspec(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t2515 = @term_syntax.parse_term("(f : (C, B) -> A) => fn { (x, y) => if IN(x, (t : (B) -> Bool)) && IN(y, (u : (C) -> Bool)) { f(y, x) } else { select((x : A) => false) } }")
  let t2516 = @tactics.map_every(
    fn(
      x2512 : @kernel.Term,
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
      let s2513 = @tactics.exists_tac(x2512)
      fn(
        x2514 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2513(x2514)
      }
    },
    @list.List([
      @term_syntax.parse_term("(f : ((B, C)) -> A) => (y : C) => if IN(y, (u : (C) -> Bool)) { (x : B) => f((x, y)) } else { select((x : (B) -> A) => false) }"),
      t2515,
    ]),
  )
  let t2511 = @simp.rewrite_tac(
    @list.List([mul_c(), exp_c(), eq_c_bijections()]),
  )
  let t2522 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2511),
              t2516,
            ),
            t2517,
          ),
          t2518,
        ),
        t2519,
      ),
      t2520,
    ),
    t2521,
  )
  card_exp_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_caret_us_c(s, op_star_us_c(t, u)), op_caret_us_c(op_caret_us_c(s, t), u))"),
      t2522,
    ),
  )
}

///|
let card_exp_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_MUL")

///|
/// `CARD_EXP_MUL`
pub fn card_exp_mul() -> @kernel.Thm {
  card_exp_mul_c.get()
}

///|
/// CARD_MUL_EXP
fn step_249() -> Unit raise {
  let t2533 = @meson.meson_tac(@list.List([@pair.pair(), @pair.pair_eq()]))
  let t2532 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2531 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(
        @theorems.unwind_thm1(),
      ),
      @theorems.conj_assoc(),
    ]),
  )
  let t2530 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @pair.forall_pair_thm(), @pair.pair_eq()]),
  )
  let t2529 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @sets.forall_in_gspec()]),
  )
  let t2527 = @term_syntax.parse_term("fn { (g, h) => (x : C) => if IN(x, (u : (C) -> Bool)) { (g(x), h(x)) } else { select((x : (A, B)) => false) } }")
  let t2528 = @tactics.map_every(
    fn(
      x2524 : @kernel.Term,
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
      let s2525 = @tactics.exists_tac(x2524)
      fn(
        x2526 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2525(x2526)
      }
    },
    @list.List([
      @term_syntax.parse_term("(f : (C) -> (A, B)) => ((x : C) => if IN(x, (u : (C) -> Bool)) { FST(f(x)) } else { select((x : A) => false) }, (x : C) => if IN(x, u) { SND(f(x)) } else { select((x : B) => false) })"),
      t2527,
    ]),
  )
  let t2523 = @simp.rewrite_tac(
    @list.List([mul_c(), exp_c(), eq_c_bijections()]),
  )
  let t2534 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2523),
              t2528,
            ),
            t2529,
          ),
          t2530,
        ),
        t2531,
      ),
      t2532,
    ),
    t2533,
  )
  card_mul_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_eq_us_c(op_caret_us_c(op_star_us_c(s, t), u), op_star_us_c(op_caret_us_c(s, u), op_caret_us_c(t, u)))"),
      t2534,
    ),
  )
}

///|
let card_mul_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_MUL_EXP")

///|
/// `CARD_MUL_EXP`
pub fn card_mul_exp() -> @kernel.Thm {
  card_mul_exp_c.get()
}

///|
/// CARD_EXP_SING
fn step_250() -> Unit raise {
  let t2544 = @meson.meson_tac(@list.List([]))
  let t2543 = @simp.simp_tac(@list.List([@class.fun_eq_thm()]))
  let t2541 = @term_syntax.parse_term("(x : A) => (y : B) => if y == (b : B) { x } else { select((y : A) => false) }")
  let t2542 = @tactics.map_every(
    fn(
      x2538 : @kernel.Term,
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
      let s2539 = @tactics.exists_tac(x2538)
      fn(
        x2540 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2539(x2540)
      }
    },
    @list.List([@term_syntax.parse_term("(f : (B) -> A) => f((b : B))"), t2541]),
  )
  let t2537 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_sing()]),
  )
  let t2536 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.not_in_empty()]),
  )
  let t2535 = @simp.rewrite_tac(@list.List([exp_c(), eq_c_bijections()]))
  let t2545 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2535),
            t2536,
          ),
          t2537,
        ),
        t2542,
      ),
      t2543,
    ),
    t2544,
  )
  card_exp_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ b : B, op_eq_us_c(op_caret_us_c(s, {b}), s)"),
      t2545,
    ),
  )
}

///|
let card_exp_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_SING")

///|
/// `CARD_EXP_SING`
pub fn card_exp_sing() -> @kernel.Thm {
  card_exp_sing_c.get()
}

///|
/// CARD_LE_EXP_LEFT
fn step_251() -> Unit raise {
  let t2552 = @meson.asm_meson_tac(@list.List([]))
  let t2551 = @simp.simp_tac(
    @list.List([@sets.in_elim_thm(), @class.fun_eq_thm()]),
  )
  let t2550 = @tactics.exists_tac(
    @term_syntax.parse_term("(g : (C) -> A) => (z : C) => if IN(z, (t : (C) -> Bool)) { (f : (A) -> B)(g(z)) } else { select((x : B) => false) }"),
  )
  let t2547 = @term_syntax.parse_term("(f : (A) -> B)")
  let t2549 = @tactics.disch_then((x2548 : @kernel.Thm) => {
    @tactics.x_choose_tac(t2547, x2548)
  })
  let t2546 = @simp.rewrite_tac(@list.List([@sets.le_c(), exp_c()]))
  let t2553 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2546),
          t2549,
        ),
        t2550,
      ),
      t2551,
    ),
    t2552,
  )
  card_le_exp_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, op_lt_eq_us_c(s, s') → op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t))"),
      t2553,
    ),
  )
}

///|
let card_le_exp_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_EXP_LEFT",
)

///|
/// `CARD_LE_EXP_LEFT`
pub fn card_le_exp_left() -> @kernel.Thm {
  card_le_exp_left_c.get()
}

///|
/// CARD_LE_EXP_RIGHT
fn step_252() -> Unit raise {
  let t2585 = @meson.asm_meson_tac(@list.List([]))
  let t2581 = @term_syntax.parse_term("(f : (B) -> C)((b : B))")
  let t2584 = @tactics.first_x_assum(fn(
    x2583 : @kernel.Thm,
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
      x2578 : @kernel.Thm,
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
      let s2579 = @tactics.mp_tac(x2578)
      fn(
        x2580 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2579(x2580)
      }
    })(((x2582 : @kernel.Thm) => @bool.spec(t2581, x2582))(x2583))
  })
  let t2577 = @simp.asm_simp_tac(@list.List([]))
  let t2576 = @class.asm_cases_tac(@term_syntax.parse_term("IN((b : B), (t : (B) -> Bool))"))
  let t2575 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : B)"))
  let t2574 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2572 = @term_syntax.parse_term("(l : (B) -> A)")
  let t2573 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k : (B) -> A)"), t2572]),
  )
  let t2571 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2570 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t2569 = @tactics.exists_tac(
    @term_syntax.parse_term("(g : (B) -> A) => (c : C) => if IN(c, (t' : (C) -> Bool)) { if IN((h : (C) -> B)(c), (t : (B) -> Bool)) { g(h(c)) } else { (a : A) } } else { select((x : A) => false) }"),
  )
  let t2566 = @term_syntax.parse_term("(h : (C) -> B)")
  let t2568 = @tactics.disch_then((x2567 : @kernel.Thm) => {
    @tactics.x_choose_tac(t2566, x2567)
  })
  let t2563 = @simp.gen_rewrite_rule(
    fn(
      x2562 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2562
    },
    @list.List([@sets.injective_on_left_inverse()]),
  )
  let t2565 = @tactics.first_assum(fn(
    x2564 : @kernel.Thm,
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
      x2559 : @kernel.Thm,
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
      let s2560 = @tactics.mp_tac(x2559)
      fn(
        x2561 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2560(x2561)
      }
    })(t2563(x2564))
  })
  let t2557 = @tactics.x_choose_then(@term_syntax.parse_term("(f : (B) -> C)"))(
    @tactics.strip_assume_tac,
  )
  let t2555 = @term_syntax.parse_term("(a : A)")
  let t2558 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x2556 : @kernel.Thm) => @tactics.x_choose_tac(t2555, x2556),
      t2557,
    ),
  )
  let t2554 = @simp.rewrite_tac(
    @list.List([@sets.le_c(), exp_c(), @equal.gsym(@sets.member_not_empty())]),
  )
  let t2586 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  t2554,
                                ),
                                t2558,
                              ),
                              t2565,
                            ),
                            t2568,
                          ),
                          t2569,
                        ),
                        t2570,
                      ),
                      @tactics.conj_tac,
                    ),
                    t2571,
                  ),
                  t2573,
                ),
                t2574,
              ),
              @tactics.strip_tac,
            ),
            t2575,
          ),
          t2576,
        ),
        t2577,
      ),
      t2584,
    ),
    t2585,
  )
  card_le_exp_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ t' : (C) -> Bool, !(s == {}) && op_lt_eq_us_c(t, t') → op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s, t'))"),
      t2586,
    ),
  )
}

///|
let card_le_exp_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_EXP_RIGHT",
)

///|
/// `CARD_LE_EXP_RIGHT`
pub fn card_le_exp_right() -> @kernel.Thm {
  card_le_exp_right_c.get()
}

///|
/// CARD_LE_EXP
fn step_253() -> Unit raise {
  let t2589 = @simp.asm_simp_tac(
    @list.List([card_le_exp_right(), card_le_exp_left()]),
  )
  let t2587 = @term_syntax.parse_term("op_caret_us_c((s : (A) -> Bool), (t' : (D) -> Bool))")
  let t2588 = @tactics.trans_tac(card_le_trans())(t2587)
  let t2590 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2588),
    t2589,
  )
  card_le_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, !(s == {}) && op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') → op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t'))"),
      t2590,
    ),
  )
}

///|
let card_le_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_EXP")

///|
/// `CARD_LE_EXP`
pub fn card_le_exp() -> @kernel.Thm {
  card_le_exp_c.get()
}

///|
/// CARD_EXP_CONG
fn step_254() -> Unit raise {
  let t2616 = @simp.asm_simp_tac(
    @list.List([card_le_exp(), @equal.gsym(card_le_antisym())]),
  )
  let t2615 = @simp.asm_rewrite_tac(@list.List([card_eq_empty()]))
  let t2614 = @class.asm_cases_tac(@term_syntax.parse_term("(s' : (B) -> Bool) == {}"))
  let t2617 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([card_eq_sym()])),
        t2614,
      ),
      t2615,
    ),
    t2616,
  )
  let t2613 = @simp.asm_rewrite_tac(@list.List([]))
  let t2610 = @term_syntax.parse_term("0")
  let t2611 = @bool.ispecl(
    @list.List([@term_syntax.parse_term("(t' : (D) -> Bool)"), t2610]),
    card_exp_zero(),
  )
  let t2609 = @term_syntax.parse_type("A")
  let t2612 = @tactics.mp_tac(
    @kernel.inst_type(@list.List([(@term_syntax.parse_type("B"), t2609)]), t2611),
  )
  let t2608 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(card_eq_trans()),
  )
  let t2607 = @simp.gen_rewrite_tac(
    fn(
      x2604 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2605 = @equal.land_conv(x2604)
      fn(x2606 : @kernel.Term) -> @kernel.Thm raise { s2605(x2606) }
    },
    @list.List([card_eq_sym()]),
  )
  let t2603 = @simp.asm_rewrite_tac(@list.List([]))
  let t2602 = @term_syntax.parse_term("0")
  let t2618 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.strip_tac,
                @tactics.mp_tac(
                  @bool.ispecl(
                    @list.List([@term_syntax.parse_term("(t : (C) -> Bool)"), t2602]),
                    card_exp_zero(),
                  ),
                ),
              ),
              t2603,
            ),
            t2607,
          ),
          t2608,
        ),
        t2612,
      ),
      t2613,
    ),
    t2617,
  ])
  let t2601 = @simp.asm_simp_tac(@list.List([card_eq_empty()]))
  let t2600 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t2597 = @simp.asm_rewrite_tac(@list.List([card_eq_empty()]))
  let t2596 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (C) -> Bool) == {}"))
  let t2598 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([card_eq_sym()])),
      t2596,
    ),
    t2597,
  )
  let t2595 = @simp.rewrite_tac(
    @list.List([
      card_exp_0(),
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_exp_0()),
    ]),
  )
  let t2593 = @term_syntax.parse_term("{0}")
  let t2594 = @tactics.trans_tac(card_eq_trans())(t2593)
  let t2599 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2594),
      t2595,
    ),
    t2598,
  ])
  let t2592 = @simp.asm_simp_tac(@list.List([card_eq_empty()]))
  let t2591 = @class.asm_cases_tac(@term_syntax.parse_term("(t' : (D) -> Bool) == {}"))
  let t2619 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2591),
            t2592,
          ),
          t2599,
        ),
        t2600,
      ),
      t2601,
    ),
    t2618,
  )
  card_exp_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ s' : (B) -> Bool, ∀ t : (C) -> Bool, ∀ t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') → op_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t'))"),
      t2619,
    ),
  )
}

///|
let card_exp_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_CONG")

///|
/// `CARD_EXP_CONG`
pub fn card_exp_cong() -> @kernel.Thm {
  card_exp_cong_c.get()
}

///|
/// CARD_EXP_FINITE
fn step_255() -> Unit raise {
  let t2641 = @sets.set_tac(@list.List([]))
  let t2640 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @pair.forall_pair_thm(), @sets.in_cross()]),
  )
  let t2639 = @tactics.match_mp_tac(card_le_subset())
  let t2638 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2635 = @drule.match_mp(card_eq_imp_le())
  let t2637 = @tactics.disch_then(fn(
    x2636 : @kernel.Thm,
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
      x2632 : @kernel.Thm,
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
      let s2633 = @tactics.mp_tac(x2632)
      fn(
        x2634 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2633(x2634)
      }
    })(t2635(x2636))
  })
  let t2630 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t2631 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t2630]),
      card_exp_graph_paired(),
    ),
  )
  let t2629 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_finite()),
  )
  let t2626 = @drule.match_mp(@sets.finite_cross())
  let t2624 = @drule.match_mp(@sets.finite_powerset())
  let t2628 = @tactics.disch_then(fn(
    x2627 : @kernel.Thm,
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
      x2625 : @kernel.Thm,
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
        x2621 : @kernel.Thm,
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
        let s2622 = @tactics.mp_tac(x2621)
        fn(
          x2623 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2622(x2623)
        }
      })(t2624(x2625))
    })(t2626(x2627))
  })
  let t2620 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t2642 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t2620,
                  ),
                  t2628,
                ),
                t2629,
              ),
              t2631,
            ),
            t2637,
          ),
          t2638,
        ),
        t2639,
      ),
      t2640,
    ),
    t2641,
  )
  card_exp_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → FINITE(op_caret_us_c(s, t))"),
      t2642,
    ),
  )
}

///|
let card_exp_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_FINITE",
)

///|
/// `CARD_EXP_FINITE`
pub fn card_exp_finite() -> @kernel.Thm {
  card_exp_finite_c.get()
}

///|
/// CARD_EXP_C
fn step_256() -> Unit raise {
  let t2664 = @simp.asm_simp_tac(@list.List([card_exp_sing()]))
  let t2663 = @tactics.match_mp_tac(card_eq_card_imp())
  let t2661 = @simp.asm_simp_tac(
    @list.List([card_mul_c(), card_exp_finite(), @sets.finite_sing()]),
  )
  let t2660 = @simp.asm_simp_tac(
    @list.List([card_exp_finite(), card_mul_finite(), @sets.finite_sing()]),
  )
  let t2659 = @simp.rewrite_tac(@list.List([card_exp_add()]))
  let t2662 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(card_eq_card_imp()), t2659),
      t2660,
    ),
    t2661,
  ])
  let t2657 = @term_syntax.parse_term("CARD(op_star_us_c(op_caret_us_c((s : (A) -> Bool), {(b : B)}), op_caret_us_c(s, (t : (B) -> Bool))))")
  let t2658 = @tactics.trans_tac(@theorems.eq_trans())(t2657)
  let t2655 = @simp.asm_simp_tac(
    @list.List([
      card_eq_card(),
      @sets.finite_insert(),
      card_add_finite(),
      @sets.finite_empty(),
      card_add_c(),
      @sets.card_sing(),
      @sets.card_clauses(),
    ]),
  )
  let t2654 = @simp.rewrite_tac(@list.List([card_eq_refl()]))
  let t2653 = @tactics.match_mp_tac(card_exp_cong())
  let t2652 = @simp.asm_simp_tac(
    @list.List([card_exp_finite(), card_add_finite(), @sets.finite_sing()]),
  )
  let t2656 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(card_eq_card_imp()), t2652),
            t2653,
          ),
          t2654,
        ),
        t2655,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2650 = @term_syntax.parse_term("CARD(op_caret_us_c((s : (A) -> Bool), op_plus_us_c({(b : B)}, (t : (B) -> Bool))))")
  let t2651 = @tactics.trans_tac(@theorems.eq_trans())(t2650)
  let t2647 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t2648 = @tactics.then_tac(
    @tactics.map_every(
      @tactics.x_gen_tac,
      @list.List([@term_syntax.parse_term("(b : B)"), t2647]),
    ),
    @tactics.strip_tac,
  )
  let t2646 = @simp.simp_tac(@list.List([card_exp_0(), @sets.finite_sing()]))
  let t2645 = @tactics.match_mp_tac(card_eq_card_imp())
  let t2649 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(
          @list.List([
            @equal.gsym(@bool.ispec(@term_syntax.parse_term("0"), @sets.card_sing())),
          ]),
        ),
        t2645,
      ),
      t2646,
    ),
    t2648,
  ])
  let t2644 = @simp.asm_simp_tac(
    @list.List([@sets.card_clauses(), @arith.exp()]),
  )
  let t2643 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2665 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.thenl(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @simp.rewrite_tac(
                                    @list.List([
                                      @theorems.imp_conj(),
                                      @theorems.right_forall_imp_thm(),
                                    ]),
                                  ),
                                  @tactics.gen_tac,
                                ),
                                @tactics.disch_tac,
                              ),
                              t2643,
                            ),
                            t2644,
                          ),
                          @tactics.conj_tac,
                        ),
                        t2649,
                      ),
                      t2651,
                    ),
                    @tactics.conj_tac,
                  ),
                  t2656,
                ),
                t2658,
              ),
              @tactics.conj_tac,
            ),
            t2662,
          ),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t2663,
    ),
    t2664,
  )
  card_exp_c_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → CARD(op_caret_us_c(s, t)) == EXP(CARD(s), CARD(t))"),
      t2665,
    ),
  )
}

///|
let card_exp_c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EXP_C")

///|
/// `CARD_EXP_C`
pub fn card_exp_c() -> @kernel.Thm {
  card_exp_c_c.get()
}

///|
/// CARD_EXP_POWERSET
fn step_257() -> Unit raise {
  let t2672 = @sets.set_tac(@list.List([]))
  let t2671 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t2669 = @term_syntax.parse_term("(t : (A) -> Bool) => (x : A) => if IN(x, (s : (A) -> Bool)) { IN(x, t) } else { select((b : Bool) => false) }")
  let t2670 = @tactics.map_every(
    fn(
      x2666 : @kernel.Term,
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
      let s2667 = @tactics.exists_tac(x2666)
      fn(
        x2668 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2667(x2668)
      }
    },
    @list.List([@term_syntax.parse_term("(P : (A) -> Bool) => {(x : A) | IN(x, (s : (A) -> Bool)) && P(x)}"), t2669]),
  )
  let t2673 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([exp_c(), eq_c_bijections(), @sets.in_univ()]),
          ),
        ),
        t2670,
      ),
      t2671,
    ),
    t2672,
  )
  card_exp_powerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (op_eq_us_c : (((A) -> Bool) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s), {(t : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(t, s)})"),
      t2673,
    ),
  )
}

///|
let card_exp_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_POWERSET",
)

///|
/// `CARD_EXP_POWERSET`
pub fn card_exp_powerset() -> @kernel.Thm {
  card_exp_powerset_c.get()
}

///|
/// CARD_EXP_CANTOR
fn step_258() -> Unit raise {
  let t2678 = @simp.rewrite_tac(@list.List([card_exp_powerset()]))
  let t2677 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t2676 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2675 = @simp.rewrite_tac(@list.List([cantor_thm()]))
  let t2674 = @term_syntax.parse_term("{(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}")
  let t2679 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.trans_tac(card_lte_trans())(t2674),
          ),
          t2675,
        ),
        t2676,
      ),
      t2677,
    ),
    t2678,
  )
  card_exp_cantor_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, (op_lt_us_c : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)(s, (op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s))"), t2679),
  )
}

///|
let card_exp_cantor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_CANTOR",
)

///|
/// `CARD_EXP_CANTOR`
pub fn card_exp_cantor() -> @kernel.Thm {
  card_exp_cantor_c.get()
}

///|
/// CARD_EXP_ABSORB
fn step_259() -> Unit raise {
  let t2690 = @simp.asm_simp_tac(
    @list.List([card_square_infinite(), card_eq_refl()]),
  )
  let t2689 = @tactics.match_mp_tac(card_exp_cong())
  let t2688 = @simp.simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_exp_mul()),
    ]),
  )
  let t2686 = @term_syntax.parse_term("(op_caret_us_c : ((Bool) -> Bool, ((B, B)) -> Bool, ((B, B)) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (op_star_us_c : ((B) -> Bool, (B) -> Bool, (B, B)) -> Bool)((t : (B) -> Bool), t))")
  let t2687 = @tactics.trans_tac(card_eq_trans())(t2686)
  let t2685 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2684 = @simp.asm_simp_tac(@list.List([card_le_exp_left()]))
  let t2682 = @term_syntax.parse_term("(op_caret_us_c : (((B) -> Bool) -> Bool, (B) -> Bool, (B, B) -> Bool) -> Bool)((op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (t : (B) -> Bool)), t)")
  let t2683 = @tactics.trans_tac(card_le_trans())(t2682)
  let t2681 = @simp.asm_simp_tac(
    @list.List([card_le_exp_left(), card_le_refl()]),
  )
  let t2680 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t2691 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t2680,
                  ),
                  t2681,
                ),
                t2683,
              ),
              t2684,
            ),
            t2685,
          ),
          t2687,
        ),
        t2688,
      ),
      t2689,
    ),
    t2690,
  )
  card_exp_absorb_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (INFINITE : ((B) -> Bool) -> Bool)(t) && (op_lt_eq_us_c : ((Bool) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s) && (op_lt_eq_us_c : ((A) -> Bool, ((B) -> Bool) -> Bool) -> Bool)(s, (op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), t)) → (op_eq_us_c : (((B) -> A) -> Bool, ((B) -> Bool) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t), (op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), t))"),
      t2691,
    ),
  )
}

///|
let card_exp_absorb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_ABSORB",
)

///|
/// `CARD_EXP_ABSORB`
pub fn card_exp_absorb() -> @kernel.Thm {
  card_exp_absorb_c.get()
}

///|
/// CARD_EXP_LE_REAL
fn step_260() -> Unit raise {
  let t2731 = @simp.rewrite_tac(
    @list.List([@equal.gsym(mul_c_univ()), card_square_num()]),
  )
  let t2730 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t2729 = @simp.rewrite_tac(@list.List([card_eq_refl()]))
  let t2728 = @tactics.match_mp_tac(card_funspace_cong())
  let t2727 = @simp.rewrite_tac(@list.List([card_eq_real()]))
  let t2725 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t2726 = @tactics.trans_tac(card_eq_trans())(t2725)
  let t2724 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t2723 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2722 = @simp.simp_tac(
    @list.List([card_funspace_curry(), card_eq_imp_le()]),
  )
  let t2721 = @term_syntax.parse_term("(UNIV : (((Num, Num)) -> Bool) -> Bool)")
  let t2732 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.trans_tac(card_le_trans())(t2721),
                    t2722,
                  ),
                  t2723,
                ),
                t2724,
              ),
              t2726,
            ),
            t2727,
          ),
          t2728,
        ),
        t2729,
      ),
      t2730,
    ),
    t2731,
  )
  let t2720 = @simp.simp_tac(
    @list.List([card_exp_univ(), card_eq_imp_le(), card_eq_real()]),
  )
  let t2719 = @simp.asm_rewrite_tac(@list.List([]))
  let t2717 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t2718 = @tactics.trans_tac(card_le_trans())(t2717)
  let t2716 = @simp.asm_rewrite_tac(@list.List([]))
  let t2715 = @tactics.match_mp_tac(card_le_exp())
  let t2733 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@equal.gsym(card_exp_univ())])),
              t2715,
            ),
            t2716,
          ),
          t2718,
        ),
        t2719,
      ),
      t2720,
    ),
    t2732,
  ])
  let t2713 = @term_syntax.parse_term("(UNIV : ((Num, Num) -> Bool) -> Bool)")
  let t2714 = @tactics.trans_tac(card_le_trans())(t2713)
  let t2711 = @simp.rewrite_tac(
    @list.List([card_empty_le(), card_sing_le(), @sets.univ_not_empty()]),
  )
  let t2710 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2707 = @drule.match_mp(card_eq_imp_le())
  let t2709 = @tactics.disch_then(fn(
    x2708 : @kernel.Thm,
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
      x2704 : @kernel.Thm,
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
      let s2705 = @tactics.mp_tac(x2704)
      fn(
        x2706 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2705(x2706)
      }
    })(t2707(x2708))
  })
  let t2698 = @drule.part_match(@equal.lhand, card_exp_zero())
  let t2712 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            fn(
              x2703 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x2702 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x2700 : @kernel.Term,
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
                    x2699 : @kernel.Term,
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
                    (fn(
                      x2695 : @kernel.Thm,
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
                      let s2696 = @tactics.mp_tac(x2695)
                      fn(
                        x2697 : (
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
                      ) raise {
                        s2696(x2697)
                      }
                    })(t2698(x2699))
                  })(@equal.lhand(x2700))
                })(
                  (fn(
                    x2701 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x2701.1
                  })(x2702),
                )
              })(x2703)(x2703)
            },
            t2709,
          ),
          t2710,
        ),
        @class.cond_cases_tac,
      ),
      t2711,
    ),
    @tactics.all_tac,
  ])
  let t2694 = @simp.asm_rewrite_tac(@list.List([]))
  let t2693 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t2692 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2734 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
                t2692,
              ),
              t2693,
            ),
            t2694,
          ),
          t2712,
        ),
        t2714,
      ),
      @tactics.conj_tac,
    ),
    t2733,
  )
  card_exp_le_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) && (COUNTABLE : ((B) -> Bool) -> Bool)(t) → (op_lt_eq_us_c : (((B) -> A) -> Bool, (Real) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t), (UNIV : (Real) -> Bool))"),
      t2734,
    ),
  )
}

///|
let card_exp_le_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_LE_REAL",
)

///|
/// `CARD_EXP_LE_REAL`
pub fn card_exp_le_real() -> @kernel.Thm {
  card_exp_le_real_c.get()
}

///|
/// CARD_EXP_EQ_REAL
fn step_261() -> Unit raise {
  let t2741 = @simp.asm_rewrite_tac(
    @list.List([@sets.univ_not_empty(), card_le_refl(), card_sing_le()]),
  )
  let t2740 = @tactics.match_mp_tac(card_le_exp())
  let t2739 = @simp.simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_exp_sing()),
      card_eq_imp_le(),
    ]),
  )
  let t2737 = @term_syntax.parse_term("(op_caret_us_c : ((Real) -> Bool, (A) -> Bool, (A) -> Real) -> Bool)((UNIV : (Real) -> Bool), {(a : A)})")
  let t2738 = @tactics.trans_tac(card_le_trans())(t2737)
  let t2736 = @simp.asm_simp_tac(
    @list.List([card_exp_le_real(), card_le_refl()]),
  )
  let t2735 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t2742 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2735),
            t2736,
          ),
          t2738,
        ),
        t2739,
      ),
      t2740,
    ),
    t2741,
  )
  card_exp_eq_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (COUNTABLE : ((A) -> Bool) -> Bool)(s) && !(s == ({} : (A) -> Bool)) → (op_eq_us_c : (((A) -> Real) -> Bool, (Real) -> Bool) -> Bool)((op_caret_us_c : ((Real) -> Bool, (A) -> Bool, (A) -> Real) -> Bool)((UNIV : (Real) -> Bool), s), (UNIV : (Real) -> Bool))"),
      t2742,
    ),
  )
}

///|
let card_exp_eq_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_EQ_REAL",
)

///|
/// `CARD_EXP_EQ_REAL`
pub fn card_exp_eq_real() -> @kernel.Thm {
  card_exp_eq_real_c.get()
}

///|
let card_eq_restricted_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_RESTRICTED_POWERSET",
)

///|
/// `CARD_EQ_RESTRICTED_POWERSET`
pub fn card_eq_restricted_powerset() -> @kernel.Thm {
  card_eq_restricted_powerset_c.get()
}

///|
let card_eq_limited_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_LIMITED_POWERSET",
)

///|
/// `CARD_EQ_LIMITED_POWERSET`
pub fn card_eq_limited_powerset() -> @kernel.Thm {
  card_eq_limited_powerset_c.get()
}

///|
/// CARD_EQ_RESTRICTED_POWERSET, CARD_EQ_LIMITED_POWERSET
fn step_262() -> Unit raise {
  let t2749 = @simp.asm_simp_tac(@list.List([]))
  let t2746 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t2747 = @tactics.trans_tac(card_le_trans())(t2746)
  let t2745 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t2748 = @list.List([@tactics.trans_tac(card_le_trans())(t2745), t2747])
  let t2744 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2750 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @simp.simp_tac(@list.List([@equal.gsym(card_le_antisym())])),
        t2744,
      ),
      t2748,
    ),
    t2749,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, u) && op_lt_eq_us_c(u, s) → op_eq_us_c(s, u) && op_eq_us_c(t, u)"),
    t2750,
  )
  let t2872 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2871 = @tactics.match_mp_tac(card_eq_image())
  let t2870 = @simp.asm_simp_tac(@list.List([]))
  let t2868 = @term_syntax.parse_term("(u : ((B, A)) -> Bool)")
  let t2869 = @tactics.trans_tac(card_eq_trans())(t2868)
  let t2867 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2866 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2864 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2865 = @list.List([
    @tactics.x_gen_tac(@term_syntax.parse_term("(u : ((B, A)) -> Bool)")),
    t2864,
  ])
  let t2863 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2862 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((p : ((B, A)) -> A))"))
  let t2861 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : ((B, A)) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2860 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t2859 = @list.List([
    @simp.asm_simp_tac(@list.List([card_mul_absorb_le()])),
    @tactics.all_tac,
  ])
  let t2873 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.subgoal_then(
                              @term_syntax.parse_term("op_lt_eq_us_c(op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool)), s)"),
                              fn(
                                x2856 : @kernel.Thm,
                              ) -> ((
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
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
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise) raise {
                                let s2857 = @tactics.mp_tac(x2856)
                                fn(
                                  x2858 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
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
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise {
                                  s2857(x2858)
                                }
                              },
                            ),
                            t2859,
                          ),
                          t2860,
                        ),
                        t2861,
                      ),
                      t2862,
                    ),
                    t2863,
                  ),
                  @tactics.conj_tac,
                ),
                t2865,
              ),
              t2866,
            ),
            t2867,
          ),
          t2869,
        ),
        t2870,
      ),
      t2871,
    ),
    t2872,
  )
  let t2855 = @meson.asm_meson_tac(@list.List([@pair.pair_eq(), @sets.in_()]))
  let t2854 = @simp.rewrite_tac(
    @list.List([
      @bool.exists_unique_def(),
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t2853 = @tactics.exists_tac(@term_syntax.parse_term("(FST : ((B, A)) -> B)"))
  let t2852 = @simp.rewrite_tac(@list.List([@sets.eq_c()]))
  let t2851 = @list.List([
    @meson.asm_meson_tac(@list.List([@sets.in_()])),
    @tactics.all_tac,
  ])
  let t2850 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2849 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t2848 = @tactics.x_gen_tac(@term_syntax.parse_term("(R : ((B, A)) -> Bool)"))
  let t2847 = @simp.rewrite_tac(
    @list.List([@sets.subset(), mul_c(), @sets.in_elim_thm()]),
  )
  let t2846 = @tactics.match_mp_tac(card_le_subset())
  let t2845 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2842 = @drule.match_mp(card_eq_imp_le())
  let t2844 = @tactics.disch_then(fn(
    x2843 : @kernel.Thm,
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
      x2839 : @kernel.Thm,
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
      let s2840 = @tactics.mp_tac(x2839)
      fn(
        x2841 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2840(x2841)
      }
    })(t2842(x2843))
  })
  let t2838 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t2874 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.mp_tac(
                              @bool.ispecl(
                                @list.List([
                                  @term_syntax.parse_term("(s : (A) -> Bool)"),
                                  t2838,
                                ]),
                                card_exp_graph_paired(),
                              ),
                            ),
                            t2844,
                          ),
                          t2845,
                        ),
                        t2846,
                      ),
                      t2847,
                    ),
                    t2848,
                  ),
                  t2849,
                ),
                t2850,
              ),
              t2851,
            ),
            t2852,
          ),
          t2853,
        ),
        t2854,
      ),
      t2855,
    ),
    t2873,
  ])
  let t2837 = @term_syntax.parse_term("{(k : ((B, A)) -> Bool) | SUBSET(k, op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool))) && op_eq_us_c(k, t)}")
  let t2875 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.trans_tac(card_le_trans())(t2837),
      @tactics.conj_tac,
    ),
    t2874,
  )
  let t2836 = @simp.asm_simp_tac(
    @list.List([@sets.sing_subset(), @sets.not_insert_empty(), card_sing_le()]),
  )
  let t2835 = @simp.simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("({(a : _)} == {(b : _)}) == (a == b)")),
      @sets.in_elim_thm(),
    ]),
  )
  let t2834 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => {x}"))
  let t2833 = @simp.once_rewrite_tac(@list.List([@sets.le_c()]))
  let t2832 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      card_le_infinite(),
    ),
  )
  let t2831 = @tactics.undisch_tac(@term_syntax.parse_term("INFINITE((s : (A) -> Bool))"))
  let t2829 = @simp.asm_rewrite_tac(@list.List([@sets.finite_sing()]))
  let t2830 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.match_mp_tac(card_le_finite_infinite()),
      ),
      t2829,
    ),
    @tactics.all_tac,
  ])
  let t2828 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")),
  )
  let t2827 = @tactics.match_mp_tac(card_add_absorb_left())
  let t2826 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2825 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2819 = @drule.part_match(@equal.lhand, union_le_add_c())
  let t2814 = @simp.asm_rewrite_tac(@list.List([card_empty_le()]))
  let t2813 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (A) -> Bool) == {}"))
  let t2812 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (A) -> Bool)"))
  let t2811 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_union(), @sets.in_sing()]),
  )
  let t2810 = @simp.gen_rewrite_tac(
    fn(
      x2809 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2809
    },
    @list.List([@sets.subset()]),
  )
  let t2815 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(card_le_subset()), t2810),
            t2811,
          ),
          t2812,
        ),
        t2813,
      ),
      t2814,
    ),
    @tactics.all_tac,
  ])
  let t2807 = @term_syntax.parse_term("UNION({{}}, {(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool)) && !(k == {}) && op_lt_eq_us_c(k, (t : (B) -> Bool))})")
  let t2808 = @tactics.trans_tac(card_le_trans())(t2807)
  let t2805 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2804 = @simp.asm_simp_tac(@list.List([exp_c(), @sets.in_elim_thm()]))
  let t2803 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : B) => if IN(y, (t : (B) -> Bool)) { (f : (B) -> A)(y) } else { select((y : A) => false) }"),
  )
  let t2802 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (B) -> A)"))(fn(
      x2801 : @kernel.Thm,
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
        x2798 : @kernel.Thm,
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
        let s2799 = @tactics.subst_all_tac(x2798)
        fn(
          x2800 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2799(x2800)
        }
      })(@equal.sym(x2801))
    }),
  )
  let t2797 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (A) -> Bool)"))
  let t2796 = @tactics.exists_tac(@term_syntax.parse_term("(f : (B) -> A) => IMAGE(f, (t : (B) -> Bool))"))
  let t2795 = @simp.simp_tac(
    @list.List([@sets.forall_in_gspec(), @theorems.imp_conj(), le_c_image()]),
  )
  let t2806 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.gen_rewrite_tac(
                        fn(
                          x2794 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          x2794
                        },
                        @list.List([@sets.le_c_v1()]),
                      ),
                      t2795,
                    ),
                    t2796,
                  ),
                  t2797,
                ),
                @tactics.strip_tac,
              ),
              @tactics.strip_tac,
            ),
            t2802,
          ),
          t2803,
        ),
        t2804,
      ),
      t2805,
    ),
  ])
  let t2792 = @term_syntax.parse_term("{(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool)) && !(k == {}) && op_lt_eq_us_c(k, (t : (B) -> Bool))}")
  let t2793 = @tactics.trans_tac(card_le_trans())(t2792)
  let t2790 = @simp.rewrite_tac(@list.List([card_exp_0()]))
  let t2789 = @tactics.match_mp_tac(
    @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_eq_imp_le()),
  )
  let t2791 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            card_le_empty(),
            @sets.sing_gspec(),
            @sets.set_rule(
              @term_syntax.parse_term("(SUBSET((k : (_) -> Bool), (s : (_) -> Bool)) && k == {}) == (k == {})"),
            ),
          ]),
        ),
        t2789,
      ),
      t2790,
    ),
    @tactics.all_tac,
  ])
  let t2876 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.thenl(
                                          @class.asm_cases_tac(
                                            @term_syntax.parse_term("(t : (B) -> Bool) == {}"),
                                          ),
                                          t2791,
                                        ),
                                        t2793,
                                      ),
                                      @tactics.conj_tac,
                                    ),
                                    t2806,
                                  ),
                                  t2808,
                                ),
                                @tactics.conj_tac,
                              ),
                              t2815,
                            ),
                            fn(
                              x2824 : (
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
                              (fn(
                                x2823 : (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> ((
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
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
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise) raise {
                                (fn(
                                  x2821 : @kernel.Term,
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
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
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  (fn(
                                    x2820 : @kernel.Term,
                                  ) -> ((
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> (
                                    (
                                      @list.List[@kernel.Term],
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
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
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise) raise {
                                    (fn(
                                      x2816 : @kernel.Thm,
                                    ) -> ((
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> (
                                      (
                                        @list.List[@kernel.Term],
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
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
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                        @list.List[@kernel.Thm],
                                      ) -> @kernel.Thm raise,
                                    ) raise) raise {
                                      let s2817 = @tactics.mp_tac(x2816)
                                      fn(
                                        x2818 : (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ) -> (
                                        (
                                          @list.List[@kernel.Term],
                                          (
                                            @list.List[(Int64, @kernel.Term)],
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
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
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
                                          ),
                                          @list.List[@kernel.Thm],
                                        ) -> @kernel.Thm raise,
                                      ) raise {
                                        s2817(x2818)
                                      }
                                    })(t2819(x2820))
                                  })(@equal.lhand(x2821))
                                })(
                                  (fn(
                                    x2822 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> @kernel.Term raise {
                                    x2822.1
                                  })(x2823),
                                )
                              })(x2824)(x2824)
                            },
                          ),
                          t2825,
                        ),
                        t2826,
                      ),
                      t2827,
                    ),
                    t2828,
                  ),
                  @tactics.conj_tac,
                ),
                t2830,
              ),
              t2831,
            ),
            t2832,
          ),
          t2833,
        ),
        t2834,
      ),
      t2835,
    ),
    t2836,
  )
  let t2788 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), card_eq_imp_le()]),
  )
  let t2877 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(card_le_subset()), t2788),
    t2876,
    t2875,
  ])
  let t2787 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2786 = @tactics.match_mp_tac(lemma)
  let t2783 = @meson.asm_meson_tac(@list.List([card_le_total()]))
  let t2782 = @simp.asm_simp_tac(@list.List([card_le_subset()]))
  let t2780 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t2781 = @tactics.trans_tac(card_le_trans())(t2780)
  let t2779 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (A) -> Bool)"))
  let t2778 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("({(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | P(x)}) == (∀ x : _, P(x) → Q(x))"),
      ),
    ]),
  )
  let t2777 = @tactics.match_mp_tac(card_eq_refl_imp())
  let t2776 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_exp_powerset()),
    ]),
  )
  let t2775 = @term_syntax.parse_term("{(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool))}")
  let t2784 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.trans_tac(card_eq_trans())(t2775),
                  t2776,
                ),
                t2777,
              ),
              t2778,
            ),
            t2779,
          ),
          @tactics.disch_tac,
        ),
        t2781,
      ),
      t2782,
    ),
    t2783,
  )
  let t2774 = @tactics.first_assum(fn(
    x2771 : @kernel.Thm,
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
    let s2772 = @tactics.accept_tac(x2771)
    fn(
      x2773 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2772(x2773)
    }
  })
  let t2770 = @simp.once_rewrite_tac(@list.List([card_eq_sym()]))
  let t2769 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2768 = @simp.asm_simp_tac(@list.List([card_le_subset()]))
  let t2766 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t2767 = @tactics.trans_tac(card_le_trans())(t2766)
  let t2765 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t2764 = @tactics.first_x_assum(fn(
    x2763 : @kernel.Thm,
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
      x2756 : @kernel.Thm,
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
      let s2757 = @tactics.mp_tac(x2756)
      fn(
        x2758 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2757(x2758)
      }
    })(
      ((x2762 : @kernel.Thm) => {
        @lib.check(
          fn(x2761 : @kernel.Thm) -> Bool raise {
            (fn(x2759 : @kernel.Term) -> Bool raise { @basics.is_neg(x2759) })(
              (fn(x2760 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x2760)
              })(x2761),
            )
          },
          x2762,
        )
      })(x2763),
    )
  })
  let t2755 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (A) -> Bool)"))
  let t2785 = @list.List([
    @tactics.all_tac,
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @simp.rewrite_tac(
                            @list.List([
                              card_eq_empty(),
                              @sets.extension(),
                              @sets.not_in_empty(),
                              @sets.in_elim_thm(),
                            ]),
                          ),
                          t2755,
                        ),
                        t2764,
                      ),
                      t2765,
                    ),
                    @tactics.strip_tac,
                  ),
                  t2767,
                ),
                t2768,
              ),
              t2769,
            ),
            t2770,
          ),
          t2774,
        ),
        t2784,
      ]),
    ),
  ])
  let t2754 = @simp.asm_rewrite_tac(@list.List([]))
  let t2753 = @simp.asm_rewrite_tac(@list.List([]))
  let t2752 = @class.asm_cases_tac(@term_syntax.parse_term("INFINITE((s : (A) -> Bool))"))
  let t2751 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2878 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                    t2751,
                  ),
                  t2752,
                ),
                t2753,
              ),
              @class.cond_cases_tac,
            ),
            t2754,
          ),
          t2785,
        ),
        t2786,
      ),
      t2787,
    ),
    t2877,
  )
  let t2879 = (
    @term_syntax.parse_term("(∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) → (op_eq_us_c : (((A) -> Bool) -> Bool, ((B) -> A) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, if (op_lt_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s) { (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t) } else { ({} : ((B) -> A) -> Bool) })) && (∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) → (if (op_lt_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s) { (op_eq_us_c : (((A) -> Bool) -> Bool, ((B) -> A) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t)) } else { (op_eq_us_c : (((A) -> Bool) -> Bool, ((A) -> Bool) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, (op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s)) }))"),
    t2878,
  )
  let (card_eq_restricted_powerset, card_eq_limited_powerset) = @bool.conj_pair(
    (fn(
      x2743 : (
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
      @tactics.prove(x2743.0, x2743.1)
    })(t2879),
  )
  card_eq_restricted_powerset_c.set(card_eq_restricted_powerset)
  card_eq_limited_powerset_c.set(card_eq_limited_powerset)
}

///|
/// CARD_EQ_FULLSIZE_POWERSET
fn step_263() -> Unit raise {
  let t2897 = @simp.asm_rewrite_tac(@list.List([@sets.finite_bool()]))
  let t2896 = @tactics.match_mp_tac(card_le_finite_infinite())
  let t2895 = @simp.asm_simp_tac(
    @list.List([card_lt_imp_le(), card_exp_cantor()]),
  )
  let t2894 = @tactics.match_mp_tac(card_exp_absorb())
  let t2893 = @simp.asm_rewrite_tac(@list.List([card_exp_powerset()]))
  let t2891 = @term_syntax.parse_term("(op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (s : (A) -> Bool))")
  let t2892 = @tactics.trans_tac(card_eq_trans())(t2891)
  let t2890 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_eq_trans()),
  )
  let t2889 = @simp.rewrite_tac(@list.List([card_le_refl()]))
  let t2886 = @drule.match_mp(card_eq_restricted_powerset())
  let t2883 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t2888 = @tactics.first_assum(fn(
    x2887 : @kernel.Thm,
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
      x2885 : @kernel.Thm,
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
        x2880 : @kernel.Thm,
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
        let s2881 = @tactics.mp_tac(x2880)
        fn(
          x2882 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2881(x2882)
        }
      })(((x2884 : @kernel.Thm) => @bool.ispec(t2883, x2884))(x2885))
    })(t2886(x2887))
  })
  let t2898 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t2888,
                  ),
                  t2889,
                ),
                t2890,
              ),
              t2892,
            ),
            t2893,
          ),
          t2894,
        ),
        t2895,
      ),
      t2896,
    ),
    t2897,
  )
  card_eq_fullsize_powerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → op_eq_us_c({(t : (A) -> Bool) | SUBSET(t, s) && op_eq_us_c(t, s)}, {(t : (A) -> Bool) | SUBSET(t, s)})"),
      t2898,
    ),
  )
}

///|
let card_eq_fullsize_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_FULLSIZE_POWERSET",
)

///|
/// `CARD_EQ_FULLSIZE_POWERSET`
pub fn card_eq_fullsize_powerset() -> @kernel.Thm {
  card_eq_fullsize_powerset_c.get()
}

///|
/// CARD_EQ_EXP_INFINITE_FINITE
fn step_264() -> Unit raise {
  let t2922 = @simp.asm_simp_tac(
    @list.List([card_mul_cong(), card_eq_refl(), card_exp_sing()]),
  )
  let t2921 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_eq_trans()),
  )
  let t2915 = @drule.part_match(@equal.lhand, card_exp_add())
  let t2911 = @simp.asm_simp_tac(
    @list.List([
      card_exp_cong(),
      card_eq_refl(),
      card_disjoint_union(),
      @equal.gsym(@sets.disjoint()),
      @sets.disjoint_sing(),
    ]),
  )
  let t2909 = @term_syntax.parse_term("op_caret_us_c((s : (A) -> Bool), op_plus_us_c({(b : B)}, (t : (B) -> Bool)))")
  let t2910 = @tactics.trans_tac(card_eq_trans())(t2909)
  let t2908 = @simp.once_rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)"))]),
  )
  let t2907 = @simp.asm_simp_tac(@list.List([card_square_infinite()]))
  let t2905 = @term_syntax.parse_term("op_star_us_c((s : (A) -> Bool), s)")
  let t2906 = @tactics.trans_tac(card_eq_trans())(t2905)
  let t2904 = @simp.asm_rewrite_tac(@list.List([card_exp_sing()]))
  let t2903 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (B) -> Bool) == {}"))
  let t2901 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t2902 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(b : B)"), t2901]),
  )
  let t2900 = @simp.rewrite_tac(@list.List([@sets.not_insert_empty()]))
  let t2899 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2923 = @tactics.then_tac(
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
                                  @simp.rewrite_tac(
                                    @list.List([
                                      @theorems.imp_conj(),
                                      @theorems.right_forall_imp_thm(),
                                    ]),
                                  ),
                                  @tactics.gen_tac,
                                ),
                                @tactics.disch_tac,
                              ),
                              t2899,
                            ),
                            t2900,
                          ),
                          t2902,
                        ),
                        t2903,
                      ),
                      t2904,
                    ),
                    @tactics.strip_tac,
                  ),
                  t2906,
                ),
                t2907,
              ),
              t2908,
            ),
            t2910,
          ),
          t2911,
        ),
        fn(
          x2920 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            x2919 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              x2917 : @kernel.Term,
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
                x2916 : @kernel.Term,
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
                  x2912 : @kernel.Thm,
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
                  let s2913 = @tactics.mp_tac(x2912)
                  fn(
                    x2914 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  ) raise {
                    s2913(x2914)
                  }
                })(t2915(x2916))
              })(@equal.lhand(x2917))
            })(
              (fn(
                x2918 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x2918.1
              })(x2919),
            )
          })(x2920)(x2920)
        },
      ),
      t2921,
    ),
    t2922,
  )
  card_eq_exp_infinite_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, INFINITE(s) && FINITE(t) && !(t == {}) → op_eq_us_c(op_caret_us_c(s, t), s)"),
      t2923,
    ),
  )
}

///|
let card_eq_exp_infinite_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_EXP_INFINITE_FINITE",
)

///|
/// `CARD_EQ_EXP_INFINITE_FINITE`
pub fn card_eq_exp_infinite_finite() -> @kernel.Thm {
  card_eq_exp_infinite_finite_c.get()
}

///|
/// CARD_EQ_FINITE_SUBSETS
fn step_265() -> Unit raise {
  let t2936 = @sets.set_tac(@list.List([]))
  let t2935 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.finite_sing()]),
  )
  let t2934 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => {x}"))
  let t2937 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.le_c()])), t2934),
      t2935,
    ),
    t2936,
  )
  let t2931 = @simp.asm_rewrite_tac(@list.List([]))
  let t2930 = @tactics.match_mp_tac(card_eq_list_gen())
  let t2932 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(card_eq_imp_le()), t2930),
    t2931,
  )
  let t2929 = @simp.asm_simp_tac(
    @list.List([
      @sets.mem_list_of_set(),
      @equal.gsym(@sets.subset()),
      @sets.set_of_list_of_set(),
    ]),
  )
  let t2928 = @tactics.exists_tac(@term_syntax.parse_term("list_of_set((t : (A) -> Bool))"))
  let t2927 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t2926 = @tactics.exists_tac(
    @term_syntax.parse_term("(set_of_list : (List[A], A) -> Bool)"),
  )
  let t2933 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@sets.le_c_v1(), @sets.in_elim_thm()]),
              ),
              t2926,
            ),
            t2927,
          ),
          @tactics.strip_tac,
        ),
        t2928,
      ),
      t2929,
    ),
    t2932,
  ])
  let t2925 = @term_syntax.parse_term("{(l : List[A]) | ∀ x : A, MEM(x, l) → IN(x, (s : (A) -> Bool))}")
  let t2938 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.trans_tac(card_le_trans())(t2925),
        @tactics.conj_tac,
      ),
      t2933,
    ),
    t2937,
  ])
  let t2924 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t2939 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        t2924,
      ),
      @tactics.conj_tac,
    ),
    t2938,
  )
  card_eq_finite_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, INFINITE(s) → op_eq_us_c({(t : (A) -> Bool) | SUBSET(t, s) && FINITE(t)}, s)"),
      t2939,
    ),
  )
}

///|
let card_eq_finite_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_FINITE_SUBSETS",
)

///|
/// `CARD_EQ_FINITE_SUBSETS`
pub fn card_eq_finite_subsets() -> @kernel.Thm {
  card_eq_finite_subsets_c.get()
}

///|
/// CARD_LE_LIST
fn step_266() -> Unit raise {
  let t2949 = @meson.asm_meson_tac(@list.List([]))
  let t2948 = @simp.rewrite_tac(
    @list.List([
      @lists.map(),
      @lists.not_cons_nil(),
      @lists.mem(),
      @lists.cons_11(),
    ]),
  )
  let t2947 = @simp.simp_tac(@list.List([@lists.map_eq_nil(), @lists.map()]))
  let t2946 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t2944 = @meson.asm_meson_tac(@list.List([]))
  let t2945 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.mem_map()])), t2944),
    @tactics.disch_tac,
  ])
  let t2943 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t2942 = @tactics.exists_tac(@term_syntax.parse_term("MAP((f : (A) -> B))"))
  let t2941 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2940 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_elim_thm()]))
  let t2950 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                          t2940,
                        ),
                        t2941,
                      ),
                      t2942,
                    ),
                    t2943,
                  ),
                  @tactics.conj_tac,
                ),
                t2945,
              ),
              t2946,
            ),
            @lists.list_induct_tac,
          ),
          t2947,
        ),
        @lists.list_induct_tac,
      ),
      t2948,
    ),
    t2949,
  )
  card_le_list_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) → op_lt_eq_us_c({(l : List[A]) | ∀ x : A, MEM(x, l) → IN(x, s)}, {(l : List[B]) | ∀ x : B, MEM(x, l) → IN(x, t)})"),
      t2950,
    ),
  )
}

///|
let card_le_list_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_LE_LIST")

///|
/// `CARD_LE_LIST`
pub fn card_le_list() -> @kernel.Thm {
  card_le_list_c.get()
}

///|
/// CARD_LE_SUBPOWERSET
fn step_267() -> Unit raise {
  let t2958 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2957 = @simp.asm_simp_tac(@list.List([]))
  let t2956 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((f : (A) -> B))"))
  let t2955 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
        @tactics.strip_assume_tac,
      ),
      fn(
        x2952 : @kernel.Thm,
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
        let s2953 = @tactics.assume_tac(x2952)
        fn(
          x2954 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2953(x2954)
        }
      },
    ),
  )
  let t2951 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_elim_thm()]))
  let t2959 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2951),
          t2955,
        ),
        t2956,
      ),
      t2957,
    ),
    t2958,
  )
  card_le_subpowerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) && (∀ f : (A) -> B, ∀ s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(s) → (Q : ((B) -> Bool) -> Bool)(IMAGE(f, s))) → op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && P(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && Q(v)})"),
      t2959,
    ),
  )
}

///|
let card_le_subpowerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_SUBPOWERSET",
)

///|
/// `CARD_LE_SUBPOWERSET`
pub fn card_le_subpowerset() -> @kernel.Thm {
  card_le_subpowerset_c.get()
}

///|
/// CARD_LE_FINITE_SUBSETS
fn step_268() -> Unit raise {
  let t2961 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t2960 = @tactics.match_mp_tac(card_le_subpowerset())
  let t2962 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2960),
    t2961,
  )
  card_le_finite_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) → op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && FINITE(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && FINITE(v)})"),
      t2962,
    ),
  )
}

///|
let card_le_finite_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_FINITE_SUBSETS",
)

///|
/// `CARD_LE_FINITE_SUBSETS`
pub fn card_le_finite_subsets() -> @kernel.Thm {
  card_le_finite_subsets_c.get()
}

///|
/// CARD_LE_COUNTABLE_SUBSETS
fn step_269() -> Unit raise {
  let t2964 = @simp.asm_simp_tac(@list.List([countable_image()]))
  let t2963 = @tactics.match_mp_tac(card_le_subpowerset())
  let t2965 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2963),
    t2964,
  )
  card_le_countable_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) → op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && COUNTABLE(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && COUNTABLE(v)})"),
      t2965,
    ),
  )
}

///|
let card_le_countable_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_COUNTABLE_SUBSETS",
)

///|
/// `CARD_LE_COUNTABLE_SUBSETS`
pub fn card_le_countable_subsets() -> @kernel.Thm {
  card_le_countable_subsets_c.get()
}

///|
/// CARD_LE_POWERSET
fn step_270() -> Unit raise {
  let t2968 = @simp.asm_simp_tac(@list.List([]))
  let t2967 = @tactics.match_mp_tac(card_le_subpowerset())
  let t2966 = @simp.pure_once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : (_) -> Bool) | SUBSET(x, (y : (_) -> Bool))} == {(x : (_) -> Bool) | SUBSET(x, y) && true}"),
      ),
    ]),
  )
  let t2969 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2966),
      t2967,
    ),
    t2968,
  )
  card_le_powerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_lt_eq_us_c(s, t) → op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s)}, {(v : (B) -> Bool) | SUBSET(v, t)})"),
      t2969,
    ),
  )
}

///|
let card_le_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_POWERSET",
)

///|
/// `CARD_LE_POWERSET`
pub fn card_le_powerset() -> @kernel.Thm {
  card_le_powerset_c.get()
}

///|
/// CARD_POWERSET_CONG
fn step_271() -> Unit raise {
  let t2970 = @simp.simp_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_le_powerset()]),
  )
  card_powerset_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, op_eq_us_c(s, t) → op_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s)}, {(v : (B) -> Bool) | SUBSET(v, t)})"),
      t2970,
    ),
  )
}

///|
let card_powerset_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_POWERSET_CONG",
)

///|
/// `CARD_POWERSET_CONG`
pub fn card_powerset_cong() -> @kernel.Thm {
  card_powerset_cong_c.get()
}

///|
/// COUNTABLE_LIST_GEN
fn step_272() -> Unit raise {
  let t2980 = @simp.simp_tac(@list.List([card_eq_list(), @sets.num_infinite()]))
  let t2979 = @simp.rewrite_tac(
    @list.List([
      @sets.in_univ(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | true} == UNIV")),
    ]),
  )
  let t2978 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2977 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2974 = @drule.match_mp(card_le_list())
  let t2976 = @tactics.disch_then(fn(
    x2975 : @kernel.Thm,
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
      x2971 : @kernel.Thm,
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
      let s2972 = @tactics.mp_tac(x2971)
      fn(
        x2973 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2972(x2973)
      }
    })(t2974(x2975))
  })
  let t2981 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
            ),
            t2976,
          ),
          t2977,
        ),
        t2978,
      ),
      t2979,
    ),
    t2980,
  )
  countable_list_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, COUNTABLE(s) → COUNTABLE({(l : List[A]) | ∀ x : A, MEM(x, l) → IN(x, s)})"),
      t2981,
    ),
  )
}

///|
let countable_list_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_LIST_GEN",
)

///|
/// `COUNTABLE_LIST_GEN`
pub fn countable_list_gen() -> @kernel.Thm {
  countable_list_gen_c.get()
}

///|
/// COUNTABLE_LIST
fn step_273() -> Unit raise {
  let t2982 = @simp.rewrite_tac(
    @list.List([
      @sets.in_univ(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | true} == UNIV")),
    ]),
  )
  let t2983 = @tactics.then_tac(
    @tactics.mp_tac(
      @bool.ispec(@term_syntax.parse_term("(UNIV : (A) -> Bool)"), countable_list_gen()),
    ),
    t2982,
  )
  countable_list_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(COUNTABLE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (COUNTABLE : ((List[A]) -> Bool) -> Bool)((UNIV : (List[A]) -> Bool))"),
      t2983,
    ),
  )
}

///|
let countable_list_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_LIST")

///|
/// `COUNTABLE_LIST`
pub fn countable_list() -> @kernel.Thm {
  countable_list_c.get()
}

///|
/// COUNTABLE_FINITE_SUBSETS
fn step_274() -> Unit raise {
  let t2993 = @simp.simp_tac(
    @list.List([card_eq_finite_subsets(), @sets.num_infinite()]),
  )
  let t2992 = @simp.rewrite_tac(
    @list.List([
      @sets.in_univ(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | true} == UNIV")),
    ]),
  )
  let t2991 = @tactics.match_mp_tac(card_eq_imp_le())
  let t2990 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t2987 = @drule.match_mp(card_le_finite_subsets())
  let t2989 = @tactics.disch_then(fn(
    x2988 : @kernel.Thm,
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
      x2984 : @kernel.Thm,
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
      let s2985 = @tactics.mp_tac(x2984)
      fn(
        x2986 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2985(x2986)
      }
    })(t2987(x2988))
  })
  let t2994 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()])),
            ),
            t2989,
          ),
          t2990,
        ),
        t2991,
      ),
      t2992,
    ),
    t2993,
  )
  countable_finite_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, COUNTABLE(s) → COUNTABLE({(t : (A) -> Bool) | SUBSET(t, s) && FINITE(t)})"),
      t2994,
    ),
  )
}

///|
let countable_finite_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_FINITE_SUBSETS",
)

///|
/// `COUNTABLE_FINITE_SUBSETS`
pub fn countable_finite_subsets() -> @kernel.Thm {
  countable_finite_subsets_c.get()
}

///|
/// CARD_EQ_REAL_SEQUENCES
fn step_275() -> Unit raise {
  let t3002 = @simp.rewrite_rule(@list.List([mul_c_univ()]))(card_square_num())
  let t3003 = @simp.asm_simp_tac(
    @list.List([
      card_funspace_cong(),
      card_eq_refl(),
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_eq_real()),
      t3002,
    ]),
  )
  let t3000 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t3001 = @tactics.trans_tac(card_eq_trans())(t3000)
  let t2999 = @simp.asm_simp_tac(@list.List([card_funspace_curry()]))
  let t2997 = @term_syntax.parse_term("(UNIV : (((Num, Num)) -> Bool) -> Bool)")
  let t2998 = @tactics.trans_tac(card_eq_trans())(t2997)
  let t2996 = @simp.asm_simp_tac(
    @list.List([card_funspace_cong(), card_eq_refl(), card_eq_real()]),
  )
  let t2995 = @term_syntax.parse_term("(UNIV : ((Num, Num) -> Bool) -> Bool)")
  let t3004 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.trans_tac(card_eq_trans())(t2995), t2996),
          t2998,
        ),
        t2999,
      ),
      t3001,
    ),
    t3003,
  )
  card_eq_real_sequences_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : (((Num) -> Real) -> Bool, (Real) -> Bool) -> Bool)((UNIV : ((Num) -> Real) -> Bool), (UNIV : (Real) -> Bool))"), t3004),
  )
}

///|
let card_eq_real_sequences_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_REAL_SEQUENCES",
)

///|
/// `CARD_EQ_REAL_SEQUENCES`
pub fn card_eq_real_sequences() -> @kernel.Thm {
  card_eq_real_sequences_c.get()
}

///|
/// CARD_EQ_COUNTABLE_SUBSETS_SUBREAL
fn step_276() -> Unit raise {
  let t3029 = @simp.rewrite_tac(
    @list.List([card_eq_real(), card_exp_univ(), card_eq_refl()]),
  )
  let t3027 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t3028 = @tactics.trans_tac(card_eq_trans())(t3027)
  let t3026 = @tactics.match_mp_tac(card_eq_imp_le())
  let t3025 = @simp.asm_rewrite_tac(@list.List([]))
  let t3024 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t3030 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.trans_tac(card_le_trans())(t3024), t3025),
        t3026,
      ),
      t3028,
    ),
    t3029,
  )
  let t3023 = @simp.asm_rewrite_tac(@list.List([@sets.finite_bool()]))
  let t3031 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(card_le_finite_infinite()), t3023),
    t3030,
  ])
  let t3022 = @simp.rewrite_tac(@list.List([@sets.num_infinite()]))
  let t3021 = @tactics.match_mp_tac(card_exp_absorb())
  let t3020 = @simp.rewrite_tac(@list.List([@equal.gsym(card_exp_univ())]))
  let t3019 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([card_eq_sym()]))(card_eq_real()),
    ]),
  )
  let t3017 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t3018 = @tactics.trans_tac(card_eq_trans())(t3017)
  let t3016 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_eq_trans()),
  )
  let t3015 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(infinite_card_le())]),
  )
  let t3012 = @drule.match_mp(card_eq_limited_powerset())
  let t3009 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t3014 = @tactics.first_assum(fn(
    x3013 : @kernel.Thm,
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
      x3011 : @kernel.Thm,
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
        x3006 : @kernel.Thm,
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
        let s3007 = @tactics.mp_tac(x3006)
        fn(
          x3008 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s3007(x3008)
        }
      })(((x3010 : @kernel.Thm) => @bool.ispec(t3009, x3010))(x3011))
    })(t3012(x3013))
  })
  let t3005 = @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()]))
  let t3032 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t3005,
                      ),
                      t3014,
                    ),
                    t3015,
                  ),
                  t3016,
                ),
                t3018,
              ),
              t3019,
            ),
            t3020,
          ),
          t3021,
        ),
        t3022,
      ),
      @tactics.conj_tac,
    ),
    t3031,
  )
  card_eq_countable_subsets_subreal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) && (op_lt_eq_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) → (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)({(t : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(t, s) && (COUNTABLE : ((A) -> Bool) -> Bool)(t)}, (UNIV : (Real) -> Bool))"),
      t3032,
    ),
  )
}

///|
let card_eq_countable_subsets_subreal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_COUNTABLE_SUBSETS_SUBREAL",
)

///|
/// `CARD_EQ_COUNTABLE_SUBSETS_SUBREAL`
pub fn card_eq_countable_subsets_subreal() -> @kernel.Thm {
  card_eq_countable_subsets_subreal_c.get()
}

///|
/// CARD_EQ_COUNTABLE_SUBSETS_REAL
fn step_277() -> Unit raise {
  let t3033 = @simp.rewrite_tac(
    @list.List([@sets.subset_univ(), card_le_refl(), @sets.real_infinite()]),
  )
  let t3034 = @tactics.then_tac(
    @tactics.mp_tac(
      @bool.ispec(
        @term_syntax.parse_term("(UNIV : (Real) -> Bool)"),
        card_eq_countable_subsets_subreal(),
      ),
    ),
    t3033,
  )
  card_eq_countable_subsets_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(op_eq_us_c : (((Real) -> Bool) -> Bool, (Real) -> Bool) -> Bool)({(s : (Real) -> Bool) | (COUNTABLE : ((Real) -> Bool) -> Bool)(s)}, (UNIV : (Real) -> Bool))"),
      t3034,
    ),
  )
}

///|
let card_eq_countable_subsets_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_COUNTABLE_SUBSETS_REAL",
)

///|
/// `CARD_EQ_COUNTABLE_SUBSETS_REAL`
pub fn card_eq_countable_subsets_real() -> @kernel.Thm {
  card_eq_countable_subsets_real_c.get()
}

///|
/// CARD_LE_RESTRICTED_FUNSPACE
fn step_278() -> Unit raise {
  let t3042 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t3041 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t3038 = @drule.match_mp(card_le_subset())
  let t3040 = @tactics.disch_then(fn(
    x3039 : @kernel.Thm,
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
      x3035 : @kernel.Thm,
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
      let s3036 = @tactics.mp_tac(x3035)
      fn(
        x3037 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3036(x3037)
      }
    })(t3038(x3039))
  })
  let t3043 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3040),
      t3041,
    ),
    t3042,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) → op_lt_eq_us_c(t, s)"),
    t3043,
  )
  let t3060 = @simp.asm_rewrite_tac(@list.List([]))
  let t3059 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (A) -> B)((x : A)) == (k : (A) -> B)(x)"))
  let t3058 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@theorems.conj_assoc()),
      @theorems.unwind_thm1(),
      @theorems.unwind_thm2(),
    ]),
  )
  let t3057 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_elim_thm(), @pair.pair_eq()]),
  )
  let t3056 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t3055 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t3053 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3054 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.subset(),
          @sets.forall_in_image(),
          @sets.in_elim_thm(),
          @sets.in_cross(),
        ]),
      ),
      t3053,
    ),
  ])
  let t3052 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t3051 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((x : A) => (x, (f : (A) -> B)(x)), {(x : A) | !(f(x) == (k : (A) -> B)(x))})"),
  )
  let t3050 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_elim_thm()]),
  )
  let t3049 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t3048 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t3047 = @simp.gen_rewrite_tac(
    fn(
      x3046 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3046
    },
    @list.List([@sets.subset()]),
  )
  let t3045 = @tactics.exists_tac(
    @term_syntax.parse_term("(u : ((A, B)) -> Bool) => (x : A) => if (∃ y : B, IN((x, y), u)) { select((y : B) => IN((x, y), u)) } else { (k : (A) -> B)(x) }"),
  )
  let t3044 = @tactics.match_mp_tac(lemma)
  let t3061 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
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
                                    @tactics.repeat_tac(@tactics.gen_tac),
                                    t3044,
                                  ),
                                  t3045,
                                ),
                                t3047,
                              ),
                              t3048,
                            ),
                            t3049,
                          ),
                          @tactics.strip_tac,
                        ),
                        t3050,
                      ),
                      t3051,
                    ),
                    t3052,
                  ),
                  @tactics.conj_tac,
                ),
                t3054,
              ),
              t3055,
            ),
            t3056,
          ),
          t3057,
        ),
        t3058,
      ),
      t3059,
    ),
    t3060,
  )
  card_le_restricted_funspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (A) -> B, op_lt_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, {(u : ((A, B)) -> Bool) | SUBSET(u, CROSS(s, t)) && FINITE(u)})"),
      t3061,
    ),
  )
}

///|
let card_le_restricted_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_RESTRICTED_FUNSPACE",
)

///|
/// `CARD_LE_RESTRICTED_FUNSPACE`
pub fn card_le_restricted_funspace() -> @kernel.Thm {
  card_le_restricted_funspace_c.get()
}

///|
/// COUNTABLE_RESTRICTED_FUNSPACE
fn step_279() -> Unit raise {
  let t3072 = @simp.asm_simp_tac(
    @list.List([
      countable_finite_subsets(),
      countable_cross(),
      countable_image(),
    ]),
  )
  let t3071 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(card_le_countable()),
  )
  let t3065 = @drule.part_match(@equal.lhand, card_le_restricted_funspace())
  let t3073 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(
        x3070 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x3069 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            x3067 : @kernel.Term,
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
              x3066 : @kernel.Term,
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
                x3062 : @kernel.Thm,
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
                let s3063 = @tactics.mp_tac(x3062)
                fn(
                  x3064 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s3063(x3064)
                }
              })(t3065(x3066))
            })(@kernel.rand(x3067))
          })(
            (fn(
              x3068 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x3068.1
            })(x3069),
          )
        })(x3070)(x3070)
      }),
      t3071,
    ),
    t3072,
  )
  countable_restricted_funspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (A) -> B, COUNTABLE(s) && COUNTABLE(t) → COUNTABLE({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})})"),
      t3073,
    ),
  )
}

///|
let countable_restricted_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_RESTRICTED_FUNSPACE",
)

///|
/// `COUNTABLE_RESTRICTED_FUNSPACE`
pub fn countable_restricted_funspace() -> @kernel.Thm {
  countable_restricted_funspace_c.get()
}

///|
/// CARD_LE_RESTRICTED_FUNSPACE_INFINITE
fn step_280() -> Unit raise {
  let t3087 = @simp.asm_rewrite_tac(@list.List([@sets.infinite_cross_eq()]))
  let t3086 = @tactics.match_mp_tac(card_eq_finite_subsets())
  let t3085 = @simp.rewrite_tac(
    @list.List([mul_c(), @equal.gsym(@sets.cross())]),
  )
  let t3084 = @tactics.match_mp_tac(card_eq_imp_le())
  let t3083 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(card_le_trans()),
  )
  let t3077 = @drule.part_match(@equal.lhand, card_le_restricted_funspace())
  let t3088 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(
              x3082 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x3081 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x3079 : @kernel.Term,
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
                    x3078 : @kernel.Term,
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
                    (fn(
                      x3074 : @kernel.Thm,
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
                      let s3075 = @tactics.mp_tac(x3074)
                      fn(
                        x3076 : (
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
                      ) raise {
                        s3075(x3076)
                      }
                    })(t3077(x3078))
                  })(@equal.lhand(x3079))
                })(
                  (fn(
                    x3080 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x3080.1
                  })(x3081),
                )
              })(x3082)(x3082)
            }),
            t3083,
          ),
          t3084,
        ),
        t3085,
      ),
      t3086,
    ),
    t3087,
  )
  card_le_restricted_funspace_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (A) -> B, INFINITE(s) && !(t == {}) → op_lt_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, op_star_us_c(s, t))"),
      t3088,
    ),
  )
}

///|
let card_le_restricted_funspace_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_RESTRICTED_FUNSPACE_INFINITE",
)

///|
/// `CARD_LE_RESTRICTED_FUNSPACE_INFINITE`
pub fn card_le_restricted_funspace_infinite() -> @kernel.Thm {
  card_le_restricted_funspace_infinite_c.get()
}

///|
/// CARD_EQ_RESTRICTED_FUNSPACE_INFINITE
fn step_281() -> Unit raise {
  let t3115 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3114 = @simp.rewrite_tac(@list.List([@sets.finite_sing()]))
  let t3113 = @tactics.exists_tac(@term_syntax.parse_term("{(a : A)}"))
  let t3112 = @tactics.match_mp_tac(@sets.finite_subset())
  let t3116 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.strip_tac,
            @tactics.repeat_tac(
              @tactics.thenl(
                @tactics.conj_tac,
                @list.List([
                  @tactics.asm_tac(@sets.set_tac)(@list.List([])),
                  @tactics.all_tac,
                ]),
              ),
            ),
          ),
          t3112,
        ),
        t3113,
      ),
      t3114,
    ),
    t3115,
  )
  let t3108 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3109 = @list.List([@tactics.x_gen_tac(@term_syntax.parse_term("(b : B)")), t3108])
  let t3107 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.subset(), @sets.forall_in_image()]),
  )
  let t3106 = @tactics.exists_tac(
    @term_syntax.parse_term("(b : B) => (x : A) => if x == (a : A) { b } else { (k : (A) -> B)(x) }"),
  )
  let t3105 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t3104 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @sets.member_not_empty(),
        @sets.finite_empty(),
        @sets.infinite(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t3110 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("∃ a : A, IN(a, (s : (A) -> Bool))"),
                @tactics.strip_assume_tac,
              ),
              t3104,
            ),
            t3105,
          ),
          t3106,
        ),
        t3107,
      ),
      @tactics.conj_tac,
    ),
    t3109,
  )
  let t3103 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t3102 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t3101 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.subset(), @sets.forall_in_image()]),
  )
  let t3100 = @tactics.exists_tac(
    @term_syntax.parse_term("(a : A) => (x : A) => if x == a { (f : (A) -> B)(x) } else { (k : (A) -> B)(x) }"),
  )
  let t3099 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> B)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t3097 = @simp.rewrite_tac(
    @list.List([@theorems.forall_and_thm(), @sets.le_c(), @class.skolem_thm()]),
  )
  let t3098 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t3097])
  let t3111 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("∀ x : A, ∃ y : B, IN(y, (t : (B) -> Bool)) && !((k : (A) -> B)(x) == y)"),
                    fn(
                      x3094 : @kernel.Thm,
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
                      let s3095 = @tactics.mp_tac(x3094)
                      fn(
                        x3096 : (
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
                      ) raise {
                        s3095(x3096)
                      }
                    },
                  ),
                  t3098,
                ),
                t3099,
              ),
              t3100,
            ),
            t3101,
          ),
          @tactics.conj_tac,
        ),
        t3102,
      ),
      t3103,
    ),
    t3110,
  ])
  let t3091 = @simp.asm_rewrite_tac(@list.List([]))
  let t3092 = @tactics.then_tac(
    @tactics.match_mp_tac(card_mul2_absorb_le_alt()),
    t3091,
  )
  let t3090 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3093 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(card_le_restricted_funspace_infinite()),
      t3090,
    ),
    t3092,
  ])
  let t3089 = @simp.rewrite_tac(@list.List([@equal.gsym(card_le_antisym())]))
  let t3117 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3089),
            @tactics.conj_tac,
          ),
          t3093,
        ),
        @tactics.conj_tac,
      ),
      t3111,
    ),
    t3116,
  )
  card_eq_restricted_funspace_infinite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (A) -> B, INFINITE(s) && !(∃ a : B, SUBSET(t, {a})) && SUBSET(IMAGE(k, s), t) → op_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, op_star_us_c(s, t))"),
      t3117,
    ),
  )
}

///|
let card_eq_restricted_funspace_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_RESTRICTED_FUNSPACE_INFINITE",
)

///|
/// `CARD_EQ_RESTRICTED_FUNSPACE_INFINITE`
pub fn card_eq_restricted_funspace_infinite() -> @kernel.Thm {
  card_eq_restricted_funspace_infinite_c.get()
}

///|
/// CARD_EQ_FUNSPACE
fn step_282() -> Unit raise {
  let t3124 = @meson.meson_tac(@list.List([]))
  let t3123 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t3122 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.arb()]))
  let t3121 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A) -> B) => (x : A) => if IN(x, (s : (A) -> Bool)) { f(x) } else { (k : (A) -> B)(x) }"),
  )
  let t3120 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A) -> B) => (x : A) => if IN(x, (s : (A) -> Bool)) { f(x) } else { ARB }"),
  )
  let t3119 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t3118 = @tactics.repeat_tac(@tactics.gen_tac)
  let t3125 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    exp_c(),
                    @sets.subset(),
                    @sets.forall_in_image(),
                    @sets.in_elim_thm(),
                  ]),
                ),
                t3118,
              ),
              t3119,
            ),
            t3120,
          ),
          t3121,
        ),
        t3122,
      ),
      t3123,
    ),
    t3124,
  )
  card_eq_funspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (A) -> B, op_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s)}, op_caret_us_c(t, s))"),
      t3125,
    ),
  )
}

///|
let card_eq_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_FUNSPACE",
)

///|
/// `CARD_EQ_FUNSPACE`
pub fn card_eq_funspace() -> @kernel.Thm {
  card_eq_funspace_c.get()
}

///|
/// CARTESIAN_PRODUCT_CONST
fn step_283() -> Unit raise {
  let t3126 = @sets.set_tac(@list.List([]))
  let t3127 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extensional(),
        @sets.in_elim_thm(),
        @sets.cartesian_product(),
        exp_c(),
        @sets.arb(),
      ]),
    ),
    t3126,
  )
  cartesian_product_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, cartesian_product(t, (i : B) => s) == op_caret_us_c(s, t)"),
      t3127,
    ),
  )
}

///|
let cartesian_product_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARTESIAN_PRODUCT_CONST",
)

///|
/// `CARTESIAN_PRODUCT_CONST`
pub fn cartesian_product_const() -> @kernel.Thm {
  cartesian_product_const_c.get()
}

///|
/// CARD_LE_CARTESIAN_PRODUCT
fn step_284() -> Unit raise {
  let t3159 = @meson.asm_meson_tac(@list.List([]))
  let t3158 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@sets.cartesian_product(), @sets.in_elim_thm()]),
    ),
  )
  let t3154 = @term_syntax.parse_term("(i : K)")
  let t3157 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x3156 : @kernel.Thm,
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
        x3151 : @kernel.Thm,
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
        let s3152 = @tactics.mp_tac(x3151)
        fn(
          x3153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s3152(x3153)
        }
      })(((x3155 : @kernel.Thm) => @bool.spec(t3154, x3155))(x3156))
    }),
  )
  let t3150 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.fun_eq_thm()])),
  )
  let t3149 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : K)"))
  let t3148 = @simp.asm_rewrite_tac(@list.List([]))
  let t3146 = @term_syntax.parse_term("(s : (K, A) -> Bool)")
  let t3147 = @tactics.map_every(
    fn(
      x3143 : @kernel.Term,
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
      let s3144 = @tactics.exists_tac(x3143)
      fn(
        x3145 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3144(x3145)
      }
    },
    @list.List([@term_syntax.parse_term("(k : (K) -> Bool)"), t3146]),
  )
  let t3142 = @tactics.match_mp_tac(@sets.cartesian_product_eq_members())
  let t3160 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t3142,
                  ),
                  t3147,
                ),
                t3148,
              ),
              t3149,
            ),
            @tactics.disch_tac,
          ),
          t3150,
        ),
        t3157,
      ),
      t3158,
    ),
    t3159,
  )
  let t3141 = @meson.asm_meson_tac(@list.List([]))
  let t3161 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.cartesian_product(),
          @sets.in_elim_thm(),
          @sets.extensional(),
        ]),
      ),
      t3141,
    ),
    t3160,
  ])
  let t3140 = @simp.rewrite_tac(@list.List([]))
  let t3139 = @tactics.exists_tac(
    @term_syntax.parse_term("(g : (K) -> A) => (i : K) => if IN(i, (k : (K) -> Bool)) { (f : (K, A) -> B)(i, g(i)) } else { ARB }"),
  )
  let t3138 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (K, A) -> B)"))
  let t3137 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t3136 = @simp.gen_rewrite_tac(
    fn(
      x3135 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x3129 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3130 = @equal.land_conv(x3129)
        fn(x3131 : @kernel.Term) -> @kernel.Thm raise { s3130(x3131) }
      })(
        (fn(
          x3132 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3133 = @equal.binder_conv(x3132)
          fn(x3134 : @kernel.Term) -> @kernel.Thm raise { s3133(x3134) }
        })(x3135),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t3128 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t3162 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t3128,
                  ),
                  t3136,
                ),
                t3137,
              ),
              t3138,
            ),
            @tactics.disch_tac,
          ),
          t3139,
        ),
        t3140,
      ),
      @tactics.conj_tac,
    ),
    t3161,
  )
  card_le_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (K, A) -> Bool, ∀ t : (K, B) -> Bool, ∀ k : (K) -> Bool, (∀ i : K, IN(i, k) → op_lt_eq_us_c(s(i), t(i))) → op_lt_eq_us_c(cartesian_product(k, s), cartesian_product(k, t))"),
      t3162,
    ),
  )
}

///|
let card_le_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_CARTESIAN_PRODUCT",
)

///|
/// `CARD_LE_CARTESIAN_PRODUCT`
pub fn card_le_cartesian_product() -> @kernel.Thm {
  card_le_cartesian_product_c.get()
}

///|
/// CARD_EQ_CARTESIAN_PRODUCT
fn step_285() -> Unit raise {
  let t3163 = @simp.simp_tac(
    @list.List([@equal.gsym(card_le_antisym()), card_le_cartesian_product()]),
  )
  card_eq_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (K, A) -> Bool, ∀ t : (K, B) -> Bool, ∀ k : (K) -> Bool, (∀ i : K, IN(i, k) → op_eq_us_c(s(i), t(i))) → op_eq_us_c(cartesian_product(k, s), cartesian_product(k, t))"),
      t3163,
    ),
  )
}

///|
let card_eq_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_CARTESIAN_PRODUCT",
)

///|
/// `CARD_EQ_CARTESIAN_PRODUCT`
pub fn card_eq_cartesian_product() -> @kernel.Thm {
  card_eq_cartesian_product_c.get()
}

///|
/// CARD_LE_CARTESIAN_PRODUCT_SUBINDEX
fn step_286() -> Unit raise {
  let t3180 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3179 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t3178 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : K) => if IN(i, (k : (K) -> Bool)) { (x : (K) -> A)(i) } else { (z : (K) -> A)(i) }"),
  )
  let t3177 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (K) -> A)"))
  let t3176 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : (K) -> A)"))
  let t3175 = @simp.rewrite_tac(
    @list.List([
      @sets.cartesian_product(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @sets.in_image(),
      @sets.extensional(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t3172 = @simp.gen_rewrite_rule(
    fn(
      x3171 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3171
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t3174 = @tactics.first_x_assum(fn(
    x3173 : @kernel.Thm,
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
      x3168 : @kernel.Thm,
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
      let s3169 = @tactics.mp_tac(x3168)
      fn(
        x3170 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3169(x3170)
      }
    })(t3172(x3173))
  })
  let t3167 = @tactics.match_mp_tac(card_le_subset())
  let t3166 = @simp.rewrite_tac(@list.List([card_le_image()]))
  let t3164 = @term_syntax.parse_term("IMAGE((f : (K) -> A) => (i : K) => if IN(i, (k : (K) -> Bool)) { f(i) } else { ARB }, cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool)))")
  let t3165 = @tactics.trans_tac(card_le_trans())(t3164)
  let t3181 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t3165,
                        ),
                        t3166,
                      ),
                      t3167,
                    ),
                    t3174,
                  ),
                  t3175,
                ),
                t3176,
              ),
              @tactics.strip_tac,
            ),
            t3177,
          ),
          @tactics.strip_tac,
        ),
        t3178,
      ),
      t3179,
    ),
    t3180,
  )
  card_le_cartesian_product_subindex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (K, A) -> Bool, ∀ k : (K) -> Bool, ∀ l : (K) -> Bool, SUBSET(k, l) && !(cartesian_product(l, s) == {}) → op_lt_eq_us_c(cartesian_product(k, s), cartesian_product(l, s))"),
      t3181,
    ),
  )
}

///|
let card_le_cartesian_product_subindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_LE_CARTESIAN_PRODUCT_SUBINDEX",
)

///|
/// `CARD_LE_CARTESIAN_PRODUCT_SUBINDEX`
pub fn card_le_cartesian_product_subindex() -> @kernel.Thm {
  card_le_cartesian_product_subindex_c.get()
}

///|
/// FINITE_CARTESIAN_PRODUCT
fn step_287() -> Unit raise {
  let t3263 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3262 = @simp.rewrite_tac(
    @list.List([
      @sets.cartesian_product(),
      @sets.in_elim_thm(),
      @sets.extensional(),
    ]),
  )
  let t3261 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (K) -> A)"))
  let t3264 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x3260 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x3260
          },
          @list.List([@sets.subset()]),
        ),
        t3261,
      ),
      t3262,
    ),
    t3263,
  )
  let t3259 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3258 = @simp.asm_simp_tac(
    @list.List([@sets.simple_image(), @sets.finite_image()]),
  )
  let t3257 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_unions(), @sets.forall_in_gspec()]),
  )
  let t3265 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@sets.finite_restricted_funspace()),
          t3257,
        ),
        t3258,
      ),
      t3259,
    ),
    t3264,
  ])
  let t3256 = @tactics.exists_tac(
    @term_syntax.parse_term("{(f : (K) -> A) | SUBSET(IMAGE(f, (l : (K) -> Bool)), UNIONS({(s : (K, A) -> Bool)((i : K)) | IN(i, l)})) && SUBSET({(i : K) | !(f(i) == (if IN(i, (k : (K) -> Bool)) { (a : (K) -> A)(i) } else { ARB }))}, l)}"),
  )
  let t3266 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t3256),
      @tactics.conj_tac,
    ),
    t3265,
  )
  let t3255 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3252 = @simp.gen_rewrite_rule(
    fn(
      x3249 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3250 = @equal.rand_conv(x3249)
      fn(x3251 : @kernel.Term) -> @kernel.Thm raise { s3250(x3251) }
    },
    @list.List([@sets.cartesian_product_eq_empty()]),
  )
  let t3254 = @tactics.first_x_assum(fn(
    x3253 : @kernel.Thm,
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
      x3246 : @kernel.Thm,
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
      let s3247 = @tactics.mp_tac(x3246)
      fn(
        x3248 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3247(x3248)
      }
    })(t3252(x3253))
  })
  let t3245 = @simp.simp_tac(
    @list.List([@sets.in_diff(), @sets.in_elim_thm(), @theorems.imp_conj()]),
  )
  let t3244 = @simp.expand_tac("l")
  let t3243 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : K)"))
  let t3267 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @equal.gsym(@class.skolem_thm()),
                    @class.right_exists_imp_thm(),
                  ]),
                ),
                t3243,
              ),
              t3244,
            ),
            t3245,
          ),
          @tactics.disch_tac,
        ),
        t3254,
      ),
      t3255,
    ),
    t3266,
  ])
  let t3242 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ a : (K) -> A, ∀ i : K, IN(i, DIFF((k : (K) -> Bool), (l : (K) -> Bool))) → (s : (K, A) -> Bool)(i) == {a(i)}"),
    @tactics.strip_assume_tac,
  )
  let t3268 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @simp.abbrev_tac(
          @term_syntax.parse_term("(l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(∃ a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}"),
        ),
      ),
      t3242,
    ),
    t3267,
  )
  let t3239 = @meson.asm_meson_tac(@list.List([]))
  let t3238 = @simp.asm_simp_tac(@list.List([]))
  let t3237 = @tactics.exists_tac(
    @term_syntax.parse_term("(j : K) => if j == (i : K) { (x : A) } else { (z : (K) -> A)(j) }"),
  )
  let t3236 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t3235 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : (K) -> A)"))
  let t3234 = @simp.rewrite_tac(
    @list.List([
      @sets.cartesian_product(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @sets.in_image(),
      @sets.extensional(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t3231 = @simp.gen_rewrite_rule(
    fn(
      x3230 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3230
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t3233 = @tactics.first_x_assum(fn(
    x3232 : @kernel.Thm,
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
      x3227 : @kernel.Thm,
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
      let s3228 = @tactics.mp_tac(x3227)
      fn(
        x3229 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3228(x3229)
      }
    })(t3231(x3232))
  })
  let t3226 = @simp.asm_simp_tac(
    @list.List([@sets.finite_image(), @sets.subset(), @sets.in_image()]),
  )
  let t3225 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((x : (K) -> A) => x((i : K)), cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))"),
  )
  let t3224 = @tactics.match_mp_tac(@sets.finite_subset())
  let t3240 = @tactics.then_tac(
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
                            @tactics.x_gen_tac(@term_syntax.parse_term("(i : K)")),
                            @tactics.disch_tac,
                          ),
                          t3224,
                        ),
                        t3225,
                      ),
                      t3226,
                    ),
                    t3233,
                  ),
                  t3234,
                ),
                t3235,
              ),
              @tactics.strip_tac,
            ),
            t3236,
          ),
          @tactics.strip_tac,
        ),
        t3237,
      ),
      t3238,
    ),
    t3239,
  )
  let t3221 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3220 = @simp.simp_tac(
    @list.List([
      card_le_card(),
      @sets.finite_bool(),
      card_add_finite_eq(),
      @sets.finite_sing(),
      card_add_c(),
      @sets.card_sing(),
      @sets.card_bool(),
    ]),
  )
  let t3219 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(card_le_trans()),
  )
  let t3216 = @drule.match_mp(card_lt_imp_suc_le())
  let t3213 = @term_syntax.parse_term("true")
  let t3218 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x3207 : @kernel.Thm,
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
        let s3208 = @tactics.assume_tac(x3207)
        fn(
          x3209 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s3208(x3209)
        }
      },
      fn(
        x3217 : @kernel.Thm,
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
          x3215 : @kernel.Thm,
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
            x3210 : @kernel.Thm,
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
            let s3211 = @tactics.mp_tac(x3210)
            fn(
              x3212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s3211(x3212)
            }
          })(((x3214 : @kernel.Thm) => @bool.ispec(t3213, x3214))(x3215))
        })(t3216(x3217))
      },
    ),
  )
  let t3206 = @simp.rewrite_tac(
    @list.List([@equal.gsym(card_le_sing()), card_not_le()]),
  )
  let t3205 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3204 = @simp.expand_tac("l")
  let t3222 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(card_le_cartesian_product()),
                  t3204,
                ),
                t3205,
              ),
              t3206,
            ),
            @tactics.gen_tac,
          ),
          t3218,
        ),
        t3219,
      ),
      t3220,
    ),
    t3221,
  )
  let t3203 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(infinite_card_le()), @sets.univ_not_empty()]),
  )
  let t3202 = @tactics.match_mp_tac(card_le_exp_right())
  let t3201 = @simp.rewrite_tac(@list.List([@equal.gsym(card_exp_univ())]))
  let t3200 = @simp.simp_tac(@list.List([card_eq_real(), card_eq_imp_le()]))
  let t3198 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t3199 = @tactics.trans_tac(card_le_trans())(t3198)
  let t3197 = @simp.simp_tac(@list.List([card_lt_num_real(), card_lt_imp_le()]))
  let t3195 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t3196 = @tactics.trans_tac(card_le_trans())(t3195)
  let t3223 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([cartesian_product_const()])),
                  t3196,
                ),
                t3197,
              ),
              t3199,
            ),
            t3200,
          ),
          t3201,
        ),
        t3202,
      ),
      t3203,
    ),
    t3222,
  ])
  let t3193 = @term_syntax.parse_term("(cartesian_product : ((K) -> Bool, (K, Bool) -> Bool, (K) -> Bool) -> Bool)((l : (K) -> Bool), (i : K) => (UNIV : (Bool) -> Bool))")
  let t3194 = @tactics.trans_tac(card_le_trans())(t3193)
  let t3192 = @simp.asm_simp_tac(
    @list.List([card_le_cartesian_product_subindex(), @sets.subset_restrict()]),
  )
  let t3191 = @simp.expand_tac("l")
  let t3189 = @term_syntax.parse_term("cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool))")
  let t3190 = @tactics.trans_tac(card_le_trans())(t3189)
  let t3188 = @simp.rewrite_tac(@list.List([infinite_card_le()]))
  let t3187 = @simp.abbrev_tac(
    @term_syntax.parse_term("(l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(∃ a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}"),
  )
  let t3186 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.infinite())]))
  let t3185 = @simp.gen_rewrite_tac(
    fn(
      x3184 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3184
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t3241 = @list.List([
    @tactics.thenl(
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
                          @tactics.undisch_tac(
                            @term_syntax.parse_term("FINITE(cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))"),
                          ),
                          t3185,
                        ),
                        t3186,
                      ),
                      @tactics.disch_tac,
                    ),
                    t3187,
                  ),
                  t3188,
                ),
                t3190,
              ),
              t3191,
            ),
            t3192,
          ),
          t3194,
        ),
        @tactics.conj_tac,
      ),
      t3223,
    ),
    t3240,
  ])
  let t3269 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@tactics.disch_tac, @tactics.conj_tac),
      t3241,
    ),
    t3268,
  ])
  let t3183 = @simp.asm_rewrite_tac(@list.List([@sets.finite_empty()]))
  let t3182 = @class.asm_cases_tac(
    @term_syntax.parse_term("cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}"),
  )
  let t3270 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3182),
        t3183,
      ),
      @tactics.eq_tac,
    ),
    t3269,
  )
  finite_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (K, A) -> Bool, ∀ k : (K) -> Bool, FINITE(cartesian_product(k, s)) == (cartesian_product(k, s) == {} || FINITE({(i : K) | IN(i, k) && !(∃ a : A, SUBSET(s(i), {a}))}) && (∀ i : K, IN(i, k) → FINITE(s(i))))"),
      t3270,
    ),
  )
}

///|
let finite_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_CARTESIAN_PRODUCT",
)

///|
/// `FINITE_CARTESIAN_PRODUCT`
pub fn finite_cartesian_product() -> @kernel.Thm {
  finite_cartesian_product_c.get()
}

///|
/// COUNTABLE_CARTESIAN_PRODUCT
fn step_288() -> Unit raise {
  let t3354 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3353 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.finite_subset()]),
        @term_syntax.parse_term("FINITE((t : (_) -> Bool)) → (SUBSET((s : (_) -> Bool), t) && FINITE(s)) == SUBSET(s, t)"),
      ),
    ]),
  )
  let t3352 = @simp.rewrite_tac(
    @list.List([
      @sets.cartesian_product(),
      @sets.in_elim_thm(),
      @sets.extensional(),
    ]),
  )
  let t3351 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (K) -> A)"))
  let t3355 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x3350 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x3350
            },
            @list.List([@sets.subset()]),
          ),
          t3351,
        ),
        t3352,
      ),
      t3353,
    ),
    t3354,
  )
  let t3349 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3348 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      @sets.forall_in_image(),
      finite_imp_countable(),
      countable_image(),
    ]),
  )
  let t3347 = @tactics.match_mp_tac(countable_unions())
  let t3346 = @simp.asm_simp_tac(@list.List([finite_imp_countable()]))
  let t3356 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(countable_restricted_funspace()),
            t3346,
          ),
          t3347,
        ),
        t3348,
      ),
      t3349,
    ),
    t3355,
  ])
  let t3345 = @tactics.exists_tac(
    @term_syntax.parse_term("{(f : (K) -> A) | SUBSET(IMAGE(f, (l : (K) -> Bool)), UNIONS({(s : (K, A) -> Bool)((i : K)) | IN(i, l)})) && SUBSET({(i : K) | !(f(i) == (if IN(i, (k : (K) -> Bool)) { (a : (K) -> A)(i) } else { ARB }))}, l) && FINITE({(i : K) | !(f(i) == (if IN(i, k) { a(i) } else { ARB }))})}"),
  )
  let t3357 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(countable_subset()), t3345),
      @tactics.conj_tac,
    ),
    t3356,
  )
  let t3344 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3341 = @simp.gen_rewrite_rule(
    fn(
      x3338 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3339 = @equal.rand_conv(x3338)
      fn(x3340 : @kernel.Term) -> @kernel.Thm raise { s3339(x3340) }
    },
    @list.List([@sets.cartesian_product_eq_empty()]),
  )
  let t3343 = @tactics.first_x_assum(fn(
    x3342 : @kernel.Thm,
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
      x3335 : @kernel.Thm,
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
      let s3336 = @tactics.mp_tac(x3335)
      fn(
        x3337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3336(x3337)
      }
    })(t3341(x3342))
  })
  let t3334 = @simp.simp_tac(
    @list.List([@sets.in_diff(), @sets.in_elim_thm(), @theorems.imp_conj()]),
  )
  let t3333 = @simp.expand_tac("l")
  let t3332 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : K)"))
  let t3358 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @equal.gsym(@class.skolem_thm()),
                    @class.right_exists_imp_thm(),
                  ]),
                ),
                t3332,
              ),
              t3333,
            ),
            t3334,
          ),
          @tactics.disch_tac,
        ),
        t3343,
      ),
      t3344,
    ),
    t3357,
  ])
  let t3331 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ a : (K) -> A, ∀ i : K, IN(i, DIFF((k : (K) -> Bool), (l : (K) -> Bool))) → (s : (K, A) -> Bool)(i) == {a(i)}"),
    @tactics.strip_assume_tac,
  )
  let t3359 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @simp.abbrev_tac(
          @term_syntax.parse_term("(l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(∃ a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}"),
        ),
      ),
      t3331,
    ),
    t3358,
  )
  let t3328 = @meson.asm_meson_tac(@list.List([]))
  let t3327 = @simp.asm_simp_tac(@list.List([]))
  let t3326 = @tactics.exists_tac(
    @term_syntax.parse_term("(j : K) => if j == (i : K) { (x : A) } else { (z : (K) -> A)(j) }"),
  )
  let t3325 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t3324 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : (K) -> A)"))
  let t3323 = @simp.rewrite_tac(
    @list.List([
      @sets.cartesian_product(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @sets.in_image(),
      @sets.extensional(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t3320 = @simp.gen_rewrite_rule(
    fn(
      x3319 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3319
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t3322 = @tactics.first_x_assum(fn(
    x3321 : @kernel.Thm,
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
      x3316 : @kernel.Thm,
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
      let s3317 = @tactics.mp_tac(x3316)
      fn(
        x3318 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s3317(x3318)
      }
    })(t3320(x3321))
  })
  let t3315 = @simp.asm_simp_tac(
    @list.List([countable_image(), @sets.subset(), @sets.in_image()]),
  )
  let t3314 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((x : (K) -> A) => x((i : K)), cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))"),
  )
  let t3313 = @tactics.match_mp_tac(countable_subset())
  let t3329 = @tactics.then_tac(
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
                            @tactics.x_gen_tac(@term_syntax.parse_term("(i : K)")),
                            @tactics.disch_tac,
                          ),
                          t3313,
                        ),
                        t3314,
                      ),
                      t3315,
                    ),
                    t3322,
                  ),
                  t3323,
                ),
                t3324,
              ),
              @tactics.strip_tac,
            ),
            t3325,
          ),
          @tactics.strip_tac,
        ),
        t3326,
      ),
      t3327,
    ),
    t3328,
  )
  let t3310 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3309 = @simp.simp_tac(
    @list.List([
      card_le_card(),
      @sets.finite_bool(),
      card_add_finite_eq(),
      @sets.finite_sing(),
      card_add_c(),
      @sets.card_sing(),
      @sets.card_bool(),
    ]),
  )
  let t3308 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(card_le_trans()),
  )
  let t3305 = @drule.match_mp(card_lt_imp_suc_le())
  let t3302 = @term_syntax.parse_term("true")
  let t3307 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x3296 : @kernel.Thm,
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
        let s3297 = @tactics.assume_tac(x3296)
        fn(
          x3298 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s3297(x3298)
        }
      },
      fn(
        x3306 : @kernel.Thm,
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
          x3304 : @kernel.Thm,
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
            x3299 : @kernel.Thm,
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
            let s3300 = @tactics.mp_tac(x3299)
            fn(
              x3301 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s3300(x3301)
            }
          })(((x3303 : @kernel.Thm) => @bool.ispec(t3302, x3303))(x3304))
        })(t3305(x3306))
      },
    ),
  )
  let t3295 = @simp.rewrite_tac(
    @list.List([@equal.gsym(card_le_sing()), card_not_le()]),
  )
  let t3294 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3293 = @simp.expand_tac("l")
  let t3311 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(card_le_cartesian_product()),
                  t3293,
                ),
                t3294,
              ),
              t3295,
            ),
            @tactics.gen_tac,
          ),
          t3307,
        ),
        t3308,
      ),
      t3309,
    ),
    t3310,
  )
  let t3292 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(infinite_card_le()), @sets.univ_not_empty()]),
  )
  let t3291 = @tactics.match_mp_tac(card_le_exp_right())
  let t3290 = @simp.rewrite_tac(@list.List([@equal.gsym(card_exp_univ())]))
  let t3289 = @simp.simp_tac(@list.List([card_eq_real(), card_eq_imp_le()]))
  let t3287 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t3288 = @tactics.trans_tac(card_le_trans())(t3287)
  let t3286 = @simp.rewrite_tac(@list.List([card_lt_num_real()]))
  let t3284 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t3285 = @tactics.trans_tac(card_lte_trans())(t3284)
  let t3312 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([cartesian_product_const()])),
                  t3285,
                ),
                t3286,
              ),
              t3288,
            ),
            t3289,
          ),
          t3290,
        ),
        t3291,
      ),
      t3292,
    ),
    t3311,
  ])
  let t3282 = @term_syntax.parse_term("(cartesian_product : ((K) -> Bool, (K, Bool) -> Bool, (K) -> Bool) -> Bool)((l : (K) -> Bool), (i : K) => (UNIV : (Bool) -> Bool))")
  let t3283 = @tactics.trans_tac(card_lte_trans())(t3282)
  let t3281 = @simp.asm_simp_tac(
    @list.List([card_le_cartesian_product_subindex(), @sets.subset_restrict()]),
  )
  let t3280 = @simp.expand_tac("l")
  let t3278 = @term_syntax.parse_term("cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool))")
  let t3279 = @tactics.trans_tac(card_lte_trans())(t3278)
  let t3277 = @simp.rewrite_tac(
    @list.List([@sets.countable(), @sets.ge_c(), card_not_le()]),
  )
  let t3276 = @simp.abbrev_tac(
    @term_syntax.parse_term("(l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(∃ a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}"),
  )
  let t3275 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.infinite())]))
  let t3274 = @simp.gen_rewrite_tac(
    fn(
      x3273 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x3273
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t3330 = @list.List([
    @tactics.thenl(
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
                          @tactics.undisch_tac(
                            @term_syntax.parse_term("COUNTABLE(cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))"),
                          ),
                          t3274,
                        ),
                        t3275,
                      ),
                      @tactics.disch_tac,
                    ),
                    t3276,
                  ),
                  t3277,
                ),
                t3279,
              ),
              t3280,
            ),
            t3281,
          ),
          t3283,
        ),
        @tactics.conj_tac,
      ),
      t3312,
    ),
    t3329,
  ])
  let t3360 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@tactics.disch_tac, @tactics.conj_tac),
      t3330,
    ),
    t3359,
  ])
  let t3272 = @simp.asm_rewrite_tac(@list.List([countable_empty()]))
  let t3271 = @class.asm_cases_tac(
    @term_syntax.parse_term("cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}"),
  )
  let t3361 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3271),
        t3272,
      ),
      @tactics.eq_tac,
    ),
    t3360,
  )
  countable_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (K, A) -> Bool, ∀ k : (K) -> Bool, COUNTABLE(cartesian_product(k, s)) == (cartesian_product(k, s) == {} || FINITE({(i : K) | IN(i, k) && !(∃ a : A, SUBSET(s(i), {a}))}) && (∀ i : K, IN(i, k) → COUNTABLE(s(i))))"),
      t3361,
    ),
  )
}

///|
let countable_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_CARTESIAN_PRODUCT",
)

///|
/// `COUNTABLE_CARTESIAN_PRODUCT`
pub fn countable_cartesian_product() -> @kernel.Thm {
  countable_cartesian_product_c.get()
}

///|
/// CARD_EXP_FINITE_EQ
fn step_289() -> Unit raise {
  let t3370 = @meson.asm_meson_tac(
    @list.List([
      @sets.finite_subset(),
      @sets.finite_sing(),
      @sets.empty_subset(),
    ]),
  )
  let t3369 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!((t : (_) -> Bool) == {}) → (∀ a : _, IN(a, t) → (P : Bool)) == P"),
      ),
    ]),
  )
  let t3368 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(∀ x : _, P(x) → !Q(x))"),
      ),
    ]),
  )
  let t3367 = @simp.asm_rewrite_tac(
    @list.List([@sets.empty_gspec(), @sets.finite_empty(), @sets.in_gspec()]),
  )
  let t3366 = @class.asm_cases_tac(@term_syntax.parse_term("∃ a : A, SUBSET((s : (A) -> Bool), {a})"))
  let t3365 = @simp.asm_rewrite_tac(
    @list.List([@sets.not_in_empty(), @sets.empty_gspec(), @sets.finite_empty()]),
  )
  let t3364 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (B) -> Bool) == {}"))
  let t3363 = @simp.rewrite_tac(
    @list.List([@sets.cartesian_product_eq_empty()]),
  )
  let t3362 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(cartesian_product_const()),
      finite_cartesian_product(),
    ]),
  )
  let t3371 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t3362,
                  ),
                  t3363,
                ),
                t3364,
              ),
              t3365,
            ),
            t3366,
          ),
          t3367,
        ),
        t3368,
      ),
      t3369,
    ),
    t3370,
  )
  card_exp_finite_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(op_caret_us_c(s, t)) == ((∃ a : A, SUBSET(s, {a})) || t == {} || FINITE(s) && FINITE(t))"),
      t3371,
    ),
  )
}

///|
let card_exp_finite_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EXP_FINITE_EQ",
)

///|
/// `CARD_EXP_FINITE_EQ`
pub fn card_exp_finite_eq() -> @kernel.Thm {
  card_exp_finite_eq_c.get()
}

///|
/// CARD_EQ_CARTESIAN_PRODUCT_DISJOINT_UNION
fn step_290() -> Unit raise {
  let t3381 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3380 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @sets.restriction()]),
  )
  let t3379 = @simp.rewrite_tac(
    @list.List([@sets.extensional(), @sets.in_elim_thm()]),
  )
  let t3378 = @simp.simp_tac(@list.List([@sets.forall_in_union()]))
  let t3377 = @simp.rewrite_tac(
    @list.List([@sets.restriction_unique(), @sets.in_cartesian_product()]),
  )
  let t3376 = @simp.rewrite_tac(
    @list.List([@sets.restriction_in_cartesian_product()]),
  )
  let t3375 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_cross(), @pair.pair_eq()]),
  )
  let t3374 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { ((f : (K) -> A), (g : (K) -> A)) => (x : K) => if (IN : (K, (K) -> Bool) -> Bool)(x, (k : (K) -> Bool)) { f(x) } else { g(x) } }"),
  )
  let t3373 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (K) -> A) => (RESTRICTION((k : (K) -> Bool), f), RESTRICTION((l : (K) -> Bool), f))"),
  )
  let t3372 = @simp.rewrite_tac(@list.List([eq_c_bijections()]))
  let t3382 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t3372,
                    ),
                    t3373,
                  ),
                  t3374,
                ),
                t3375,
              ),
              t3376,
            ),
            t3377,
          ),
          t3378,
        ),
        t3379,
      ),
      t3380,
    ),
    t3381,
  )
  card_eq_cartesian_product_disjoint_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K, A) -> Bool, ∀ k : (K) -> Bool, ∀ l : (K) -> Bool, DISJOINT(k, l) → op_eq_us_c(cartesian_product(UNION(k, l), f), CROSS(cartesian_product(k, f), cartesian_product(l, f)))"),
      t3382,
    ),
  )
}

///|
let card_eq_cartesian_product_disjoint_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_CARTESIAN_PRODUCT_DISJOINT_UNION",
)

///|
/// `CARD_EQ_CARTESIAN_PRODUCT_DISJOINT_UNION`
pub fn card_eq_cartesian_product_disjoint_union() -> @kernel.Thm {
  card_eq_cartesian_product_disjoint_union_c.get()
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
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
}
