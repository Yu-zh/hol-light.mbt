// Translated from upstream ind_types.ml; edit this file directly.

///|
/// INJ_INVERSE2
fn step_1() -> Unit raise {
  let t6 = @simp.asm_rewrite_tac(@list.List([]))
  let t5 = @tactics.match_mp_tac(@class.select_unique())
  let t4 = @simp.asm_rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t3 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2 = @tactics.exists_tac(
    @term_syntax.parse_term("(z : C) => select((y : B) => ∃ x : A, (P : (A, B) -> C)(x, y) == z)"),
  )
  let t1 = @tactics.exists_tac(
    @term_syntax.parse_term("(z : C) => select((x : A) => ∃ y : B, (P : (A, B) -> C)(x, y) == z)"),
  )
  let t17 = @tactics.then_tac(
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
                              @tactics.gen_tac, @tactics.disch_tac,
                            ),
                            t1,
                          ),
                          t2,
                        ),
                        t3,
                      ),
                      t4,
                    ),
                    @tactics.conj_tac,
                  ),
                  t5,
                ),
                @tactics.gen_tac,
              ),
              @tactics.beta_tac,
            ),
            @tactics.eq_tac,
          ),
          @tactics.strip_tac,
        ),
        t6,
      ),
      fn(
        x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x13 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x12 : (@kernel.Term, @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x10 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x7 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s8 = @tactics.exists_tac(x7)
                  fn(
                    x9 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s8(x9)
                  }
                })(@kernel.rand(x10))
              })(
                (fn(x11 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  x11.1
                })(x12),
              )
            })(@basics.dest_exists(x13))
          })(
            (fn(
              x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x14.1
            })(x15),
          )
        })(x16)(x16)
      },
    ),
    @tactics.refl_tac,
  )
  inj_inverse2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> C, (∀ x1 : A, ∀ y1 : B, ∀ x2 : A, ∀ y2 : B, (P(x1, y1) == P(x2, y2)) == (x1 == x2 && y1 == y2)) → (∃ X : (C) -> A, ∃ Y : (C) -> B, ∀ x : A, ∀ y : B, X(P(x, y)) == x && Y(P(x, y)) == y)"),
      t17,
    ),
  )
}

///|
let inj_inverse2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJ_INVERSE2")

///|
/// `INJ_INVERSE2`
pub fn inj_inverse2() -> @kernel.Thm {
  inj_inverse2_c.get()
}

///|
/// NUMPAIR
fn step_2() -> Unit raise {
  numpair_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(NUMPAIR : (Num, Num) -> Num)((x : Num), (y : Num)) == EXP(2, x) * (2 * y + 1)"),
    ),
  )
}

///|
let numpair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMPAIR")

///|
/// `NUMPAIR`
pub fn numpair() -> @kernel.Thm {
  numpair_c.get()
}

///|
/// NUMPAIR_INJ_LEMMA
fn step_3() -> Unit raise {
  let t28 = @simp.rewrite_tac(
    @list.List([@arith.even_mult(), @arith.even_add(), @calc_num.arith()]),
  )
  let t24 = @term_syntax.parse_term("EVEN")
  let t27 = @tactics.disch_then(fn(
    x26 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x21 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s22 = @tactics.mp_tac(x21)
      fn(
        x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s22(x23)
      }
    })(((x25 : @kernel.Thm) => @equal.ap_term(t24, x25))(x26))
  })
  let t19 = @equal.gsym(@nums.not_suc())
  let t20 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.exp(),
      @equal.gsym(@arith.mult_assoc()),
      @calc_num.arith(),
      @arith.eq_mult_lcancel(),
      @nums.not_suc(),
      t19,
      @nums.suc_inj(),
    ]),
  )
  let t18 = @tactics.repeat_tac(
    @tactics.then_tac(@nums.induct_tac, @tactics.gen_tac),
  )
  let t29 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([numpair()])), t18),
        t20,
      ),
      t27,
    ),
    t28,
  )
  numpair_inj_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : Num, ∀ y1 : Num, ∀ x2 : Num, ∀ y2 : Num, NUMPAIR(x1, y1) == NUMPAIR(x2, y2) → x1 == x2"),
      t29,
    ),
  )
}

///|
let numpair_inj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMPAIR_INJ_LEMMA",
)

///|
/// `NUMPAIR_INJ_LEMMA`
pub fn numpair_inj_lemma() -> @kernel.Thm {
  numpair_inj_lemma_c.get()
}

///|
/// NUMPAIR_INJ
fn step_4() -> Unit raise {
  let t42 = @simp.rewrite_tac(
    @list.List([
      @arith.eq_mult_lcancel(),
      @arith.eq_add_rcancel(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
    ]),
  )
  let t41 = @simp.rewrite_tac(@list.List([numpair()]))
  let t40 = @tactics.pop_assum(fn(
    x37 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s38 = @tactics.mp_tac(x37)
    fn(
      x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s38(x39)
    }
  })
  let t34 = @drule.match_mp(numpair_inj_lemma())
  let t36 = @tactics.first_assum(fn(
    x35 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x31 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s32 = @tactics.subst_all_tac(x31)
      fn(
        x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s32(x33)
      }
    })(t34(x35))
  })
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              @tactics.disch_tac,
            ),
            t30,
          ),
          t36,
        ),
        t40,
      ),
      t41,
    ),
    t42,
  )
  numpair_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : Num, ∀ y1 : Num, ∀ x2 : Num, ∀ y2 : Num, (NUMPAIR(x1, y1) == NUMPAIR(x2, y2)) == (x1 == x2 && y1 == y2)"),
      t43,
    ),
  )
}

///|
let numpair_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMPAIR_INJ")

///|
/// `NUMPAIR_INJ`
pub fn numpair_inj() -> @kernel.Thm {
  numpair_inj_c.get()
}

///|
/// NUMPAIR_DEST
fn step_5() -> Unit raise {
  let t44 = @drule.match_mp(inj_inverse2())(numpair_inj())
  numpair_dest_c.set(
    @nums.new_specification(@list.List(["NUMFST", "NUMSND"]))(t44),
  )
}

///|
let numpair_dest_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMPAIR_DEST")

///|
/// `NUMPAIR_DEST`
pub fn numpair_dest() -> @kernel.Thm {
  numpair_dest_c.get()
}

///|
/// NUMSUM
fn step_6() -> Unit raise {
  numsum_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(NUMSUM : (Bool, Num) -> Num)((b : Bool), (x : Num)) == (if b { SUC(2 * x) } else { 2 * x })"),
    ),
  )
}

///|
let numsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSUM")

///|
/// `NUMSUM`
pub fn numsum() -> @kernel.Thm {
  numsum_c.get()
}

///|
/// NUMSUM_INJ
fn step_7() -> Unit raise {
  let t58 = @simp.rewrite_tac(
    @list.List([@nums.suc_inj(), @arith.eq_mult_lcancel(), @calc_num.arith()]),
  )
  let t57 = @simp.rewrite_tac(@list.List([@arith.even(), @arith.even_double()]))
  let t56 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t55 = @tactics.disch_then(fn(
    x52 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x52
    let t54 = @tactics.mp_tac(@equal.ap_term(@term_syntax.parse_term("EVEN"), th))
    @tactics.then_tac(@tactics.mp_tac(th), t54)
  })
  let t49 = @simp.rewrite_rule(@list.List([numsum()]))
  let t51 = @tactics.pop_assum(fn(
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
    (fn(
      x46 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s47 = @tactics.mp_tac(x46)
      fn(
        x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s47(x48)
      }
    })(t49(x50))
  })
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t59 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @tactics.eq_tac,
                ),
                @tactics.disch_tac,
              ),
              t45,
            ),
            t51,
          ),
          t55,
        ),
        t56,
      ),
      t57,
    ),
    t58,
  )
  numsum_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b1 : Bool, ∀ x1 : Num, ∀ b2 : Bool, ∀ x2 : Num, (NUMSUM(b1, x1) == NUMSUM(b2, x2)) == (b1 == b2 && x1 == x2)"),
      t59,
    ),
  )
}

///|
let numsum_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSUM_INJ")

///|
/// `NUMSUM_INJ`
pub fn numsum_inj() -> @kernel.Thm {
  numsum_inj_c.get()
}

///|
/// NUMSUM_DEST
fn step_8() -> Unit raise {
  let t60 = @drule.match_mp(inj_inverse2())(numsum_inj())
  numsum_dest_c.set(
    @nums.new_specification(@list.List(["NUMLEFT", "NUMRIGHT"]))(t60),
  )
}

///|
let numsum_dest_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSUM_DEST")

///|
/// `NUMSUM_DEST`
pub fn numsum_dest() -> @kernel.Thm {
  numsum_dest_c.get()
}

///|
/// INJN
fn step_9() -> Unit raise {
  injn_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(INJN : (Num, Num, A) -> Bool)((m : Num)) == ((n : Num) => (a : A) => n == m)"),
    ),
  )
}

///|
let injn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJN")

///|
/// `INJN`
pub fn injn() -> @kernel.Thm {
  injn_c.get()
}

///|
/// INJN_INJ
fn step_10() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t78 = @term_syntax.parse_term("(a : A)")
  let t81 = @tactics.disch_then(fn(
    x80 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x73 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s74 = @tactics.mp_tac(x73)
      fn(
        x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s74(x75)
      }
    })(
      (fn(x79 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x76 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x77 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x76, x77)
          }
        })(x79)(t78)
      })(x80),
    )
  })
  let t70 = @simp.rewrite_rule(@list.List([injn()]))
  let t67 = @term_syntax.parse_term("(n1 : Num)")
  let t72 = @tactics.pop_assum(fn(
    x71 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x69 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x62 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s63 = @tactics.mp_tac(x62)
        fn(
          x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s63(x64)
        }
      })(
        (fn(x68 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x65 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x66 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x65, x66)
            }
          })(x68)(t67)
        })(x69),
      )
    })(t70(x71))
  })
  let t61 = @simp.asm_rewrite_tac(@list.List([]))
  let t83 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @tactics.eq_tac,
            ),
            @tactics.disch_tac,
          ),
          t61,
        ),
        t72,
      ),
      t81,
    ),
    t82,
  )
  injn_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n1 : Num, ∀ n2 : Num, ((INJN : (Num, Num, A) -> Bool)(n1) == (INJN : (Num, Num, A) -> Bool)(n2)) == (n1 == n2)"),
      t83,
    ),
  )
}

///|
let injn_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJN_INJ")

///|
/// `INJN_INJ`
pub fn injn_inj() -> @kernel.Thm {
  injn_inj_c.get()
}

///|
/// INJA
fn step_11() -> Unit raise {
  inja_c.set(
    @pair.new_definition(@term_syntax.parse_term("(INJA : (A, Num, A) -> Bool)((a : A)) == ((n : Num) => (b : A) => b == a)")),
  )
}

///|
let inja_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJA")

///|
/// `INJA`
pub fn inja() -> @kernel.Thm {
  inja_c.get()
}

///|
/// INJA_INJ
fn step_12() -> Unit raise {
  let t95 = @simp.rewrite_tac(@list.List([]))
  let t96 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x92 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s93 = @tactics.subst1_tac(x92)
      fn(
        x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s93(x94)
      }
    }),
    t95,
  )
  let t91 = @simp.rewrite_tac(@list.List([]))
  let t88 = @term_syntax.parse_term("(a1 : A)")
  let t97 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x90 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x85 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s86 = @tactics.mp_tac(x85)
          fn(
            x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s86(x87)
          }
        })(((x89 : @kernel.Thm) => @bool.spec(t88, x89))(x90))
      }),
      t91,
    ),
    t96,
  ])
  let t84 = @simp.rewrite_tac(@list.List([inja(), @class.fun_eq_thm()]))
  let t98 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t84),
      @tactics.eq_tac,
    ),
    t97,
  )
  inja_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a1 : A, ∀ a2 : A, (INJA(a1) == INJA(a2)) == (a1 == a2)"),
      t98,
    ),
  )
}

///|
let inja_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJA_INJ")

///|
/// `INJA_INJ`
pub fn inja_inj() -> @kernel.Thm {
  inja_inj_c.get()
}

///|
/// INJF
fn step_13() -> Unit raise {
  injf_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(INJF : ((Num, Num, A) -> Bool, Num, A) -> Bool)((f : (Num, Num, A) -> Bool)) == ((n : Num) => f(NUMFST(n), NUMSND(n)))"),
    ),
  )
}

///|
let injf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJF")

///|
/// `INJF`
pub fn injf() -> @kernel.Thm {
  injf_c.get()
}

///|
/// INJF_INJ
fn step_14() -> Unit raise {
  let t124 = @simp.rewrite_tac(@list.List([numpair_dest()]))
  let t120 = @term_syntax.parse_term("NUMPAIR((n : Num), (m : Num))")
  let t115 = @term_syntax.parse_term("(a : A)")
  let t123 = @tactics.disch_then(fn(
    x122 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x117 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x110 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s111 = @tactics.mp_tac(x110)
        fn(
          x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s111(x112)
        }
      })(
        (fn(x116 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x113 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x114 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x113, x114)
            }
          })(x116)(t115)
        })(x117),
      )
    })(
      (fn(x121 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x118 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x119 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x118, x119)
          }
        })(x121)(t120)
      })(x122),
    )
  })
  let t107 = @simp.rewrite_rule(@list.List([injf()]))
  let t109 = @tactics.pop_assum(fn(
    x108 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x104 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s105 = @tactics.mp_tac(x104)
      fn(
        x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s105(x106)
      }
    })(t107(x108))
  })
  let t101 = @term_syntax.parse_term("(a : A)")
  let t102 = @term_syntax.parse_term("(m : Num)")
  let t103 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t102, t101]),
  )
  let t100 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t99 = @simp.asm_rewrite_tac(@list.List([]))
  let t125 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @tactics.eq_tac,
                ),
                @tactics.disch_tac,
              ),
              t99,
            ),
            t100,
          ),
          t103,
        ),
        t109,
      ),
      t123,
    ),
    t124,
  )
  injf_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f1 : (Num, Num, A) -> Bool, ∀ f2 : (Num, Num, A) -> Bool, (INJF(f1) == INJF(f2)) == (f1 == f2)"),
      t125,
    ),
  )
}

///|
let injf_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJF_INJ")

///|
/// `INJF_INJ`
pub fn injf_inj() -> @kernel.Thm {
  injf_inj_c.get()
}

///|
/// INJP
fn step_15() -> Unit raise {
  injp_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(INJP : ((Num, A) -> Bool, (Num, A) -> Bool, Num, A) -> Bool)((f1 : (Num, A) -> Bool), (f2 : (Num, A) -> Bool)) == ((n : Num) => (a : A) => if NUMLEFT(n) { f1(NUMRIGHT(n), a) } else { f2(NUMRIGHT(n), a) })"),
    ),
  )
}

///|
let injp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJP")

///|
/// `INJP`
pub fn injp() -> @kernel.Thm {
  injp_c.get()
}

///|
/// INJP_INJ
fn step_16() -> Unit raise {
  let t152 = @simp.asm_simp_tac(@list.List([numsum_dest(), @class.eta_ax()]))
  let t151 = @tactics.disch_then(fn(
    x148 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x148
    let t150 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("false"), th))
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("true"), th)),
      t150,
    )
  })
  let t144 = @term_syntax.parse_term("NUMSUM((b : Bool), (n : Num))")
  let t139 = @term_syntax.parse_term("(b : Bool)")
  let t147 = @tactics.disch_then(fn(
    x146 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x141 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x136 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s137 = @tactics.mp_tac(x136)
        fn(
          x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s137(x138)
        }
      })(((x140 : @kernel.Thm) => @bool.gen(t139, x140))(x141))
    })(
      (fn(x145 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x142 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x143 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x142, x143)
          }
        })(x145)(t144)
      })(x146),
    )
  })
  let t133 = @simp.rewrite_rule(@list.List([injp()]))
  let t135 = @tactics.pop_assum(fn(
    x134 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x130 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s131 = @tactics.mp_tac(x130)
      fn(
        x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s131(x132)
      }
    })(t133(x134))
  })
  let t129 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t128 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t127 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t126 = @simp.asm_rewrite_tac(@list.List([]))
  let t153 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    @tactics.disch_tac,
                  ),
                  t126,
                ),
                t127,
              ),
              t128,
            ),
            t129,
          ),
          t135,
        ),
        t147,
      ),
      t151,
    ),
    t152,
  )
  injp_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f1 : (Num, A) -> Bool, ∀ f1' : (Num, A) -> Bool, ∀ f2 : (Num, A) -> Bool, ∀ f2' : (Num, A) -> Bool, (INJP(f1, f2) == INJP(f1', f2')) == (f1 == f1' && f2 == f2')"),
      t153,
    ),
  )
}

///|
let injp_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJP_INJ")

///|
/// `INJP_INJ`
pub fn injp_inj() -> @kernel.Thm {
  injp_inj_c.get()
}

///|
/// ZCONSTR
fn step_17() -> Unit raise {
  zconstr_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(ZCONSTR : (Num, A, (Num, Num, A) -> Bool, Num, A) -> Bool)((c : Num), (i : A), (r : (Num, Num, A) -> Bool)) == INJP(INJN(SUC(c)), INJP(INJA(i), INJF(r)))"),
    ),
  )
}

///|
let zconstr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZCONSTR")

///|
/// `ZCONSTR`
pub fn zconstr() -> @kernel.Thm {
  zconstr_c.get()
}

///|
/// ZBOT
fn step_18() -> Unit raise {
  zbot_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(ZBOT : (Num, A) -> Bool) == INJP(INJN(0), select((z : (Num, A) -> Bool) => true))"),
    ),
  )
}

///|
let zbot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZBOT")

///|
/// `ZBOT`
pub fn zbot() -> @kernel.Thm {
  zbot_c.get()
}

///|
/// ZCONSTR_ZBOT
fn step_19() -> Unit raise {
  let t154 = @simp.rewrite_tac(
    @list.List([zconstr(), zbot(), injp_inj(), injn_inj(), @nums.not_suc()]),
  )
  zconstr_zbot_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ i : A, ∀ r : (Num, Num, A) -> Bool, !(ZCONSTR(c, i, r) == ZBOT)"),
      t154,
    ),
  )
}

///|
let zconstr_zbot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZCONSTR_ZBOT")

///|
/// `ZCONSTR_ZBOT`
pub fn zconstr_zbot() -> @kernel.Thm {
  zconstr_zbot_c.get()
}

///|
let zrecspace_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZRECSPACE_RULES",
)

///|
/// `ZRECSPACE_RULES`
pub fn zrecspace_rules() -> @kernel.Thm {
  zrecspace_rules_c.get()
}

///|
let zrecspace_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZRECSPACE_INDUCT",
)

///|
/// `ZRECSPACE_INDUCT`
pub fn zrecspace_induct() -> @kernel.Thm {
  zrecspace_induct_c.get()
}

///|
let zrecspace_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZRECSPACE_CASES",
)

///|
/// `ZRECSPACE_CASES`
pub fn zrecspace_cases() -> @kernel.Thm {
  zrecspace_cases_c.get()
}

///|
/// ZRECSPACE_RULES, ZRECSPACE_INDUCT, ZRECSPACE_CASES
fn step_20() -> Unit raise {
  let (zrecspace_rules, zrecspace_induct, zrecspace_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(ZRECSPACE : ((Num, A) -> Bool) -> Bool)(ZBOT) && (∀ c : Num, ∀ i : A, ∀ r : (Num, Num, A) -> Bool, (∀ n : Num, ZRECSPACE(r(n))) → ZRECSPACE(ZCONSTR(c, i, r)))"),
  )
  zrecspace_rules_c.set(zrecspace_rules)
  zrecspace_induct_c.set(zrecspace_induct)
  zrecspace_cases_c.set(zrecspace_cases)
}

///|
/// recspace_tydef
fn step_21() -> Unit raise {
  recspace_tydef_c.set(
    @kernel.new_basic_type_definition(
      "recspace",
      "_mk_rec",
      "_dest_rec",
      @bool.conjunct1(zrecspace_rules()),
    ),
  )
}

///|
let recspace_tydef_c : @lib.Cell[(@kernel.Thm, @kernel.Thm)] = @lib.Cell::new(
  "recspace_tydef",
)

///|
/// `recspace_tydef`
pub fn recspace_tydef() -> (@kernel.Thm, @kernel.Thm) {
  recspace_tydef_c.get()
}

///|
/// BOTTOM
fn step_22() -> Unit raise {
  bottom_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(BOTTOM : Recspace[A]) == _mk_rec(ZBOT)"),
    ),
  )
}

///|
let bottom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOTTOM")

///|
/// `BOTTOM`
pub fn bottom() -> @kernel.Thm {
  bottom_c.get()
}

///|
/// CONSTR
fn step_23() -> Unit raise {
  constr_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(CONSTR : (Num, A, (Num) -> Recspace[A]) -> Recspace[A])((c : Num), (i : A), (r : (Num) -> Recspace[A])) == _mk_rec(ZCONSTR(c, i, (n : Num) => _dest_rec(r(n))))"),
    ),
  )
}

///|
let constr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTR")

///|
/// `CONSTR`
pub fn constr() -> @kernel.Thm {
  constr_c.get()
}

///|
/// MK_REC_INJ
fn step_24() -> Unit raise {
  let t159 = @simp.asm_rewrite_tac(@list.List([]))
  let t158 = @tactics.disch_then(fn(
    x156 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x156
    @simp.once_rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t155 = @simp.rewrite_tac(@list.List([recspace_tydef().1]))
  let t160 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.disch_tac,
        ),
        t155,
      ),
      t158,
    ),
    t159,
  )
  mk_rec_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num, A) -> Bool, ∀ y : (Num, A) -> Bool, _mk_rec(x) == _mk_rec(y) → ZRECSPACE(x) && ZRECSPACE(y) → x == y"),
      t160,
    ),
  )
}

///|
let mk_rec_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_REC_INJ")

///|
/// `MK_REC_INJ`
pub fn mk_rec_inj() -> @kernel.Thm {
  mk_rec_inj_c.get()
}

///|
/// DEST_REC_INJ
fn step_25() -> Unit raise {
  let t169 = @simp.rewrite_tac(@list.List([recspace_tydef().0]))
  let t165 = @term_syntax.parse_term("(_mk_rec : ((Num, A) -> Bool) -> Recspace[A])")
  let t168 = @tactics.pop_assum(fn(
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
    (fn(
      x162 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s163 = @tactics.mp_tac(x162)
      fn(
        x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s163(x164)
      }
    })(((x166 : @kernel.Thm) => @equal.ap_term(t165, x166))(x167))
  })
  let t161 = @simp.asm_rewrite_tac(@list.List([]))
  let t170 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          @tactics.disch_tac,
        ),
        t161,
      ),
      t168,
    ),
    t169,
  )
  dest_rec_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Recspace[A], ∀ y : Recspace[A], (_dest_rec(x) == _dest_rec(y)) == (x == y)"),
      t170,
    ),
  )
}

///|
let dest_rec_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_REC_INJ")

///|
/// `DEST_REC_INJ`
pub fn dest_rec_inj() -> @kernel.Thm {
  dest_rec_inj_c.get()
}

///|
/// CONSTR_BOT
fn step_26() -> Unit raise {
  let t180 = @simp.rewrite_tac(
    @list.List([recspace_tydef().0, recspace_tydef().1]),
  )
  let t179 = @tactics.match_mp_tac(@bool.conjunct2(zrecspace_rules()))
  let t178 = @simp.rewrite_tac(@list.List([zconstr_zbot(), zrecspace_rules()]))
  let t175 = @drule.match_mp(mk_rec_inj())
  let t177 = @tactics.disch_then(fn(
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
    (fn(
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
      let s173 = @tactics.mp_tac(x172)
      fn(
        x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s173(x174)
      }
    })(t175(x176))
  })
  let t171 = @simp.rewrite_tac(@list.List([constr(), bottom()]))
  let t181 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t171),
          t177,
        ),
        t178,
      ),
      t179,
    ),
    t180,
  )
  constr_bot_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ i : A, ∀ r : (Num) -> Recspace[A], !(CONSTR(c, i, r) == BOTTOM)"),
      t181,
    ),
  )
}

///|
let constr_bot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTR_BOT")

///|
/// `CONSTR_BOT`
pub fn constr_bot() -> @kernel.Thm {
  constr_bot_c.get()
}

///|
/// CONSTR_INJ
fn step_27() -> Unit raise {
  let t212 = @simp.rewrite_tac(@list.List([@nums.suc_inj(), dest_rec_inj()]))
  let t211 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t210 = @simp.rewrite_tac(
    @list.List([injp_inj(), injn_inj(), injf_inj(), inja_inj()]),
  )
  let t209 = @simp.rewrite_tac(@list.List([zconstr()]))
  let t213 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t209),
          t210,
        ),
        t211,
      ),
      @tactics.beta_tac,
    ),
    t212,
  )
  let t208 = @simp.rewrite_tac(
    @list.List([recspace_tydef().0, recspace_tydef().1]),
  )
  let t214 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conj_tac,
        @tactics.match_mp_tac(@bool.conjunct2(zrecspace_rules())),
      ),
      t208,
    ),
    t213,
  ])
  let t192 = @drule.match_mp(mk_rec_inj())
  let t194 = @tactics.disch_then(fn(
    x193 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x189 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s190 = @tactics.mp_tac(x189)
      fn(
        x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s190(x191)
      }
    })(t192(x193))
  })
  let t186 = @simp.rewrite_rule(@list.List([constr()]))
  let t188 = @tactics.pop_assum(fn(
    x187 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s184 = @tactics.mp_tac(x183)
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
    })(t186(x187))
  })
  let t182 = @simp.asm_rewrite_tac(@list.List([]))
  let t215 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              @tactics.disch_tac,
            ),
            t182,
          ),
          t188,
        ),
        t194,
      ),
      fn(
        x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x204 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x202 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x195 : @kernel.Term,
              ) -> ((
                (@kernel.Thm) -> ((
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
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise) raise {
                fn(
                  x196 : (@kernel.Thm) -> ((
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
                  ) raise) raise,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s197 = @tactics.subgoal_then(x195, x196)
                  fn(
                    x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s197(x198)
                  }
                }
              })(x202)(fn(
                x199 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s200 = @tactics.assume_tac(x199)
                fn(
                  x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s200(x201)
                }
              })
            })(
              ((x203 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x203))(
                x204,
              ),
            )
          })(
            (fn(
              x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x205.1
            })(x206),
          )
        })(x207)(x207)
      },
    ),
    t214,
  )
  constr_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Num, ∀ i1 : A, ∀ r1 : (Num) -> Recspace[A], ∀ c2 : Num, ∀ i2 : A, ∀ r2 : (Num) -> Recspace[A], (CONSTR(c1, i1, r1) == CONSTR(c2, i2, r2)) == (c1 == c2 && i1 == i2 && r1 == r2)"),
      t215,
    ),
  )
}

///|
let constr_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTR_INJ")

///|
/// `CONSTR_INJ`
pub fn constr_inj() -> @kernel.Thm {
  constr_inj_c.get()
}

///|
/// CONSTR_IND
fn step_28() -> Unit raise {
  let t252 = @simp.rewrite_tac(
    @list.List([recspace_tydef().0, recspace_tydef().1]),
  )
  let t251 = @tactics.disch_then(@tactics.match_mp_tac)
  let t250 = @simp.rewrite_tac(
    @list.List([
      @itab.itaut(@term_syntax.parse_term("((a : Bool) → a && (b : Bool)) == (a → b)")),
    ]),
  )
  let t249 = @simp.rewrite_tac(@list.List([recspace_tydef().0]))
  let t245 = @term_syntax.parse_term("_dest_rec((x : Recspace[A]))")
  let t248 = @tactics.disch_then(fn(
    x247 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x242 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s243 = @tactics.mp_tac(x242)
      fn(
        x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s243(x244)
      }
    })(((x246 : @kernel.Thm) => @bool.spec(t245, x246))(x247))
  })
  let t253 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t248),
          t249,
        ),
        t250,
      ),
      t251,
    ),
    t252,
  )
  let t239 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t238 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([recspace_tydef().1])),
  )
  let t237 = @simp.rewrite_tac(@list.List([constr()]))
  let t240 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(
          @tactics.ante_res_then(fn(
            x234 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s235 = @tactics.mp_tac(x234)
            fn(
              x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s235(x236)
            }
          }),
        ),
        t237,
      ),
      t238,
    ),
    t239,
  )
  let t233 = @simp.asm_rewrite_tac(@list.List([]))
  let t241 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@bool.conjunct2(zrecspace_rules())),
      t233,
    ),
    t240,
  ])
  let t232 = @tactics.repeat_tac(@tactics.strip_tac)
  let t231 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t254 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t231),
        t232,
      ),
      t241,
    ),
    t253,
  ])
  let t217 = @simp.asm_rewrite_tac(
    @list.List([zrecspace_rules(), @equal.gsym(bottom())]),
  )
  let t216 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(z : (Num, A) -> Bool) => ZRECSPACE(z) && (P : (Recspace[A]) -> Bool)(_mk_rec(z))"),
      zrecspace_induct(),
    ),
  )
  let t255 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t216),
          @tactics.beta_tac,
        ),
        t217,
      ),
      fn(
        x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x227 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x225 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x218 : @kernel.Term,
              ) -> ((
                (@kernel.Thm) -> ((
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
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise) raise {
                fn(
                  x219 : (@kernel.Thm) -> ((
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
                  ) raise) raise,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s220 = @tactics.subgoal_then(x218, x219)
                  fn(
                    x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s220(x221)
                  }
                }
              })(x225)(fn(
                x222 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s223 = @tactics.assume_tac(x222)
                fn(
                  x224 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s223(x224)
                }
              })
            })(
              ((x226 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x226))(
                x227,
              ),
            )
          })(
            (fn(
              x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x228.1
            })(x229),
          )
        })(x230)(x230)
      },
    ),
    t254,
  )
  constr_ind_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Recspace[A]) -> Bool, P(BOTTOM) && (∀ c : Num, ∀ i : A, ∀ r : (Num) -> Recspace[A], (∀ n : Num, P(r(n))) → P(CONSTR(c, i, r))) → (∀ x : Recspace[A], P(x))"),
      t255,
    ),
  )
}

///|
let constr_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTR_IND")

///|
/// `CONSTR_IND`
pub fn constr_ind() -> @kernel.Thm {
  constr_ind_c.get()
}

///|
/// CONSTR_REC
fn step_29() -> Unit raise {
  let t349 = @simp.rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t348 = @tactics.first_assum(fn(
    x345 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x345
    @simp.gen_rewrite_tac(
      fn(
        x347 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x347
      },
      @list.List([@equal.gsym(th_1)]),
    )
  })
  let t344 = @tactics.first_assum(@tactics.match_mp_tac)
  let t343 = @tactics.repeat_tac(@tactics.gen_tac)
  let t342 = @simp.asm_rewrite_tac(@list.List([]))
  let t341 = @tactics.exists_tac(@parser.parse_term("fn_:(A)recspace->B"))
  let t340 = @tactics.disch_then(
    @tactics.x_choose_then(@parser.parse_term("fn_:(A)recspace->B"))(fn(
      x339 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s337 = @tactics.assume_tac(x336)
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
      })(@equal.gsym(x339))
    }),
  )
  let t350 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@class.unique_skolem_alt()])),
                  t340,
                ),
                t341,
              ),
              t342,
            ),
            t343,
          ),
          t344,
        ),
        @tactics.gen_tac,
      ),
      t348,
    ),
    t349,
  )
  let t331 = @simp.asm_rewrite_tac(@list.List([]))
  let t330 = @tactics.exists_tac(@term_syntax.parse_term("(w : Num)"))
  let t329 = @tactics.first_assum(@tactics.match_mp_tac)
  let t328 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Num)"))
  let t327 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t326 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t325 = @simp.asm_rewrite_tac(@list.List([]))
  let t324 = @tactics.repeat_tac(@tactics.strip_tac)
  let t323 = @simp.rewrite_tac(
    @list.List([@theorems.unwind_thm1(), @theorems.right_exists_and_thm()]),
  )
  let t332 = @tactics.then_tac(
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
                        constr_bot(),
                        constr_inj(),
                        @equal.gsym(@theorems.conj_assoc()),
                      ]),
                    ),
                    t323,
                  ),
                  t324,
                ),
                t325,
              ),
              t326,
            ),
            t327,
          ),
          t328,
        ),
        t329,
      ),
      t330,
    ),
    t331,
  )
  let t322 = @simp.asm_rewrite_tac(@list.List([]))
  let t321 = @tactics.exists_tac(@term_syntax.parse_term("(y : (Num) -> B)"))
  let t320 = @simp.rewrite_tac(
    @list.List([@theorems.unwind_thm1(), @theorems.right_exists_and_thm()]),
  )
  let t319 = @simp.rewrite_tac(
    @list.List([constr_bot(), constr_inj(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t333 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(
              @term_syntax.parse_term("(Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B)((c : Num), (i : A), (r : (Num) -> Recspace[A]), (y : (Num) -> B))"),
            ),
            t319,
          ),
          t320,
        ),
        t321,
      ),
      t322,
    ),
    t332,
  ])
  let t318 = @tactics.first_assum(fn(
    x316 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x316
    @tactics.changed_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(th)])))
  })
  let t315 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t314 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(y : (Num) -> B)"))(fn(
      x311 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s312 = @tactics.assume_tac(x311)
      fn(
        x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s312(x313)
      }
    }),
  )
  let t308 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))
  let t310 = @tactics.disch_then(fn(
    x309 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x305 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s306 = @tactics.mp_tac(x305)
      fn(
        x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s306(x307)
      }
    })(t308(x309))
  })
  let t304 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s299 = @tactics.mp_tac(x298)
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
      },
      fn(
        x301 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s302 = @tactics.assume_tac(x301)
        fn(
          x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s302(x303)
        }
      },
    ),
  )
  let t296 = @simp.rewrite_rule(
    @list.List([@theorems.exists_unique_thm(), @theorems.forall_and_thm()]),
  )
  let t334 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_then(fn(
                  x297 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x293 : @kernel.Thm,
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
                    let s294 = @tactics.mp_tac(x293)
                    fn(
                      x295 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s294(x295)
                    }
                  })(t296(x297))
                }),
                t304,
              ),
              t310,
            ),
            t314,
          ),
          t315,
        ),
        t318,
      ),
      @tactics.conj_tac,
    ),
    t333,
  )
  let t292 = @simp.rewrite_tac(
    @list.List([@equal.gsym(constr_bot()), @theorems.exists_unique_refl()]),
  )
  let t335 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x287 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let t = x287
        @simp.gen_rewrite_tac(
          fn(
            x289 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s290 = @equal.binder_conv(x289)
            fn(x291 : @kernel.Term) -> @kernel.Thm raise { s290(x291) }
          },
          @list.List([@equal.gsym(t)]),
        )
      }),
      t292,
    ),
    t334,
  ])
  let t286 = @tactics.repeat_tac(@tactics.gen_tac)
  let t285 = @tactics.disch_then(@tactics.match_mp_tac)
  let t280 = @drule.part_match(@kernel.rand, constr_ind())
  let t351 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            fn(
              x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x281 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x277 : @kernel.Thm,
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
                    let s278 = @tactics.mp_tac(x277)
                    fn(
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
                      s278(x279)
                    }
                  })(t280(x281))
                })(
                  (fn(
                    x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x282.1
                  })(x283),
                )
              })(x284)(x284)
            },
            t285,
          ),
          @tactics.conj_tac,
        ),
        t286,
      ),
      t335,
    ),
    t350,
  ])
  let t276 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Recspace[A], existsunique((y : B) => (Z : (Recspace[A], B) -> Bool)(x, y))"),
    fn(
      x273 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s274 = @tactics.mp_tac(x273)
      fn(
        x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s274(x275)
      }
    },
  )
  let t272 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x265 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s266 = @tactics.assume_tac(x265)
        fn(
          x267 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s266(x267)
        }
      },
      fn(
        x271 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x268 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s269 = @tactics.assume_tac(x268)
          fn(
            x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s269(x270)
          }
        })(@equal.gsym(x271))
      },
    ),
  )
  let t264 = @tactics.disch_then(
    @tactics.choose_then(
      @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(
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
        let s262 = @tactics.mp_tac(x261)
        fn(
          x263 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s262(x263)
        }
      }),
    ),
  )
  let t259 = @term_syntax.parse_term("(Z : (Recspace[A], B) -> Bool)(BOTTOM, (b : B)) && (∀ c : Num, ∀ i : A, ∀ r : (Num) -> Recspace[A], ∀ y : (Num) -> B, (∀ n : Num, Z(r(n), y(n))) → Z(CONSTR(c, i, r), (Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B)(c, i, r, y)))")
  let t260 = (fn(
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
  })(@ind_defs.prove_inductive_relations_exist(t259))
  let t352 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t260),
          t264,
        ),
        t272,
      ),
      t276,
    ),
    t351,
  )
  constr_rec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B, ∃ f : (Recspace[A]) -> B, ∀ c : Num, ∀ i : A, ∀ r : (Num) -> Recspace[A], f(CONSTR(c, i, r)) == Fn(c, i, r, (n : Num) => f(r(n)))"),
      t352,
    ),
  )
}

///|
let constr_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTR_REC")

///|
/// `CONSTR_REC`
pub fn constr_rec() -> @kernel.Thm {
  constr_rec_c.get()
}

///|
/// FCONS
fn step_30() -> Unit raise {
  let t353 = @term_syntax.parse_term("(∀ a : A, ∀ f : (Num) -> A, (FCONS : (A, (Num) -> A, Num) -> A)(a, f, 0) == a) && (∀ a : A, ∀ f : (Num) -> A, ∀ n : Num, FCONS(a, f, SUC(n)) == f(n))")
  fcons_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t353))
}

///|
let fcons_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FCONS")

///|
/// `FCONS`
pub fn fcons() -> @kernel.Thm {
  fcons_c.get()
}

///|
/// FCONS_UNDO
fn step_31() -> Unit raise {
  let t354 = @simp.rewrite_tac(@list.List([fcons(), @trivia.o_thm()]))
  let t355 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
      ),
      @nums.induct_tac,
    ),
    t354,
  )
  fcons_undo_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> A, f == FCONS(f(0), o(f, SUC))"),
      t355,
    ),
  )
}

///|
let fcons_undo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FCONS_UNDO")

///|
/// `FCONS_UNDO`
pub fn fcons_undo() -> @kernel.Thm {
  fcons_undo_c.get()
}

///|
/// FNIL
fn step_32() -> Unit raise {
  fnil_c.set(@pair.new_definition(@term_syntax.parse_term("(FNIL : (Num) -> A)((n : Num)) == select((x : A) => true)")))
}

///|
let fnil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FNIL")

///|
/// `FNIL`
pub fn fnil() -> @kernel.Thm {
  fnil_c.get()
}

///|
/// define_type_raw
fn step_33() -> Unit raise {
  let zero = @term_syntax.parse_term("0")
  let suc = @term_syntax.parse_term("SUC")
  let sucivate : (Int64) -> @kernel.Term raise = fn(
    x356 : Int64,
  ) -> @kernel.Term raise {
    let n = x356
    @lib.funpow(
      @lib.int63_to_int(n),
      (x358 : @kernel.Term) => {
        @lib.curry(
          fn(x357 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            @kernel.mk_comb(x357.0, x357.1)
          },
          suc,
          x358,
        )
      },
      zero,
    )
  }
  let scrub_equation : (@kernel.Term) -> ((
    (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
  ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise) raise = fn(
    x359 : @kernel.Term,
  ) -> (((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)])) -> (
    @kernel.Thm,
    @list.List[(@kernel.Term, @kernel.Term)],
  ) raise) raise {
    let eq = x359
    fn(
      x360 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
    ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
      let (th, insts) = x360
      let eq_p = @lib.itlist(
        @basics.subst,
        @lib.map(
          fn(
            x361 : (@kernel.Term, @kernel.Term),
          ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
            let t = x361
            @list.List([t])
          },
          insts,
        ),
        eq,
      )
      let (l, r) = @kernel.dest_eq(eq_p)
      let t362 = @kernel.refl(r)
      (
        @bool.mp(
          @kernel.inst_rule(@list.List([(r, l)]), @bool.disch(eq_p, th)),
          t362,
        ),
        insts.prepend((r, l)),
      )
    }
  }
  let t_tm = @term_syntax.parse_term("true")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let beps_tm = @term_syntax.parse_term("select((x : Bool) => true)")
  let justify_inductive_type_model : (
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@list.List[@kernel.Thm], @kernel.Thm, @kernel.Thm) raise = fn(
    x366 : @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@list.List[@kernel.Thm], @kernel.Thm, @kernel.Thm) raise {
    let def = x366
    let (newtys, rights) = @lib.unzip(def)
    let tyargls = @lib.itlist(
      fn(
        x371 : @list.List[(String, @list.List[@kernel.HolType])],
        x372 : @list.List[@list.List[@kernel.HolType]],
      ) -> @list.List[@list.List[@kernel.HolType]] raise {
        (fn(
          x367 : @list.List[@list.List[@kernel.HolType]],
        ) -> ((@list.List[@list.List[@kernel.HolType]]) -> @list.List[
          @list.List[@kernel.HolType],
        ] raise) raise {
          fn(
            x368 : @list.List[@list.List[@kernel.HolType]],
          ) -> @list.List[@list.List[@kernel.HolType]] raise {
            x367.concat(x368)
          }
        })(
          ((x370 : @list.List[(String, @list.List[@kernel.HolType])]) => {
            @lib.map(
              fn(
                x369 : (String, @list.List[@kernel.HolType]),
              ) -> @list.List[@kernel.HolType] raise {
                x369.1
              },
              x370,
            )
          })(x371),
        )(x372)
      },
      rights,
      @list.List([]),
    )
    let alltys = @lib.itlist(
      fn(
        x378 : @list.List[@kernel.HolType],
        x379 : @list.List[@kernel.HolType],
      ) -> @list.List[@kernel.HolType] raise {
        (fn(
          x373 : @list.List[@kernel.HolType],
        ) -> ((@list.List[@kernel.HolType]) -> @list.List[@kernel.HolType] raise) raise {
          fn(
            x374 : @list.List[@kernel.HolType],
          ) -> @list.List[@kernel.HolType] raise {
            munion_l(x373, x374)
          }
        })(
          (fn(
            x377 : @list.List[@kernel.HolType],
          ) -> @list.List[@kernel.HolType] raise {
            (fn(
              x375 : @list.List[@kernel.HolType],
            ) -> ((@list.List[@kernel.HolType]) -> @list.List[@kernel.HolType] raise) raise {
              fn(
                x376 : @list.List[@kernel.HolType],
              ) -> @list.List[@kernel.HolType] raise {
                @lib.subtract(x375, x376)
              }
            })(x377)(newtys)
          })(x378),
        )(x379)
      },
      tyargls,
      @list.List([]),
    )
    let epstms = @lib.map(
      fn(x380 : @kernel.HolType) -> @kernel.Term raise {
        let ty = x380
        @class.mk_select((@kernel.mk_var("v", ty), t_tm))
      },
      alltys,
    )
    let pty = @lib.end_itlist(
      fn(
        x381 : @kernel.HolType,
        x382 : @kernel.HolType,
      ) -> @kernel.HolType raise {
        let ty1 = x381
        let ty2 = x382
        @kernel.mk_type("prod", @list.List([ty1, ty2]))
      },
      alltys,
    ) catch {
      Failure(_) => @kernel.bool_ty
      e => raise e
    }
    let recty = @kernel.mk_type("recspace", @list.List([pty]))
    let constr_1 = @kernel.mk_const("CONSTR", @list.List([(pty, @kernel.aty)]))
    let fcons_1 = @kernel.mk_const("FCONS", @list.List([(recty, @kernel.aty)]))
    let bot = @kernel.mk_const("BOTTOM", @list.List([(pty, @kernel.aty)]))
    let bottail = @kernel.mk_abs(n_tm, bot)
    let mk_constructor : (Int64) -> (((String, @list.List[@kernel.HolType])) -> @kernel.Term raise) raise = fn(
      x383 : Int64,
    ) -> (((String, @list.List[@kernel.HolType])) -> @kernel.Term raise) raise {
      let n_1 = x383
      fn(x384 : (String, @list.List[@kernel.HolType])) -> @kernel.Term raise {
        let (cname, cargs) = x384
        let ttys = @lib.map(
          fn(x385 : @kernel.HolType) -> @kernel.HolType raise {
            let ty_1 = x385
            if @lib.mem(ty_1, newtys) {
              recty
            } else {
              ty_1
            }
          },
          cargs,
        )
        let args = @basics.make_args("a", @list.List([]), ttys)
        let (rargs, iargs) = @lib.partition(
          fn(x386 : @kernel.Term) -> Bool raise {
            let t_1 = x386
            @kernel.type_of(t_1) == recty
          },
          args,
        )
        fn mk_injector(
          x387 : @list.List[@kernel.Term],
          x388 : @list.List[@kernel.HolType],
          x389 : @list.List[@kernel.Term],
        ) -> @list.List[@kernel.Term] raise {
          let epstms_1 = x387
          let alltys_1 = x388
          let iargs_1 = x389
          if alltys_1 == @list.List([]) {
            @list.List([])
          } else {
            let ty_2 = @lib.hd(alltys_1)
            try {
              let (a, iargs_p) = @lib.remove(
                fn(x390 : @kernel.Term) -> Bool raise {
                  let t_2 = x390
                  @kernel.type_of(t_2) == ty_2
                },
                iargs_1,
              )
              let t391 = @lib.tl(alltys_1)
              mk_injector(@lib.tl(epstms_1), t391, iargs_p).prepend(a)
            } catch {
              Failure(_) => {
                let t392 = @lib.tl(alltys_1)
                let t393 = mk_injector(@lib.tl(epstms_1), t392, iargs_1)
                t393.prepend(@lib.hd(epstms_1))
              }
              e => raise e
            }
          }
        }
        let iarg = @lib.end_itlist(
          (x394 : @kernel.Term, x395 : @kernel.Term) => {
            @lib.curry(@pair.mk_pair, x394, x395)
          },
          mk_injector(epstms, alltys, iargs),
        ) catch {
          Failure(_) => beps_tm
          e => raise e
        }
        let rarg = @lib.itlist(
          (x396 : @kernel.Term, x397 : @kernel.Term) => {
            @basics.mk_binop(fcons_1, x396, x397)
          },
          rargs,
          bottail,
        )
        let conty = @lib.itlist(
          @basics.mk_fun_ty,
          @lib.map(
            fn(x398 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x398)
            },
            args,
          ),
          recty,
        )
        let condef = @basics.list_mk_comb(
          constr_1,
          @list.List([sucivate(n_1), iarg, rarg]),
        )
        let t399 = @basics.list_mk_abs(args, condef)
        @basics.mk_eq(@kernel.mk_var(cname, conty), t399)
      }
    }
    fn mk_constructors(
      x400 : Int64,
      x401 : @list.List[(String, @list.List[@kernel.HolType])],
    ) -> @list.List[@kernel.Term] raise {
      let n_2 = x400
      let rights_1 = x401
      if rights_1 == @list.List([]) {
        @list.List([])
      } else {
        let t403 = @lib.tl(rights_1)
        let t404 = mk_constructors(@lib.add63(n_2, 1L), t403)
        let t402 = @lib.hd(rights_1)
        t404.prepend(mk_constructor(n_2)(t402))
      }
    }
    let condefs = mk_constructors(
      0L,
      @lib.itlist(
        fn(
          x407 : @list.List[(String, @list.List[@kernel.HolType])],
          x408 : @list.List[(String, @list.List[@kernel.HolType])],
        ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
          let s409 = (fn(
            x405 : @list.List[(String, @list.List[@kernel.HolType])],
          ) -> ((@list.List[(String, @list.List[@kernel.HolType])]) -> @list.List[
            (String, @list.List[@kernel.HolType]),
          ] raise) raise {
            fn(
              x406 : @list.List[(String, @list.List[@kernel.HolType])],
            ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
              x405.concat(x406)
            }
          })(x407)
          s409(x408)
        },
        rights,
        @list.List([]),
      ),
    )
    let conths = @lib.map(@kernel.assume_rule, condefs)
    let predty = @basics.mk_fun_ty(recty, @kernel.bool_ty)
    let edefs = @lib.itlist(
      fn(
        x410 : (
          @kernel.HolType,
          @list.List[(String, @list.List[@kernel.HolType])],
        ),
        x411 : @list.List[
          (@kernel.HolType, (String, @list.List[@kernel.HolType])),
        ],
      ) -> @list.List[(@kernel.HolType, (String, @list.List[@kernel.HolType]))] raise {
        let (x, l_1) = x410
        let acc = x411
        @lib.map(
          fn(
            x412 : (String, @list.List[@kernel.HolType]),
          ) -> (@kernel.HolType, (String, @list.List[@kernel.HolType])) raise {
            let t_3 = x412
            (x, t_3)
          },
          l_1,
        ).concat(acc)
      },
      def,
      @list.List([]),
    )
    let idefs = @lib.map2(
      fn(
        x413 : (@kernel.HolType, (String, @list.List[@kernel.HolType])),
        x414 : @kernel.Term,
      ) -> ((@kernel.HolType, @list.List[@kernel.HolType]), @kernel.Term) raise {
        let (r_1, (_, atys)) = x413
        let def_1 = x414
        ((r_1, atys), def_1)
      },
      edefs,
      condefs,
    )
    let mk_rule : (
      ((@kernel.HolType, @list.List[@kernel.HolType]), @kernel.Term),
    ) -> @kernel.Term raise = fn(
      x415 : ((@kernel.HolType, @list.List[@kernel.HolType]), @kernel.Term),
    ) -> @kernel.Term raise {
      let ((r_2, a_1), condef_1) = x415
      let (left, right) = @kernel.dest_eq(condef_1)
      let (args_1, bod) = @basics.strip_abs(right)
      let lapp = @basics.list_mk_comb(left, args_1)
      let conds = @lib.itlist2(
        fn(
          x416 : @kernel.Term,
          x417 : @kernel.HolType,
          x418 : @list.List[@kernel.Term],
        ) -> @list.List[@kernel.Term] raise {
          let arg = x416
          let argty = x417
          let sofar = x418
          if @lib.mem(argty, newtys) {
            sofar.prepend(
              @kernel.mk_comb(
                @kernel.mk_var(@kernel.dest_vartype(argty), predty),
                arg,
              ),
            )
          } else {
            sofar
          }
        },
        args_1,
        a_1,
        @list.List([]),
      )
      let conc = @kernel.mk_comb(
        @kernel.mk_var(@kernel.dest_vartype(r_2), predty),
        lapp,
      )
      let rule = if conds == @list.List([]) {
        conc
      } else {
        @bool.mk_imp(@bool.list_mk_conj(conds), conc)
      }
      @bool.list_mk_forall(args_1, rule)
    }
    let rules = @bool.list_mk_conj(@lib.map(mk_rule, idefs))
    let th0 = @ind_defs.derive_nonschematic_inductive_relations(rules)
    let th1 = @ind_defs.prove_monotonicity_hyps(th0)
    let (th2a, th2bc) = @bool.conj_pair(th1)
    let th2b = @bool.conjunct1(th2bc)
    (conths, th2a, th2b)
  }
  let prove_model_inhabitation : (@kernel.Thm) -> @list.List[@kernel.Thm] raise = fn(
    x419 : @kernel.Thm,
  ) -> @list.List[@kernel.Thm] raise {
    let rth = x419
    let srules = @lib.map(@bool.spec_all, @bool.conjuncts_rule(rth))
    let (imps, bases) = @lib.partition(
      fn(x422 : @kernel.Thm) -> Bool raise {
        (fn(x420 : @kernel.Term) -> Bool raise { @basics.is_imp(x420) })(
          (fn(x421 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x421) })(
            x422,
          ),
        )
      },
      srules,
    )
    let t426 = @lib.map(
      fn(x425 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.rand(
          (fn(x424 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x424) })(
            x425,
          ),
        )
      },
      imps,
    )
    let concs = @lib.map(
      fn(x423 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x423) },
      bases,
    ).concat(t426)
    let preds = @lib.setify(
      @lib.map((x427 : @kernel.Term) => @lib.repeat(@kernel.rator, x427), concs),
    )
    fn exhaust_inhabitations(
      x428 : @list.List[@kernel.Thm],
      x429 : @list.List[@kernel.Thm],
    ) -> @list.List[@kernel.Thm] raise {
      let ths = x428
      let sofar_1 = x429
      let dunnit = @lib.setify(
        @lib.map(
          fn(x434 : @kernel.Thm) -> @kernel.Term raise {
            (fn(x432 : @kernel.Term) -> @kernel.Term raise {
              (fn(
                x430 : (@kernel.Term, @list.List[@kernel.Term]),
              ) -> @kernel.Term raise {
                x430.0
              })(
                (fn(
                  x431 : @kernel.Term,
                ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                  @basics.strip_comb(x431)
                })(x432),
              )
            })(
              (fn(x433 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x433)
              })(x434),
            )
          },
          sofar_1,
        ),
      )
      let useful = @lib.filter(
        fn(x435 : @kernel.Thm) -> Bool raise {
          let th_1 = x435
          !@lib.mem(
            @basics.strip_comb(@kernel.rand(@kernel.concl(th_1))).0,
            dunnit,
          )
        },
        ths,
      )
      if useful == @list.List([]) {
        sofar_1
      } else {
        let follow_horn : (@kernel.Thm) -> @kernel.Thm raise = fn(
          x436 : @kernel.Thm,
        ) -> @kernel.Thm raise {
          let thm = x436
          let preds_1 = @lib.map(
            fn(x439 : @kernel.Term) -> @kernel.Term raise {
              (fn(
                x437 : (@kernel.Term, @list.List[@kernel.Term]),
              ) -> @kernel.Term raise {
                x437.0
              })(
                (fn(
                  x438 : @kernel.Term,
                ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                  @basics.strip_comb(x438)
                })(x439),
              )
            },
            @basics.conjuncts(@equal.lhand(@kernel.concl(thm))),
          )
          let asms = @lib.map(
            fn(x440 : @kernel.Term) -> @kernel.Thm raise {
              let p = x440
              @lib.find(
                fn(x441 : @kernel.Thm) -> Bool raise {
                  let th_2 = x441
                  @basics.strip_comb(@kernel.concl(th_2)).0 == p
                },
                sofar_1,
              )
            },
            preds_1,
          )
          let t442 = @lib.end_itlist(@bool.conj, asms)
          @drule.match_mp(thm)(t442)
        }
        let newth = @lib.tryfind(follow_horn, useful)
        exhaust_inhabitations(ths, sofar_1.prepend(newth))
      }
    }
    let ithms = exhaust_inhabitations(imps, bases)
    let exths = @lib.map(
      fn(x443 : @kernel.Term) -> @kernel.Thm raise {
        let p_1 = x443
        @lib.find(
          fn(x444 : @kernel.Thm) -> Bool raise {
            let th_3 = x444
            @basics.strip_comb(@kernel.concl(th_3)).0 == p_1
          },
          ithms,
        )
      },
      preds,
    )
    exths
  }
  let define_inductive_type : (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> (
    @kernel.Thm,
    @kernel.Thm,
  ) raise) raise = fn(
    x445 : @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise {
    let cdefs = x445
    fn(x446 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
      let exth = x446
      let extm = @kernel.concl(exth)
      let epred = @basics.strip_comb(extm).0
      let ename = @kernel.dest_var(epred).0
      let th1_1 = @kernel.assume_rule(
        @lib.find(
          fn(x447 : @kernel.Term) -> Bool raise {
            let eq_1 = x447
            @equal.lhand(eq_1) == epred
          },
          @kernel.hyp(exth),
        ),
      )
      let t448 = @kernel.rand(@kernel.concl(th1_1))
      let th2 = @kernel.trans(th1_1, @equal.subs_conv(cdefs)(t448))
      let th3 = @kernel.eq_mp(@equal.ap_thm(th2, @kernel.rand(extm)), exth)
      let (th4, _) = @lib.itlist(
        fn(
          x449 : @kernel.Term,
          x450 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
        ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
          let s451 = scrub_equation(x449)
          s451(x450)
        },
        @kernel.hyp(th3),
        (th3, @list.List([])),
      )
      let mkname = "_mk_" + ename
      let destname = "_dest_" + ename
      let (bij1, bij2) = @kernel.new_basic_type_definition(
        ename, mkname, destname, th4,
      )
      let bij2a = @equal.ap_thm(
        th2,
        @kernel.rand(@kernel.rand(@kernel.concl(bij2))),
      )
      let bij2b = @kernel.trans(bij2a, bij2)
      (bij1, bij2b)
    }
  }
  let define_inductive_type_constructor : (@list.List[@kernel.Thm]) -> ((
    @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x452 : @list.List[@kernel.Thm],
  ) -> ((@list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))]) -> ((
    @kernel.Thm,
  ) -> @kernel.Thm raise) raise) raise {
    let defs = x452
    fn(
      x453 : @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let consindex = x453
      fn(x454 : @kernel.Thm) -> @kernel.Thm raise {
        let th_4 = x454
        let (avs, bod_1) = @basics.strip_forall(@kernel.concl(th_4))
        let (asms_1, conc_1) = if @basics.is_imp(bod_1) {
          let t455 = @kernel.rand(bod_1)
          (@basics.conjuncts(@equal.lhand(bod_1)), t455)
        } else {
          (@list.List([]), bod_1)
        }
        let asmlist = @lib.map(@kernel.dest_comb, asms_1)
        let (cpred, cterm) = @kernel.dest_comb(conc_1)
        let (oldcon, oldargs) = @basics.strip_comb(cterm)
        let modify_arg : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(
          x456 : @kernel.Term,
        ) -> (@kernel.Term, @kernel.Term) raise {
          let v = x456
          try {
            let dest = @lib.assoc(@lib.rev_assoc(v, asmlist), consindex).1
            let ty_p = @lib.hd(@kernel.dest_type(@kernel.type_of(dest)).1)
            let v_p = @kernel.mk_var(@kernel.dest_var(v).0, ty_p)
            (@kernel.mk_comb(dest, v_p), v_p)
          } catch {
            Failure(_) => (v, v)
            e => raise e
          }
        }
        let (newrights, newargs) = @lib.unzip(@lib.map(modify_arg, oldargs))
        let retmk = @lib.assoc(cpred, consindex).0
        let defbod = @kernel.mk_comb(
          retmk,
          @basics.list_mk_comb(oldcon, newrights),
        )
        let defrt = @basics.list_mk_abs(newargs, defbod)
        let expth = @lib.find(
          fn(x457 : @kernel.Thm) -> Bool raise {
            let th_5 = x457
            @equal.lhand(@kernel.concl(th_5)) == oldcon
          },
          defs,
        )
        let rexpth = @equal.subs_conv(@list.List([expth]))(defrt)
        let t458 = @kernel.type_of(defrt)
        let deflf = @kernel.mk_var(@kernel.dest_var(oldcon).0, t458)
        let defth = @pair.new_definition(
          @basics.mk_eq(deflf, @kernel.rand(@kernel.concl(rexpth))),
        )
        @kernel.trans(defth, @equal.sym(rexpth))
      }
    }
  }
  let instantiate_induction_theorem : (
    @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x459 : @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let consindex_1 = x459
    fn(x460 : @kernel.Thm) -> @kernel.Thm raise {
      let ith = x460
      let (avs_1, bod_2) = @basics.strip_forall(@kernel.concl(ith))
      let corlist = @lib.map(
        fn(x467 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
          (fn(x466 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            (fn(x465 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
              (fn(
                x463 : (@kernel.Term, @kernel.Term),
              ) -> (@kernel.Term, @kernel.Term) raise {
                let t464 = ((x462 : @kernel.Term) => {
                  @lib.repeat(@kernel.rator, x462)
                })(x463.1)
                (
                  ((x461 : @kernel.Term) => @lib.repeat(@kernel.rator, x461))(
                    x463.0,
                  ),
                  t464,
                )
              })(@basics.dest_imp(x465))
            })(@basics.body(x466))
          })(@kernel.rand(x467))
        },
        @basics.conjuncts(@kernel.rand(bod_2)),
      )
      let consindex_p = @lib.map(
        fn(
          x468 : @kernel.Term,
        ) -> (@kernel.Term, (@kernel.Term, @kernel.Term)) raise {
          let v_1 = x468
          let w = @lib.rev_assoc(v_1, corlist)
          (w, @lib.assoc(w, consindex_1))
        },
        avs_1,
      )
      let recty_1 = (fn(
        x477 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
      ) -> @kernel.HolType raise {
        (fn(x475 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
          (fn(x473 : @kernel.Term) -> @kernel.HolType raise {
            (fn(x471 : @kernel.HolType) -> @kernel.HolType raise {
              (fn(
                x470 : (String, @list.List[@kernel.HolType]),
              ) -> @kernel.HolType raise {
                @lib.hd(
                  (fn(
                    x469 : (String, @list.List[@kernel.HolType]),
                  ) -> @list.List[@kernel.HolType] raise {
                    x469.1
                  })(x470),
                )
              })(@kernel.dest_type(x471))
            })(
              (fn(x472 : @kernel.Term) -> @kernel.HolType raise {
                @kernel.type_of(x472)
              })(x473),
            )
          })(
            (fn(x474 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              x474.0
            })(x475),
          )
        })(
          (fn(
            x476 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
          ) -> (@kernel.Term, @kernel.Term) raise {
            x476.1
          })(x477),
        )
      })(@lib.hd(consindex_1))
      let newtys_1 = @lib.map(
        fn(
          x486 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
        ) -> @kernel.HolType raise {
          (fn(x484 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
            (fn(x482 : @kernel.Term) -> @kernel.HolType raise {
              (fn(x480 : @kernel.HolType) -> @kernel.HolType raise {
                (fn(
                  x479 : (String, @list.List[@kernel.HolType]),
                ) -> @kernel.HolType raise {
                  @lib.hd(
                    (fn(
                      x478 : (String, @list.List[@kernel.HolType]),
                    ) -> @list.List[@kernel.HolType] raise {
                      x478.1
                    })(x479),
                  )
                })(@kernel.dest_type(x480))
              })(
                (fn(x481 : @kernel.Term) -> @kernel.HolType raise {
                  @kernel.type_of(x481)
                })(x482),
              )
            })(
              (fn(x483 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                x483.1
              })(x484),
            )
          })(
            (fn(
              x485 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
            ) -> (@kernel.Term, @kernel.Term) raise {
              x485.1
            })(x486),
          )
        },
        consindex_p,
      )
      let ptypes = @lib.map(
        fn(x489 : @kernel.HolType) -> @kernel.HolType raise {
          (fn(
            x487 : @kernel.HolType,
          ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
            fn(x488 : @kernel.HolType) -> @kernel.HolType raise {
              @basics.mk_fun_ty(x487, x488)
            }
          })(x489)(@kernel.bool_ty)
        },
        newtys_1,
      )
      let preds_2 = @basics.make_args("P", @list.List([]), ptypes)
      let args_2 = @basics.make_args(
        "x",
        @list.List([]),
        @lib.map(
          fn(x490 : @kernel.Term) -> @kernel.HolType raise { recty_1 },
          preds_2,
        ),
      )
      let lambs = @lib.map2(
        fn(
          x491 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
          x492 : (@kernel.Term, @kernel.Term),
        ) -> @kernel.Term raise {
          let (r_3, (m, d)) = x491
          let (p_2, a_2) = x492
          let t493 = @kernel.mk_comb(p_2, @kernel.mk_comb(m, a_2))
          @kernel.mk_abs(a_2, @bool.mk_conj(@kernel.mk_comb(r_3, a_2), t493))
        },
        consindex_p,
        @lib.zip(preds_2, args_2),
      )
      @bool.specl(lambs, ith)
    }
  }
  let create_recursive_functions : (@list.List[(@kernel.Thm, @kernel.Thm)]) -> ((
    @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise = fn(
    x573 : @list.List[(@kernel.Thm, @kernel.Thm)],
  ) -> ((@list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))]) -> ((
    @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    let tybijpairs_3 = x573
    fn(
      x574 : @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
    ) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      let consindex_4 = x574
      fn(
        x575 : @list.List[@kernel.Thm],
      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let conthms_2 = x575
        fn(x576 : @kernel.Thm) -> @kernel.Thm raise {
          let rth_2 = x576
          let domtys = @lib.map(
            fn(
              x585 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
            ) -> @kernel.HolType raise {
              (fn(
                x583 : (@kernel.Term, @kernel.Term),
              ) -> @kernel.HolType raise {
                (fn(x581 : @kernel.Term) -> @kernel.HolType raise {
                  (fn(x579 : @kernel.HolType) -> @kernel.HolType raise {
                    (fn(
                      x578 : (String, @list.List[@kernel.HolType]),
                    ) -> @kernel.HolType raise {
                      @lib.hd(
                        (fn(
                          x577 : (String, @list.List[@kernel.HolType]),
                        ) -> @list.List[@kernel.HolType] raise {
                          x577.1
                        })(x578),
                      )
                    })(@kernel.dest_type(x579))
                  })(
                    (fn(x580 : @kernel.Term) -> @kernel.HolType raise {
                      @kernel.type_of(x580)
                    })(x581),
                  )
                })(
                  (fn(
                    x582 : (@kernel.Term, @kernel.Term),
                  ) -> @kernel.Term raise {
                    x582.1
                  })(x583),
                )
              })(
                (fn(
                  x584 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
                ) -> (@kernel.Term, @kernel.Term) raise {
                  x584.1
                })(x585),
              )
            },
            consindex_4,
          )
          let recty_2 = (fn(
            x594 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
          ) -> @kernel.HolType raise {
            (fn(x592 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
              (fn(x590 : @kernel.Term) -> @kernel.HolType raise {
                (fn(x588 : @kernel.HolType) -> @kernel.HolType raise {
                  (fn(
                    x587 : (String, @list.List[@kernel.HolType]),
                  ) -> @kernel.HolType raise {
                    @lib.hd(
                      (fn(
                        x586 : (String, @list.List[@kernel.HolType]),
                      ) -> @list.List[@kernel.HolType] raise {
                        x586.1
                      })(x587),
                    )
                  })(@kernel.dest_type(x588))
                })(
                  (fn(x589 : @kernel.Term) -> @kernel.HolType raise {
                    @kernel.type_of(x589)
                  })(x590),
                )
              })(
                (fn(x591 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  x591.0
                })(x592),
              )
            })(
              (fn(
                x593 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
              ) -> (@kernel.Term, @kernel.Term) raise {
                x593.1
              })(x594),
            )
          })(@lib.hd(consindex_4))
          let ranty = @kernel.mk_vartype("Z")
          let fn_ = @kernel.mk_var("fn_", @basics.mk_fun_ty(recty_2, ranty))
          // one type: make_args makes the name itself, the variable fn_;
          // more: fn0, fn1, ...
          let fns = @basics.make_args(
            if domtys.length() == 1 { "fn_" } else { "fn" },
            @list.List([]),
            @lib.map(
              fn(x597 : @kernel.HolType) -> @kernel.HolType raise {
                (fn(
                  x595 : @kernel.HolType,
                ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
                  fn(x596 : @kernel.HolType) -> @kernel.HolType raise {
                    @basics.mk_fun_ty(x595, x596)
                  }
                })(x597)(ranty)
              },
              domtys,
            ),
          )
          let args_3 = @basics.make_args("a", @list.List([]), domtys)
          let rights_2 = @lib.map2(
            fn(
              x598 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
              x599 : @kernel.Term,
            ) -> @kernel.Term raise {
              let (_, (_, d_1)) = x598
              let a_3 = x599
              @kernel.mk_abs(
                a_3,
                @kernel.mk_comb(fn_, @kernel.mk_comb(d_1, a_3)),
              )
            },
            consindex_4,
            args_3,
          )
          let eqs = @lib.map2(
            (x601 : @kernel.Term, x602 : @kernel.Term) => {
              @lib.curry(
                fn(x600 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  @basics.mk_eq(x600.0, x600.1)
                },
                x601,
                x602,
              )
            },
            fns,
            rights_2,
          )
          let fdefs = @lib.map(@kernel.assume_rule, eqs)
          let fxths1 = @lib.map(
            fn(x603 : @kernel.Thm) -> @kernel.Thm raise {
              let th1_5 = x603
              @lib.tryfind(
                fn(x604 : @kernel.Thm) -> @kernel.Thm raise {
                  let th2_5 = x604
                  @kernel.mk_comb_rule(th2_5, th1_5)
                },
                fdefs,
              )
            },
            conthms_2,
          )
          let fxths2 = @lib.map(
            fn(x605 : @kernel.Thm) -> @kernel.Thm raise {
              let th_7 = x605
              @kernel.trans(
                th_7,
                @equal.beta_conv(@kernel.rand(@kernel.concl(th_7))),
              )
            },
            fxths1,
          )
          let mk_tybijcons : ((@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise = fn(
            x606 : (@kernel.Thm, @kernel.Thm),
          ) -> @kernel.Thm raise {
            let (th1_6, th2_6) = x606
            let t607 = @kernel.rand(@equal.lhand(@kernel.concl(th2_6)))
            let th3_5 = @kernel.inst_rule(
              @list.List([
                (@kernel.rand(@equal.lhand(@kernel.concl(th1_6))), t607),
              ]),
              th2_6,
            )
            let th4_2 = @equal.ap_term(
              @kernel.rator(@equal.lhand(@kernel.rand(@kernel.concl(th2_6)))),
              th1_6,
            )
            @kernel.eq_mp(@equal.sym(th3_5), th4_2)
          }
          let sconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
            fn(
              x608 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x608
            },
            @lib.map(mk_tybijcons, tybijpairs_3),
          )
          let erule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
            fn(
              x609 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x609
            },
            @lib.map(
              fn(x610 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                x610.1
              },
              tybijpairs_3,
            ),
          )
          let simplify_fxthm : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
            x611 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            let rthm_1 = x611
            fn(x612 : @kernel.Thm) -> @kernel.Thm raise {
              let fxth = x612
              let pat = @lib.funpow(4, @kernel.rand, @kernel.concl(fxth))
              if @basics.is_imp(
                  @lib.repeat(
                    fn(x614 : @kernel.Term) -> @kernel.Term raise {
                      (fn(
                        x613 : (@kernel.Term, @kernel.Term),
                      ) -> @kernel.Term raise {
                        x613.1
                      })(@basics.dest_forall(x614))
                    },
                    @kernel.concl(rthm_1),
                  ),
                ) {
                let th1_7 = @drule.part_match(
                  fn(x615 : @kernel.Term) -> @kernel.Term raise {
                    @kernel.rand(@kernel.rand(x615))
                  },
                  rthm_1,
                )(pat)
                let tms1 = @basics.conjuncts(@equal.lhand(@kernel.concl(th1_7)))
                let ths2 = @lib.map(
                  fn(x616 : @kernel.Term) -> @kernel.Thm raise {
                    let t_4 = x616
                    @kernel.eq_mp(@equal.sym(sconv(t_4)), @bool.truth())
                  },
                  tms1,
                )
                erule(@bool.mp(th1_7, @lib.end_itlist(@bool.conj, ths2)))
              } else {
                erule(@drule.part_match(@kernel.rand, rthm_1)(pat))
              }
            }
          }
          let fxths3 = @lib.map2(
            fn(x617 : @kernel.Thm, x618 : @kernel.Thm) -> @kernel.Thm raise {
              let s619 = simplify_fxthm(x617)
              s619(x618)
            },
            @bool.conjuncts_rule(rth_2),
            fxths2,
          )
          let fxths4 = @lib.map2(
            fn(x620 : @kernel.Thm, x621 : @kernel.Thm) -> @kernel.Thm raise {
              let th1_8 = x620
              (fn(x624 : @kernel.Thm) -> @kernel.Thm raise {
                ((x622 : @kernel.Thm) => @kernel.trans(th1_8, x622))(
                  ((x623 : @kernel.Thm) => @equal.ap_term(fn_, x623))(x624),
                )
              })(x621)
            },
            fxths2,
            fxths3,
          )
          let cleanup_fxthm : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
            x625 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            let cth = x625
            fn(x626 : @kernel.Thm) -> @kernel.Thm raise {
              let fxth_1 = x626
              let tms = @basics.strip_comb(
                  @kernel.rand(@kernel.rand(@kernel.concl(fxth_1))),
                ).1
              let t627 = @kernel.assume_rule(@lib.hd(@kernel.hyp(cth)))
              let kth = @ind_defs.right_betas(tms)(t627)
              @kernel.trans(fxth_1, @equal.ap_term(fn_, kth))
            }
          }
          let fxth5 = @lib.end_itlist(
            @bool.conj,
            @lib.map2(
              fn(x628 : @kernel.Thm, x629 : @kernel.Thm) -> @kernel.Thm raise {
                let s630 = cleanup_fxthm(x628)
                s630(x629)
              },
              conthms_2,
              fxths4,
            ),
          )
          let t637 = @kernel.hyp(fxth5)
          let t634 = @lib.map(
            fn(
              x633 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
            ) -> @kernel.Term raise {
              x633.0
            },
            consindex_4,
          )
          let pasms_1 = @lib.filter(
            fn(x636 : @kernel.Term) -> Bool raise {
              (fn(x635 : @kernel.Term) -> Bool raise {
                (fn(
                  x631 : @kernel.Term,
                ) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
                  fn(x632 : @list.List[@kernel.Term]) -> Bool raise {
                    @lib.mem(x631, x632)
                  }
                })(x635)(t634)
              })(@equal.lhand(x636))
            },
            t637,
          )
          let fxth6 = @lib.itlist(@bool.disch, pasms_1, fxth5)
          let (fxth7, _) = @lib.itlist(
            fn(
              x638 : @kernel.Term,
              x639 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
            ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
              let s640 = scrub_equation(x638)
              s640(x639)
            },
            @lib.itlist(
              fn(
                x644 : @kernel.Thm,
                x645 : @list.List[@kernel.Term],
              ) -> @list.List[@kernel.Term] raise {
                (fn(
                  x641 : @list.List[@kernel.Term],
                ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
                  fn(
                    x642 : @list.List[@kernel.Term],
                  ) -> @list.List[@kernel.Term] raise {
                    @lib.union(x641, x642)
                  }
                })(
                  (fn(x643 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
                    @kernel.hyp(x643)
                  })(x644),
                )(x645)
              },
              conthms_2,
              @list.List([]),
            ),
            (fxth6, @list.List([])),
          )
          let fxth8 = @bool.undisch_all(fxth7)
          @lib.itlist(
            fn(
              x646 : @kernel.Term,
              x647 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
            ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
              let s648 = scrub_equation(x646)
              s648(x647)
            },
            @lib.subtract(@kernel.hyp(fxth8), eqs),
            (fxth8, @list.List([])),
          ).0
        }
      }
    }
  }
  let s = @term_syntax.parse_term("(s : (Num) -> Z)")
  let zty = @parser.parse_type("Z")
  let numty = @parser.parse_type("num")
  fn extract_arg(
    x649 : @kernel.Term,
    x650 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tup = x649
    let v_3 = x650
    if v_3 == tup {
      @kernel.refl(tup)
    } else {
      let (t1, t2) = @pair.dest_pair(tup)
      let pair_th = @bool.ispecl(
        @list.List([t1, t2]),
        if @basics.free_in(v_3, t1) {
          @pair.fst()
        } else {
          @pair.snd()
        },
      )
      let tup_p = @kernel.rand(@kernel.concl(pair_th))
      if tup_p == v_3 {
        pair_th
      } else {
        let th_8 = extract_arg(@kernel.rand(@kernel.concl(pair_th)), v_3)
        @equal.subs(@list.List([@equal.sym(pair_th)]), th_8)
      }
    }
  }
  let create_recursion_iso_constructor : (
    @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@kernel.Thm) -> @kernel.Term raise) raise = fn(
    x651 : @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@kernel.Thm) -> @kernel.Term raise) raise {
    let consindex_5 = x651
    let recty_3 = @lib.hd(
      @kernel.dest_type(@kernel.type_of(@lib.hd(consindex_5).0)).1,
    )
    let domty = @lib.hd(@kernel.dest_type(recty_3).1)
    let i = @kernel.mk_var("i", domty)
    let r_4 = @kernel.mk_var("r", @basics.mk_fun_ty(numty, recty_3))
    let mks = @lib.map(
      fn(
        x655 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
      ) -> @kernel.Term raise {
        (fn(x653 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x653.0
        })(
          (fn(
            x654 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
          ) -> (@kernel.Term, @kernel.Term) raise {
            x654.1
          })(x655),
        )
      },
      consindex_5,
    )
    let mkindex = @lib.map(
      fn(x656 : @kernel.Term) -> (@kernel.HolType, @kernel.Term) raise {
        let t_5 = x656
        (@lib.hd(@lib.tl(@kernel.dest_type(@kernel.type_of(t_5)).1)), t_5)
      },
      mks,
    )
    fn(x657 : @kernel.Thm) -> @kernel.Term raise {
      let cth_1 = x657
      let artms = @basics.strip_comb(
          @kernel.rand(@kernel.rand(@kernel.concl(cth_1))),
        ).1
      let artys = @lib.mapfilter(
        fn(x659 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x658 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x658)
          })(@kernel.rand(x659))
        },
        artms,
      )
      let (args_4, bod_3) = @basics.strip_abs(
        @kernel.rand(@lib.hd(@kernel.hyp(cth_1))),
      )
      let (ccitm, rtm) = @kernel.dest_comb(bod_3)
      let (cctm, itm) = @kernel.dest_comb(ccitm)
      let (rargs_1, iargs_2) = @lib.partition(
        fn(x662 : @kernel.Term) -> Bool raise {
          (fn(x660 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
            fn(x661 : @kernel.Term) -> Bool raise {
              @basics.free_in(x660, x661)
            }
          })(x662)(rtm)
        },
        args_4,
      )
      let xths = @lib.map(
        (x663 : @kernel.Term) => extract_arg(itm, x663),
        iargs_2,
      )
      let cargs_p = @lib.map(
        fn(x667 : @kernel.Thm) -> @kernel.Term raise {
          (fn(x665 : @kernel.Term) -> @kernel.Term raise {
            ((x664 : @kernel.Term) => {
              @basics.subst(@list.List([(i, itm)]), x664)
            })(@equal.lhand(x665))
          })(
            (fn(x666 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x666)
            })(x667),
          )
        },
        xths,
      )
      let indices = @lib.map(
        sucivate,
        @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(rargs_1)), 1L)),
      )
      let rindexed = @lib.map(
        (x669 : @kernel.Term) => {
          @lib.curry(
            fn(x668 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              @kernel.mk_comb(x668.0, x668.1)
            },
            r_4,
            x669,
          )
        },
        indices,
      )
      let rargs_p = @lib.map2(
        fn(x670 : @kernel.HolType, x671 : @kernel.Term) -> @kernel.Term raise {
          let a_4 = x670
          let rx = x671
          @kernel.mk_comb(@lib.assoc(a_4, mkindex), rx)
        },
        artys,
        rindexed,
      )
      let sargs_p = @lib.map(
        (x673 : @kernel.Term) => {
          @lib.curry(
            fn(x672 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              @kernel.mk_comb(x672.0, x672.1)
            },
            s,
            x673,
          )
        },
        indices,
      )
      let allargs = cargs_p.concat(rargs_p.concat(sargs_p))
      let funty = @lib.itlist(
        fn(
          x677 : @kernel.Term,
          x678 : @kernel.HolType,
        ) -> @kernel.HolType raise {
          (fn(
            x674 : @kernel.HolType,
          ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
            fn(x675 : @kernel.HolType) -> @kernel.HolType raise {
              @basics.mk_fun_ty(x674, x675)
            }
          })(
            (fn(x676 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x676)
            })(x677),
          )(x678)
        },
        allargs,
        zty,
      )
      let funname = @kernel.dest_const(
          @lib.repeat(@kernel.rator, @equal.lhand(@kernel.concl(cth_1))),
        ).0 +
        "'"
      let funarg = @kernel.mk_var(funname, funty)
      @basics.list_mk_abs(
        @list.List([i, r_4, s]),
        @basics.list_mk_comb(funarg, allargs),
      )
    }
  }
  let cconv : (@kernel.Term) -> @kernel.Thm raise = @lib.funpow(
    3,
    fn(
      x679 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s680 = @equal.rator_conv(x679)
      fn(x681 : @kernel.Term) -> @kernel.Thm raise { s680(x681) }
    },
    @equal.repeatc(
      @simp.gen_rewrite_conv(
        fn(
          x682 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x682
        },
        @list.List([fcons()]),
      ),
    ),
  )
  let derive_recursion_theorem : (@list.List[(@kernel.Thm, @kernel.Thm)]) -> ((
    @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
  ) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise = fn(
    x683 : @list.List[(@kernel.Thm, @kernel.Thm)],
  ) -> ((@list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))]) -> ((
    @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    let tybijpairs_4 = x683
    fn(
      x684 : @list.List[(@kernel.Term, (@kernel.Term, @kernel.Term))],
    ) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      let consindex_6 = x684
      fn(
        x685 : @list.List[@kernel.Thm],
      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let conthms_3 = x685
        fn(x686 : @kernel.Thm) -> @kernel.Thm raise {
          let rath = x686
          let isocons = @lib.map(
            create_recursion_iso_constructor(consindex_6),
            conthms_3,
          )
          let ty_4 = @kernel.type_of(@lib.hd(isocons))
          let fcons_2 = @kernel.mk_const(
            "FCONS",
            @list.List([(ty_4, @kernel.aty)]),
          )
          let fnil_1 = @kernel.mk_const(
            "FNIL",
            @list.List([(ty_4, @kernel.aty)]),
          )
          let bigfun = @lib.itlist(
            (x687 : @kernel.Term, x688 : @kernel.Term) => {
              @basics.mk_binop(fcons_2, x687, x688)
            },
            isocons,
            fnil_1,
          )
          let eth = @bool.ispec(bigfun, constr_rec())
          let fn__1 = @kernel.rator(
            @kernel.rand(@lib.hd(@basics.conjuncts(@kernel.concl(rath)))),
          )
          let (v_4, bod_4) = @kernel.dest_abs(@kernel.rand(@kernel.concl(eth)))
          let betm = @kernel.vsubst(@list.List([(fn__1, v_4)]), bod_4)
          let lconv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
            @kernel.assume_rule(betm),
          )
          let fnths = @lib.map(
            fn(x689 : @kernel.Term) -> @kernel.Thm raise {
              let t_6 = x689
              let t690 = @kernel.assume_rule(t_6)
              @ind_defs.right_betas(
                @list.List([@basics.bndvar(@kernel.rand(t_6))]),
              )(t690)
            },
            @kernel.hyp(rath),
          )
          let t692 = @lib.map(
            fn(x691 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
              x691.0
            },
            tybijpairs_4,
          ).concat(
            @list.List([@pair.fst(), @pair.snd(), fcons(), @theorems.beta_thm()]),
          )
          let simper : (@kernel.Thm) -> @kernel.Thm raise = @simp.pure_rewrite_rule(
            @lib.map(@equal.sym, fnths).concat(t692),
          )
          let hackdown_rath : (@kernel.Thm) -> @kernel.Thm raise = fn(
            x693 : @kernel.Thm,
          ) -> @kernel.Thm raise {
            let th_9 = x693
            let (ltm, rtm_1) = @kernel.dest_eq(@kernel.concl(th_9))
            let wargs = @basics.strip_comb(@kernel.rand(ltm)).1
            let th1_9 = @kernel.trans(th_9, lconv(rtm_1))
            let th2_7 = @kernel.trans(
              th1_9,
              cconv(@kernel.rand(@kernel.concl(th1_9))),
            )
            let t697 = @kernel.rand(@kernel.concl(th2_7))
            let th3_6 = @kernel.trans(
              th2_7,
              @lib.funpow(
                2,
                fn(
                  x694 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s695 = @equal.rator_conv(x694)
                  fn(x696 : @kernel.Term) -> @kernel.Thm raise { s695(x696) }
                },
                @equal.beta_conv,
              )(t697),
            )
            let t698 = @kernel.rand(@kernel.concl(th3_6))
            let th4_3 = @kernel.trans(
              th3_6,
              @equal.rator_conv(@equal.beta_conv)(t698),
            )
            let th5_1 = @kernel.trans(
              th4_3,
              @equal.beta_conv(@kernel.rand(@kernel.concl(th4_3))),
            )
            @bool.genl(wargs, simper(th5_1))
          }
          let rthm_2 = @lib.end_itlist(
            @bool.conj,
            @lib.map(hackdown_rath, @bool.conjuncts_rule(rath)),
          )
          let unseqs = @lib.filter(
            fn(x699 : @kernel.Term) -> Bool raise { @basics.is_eq(x699) },
            @kernel.hyp(rthm_2),
          )
          let tys = @lib.map(
            fn(
              x708 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
            ) -> @kernel.HolType raise {
              (fn(
                x706 : (@kernel.Term, @kernel.Term),
              ) -> @kernel.HolType raise {
                (fn(x704 : @kernel.Term) -> @kernel.HolType raise {
                  (fn(x702 : @kernel.HolType) -> @kernel.HolType raise {
                    (fn(
                      x701 : (String, @list.List[@kernel.HolType]),
                    ) -> @kernel.HolType raise {
                      @lib.hd(
                        (fn(
                          x700 : (String, @list.List[@kernel.HolType]),
                        ) -> @list.List[@kernel.HolType] raise {
                          x700.1
                        })(x701),
                      )
                    })(@kernel.dest_type(x702))
                  })(
                    (fn(x703 : @kernel.Term) -> @kernel.HolType raise {
                      @kernel.type_of(x703)
                    })(x704),
                  )
                })(
                  (fn(
                    x705 : (@kernel.Term, @kernel.Term),
                  ) -> @kernel.Term raise {
                    x705.1
                  })(x706),
                )
              })(
                (fn(
                  x707 : (@kernel.Term, (@kernel.Term, @kernel.Term)),
                ) -> (@kernel.Term, @kernel.Term) raise {
                  x707.1
                })(x708),
              )
            },
            consindex_6,
          )
          let seqs = @lib.map(
            fn(x709 : @kernel.HolType) -> @kernel.Term raise {
              let ty_5 = x709
              @lib.find(
                fn(x710 : @kernel.Term) -> Bool raise {
                  let t_7 = x710
                  @lib.hd(
                    @kernel.dest_type(@kernel.type_of(@equal.lhand(t_7))).1,
                  ) ==
                  ty_5
                },
                unseqs,
              )
            },
            tys,
          )
          let rethm = @lib.itlist(
            fn(x711 : @kernel.Term, x712 : @kernel.Thm) -> @kernel.Thm raise {
              let s713 = @ind_defs.exists_equation(x711)
              s713(x712)
            },
            seqs,
            rthm_2,
          )
          let fethm = @bool.choose_rule(fn__1, eth, rethm)
          let pcons = @lib.map(
            fn(x719 : @kernel.Term) -> @kernel.Term raise {
              (fn(x715 : @kernel.Term) -> @kernel.Term raise {
                ((x714 : @kernel.Term) => @lib.repeat(@kernel.rator, x714))(
                  @kernel.rand(x715),
                )
              })(
                ((x718 : @kernel.Term) => {
                  @lib.repeat(
                    fn(x717 : @kernel.Term) -> @kernel.Term raise {
                      (fn(
                        x716 : (@kernel.Term, @kernel.Term),
                      ) -> @kernel.Term raise {
                        x716.1
                      })(@basics.dest_forall(x717))
                    },
                    x718,
                  )
                })(x719),
              )
            },
            @basics.conjuncts(@kernel.concl(rthm_2)),
          )
          @bool.genl(pcons, fethm)
        }
      }
    }
  }
  define_type_raw_v1_c.set(fn(
    x720 : @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise {
    let def_2 = x720
    let (defs_1, rth_3, ith_1) = justify_inductive_type_model(def_2)
    let neths = prove_model_inhabitation(rth_3)
    let tybijpairs_5 = @lib.map(define_inductive_type(defs_1), neths)
    let preds_4 = @lib.map(
      fn(x723 : @kernel.Thm) -> @kernel.Term raise {
        ((x721 : @kernel.Term) => @lib.repeat(@kernel.rator, x721))(
          (fn(x722 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x722) })(
            x723,
          ),
        )
      },
      neths,
    )
    let mkdests = @lib.map(
      fn(
        x724 : (@kernel.Thm, @kernel.Thm),
      ) -> (@kernel.Term, @kernel.Term) raise {
        let (th_10, _) = x724
        let tm_2 = @equal.lhand(@kernel.concl(th_10))
        let t725 = @kernel.rator(@kernel.rand(tm_2))
        (@kernel.rator(tm_2), t725)
      },
      tybijpairs_5,
    )
    let consindex_7 = @lib.zip(preds_4, mkdests)
    let t726 = @bool.conjuncts_rule(rth_3)
    let condefs_1 = @lib.map(
      define_inductive_type_constructor(defs_1)(consindex_7),
      t726,
    )
    let conthms_4 = @lib.map(
      fn(x727 : @kernel.Thm) -> @kernel.Thm raise {
        let th_11 = x727
        let args_5 = @basics.strip_abs(@kernel.rand(@kernel.concl(th_11))).0
        @ind_defs.right_betas(args_5)(th_11)
      },
      condefs_1,
    )
    let iith_1 = instantiate_induction_theorem(consindex_7)(ith_1)
    let fth = ((x544, x545, x546, x547, x548) => {
      derive_induction_theorem_l(scrub_equation, x544, x545, x546, x547, x548)
    })(consindex_7, tybijpairs_5, conthms_4, iith_1, rth_3)
    let rath_1 = create_recursive_functions(tybijpairs_5)(consindex_7)(
      conthms_4,
    )(rth_3)
    let kth_1 = derive_recursion_theorem(tybijpairs_5)(consindex_7)(conthms_4)(
      rath_1,
    )
    (fth, kth_1)
  })
}

///|
let define_type_raw_v1_c : @lib.Cell[
  (
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise,
] = @lib.Cell::new("define_type_raw")

///|
/// `define_type_raw`
pub fn define_type_raw_v1(
  x : @list.List[
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
  ],
) -> (@kernel.Thm, @kernel.Thm) raise {
  define_type_raw_v1_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] munion_l(
  x363 : @list.List[TA],
  x364 : @list.List[TA],
) -> @list.List[TA] raise {
  let s1 = x363
  let s2 = x364
  if s1 == @list.List([]) {
    s2
  } else {
    let h1 = @lib.hd(s1)
    let s1_p = @lib.tl(s1)
    try {
      let (_, s2_p) = @lib.remove(
        fn(x365 : TA) -> Bool raise {
          let h2 = x365
          h2 == h1
        },
        s2,
      )
      munion_l(s1_p, s2_p).prepend(h1)
    } catch {
      Failure(_) => munion_l(s1_p, s2).prepend(h1)
      e => raise e
    }
  }
}

///|
fn[TB] pullback_induction_clause_l(
  x494 : @list.List[(TB, @kernel.Thm)],
  x495 : @list.List[@kernel.Thm],
) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  let tybijpairs = x494
  let conthms = x495
  let prerule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    (x500 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        3,
        fn(
          x497 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s498 = @equal.rand_conv(x497)
          fn(x499 : @kernel.Term) -> @kernel.Thm raise { s498(x499) }
        },
        x500,
      )
    },
    @lib.map(@equal.sym, conthms),
  )
  let t503 = @simp.gen_rewrite_rule(
    fn(
      x501 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x501
    },
    @lib.map(
      fn(x502 : (TB, @kernel.Thm)) -> @kernel.Thm raise { x502.1 },
      tybijpairs,
    ),
  )
  let iprule : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x504 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    @equal.sym(t503(x504))
  }
  fn(x505 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let rthm = x505
    fn(x506 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x506
      let (avs_2, bimp) = @basics.strip_forall(tm)
      if @basics.is_imp(bimp) {
        let (ant, con) = @basics.dest_imp(bimp)
        let ths_1 = @lib.map(
          (x507 : @kernel.Thm) => @equal.conv_rule(@equal.beta_conv, x507),
          @bool.conjuncts_rule(@kernel.assume_rule(ant)),
        )
        let (tths, pths) = @lib.unzip(@lib.map(@bool.conj_pair, ths_1))
        let t508 = @lib.end_itlist(@bool.conj, tths)
        let tth = @drule.match_mp(@bool.spec_all(rthm))(t508)
        let mths = @lib.map(iprule, tths.prepend(tth))
        let conth1 = @equal.beta_conv(con)
        let contm1 = @kernel.rand(@kernel.concl(conth1))
        let t509 = @kernel.rand(contm1)
        let t510 = @equal.subs_conv(@lib.tl(mths))(t509)
        let conth2 = @kernel.trans(
          conth1,
          @equal.ap_term(@kernel.rator(contm1), t510),
        )
        let conth3 = prerule(conth2)
        let lctms = @lib.map(
          fn(x511 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x511) },
          pths,
        )
        let t512 = @kernel.rand(@kernel.rand(@kernel.concl(conth3)))
        let asmin = @bool.mk_imp(@bool.list_mk_conj(lctms), t512)
        let argsin = @lib.map(
          @kernel.rand,
          @basics.conjuncts(@equal.lhand(asmin)),
        )
        let argsgen = @lib.map(
          fn(x513 : @kernel.Term) -> @kernel.Term raise {
            let tm_1 = x513
            let t514 = @kernel.type_of(tm_1)
            @kernel.mk_var(@kernel.dest_var(@kernel.rand(tm_1)).0, t514)
          },
          argsin,
        )
        let asmgen = @basics.subst(@lib.zip(argsgen, argsin), asmin)
        let asmquant = @bool.list_mk_forall(
          @basics.strip_comb(@kernel.rand(@kernel.rand(asmgen))).1,
          asmgen,
        )
        let t515 = @bool.spec_all(@kernel.assume_rule(asmquant))
        let th1_2 = @kernel.inst_rule(@lib.zip(argsin, argsgen), t515)
        let th2_1 = @bool.mp(th1_2, @lib.end_itlist(@bool.conj, pths))
        let t516 = @bool.conj(tth, th2_1)
        let th3_1 = @kernel.eq_mp(@equal.sym(conth3), t516)
        @bool.disch(asmquant, @bool.genl(avs_2, @bool.disch(ant, th3_1)))
      } else {
        let con_1 = bimp
        let conth2_1 = @equal.beta_conv(con_1)
        let t518 = @equal.lhand(@kernel.rand(@kernel.concl(conth2_1)))
        let tth_1 = @drule.part_match(
          fn(x517 : @kernel.Term) -> @kernel.Term raise { x517 },
          rthm,
        )(t518)
        let conth3_1 = prerule(conth2_1)
        let asmgen_1 = @kernel.rand(@kernel.rand(@kernel.concl(conth3_1)))
        let asmquant_1 = @bool.list_mk_forall(
          @basics.strip_comb(@kernel.rand(asmgen_1)).1,
          asmgen_1,
        )
        let th2_2 = @bool.spec_all(@kernel.assume_rule(asmquant_1))
        let t519 = @bool.conj(tth_1, th2_2)
        let th3_2 = @kernel.eq_mp(@equal.sym(conth3_1), t519)
        @bool.disch(asmquant_1, @bool.genl(avs_2, th3_2))
      }
    }
  }
}

///|
fn[TC] finish_induction_conclusion_l(
  x520 : @list.List[(@kernel.Term, (TC, @kernel.Term))],
  x521 : @list.List[(@kernel.Thm, @kernel.Thm)],
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let consindex_2 = x520
  let tybijpairs_1 = x521
  let (tybij1, tybij2) = @lib.unzip(tybijpairs_1)
  let t537 = @simp.gen_rewrite_rule(
    fn(
      x534 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s535 = @equal.land_conv(x534)
      fn(x536 : @kernel.Term) -> @kernel.Thm raise { s535(x536) }
    },
    tybij2,
  )
  let t538 = @simp.gen_rewrite_rule(
    fn(
      x533 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x529 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x523 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s524 = @equal.land_conv(x523)
          fn(x525 : @kernel.Term) -> @kernel.Thm raise { s524(x525) }
        })(
          (fn(
            x526 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s527 = @equal.land_conv(x526)
            fn(x528 : @kernel.Term) -> @kernel.Thm raise { s527(x528) }
          })(x529),
        )
      })(
        (fn(
          x530 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s531 = @equal.rand_conv(x530)
          fn(x532 : @kernel.Term) -> @kernel.Thm raise { s531(x532) }
        })(x533),
      )
    },
    tybij1,
  )
  let prerule_1 : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x539 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    t538(t537(x539))
  }
  let finrule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x540 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s541 = @equal.rand_conv(x540)
      fn(x542 : @kernel.Term) -> @kernel.Thm raise { s541(x542) }
    },
    tybij1,
  )
  fn(x543 : @kernel.Thm) -> @kernel.Thm raise {
    let th_6 = x543
    let (av, bimp_1) = @basics.dest_forall(@kernel.concl(th_6))
    let pv = @equal.lhand(@basics.body(@kernel.rator(@kernel.rand(bimp_1))))
    let (p_3, v_2) = @kernel.dest_comb(pv)
    let (mk, dest_1) = @lib.assoc(p_3, consindex_2)
    let ty_3 = @lib.hd(@kernel.dest_type(@kernel.type_of(dest_1)).1)
    let v_p_1 = @kernel.mk_var(@kernel.dest_var(v_2).0, ty_3)
    let dv = @kernel.mk_comb(dest_1, v_p_1)
    let th1_3 = prerule_1(@bool.spec(dv, th_6))
    let th2_3 = @bool.mp(
      th1_3,
      @kernel.refl(@kernel.rand(@equal.lhand(@kernel.concl(th1_3)))),
    )
    let th3_3 = @equal.conv_rule(@equal.beta_conv, th2_3)
    @bool.gen(v_p_1, finrule(@bool.conjunct2(th3_3)))
  }
}

///|
fn[TD] derive_induction_theorem_l(
  scrub_equation : (@kernel.Term) -> ((
    (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
  ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise) raise,
  x544 : @list.List[(@kernel.Term, (TD, @kernel.Term))],
  x545 : @list.List[(@kernel.Thm, @kernel.Thm)],
  x546 : @list.List[@kernel.Thm],
  x547 : @kernel.Thm,
  x548 : @kernel.Thm,
) -> @kernel.Thm raise {
  let consindex_3 = x544
  let tybijpairs_2 = x545
  let conthms_1 = x546
  let iith = x547
  let rth_1 = x548
  let t553 = @basics.conjuncts(@equal.lhand(@kernel.concl(iith)))
  let t554 = @bool.conjuncts_rule(rth_1)
  let t549 = pullback_induction_clause_l(tybijpairs_2, conthms_1)
  let bths = @lib.map2(
    fn(x550 : @kernel.Thm, x551 : @kernel.Term) -> @kernel.Thm raise {
      let s552 = t549(x550)
      s552(x551)
    },
    t554,
    t553,
  )
  let asm_ = @bool.list_mk_conj(
    @lib.map(
      fn(x556 : @kernel.Thm) -> @kernel.Term raise {
        @equal.lhand(
          (fn(x555 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x555) })(
            x556,
          ),
        )
      },
      bths,
    ),
  )
  let ths_2 = @lib.map2(
    @bool.mp,
    bths,
    @bool.conjuncts_rule(@kernel.assume_rule(asm_)),
  )
  let th1_4 = @bool.mp(iith, @lib.end_itlist(@bool.conj, ths_2))
  let t557 = @bool.conjuncts_rule(th1_4)
  let th2_4 = @lib.end_itlist(
    @bool.conj,
    @lib.map(finish_induction_conclusion_l(consindex_3, tybijpairs_2), t557),
  )
  let th3_4 = @bool.disch(asm_, th2_4)
  let preds_3 = @lib.map(
    fn(x559 : @kernel.Term) -> @kernel.Term raise {
      (fn(x558 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rator(@basics.body(x558))
      })(@kernel.rand(x559))
    },
    @basics.conjuncts(@kernel.rand(@kernel.concl(th3_4))),
  )
  let th4_1 = @bool.genl(preds_3, th3_4)
  let t566 = @kernel.hyp(th4_1)
  let t563 = @lib.map(
    fn(x562 : (@kernel.Term, (TD, @kernel.Term))) -> @kernel.Term raise {
      x562.0
    },
    consindex_3,
  )
  let pasms = @lib.filter(
    fn(x565 : @kernel.Term) -> Bool raise {
      (fn(x564 : @kernel.Term) -> Bool raise {
        (fn(
          x560 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
          fn(x561 : @list.List[@kernel.Term]) -> Bool raise {
            @lib.mem(x560, x561)
          }
        })(x564)(t563)
      })(@equal.lhand(x565))
    },
    t566,
  )
  let th5 = @lib.itlist(@bool.disch, pasms, th4_1)
  let (th6, _) = @lib.itlist(
    fn(
      x567 : @kernel.Term,
      x568 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
    ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
      let s569 = scrub_equation(x567)
      s569(x568)
    },
    @kernel.hyp(th5),
    (th5, @list.List([])),
  )
  let th7 = @bool.undisch_all(th6)
  @lib.itlist(
    fn(
      x570 : @kernel.Term,
      x571 : (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]),
    ) -> (@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)]) raise {
      let s572 = scrub_equation(x570)
      s572(x571)
    },
    @kernel.hyp(th7),
    (th7, @list.List([])),
  ).0
}

///|
/// parse_inductive_type_specification
fn step_34() -> Unit raise {
  let parse_type_loc : (ArrayView[@lexer.Lexcode]) -> (
    @kernel.HolType,
    ArrayView[@lexer.Lexcode],
  ) raise = fn(
    x728 : ArrayView[@lexer.Lexcode],
  ) -> (@kernel.HolType, ArrayView[@lexer.Lexcode]) raise {
    let src = x728
    let (pty, rst) = @parser.parse_pretype(src)
    (@preterm.type_of_pretype(pty), rst)
  }
  let parse_type_conapp : (ArrayView[@lexer.Lexcode]) -> (
    (String, @list.List[@kernel.HolType]),
    ArrayView[@lexer.Lexcode],
  ) raise = fn(
    x729 : ArrayView[@lexer.Lexcode],
  ) -> ((String, @list.List[@kernel.HolType]), ArrayView[@lexer.Lexcode]) raise {
    let src_1 = x729
    let (cn_1, sps_1) = match src_1 {
      [@lexer.Lexcode::Ident(cn), ..sps] => (cn, sps)
      _ => @lib.failure()
    }
    let (tys, rst_1) = @parserutil.many(parse_type_loc)(sps_1)
    ((cn_1, tys), rst_1)
  }
  let parse_type_clause : (ArrayView[@lexer.Lexcode]) -> (
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ArrayView[@lexer.Lexcode],
  ) raise = fn(
    x730 : ArrayView[@lexer.Lexcode],
  ) -> (
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ArrayView[@lexer.Lexcode],
  ) raise {
    let src_2 = x730
    let (tn_1, sps_3) = match src_2 {
      [@lexer.Lexcode::Ident(tn), ..sps_2] => (tn, sps_2)
      _ => @lib.failure()
    }
    let t731 = @parserutil.listof(
      parse_type_conapp,
      @parserutil.a(@lexer.Lexcode::Resword("|")),
      "type definition clauses",
    )
    let (tys_1, rst_2) = @parserutil.map(
      @parserutil.seq(@parserutil.a(@lexer.Lexcode::Ident("=")), t731),
      fn(
        x732 : (
          @lexer.Lexcode,
          @list.List[(String, @list.List[@kernel.HolType])],
        ),
      ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
        x732.1
      },
    )(sps_3)
    ((@kernel.mk_vartype(tn_1), tys_1), rst_2)
  }
  let parse_type_definition : (ArrayView[@lexer.Lexcode]) -> (
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
    ArrayView[@lexer.Lexcode],
  ) raise = @parserutil.listof(
    parse_type_clause,
    @parserutil.a(@lexer.Lexcode::Resword(";")),
    "type definition",
  )
  parse_inductive_type_specification_c.set(fn(
    x733 : String,
  ) -> @list.List[
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
  ] raise {
    let s = x733
    let (spec, rst_3) = (fn(
      x734 : String,
    ) -> (
      @list.List[
        (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
      ],
      ArrayView[@lexer.Lexcode],
    ) raise {
      parse_type_definition(@lexer.lex(x734))
    })(s)
    if rst_3.is_empty() {
      spec
    } else {
      raise Failure("parse_inductive_type_specification: junk after def")
    }
  })
}

///|
let parse_inductive_type_specification_c : @lib.Cell[
  (String) -> @list.List[
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
  ] raise,
] = @lib.Cell::new("parse_inductive_type_specification")

///|
/// `parse_inductive_type_specification`
pub fn parse_inductive_type_specification(
  x : String,
) -> @list.List[
  (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
] raise {
  parse_inductive_type_specification_c.get()(x)
}

///|
let sum_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_INDUCT")

///|
/// `sum_INDUCT`
pub fn sum_induct() -> @kernel.Thm {
  sum_induct_c.get()
}

///|
let sum_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_RECURSION")

///|
/// `sum_RECURSION`
pub fn sum_recursion() -> @kernel.Thm {
  sum_recursion_c.get()
}

///|
/// sum_INDUCT, sum_RECURSION
fn step_35() -> Unit raise {
  let (sum_induct, sum_recursion) = define_type_raw_v1(
    parse_inductive_type_specification("sum = INL A | INR B"),
  )
  sum_induct_c.set(sum_induct)
  sum_recursion_c.set(sum_recursion)
}

///|
/// OUTL
fn step_36() -> Unit raise {
  let t736 = @term_syntax.parse_term("(OUTL : (Sum[A, B]) -> A)(INL((x : A))) == x")
  outl_c.set(@recursion.new_recursive_definition(sum_recursion())(t736))
}

///|
let outl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTL")

///|
/// `OUTL`
pub fn outl() -> @kernel.Thm {
  outl_c.get()
}

///|
/// OUTR
fn step_37() -> Unit raise {
  let t737 = @term_syntax.parse_term("(OUTR : (Sum[A, B]) -> B)(INR((y : B))) == y")
  outr_c.set(@recursion.new_recursive_definition(sum_recursion())(t737))
}

///|
let outr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTR")

///|
/// `OUTR`
pub fn outr() -> @kernel.Thm {
  outr_c.get()
}

///|
/// define_type_raw
fn step_38() -> Unit raise {
  let elim_outcombs : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x738 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s739 = @equal.top_depth_conv(x738)
      fn(x740 : @kernel.Term) -> @kernel.Thm raise { s739(x740) }
    },
    @list.List([outl(), outr()]),
  )
  fn mk_sum(x741 : @list.List[@kernel.HolType]) -> @kernel.HolType raise {
    let tys = x741
    let k = Int::to_int64(@lib.length(tys))
    if k == 1L {
      @lib.hd(tys)
    } else {
      let (tys1, tys2) = @lib.chop_list(
        @lib.int63_to_int(@lib.div63(k, 2L)),
        tys,
      )
      let t742 = mk_sum(tys2)
      @kernel.mk_type("sum", @list.List([mk_sum(tys1), t742]))
    }
  }
  fn mk_inls(x743 : @kernel.HolType) -> @list.List[@kernel.Term] raise {
    let ty = x743
    if @kernel.is_vartype(ty) {
      @list.List([@kernel.mk_var("x", ty)])
    } else {
      match @kernel.dest_type(ty) {
        (_, More(ty1, tail=More(ty2, tail=Empty))) => {
          let inls1 = mk_inls(ty1)
          let inls2 = mk_inls(ty2)
          let inl = @kernel.mk_const(
            "INL",
            @list.List([(ty1, @kernel.aty), (ty2, @basics.bty)]),
          )
          let inr = @kernel.mk_const(
            "INR",
            @list.List([(ty1, @kernel.aty), (ty2, @basics.bty)]),
          )
          let t748 = @lib.map(
            (x747 : @kernel.Term) => {
              @lib.curry(
                fn(x746 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  @kernel.mk_comb(x746.0, x746.1)
                },
                inr,
                x747,
              )
            },
            inls2,
          )
          @lib.map(
            (x745 : @kernel.Term) => {
              @lib.curry(
                fn(x744 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  @kernel.mk_comb(x744.0, x744.1)
                },
                inl,
                x745,
              )
            },
            inls1,
          ).concat(t748)
        }
        _ => raise @lib.MatchFailure("tscript.ml:796")
      }
    }
  }
  let mk_inls_1 : (@kernel.HolType) -> @list.List[@kernel.Term] raise = fn(
    x749 : @kernel.HolType,
  ) -> @list.List[@kernel.Term] raise {
    let ty_1 = x749
    let bods = mk_inls(ty_1)
    @lib.map(
      fn(x750 : @kernel.Term) -> @kernel.Term raise {
        let t = x750
        @kernel.mk_abs(
          @basics.find_term(
            fn(x751 : @kernel.Term) -> Bool raise { @kernel.is_var(x751) },
            t,
          ),
          t,
        )
      },
      bods,
    )
  }
  fn mk_inls_2(
    x752 : @kernel.Term,
    x753 : @kernel.HolType,
  ) -> @list.List[@kernel.Term] raise {
    let sof = x752
    let ty_2 = x753
    if @kernel.is_vartype(ty_2) {
      @list.List([sof])
    } else {
      match @kernel.dest_type(ty_2) {
        (_, More(ty1_1, tail=More(ty2_1, tail=Empty))) => {
          let outl_1 = @kernel.mk_const(
            "OUTL",
            @list.List([(ty1_1, @kernel.aty), (ty2_1, @basics.bty)]),
          )
          let outr_1 = @kernel.mk_const(
            "OUTR",
            @list.List([(ty1_1, @kernel.aty), (ty2_1, @basics.bty)]),
          )
          let t754 = mk_inls_2(@kernel.mk_comb(outr_1, sof), ty2_1)
          mk_inls_2(@kernel.mk_comb(outl_1, sof), ty1_1).concat(t754)
        }
        _ => raise @lib.MatchFailure("tscript.ml:807")
      }
    }
  }
  let mk_outls : (@kernel.HolType) -> @list.List[@kernel.Term] raise = fn(
    x755 : @kernel.HolType,
  ) -> @list.List[@kernel.Term] raise {
    let ty_3 = x755
    let x = @kernel.mk_var("x", ty_3)
    @lib.map(
      (x757 : @kernel.Term) => {
        @lib.curry(
          fn(x756 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            @kernel.mk_abs(x756.0, x756.1)
          },
          x,
          x757,
        )
      },
      mk_inls_2(x, ty_3),
    )
  }
  let mk_newfun : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x758 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let fn_ = x758
    fn(x759 : @kernel.Term) -> @kernel.Thm raise {
      let outl_2 = x759
      let (s, ty_4) = @kernel.dest_var(fn_)
      let dty = @lib.hd(@kernel.dest_type(ty_4).1)
      let x_1 = @kernel.mk_var("x", dty)
      let (y, bod) = @kernel.dest_abs(outl_2)
      let r = @kernel.mk_abs(
        x_1,
        @kernel.vsubst(@list.List([(@kernel.mk_comb(fn_, x_1), y)]), bod),
      )
      let l = @kernel.mk_var(s, @kernel.type_of(r))
      let th1 = @kernel.assume_rule(@basics.mk_eq(l, r))
      @ind_defs.right_betas(@list.List([x_1]))(th1)
    }
  }
  let generalize_recursion_theorem : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x760 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th = x760
    let (avs, ebod) = @basics.strip_forall(@kernel.concl(th))
    let (evs, bod_1) = @basics.strip_exists(ebod)
    let n = Int::to_int64(@lib.length(evs))
    if n == 1L {
      th
    } else {
      let tys_1 = @lib.map(
        fn(x761 : Int64) -> @kernel.HolType raise {
          let i = x761
          @kernel.mk_vartype("Z" + Int64::to_string(i))
        },
        @lib.range(0L, @lib.sub63(n, 1L)),
      )
      let sty = mk_sum(tys_1)
      let inls = mk_inls_1(sty)
      let outls = mk_outls(sty)
      let zty = @kernel.type_of(
        @kernel.rand(@basics.strip_forall(@lib.hd(@basics.conjuncts(bod_1))).1),
      )
      let ith = @kernel.inst_type(@list.List([(sty, zty)]), th)
      let (avs_1, ebod_1) = @basics.strip_forall(@kernel.concl(ith))
      let (evs_1, bod_2) = @basics.strip_exists(ebod_1)
      let fns_p = @lib.map2(
        fn(x762 : @kernel.Term, x763 : @kernel.Term) -> @kernel.Thm raise {
          let s764 = mk_newfun(x762)
          s764(x763)
        },
        evs_1,
        outls,
      )
      let fnalist = @lib.zip(
        evs_1,
        @lib.map(
          fn(x767 : @kernel.Thm) -> @kernel.Term raise {
            (fn(x765 : @kernel.Term) -> @kernel.Term raise {
              @kernel.rator(@equal.lhs(x765))
            })(
              (fn(x766 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x766)
              })(x767),
            )
          },
          fns_p,
        ),
      )
      let inlalist = @lib.zip(evs_1, inls)
      let outlalist = @lib.zip(evs_1, outls)
      let hack_clause : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(
        x768 : @kernel.Term,
      ) -> (@kernel.Term, @kernel.Term) raise {
        let tm = x768
        let (avs_2, bod_3) = @basics.strip_forall(tm)
        let (l_1, r_1) = @kernel.dest_eq(bod_3)
        let (fn__1, args) = @basics.strip_comb(r_1)
        let pargs = @lib.map(
          fn(x769 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            let a = x769
            let g = @basics.genvar(@kernel.type_of(a))
            if @kernel.is_var(a) {
              (g, g)
            } else {
              let outl_3 = @lib.assoc(@kernel.rator(a), outlalist)
              (@kernel.mk_comb(outl_3, g), g)
            }
          },
          args,
        )
        let (args_p, args_p_p) = @lib.unzip(pargs)
        let inl_1 = @lib.assoc(@kernel.rator(l_1), inlalist)
        let rty = @lib.hd(@kernel.dest_type(@kernel.type_of(inl_1)).1)
        let nty = @lib.itlist(
          fn(
            x773 : @kernel.Term,
            x774 : @kernel.HolType,
          ) -> @kernel.HolType raise {
            (fn(
              x770 : @kernel.HolType,
            ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
              fn(x771 : @kernel.HolType) -> @kernel.HolType raise {
                @basics.mk_fun_ty(x770, x771)
              }
            })(
              (fn(x772 : @kernel.Term) -> @kernel.HolType raise {
                @kernel.type_of(x772)
              })(x773),
            )(x774)
          },
          args_p,
          rty,
        )
        let fn_p = @kernel.mk_var(@kernel.dest_var(fn__1).0, nty)
        let r_p = @basics.list_mk_abs(
          args_p_p,
          @kernel.mk_comb(inl_1, @basics.list_mk_comb(fn_p, args_p)),
        )
        (r_p, fn__1)
      }
      let defs = @lib.map(hack_clause, @basics.conjuncts(bod_2))
      let jth = @equal.beta_rule(
        @bool.specl(
          @lib.map(
            fn(x775 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              x775.0
            },
            defs,
          ),
          ith,
        ),
      )
      let bth = @kernel.assume_rule(@basics.strip_exists(@kernel.concl(jth)).1)
      let finish_clause : (@kernel.Thm) -> @kernel.Thm raise = fn(
        x776 : @kernel.Thm,
      ) -> @kernel.Thm raise {
        let th_1 = x776
        let (avs_3, bod_4) = @basics.strip_forall(@kernel.concl(th_1))
        let outl_4 = @lib.assoc(@kernel.rator(@equal.lhand(bod_4)), outlalist)
        @bool.genl(
          avs_3,
          @equal.beta_rule(@equal.ap_term(outl_4, @bool.specl(avs_3, th_1))),
        )
      }
      let cth = @lib.end_itlist(
        @bool.conj,
        @lib.map(finish_clause, @bool.conjuncts_rule(bth)),
      )
      let dth = elim_outcombs(cth)
      let eth = @simp.gen_rewrite_rule(
        fn(
          x777 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s778 = @equal.once_depth_conv(x777)
          fn(x779 : @kernel.Term) -> @kernel.Thm raise { s778(x779) }
        },
        @lib.map(@equal.sym, fns_p),
      )(dth)
      let fth = @lib.itlist(
        @bool.simple_exists,
        @lib.map(
          fn(x780 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x780.1
          },
          fnalist,
        ),
        eth,
      )
      let dtms = @lib.map(
        fn(x782 : @kernel.Thm) -> @kernel.Term raise {
          @lib.hd(
            (fn(x781 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
              @kernel.hyp(x781)
            })(x782),
          )
        },
        fns_p,
      )
      let gth = @lib.itlist(
        fn(x783 : @kernel.Term, x784 : @kernel.Thm) -> @kernel.Thm raise {
          let e = x783
          let th_2 = x784
          let (l_2, r_2) = @kernel.dest_eq(e)
          let t785 = @kernel.refl(r_2)
          @bool.mp(
            @kernel.inst_rule(@list.List([(r_2, l_2)]), @bool.disch(e, th_2)),
            t785,
          )
        },
        dtms,
        fth,
      )
      let hth = @bool.prove_hyp(
        jth,
        @lib.itlist(@bool.simple_choose, evs_1, gth),
      )
      let xvs = @lib.map(
        fn(x793 : @kernel.Term) -> @kernel.Term raise {
          (fn(
            x791 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            (fn(x789 : @kernel.Term) -> @kernel.Term raise {
              (fn(x788 : @kernel.Term) -> @kernel.Term raise {
                (fn(
                  x786 : (@kernel.Term, @list.List[@kernel.Term]),
                ) -> @kernel.Term raise {
                  x786.0
                })(
                  (fn(
                    x787 : @kernel.Term,
                  ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                    @basics.strip_comb(x787)
                  })(x788),
                )
              })(@kernel.rand(x789))
            })(
              (fn(
                x790 : (@list.List[@kernel.Term], @kernel.Term),
              ) -> @kernel.Term raise {
                x790.1
              })(x791),
            )
          })(
            (fn(
              x792 : @kernel.Term,
            ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
              @basics.strip_forall(x792)
            })(x793),
          )
        },
        @basics.conjuncts(@kernel.concl(eth)),
      )
      @bool.genl(xvs, hth)
    }
  }
  define_type_raw_v2_c.set(fn(
    x794 : @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise {
    let def = x794
    let (ith_1, rth) = define_type_raw_v1(def)
    (ith_1, generalize_recursion_theorem(rth))
  })
}

///|
let define_type_raw_v2_c : @lib.Cell[
  (
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise,
] = @lib.Cell::new("define_type_raw")

///|
/// `define_type_raw`
pub fn define_type_raw_v2(
  x : @list.List[
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
  ],
) -> (@kernel.Thm, @kernel.Thm) raise {
  define_type_raw_v2_c.get()(x)
}

///|
let option_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("option_INDUCT")

///|
/// `option_INDUCT`
pub fn option_induct() -> @kernel.Thm {
  option_induct_c.get()
}

///|
let option_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "option_RECURSION",
)

///|
/// `option_RECURSION`
pub fn option_recursion() -> @kernel.Thm {
  option_recursion_c.get()
}

///|
/// option_INDUCT, option_RECURSION
fn step_39() -> Unit raise {
  let (option_induct, option_recursion) = define_type_raw_v2(
    parse_inductive_type_specification("option = NONE | SOME A"),
  )
  option_induct_c.set(option_induct)
  option_recursion_c.set(option_recursion)
}

///|
let list_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_INDUCT")

///|
/// `list_INDUCT`
pub fn list_induct() -> @kernel.Thm {
  list_induct_c.get()
}

///|
let list_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_RECURSION")

///|
/// `list_RECURSION`
pub fn list_recursion() -> @kernel.Thm {
  list_recursion_c.get()
}

///|
/// list_INDUCT, list_RECURSION
fn step_40() -> Unit raise {
  let (list_induct, list_recursion) = define_type_raw_v2(
    parse_inductive_type_specification("list = NIL | CONS A list"),
  )
  list_induct_c.set(list_induct)
  list_recursion_c.set(list_recursion)
}

///|
/// FORALL_OPTION_THM
fn step_41() -> Unit raise {
  let t796 = @simp.simp_tac(@list.List([]))
  let t795 = @simp.rewrite_tac(@list.List([option_induct()]))
  let t797 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      t795,
    ),
    t796,
  )
  forall_option_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Option[A]) -> Bool, (∀ x : Option[A], P(x)) == (P(NONE) && (∀ a : A, P(SOME(a))))"),
      t797,
    ),
  )
}

///|
let forall_option_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_OPTION_THM",
)

///|
/// `FORALL_OPTION_THM`
pub fn forall_option_thm() -> @kernel.Thm {
  forall_option_thm_c.get()
}

///|
/// EXISTS_OPTION_THM
fn step_42() -> Unit raise {
  let t799 = @meson.meson_tac(@list.List([]))
  let t798 = @simp.rewrite_tac(@list.List([forall_option_thm()]))
  let t800 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([
            @meson.meson(
              @list.List([]),
              @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) == !(∀ x : _, !P(x))"),
            ),
          ]),
        ),
      ),
      t798,
    ),
    t799,
  )
  exists_option_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Option[A]) -> Bool, (∃ x : Option[A], P(x)) == (P(NONE) || (∃ a : A, P(SOME(a))))"),
      t800,
    ),
  )
}

///|
let exists_option_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_OPTION_THM",
)

///|
/// `EXISTS_OPTION_THM`
pub fn exists_option_thm() -> @kernel.Thm {
  exists_option_thm_c.get()
}

///|
/// prove_constructors_injective
fn step_43() -> Unit raise {
  let depair : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x801 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s802 = @equal.top_sweep_conv(x801)
      fn(x803 : @kernel.Term) -> @kernel.Thm raise { s802(x803) }
    },
    @list.List([@pair.pair_eq()]),
  )
  let prove_distinctness : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x804 : @kernel.Thm,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let ax = x804
    fn(x805 : @kernel.Term) -> @kernel.Thm raise {
      let pat = x805
      let (f, args) = @basics.strip_comb(pat)
      let rt = @lib.end_itlist(
        (x806 : @kernel.Term, x807 : @kernel.Term) => {
          @lib.curry(@pair.mk_pair, x806, x807)
        },
        args,
      )
      let t808 = @kernel.type_of(rt)
      let ty = @basics.mk_fun_ty(@kernel.type_of(pat), t808)
      let fn_ = @basics.genvar(ty)
      let dtm = @basics.mk_eq(@kernel.mk_comb(fn_, pat), rt)
      let t809 = @bool.list_mk_forall(args, dtm)
      let eth = @recursion.prove_recursive_functions_exist(ax)(t809)
      let args_p = @basics.variants(args, args)
      let atm = @basics.mk_eq(pat, @basics.list_mk_comb(f, args_p))
      let ath = @kernel.assume_rule(atm)
      let bth = @equal.ap_term(fn_, ath)
      let cth1 = @bool.specl(
        args,
        @kernel.assume_rule(@basics.dest_exists(@kernel.concl(eth)).1),
      )
      let cth2 = @kernel.inst_rule(@lib.zip(args_p, args), cth1)
      let pth = @kernel.trans(@kernel.trans(@equal.sym(cth1), bth), cth2)
      let qth = depair(pth)
      let qtm = @kernel.concl(qth)
      let t817 = @kernel.refl(f)
      let rth = @lib.rev_itlist(
        fn(x815 : @kernel.Thm, x816 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x813 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x814 : @kernel.Thm) -> @kernel.Thm raise {
              ((x811 : @kernel.Thm, x812 : @kernel.Thm) => {
                @lib.curry(
                  fn(x810 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                    @kernel.mk_comb_rule(x810.0, x810.1)
                  },
                  x811,
                  x812,
                )
              })(x813, x814)
            }
          })(x816)(x815)
        },
        @bool.conjuncts_rule(@kernel.assume_rule(qtm)),
        t817,
      )
      let t818 = @bool.disch(qtm, rth)
      let tth = @bool.imp_antisym_rule(@bool.disch(atm, qth), t818)
      let uth = @bool.genl(args, @bool.genl(args_p, tth))
      @bool.prove_hyp(eth, @bool.simple_choose(fn_, uth))
    }
  }
  prove_constructors_injective_c.set(fn(
    x819 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let ax_1 = x819
    let cls = @basics.conjuncts(
      @basics.strip_exists(@basics.strip_forall(@kernel.concl(ax_1)).1).1,
    )
    let pats = @lib.map(
      fn(x824 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x822 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          (fn(x820 : @kernel.Term) -> @kernel.Term raise {
            @kernel.rand(@equal.lhand(x820))
          })(
            (fn(
              x821 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x821.1
            })(x822),
          )
        })(
          (fn(
            x823 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x823)
          })(x824),
        )
      },
      cls,
    )
    @lib.end_itlist(@bool.conj, @lib.mapfilter(prove_distinctness(ax_1), pats))
  })
}

///|
let prove_constructors_injective_c : @lib.Cell[
  (@kernel.Thm) -> @kernel.Thm raise,
] = @lib.Cell::new("prove_constructors_injective")

///|
/// `prove_constructors_injective`
pub fn prove_constructors_injective(x : @kernel.Thm) -> @kernel.Thm raise {
  prove_constructors_injective_c.get()(x)
}

///|
/// prove_constructors_distinct
fn step_44() -> Unit raise {
  let num_ty = @parser.parse_type("num")
  let t831 = @simp.rewr_conv(@class.taut(@term_syntax.parse_term("((a : Bool) → false) == !a")))
  let negate : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x833 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    @bool.gen_all(((x832 : @kernel.Thm) => @equal.conv_rule(t831, x832))(x833))
  }
  let prove_distinct : (@kernel.Thm) -> ((@list.List[@kernel.Term]) -> @list.List[
    @kernel.Thm,
  ] raise) raise = fn(
    x834 : @kernel.Thm,
  ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise) raise {
    let ax = x834
    fn(x835 : @list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise {
      let pat = x835
      let nums = @lib.map(
        @nums.mk_small_numeral,
        @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(pat)), 1L)),
      )
      let fn_ = @basics.genvar(
        @kernel.mk_type(
          "fun",
          @list.List([@kernel.type_of(@lib.hd(pat)), num_ty]),
        ),
      )
      let ls = @lib.map(
        (x837 : @kernel.Term) => {
          @lib.curry(
            fn(x836 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              @kernel.mk_comb(x836.0, x836.1)
            },
            fn_,
            x837,
          )
        },
        pat,
      )
      let defs = @lib.map2(
        fn(x838 : @kernel.Term, x839 : @kernel.Term) -> @kernel.Term raise {
          let l_1 = x838
          let r = x839
          let t840 = @basics.mk_eq(l_1, r)
          @bool.list_mk_forall(@kernel.frees(@kernel.rand(l_1)), t840)
        },
        ls,
        nums,
      )
      let t841 = @bool.list_mk_conj(defs)
      let eth = @recursion.prove_recursive_functions_exist(ax)(t841)
      let (ev, bod) = @basics.dest_exists(@kernel.concl(eth))
      let rewrite : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
        fn(
          x842 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s843 = @equal.once_depth_conv(x842)
          fn(x844 : @kernel.Term) -> @kernel.Thm raise { s843(x844) }
        },
        @bool.conjuncts_rule(@kernel.assume_rule(bod)),
      )
      let pat_p = @lib.map(
        fn(x845 : @kernel.Term) -> @kernel.Term raise {
          let t = x845
          let (f_1, args) = if @nums.is_numeral(t) {
            (t, @list.List([]))
          } else {
            @basics.strip_comb(t)
          }
          @basics.list_mk_comb(f_1, @basics.variants(args, args))
        },
        pat,
      )
      let pairs = allopairs_l(
        fn(
          x849 : @kernel.Term,
        ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
          fn(x850 : @kernel.Term) -> @kernel.Term raise {
            ((x847 : @kernel.Term, x848 : @kernel.Term) => {
              @lib.curry(
                fn(x846 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  @basics.mk_eq(x846.0, x846.1)
                },
                x847,
                x848,
              )
            })(x849, x850)
          }
        },
        pat,
        pat_p,
      )
      let nths = @lib.map(
        fn(x853 : @kernel.Term) -> @kernel.Thm raise {
          (fn(x852 : @kernel.Thm) -> @kernel.Thm raise {
            rewrite(((x851 : @kernel.Thm) => @equal.ap_term(fn_, x851))(x852))
          })(@kernel.assume_rule(x853))
        },
        pairs,
      )
      let fths = @lib.map2(
        fn(x854 : @kernel.Term, x855 : @kernel.Thm) -> @kernel.Thm raise {
          let t_1 = x854
          let th = x855
          negate(@bool.disch(t_1, @equal.conv_rule(@calc_num.num_eq_conv, th)))
        },
        pairs,
        nths,
      )
      @bool.conjuncts_rule(
        @bool.prove_hyp(
          eth,
          @bool.simple_choose(ev, @lib.end_itlist(@bool.conj, fths)),
        ),
      )
    }
  }
  prove_constructors_distinct_c.set(fn(
    x856 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let ax_1 = x856
    let cls = @basics.conjuncts(
      @basics.strip_exists(@basics.strip_forall(@kernel.concl(ax_1)).1).1,
    )
    let lefts = @lib.map(
      fn(x861 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        (fn(
          x859 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> (@kernel.Term, @kernel.Term) raise {
          (fn(x857 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            @kernel.dest_comb(@equal.lhand(x857))
          })(
            (fn(
              x858 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x858.1
            })(x859),
          )
        })(
          (fn(
            x860 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x860)
          })(x861),
        )
      },
      cls,
    )
    let fns = @lib.itlist(
      fn(
        x865 : (@kernel.Term, @kernel.Term),
        x866 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x862 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          fn(
            x863 : @list.List[@kernel.Term],
          ) -> @list.List[@kernel.Term] raise {
            @lib.insert(x862, x863)
          }
        })(
          (fn(x864 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x864.0
          })(x865),
        )(x866)
      },
      lefts,
      @list.List([]),
    )
    let pats = @lib.map(
      fn(x867 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        let f_2 = x867
        @lib.map(
          fn(x868 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x868.1
          },
          @lib.filter(
            fn(x871 : (@kernel.Term, @kernel.Term)) -> Bool raise {
              (fn(x869 : @kernel.Term) -> Bool raise { f_2 == x869 })(
                (fn(x870 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  x870.0
                })(x871),
              )
            },
            lefts,
          ),
        )
      },
      fns,
    )
    @lib.end_itlist(
      @bool.conj,
      @lib.end_itlist(
        fn(
          x874 : @list.List[@kernel.Thm],
          x875 : @list.List[@kernel.Thm],
        ) -> @list.List[@kernel.Thm] raise {
          let s876 = (fn(
            x872 : @list.List[@kernel.Thm],
          ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
            fn(
              x873 : @list.List[@kernel.Thm],
            ) -> @list.List[@kernel.Thm] raise {
              x872.concat(x873)
            }
          })(x874)
          s876(x875)
        },
        @lib.mapfilter(prove_distinct(ax_1), pats),
      ),
    )
  })
}

///|
let prove_constructors_distinct_c : @lib.Cell[
  (@kernel.Thm) -> @kernel.Thm raise,
] = @lib.Cell::new("prove_constructors_distinct")

///|
/// `prove_constructors_distinct`
pub fn prove_constructors_distinct(x : @kernel.Thm) -> @kernel.Thm raise {
  prove_constructors_distinct_c.get()(x)
}

///|
fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] allopairs_l(
  x825 : (TC) -> ((TB) -> TA raise) raise,
  x826 : @list.List[TC],
  x827 : @list.List[TB],
) -> @list.List[TA] raise {
  let f = x825
  let l = x826
  let m = x827
  if l == @list.List([]) {
    @list.List([])
  } else {
    let t829 = @lib.tl(m)
    let t830 = allopairs_l(f, @lib.tl(l), t829)
    let t828 = @lib.tl(m)
    @lib.map(f(@lib.hd(l)), t828).concat(t830)
  }
}

///|
/// prove_cases_thm
fn step_45() -> Unit raise {
  let mk_exclauses : (@kernel.Term) -> ((@list.List[@kernel.Term]) -> @kernel.Term raise) raise = fn(
    x877 : @kernel.Term,
  ) -> ((@list.List[@kernel.Term]) -> @kernel.Term raise) raise {
    let x = x877
    fn(x878 : @list.List[@kernel.Term]) -> @kernel.Term raise {
      let rpats = x878
      let xts = @lib.map(
        fn(x879 : @kernel.Term) -> @kernel.Term raise {
          let t = x879
          let t880 = @basics.mk_eq(x, t)
          @bool.list_mk_exists(@kernel.frees(t), t880)
        },
        rpats,
      )
      @kernel.mk_abs(x, @bool.list_mk_disj(xts))
    }
  }
  let prove_triv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x881 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x881
    let (evs, bod) = @basics.strip_exists(tm)
    let (l, r) = @kernel.dest_eq(bod)
    if l == r {
      @kernel.refl(l)
    } else {
      let (lf, largs) = @basics.strip_comb(l)
      let (rf, rargs) = @basics.strip_comb(r)
      if lf == rf {
        let ths = @lib.map(
          fn(x883 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
            @kernel.assume_rule(
              (fn(x882 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                @basics.mk_eq(x882.0, x882.1)
              })(x883),
            )
          },
          @lib.zip(rargs, largs),
        )
        let th1 = @lib.rev_itlist(
          fn(x889 : @kernel.Thm, x890 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(
              x887 : @kernel.Thm,
            ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
              fn(x888 : @kernel.Thm) -> @kernel.Thm raise {
                ((x885 : @kernel.Thm, x886 : @kernel.Thm) => {
                  @lib.curry(
                    fn(x884 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                      @kernel.mk_comb_rule(x884.0, x884.1)
                    },
                    x885,
                    x886,
                  )
                })(x887, x888)
              }
            })(x890)(x889)
          },
          ths,
          @kernel.refl(lf),
        )
        let t895 = @equal.sym(th1)
        @lib.itlist(
          fn(x891 : @kernel.Term, x892 : @kernel.Thm) -> @kernel.Thm raise {
            let s893 = @ind_defs.exists_equation(x891)
            s893(x892)
          },
          @lib.map(
            fn(x894 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x894) },
            ths,
          ),
          t895,
        )
      } else {
        raise Failure("prove_triv")
      }
    }
  }
  fn prove_disj(x896 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x896
    if @basics.is_disj(tm_1) {
      let (l_1, r_1) = @basics.dest_disj(tm_1)
      @bool.disj1(prove_triv(l_1), r_1) catch {
        Failure(_) => @bool.disj2(l_1, prove_disj(r_1))
        e => raise e
      }
    } else {
      prove_triv(tm_1)
    }
  }
  let prove_eclause : (@kernel.Term) -> @kernel.Thm raise = fn(
    x897 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_2 = x897
    let (avs, bod_1) = @basics.strip_forall(tm_2)
    let ctm = if @basics.is_imp(bod_1) { @kernel.rand(bod_1) } else { bod_1 }
    let cth = prove_disj(ctm)
    let dth = if @basics.is_imp(bod_1) {
      @bool.disch(@equal.lhand(bod_1), cth)
    } else {
      cth
    }
    @bool.genl(avs, dth)
  }
  prove_cases_thm_c.set(fn(x898 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x898
    let (avs_1, bod_2) = @basics.strip_forall(@kernel.concl(th))
    let cls = @lib.map(
      fn(x901 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x899 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          x899.1
        })(
          (fn(
            x900 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x900)
          })(x901),
        )
      },
      @basics.conjuncts(@equal.lhand(bod_2)),
    )
    let pats = @lib.map(
      fn(x902 : @kernel.Term) -> @kernel.Term raise {
        let t_1 = x902
        if @basics.is_imp(t_1) {
          @kernel.rand(t_1)
        } else {
          t_1
        }
      },
      cls,
    )
    let spats = @lib.map(@kernel.dest_comb, pats)
    let preds = @lib.itlist(
      fn(
        x906 : (@kernel.Term, @kernel.Term),
        x907 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x903 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          fn(
            x904 : @list.List[@kernel.Term],
          ) -> @list.List[@kernel.Term] raise {
            @lib.insert(x903, x904)
          }
        })(
          (fn(x905 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x905.0
          })(x906),
        )(x907)
      },
      spats,
      @list.List([]),
    )
    let rpatlist = @lib.map(
      fn(x908 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        let pr = x908
        @lib.map(
          fn(x909 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x909.1
          },
          @lib.filter(
            fn(x910 : (@kernel.Term, @kernel.Term)) -> Bool raise {
              let (p, x_1) = x910
              p == pr
            },
            spats,
          ),
        )
      },
      preds,
    )
    let t913 = @lib.map(
      fn(x912 : @list.List[@kernel.Term]) -> @kernel.HolType raise {
        (fn(x911 : @kernel.Term) -> @kernel.HolType raise {
          @kernel.type_of(x911)
        })(@lib.hd(x912))
      },
      rpatlist,
    )
    let xs = @basics.make_args("x", @kernel.freesl(pats), t913)
    let xpreds = @lib.map2(
      fn(
        x914 : @kernel.Term,
        x915 : @list.List[@kernel.Term],
      ) -> @kernel.Term raise {
        let s916 = mk_exclauses(x914)
        s916(x915)
      },
      xs,
      rpatlist,
    )
    let t917 = @bool.spec_all(th)
    let ith = @equal.beta_rule(@kernel.inst_rule(@lib.zip(xpreds, preds), t917))
    let eclauses = @basics.conjuncts(@basics.dest_imp(@kernel.concl(ith)).0)
    @bool.mp(
      ith,
      @lib.end_itlist(@bool.conj, @lib.map(prove_eclause, eclauses)),
    )
  })
}

///|
let prove_cases_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "prove_cases_thm",
)

///|
/// `prove_cases_thm`
pub fn prove_cases_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  prove_cases_thm_c.get()(x)
}

///|
/// ind_types.ml:1010
fn step_46() -> Unit raise {
  @class.inductive_type_store().val = @list.List([
    ("list", (2L, list_induct(), list_recursion())),
    ("option", (2L, option_induct(), option_recursion())),
    ("sum", (2L, sum_induct(), sum_recursion())),
  ]).concat(@class.inductive_type_store().val)
  ()
}

///|
/// basic_rectype_net
fn step_47() -> Unit raise {
  basic_rectype_net_c.set(Ref::{ val: @nets.empty_net(), })
}

///|
let basic_rectype_net_c : @lib.Cell[
  Ref[@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]],
] = @lib.Cell::new("basic_rectype_net")

///|
/// `basic_rectype_net`
pub fn basic_rectype_net() -> Ref[
  @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
] {
  basic_rectype_net_c.get()
}

///|
/// distinctness_store
fn step_48() -> Unit raise {
  distinctness_store_c.set(Ref::{
    val: @list.List([
      ("bool", @class.taut(@term_syntax.parse_term("(true == false) == false"))),
    ]),
  })
}

///|
let distinctness_store_c : @lib.Cell[Ref[@list.List[(String, @kernel.Thm)]]] = @lib.Cell::new(
  "distinctness_store",
)

///|
/// `distinctness_store`
pub fn distinctness_store() -> Ref[@list.List[(String, @kernel.Thm)]] {
  distinctness_store_c.get()
}

///|
/// injectivity_store
fn step_49() -> Unit raise {
  injectivity_store_c.set(Ref::{ val: @list.List([]), })
}

///|
let injectivity_store_c : @lib.Cell[Ref[@list.List[(String, @kernel.Thm)]]] = @lib.Cell::new(
  "injectivity_store",
)

///|
/// `injectivity_store`
pub fn injectivity_store() -> Ref[@list.List[(String, @kernel.Thm)]] {
  injectivity_store_c.get()
}

///|
/// `extend_rectype_net`
pub fn[TA, TB] extend_rectype_net(
  x918 : String,
  x919 : (TA, TB, @kernel.Thm),
) -> Unit raise {
  let (tyname, (_, _, rth)) = (x918, x919)
  let ths1 = @list.List([prove_constructors_distinct(rth)]) catch {
    Failure(_) => @list.List([])
    e => raise e
  }
  let ths2 = @list.List([prove_constructors_injective(rth)]) catch {
    Failure(_) => @list.List([])
    e => raise e
  }
  let canon_thl = @lib.itlist(
    (x920 : @kernel.Thm, x921 : @list.List[@kernel.Thm]) => {
      @simp.mk_rewrites(false, x920, x921)
    },
    ths1.concat(ths2),
    @list.List([]),
  )
  let t923 = distinctness_store().val
  {
    distinctness_store().val = @lib.map(
      fn(x922 : @kernel.Thm) -> (String, @kernel.Thm) raise {
        let th = x922
        (tyname, th)
      },
      ths1,
    ).concat(t923)
    ()
  }
  let t925 = injectivity_store().val
  {
    injectivity_store().val = @lib.map(
      fn(x924 : @kernel.Thm) -> (String, @kernel.Thm) raise {
        let th_1 = x924
        (tyname, th_1)
      },
      ths2,
    ).concat(t925)
    ()
  }
  basic_rectype_net().val = @lib.itlist(
    (
      x926 : @kernel.Thm,
      x927 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) => @simp.net_of_thm(true, x926, x927),
    canon_thl,
    basic_rectype_net().val,
  )
  ()
}

///|
/// ind_types.ml:1035
fn step_50() -> Unit raise {
  @lib.do_list(
    fn(x928 : (String, (Int64, @kernel.Thm, @kernel.Thm))) -> Unit raise {
      extend_rectype_net(x928.0, x928.1)
    },
    @class.inductive_type_store().val,
  )
}

///|
/// `distinctness`
pub fn distinctness(x929 : String) -> @kernel.Thm raise {
  let ty = x929
  @lib.assoc(ty, distinctness_store().val)
}

///|
/// `injectivity`
pub fn injectivity(x930 : String) -> @kernel.Thm raise {
  let ty = x930
  @lib.assoc(ty, injectivity_store().val)
}

///|
/// `cases`
pub fn cases(x931 : String) -> @kernel.Thm raise {
  let ty = x931
  if ty == "num" {
    @nums.num_cases()
  } else {
    let (_, ith, _) = @lib.assoc(ty, @class.inductive_type_store().val)
    prove_cases_thm(ith)
  }
}

///|
/// option_DISTINCT
fn step_51() -> Unit raise {
  let t932 = @simp.rewrite_tac(@list.List([distinctness("option")]))
  option_distinct_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, !(SOME(a) == NONE)"), t932),
  )
}

///|
let option_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "option_DISTINCT",
)

///|
/// `option_DISTINCT`
pub fn option_distinct() -> @kernel.Thm {
  option_distinct_c.get()
}

///|
/// option_INJ
fn step_52() -> Unit raise {
  let t933 = @simp.rewrite_tac(@list.List([injectivity("option")]))
  option_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, (SOME(a) == SOME(b)) == (a == b)"),
      t933,
    ),
  )
}

///|
let option_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("option_INJ")

///|
/// `option_INJ`
pub fn option_inj() -> @kernel.Thm {
  option_inj_c.get()
}

///|
/// ISO
fn step_53() -> Unit raise {
  iso_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(ISO : ((A) -> B, (B) -> A) -> Bool)((f : (A) -> B), (g : (B) -> A)) == ((∀ x : B, f(g(x)) == x) && (∀ y : A, g(f(y)) == y))"),
    ),
  )
}

///|
let iso_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISO")

///|
/// `ISO`
pub fn iso() -> @kernel.Thm {
  iso_c.get()
}

///|
/// ISO_REFL
fn step_54() -> Unit raise {
  let t934 = @simp.rewrite_tac(@list.List([iso()]))
  iso_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("ISO((x : A) => x, (x : A) => x)"), t934),
  )
}

///|
let iso_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISO_REFL")

///|
/// `ISO_REFL`
pub fn iso_refl() -> @kernel.Thm {
  iso_refl_c.get()
}

///|
/// ISO_FUN
fn step_55() -> Unit raise {
  let t935 = @meson.meson_tac(@list.List([]))
  let t936 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([iso(), @class.fun_eq_thm()])),
    t935,
  )
  iso_fun_c.set(
    @tactics.prove(
      @term_syntax.parse_term("ISO((f : (A) -> A'), (f' : (A') -> A)) && ISO((g : (B) -> B'), (g' : (B') -> B)) → ISO((h : (A) -> B) => (a' : A') => g(h(f'(a'))), (h : (A') -> B') => (a : A) => g'(h(f(a))))"),
      t936,
    ),
  )
}

///|
let iso_fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISO_FUN")

///|
/// `ISO_FUN`
pub fn iso_fun() -> @kernel.Thm {
  iso_fun_c.get()
}

///|
/// ISO_USAGE
fn step_56() -> Unit raise {
  let t937 = @meson.meson_tac(@list.List([]))
  let t938 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([iso(), @class.fun_eq_thm()])),
    t937,
  )
  iso_usage_c.set(
    @tactics.prove(
      @term_syntax.parse_term("ISO((f : (A) -> B), (g : (B) -> A)) → (∀ P : (A) -> Bool, (∀ x : A, P(x)) == (∀ x : B, P(g(x)))) && (∀ P : (A) -> Bool, (∃ x : A, P(x)) == (∃ x : B, P(g(x)))) && (∀ a : A, ∀ b : B, (a == g(b)) == (f(a) == b))"),
      t938,
    ),
  )
}

///|
let iso_usage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISO_USAGE")

///|
/// `ISO_USAGE`
pub fn iso_usage() -> @kernel.Thm {
  iso_usage_c.get()
}

///|
/// define_type_raw
fn step_57() -> Unit raise {
  let triv_imp_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x939 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x939
    let (avs, bod) = @basics.strip_forall(tm)
    let bth = if @basics.is_eq(bod) {
      @kernel.refl(@kernel.rand(bod))
    } else {
      let (ant, con) = @basics.dest_imp(bod)
      let t940 = @equal.lhs(con)
      let ith = @equal.subs_conv(@bool.conjuncts_rule(@kernel.assume_rule(ant)))(
        t940,
      )
      @bool.disch(ant, ith)
    }
    @bool.genl(avs, bth)
  }
  let triv_ante_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x941 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th = x941
    let tm_1 = @kernel.concl(th)
    if @basics.is_imp(tm_1) {
      let (ant_1, con_1) = @basics.dest_imp(@kernel.concl(th))
      let cjs = @basics.conjuncts(ant_1)
      let cths = @lib.map(triv_imp_conv, cjs)
      @bool.mp(th, @lib.end_itlist(@bool.conj, cths))
    } else {
      th
    }
  }
  let iso_expand_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.pure_once_rewrite_conv(
    @list.List([iso()]),
  )
  fn lift_type_bijections(
    x942 : @list.List[@kernel.Thm],
    x943 : @kernel.HolType,
  ) -> @kernel.Thm raise {
    let iths = x942
    let cty = x943
    let itys = @lib.map(
      fn(x951 : @kernel.Thm) -> @kernel.HolType raise {
        (fn(x949 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x948 : @kernel.Term) -> @kernel.HolType raise {
            (fn(x946 : @kernel.HolType) -> @kernel.HolType raise {
              (fn(
                x945 : (String, @list.List[@kernel.HolType]),
              ) -> @kernel.HolType raise {
                @lib.hd(
                  (fn(
                    x944 : (String, @list.List[@kernel.HolType]),
                  ) -> @list.List[@kernel.HolType] raise {
                    x944.1
                  })(x945),
                )
              })(@kernel.dest_type(x946))
            })(
              (fn(x947 : @kernel.Term) -> @kernel.HolType raise {
                @kernel.type_of(x947)
              })(x948),
            )
          })(@equal.lhand(x949))
        })(
          (fn(x950 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x950) })(
            x951,
          ),
        )
      },
      iths,
    )
    @lib.assoc(cty, @lib.zip(itys, iths)) catch {
      Failure(_) =>
        if !@lib.exists(
            fn(x954 : @kernel.HolType) -> Bool raise {
              (fn(
                x952 : @kernel.HolType,
              ) -> ((@kernel.HolType) -> Bool raise) raise {
                fn(x953 : @kernel.HolType) -> Bool raise {
                  @basics.occurs_in(x952, x953)
                }
              })(x954)(cty)
            },
            itys,
          ) {
          @kernel.inst_type(@list.List([(cty, @kernel.aty)]), iso_refl())
        } else {
          let (tycon, isotys) = @kernel.dest_type(cty)
          if tycon == "fun" {
            let t956 = @lib.end_itlist(
              @bool.conj,
              @lib.map(
                (x955 : @kernel.HolType) => lift_type_bijections(iths, x955),
                isotys,
              ),
            )
            @drule.match_mp(iso_fun())(t956)
          } else {
            raise Failure(
              "lift_type_bijections: Unexpected type operator \"" +
              (tycon + "\""),
            )
          }
        }
      e => raise e
    }
  }
  let t972 = @tactics.pop_assum(fn(
    x969 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s970 = @tactics.accept_tac(x969)
    fn(
      x971 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s970(x971)
    }
  })
  let t968 = @tactics.match_mp_tac(@class.select_ax())
  let t967 = @tactics.disch_then(fn(
    x964 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s965 = @tactics.subst1_tac(x964)
    fn(
      x966 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s965(x966)
    }
  })
  let t973 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x963 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(
                x957 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s958 = @equal.land_conv(x957)
                fn(x959 : @kernel.Term) -> @kernel.Thm raise { s958(x959) }
              })(
                (fn(
                  x960 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s961 = @equal.rand_conv(x960)
                  fn(x962 : @kernel.Term) -> @kernel.Thm raise { s961(x962) }
                })(x963),
              )
            },
            @list.List([@equal.gsym(@class.eta_ax())]),
          ),
          @tactics.disch_tac,
        ),
        t967,
      ),
      t968,
    ),
    t972,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("op_q((P : (_) -> Bool)) → (c : _) == select(P) → P(c)"),
    t973,
  )
  let use_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth)
  fn de_existentialize_rule(
    x974 : @kernel.Thm,
  ) -> (@list.List[@kernel.Term], @kernel.Thm) raise {
    let th_1 = x974
    if !@basics.is_exists(@kernel.concl(th_1)) {
      (@list.List([]), th_1)
    } else {
      let th1 = use_pth(th_1)
      let v1 = @kernel.rand(@kernel.rand(@kernel.concl(th1)))
      let gv = @basics.genvar(@kernel.type_of(v1))
      let th2 = @equal.conv_rule(
        @equal.beta_conv,
        @bool.undisch(@kernel.inst_rule(@list.List([(gv, v1)]), th1)),
      )
      let (vs, th3) = de_existentialize_rule(th2)
      (vs.prepend(gv), th3)
    }
  }
  let de_existentialize_rule_1 : (@kernel.Thm) -> (
    @list.List[@kernel.Term],
    @kernel.Thm,
  ) raise = de_existentialize_rule
  let grab_type : (@kernel.Term) -> @kernel.HolType raise = fn(
    x981 : @kernel.Term,
  ) -> @kernel.HolType raise {
    (fn(
      x979 : (@list.List[@kernel.Term], @kernel.Term),
    ) -> @kernel.HolType raise {
      (fn(x977 : @kernel.Term) -> @kernel.HolType raise {
        (fn(x976 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x975 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x975)
          })(@kernel.rand(x976))
        })(@equal.lhand(x977))
      })(
        (fn(
          x978 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          x978.1
        })(x979),
      )
    })(
      (fn(
        x980 : @kernel.Term,
      ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x980)
      })(x981),
    )
  }
  let clause_corresponds : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(
    x982 : @kernel.Term,
  ) -> ((@kernel.Term) -> Bool raise) raise {
    let cl0 = x982
    let (f0, ctm0) = @kernel.dest_comb(@equal.lhs(cl0))
    let c0 = @kernel.dest_const(@basics.strip_comb(ctm0).0).0
    let (dty0, rty0) = @basics.dest_fun_ty(@kernel.type_of(f0))
    fn(x984 : @kernel.Term) -> Bool raise {
      let cl1 = x984
      let (f1, ctm1) = @kernel.dest_comb(@equal.lhs(cl1))
      let c1 = @kernel.dest_const(@basics.strip_comb(ctm1).0).0
      let (dty1, rty1) = @basics.dest_fun_ty(@kernel.type_of(f1))
      c0 == c1 && dty0 == rty1 && rty0 == dty1
    }
  }
  let prove_inductive_types_isomorphic : (Int64) -> ((Int64) -> ((
    (@kernel.Thm, @kernel.Thm),
  ) -> (((@kernel.Thm, @kernel.Thm)) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise) raise = fn(
    x985 : Int64,
  ) -> ((Int64) -> (((@kernel.Thm, @kernel.Thm)) -> ((
    (@kernel.Thm, @kernel.Thm),
  ) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise) raise {
    let n = x985
    fn(
      x986 : Int64,
    ) -> (((@kernel.Thm, @kernel.Thm)) -> (((@kernel.Thm, @kernel.Thm)) -> (
      @kernel.Thm,
      @kernel.Thm,
    ) raise) raise) raise {
      let k = x986
      fn(
        x987 : (@kernel.Thm, @kernel.Thm),
      ) -> (((@kernel.Thm, @kernel.Thm)) -> (@kernel.Thm, @kernel.Thm) raise) raise {
        let (ith0, rth0) = x987
        fn(
          x988 : (@kernel.Thm, @kernel.Thm),
        ) -> (@kernel.Thm, @kernel.Thm) raise {
          let (ith1, rth1) = x988
          let sth0 = @bool.spec_all(rth0)
          let sth1 = @bool.spec_all(rth1)
          let t_tm = @kernel.concl(@bool.truth())
          let (pevs0, pbod0) = @basics.strip_exists(@kernel.concl(sth0))
          let (pevs1, pbod1) = @basics.strip_exists(@kernel.concl(sth1))
          let t989 = @basics.conjuncts(pbod0)
          let (pcjs0, qcjs0) = @lib.chop_list(@lib.int63_to_int(k), t989)
          let t990 = @basics.conjuncts(pbod1)
          let t991 = @lib.chop_list(@lib.int63_to_int(n), t990).1
          let (pcjs1, qcjs1) = @lib.chop_list(@lib.int63_to_int(k), t991)
          let t992 = @lib.map(grab_type, pcjs0)
          let tyal0 = @lib.setify(@lib.zip(@lib.map(grab_type, pcjs1), t992))
          let tyal1 = @lib.map(
            fn(
              x993 : (@kernel.HolType, @kernel.HolType),
            ) -> (@kernel.HolType, @kernel.HolType) raise {
              let (a, b) = x993
              (b, a)
            },
            tyal0,
          )
          let tyins0 = @lib.map(
            fn(
              x994 : @kernel.Term,
            ) -> (@kernel.HolType, @kernel.HolType) raise {
              let f = x994
              let (domty, ranty) = @basics.dest_fun_ty(@kernel.type_of(f))
              (@basics.tysubst(tyal0, domty), ranty)
            },
            pevs0,
          )
          let tyins1 = @lib.map(
            fn(
              x995 : @kernel.Term,
            ) -> (@kernel.HolType, @kernel.HolType) raise {
              let f_1 = x995
              let (domty_1, ranty_1) = @basics.dest_fun_ty(@kernel.type_of(f_1))
              (@basics.tysubst(tyal1, domty_1), ranty_1)
            },
            pevs1,
          )
          let tth0 = @kernel.inst_type(tyins0, sth0)
          let tth1 = @kernel.inst_type(tyins1, sth1)
          let (evs0, bod0) = @basics.strip_exists(@kernel.concl(tth0))
          let (evs1, bod1) = @basics.strip_exists(@kernel.concl(tth1))
          let t999 = @lib.map(
            fn(x998 : @kernel.Term) -> @kernel.Term raise {
              (fn(
                x996 : (@list.List[@kernel.Term], @kernel.Term),
              ) -> @kernel.Term raise {
                x996.1
              })(
                (fn(
                  x997 : @kernel.Term,
                ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
                  @basics.strip_forall(x997)
                })(x998),
              )
            },
            @basics.conjuncts(bod0),
          )
          let (lcjs0, rcjs0) = @lib.chop_list(@lib.int63_to_int(k), t999)
          let t1003 = @basics.conjuncts(bod1)
          let t1004 = @lib.map(
            fn(x1002 : @kernel.Term) -> @kernel.Term raise {
              (fn(
                x1000 : (@list.List[@kernel.Term], @kernel.Term),
              ) -> @kernel.Term raise {
                x1000.1
              })(
                (fn(
                  x1001 : @kernel.Term,
                ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
                  @basics.strip_forall(x1001)
                })(x1002),
              )
            },
            @lib.chop_list(@lib.int63_to_int(n), t1003).1,
          )
          let (lcjs1, rcjsx) = @lib.chop_list(@lib.int63_to_int(k), t1004)
          let rcjs1 = @lib.map(
            fn(x1005 : @kernel.Term) -> @kernel.Term raise {
              let t = x1005
              @lib.find(clause_corresponds(t), rcjsx)
            },
            rcjs0,
          )
          let proc_clause : (@kernel.Term) -> ((@kernel.Term) -> (
            (@kernel.Term, @kernel.Term),
            (@kernel.Term, @kernel.Term),
          ) raise) raise = fn(
            x1006 : @kernel.Term,
          ) -> ((@kernel.Term) -> (
            (@kernel.Term, @kernel.Term),
            (@kernel.Term, @kernel.Term),
          ) raise) raise {
            let tm0 = x1006
            fn(
              x1007 : @kernel.Term,
            ) -> ((@kernel.Term, @kernel.Term), (@kernel.Term, @kernel.Term)) raise {
              let tm1 = x1007
              let (l0, r0) = @kernel.dest_eq(tm0)
              let (l1, r1) = @kernel.dest_eq(tm1)
              let (vc0, wargs0) = @basics.strip_comb(r0)
              let (con0, vargs0) = @basics.strip_comb(@kernel.rand(l0))
              let gargs0 = @lib.map(
                fn(x1010 : @kernel.Term) -> @kernel.Term raise {
                  (fn(x1008 : @kernel.HolType) -> @kernel.Term raise {
                    @basics.genvar(x1008)
                  })(
                    (fn(x1009 : @kernel.Term) -> @kernel.HolType raise {
                      @kernel.type_of(x1009)
                    })(x1010),
                  )
                },
                wargs0,
              )
              let nestf0 = @lib.map(
                fn(x1011 : @kernel.Term) -> Bool raise {
                  let a_1 = x1011
                  @lib.can(
                    (x1013 : @list.List[@kernel.Term]) => {
                      @lib.find(
                        fn(x1012 : @kernel.Term) -> Bool raise {
                          let t_1 = x1012
                          @kernel.is_comb(t_1) && @kernel.rand(t_1) == a_1
                        },
                        x1013,
                      )
                    },
                    wargs0,
                  )
                },
                vargs0,
              )
              let targs0 = @lib.map2(
                fn(x1014 : @kernel.Term, x1015 : Bool) -> @kernel.Term raise {
                  let a_2 = x1014
                  let f_2 = x1015
                  if f_2 {
                    @lib.find(
                      fn(x1016 : @kernel.Term) -> Bool raise {
                        let t_2 = x1016
                        @kernel.is_comb(t_2) && @kernel.rand(t_2) == a_2
                      },
                      wargs0,
                    )
                  } else {
                    a_2
                  }
                },
                vargs0,
                nestf0,
              )
              let gvlist0 = @lib.zip(wargs0, gargs0)
              let xargs = @lib.map(
                fn(x1017 : @kernel.Term) -> @kernel.Term raise {
                  let v = x1017
                  @lib.assoc(v, gvlist0)
                },
                targs0,
              )
              let inst0 = (
                @basics.list_mk_abs(
                  gargs0,
                  @basics.list_mk_comb(
                    @basics.strip_comb(@kernel.rand(l1)).0,
                    xargs,
                  ),
                ),
                vc0,
              )
              let (vc1, wargs1) = @basics.strip_comb(r1)
              let (con1, vargs1) = @basics.strip_comb(@kernel.rand(l1))
              let gargs1 = @lib.map(
                fn(x1020 : @kernel.Term) -> @kernel.Term raise {
                  (fn(x1018 : @kernel.HolType) -> @kernel.Term raise {
                    @basics.genvar(x1018)
                  })(
                    (fn(x1019 : @kernel.Term) -> @kernel.HolType raise {
                      @kernel.type_of(x1019)
                    })(x1020),
                  )
                },
                wargs1,
              )
              let targs1 = @lib.map2(
                fn(x1021 : @kernel.Term, x1022 : Bool) -> @kernel.Term raise {
                  let a_3 = x1021
                  let f_3 = x1022
                  if f_3 {
                    @lib.find(
                      fn(x1023 : @kernel.Term) -> Bool raise {
                        let t_3 = x1023
                        @kernel.is_comb(t_3) && @kernel.rand(t_3) == a_3
                      },
                      wargs1,
                    )
                  } else {
                    a_3
                  }
                },
                vargs1,
                nestf0,
              )
              let gvlist1 = @lib.zip(wargs1, gargs1)
              let xargs_1 = @lib.map(
                fn(x1024 : @kernel.Term) -> @kernel.Term raise {
                  let v_1 = x1024
                  @lib.assoc(v_1, gvlist1)
                },
                targs1,
              )
              let inst1 = (
                @basics.list_mk_abs(
                  gargs1,
                  @basics.list_mk_comb(
                    @basics.strip_comb(@kernel.rand(l0)).0,
                    xargs_1,
                  ),
                ),
                vc1,
              )
              (inst0, inst1)
            }
          }
          let (insts0, insts1) = @lib.unzip(
            @lib.map2(
              fn(
                x1025 : @kernel.Term,
                x1026 : @kernel.Term,
              ) -> ((@kernel.Term, @kernel.Term), (@kernel.Term, @kernel.Term)) raise {
                let s1027 = proc_clause(x1025)
                s1027(x1026)
              },
              lcjs0.concat(rcjs0),
              lcjs1.concat(rcjs1),
            ),
          )
          let uth0 = @equal.beta_rule(@kernel.inst_rule(insts0, tth0))
          let uth1 = @equal.beta_rule(@kernel.inst_rule(insts1, tth1))
          let (efvs0, sth0_1) = de_existentialize_rule_1(uth0)
          let (efvs1, sth1_1) = de_existentialize_rule_1(uth1)
          let efvs2 = @lib.map(
            fn(x1028 : @kernel.Term) -> @kernel.Term raise {
              let t1 = x1028
              @lib.find(
                fn(x1029 : @kernel.Term) -> Bool raise {
                  let t2 = x1029
                  let t1030 = @lib.hd(@kernel.dest_type(@kernel.type_of(t2)).1)
                  @lib.hd(@lib.tl(@kernel.dest_type(@kernel.type_of(t1)).1)) ==
                  t1030
                },
                efvs1,
              )
            },
            efvs0,
          )
          let isotms = @lib.map2(
            fn(
              x1031 : @kernel.Term,
              x1032 : @kernel.Term,
            ) -> @kernel.Term raise {
              let ff = x1031
              let gg = x1032
              @basics.list_mk_icomb("ISO", @list.List([ff, gg]))
            },
            efvs0,
            efvs2,
          )
          let ctm = @bool.list_mk_conj(isotms)
          let cth1 = iso_expand_conv(ctm)
          let ctm1_1 = @kernel.rand(@kernel.concl(cth1))
          let cjs_1 = @basics.conjuncts(ctm1_1)
          let eee = @lib.map(
            fn(x1033 : Int64) -> Bool raise {
              let n_1 = x1033
              @lib.mod63(n_1, 2L) == 0L
            },
            @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(cjs_1)), 1L)),
          )
          let (cjs1, cjs2) = @lib.partition(
            fn(x1034 : (Bool, @kernel.Term)) -> Bool raise { x1034.0 },
            @lib.zip(eee, cjs_1),
          )
          let t1037 = @bool.list_mk_conj(
            @lib.map(
              fn(x1036 : (Bool, @kernel.Term)) -> @kernel.Term raise { x1036.1 },
              cjs2,
            ),
          )
          let ctm2 = @bool.mk_conj(
            @bool.list_mk_conj(
              @lib.map(
                fn(x1035 : (Bool, @kernel.Term)) -> @kernel.Term raise {
                  x1035.1
                },
                cjs1,
              ),
            ),
            t1037,
          )
          let t1038 = @simp.rewrite_rule(@list.List([sth0_1, sth1_1]))
          let detriv_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
            x1039 : @kernel.Thm,
          ) -> @kernel.Thm raise {
            triv_ante_rule(t1038(x1039))
          }
          let itha = @bool.spec_all(ith0)
          let icjs = @basics.conjuncts(@kernel.rand(@kernel.concl(itha)))
          let cinsts = @lib.map(
            fn(
              x1040 : @kernel.Term,
            ) -> (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ) raise {
              let tm_2 = x1040
              @lib.tryfind(
                fn(
                  x1041 : @kernel.Term,
                ) -> (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise {
                  let vtm = x1041
                  @drule.term_match(@list.List([]), vtm, tm_2)
                },
                icjs,
              )
            },
            @basics.conjuncts(@kernel.rand(ctm2)),
          )
          let t1048 = @lib.itlist(
            fn(
              x1042 : (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              x1043 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              let (_, x, _) = x1042
              let t1045 = @lib.map(
                fn(x1044 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  x1044.1
                },
                x,
              )
              (fn(
                x1047 : @list.List[@kernel.Term],
              ) -> @list.List[@kernel.Term] raise {
                ((x1046 : @list.List[@kernel.Term]) => @lib.union(t1045, x1046))(
                  x1047,
                )
              })(x1043)
            },
            cinsts,
            @list.List([]),
          )
          let tvs = @lib.subtract(
            @basics.strip_forall(@kernel.concl(ith0)).0,
            t1048,
          )
          let ctvs = @lib.map(
            fn(x1049 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
              let p = x1049
              let x_1 = @kernel.mk_var(
                "x",
                @lib.hd(@kernel.dest_type(@kernel.type_of(p)).1),
              )
              (@kernel.mk_abs(x_1, t_tm), p)
            },
            tvs,
          )
          let jth0 = detriv_rule(
            @kernel.inst_rule(
              ctvs,
              @lib.itlist(@drule.instantiate_rule, cinsts, itha),
            ),
          )
          let itha_1 = @bool.spec_all(ith1)
          let icjs_1 = @basics.conjuncts(@kernel.rand(@kernel.concl(itha_1)))
          let cinsts_1 = @lib.map(
            fn(
              x1050 : @kernel.Term,
            ) -> (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ) raise {
              let tm_3 = x1050
              @lib.tryfind(
                fn(
                  x1051 : @kernel.Term,
                ) -> (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise {
                  let vtm_1 = x1051
                  @drule.term_match(@list.List([]), vtm_1, tm_3)
                },
                icjs_1,
              )
            },
            @basics.conjuncts(@equal.lhand(ctm2)),
          )
          let t1058 = @lib.itlist(
            fn(
              x1052 : (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              x1053 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              let (_, x_2, _) = x1052
              let t1055 = @lib.map(
                fn(x1054 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                  x1054.1
                },
                x_2,
              )
              (fn(
                x1057 : @list.List[@kernel.Term],
              ) -> @list.List[@kernel.Term] raise {
                ((x1056 : @list.List[@kernel.Term]) => @lib.union(t1055, x1056))(
                  x1057,
                )
              })(x1053)
            },
            cinsts_1,
            @list.List([]),
          )
          let tvs_1 = @lib.subtract(
            @basics.strip_forall(@kernel.concl(ith1)).0,
            t1058,
          )
          let ctvs_1 = @lib.map(
            fn(x1059 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
              let p_1 = x1059
              let x_3 = @kernel.mk_var(
                "x",
                @lib.hd(@kernel.dest_type(@kernel.type_of(p_1)).1),
              )
              (@kernel.mk_abs(x_3, t_tm), p_1)
            },
            tvs_1,
          )
          let jth1 = detriv_rule(
            @kernel.inst_rule(
              ctvs_1,
              @lib.itlist(@drule.instantiate_rule, cinsts_1, itha_1),
            ),
          )
          let t1060 = @bool.conjuncts_rule(jth1)
          let cths4 = @lib.map2(@bool.conj, @bool.conjuncts_rule(jth0), t1060)
          let cths5 = @lib.map(
            @simp.pure_once_rewrite_rule(@list.List([@equal.gsym(iso())])),
            cths4,
          )
          let cth6 = @lib.end_itlist(@bool.conj, cths5)
          (cth6, @bool.conj(sth0_1, sth1_1))
        }
      }
    }
  }
  let scrub_assumption : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x1061 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_2 = x1061
    let hyps = @kernel.hyp(th_2)
    let eqn = @lib.find(
      fn(x1062 : @kernel.Term) -> Bool raise {
        let t_4 = x1062
        let x_4 = @equal.lhs(t_4)
        @lib.forall(
          fn(x1063 : @kernel.Term) -> Bool raise {
            let u = x1063
            !@basics.free_in(x_4, @kernel.rand(u))
          },
          hyps,
        )
      },
      hyps,
    )
    let (l, r) = @kernel.dest_eq(eqn)
    let t1064 = @kernel.refl(r)
    @bool.mp(
      @kernel.inst_rule(@list.List([(r, l)]), @bool.disch(eqn, th_2)),
      t1064,
    )
  }
  let t1074 = @simp.pure_rewrite_rule(
    @list.List([@theorems.beta_thm(), @class.fun_eq_thm()]),
  )
  let simple_beta_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x1075 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    @equal.gsym(t1074(x1075))
  }
  let iso_usage_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    iso_usage(),
  )
  let t1076 = @simp.rewr_conv(iso())
  let simple_iso_expand_rule : (@kernel.Thm) -> @kernel.Thm raise = (
    x1077 : @kernel.Thm,
  ) => @equal.conv_rule(t1076, x1077)
  let ths = @lib.itlist(
    (x1078 : @kernel.Thm, x1079 : @list.List[@kernel.Thm]) => {
      @simp.mk_rewrites(false, x1078, x1079)
    },
    @list.List([@class.fun_eq_thm()]),
    @list.List([]),
  )
  let net = @lib.itlist(
    (
      x1080 : @kernel.Thm,
      x1081 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) => @simp.net_of_thm(false, x1080, x1081),
    ths,
    @simp.basic_net(),
  )
  let rewrite_fun_eq_rule : (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x1088 : @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    (fn(
      x1082 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x1083 : @kernel.Thm) -> @kernel.Thm raise {
        @equal.conv_rule(x1082, x1083)
      }
    })(
      ((x1087 : @list.List[@kernel.Thm]) => {
        @simp.general_rewrite_conv(
          true,
          fn(
            x1084 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1085 = @equal.top_depth_conv(x1084)
            fn(x1086 : @kernel.Term) -> @kernel.Thm raise { s1085(x1086) }
          },
          net,
          x1087,
        )
      })(x1088),
    )
  }
  let is_nested : (@list.List[@kernel.HolType]) -> ((@kernel.HolType) -> Bool raise) raise = fn(
    x1089 : @list.List[@kernel.HolType],
  ) -> ((@kernel.HolType) -> Bool raise) raise {
    let vs_1 = x1089
    fn(x1090 : @kernel.HolType) -> Bool raise {
      let ty = x1090
      !@kernel.is_vartype(ty) &&
      !(@lib.intersect(@kernel.tyvars(ty), vs_1) == @list.List([]))
    }
  }
  fn modify_type(
    x1091 : @list.List[(@kernel.HolType, @kernel.HolType)],
    x1092 : @kernel.HolType,
  ) -> @kernel.HolType raise {
    let alist = x1091
    let ty_1 = x1092
    @lib.rev_assoc(ty_1, alist) catch {
      Failure(_) =>
        try {
          let (tycon_1, tyargs) = @kernel.dest_type(ty_1)
          @kernel.mk_type(
            tycon_1,
            @lib.map(
              (x1093 : @kernel.HolType) => modify_type(alist, x1093),
              tyargs,
            ),
          )
        } catch {
          Failure(_) => ty_1
          e => raise e
        }
      e => raise e
    }
  }
  let recover_clause : (String) -> ((@kernel.Term) -> (
    String,
    @list.List[@kernel.HolType],
  ) raise) raise = fn(
    x1100 : String,
  ) -> ((@kernel.Term) -> (String, @list.List[@kernel.HolType]) raise) raise {
    let id = x1100
    fn(x1101 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
      let tm_4 = x1101
      let (con_2, args) = @basics.strip_comb(tm_4)
      let t1103 = @lib.map(
        fn(x1102 : @kernel.Term) -> @kernel.HolType raise {
          @kernel.type_of(x1102)
        },
        args,
      )
      (@kernel.dest_const(con_2).0 + id, t1103)
    }
  }
  fn create_auxiliary_clauses(
    x1104 : @kernel.HolType,
  ) -> (
    Int64,
    @list.List[(@kernel.HolType, @kernel.HolType)],
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
    @kernel.Thm,
    @kernel.Thm,
  ) raise {
    let nty = x1104
    let id_1 = @kernel.dest_var(@basics.genvar(@kernel.bool_ty)).0
    let (tycon_2, tyargs_1) = @kernel.dest_type(nty)
    let (k_1, ith_1, rth) = @lib.assoc(
      tycon_2,
      @class.inductive_type_store().val,
    ) catch {
      Failure(_) =>
        raise Failure("Can't find definition for nested type: " + tycon_2)
      e => raise e
    }
    let (evs, bod_1) = @basics.strip_exists(
      @basics.strip_forall(@kernel.concl(rth)).1,
    )
    let cjs_2 = @lib.map(
      fn(x1108 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x1106 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          @equal.lhand(
            (fn(
              x1105 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x1105.1
            })(x1106),
          )
        })(
          (fn(
            x1107 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x1107)
          })(x1108),
        )
      },
      @basics.conjuncts(bod_1),
    )
    let rtys = @lib.map(
      fn(x1113 : @kernel.Term) -> @kernel.HolType raise {
        (fn(x1111 : @kernel.HolType) -> @kernel.HolType raise {
          (fn(
            x1110 : (String, @list.List[@kernel.HolType]),
          ) -> @kernel.HolType raise {
            @lib.hd(
              (fn(
                x1109 : (String, @list.List[@kernel.HolType]),
              ) -> @list.List[@kernel.HolType] raise {
                x1109.1
              })(x1110),
            )
          })(@kernel.dest_type(x1111))
        })(
          (fn(x1112 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x1112)
          })(x1113),
        )
      },
      evs,
    )
    let tyins = @lib.tryfind(
      fn(
        x1114 : @kernel.HolType,
      ) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
        let vty = x1114
        @basics.type_match(vty, nty, @list.List([]))
      },
      rtys,
    )
    let cjs_p = @lib.map(
      fn(x1117 : @kernel.Term) -> @kernel.Term raise {
        (fn(x1116 : @kernel.Term) -> @kernel.Term raise {
          ((x1115 : @kernel.Term) => @kernel.inst(tyins, x1115))(x1116)
        })(@kernel.rand(x1117))
      },
      @lib.chop_list(@lib.int63_to_int(k_1), cjs_2).0,
    )
    let mtys = @lib.itlist(
      fn(
        x1121 : @kernel.Term,
        x1122 : @list.List[@kernel.HolType],
      ) -> @list.List[@kernel.HolType] raise {
        (fn(
          x1118 : @kernel.HolType,
        ) -> ((@list.List[@kernel.HolType]) -> @list.List[@kernel.HolType] raise) raise {
          fn(
            x1119 : @list.List[@kernel.HolType],
          ) -> @list.List[@kernel.HolType] raise {
            @lib.insert(x1118, x1119)
          }
        })(
          (fn(x1120 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x1120)
          })(x1121),
        )(x1122)
      },
      cjs_p,
      @list.List([]),
    )
    let pcons = @lib.map(
      fn(x1123 : @kernel.HolType) -> @list.List[@kernel.Term] raise {
        let ty_2 = x1123
        @lib.filter(
          fn(x1124 : @kernel.Term) -> Bool raise {
            let t_5 = x1124
            @kernel.type_of(t_5) == ty_2
          },
          cjs_p,
        )
      },
      mtys,
    )
    let t1125 = recover_clause(id_1)
    let cls_p = @lib.zip(
      mtys,
      @lib.map(
        (x1126 : @list.List[@kernel.Term]) => @lib.map(t1125, x1126),
        pcons,
      ),
    )
    let tyal = @lib.map(
      fn(x1127 : @kernel.HolType) -> (@kernel.HolType, @kernel.HolType) raise {
        let ty_3 = x1127
        (@kernel.mk_vartype(@kernel.dest_type(ty_3).0 + id_1), ty_3)
      },
      mtys,
    )
    let cls_p_p = @lib.map(
      fn(
        x1131 : (
          @kernel.HolType,
          @list.List[(String, @list.List[@kernel.HolType])],
        ),
      ) -> (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]) raise {
        let t1132 = ((x1130 : @list.List[(String, @list.List[@kernel.HolType])]) => {
          @lib.map(
            (x1129 : (String, @list.List[@kernel.HolType])) => {
              ((x1094, x1095) => modify_item_l(modify_type, x1094, x1095))(
                tyal, x1129,
              )
            },
            x1130,
          )
        })(x1131.1)
        (
          ((x1128 : @kernel.HolType) => modify_type(tyal, x1128))(x1131.0),
          t1132,
        )
      },
      cls_p,
    )
    let t1133 = @kernel.inst_type(tyins, rth)
    (k_1, tyal, cls_p_p, @kernel.inst_type(tyins, ith_1), t1133)
  }
  fn define_type_nested(
    x1134 : @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (Int64, @kernel.Thm, @kernel.Thm) raise {
    let def_1 = x1134
    let n_2 = Int::to_int64(
      @lib.length(
        @lib.itlist(
          fn(
            x1137 : @list.List[String],
            x1138 : @list.List[String],
          ) -> @list.List[String] raise {
            let s1139 = (fn(
              x1135 : @list.List[String],
            ) -> ((@list.List[String]) -> @list.List[String] raise) raise {
              fn(x1136 : @list.List[String]) -> @list.List[String] raise {
                x1135.concat(x1136)
              }
            })(x1137)
            s1139(x1138)
          },
          @lib.map(
            fn(
              x1143 : (
                @kernel.HolType,
                @list.List[(String, @list.List[@kernel.HolType])],
              ),
            ) -> @list.List[String] raise {
              ((x1141 : @list.List[(String, @list.List[@kernel.HolType])]) => {
                @lib.map(
                  fn(
                    x1140 : (String, @list.List[@kernel.HolType]),
                  ) -> String raise {
                    x1140.0
                  },
                  x1141,
                )
              })(
                (fn(
                  x1142 : (
                    @kernel.HolType,
                    @list.List[(String, @list.List[@kernel.HolType])],
                  ),
                ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
                  x1142.1
                })(x1143),
              )
            },
            def_1,
          ),
          @list.List([]),
        ),
      ),
    )
    let newtys = @lib.map(
      fn(
        x1144 : (
          @kernel.HolType,
          @list.List[(String, @list.List[@kernel.HolType])],
        ),
      ) -> @kernel.HolType raise {
        x1144.0
      },
      def_1,
    )
    let utys = @lib.unions(
      @lib.itlist(
        fn(
          x1151 : (
            @kernel.HolType,
            @list.List[(String, @list.List[@kernel.HolType])],
          ),
          x1152 : @list.List[@list.List[@kernel.HolType]],
        ) -> @list.List[@list.List[@kernel.HolType]] raise {
          (fn(
            x1149 : @list.List[(String, @list.List[@kernel.HolType])],
          ) -> ((@list.List[@list.List[@kernel.HolType]]) -> @list.List[
            @list.List[@kernel.HolType],
          ] raise) raise {
            (fn(
              x1145 : @list.List[@list.List[@kernel.HolType]],
            ) -> ((@list.List[@list.List[@kernel.HolType]]) -> @list.List[
              @list.List[@kernel.HolType],
            ] raise) raise {
              fn(
                x1146 : @list.List[@list.List[@kernel.HolType]],
              ) -> @list.List[@list.List[@kernel.HolType]] raise {
                @lib.union(x1145, x1146)
              }
            })(
              ((x1148 : @list.List[(String, @list.List[@kernel.HolType])]) => {
                @lib.map(
                  fn(
                    x1147 : (String, @list.List[@kernel.HolType]),
                  ) -> @list.List[@kernel.HolType] raise {
                    x1147.1
                  },
                  x1148,
                )
              })(x1149),
            )
          })(
            (fn(
              x1150 : (
                @kernel.HolType,
                @list.List[(String, @list.List[@kernel.HolType])],
              ),
            ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
              x1150.1
            })(x1151),
          )(x1152)
        },
        def_1,
        @list.List([]),
      ),
    )
    let rectys = @lib.filter(is_nested(newtys), utys)
    if rectys == @list.List([]) {
      let (th1_1, th2_1) = define_type_basecase_l(def_1)
      (n_2, th1_1, th2_1)
    } else {
      let nty_1 = @lib.hd(
        @lib.sort(
          fn(x1153 : @kernel.HolType, x1154 : @kernel.HolType) -> Bool raise {
            let t1_1 = x1153
            let t2_1 = x1154
            @basics.occurs_in(t2_1, t1_1)
          },
          rectys,
        ),
      )
      let (k_2, tyal_1, ncls, ith_2, rth_1) = create_auxiliary_clauses(nty_1)
      let cls = @lib.map(
        (
          x1155 : (
            @kernel.HolType,
            @list.List[(String, @list.List[@kernel.HolType])],
          ),
        ) => {
          ((x1097, x1098) => modify_clause_l(modify_type, x1097, x1098))(
            tyal_1, x1155,
          )
        },
        def_1,
      ).concat(ncls)
      let (_, ith1_1, rth1_1) = define_type_nested(cls)
      let xnewtys = @lib.map(
        fn(x1160 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x1158 : @kernel.HolType) -> @kernel.HolType raise {
            (fn(
              x1157 : (String, @list.List[@kernel.HolType]),
            ) -> @kernel.HolType raise {
              @lib.hd(
                (fn(
                  x1156 : (String, @list.List[@kernel.HolType]),
                ) -> @list.List[@kernel.HolType] raise {
                  x1156.1
                })(x1157),
              )
            })(@kernel.dest_type(x1158))
          })(
            (fn(x1159 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x1159)
            })(x1160),
          )
        },
        @basics.strip_exists(@basics.strip_forall(@kernel.concl(rth1_1)).1).0,
      )
      let xtyal = @lib.map(
        fn(
          x1161 : @kernel.HolType,
        ) -> (@kernel.HolType, @kernel.HolType) raise {
          let ty_4 = x1161
          let s_2 = @kernel.dest_vartype(ty_4)
          (
            @lib.find(
              fn(x1162 : @kernel.HolType) -> Bool raise {
                let t_6 = x1162
                @kernel.dest_type(t_6).0 == s_2
              },
              xnewtys,
            ),
            ty_4,
          )
        },
        @lib.map(
          fn(
            x1163 : (
              @kernel.HolType,
              @list.List[(String, @list.List[@kernel.HolType])],
            ),
          ) -> @kernel.HolType raise {
            x1163.0
          },
          cls,
        ),
      )
      let ith0_1 = @kernel.inst_type(xtyal, ith_2)
      let rth0_1 = @kernel.inst_type(xtyal, rth_1)
      let (isoth, rclauses) = prove_inductive_types_isomorphic(n_2)(k_2)(
        (ith0_1, rth0_1),
      )((ith1_1, rth1_1))
      let irth3 = @bool.conj(ith1_1, rth1_1)
      let vtylist = @lib.itlist(
        fn(
          x1167 : @kernel.Term,
          x1168 : @list.List[@kernel.HolType],
        ) -> @list.List[@kernel.HolType] raise {
          (fn(
            x1164 : @kernel.HolType,
          ) -> ((@list.List[@kernel.HolType]) -> @list.List[@kernel.HolType] raise) raise {
            fn(
              x1165 : @list.List[@kernel.HolType],
            ) -> @list.List[@kernel.HolType] raise {
              @lib.insert(x1164, x1165)
            }
          })(
            (fn(x1166 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x1166)
            })(x1167),
          )(x1168)
        },
        @basics.variables(@kernel.concl(irth3)),
        @list.List([]),
      )
      let isoths = @bool.conjuncts_rule(isoth)
      let isotys_1 = @lib.map(
        fn(x1176 : @kernel.Thm) -> @kernel.HolType raise {
          (fn(x1174 : @kernel.Term) -> @kernel.HolType raise {
            (fn(x1173 : @kernel.Term) -> @kernel.HolType raise {
              (fn(x1171 : @kernel.HolType) -> @kernel.HolType raise {
                (fn(
                  x1170 : (String, @list.List[@kernel.HolType]),
                ) -> @kernel.HolType raise {
                  @lib.hd(
                    (fn(
                      x1169 : (String, @list.List[@kernel.HolType]),
                    ) -> @list.List[@kernel.HolType] raise {
                      x1169.1
                    })(x1170),
                  )
                })(@kernel.dest_type(x1171))
              })(
                (fn(x1172 : @kernel.Term) -> @kernel.HolType raise {
                  @kernel.type_of(x1172)
                })(x1173),
              )
            })(@equal.lhand(x1174))
          })(
            (fn(x1175 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x1175)
            })(x1176),
          )
        },
        isoths,
      )
      let ctylist = @lib.filter(
        fn(x1177 : @kernel.HolType) -> Bool raise {
          let ty_5 = x1177
          @lib.exists(
            fn(x1178 : @kernel.HolType) -> Bool raise {
              let t_7 = x1178
              @basics.occurs_in(t_7, ty_5)
            },
            isotys_1,
          )
        },
        vtylist,
      )
      let atylist = @lib.itlist(
        fn(
          x1182 : @kernel.HolType,
          x1183 : @list.List[@kernel.HolType],
        ) -> @list.List[@kernel.HolType] raise {
          (fn(
            x1179 : @list.List[@kernel.HolType],
          ) -> ((@list.List[@kernel.HolType]) -> @list.List[@kernel.HolType] raise) raise {
            fn(
              x1180 : @list.List[@kernel.HolType],
            ) -> @list.List[@kernel.HolType] raise {
              @lib.union(x1179, x1180)
            }
          })(
            ((x1181 : @kernel.HolType) => {
              @lib.striplist(@basics.dest_fun_ty, x1181)
            })(x1182),
          )(x1183)
        },
        ctylist,
        @list.List([]),
      )
      let isoths_p = @lib.map(
        (x1184 : @kernel.HolType) => lift_type_bijections(isoths, x1184),
        @lib.filter(
          fn(x1185 : @kernel.HolType) -> Bool raise {
            let ty_6 = x1185
            @lib.exists(
              fn(x1186 : @kernel.HolType) -> Bool raise {
                let t_8 = x1186
                @basics.occurs_in(t_8, ty_6)
              },
              isotys_1,
            )
          },
          atylist,
        ),
      )
      let cisoths = @lib.map(
        fn(x1188 : @kernel.HolType) -> @kernel.Thm raise {
          @equal.beta_rule(
            ((x1187 : @kernel.HolType) => lift_type_bijections(isoths_p, x1187))(
              x1188,
            ),
          )
        },
        ctylist,
      )
      let uisoths = @lib.map(iso_usage_rule, cisoths)
      let visoths = @lib.map(
        fn(x1190 : @kernel.Thm) -> @kernel.Thm raise {
          @kernel.assume_rule(
            (fn(x1189 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x1189)
            })(x1190),
          )
        },
        uisoths,
      )
      let irth4 = @lib.itlist(
        @bool.prove_hyp,
        uisoths,
        rewrite_fun_eq_rule(visoths)(irth3),
      )
      let irth5 = @simp.rewrite_rule(
        @lib.map(simple_iso_expand_rule, isoths_p).prepend(rclauses),
      )(irth4)
      let irth6 = @lib.repeat(scrub_assumption, irth5)
      let ncjs = @lib.filter(
        fn(x1191 : @kernel.Term) -> Bool raise {
          let t_9 = x1191
          @lib.exists(
            fn(x1192 : @kernel.Term) -> Bool raise {
              let v_2 = x1192
              !@kernel.is_var(v_2)
            },
            @basics.strip_comb(
              @kernel.rand(@equal.lhs(@basics.strip_forall(t_9).1)),
            ).1,
          )
        },
        @basics.conjuncts(
          @basics.strip_exists(
            @basics.strip_forall(@kernel.rand(@kernel.concl(irth6))).1,
          ).1,
        ),
      )
      let mk_newcon : (@kernel.Term) -> @kernel.Thm raise = fn(
        x1193 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_5 = x1193
        let (vs_2, bod_2) = @basics.strip_forall(tm_5)
        let rdeb = @kernel.rand(@equal.lhs(bod_2))
        let rdef = @basics.list_mk_abs(vs_2, rdeb)
        let newname = @kernel.dest_var(@basics.genvar(@kernel.bool_ty)).0
        let def_2 = @basics.mk_eq(
          @kernel.mk_var(newname, @kernel.type_of(rdef)),
          rdef,
        )
        let dth = @pair.new_definition(def_2)
        simple_beta_rule(dth)
      }
      let dths = @lib.map(mk_newcon, ncjs)
      let (ith6, rth6) = @bool.conj_pair(@simp.pure_rewrite_rule(dths)(irth6))
      (n_2, ith6, rth6)
    }
  }
  define_type_raw_c.set(fn(
    x1194 : @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise {
    let def_3 = x1194
    let newtys_1 = @lib.map(
      fn(
        x1195 : (
          @kernel.HolType,
          @list.List[(String, @list.List[@kernel.HolType])],
        ),
      ) -> @kernel.HolType raise {
        x1195.0
      },
      def_3,
    )
    let truecons = @lib.itlist(
      fn(
        x1198 : @list.List[String],
        x1199 : @list.List[String],
      ) -> @list.List[String] raise {
        let s1200 = (fn(
          x1196 : @list.List[String],
        ) -> ((@list.List[String]) -> @list.List[String] raise) raise {
          fn(x1197 : @list.List[String]) -> @list.List[String] raise {
            x1196.concat(x1197)
          }
        })(x1198)
        s1200(x1199)
      },
      @lib.map(
        fn(
          x1204 : (
            @kernel.HolType,
            @list.List[(String, @list.List[@kernel.HolType])],
          ),
        ) -> @list.List[String] raise {
          ((x1202 : @list.List[(String, @list.List[@kernel.HolType])]) => {
            @lib.map(
              fn(
                x1201 : (String, @list.List[@kernel.HolType]),
              ) -> String raise {
                x1201.0
              },
              x1202,
            )
          })(
            (fn(
              x1203 : (
                @kernel.HolType,
                @list.List[(String, @list.List[@kernel.HolType])],
              ),
            ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
              x1203.1
            })(x1204),
          )
        },
        def_3,
      ),
      @list.List([]),
    )
    let (p_2, ith0_2, rth0_2) = define_type_nested(def_3)
    let (avs_1, etm) = @basics.strip_forall(@kernel.concl(rth0_2))
    let allcls = @basics.conjuncts(@basics.strip_exists(etm).1)
    let relcls = @lib.chop_list(@lib.length(truecons), allcls).0
    let gencons = @lib.map(
      fn(x1211 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x1209 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          (fn(x1207 : @kernel.Term) -> @kernel.Term raise {
            (fn(x1206 : @kernel.Term) -> @kernel.Term raise {
              ((x1205 : @kernel.Term) => @lib.repeat(@kernel.rator, x1205))(
                @kernel.rand(x1206),
              )
            })(@equal.lhand(x1207))
          })(
            (fn(
              x1208 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x1208.1
            })(x1209),
          )
        })(
          (fn(
            x1210 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x1210)
          })(x1211),
        )
      },
      relcls,
    )
    let cdefs = @lib.map2(
      fn(x1212 : String, x1213 : @kernel.Term) -> @kernel.Thm raise {
        let s_3 = x1212
        let r_1 = x1213
        @equal.sym(
          @pair.new_definition(
            @basics.mk_eq(@kernel.mk_var(s_3, @kernel.type_of(r_1)), r_1),
          ),
        )
      },
      truecons,
      gencons,
    )
    let tavs = @basics.make_args(
      "f",
      @list.List([]),
      @lib.map(
        fn(x1214 : @kernel.Term) -> @kernel.HolType raise {
          @kernel.type_of(x1214)
        },
        avs_1,
      ),
    )
    let ith1_2 = @equal.subs(cdefs, ith0_2)
    let rth1_2 = @bool.genl(tavs, @equal.subs(cdefs, @bool.specl(tavs, rth0_2)))
    let retval = (p_2, ith1_2, rth1_2)
    let newentries = @lib.map(
      fn(
        x1215 : @kernel.HolType,
      ) -> (String, (Int64, @kernel.Thm, @kernel.Thm)) raise {
        let s_4 = x1215
        (@kernel.dest_vartype(s_4), retval)
      },
      newtys_1,
    )
    {
      @class.inductive_type_store().val = newentries.concat(
        @class.inductive_type_store().val,
      )
      ()
    }
    @lib.do_list(
      fn(x1216 : (String, (Int64, @kernel.Thm, @kernel.Thm))) -> Unit raise {
        extend_rectype_net(x1216.0, x1216.1)
      },
      newentries,
    )
    (ith1_2, rth1_2)
  })
}

///|
let define_type_raw_c : @lib.Cell[
  (
    @list.List[
      (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
    ],
  ) -> (@kernel.Thm, @kernel.Thm) raise,
] = @lib.Cell::new("define_type_raw")

///|
/// `define_type_raw`
pub fn define_type_raw(
  x : @list.List[
    (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
  ],
) -> (@kernel.Thm, @kernel.Thm) raise {
  define_type_raw_c.get()(x)
}

///|
fn[TB] add_id_l(x1066 : TB) -> String raise {
  let s = x1066
  @kernel.dest_var(@basics.genvar(@kernel.bool_ty)).0
}

///|
fn[TA] define_type_basecase_l(
  x1065 : @list.List[
    (@kernel.HolType, @list.List[(TA, @list.List[@kernel.HolType])]),
  ],
) -> (@kernel.Thm, @kernel.Thm) raise {
  let def = x1065
  let def_p = @lib.map(
    fn(
      x1072 : (@kernel.HolType, @list.List[(TA, @list.List[@kernel.HolType])]),
    ) -> (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]) raise {
      let t1073 = ((x1071 : @list.List[(TA, @list.List[@kernel.HolType])]) => {
        @lib.map(
          fn(
            x1069 : (TA, @list.List[@kernel.HolType]),
          ) -> (String, @list.List[@kernel.HolType]) raise {
            let t1070 = (fn(
              x1068 : @list.List[@kernel.HolType],
            ) -> @list.List[@kernel.HolType] raise {
              x1068
            })(x1069.1)
            (add_id_l(x1069.0), t1070)
          },
          x1071,
        )
      })(x1072.1)
      (
        (fn(x1067 : @kernel.HolType) -> @kernel.HolType raise { x1067 })(
          x1072.0,
        ),
        t1073,
      )
    },
    def,
  )
  define_type_raw_v2(def_p)
}

///|
fn[TC] modify_item_l(
  modify_type : (
    @list.List[(@kernel.HolType, @kernel.HolType)],
    @kernel.HolType,
  ) -> @kernel.HolType raise,
  x1094 : @list.List[(@kernel.HolType, @kernel.HolType)],
  x1095 : (TC, @list.List[@kernel.HolType]),
) -> (TC, @list.List[@kernel.HolType]) raise {
  let alist_1 = x1094
  let (s_1, l_1) = x1095
  (s_1, @lib.map((x1096 : @kernel.HolType) => modify_type(alist_1, x1096), l_1))
}

///|
fn[TD, TE] modify_clause_l(
  modify_type : (
    @list.List[(@kernel.HolType, @kernel.HolType)],
    @kernel.HolType,
  ) -> @kernel.HolType raise,
  x1097 : @list.List[(@kernel.HolType, @kernel.HolType)],
  x1098 : (TD, @list.List[(TE, @list.List[@kernel.HolType])]),
) -> (TD, @list.List[(TE, @list.List[@kernel.HolType])]) raise {
  let alist_2 = x1097
  let (l_2, lis) = x1098
  (
    l_2,
    @lib.map(
      (x1099 : (TE, @list.List[@kernel.HolType])) => {
        ((x1094, x1095) => modify_item_l(modify_type, x1094, x1095))(
          alist_2, x1099,
        )
      },
      lis,
    ),
  )
}

///|
/// the_inductive_types
fn step_58() -> Unit raise {
  the_inductive_types_c.set(Ref::{
    val: @list.List([
      ("list = NIL | CONS A list", (list_induct(), list_recursion())),
      ("option = NONE | SOME A", (option_induct(), option_recursion())),
      ("sum = INL A | INR B", (sum_induct(), sum_recursion())),
    ]),
  })
}

///|
let the_inductive_types_c : @lib.Cell[
  Ref[@list.List[(String, (@kernel.Thm, @kernel.Thm))]],
] = @lib.Cell::new("the_inductive_types")

///|
/// `the_inductive_types`
pub fn the_inductive_types() -> Ref[
  @list.List[(String, (@kernel.Thm, @kernel.Thm))],
] {
  the_inductive_types_c.get()
}

///|
/// `define_type`
pub fn define_type(x1217 : String) -> (@kernel.Thm, @kernel.Thm) raise {
  let s = x1217
  try {
    let retval = @lib.assoc(s, the_inductive_types().val)
    @lib.warn(true, "Benign redefinition of inductive type")
    retval
  } catch {
    Failure(_) => {
      let defspec = parse_inductive_type_specification(s)
      let newtypes = @lib.map(
        fn(
          x1218 : (
            @kernel.HolType,
            @list.List[(String, @list.List[@kernel.HolType])],
          ),
        ) -> @kernel.HolType raise {
          x1218.0
        },
        defspec,
      )
      let constructors = @lib.itlist(
        fn(
          x1223 : @list.List[(String, @list.List[@kernel.HolType])],
          x1224 : @list.List[String],
        ) -> @list.List[String] raise {
          (fn(
            x1219 : @list.List[String],
          ) -> ((@list.List[String]) -> @list.List[String] raise) raise {
            fn(x1220 : @list.List[String]) -> @list.List[String] raise {
              x1219.concat(x1220)
            }
          })(
            ((x1222 : @list.List[(String, @list.List[@kernel.HolType])]) => {
              @lib.map(
                fn(
                  x1221 : (String, @list.List[@kernel.HolType]),
                ) -> String raise {
                  x1221.0
                },
                x1222,
              )
            })(x1223),
          )(x1224)
        },
        @lib.map(
          fn(
            x1225 : (
              @kernel.HolType,
              @list.List[(String, @list.List[@kernel.HolType])],
            ),
          ) -> @list.List[(String, @list.List[@kernel.HolType])] raise {
            x1225.1
          },
          defspec,
        ),
        @list.List([]),
      )
      let t1226 = Int::to_int64(@lib.length(newtypes))
      if !(Int::to_int64(@lib.length(@lib.setify(newtypes))) == t1226) {
        raise Failure("define_type: multiple definitions of a type")
      } else {
        let t1227 = Int::to_int64(@lib.length(constructors))
        if !(Int::to_int64(@lib.length(@lib.setify(constructors))) == t1227) {
          raise Failure("define_type: multiple instances of a constructor")
        } else if @lib.exists(
            fn(x1229 : @kernel.HolType) -> Bool raise {
              ((x1228 : String) => @lib.can(@kernel.get_type_arity, x1228))(
                @kernel.dest_vartype(x1229),
              )
            },
            newtypes,
          ) {
          let t = @lib.find(
            (x1230 : String) => @lib.can(@kernel.get_type_arity, x1230),
            @lib.map(@kernel.dest_vartype, newtypes),
          )
          raise Failure("define_type: type :" + (t + " already defined"))
        } else if @lib.exists(
            (x1231 : String) => @lib.can(@kernel.get_const_type, x1231),
            constructors,
          ) {
          let t_1 = @lib.find(
            (x1232 : String) => @lib.can(@kernel.get_const_type, x1232),
            constructors,
          )
          raise Failure("define_type: constant " + (t_1 + " already defined"))
        } else {
          let retval_1 = define_type_raw(defspec)
          {
            the_inductive_types().val = the_inductive_types().val.prepend(
              (s, retval_1),
            )
            ()
          }
          retval_1
        }
      }
    }
    e => raise e
  }
}

///|
let unwind_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("UNWIND_CONV")

///|
/// `UNWIND_CONV`
pub fn unwind_conv(x : @kernel.Term) -> @kernel.Thm raise {
  unwind_conv_c.get()(x)
}

///|
let match_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("MATCH_CONV")

///|
/// `MATCH_CONV`
pub fn match_conv(x : @kernel.Term) -> @kernel.Thm raise {
  match_conv_c.get()(x)
}

///|
/// UNWIND_CONV, MATCH_CONV
fn step_59() -> Unit raise {
  let t1234 = @meson.meson_tac(@list.List([]))
  let t1233 = @simp.asm_rewrite_tac(@list.List([@class.cond_id()]))
  let t1235 = @tactics.then_tac(
    @tactics.then_tac(
      @class.bool_cases_tac(@term_syntax.parse_term("(p : Bool)")),
      t1233,
    ),
    t1234,
  )
  let pth_0 = @tactics.prove(
    @term_syntax.parse_term("(if existsunique((x : _) => x == (a : _) && (p : Bool)) { select((x : _) => x == a && p) } else { select((x : _) => false) }) == (if p { a } else { select((x : _) => false) })"),
    t1235,
  )
  let t1236 = @meson.meson_tac(@list.List([]))
  let t1237 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@pair._match(), @pair._seqpattern(), @pair._function()]),
    ),
    t1236,
  )
  let pth_1 = @tactics.prove(
    @term_syntax.parse_term("_MATCH((x : _), _SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool))) == (if (∃ y : _, r(x, y)) { _MATCH(x, r) } else { _MATCH(x, s) }) && _FUNCTION(_SEQPATTERN(r, s), x) == (if (∃ y : _, r(x, y)) { _FUNCTION(r, x) } else { _FUNCTION(s, x) })"),
    t1237,
  )
  let t1238 = @meson.meson_tac(@list.List([]))
  let t1239 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @pair._unguarded_pattern(),
        @pair._guarded_pattern(),
        @pair.geq_def(),
      ]),
    ),
    t1238,
  )
  let pth_2 = @tactics.prove(
    @term_syntax.parse_term("(∃ y : _, _UNGUARDED_PATTERN(GEQ((s : _), (t : _)), GEQ((u : _), y))) == (s == t) && (∃ y : _, _GUARDED_PATTERN(GEQ(s, t), (p : Bool), GEQ(u, y))) == (s == t && p)"),
    t1239,
  )
  let t1240 = @simp.rewrite_tac(@list.List([@pair._match(), @pair._function()]))
  let pth_3 = @tactics.prove(
    @term_syntax.parse_term("_MATCH((x : _), (y : _) => (z : _) => (P : (_, _) -> Bool)(y, z)) == (if existsunique((z : _) => P(x, z)) { select((z : _) => P(x, z)) } else { select((x : _) => false) }) && _FUNCTION((y : _) => (z : _) => P(y, z), x) == (if existsunique((z : _) => P(x, z)) { select((z : _) => P(x, z)) } else { select((x : _) => false) })"),
    t1240,
  )
  let t1241 = @meson.meson_tac(@list.List([]))
  let t1242 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @pair._unguarded_pattern(),
        @pair._guarded_pattern(),
        @pair.geq_def(),
      ]),
    ),
    t1241,
  )
  let pth_4 = @tactics.prove(
    @term_syntax.parse_term("_UNGUARDED_PATTERN(GEQ((s : _), (t : _)), GEQ((u : _), (y : _))) == (y == u && s == t) && _GUARDED_PATTERN(GEQ(s, t), (p : Bool), GEQ(u, y)) == (y == u && s == t && p)"),
    t1242,
  )
  let t1243 = @meson.meson_tac(@list.List([]))
  let pth_5 = @tactics.prove(
    @term_syntax.parse_term("(if existsunique((z : _) => z == (k : _)) { select((z : _) => z == k) } else { select((x : _) => false) }) == k"),
    t1243,
  )
  fn inside_exists_conv(
    x1244 : (@kernel.Term) -> @kernel.Thm raise,
    x1245 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let conv = x1244
    let tm = x1245
    if @basics.is_exists(tm) {
      @equal.binder_conv((x1246 : @kernel.Term) => {
        inside_exists_conv(conv, x1246)
      })(tm)
    } else {
      conv(tm)
    }
  }
  let econv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @theorems.swap_exists_thm(),
  )
  fn conv_1(
    x1247 : (@kernel.Term) -> @kernel.Thm raise,
    x1248 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let bc = x1247
    let tm_1 = x1248
    @equal.thenc(
      econv,
      @equal.binder_conv((x1249 : @kernel.Term) => conv_1(bc, x1249)),
    )(tm_1) catch {
      Failure(_) => bc(tm_1)
      e => raise e
    }
  }
  let push_exists_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
    @kernel.Term,
  ) -> @kernel.Thm raise) raise = fn(
    x1250 : (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x1251 : @kernel.Term) -> @kernel.Thm raise { conv_1(x1250, x1251) }
  }
  let t1255 = @canon.assoc_conv(@theorems.conj_assoc())
  let conv2 : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x1252 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1253 = @equal.depth_conv(x1252)
        fn(x1254 : @kernel.Term) -> @kernel.Thm raise { s1253(x1254) }
      },
      @list.List([@theorems.and_clauses(), @theorems.or_clauses()]),
    ),
    t1255,
  )
  let break_cons_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x1256 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_2 = x1256
    let conv0 : (@kernel.Term) -> @kernel.Thm raise = @equal.top_sweep_conv(
      @simp.rewrites_conv(basic_rectype_net().val),
    )
    let conv1 : (@kernel.Term) -> @kernel.Thm raise = if @basics.is_conj(tm_2) {
      @equal.land_conv(conv0)
    } else {
      conv0
    }
    @equal.thenc(conv1, conv2)(tm_2)
  }
  let t1258 = @bool.eqt_intro(
    @equal.gsym(@bool.spec_all(@theorems.exists_refl())),
  )
  let baseconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1257 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1257
    },
    @list.List([
      @theorems.unwind_thm1(),
      @theorems.unwind_thm2(),
      @bool.eqt_intro(@bool.spec_all(@theorems.exists_refl())),
      t1258,
    ]),
  )
  fn unwind_conv(x1259 : @kernel.Term) -> @kernel.Thm raise {
    let tm_3 = x1259
    let (evs, bod) = @basics.strip_exists(tm_3)
    let eqs = @basics.conjuncts(bod)
    try {
      let eq = @lib.find(
        fn(x1260 : @kernel.Term) -> Bool raise {
          let tm_4 = x1260
          if @basics.is_eq(tm_4) {
            let (l, r) = @kernel.dest_eq(tm_4)
            (@lib.mem(l, evs) && !@basics.free_in(l, r)) ||
            (@lib.mem(r, evs) && !@basics.free_in(r, l))
          } else {
            false
          }
        },
        eqs,
      )
      let (l_1, r_1) = @kernel.dest_eq(eq)
      let v = if @lib.mem(l_1, evs) && !@basics.free_in(l_1, r_1) {
        l_1
      } else {
        r_1
      }
      let cjs_p = @lib.subtract(eqs, @list.List([eq])).prepend(eq)
      let t1261 = @lib.add63(1L, Int::to_int64(@lib.index(v, @lib.rev(evs))))
      let n = @lib.sub63(Int::to_int64(@lib.length(evs)), t1261)
      let th1 = @canon.conj_aci_rule(
        @basics.mk_eq(bod, @bool.list_mk_conj(cjs_p)),
      )
      let th2 = @lib.itlist(@drule.mk_exists_rule, evs, th1)
      let t1265 = @kernel.rand(@kernel.concl(th2))
      let t1266 = push_exists_conv(baseconv)
      let th3 = @lib.funpow(
        @lib.int63_to_int(n),
        fn(
          x1262 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1263 = @equal.binder_conv(x1262)
          fn(x1264 : @kernel.Term) -> @kernel.Thm raise { s1263(x1264) }
        },
        t1266,
      )(t1265)
      let t1267 = @kernel.trans(th2, th3)
      @equal.conv_rule(@equal.rand_conv(unwind_conv), t1267)
    } catch {
      Failure(_) => @kernel.refl(tm_3)
      e => raise e
    }
  }
  let unwind_conv_1 : (@kernel.Term) -> @kernel.Thm raise = unwind_conv
  let t1278 = @simp.gen_rewrite_conv(
    fn(
      x1275 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1276 = @equal.depth_conv(x1275)
      fn(x1277 : @kernel.Term) -> @kernel.Thm raise { s1276(x1277) }
    },
    @list.List([@theorems.exists_simp()]),
  )
  let t1274 = @simp.gen_rewrite_conv(
    fn(
      x1271 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1272 = @equal.depth_conv(x1271)
      fn(x1273 : @kernel.Term) -> @kernel.Thm raise { s1272(x1273) }
    },
    @list.List([
      @bool.eqt_intro(@bool.spec_all(@theorems.eq_refl())),
      @theorems.and_clauses(),
    ]),
  )
  let t1270 = push_exists_conv(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x1269 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x1269
        },
        @list.List([pth_2]),
      ),
      break_cons_conv,
    ),
  )
  let t1279 = @equal.rator_conv(
    @equal.land_conv(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @equal.binder_conv(
                @equal.thenc(
                  @equal.rator_conv(@equal.beta_conv),
                  @equal.beta_conv,
                ),
              ),
              t1270,
            ),
            unwind_conv_1,
          ),
          t1274,
        ),
        t1278,
      ),
    ),
  )
  let match_seqpattern_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x1268 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1268
      },
      @list.List([pth_1]),
    ),
    t1279,
  )
  let match_onepattern_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x1280 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_5 = x1280
    let th1_1 = @simp.gen_rewrite_conv(
      fn(
        x1281 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1281
      },
      @list.List([pth_3]),
    )(tm_5)
    let tm_p = @basics.body(
      @kernel.rand(@equal.lhand(@kernel.rand(@kernel.concl(th1_1)))),
    )
    let t1293 = @simp.gen_rewrite_conv(
      fn(
        x1290 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1291 = @equal.depth_conv(x1290)
        fn(x1292 : @kernel.Term) -> @kernel.Thm raise { s1291(x1292) }
      },
      @list.List([@theorems.exists_simp()]),
    )
    let t1289 = @simp.gen_rewrite_conv(
      fn(
        x1286 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1287 = @equal.depth_conv(x1286)
        fn(x1288 : @kernel.Term) -> @kernel.Thm raise { s1287(x1288) }
      },
      @list.List([
        @bool.eqt_intro(@bool.spec_all(@theorems.eq_refl())),
        @theorems.and_clauses(),
      ]),
    )
    let t1283 = @equal.rand_conv(break_cons_conv)
    let t1284 = @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x1282 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x1282
        },
        @list.List([pth_4]),
      ),
      t1283,
    )
    let th2_1 = @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          (x1285 : @kernel.Term) => inside_exists_conv(t1284, x1285),
          unwind_conv_1,
        ),
        t1289,
      ),
      t1293,
    )(tm_p)
    let conv_2 : (@kernel.Term) -> @kernel.Thm raise = fn(
      x1294 : @kernel.Term,
    ) -> @kernel.Thm raise {
      let tm_6 = x1294
      if tm_6 == @equal.lhand(@kernel.concl(th2_1)) {
        th2_1
      } else {
        @lib.failure()
      }
    }
    let t1295 = @equal.binder_conv(conv_2)
    @equal.conv_rule(
      @equal.rand_conv(
        @equal.rator_conv(
          @equal.comb2_conv(@equal.rand_conv(@equal.binder_conv(conv_2)), t1295),
        ),
      ),
      th1_1,
    )
  }
  let match_seqpattern_conv_triv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    match_seqpattern_conv,
    @simp.gen_rewrite_conv(
      fn(
        x1296 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1296
      },
      @list.List([@class.cond_clauses()]),
    ),
  )
  let match_seqpattern_conv_gen : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    match_seqpattern_conv,
    @simp.gen_rewrite_conv(
      fn(
        x1297 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1298 = @equal.try_conv(x1297)
        fn(x1299 : @kernel.Term) -> @kernel.Thm raise { s1298(x1299) }
      },
      @list.List([@class.cond_clauses()]),
    ),
  )
  let match_onepattern_conv_triv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    match_onepattern_conv,
    @simp.gen_rewrite_conv(
      fn(
        x1300 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1300
      },
      @list.List([pth_5]),
    ),
  )
  let match_onepattern_conv_gen : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    match_onepattern_conv,
    @simp.gen_rewrite_conv(
      fn(
        x1301 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1302 = @equal.try_conv(x1301)
        fn(x1303 : @kernel.Term) -> @kernel.Thm raise { s1302(x1303) }
      },
      @list.List([pth_0, pth_5]),
    ),
  )
  let t1305 = (
    "FUN_ONEPATTERN_CONV",
    (
      @term_syntax.parse_term("_FUNCTION((y : _) => (z : _) => (P : (_, _) -> Bool)(y, z), (x : _))"),
      match_onepattern_conv_triv,
    ),
  )
  let t1306 = (
    "MATCH_ONEPATTERN_CONV",
    (@term_syntax.parse_term("_MATCH((x : _), (y : _) => (z : _) => (P : (_, _) -> Bool)(y, z))"), match_onepattern_conv_triv),
  )
  let t1307 = (
    "FUN_SEQPATTERN_CONV",
    (
      @term_syntax.parse_term("_FUNCTION(_SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool)), (x : _))"),
      match_seqpattern_conv_triv,
    ),
  )
  @lib.do_list(
    fn(
      x1304 : (String, (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)),
    ) -> Unit raise {
      @simp.extend_basic_convs(x1304.0, x1304.1)
    },
    @list.List([
      (
        "MATCH_SEQPATTERN_CONV",
        (
          @term_syntax.parse_term("_MATCH((x : _), _SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool)))"),
          match_seqpattern_conv_triv,
        ),
      ),
      t1307,
      t1306,
      t1305,
    ]),
  )
  let t1308 = @equal.orelsec(
    match_seqpattern_conv_gen, match_onepattern_conv_gen,
  )
  let (unwind_conv_2, match_conv) = (@equal.changed_conv(unwind_conv_1), t1308)
  unwind_conv_c.set(unwind_conv_2)
  match_conv_c.set(match_conv)
}

///|
/// FORALL_UNWIND_CONV
fn step_60() -> Unit raise {
  let econv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @theorems.swap_forall_thm(),
  )
  fn conv(
    x1309 : (@kernel.Term) -> @kernel.Thm raise,
    x1310 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let bc = x1309
    let tm = x1310
    @equal.thenc(
      econv,
      @equal.binder_conv((x1311 : @kernel.Term) => conv(bc, x1311)),
    )(tm) catch {
      Failure(_) => bc(tm)
      e => raise e
    }
  }
  let push_forall_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
    @kernel.Term,
  ) -> @kernel.Thm raise) raise = fn(
    x1312 : (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x1313 : @kernel.Term) -> @kernel.Thm raise { conv(x1312, x1313) }
  }
  let t1315 = @meson.meson(
    @list.List([]),
    @term_syntax.parse_term("(∀ x : _, (a : _) == x → (q : (_) -> Bool)(x)) == q(a)"),
  )
  let t1316 = @meson.meson(
    @list.List([]),
    @term_syntax.parse_term("(∀ x : _, x == (a : _) → (q : (_) -> Bool)(x)) == q(a)"),
  )
  let t1317 = @meson.meson(
    @list.List([]),
    @term_syntax.parse_term("(∀ x : _, (a : _) == x && (p : (_) -> Bool)(x) → (q : (_) -> Bool)(x)) == (p(a) → q(a))"),
  )
  let baseconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1314 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1314
    },
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ x : _, x == (a : _) && (p : (_) -> Bool)(x) → (q : (_) -> Bool)(x)) == (p(a) → q(a))"),
      ),
      t1317,
      t1316,
      t1315,
    ]),
  )
  fn forall_unwind_conv_1(x1318 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x1318
    try {
      let (avs, bod) = @basics.strip_forall(tm_1)
      let (ant, con) = @basics.dest_imp(bod)
      let eqs = @basics.conjuncts(ant)
      let eq = @lib.find(
        fn(x1319 : @kernel.Term) -> Bool raise {
          let tm_2 = x1319
          if @basics.is_eq(tm_2) {
            let (l, r) = @kernel.dest_eq(tm_2)
            (@lib.mem(l, avs) && !@basics.free_in(l, r)) ||
            (@lib.mem(r, avs) && !@basics.free_in(r, l))
          } else {
            false
          }
        },
        eqs,
      )
      let (l_1, r_1) = @kernel.dest_eq(eq)
      let v = if @lib.mem(l_1, avs) && !@basics.free_in(l_1, r_1) {
        l_1
      } else {
        r_1
      }
      let cjs_p = @lib.subtract(eqs, @list.List([eq])).prepend(eq)
      let t1320 = @lib.add63(1L, Int::to_int64(@lib.index(v, @lib.rev(avs))))
      let n = @lib.sub63(Int::to_int64(@lib.length(avs)), t1320)
      let th1 = @canon.conj_aci_rule(
        @basics.mk_eq(ant, @bool.list_mk_conj(cjs_p)),
      )
      let th2 = @equal.ap_thm(
        @equal.ap_term(@kernel.rator(@kernel.rator(bod)), th1),
        con,
      )
      let th3 = @lib.itlist(@drule.mk_forall_rule, avs, th2)
      let t1324 = @kernel.rand(@kernel.concl(th3))
      let t1325 = push_forall_conv(baseconv)
      let th4 = @lib.funpow(
        @lib.int63_to_int(n),
        fn(
          x1321 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1322 = @equal.binder_conv(x1321)
          fn(x1323 : @kernel.Term) -> @kernel.Thm raise { s1322(x1323) }
        },
        t1325,
      )(t1324)
      let t1326 = @kernel.trans(th3, th4)
      @equal.conv_rule(@equal.rand_conv(forall_unwind_conv_1), t1326)
    } catch {
      Failure(_) => @kernel.refl(tm_1)
      e => raise e
    }
  }
  forall_unwind_conv_c.set(forall_unwind_conv_1)
}

///|
let forall_unwind_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "FORALL_UNWIND_CONV",
)

///|
/// `FORALL_UNWIND_CONV`
pub fn forall_unwind_conv(x : @kernel.Term) -> @kernel.Thm raise {
  forall_unwind_conv_c.get()(x)
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
}
