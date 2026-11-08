// Translated from upstream Library/pocklington.ml; edit this file directly.

///|
/// Library/pocklington.ml:8
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// num_0
fn step_2() -> Unit raise {
  num_0_c.set(@num.num_of_int64(0L))
}

///|
let num_0_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_0")

///|
/// `num_0`
pub fn num_0() -> @num.Num {
  num_0_c.get()
}

///|
/// num_1
fn step_3() -> Unit raise {
  num_1_c.set(@num.num_of_int64(1L))
}

///|
let num_1_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_1")

///|
/// `num_1`
pub fn num_1() -> @num.Num {
  num_1_c.get()
}

///|
/// num_2
fn step_4() -> Unit raise {
  num_2_c.set(@num.num_of_int64(2L))
}

///|
let num_2_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_2")

///|
/// `num_2`
pub fn num_2() -> @num.Num {
  num_2_c.get()
}

///|
/// nat_mod_lemma
fn step_5() -> Unit raise {
  let t11 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.num_divides()), @int.divides()]),
  )
  let t10 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_sub(),
      @int.arith_rule(
        @term_syntax.parse_term("(x : Num) <= (y : Num) → (y == x + (d : Num)) == (y - x == d)"),
      ),
    ]),
  )
  let t9 = @simp.once_rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq((x : Int), (y : Int), mod(int_of_num((n : Num)))) == divides(int_of_num(n), x - y)"),
      ),
    ]),
  )
  let t8 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s3 = @tactics.mp_tac(x2)
        fn(
          x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s3(x4)
        }
      },
      fn(
        x5 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s6 = @tactics.assume_tac(x5)
        fn(
          x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s6(x7)
        }
      },
    ),
  )
  let t1 = @simp.rewrite_tac(@list.List([@int.num_congruent()]))
  let t12 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1),
          t8,
        ),
        t9,
      ),
      t10,
    ),
    t11,
  )
  nat_mod_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) && y <= x → (∃ q : Num, x == y + n * q)"),
      t12,
    ),
  )
}

///|
let nat_mod_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nat_mod_lemma")

///|
/// `nat_mod_lemma`
pub fn nat_mod_lemma() -> @kernel.Thm {
  nat_mod_lemma_c.get()
}

///|
/// nat_mod
fn step_6() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([
      nat_mod_lemma(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) + (y : Num) * 0 == x")),
    ]),
  )
  let t24 = @list.List([
    @tactics.all_tac,
    @simp.once_rewrite_tac(
      @list.List([
        @int.number_rule(
          @term_syntax.parse_term("op_eq_eq((x : Num), (y : Num), mod((n : Num))) == op_eq_eq(y, x, mod(n))"),
        ),
      ]),
    ),
  ])
  let t23 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x20 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s21 = @tactics.mp_tac(x20)
      fn(
        x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s21(x22)
      }
    }),
  )
  let t19 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool) → (d : Bool)) == (c && b || c && a → d)"),
      ),
    ]),
  )
  let t17 = @term_syntax.parse_term("(y : Num)")
  let t18 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Num)"), t17]),
      @arith.le_cases(),
    ),
  )
  let t16 = @simp.gen_rewrite_tac(
    fn(
      x13 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s14 = @equal.land_conv(x13)
      fn(x15 : @kernel.Term) -> @kernel.Thm raise { s14(x15) }
    },
    @list.List([@equal.gsym(@int.cong())]),
  )
  let t26 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t16),
                @tactics.eq_tac,
              ),
              @list.List([@tactics.all_tac, @int.number_tac]),
            ),
            t18,
          ),
          t19,
        ),
        t23,
      ),
      t24,
    ),
    t25,
  )
  nat_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, mod(n, x, y) == (∃ q1 : Num, ∃ q2 : Num, x + n * q1 == y + n * q2)"),
      t26,
    ),
  )
}

///|
let nat_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nat_mod")

///|
/// `nat_mod`
pub fn nat_mod() -> @kernel.Thm {
  nat_mod_c.get()
}

///|
/// FINITE_NUMBER_SEGMENT
fn step_7() -> Unit raise {
  let t51 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @arith.lt_refl()]),
  )
  let t50 = @simp.simp_tac(
    @list.List([@sets.finite_rules(), @sets.has_size(), @sets.card_clauses()]),
  )
  let t49 = @tactics.pop_assum(fn(
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
  })
  let t45 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t43 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t44 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert()]),
        ),
        t43,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.subgoal_then(
                  @term_syntax.parse_term("{(m : Num) | 0 < m && m < SUC((n : Num))} == INSERT(n, {(m : Num) | 0 < m && m < n})"),
                  fn(
                    x40 : @kernel.Thm,
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
                    let s41 = @tactics.subst1_tac(x40)
                    fn(
                      x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s41(x42)
                    }
                  },
                ),
                t44,
              ),
              t45,
            ),
            t49,
          ),
          t50,
        ),
        @tactics.disch_tac,
      ),
      t51,
    ),
    @int.arith_tac,
  )
  let t39 = @simp.rewrite_tac(@list.List([@sets.has_size_0()]))
  let t38 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t37 = @simp.asm_rewrite_tac(@list.List([]))
  let t36 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([
          @sets.extension(),
          @sets.in_elim_thm(),
          @sets.not_in_empty(),
        ]),
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t53 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("{(m : Num) | 0 < m && m < SUC((n : Num))} == {}"),
              fn(
                x33 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s34 = @tactics.subst1_tac(x33)
                fn(
                  x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s34(x35)
                }
              },
            ),
            t36,
          ),
          t37,
        ),
        t38,
      ),
      t39,
    ),
    t52,
  ])
  let t54 = @tactics.thenl(
    @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
    t53,
  )
  let t32 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t31 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), @sets.finite_rules(), @sets.card_clauses()]),
  )
  let t30 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_elim_thm(),
        @sets.not_in_empty(),
        @arith.lt(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t55 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("{(m : Num) | 0 < m && m < 0} == {}"),
              fn(
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
              },
            ),
            t30,
          ),
          t31,
        ),
        t32,
      ),
      t54,
    ]),
  )
  finite_number_segment_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, HAS_SIZE({(m : Num) | 0 < m && m < n}, n - 1)"),
      t55,
    ),
  )
}

///|
let finite_number_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_NUMBER_SEGMENT",
)

///|
/// `FINITE_NUMBER_SEGMENT`
pub fn finite_number_segment() -> @kernel.Thm {
  finite_number_segment_c.get()
}

///|
/// CONG_MOD_0
fn step_8() -> Unit raise {
  cong_mod_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(0)) == (x == y)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mod_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_0")

///|
/// `CONG_MOD_0`
pub fn cong_mod_0() -> @kernel.Thm {
  cong_mod_0_c.get()
}

///|
/// CONG_MOD_1
fn step_9() -> Unit raise {
  cong_mod_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(1))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_1")

///|
/// `CONG_MOD_1`
pub fn cong_mod_1() -> @kernel.Thm {
  cong_mod_1_c.get()
}

///|
/// CONG_MOD_2
fn step_10() -> Unit raise {
  let t61 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t59 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((b : Num))"))
  let t58 = @simp.asm_rewrite_tac(@list.List([]))
  let t57 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((a : Num))"))
  let t56 = @simp.rewrite_tac(
    @list.List([@int.cong_v1(), @arith.mod_2_cases()]),
  )
  let t62 = @tactics.then_tac(
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
      t60,
    ),
    t61,
  )
  cong_mod_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, op_eq_eq(a, b, mod(2)) == (EVEN(a) == EVEN(b))"),
      t62,
    ),
  )
}

///|
let cong_mod_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_2")

///|
/// `CONG_MOD_2`
pub fn cong_mod_2() -> @kernel.Thm {
  cong_mod_2_c.get()
}

///|
/// CONG_MOD_2_ALT
fn step_11() -> Unit raise {
  let t63 = @meson.meson_tac(@list.List([]))
  let t64 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([cong_mod_2(), @equal.gsym(@arith.not_odd())])),
    t63,
  )
  cong_mod_2_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, op_eq_eq(a, b, mod(2)) == (ODD(a) == ODD(b))"),
      t64,
    ),
  )
}

///|
let cong_mod_2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_2_ALT")

///|
/// `CONG_MOD_2_ALT`
pub fn cong_mod_2_alt() -> @kernel.Thm {
  cong_mod_2_alt_c.get()
}

///|
/// CONG_0
fn step_12() -> Unit raise {
  cong_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, op_eq_eq(x, 0, mod(n)) == divides(n, x)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_0")

///|
/// `CONG_0`
pub fn cong_0() -> @kernel.Thm {
  cong_0_c.get()
}

///|
/// CONG_SUB_CASES
fn step_13() -> Unit raise {
  let t74 = @tactics.pop_assum(fn(
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
    let s72 = @tactics.mp_tac(x71)
    fn(
      x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s72(x73)
    }
  })
  let t70 = @tactics.repeat_tac(
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t69 = @list.List([
    @simp.gen_rewrite_tac(
      fn(
        x66 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s67 = @equal.land_conv(x66)
        fn(x68 : @kernel.Term) -> @kernel.Thm raise { s67(x68) }
      },
      @list.List([@theorems.swap_exists_thm()]),
    ),
    @tactics.all_tac,
  ])
  let t65 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t75 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t65),
            @class.cond_cases_tac,
          ),
          t69,
        ),
        t70,
      ),
      t74,
    ),
    @int.arith_tac,
  )
  cong_sub_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) == (if x <= y { op_eq_eq(y - x, 0, mod(n)) } else { op_eq_eq(x - y, 0, mod(n)) })"),
      t75,
    ),
  )
}

///|
let cong_sub_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SUB_CASES")

///|
/// `CONG_SUB_CASES`
pub fn cong_sub_cases() -> @kernel.Thm {
  cong_sub_cases_c.get()
}

///|
/// CONG_MINUS1
fn step_14() -> Unit raise {
  let t78 = @tactics.conv_tac(@int.number_rule)
  let t77 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.le_1()]))
  let t79 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @int.number_rule(
            @term_syntax.parse_term("op_eq_eq((a : Num), (b : Num), mod((n : Num))) == op_eq_eq(a + 1, b + 1, mod(n))"),
          ),
        ]),
      ),
      t77,
    ),
    t78,
  )
  let t80 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@arith.sub_0(), cong_mod_0(), @prime.divides_zero()]),
      ),
      @int.arith_tac,
    ),
    t79,
  ])
  let t76 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t81 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t76),
    t80,
  )
  cong_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, op_eq_eq(a, n - 1, mod(n)) == (n == 0 && a == 0 || divides(n, a + 1))"),
      t81,
    ),
  )
}

///|
let cong_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MINUS1")

///|
/// `CONG_MINUS1`
pub fn cong_minus1() -> @kernel.Thm {
  cong_minus1_c.get()
}

///|
/// CONG_MINUS1_SQUARED
fn step_15() -> Unit raise {
  let t85 = @tactics.conv_tac(@int.number_rule)
  let t84 = @simp.asm_simp_tac(
    @list.List([
      @arith.sub_add(),
      @arith.le_1(),
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq(EXP((p : Num), 2), 1 + (2 * (n : Num) + 1), mod(p)) == divides(p, 2 * (n + 1))"),
      ),
    ]),
  )
  let t83 = @simp.once_rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq(EXP((n : Num), 2), (m : Num), mod((p : Num))) == op_eq_eq(EXP(n + 1, 2), m + (2 * n + 1), mod(p))"),
      ),
    ]),
  )
  let t82 = @simp.asm_rewrite_tac(@list.List([cong_mod_0(), @calc_num.arith()]))
  let t86 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")),
          ),
          t82,
        ),
        t83,
      ),
      t84,
    ),
    t85,
  )
  cong_minus1_squared_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, op_eq_eq(EXP(p - 1, 2), 1, mod(p)) == !(p == 0)"),
      t86,
    ),
  )
}

///|
let cong_minus1_squared_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MINUS1_SQUARED",
)

///|
/// `CONG_MINUS1_SQUARED`
pub fn cong_minus1_squared() -> @kernel.Thm {
  cong_minus1_squared_c.get()
}

///|
/// CONG_CASES
fn step_16() -> Unit raise {
  let t98 = @meson.meson_tac(@list.List([@arith.mult_sym()]))
  let t97 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.left_sub_distrib())]),
  )
  let t94 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(x : Num) + (a : Num) == (y : Num) + (b : Num) → x == b - a + y || y == a - b + x"),
    ),
  )
  let t96 = @tactics.disch_then(fn(
    x95 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x91 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s92 = @tactics.mp_tac(x91)
      fn(
        x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s92(x93)
      }
    })(t94(x95))
  })
  let t89 = @term_syntax.parse_term("(q2 : Num)")
  let t90 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q1 : Num)"), t89]),
  )
  let t88 = @simp.rewrite_tac(
    @list.List([@int.cong(), nat_mod(), @theorems.left_imp_exists_thm()]),
  )
  let t87 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @simp.asm_rewrite_tac(@list.List([])),
      ),
      @int.number_tac,
    ),
  ])
  let t99 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              t87,
            ),
            t88,
          ),
          t90,
        ),
        t96,
      ),
      t97,
    ),
    t98,
  )
  cong_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) == ((∃ q : Num, x == q * n + y) || (∃ q : Num, y == q * n + x))"),
      t99,
    ),
  )
}

///|
let cong_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_CASES")

///|
/// `CONG_CASES`
pub fn cong_cases() -> @kernel.Thm {
  cong_cases_c.get()
}

///|
/// CONG_CASE
fn step_17() -> Unit raise {
  let t104 = @simp.simp_tac(
    @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t103 = @tactics.match_mp_tac(@nums.num_induction())
  let t102 = @simp.simp_tac(@list.List([]))
  let t101 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t100 = @simp.rewrite_tac(
    @list.List([cong_cases(), @theorems.or_exists_thm()]),
  )
  let t105 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t100),
              @tactics.eq_tac,
            ),
            t101,
          ),
          t102,
        ),
        t103,
      ),
      t104,
    ),
    @int.asm_arith_tac,
  )
  cong_case_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ x : Num, a < n → op_eq_eq(x, a, mod(n)) == (∃ q : Num, x == q * n + a)"),
      t105,
    ),
  )
}

///|
let cong_case_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_CASE")

///|
/// `CONG_CASE`
pub fn cong_case() -> @kernel.Thm {
  cong_case_c.get()
}

///|
/// CONG_MULT_LCANCEL
fn step_18() -> Unit raise {
  cong_mult_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, coprime((a, n)) && op_eq_eq(a * x, a * y, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_LCANCEL",
)

///|
/// `CONG_MULT_LCANCEL`
pub fn cong_mult_lcancel() -> @kernel.Thm {
  cong_mult_lcancel_c.get()
}

///|
/// CONG_MULT_RCANCEL
fn step_19() -> Unit raise {
  cong_mult_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, coprime((a, n)) && op_eq_eq(x * a, y * a, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_RCANCEL",
)

///|
/// `CONG_MULT_RCANCEL`
pub fn cong_mult_rcancel() -> @kernel.Thm {
  cong_mult_rcancel_c.get()
}

///|
/// CONG_REFL
fn step_20() -> Unit raise {
  cong_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, op_eq_eq(x, x, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_REFL")

///|
/// `CONG_REFL`
pub fn cong_refl() -> @kernel.Thm {
  cong_refl_c.get()
}

///|
/// EQ_IMP_CONG
fn step_21() -> Unit raise {
  let t106 = @simp.simp_tac(@list.List([cong_refl()]))
  eq_imp_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, a == b → op_eq_eq(a, b, mod(n))"),
      t106,
    ),
  )
}

///|
let eq_imp_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_IMP_CONG")

///|
/// `EQ_IMP_CONG`
pub fn eq_imp_cong() -> @kernel.Thm {
  eq_imp_cong_c.get()
}

///|
/// CONG_SYM
fn step_22() -> Unit raise {
  cong_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) == op_eq_eq(y, x, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SYM")

///|
/// `CONG_SYM`
pub fn cong_sym() -> @kernel.Thm {
  cong_sym_c.get()
}

///|
/// CONG_TRANS
fn step_23() -> Unit raise {
  cong_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) && op_eq_eq(y, z, mod(n)) → op_eq_eq(x, z, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_TRANS")

///|
/// `CONG_TRANS`
pub fn cong_trans() -> @kernel.Thm {
  cong_trans_c.get()
}

///|
/// CONG_ADD
fn step_24() -> Unit raise {
  cong_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ x' : Num, ∀ y : Num, ∀ y' : Num, op_eq_eq(x, x', mod((n : Num))) && op_eq_eq(y, y', mod(n)) → op_eq_eq(x + y, x' + y', mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_ADD")

///|
/// `CONG_ADD`
pub fn cong_add() -> @kernel.Thm {
  cong_add_c.get()
}

///|
/// CONG_MULT
fn step_25() -> Unit raise {
  cong_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ x' : Num, ∀ y : Num, ∀ y' : Num, op_eq_eq(x, x', mod((n : Num))) && op_eq_eq(y, y', mod(n)) → op_eq_eq(x * y, x' * y', mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MULT")

///|
/// `CONG_MULT`
pub fn cong_mult() -> @kernel.Thm {
  cong_mult_c.get()
}

///|
/// CONG_MULT_1
fn step_26() -> Unit raise {
  cong_mult_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(x, 1, mod(n)) && op_eq_eq(y, 1, mod(n)) → op_eq_eq(x * y, 1, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MULT_1")

///|
/// `CONG_MULT_1`
pub fn cong_mult_1() -> @kernel.Thm {
  cong_mult_1_c.get()
}

///|
/// CONG_EXP
fn step_27() -> Unit raise {
  let t107 = @simp.asm_simp_tac(
    @list.List([cong_mult(), @arith.exp(), cong_refl()]),
  )
  let t108 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t107,
  )
  cong_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(n)) → op_eq_eq(EXP(x, k), EXP(y, k), mod(n))"),
      t108,
    ),
  )
}

///|
let cong_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_EXP")

///|
/// `CONG_EXP`
pub fn cong_exp() -> @kernel.Thm {
  cong_exp_c.get()
}

///|
/// CONG_EXP_1
fn step_28() -> Unit raise {
  let t118 = @simp.rewrite_tac(@list.List([@arith.exp_one()]))
  let t115 = @drule.match_mp(cong_exp())
  let t112 = @term_syntax.parse_term("(k : Num)")
  let t117 = @tactics.disch_then(fn(
    x116 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x114 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x109 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s110 = @tactics.mp_tac(x109)
        fn(
          x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s110(x111)
        }
      })(((x113 : @kernel.Thm) => @bool.spec(t112, x113))(x114))
    })(t115(x116))
  })
  let t119 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t117),
    t118,
  )
  cong_exp_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, ∀ k : Num, op_eq_eq(x, 1, mod(n)) → op_eq_eq(EXP(x, k), 1, mod(n))"),
      t119,
    ),
  )
}

///|
let cong_exp_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_EXP_1")

///|
/// `CONG_EXP_1`
pub fn cong_exp_1() -> @kernel.Thm {
  cong_exp_1_c.get()
}

///|
/// CONG_SUB
fn step_29() -> Unit raise {
  let t131 = @meson.meson_tac(@list.List([]))
  let t130 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.left_add_distrib())]),
  )
  let t127 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(x : Num) + (a : Num) == (x' : Num) + (a' : Num) && (y : Num) + (b : Num) == (y' : Num) + (b' : Num) && y <= x && y' <= x' → x - y + (a + b') == x' - y' + (a' + b)"),
    ),
  )
  let t129 = @tactics.disch_then(fn(
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
    (fn(
      x124 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s125 = @tactics.mp_tac(x124)
      fn(
        x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s125(x126)
      }
    })(t127(x128))
  })
  let t123 = @tactics.repeat_tac(@tactics.gen_tac)
  let t122 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t121 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_and_exists_thm(),
      @theorems.right_and_exists_thm(),
    ]),
  )
  let t120 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t132 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t120),
              t121,
            ),
            t122,
          ),
          t123,
        ),
        t129,
      ),
      t130,
    ),
    t131,
  )
  cong_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ x' : Num, ∀ y : Num, ∀ y' : Num, op_eq_eq(x, x', mod((n : Num))) && op_eq_eq(y, y', mod(n)) && y <= x && y' <= x' → op_eq_eq(x - y, x' - y', mod(n))"),
      t132,
    ),
  )
}

///|
let cong_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SUB")

///|
/// `CONG_SUB`
pub fn cong_sub() -> @kernel.Thm {
  cong_sub_c.get()
}

///|
/// CONG_MULT_LCANCEL_EQ
fn step_30() -> Unit raise {
  cong_mult_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, coprime((a, n)) → op_eq_eq(a * x, a * y, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_LCANCEL_EQ",
)

///|
/// `CONG_MULT_LCANCEL_EQ`
pub fn cong_mult_lcancel_eq() -> @kernel.Thm {
  cong_mult_lcancel_eq_c.get()
}

///|
/// CONG_MULT_RCANCEL_EQ
fn step_31() -> Unit raise {
  cong_mult_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, coprime((a, n)) → op_eq_eq(x * a, y * a, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mult_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_RCANCEL_EQ",
)

///|
/// `CONG_MULT_RCANCEL_EQ`
pub fn cong_mult_rcancel_eq() -> @kernel.Thm {
  cong_mult_rcancel_eq_c.get()
}

///|
/// CONG_ADD_LCANCEL_EQ
fn step_32() -> Unit raise {
  cong_add_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(a + x, a + y, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_LCANCEL_EQ",
)

///|
/// `CONG_ADD_LCANCEL_EQ`
pub fn cong_add_lcancel_eq() -> @kernel.Thm {
  cong_add_lcancel_eq_c.get()
}

///|
/// CONG_ADD_RCANCEL_EQ
fn step_33() -> Unit raise {
  cong_add_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(x + a, y + a, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_RCANCEL_EQ",
)

///|
/// `CONG_ADD_RCANCEL_EQ`
pub fn cong_add_rcancel_eq() -> @kernel.Thm {
  cong_add_rcancel_eq_c.get()
}

///|
/// CONG_ADD_RCANCEL
fn step_34() -> Unit raise {
  cong_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(x + a, y + a, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_RCANCEL",
)

///|
/// `CONG_ADD_RCANCEL`
pub fn cong_add_rcancel() -> @kernel.Thm {
  cong_add_rcancel_c.get()
}

///|
/// CONG_ADD_LCANCEL
fn step_35() -> Unit raise {
  cong_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(a + x, a + y, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_LCANCEL",
)

///|
/// `CONG_ADD_LCANCEL`
pub fn cong_add_lcancel() -> @kernel.Thm {
  cong_add_lcancel_c.get()
}

///|
/// CONG_ADD_LCANCEL_EQ_0
fn step_36() -> Unit raise {
  cong_add_lcancel_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, op_eq_eq(a + x, a, mod(n)) == op_eq_eq(x, 0, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_lcancel_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_LCANCEL_EQ_0",
)

///|
/// `CONG_ADD_LCANCEL_EQ_0`
pub fn cong_add_lcancel_eq_0() -> @kernel.Thm {
  cong_add_lcancel_eq_0_c.get()
}

///|
/// CONG_ADD_RCANCEL_EQ_0
fn step_37() -> Unit raise {
  cong_add_rcancel_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, op_eq_eq(x + a, a, mod(n)) == op_eq_eq(x, 0, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_add_rcancel_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_ADD_RCANCEL_EQ_0",
)

///|
/// `CONG_ADD_RCANCEL_EQ_0`
pub fn cong_add_rcancel_eq_0() -> @kernel.Thm {
  cong_add_rcancel_eq_0_c.get()
}

///|
/// CONG_MULT_LCANCEL_ALL
fn step_38() -> Unit raise {
  let t138 = @tactics.pop_assum(fn(
    x135 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s136 = @tactics.mp_tac(x135)
    fn(
      x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s136(x137)
    }
  })
  let t134 = @simp.asm_rewrite_tac(@list.List([]))
  let t133 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t139 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t133),
        t134,
      ),
      t138,
    ),
    @int.number_tac,
  )
  cong_mult_lcancel_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(a * x, a * y, mod(a * n)) == (a == 0 || op_eq_eq(x, y, mod(n)))"),
      t139,
    ),
  )
}

///|
let cong_mult_lcancel_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_LCANCEL_ALL",
)

///|
/// `CONG_MULT_LCANCEL_ALL`
pub fn cong_mult_lcancel_all() -> @kernel.Thm {
  cong_mult_lcancel_all_c.get()
}

///|
/// CONG_LMUL
fn step_39() -> Unit raise {
  cong_lmul_c.set(
    @int.number_rule(
      @term_syntax.parse_term("∀ a : Num, ∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → op_eq_eq(a * x, a * y, mod(n))"),
    ),
  )
}

///|
let cong_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_LMUL")

///|
/// `CONG_LMUL`
pub fn cong_lmul() -> @kernel.Thm {
  cong_lmul_c.get()
}

///|
/// CONG_RMUL
fn step_40() -> Unit raise {
  cong_rmul_c.set(
    @int.number_rule(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ a : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → op_eq_eq(x * a, y * a, mod(n))"),
    ),
  )
}

///|
let cong_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_RMUL")

///|
/// `CONG_RMUL`
pub fn cong_rmul() -> @kernel.Thm {
  cong_rmul_c.get()
}

///|
/// CONG_IMP_EQ
fn step_41() -> Unit raise {
  let t142 = @meson.asm_meson_tac(@list.List([@int.cong_v1(), @arith.mod_lt()]))
  let t141 = @simp.asm_rewrite_tac(@list.List([@arith.lt()]))
  let t140 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t143 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t140),
      t141,
    ),
    t142,
  )
  cong_imp_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, x < n && y < n && op_eq_eq(x, y, mod(n)) → x == y"),
      t143,
    ),
  )
}

///|
let cong_imp_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_IMP_EQ")

///|
/// `CONG_IMP_EQ`
pub fn cong_imp_eq() -> @kernel.Thm {
  cong_imp_eq_c.get()
}

///|
/// CONG_DIVIDES_MODULUS
fn step_42() -> Unit raise {
  cong_divides_modulus_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ m : Num, ∀ n : Num, op_eq_eq(x, y, mod(m)) && divides(n, m) → op_eq_eq(x, y, mod(n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_divides_modulus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_DIVIDES_MODULUS",
)

///|
/// `CONG_DIVIDES_MODULUS`
pub fn cong_divides_modulus() -> @kernel.Thm {
  cong_divides_modulus_c.get()
}

///|
/// CONG_0_DIVIDES
fn step_43() -> Unit raise {
  cong_0_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(x, 0, mod(n)) == divides(n, x)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_0_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_0_DIVIDES")

///|
/// `CONG_0_DIVIDES`
pub fn cong_0_divides() -> @kernel.Thm {
  cong_0_divides_c.get()
}

///|
/// CONG_1_DIVIDES
fn step_44() -> Unit raise {
  let t155 = @meson.asm_meson_tac(@list.List([@arith.mult_clauses()]))
  let t154 = @simp.asm_rewrite_tac(
    @list.List([@calc_num.arith(), @equal.gsym(@arith.left_sub_distrib())]),
  )
  let t153 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t150 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(x : Num) + (q1 : Num) == 1 + (q2 : Num) → !(x == 0) → x - 1 == q2 - q1"),
    ),
  )
  let t152 = @tactics.disch_then(fn(
    x151 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x147 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s148 = @tactics.mp_tac(x147)
      fn(
        x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s148(x149)
      }
    })(t150(x151))
  })
  let t146 = @tactics.repeat_tac(@tactics.gen_tac)
  let t145 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t144 = @simp.rewrite_tac(
    @list.List([@int.divides(), @int.cong(), nat_mod()]),
  )
  let t156 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t144),
              t145,
            ),
            t146,
          ),
          t152,
        ),
        t153,
      ),
      t154,
    ),
    t155,
  )
  cong_1_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(x, 1, mod(n)) → divides(n, x - 1)"),
      t156,
    ),
  )
}

///|
let cong_1_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_1_DIVIDES")

///|
/// `CONG_1_DIVIDES`
pub fn cong_1_divides() -> @kernel.Thm {
  cong_1_divides_c.get()
}

///|
/// CONG_1_DIVIDES_EQ
fn step_45() -> Unit raise {
  let t163 = @tactics.conv_tac(@int.number_rule)
  let t162 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t161 = @simp.once_rewrite_tac(@list.List([cong_sub_cases()]))
  let t164 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.once_rewrite_tac(@list.List([cong_sym()])), t161),
      t162,
    ),
    t163,
  )
  let t160 = @simp.rewrite_tac(
    @list.List([@int.divides_one(), @prime.divides_0()]),
  )
  let t159 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t165 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @int.number_rule(
              @term_syntax.parse_term("op_eq_eq(0, (a : Num), mod((n : Num))) == divides(n, a)"),
            ),
          ]),
        ),
        t159,
      ),
      t160,
    ),
    t164,
  ])
  let t158 = @simp.asm_rewrite_tac(@list.List([]))
  let t157 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t166 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t157),
      t158,
    ),
    t165,
  )
  cong_1_divides_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(x, 1, mod(n)) == ((x == 0 → n == 1) && divides(n, x - 1))"),
      t166,
    ),
  )
}

///|
let cong_1_divides_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_1_DIVIDES_EQ",
)

///|
/// `CONG_1_DIVIDES_EQ`
pub fn cong_1_divides_eq() -> @kernel.Thm {
  cong_1_divides_eq_c.get()
}

///|
/// CONG_DIVIDES
fn step_46() -> Unit raise {
  cong_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → divides(n, x) == divides(n, y)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_DIVIDES")

///|
/// `CONG_DIVIDES`
pub fn cong_divides() -> @kernel.Thm {
  cong_divides_c.get()
}

///|
/// CONG_COPRIME
fn step_47() -> Unit raise {
  cong_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → coprime((n, x)) == coprime((n, y))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_COPRIME")

///|
/// `CONG_COPRIME`
pub fn cong_coprime() -> @kernel.Thm {
  cong_coprime_c.get()
}

///|
/// CONG_GCD_RIGHT
fn step_48() -> Unit raise {
  cong_gcd_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → gcd((n, x)) == gcd((n, y))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_gcd_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_GCD_RIGHT")

///|
/// `CONG_GCD_RIGHT`
pub fn cong_gcd_right() -> @kernel.Thm {
  cong_gcd_right_c.get()
}

///|
/// CONG_GCD_LEFT
fn step_49() -> Unit raise {
  cong_gcd_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) → gcd((x, n)) == gcd((y, n))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_gcd_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_GCD_LEFT")

///|
/// `CONG_GCD_LEFT`
pub fn cong_gcd_left() -> @kernel.Thm {
  cong_gcd_left_c.get()
}

///|
/// CONG_MOD
fn step_50() -> Unit raise {
  let t205 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.add_clauses(),
      @arith.add_ac(),
      @arith.mult_ac(),
    ]),
  )
  let t203 = @term_syntax.parse_term("0")
  let t204 = @tactics.map_every(
    fn(
      x200 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s201 = @tactics.exists_tac(x200)
      fn(
        x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s201(x202)
      }
    },
    @list.List([@term_syntax.parse_term("DIV((a : Num), (n : Num))"), t203]),
  )
  let t199 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t198 = @tactics.disch_then(fn(
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
    let th = x189
    @simp.gen_rewrite_tac(
      fn(
        x197 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x191 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s192 = @equal.rator_conv(x191)
          fn(x193 : @kernel.Term) -> @kernel.Thm raise { s192(x193) }
        })(
          (fn(
            x194 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s195 = @equal.rand_conv(x194)
            fn(x196 : @kernel.Term) -> @kernel.Thm raise { s195(x196) }
          })(x197),
        )
      },
      @list.List([th]),
    )
  })
  let t188 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x182 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s183 = @tactics.mp_tac(x182)
        fn(
          x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s183(x184)
        }
      },
      fn(
        x185 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s186 = @tactics.assume_tac(x185)
        fn(
          x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s186(x187)
        }
      },
    ),
  )
  let t178 = @term_syntax.parse_term("(a : Num)")
  let t181 = @tactics.disch_then(fn(
    x180 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x175 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s176 = @tactics.mp_tac(x175)
      fn(
        x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s176(x177)
      }
    })(((x179 : @kernel.Thm) => @bool.spec(t178, x179))(x180))
  })
  let t172 = @drule.match_mp(@arith.division())
  let t174 = @tactics.first_assum(fn(
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
      let s170 = @tactics.mp_tac(x169)
      fn(
        x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s170(x171)
      }
    })(t172(x173))
  })
  let t168 = @simp.asm_rewrite_tac(@list.List([cong_refl(), @arith.mod_zero()]))
  let t167 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t206 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t167),
                  t168,
                ),
                t174,
              ),
              t181,
            ),
            t188,
          ),
          t198,
        ),
        t199,
      ),
      t204,
    ),
    t205,
  )
  cong_mod_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, op_eq_eq(MOD(a, n), a, mod(n))"), t206),
  )
}

///|
let cong_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD")

///|
/// `CONG_MOD`
pub fn cong_mod() -> @kernel.Thm {
  cong_mod_c.get()
}

///|
/// MOD_MULT_CONG
fn step_51() -> Unit raise {
  let t212 = @simp.asm_simp_tac(
    @list.List([
      cong_mod(),
      @arith.mult_eq_0(),
      @prime.divides_rmul(),
      @prime.divides_refl(),
    ]),
  )
  let t211 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (b : Num)"))
  let t210 = @tactics.match_mp_tac(cong_divides_modulus())
  let t209 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_eq(MOD((x : Num), (a : Num) * (b : Num)), x, mod(a))"),
    fn(
      x207 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x207
      @meson.meson_tac(@list.List([th, cong_trans(), cong_sym()]))
    },
  )
  let t213 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t209),
        t210,
      ),
      t211,
    ),
    t212,
  )
  mod_mult_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(MOD(x, a * b), y, mod(a)) == op_eq_eq(x, y, mod(a))"),
      t213,
    ),
  )
}

///|
let mod_mult_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_CONG")

///|
/// `MOD_MULT_CONG`
pub fn mod_mult_cong() -> @kernel.Thm {
  mod_mult_cong_c.get()
}

///|
/// CONG_MOD_LT
fn step_52() -> Unit raise {
  let t214 = @meson.meson_tac(
    @list.List([@arith.mod_lt(), @int.cong_v1(), @arith.lt()]),
  )
  cong_mod_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ y : Num, y < (n : Num) → (MOD((x : Num), n) == y) == op_eq_eq(x, y, mod(n))"),
      t214,
    ),
  )
}

///|
let cong_mod_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_LT")

///|
/// `CONG_MOD_LT`
pub fn cong_mod_lt() -> @kernel.Thm {
  cong_mod_lt_c.get()
}

///|
/// MOD_UNIQUE
fn step_53() -> Unit raise {
  let t219 = @meson.asm_meson_tac(
    @list.List([@arith.division(), @arith.mod_lt()]),
  )
  let t218 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t217 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.division_0()])),
    @tactics.all_tac,
  ])
  let t216 = @simp.asm_rewrite_tac(@list.List([cong_mod_0(), @arith.lt()]))
  let t215 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t220 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t215),
          t216,
        ),
        t217,
      ),
      t218,
    ),
    t219,
  )
  mod_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (MOD(m, n) == p) == ((n == 0 && m == p || p < n) && op_eq_eq(m, p, mod(n)))"),
      t220,
    ),
  )
}

///|
let mod_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_UNIQUE")

///|
/// `MOD_UNIQUE`
pub fn mod_unique() -> @kernel.Thm {
  mod_unique_c.get()
}

///|
/// CONG_DIV
fn step_54() -> Unit raise {
  let t221 = @meson.meson_tac(@list.List([@int.cong_div2(), @arith.div_mult()]))
  cong_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, ∀ b : Num, !(m == 0) && op_eq_eq(a, m * b, mod(m * n)) → op_eq_eq(DIV(a, m), b, mod(n))"),
      t221,
    ),
  )
}

///|
let cong_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_DIV")

///|
/// `CONG_DIV`
pub fn cong_div() -> @kernel.Thm {
  cong_div_c.get()
}

///|
/// CONG_DIV_COPRIME
fn step_55() -> Unit raise {
  let t230 = @tactics.conv_tac(@int.number_rule)
  let t229 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x226 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s227 = @tactics.mp_tac(x226)
      fn(
        x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s227(x228)
      }
    }),
  )
  let t225 = @tactics.match_mp_tac(cong_div())
  let t224 = @simp.asm_rewrite_tac(@list.List([]))
  let t223 = @simp.asm_simp_tac(@list.List([@prime.coprime_0(), cong_mod_1()]))
  let t222 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t231 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t222),
              t223,
            ),
            @tactics.strip_tac,
          ),
          t224,
        ),
        t225,
      ),
      t229,
    ),
    t230,
  )
  cong_div_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, ∀ b : Num, coprime((m, n)) && divides(m, a) && op_eq_eq(a, m * b, mod(n)) → op_eq_eq(DIV(a, m), b, mod(n))"),
      t231,
    ),
  )
}

///|
let cong_div_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_DIV_COPRIME",
)

///|
/// `CONG_DIV_COPRIME`
pub fn cong_div_coprime() -> @kernel.Thm {
  cong_div_coprime_c.get()
}

///|
/// CONG_SQUARE_1_PRIME_POWER
fn step_56() -> Unit raise {
  let t260 = @simp.asm_simp_tac(
    @list.List([@prime.divides_prime_prime(), @prime.prime_2()]),
  )
  let t259 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((x : Num) == 0) → x + 1 - (x - 1) == 2")),
    ]),
  )
  let t256 = @drule.match_mp(@prime.divides_sub())
  let t258 = @tactics.disch_then(fn(
    x257 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x253 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s254 = @tactics.mp_tac(x253)
      fn(
        x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s254(x255)
      }
    })(t256(x257))
  })
  let t252 = @simp.rewrite_tac(@list.List([@prime.divides_gcd()]))
  let t251 = @simp.once_rewrite_tac(@list.List([@prime.gcd_sym()]))
  let t250 = @simp.asm_rewrite_tac(@list.List([]))
  let t261 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(@prime.prime_divprod_pow_gen_eq()),
              t250,
            ),
            t251,
          ),
          t252,
        ),
        t258,
      ),
      t259,
    ),
    t260,
  )
  let t248 = @equal.gsym(@int.int_of_num_pow())
  let t249 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_add()), t248]),
  )
  let t247 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_sub()),
      @arith.exp_eq_0(),
      @arith.le_1(),
    ]),
  )
  let t246 = @equal.gsym(@int.int_of_num_mul())
  let t262 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@equal.gsym(@int.int_of_num_eq()), t246]),
          ),
          t247,
        ),
        t249,
      ),
      @int.int_arith_tac,
    ),
    t261,
  ])
  let t245 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP((x : Num), 2) - 1 == (x - 1) * (x + 1)"),
    fn(
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
      let s243 = @tactics.subst1_tac(x242)
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
    },
  )
  let t241 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.add_clauses(),
      @int.divides_one(),
      @arith.exp_eq_1(),
      @calc_num.arith(),
    ]),
  )
  let t240 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t239 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_eq_0(), @arith.exp_eq_1()]),
  )
  let t238 = @simp.asm_rewrite_tac(
    @list.List([cong_minus1(), cong_1_divides_eq()]),
  )
  let t237 = @simp.asm_rewrite_tac(@list.List([@prime.prime_1()]))
  let t236 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t235 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t234 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t233 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), cong_mod_1()]))
  let t232 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t263 = @tactics.thenl(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t232,
                          ),
                          t233,
                        ),
                        t234,
                      ),
                      t235,
                    ),
                    t236,
                  ),
                  t237,
                ),
                @tactics.strip_tac,
              ),
              t238,
            ),
            t239,
          ),
          t240,
        ),
        t241,
      ),
      t245,
    ),
    t262,
  )
  cong_square_1_prime_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, ∀ x : Num, prime(p) && !(p == 2) → op_eq_eq(EXP(x, 2), 1, mod(EXP(p, k))) == (op_eq_eq(x, 1, mod(EXP(p, k))) || op_eq_eq(x, EXP(p, k) - 1, mod(EXP(p, k))))"),
      t263,
    ),
  )
}

///|
let cong_square_1_prime_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_SQUARE_1_PRIME_POWER",
)

///|
/// `CONG_SQUARE_1_PRIME_POWER`
pub fn cong_square_1_prime_power() -> @kernel.Thm {
  cong_square_1_prime_power_c.get()
}

///|
/// CONG_LT
fn step_57() -> Unit raise {
  let t302 = @simp.rewrite_tac(
    @list.List([
      @int.int_of_num_add(),
      @int.int_of_num_mul(),
      @int.int_of_num_lt(),
    ]),
  )
  let t301 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
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
      let s299 = @tactics.subst1_tac(x298)
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
    }),
  )
  let t296 = @simp.gen_rewrite_rule(
    fn(
      x295 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x295
    },
    @list.List([@arith.le_exists()]),
  )
  let t303 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
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
            x292 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s293 = @tactics.mp_tac(x292)
            fn(
              x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s293(x294)
            }
          })(t296(x297))
        }),
        t301,
      ),
      t302,
    ),
    @int.arith_tac,
  )
  let t304 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @tactics.exists_tac(@term_syntax.parse_term("0")),
      ),
      @int.int_arith_tac,
    ),
    t303,
  ])
  let t291 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_mul_rzero(),
      @int.int_arith(@term_syntax.parse_term("(x : Int) - (x + (a : Int)) == -a")),
    ]),
  )
  let t290 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(m : Num) == 0 || 1 <= m")),
  )
  let t289 = @tactics.pop_assum(fn(
    x286 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s287 = @tactics.mp_tac(x286)
    fn(
      x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s287(x288)
    }
  })
  let t283 = @drule.match_mp(
    @int.int_arith(@term_syntax.parse_term("(x : Int) - (y : Int) == (n : Int) * -(m : Int) → y == x + n * m")),
  )
  let t285 = @tactics.first_x_assum(fn(
    x284 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x280 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s281 = @tactics.subst_all_tac(x280)
      fn(
        x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s281(x282)
      }
    })(t283(x284))
  })
  let t279 = @tactics.first_x_assum(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
      x276 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s277 = @tactics.subst_all_tac(x276)
      fn(
        x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s277(x278)
      }
    }),
  )
  let t275 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t274 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(d : Int)"), @int.int_image()),
  )
  let t271 = @term_syntax.parse_term("(d : Int)")
  let t273 = @tactics.disch_then((x272 : @kernel.Thm) => {
    @tactics.x_choose_tac(t271, x272)
  })
  let t270 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t269 = @tactics.repeat_tac(@tactics.strip_tac)
  let t268 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(@term_syntax.parse_term("((x : Int) == (m : Int) * (n : Int) + (y : Int)) == (x - y == n * m)")),
    ]),
  )
  let t267 = @simp.rewrite_tac(
    @list.List([@int.num_congruent(), @int.int_congruent()]),
  )
  let t264 = @equal.gsym(@int.int_of_num_mul())
  let t265 = @equal.gsym(@int.int_of_num_add())
  let t266 = @equal.gsym(@int.int_of_num_lt())
  let t305 = @tactics.thenl(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @simp.rewrite_tac(
                                @list.List([
                                  @equal.gsym(@int.int_of_num_eq()),
                                  t266,
                                  t265,
                                  t264,
                                ]),
                              ),
                              t267,
                            ),
                            t268,
                          ),
                          t269,
                        ),
                        @tactics.eq_tac,
                      ),
                      t270,
                    ),
                    t273,
                  ),
                  t274,
                ),
                t275,
              ),
              t279,
            ),
            t285,
          ),
          t289,
        ),
        t290,
      ),
      t291,
    ),
    t304,
  )
  cong_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, y < n → op_eq_eq(x, y, mod(n)) == (∃ d : Num, x == d * n + y)"),
      t305,
    ),
  )
}

///|
let cong_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_LT")

///|
/// `CONG_LT`
pub fn cong_lt() -> @kernel.Thm {
  cong_lt_c.get()
}

///|
/// CONG_LE
fn step_58() -> Unit raise {
  let t309 = @meson.meson_tac(@list.List([@arith.mult_sym()]))
  let t308 = @simp.rewrite_tac(@list.List([cong_0(), @int.divides()]))
  let t307 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(y : Num) <= (x : Num) → (x == (a : Num) + y) == (x - y == a)"),
      ),
    ]),
  )
  let t306 = @simp.once_rewrite_tac(@list.List([cong_sub_cases()]))
  let t310 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([cong_sym()])),
          t306,
        ),
        t307,
      ),
      t308,
    ),
    t309,
  )
  cong_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, y <= x → op_eq_eq(x, y, mod(n)) == (∃ q : Num, x == q * n + y)"),
      t310,
    ),
  )
}

///|
let cong_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_LE")

///|
/// `CONG_LE`
pub fn cong_le() -> @kernel.Thm {
  cong_le_c.get()
}

///|
/// CONG_TO_1
fn step_59() -> Unit raise {
  let t317 = @meson.asm_meson_tac(
    @list.List([
      cong_sym(),
      cong_0(),
      @int.divides_one(),
      @int.arith_rule(@term_syntax.parse_term("!(0 == 1 + (a : Num))")),
    ]),
  )
  let t316 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@arith.add_sym(), @arith.mult_sym()])),
  ])
  let t315 = @simp.asm_simp_tac(@list.List([cong_le()]))
  let t314 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) == 0 || !(a == 0) && 1 <= a")),
  )
  let t313 = @list.List([
    @meson.meson_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || n == 1 + (n - 1) * 1")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t312 = @simp.asm_rewrite_tac(@list.List([cong_mod_1()]))
  let t311 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t318 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t311),
              t312,
            ),
            t313,
          ),
          t314,
        ),
        t315,
      ),
      t316,
    ),
    t317,
  )
  cong_to_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, op_eq_eq(a, 1, mod(n)) == (a == 0 && n == 1 || (∃ m : Num, a == 1 + m * n))"),
      t318,
    ),
  )
}

///|
let cong_to_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_TO_1")

///|
/// `CONG_TO_1`
pub fn cong_to_1() -> @kernel.Thm {
  cong_to_1_c.get()
}

///|
/// EVEN_MOD_2
fn step_60() -> Unit raise {
  let t319 = @simp.simp_tac(
    @list.List([
      @arith.even_exists(),
      cong_lt(),
      @calc_num.arith(),
      @arith.add_clauses(),
      @arith.mult_ac(),
    ]),
  )
  even_mod_2_c.set(
    @tactics.prove(@term_syntax.parse_term("EVEN((n : Num)) == op_eq_eq(n, 0, mod(2))"), t319),
  )
}

///|
let even_mod_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_MOD_2")

///|
/// `EVEN_MOD_2`
pub fn even_mod_2() -> @kernel.Thm {
  even_mod_2_c.get()
}

///|
/// ODD_MOD_2
fn step_61() -> Unit raise {
  let t320 = @simp.simp_tac(
    @list.List([
      @arith.odd_exists(),
      cong_lt(),
      @calc_num.arith(),
      @arith.add_clauses(),
      @arith.add1(),
      @arith.mult_ac(),
    ]),
  )
  odd_mod_2_c.set(
    @tactics.prove(@term_syntax.parse_term("ODD((n : Num)) == op_eq_eq(n, 1, mod(2))"), t320),
  )
}

///|
let odd_mod_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_MOD_2")

///|
/// `ODD_MOD_2`
pub fn odd_mod_2() -> @kernel.Thm {
  odd_mod_2_c.get()
}

///|
/// CONG_CONV
fn step_62() -> Unit raise {
  let t321 = @simp.rewrite_tac(@list.List([cong_0_divides()]))
  let t322 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([cong_sub_cases()])),
    t321,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("op_eq_eq((x : Num), (y : Num), mod((n : Num))) == (if x <= y { divides(n, y - x) } else { divides(n, x - y) })"),
    t322,
  )
  let t327 = @equal.rand_conv(@calc_num.num_sub_conv)
  let t326 = @simp.gen_rewrite_conv(
    fn(
      x325 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x325
    },
    @list.List([@class.cond_clauses()]),
  )
  let t324 = @equal.rator_conv(@equal.land_conv(@calc_num.num_le_conv))
  cong_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @simp.gen_rewrite_conv(
              fn(
                x323 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x323
              },
              @list.List([pth]),
            ),
            t324,
          ),
          t326,
        ),
        t327,
      ),
      @prime.divides_conv,
    ),
  )
}

///|
let cong_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("CONG_CONV")

///|
/// `CONG_CONV`
pub fn cong_conv(x : @kernel.Term) -> @kernel.Thm raise {
  cong_conv_c.get()(x)
}

///|
/// CONG_SOLVE_EQ
fn step_63() -> Unit raise {
  let t353 = @tactics.conv_tac(@int.number_rule)
  let t352 = @tactics.pop_assum(fn(
    x349 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s350 = @tactics.mp_tac(x349)
    fn(
      x351 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s350(x351)
    }
  })
  let t348 = @tactics.exists_tac(@term_syntax.parse_term("(c : Num) * (x : Num)"))
  let t346 = @term_syntax.parse_term("(y : Num)")
  let t347 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Num)"), t346]),
  )
  let t345 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t342 = @drule.match_mp(@prime.bezout_gcd_strong())
  let t339 = @term_syntax.parse_term("(n : Num)")
  let t344 = @tactics.first_assum(fn(
    x343 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x341 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s337 = @tactics.mp_tac(x336)
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
      })(((x340 : @kernel.Thm) => @bool.spec(t339, x340))(x341))
    })(t342(x343))
  })
  let t335 = @tactics.disch_then(fn(
    x332 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s333 = @tactics.subst1_tac(x332)
    fn(
      x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s333(x334)
    }
  })
  let t331 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Num)"))
  let t330 = @list.List([
    @int.number_tac,
    @simp.rewrite_tac(
      @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
    ),
  ])
  let t329 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @prime.gcd_0()]),
  )
  let t328 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t354 = @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.gen_tac),
                              @tactics.eq_tac,
                            ),
                            @list.List([@int.number_tac, @tactics.all_tac]),
                          ),
                          t328,
                        ),
                        t329,
                      ),
                      t330,
                    ),
                    t331,
                  ),
                  t335,
                ),
                t344,
              ),
              t345,
            ),
            t347,
          ),
          @tactics.strip_tac,
        ),
        t348,
      ),
      t352,
    ),
    t353,
  )
  cong_solve_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, (∃ x : Num, op_eq_eq(a * x, b, mod(n))) == divides(gcd((a, n)), b)"),
      t354,
    ),
  )
}

///|
let cong_solve_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SOLVE_EQ")

///|
/// `CONG_SOLVE_EQ`
pub fn cong_solve_eq() -> @kernel.Thm {
  cong_solve_eq_c.get()
}

///|
/// CONG_SOLVE_LT_EQ
fn step_64() -> Unit raise {
  let t362 = @simp.asm_simp_tac(@list.List([@int.cong_rmod(), cong_refl()]))
  let t361 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((x : Num), (y : Num), mod((n : Num))) → op_eq_eq((a : Num) * x, (b : Num), mod(n)) → op_eq_eq(a * y, b, mod(n))"),
    ),
  )
  let t360 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t359 = @simp.asm_rewrite_tac(@list.List([]))
  let t358 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@arith.division()]),
      @term_syntax.parse_term("!((n : Num) == 0) && (∀ y : Num, (P : (Num) -> Bool)(y) → P(MOD(y, n))) → (∃ y : Num, y < n && P(y)) == (∃ y : Num, P(y))"),
    ),
  )
  let t357 = @simp.rewrite_tac(@list.List([@equal.gsym(cong_solve_eq())]))
  let t356 = @simp.asm_rewrite_tac(@list.List([@bool.conjunct1(@arith.lt())]))
  let t355 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t363 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t355),
                t356,
              ),
              t357,
            ),
            t358,
          ),
          t359,
        ),
        t360,
      ),
      t361,
    ),
    t362,
  )
  cong_solve_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, (∃ x : Num, x < n && op_eq_eq(a * x, b, mod(n))) == (!(n == 0) && divides(gcd((a, n)), b))"),
      t363,
    ),
  )
}

///|
let cong_solve_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_SOLVE_LT_EQ",
)

///|
/// `CONG_SOLVE_LT_EQ`
pub fn cong_solve_lt_eq() -> @kernel.Thm {
  cong_solve_lt_eq_c.get()
}

///|
/// CONG_SOLVE
fn step_65() -> Unit raise {
  let t364 = @tactics.conv_tac(@int.number_rule)
  let t365 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([cong_solve_eq()])),
    t364,
  )
  cong_solve_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, coprime((a, n)) → (∃ x : Num, op_eq_eq(a * x, b, mod(n)))"),
      t365,
    ),
  )
}

///|
let cong_solve_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SOLVE")

///|
/// `CONG_SOLVE`
pub fn cong_solve() -> @kernel.Thm {
  cong_solve_c.get()
}

///|
/// CONG_SOLVE_UNIQUE
fn step_66() -> Unit raise {
  let t390 = @meson.asm_meson_tac(@list.List([cong_trans(), cong_sym()]))
  let t389 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t388 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t387 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t386 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.mod_lt()])),
    @tactics.all_tac,
  ])
  let t385 = @tactics.exists_tac(@term_syntax.parse_term("MOD((y : Num), (n : Num))"))
  let t384 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t383 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t381 = @simp.asm_simp_tac(
    @list.List([@int.cong_v1(), @arith.mod_mod_refl()]),
  )
  let t380 = @simp.rewrite_tac(@list.List([cong_refl()]))
  let t379 = @tactics.match_mp_tac(cong_mult())
  let t378 = @simp.asm_rewrite_tac(@list.List([]))
  let t377 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (x : Num)"))
  let t376 = @tactics.match_mp_tac(cong_trans())
  let t382 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.asm_simp_tac(@list.List([@arith.division()])),
                t376,
              ),
              t377,
            ),
            t378,
          ),
          t379,
        ),
        t380,
      ),
      t381,
    ),
    @tactics.all_tac,
  ])
  let t375 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")),
  )
  let t374 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (n : Num))"))
  let t371 = @term_syntax.parse_term("(x : Num)")
  let t373 = @tactics.disch_then((x372 : @kernel.Thm) => {
    @tactics.x_choose_tac(t371, x372)
  })
  let t370 = @simp.asm_rewrite_tac(@list.List([]))
  let t367 = @term_syntax.parse_term("(n : Num)")
  let t368 = @term_syntax.parse_term("(b : Num)")
  let t369 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t368, t367]),
      cong_solve(),
    ),
  )
  let t366 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t391 = @tactics.then_tac(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t366,
                                      ),
                                      t369,
                                    ),
                                    t370,
                                  ),
                                  t373,
                                ),
                                t374,
                              ),
                              t375,
                            ),
                            @tactics.conj_tac,
                          ),
                          t382,
                        ),
                        @tactics.strip_tac,
                      ),
                      t383,
                    ),
                    @tactics.strip_tac,
                  ),
                  t384,
                ),
                t385,
              ),
              @tactics.conj_tac,
            ),
            t386,
          ),
          t387,
        ),
        t388,
      ),
      t389,
    ),
    t390,
  )
  cong_solve_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, coprime((a, n)) && !(n == 0) → existsunique((x : Num) => x < n && op_eq_eq(a * x, b, mod(n)))"),
      t391,
    ),
  )
}

///|
let cong_solve_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_SOLVE_UNIQUE",
)

///|
/// `CONG_SOLVE_UNIQUE`
pub fn cong_solve_unique() -> @kernel.Thm {
  cong_solve_unique_c.get()
}

///|
/// CONG_SOLVE_UNIQUE_NONTRIVIAL
fn step_67() -> Unit raise {
  let t422 = @meson.asm_meson_tac(
    @list.List([@prime.divides_refl(), @prime.prime_1(), @int.coprime()]),
  )
  let t421 = @simp.rewrite_tac(@list.List([cong_0()]))
  let t420 = @simp.once_rewrite_tac(@list.List([cong_sym()]))
  let t419 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → 0 < p"))]),
  )
  let t418 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t417 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t416 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(0 < (r : Num)) == !(r == 0)"))]),
  )
  let t415 = @simp.rewrite_tac(@list.List([]))
  let t414 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t413 = @simp.gen_rewrite_tac(
    fn(
      x412 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x412
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t411 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t409 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_sym(),
      @arith.not_lt(),
      @int.divides_le(),
      @arith.lt_refl(),
    ]),
  )
  let t408 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t407 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 1"))
  let t405 = @term_syntax.parse_term("(p : Num)")
  let t406 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Num)"), t405]),
      @prime.prime_coprime(),
    ),
  )
  let t404 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t410 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.conj_tac,
                @list.List([
                  @tactics.all_tac,
                  @meson.asm_meson_tac(@list.List([@prime.prime_0()])),
                ]),
              ),
              t404,
            ),
            t406,
          ),
          t407,
        ),
        t408,
      ),
      t409,
    ),
    @tactics.all_tac,
  ])
  let t401 = @term_syntax.parse_term("(p : Num)")
  let t402 = @term_syntax.parse_term("(a : Num)")
  let t403 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Num)"), t402, t401]),
      cong_solve_unique(),
    ),
  )
  let t399 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t400 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @int.arith_rule(@term_syntax.parse_term("(1 < (p : Num)) == (!(p == 0) && !(p == 1))")),
        ]),
      ),
      t399,
    ),
    @tactics.all_tac,
  ])
  let t398 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (p : Num)"), fn(
    x395 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s396 = @tactics.assume_tac(x395)
    fn(
      x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s396(x397)
    }
  })
  let t394 = @tactics.repeat_tac(@tactics.strip_tac)
  let t393 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t392 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t423 = @tactics.then_tac(
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
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.repeat_tac(@tactics.gen_tac),
                                          t392,
                                        ),
                                        t393,
                                      ),
                                      t394,
                                    ),
                                    t398,
                                  ),
                                  t400,
                                ),
                                t403,
                              ),
                              @tactics.ants_tac,
                            ),
                            t410,
                          ),
                          t411,
                        ),
                        @tactics.ap_term_tac,
                      ),
                      t413,
                    ),
                    t414,
                  ),
                  t415,
                ),
                t416,
              ),
              t417,
            ),
            t418,
          ),
          t419,
        ),
        t420,
      ),
      t421,
    ),
    t422,
  )
  cong_solve_unique_nontrivial_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, ∀ x : Num, prime(p) && coprime((p, a)) && 0 < x && x < p → existsunique((y : Num) => 0 < y && y < p && op_eq_eq(x * y, a, mod(p)))"),
      t423,
    ),
  )
}

///|
let cong_solve_unique_nontrivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_SOLVE_UNIQUE_NONTRIVIAL",
)

///|
/// `CONG_SOLVE_UNIQUE_NONTRIVIAL`
pub fn cong_solve_unique_nontrivial() -> @kernel.Thm {
  cong_solve_unique_nontrivial_c.get()
}

///|
/// CONG_UNIQUE_INVERSE_PRIME
fn step_68() -> Unit raise {
  let t426 = @meson.asm_meson_tac(
    @list.List([@prime.coprime_1(), @prime.coprime_sym()]),
  )
  let t425 = @simp.asm_rewrite_tac(@list.List([]))
  let t424 = @tactics.match_mp_tac(cong_solve_unique_nontrivial())
  let t427 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t424),
      t425,
    ),
    t426,
  )
  cong_unique_inverse_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ x : Num, prime(p) && 0 < x && x < p → existsunique((y : Num) => 0 < y && y < p && op_eq_eq(x * y, 1, mod(p)))"),
      t427,
    ),
  )
}

///|
let cong_unique_inverse_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_UNIQUE_INVERSE_PRIME",
)

///|
/// `CONG_UNIQUE_INVERSE_PRIME`
pub fn cong_unique_inverse_prime() -> @kernel.Thm {
  cong_unique_inverse_prime_c.get()
}

///|
/// COUNT_CONG_SOLVE_SIMPLE
fn step_69() -> Unit raise {
  let t446 = @simp.asm_simp_tac(
    @list.List([@arith.eq_add_rcancel(), @arith.eq_mult_rcancel()]),
  )
  let t445 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.has_size_numseg_lt()]),
  )
  let t447 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), t445),
    t446,
  )
  let t442 = @simp.asm_rewrite_tac(
    @list.List([@arith.mod_lt_eq(), @arith.le_mult_rcancel()]),
  )
  let t441 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(b : Num) < (n : Num) && ((i : Num) + 1) * n <= (m : Num) * n → i * n + b < m * n"),
    ),
  )
  let t440 = @simp.rewrite_tac(
    @list.List([
      @int.cong_lmod(),
      cong_refl(),
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((x : Num) * (n : Num) + (c : Num), (b : Num), mod(n)) == op_eq_eq(c, b, mod(n))"),
      ),
    ]),
  )
  let t443 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")),
            @tactics.disch_tac,
          ),
          t440,
        ),
        t441,
      ),
      t442,
    ),
    @int.asm_arith_tac,
  )
  let t439 = @meson.asm_meson_tac(@list.List([@arith.mult_sym()]))
  let t438 = @simp.asm_simp_tac(
    @list.List([@arith.rdiv_lt_eq(), @arith.division_simp()]),
  )
  let t437 = @tactics.exists_tac(@term_syntax.parse_term("DIV((x : Num), (n : Num))"))
  let t436 = @tactics.disch_then(fn(
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
    @tactics.strip_assume_tac(@equal.gsym(x435))
  })
  let t434 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t444 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")),
              t434,
            ),
            t436,
          ),
          t437,
        ),
        t438,
      ),
      t439,
    ),
    t443,
  ])
  let t433 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_image()]),
  )
  let t448 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @equal.gsym(@sets.subset_antisym_eq()),
              @sets.subset(),
              @sets.forall_in_image(),
            ]),
          ),
          t433,
        ),
        @tactics.conj_tac,
      ),
      t444,
    ),
    t447,
  ])
  let t432 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : Num) | x < (m : Num) * (n : Num) && op_eq_eq(x, (b : Num), mod(n))} == IMAGE((i : Num) => i * n + MOD(b, n), {(i : Num) | i < m})"),
    fn(
      x429 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s430 = @tactics.subst1_tac(x429)
      fn(
        x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s430(x431)
      }
    },
  )
  let t428 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.lt(),
      @sets.has_size_0(),
      @sets.empty_gspec(),
    ]),
  )
  let t449 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @class.cond_cases_tac,
        ),
        t428,
      ),
      t432,
    ),
    t448,
  )
  count_cong_solve_simple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ b : Num, HAS_SIZE({(x : Num) | x < m * n && op_eq_eq(x, b, mod(n))}, if n == 0 { 0 } else { m })"),
      t449,
    ),
  )
}

///|
let count_cong_solve_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_CONG_SOLVE_SIMPLE",
)

///|
/// `COUNT_CONG_SOLVE_SIMPLE`
pub fn count_cong_solve_simple() -> @kernel.Thm {
  count_cong_solve_simple_c.get()
}

///|
/// COUNT_CONG_SOLVE_GEN
fn step_70() -> Unit raise {
  let t495 = @meson.asm_meson_tac(@list.List([@arith.mult_clauses()]))
  let t494 = @simp.asm_rewrite_tac(@list.List([]))
  let t493 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        count_cong_solve_simple(),
      ),
    ]),
  )
  let t492 = @simp.rewrite_tac(
    @list.List([@arith.mult_assoc(), @sets.has_size()]),
  )
  let t491 = @simp.expand_tac("n")
  let t489 = @tactics.conv_tac(@int.number_rule)
  let t490 = @list.List([
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.pop_assum(fn(
          x486 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s487 = @tactics.mp_tac(x486)
          fn(
            x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s487(x488)
          }
        }),
      ),
      t489,
    ),
    @tactics.all_tac,
  ])
  let t485 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Num, op_eq_eq((a : Num) * x, a * (z : Num), mod((n : Num))) == op_eq_eq(x, z, mod((d : Num)))"),
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
      let th_1 = x483
      @simp.rewrite_tac(@list.List([th_1]))
    },
  )
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
      x478 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s479 = @tactics.assume_tac(x478)
      fn(
        x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s479(x480)
      }
    })(@equal.sym(x481))
  })
  let t477 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t476 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t475 = @tactics.mp_tac(
    @int.number_rule(@term_syntax.parse_term("divides(gcd(((n : Num), (a : Num))), n)")),
  )
  let t474 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t473 = @tactics.disch_then(fn(
    x471 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x471
    @simp.rewrite_tac(@list.List([@equal.sym(th)]))
  })
  let t470 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t469 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(fn(
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
      let s467 = @tactics.mp_tac(x466)
      fn(
        x468 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s467(x468)
      }
    }),
  )
  let t465 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.gcd_sym()])),
    @tactics.all_tac,
  ])
  let t464 = @tactics.disch_then(fn(
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
    (fn(
      x462 : (@kernel.Thm, @kernel.Thm),
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x458 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s459 = @tactics.mp_tac(x458)
        fn(
          x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s459(x460)
        }
      })(
        (fn(x461 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise { x461.1 })(
          x462,
        ),
      )
    })(@bool.eq_imp_rule(x463))
  })
  let t455 = @term_syntax.parse_term("(b : Num)")
  let t456 = @term_syntax.parse_term("(a : Num)")
  let t457 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t456, t455]),
      cong_solve_eq(),
    ),
  )
  let t453 = @meson.asm_meson_tac(
    @list.List([cong_solve_eq(), @prime.gcd_sym()]),
  )
  let t454 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.has_size_0(),
          @sets.set_rule(@term_syntax.parse_term("({(x : _) | (P : (_) -> Bool)(x)} == {}) == !(∃ x : _, P(x))")),
        ]),
      ),
      t453,
    ),
  ])
  let t452 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.lt(),
      @sets.empty_gspec(),
      @sets.has_size_0(),
      @arith.mult_clauses(),
      @class.cond_id(),
    ]),
  )
  let t450 = @term_syntax.parse_term("(n : Num) == 0")
  let t451 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t450]),
  )
  let t496 = @tactics.then_tac(
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
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.thenl(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t451,
                                              ),
                                              t452,
                                            ),
                                            @class.cond_cases_tac,
                                          ),
                                          t454,
                                        ),
                                        t457,
                                      ),
                                      t464,
                                    ),
                                    @tactics.ants_tac,
                                  ),
                                  t465,
                                ),
                                t469,
                              ),
                              t470,
                            ),
                            t473,
                          ),
                          t474,
                        ),
                        t475,
                      ),
                      t476,
                    ),
                    t477,
                  ),
                  t482,
                ),
                t485,
              ),
              t490,
            ),
            t491,
          ),
          t492,
        ),
        t493,
      ),
      t494,
    ),
    t495,
  )
  count_cong_solve_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, ∀ b : Num, HAS_SIZE({(x : Num) | x < m * n && op_eq_eq(a * x, b, mod(n))}, if !(n == 0) && divides(gcd((n, a)), b) { m * gcd((n, a)) } else { 0 })"),
      t496,
    ),
  )
}

///|
let count_cong_solve_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_CONG_SOLVE_GEN",
)

///|
/// `COUNT_CONG_SOLVE_GEN`
pub fn count_cong_solve_gen() -> @kernel.Thm {
  count_cong_solve_gen_c.get()
}

///|
/// COUNT_CONG_SOLVE
fn step_71() -> Unit raise {
  let t497 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_num.arith_eq()]),
  )
  let t498 = @tactics.then_tac(
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), count_cong_solve_gen())),
    t497,
  )
  count_cong_solve_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, HAS_SIZE({(x : Num) | x < n && op_eq_eq(a * x, b, mod(n))}, if !(n == 0) && divides(gcd((n, a)), b) { gcd((n, a)) } else { 0 })"),
      t498,
    ),
  )
}

///|
let count_cong_solve_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_CONG_SOLVE",
)

///|
/// `COUNT_CONG_SOLVE`
pub fn count_cong_solve() -> @kernel.Thm {
  count_cong_solve_c.get()
}

///|
/// CONG_CHINESE
fn step_72() -> Unit raise {
  let t499 = @meson.meson_tac(@list.List([cong_0(), @prime.divides_mul()]))
  let t500 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([cong_sub_cases()])),
    t499,
  )
  cong_chinese_c.set(
    @tactics.prove(
      @term_syntax.parse_term("coprime(((a : Num), (b : Num))) && op_eq_eq((x : Num), (y : Num), mod(a)) && op_eq_eq(x, y, mod(b)) → op_eq_eq(x, y, mod(a * b))"),
      t500,
    ),
  )
}

///|
let cong_chinese_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_CHINESE")

///|
/// `CONG_CHINESE`
pub fn cong_chinese() -> @kernel.Thm {
  cong_chinese_c.get()
}

///|
/// CHINESE_REMAINDER_UNIQUE
fn step_73() -> Unit raise {
  let t537 = @meson.asm_meson_tac(
    @list.List([cong_chinese(), cong_sym(), cong_trans()]),
  )
  let t536 = @simp.asm_rewrite_tac(@list.List([]))
  let t535 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (b : Num)"))
  let t534 = @tactics.match_mp_tac(cong_imp_eq())
  let t538 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t534),
        t535,
      ),
      t536,
    ),
    t537,
  )
  let t533 = @meson.meson_tac(@list.List([]))
  let t531 = @equal.gsym(@arith.left_add_distrib())
  let t532 = @simp.rewrite_tac(
    @list.List([@int.cong(), nat_mod(), @equal.gsym(@arith.add_assoc()), t531]),
  )
  let t530 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t529 = @simp.asm_simp_tac(@list.List([mod_mult_cong()]))
  let t527 = @tactics.first_x_assum(fn(
    x526 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x523 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s524 = @tactics.subst1_tac(x523)
      fn(
        x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s524(x525)
      }
    })(@bool.conjunct2(x526))
  })
  let t528 = @list.List([
    @tactics.first_x_assum(fn(
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
        x519 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s520 = @tactics.subst1_tac(x519)
        fn(
          x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s520(x521)
        }
      })(@bool.conjunct1(x522))
    }),
    t527,
  ])
  let t518 = @simp.gen_rewrite_tac(
    fn(
      x517 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x511 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s512 = @equal.rand_conv(x511)
        fn(x513 : @kernel.Term) -> @kernel.Thm raise { s512(x513) }
      })(
        (fn(
          x514 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s515 = @equal.once_depth_conv(x514)
          fn(x516 : @kernel.Term) -> @kernel.Thm raise { s515(x516) }
        })(x517),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t510 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.division(), @arith.mult_eq_0()])),
    @tactics.all_tac,
  ])
  let t509 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (a : Num) * (b : Num))"))
  let t506 = @term_syntax.parse_term("(q2 : Num)")
  let t507 = @term_syntax.parse_term("(q1 : Num)")
  let t508 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Num)"), t507, t506]),
  )
  let t505 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t502 = @term_syntax.parse_term("(n : Num)")
  let t503 = @term_syntax.parse_term("(m : Num)")
  let t504 = @term_syntax.parse_term("(b : Num)")
  let t539 = @list.List([
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.mp_tac(
                                @bool.specl(
                                  @list.List([
                                    @term_syntax.parse_term("(a : Num)"),
                                    t504,
                                    t503,
                                    t502,
                                  ]),
                                  @prime.chinese_remainder(),
                                ),
                              ),
                              t505,
                            ),
                            t508,
                          ),
                          @tactics.disch_tac,
                        ),
                        t509,
                      ),
                      @tactics.conj_tac,
                    ),
                    t510,
                  ),
                  t518,
                ),
                @tactics.conj_tac,
              ),
              t528,
            ),
            t529,
          ),
          t530,
        ),
        t532,
      ),
      t533,
    ),
    t538,
  ])
  let t501 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t540 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t501),
      @tactics.conj_tac,
    ),
    t539,
  )
  chinese_remainder_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ m : Num, ∀ n : Num, coprime((a, b)) && !(a == 0) && !(b == 0) → existsunique((x : Num) => x < a * b && op_eq_eq(x, m, mod(a)) && op_eq_eq(x, n, mod(b)))"),
      t540,
    ),
  )
}

///|
let chinese_remainder_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER_UNIQUE",
)

///|
/// `CHINESE_REMAINDER_UNIQUE`
pub fn chinese_remainder_unique() -> @kernel.Thm {
  chinese_remainder_unique_c.get()
}

///|
/// CHINESE_REMAINDER_COPRIME_UNIQUE
fn step_74() -> Unit raise {
  let t548 = @meson.asm_meson_tac(
    @list.List([cong_coprime(), @prime.coprime_sym(), @prime.coprime_mul()]),
  )
  let t547 = @simp.asm_simp_tac(@list.List([chinese_remainder_unique()]))
  let t546 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → (Q : (_) -> Bool)(x)) → existsunique((x : _) => P(x)) → existsunique((x : _) => Q(x) && P(x))"),
    ),
  )
  let t545 = @simp.asm_rewrite_tac(@list.List([]))
  let t541 = @term_syntax.parse_term("(n : Num)")
  let t542 = @term_syntax.parse_term("(m : Num)")
  let t543 = @term_syntax.parse_term("(b : Num)")
  let t544 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t543, t542, t541]),
      chinese_remainder_unique(),
    ),
  )
  let t549 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t544),
          t545,
        ),
        t546,
      ),
      t547,
    ),
    t548,
  )
  chinese_remainder_coprime_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ m : Num, ∀ n : Num, coprime((a, b)) && !(a == 0) && !(b == 0) && coprime((m, a)) && coprime((n, b)) → existsunique((x : Num) => coprime((x, a * b)) && x < a * b && op_eq_eq(x, m, mod(a)) && op_eq_eq(x, n, mod(b)))"),
      t549,
    ),
  )
}

///|
let chinese_remainder_coprime_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER_COPRIME_UNIQUE",
)

///|
/// `CHINESE_REMAINDER_COPRIME_UNIQUE`
pub fn chinese_remainder_coprime_unique() -> @kernel.Thm {
  chinese_remainder_coprime_unique_c.get()
}

///|
/// CHINESE_REMAINDER_USUAL
fn step_75() -> Unit raise {
  let t564 = @tactics.conv_tac(@int.number_rule)
  let t563 = @simp.simp_tac(@list.List([]))
  let t562 = @tactics.match_mp_tac(@theorems.mono_and())
  let t561 = @tactics.repeat_tac(@tactics.gen_tac)
  let t560 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t559 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t558 = @simp.asm_rewrite_tac(@list.List([]))
  let t554 = @term_syntax.parse_term("(v : Num)")
  let t555 = @term_syntax.parse_term("(u : Num)")
  let t556 = @term_syntax.parse_term("(b : Num)")
  let t557 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t556, t555, t554]),
      @prime.chinese_remainder(),
    ),
  )
  let t553 = @simp.asm_simp_tac(
    @list.List([
      cong_mod_1(),
      @prime.coprime_0(),
      cong_mod_0(),
      @theorems.exists_refl(),
    ]),
  )
  let t552 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == 0"))
  let t551 = @simp.asm_simp_tac(
    @list.List([
      cong_mod_1(),
      @prime.coprime_0(),
      cong_mod_0(),
      @theorems.exists_refl(),
    ]),
  )
  let t550 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t565 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t550,
                          ),
                          t551,
                        ),
                        t552,
                      ),
                      t553,
                    ),
                    @tactics.disch_tac,
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
        ),
        t562,
      ),
      t563,
    ),
    t564,
  )
  chinese_remainder_usual_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ u : Num, ∀ v : Num, coprime((a, b)) → (∃ x : Num, op_eq_eq(x, u, mod(a)) && op_eq_eq(x, v, mod(b)))"),
      t565,
    ),
  )
}

///|
let chinese_remainder_usual_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER_USUAL",
)

///|
/// `CHINESE_REMAINDER_USUAL`
pub fn chinese_remainder_usual() -> @kernel.Thm {
  chinese_remainder_usual_c.get()
}

///|
/// CONG_CHINESE_EQ
fn step_76() -> Unit raise {
  cong_chinese_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ x : Num, ∀ y : Num, coprime((a, b)) → op_eq_eq(x, y, mod(a * b)) == (op_eq_eq(x, y, mod(a)) && op_eq_eq(x, y, mod(b)))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_chinese_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_CHINESE_EQ",
)

///|
/// `CONG_CHINESE_EQ`
pub fn cong_chinese_eq() -> @kernel.Thm {
  cong_chinese_eq_c.get()
}

///|
/// CHINESE_REMAINDER_COUNT
fn step_77() -> Unit raise {
  let t610 = @meson.asm_meson_tac(
    @list.List([@arith.mod_lt(), @arith.mod_lt_eq(), @int.cong_v1()]),
  )
  let t609 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((a : Num), (b : Num))) → op_eq_eq((x : Num), (y : Num), mod(a * b)) == (op_eq_eq(x, y, mod(a)) && op_eq_eq(x, y, mod(b)))"),
      ),
    ]),
  )
  let t608 = @simp.asm_rewrite_tac(@list.List([]))
  let t607 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (b : Num)"))
  let t606 = @tactics.match_mp_tac(cong_imp_eq())
  let t605 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@arith.mod_lt(), @arith.mod_lt_eq()])),
  ])
  let t603 = @term_syntax.parse_term("MOD((x : Num), (b : Num))")
  let t604 = @tactics.map_every(
    fn(
      x600 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s601 = @tactics.exists_tac(x600)
      fn(
        x602 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s601(x602)
      }
    },
    @list.List([@term_syntax.parse_term("MOD((x : Num), (a : Num))"), t603]),
  )
  let t599 = @tactics.repeat_tac(@tactics.strip_tac)
  let t598 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj()]))
  let t611 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")),
                      t598,
                    ),
                    t599,
                  ),
                  t604,
                ),
                @tactics.conj_tac,
              ),
              t605,
            ),
            t606,
          ),
          t607,
        ),
        t608,
      ),
      t609,
    ),
    t610,
  )
  let t597 = @simp.asm_simp_tac(@list.List([@arith.mod_lt()]))
  let t612 = @tactics.then_tac(
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@int.cong_v1()]))),
    t597,
  )
  let t613 = @list.List([
    @meson.asm_meson_tac(@list.List([cong_imp_eq(), cong_sym(), cong_trans()])),
    t612,
    t611,
  ])
  let t596 = @tactics.repeat_tac(@tactics.conj_tac)
  let t595 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @pair.pair_eq()]),
  )
  let t594 = @simp.rewrite_tac(
    @list.List([@pair.exists_pair_thm(), @sets.in_image(), @sets.in_cross()]),
  )
  let t593 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_cross(), @sets.in_elim_thm()]),
  )
  let t592 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@sets.subset_antisym_eq()),
      @sets.subset(),
      @sets.forall_in_image(),
    ]),
  )
  let t591 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (m, n) => (f : (Num, Num) -> Num)(m, n) }"),
  )
  let t590 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@sets.has_size_image_inj_eq()]),
      @term_syntax.parse_term("∀ f : (_) -> _, (∀ x : _, ∀ y : _, IN(x, (s : (_) -> Bool)) && IN(y, s) && f(x) == f(y) → x == y) && IMAGE(f, s) == (t : (_) -> Bool) → HAS_SIZE(s, (p : Num)) → HAS_SIZE(t, p)"),
    ),
  )
  let t586 = @term_syntax.parse_term("(f : (Num, Num) -> Num)")
  let t589 = @tactics.disch_then(fn(
    x588 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    ((x587 : @kernel.Thm) => @tactics.x_choose_tac(t586, x587))(
      @bool.existence(x588),
    )
  })
  let t585 = @simp.asm_rewrite_tac(@list.List([@class.unique_skolem_thm()]))
  let t583 = @term_syntax.parse_term("(b : Num)")
  let t584 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t583]),
      chinese_remainder_unique(),
    ),
  )
  let t582 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @arith.lt(),
        @sets.empty_gspec(),
        @sets.cross_empty(),
        @arith.mult_clauses(),
        @sets.has_size(),
        @sets.card_clauses(),
        @sets.finite_empty(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t581 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == 0"))
  let t580 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @arith.lt(),
        @sets.empty_gspec(),
        @sets.cross_empty(),
        @arith.mult_clauses(),
        @sets.has_size(),
        @sets.card_clauses(),
        @sets.finite_empty(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t579 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t576 = @drule.match_mp(@sets.has_size_cross())
  let t578 = @tactics.disch_then(fn(
    x577 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x573 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s574 = @tactics.mp_tac(x573)
      fn(
        x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s574(x575)
      }
    })(t576(x577))
  })
  let t572 = @tactics.replicate_tac(
    2,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x566 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s567 = @tactics.assume_tac(x566)
          fn(
            x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s567(x568)
          }
        },
        fn(
          x569 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s570 = @tactics.mp_tac(x569)
          fn(
            x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s570(x571)
          }
        },
      ),
    ),
  )
  let t614 = @tactics.thenl(
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.repeat_tac(@tactics.gen_tac),
                                    t572,
                                  ),
                                  t578,
                                ),
                                t579,
                              ),
                              t580,
                            ),
                            t581,
                          ),
                          t582,
                        ),
                        t584,
                      ),
                      t585,
                    ),
                    t589,
                  ),
                  t590,
                ),
                t591,
              ),
              t592,
            ),
            t593,
          ),
          t594,
        ),
        t595,
      ),
      t596,
    ),
    t613,
  )
  chinese_remainder_count_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, ∀ R : (Num) -> Bool, ∀ a : Num, ∀ b : Num, ∀ m : Num, ∀ n : Num, coprime((a, b)) && (∀ x : Num, x < a * b → R(x) == (P(MOD(x, a)) && Q(MOD(x, b)))) && HAS_SIZE({(x : Num) | x < a && P(x)}, m) && HAS_SIZE({(x : Num) | x < b && Q(x)}, n) → HAS_SIZE({(x : Num) | x < a * b && R(x)}, m * n)"),
      t614,
    ),
  )
}

///|
let chinese_remainder_count_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER_COUNT",
)

///|
/// `CHINESE_REMAINDER_COUNT`
pub fn chinese_remainder_count() -> @kernel.Thm {
  chinese_remainder_count_c.get()
}

///|
/// CHINESE_REMAINDER_COPRIME_COUNT
fn step_78() -> Unit raise {
  let t619 = @meson.meson_tac(@list.List([]))
  let t618 = @simp.asm_simp_tac(
    @list.List([
      @int.coprime_rmod(),
      @int.number_rule(
        @term_syntax.parse_term("coprime(((a : Num), (b : Num))) → coprime((a * b, (x : Num))) == (coprime((a, x)) && coprime((b, x)))"),
      ),
    ]),
  )
  let t617 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => coprime(((b : Num), x)) && (Q : (Num) -> Bool)(x)"),
  )
  let t616 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => coprime(((a : Num), x)) && (P : (Num) -> Bool)(x)"),
  )
  let t615 = @tactics.match_mp_tac(chinese_remainder_count())
  let t620 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t615),
          t616,
        ),
        t617,
      ),
      t618,
    ),
    t619,
  )
  chinese_remainder_coprime_count_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, ∀ R : (Num) -> Bool, ∀ a : Num, ∀ b : Num, ∀ m : Num, ∀ n : Num, coprime((a, b)) && (∀ x : Num, x < a * b → R(x) == (P(MOD(x, a)) && Q(MOD(x, b)))) && HAS_SIZE({(x : Num) | x < a && coprime((a, x)) && P(x)}, m) && HAS_SIZE({(x : Num) | x < b && coprime((b, x)) && Q(x)}, n) → HAS_SIZE({(x : Num) | x < a * b && coprime((a * b, x)) && R(x)}, m * n)"),
      t620,
    ),
  )
}

///|
let chinese_remainder_coprime_count_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER_COPRIME_COUNT",
)

///|
/// `CHINESE_REMAINDER_COPRIME_COUNT`
pub fn chinese_remainder_coprime_count() -> @kernel.Thm {
  chinese_remainder_coprime_count_c.get()
}

///|
/// COUNT_ROOTS_MODULO_COPRIME
fn step_79() -> Unit raise {
  let t625 = @simp.rewrite_tac(
    @list.List([@int.cong_v1(), @arith.mod_exp_mod()]),
  )
  let t624 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((a : Num), (b : Num))) → op_eq_eq((x : Num), (y : Num), mod(a * b)) == (op_eq_eq(x, y, mod(a)) && op_eq_eq(x, y, mod(b)))"),
      ),
    ]),
  )
  let t623 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => op_eq_eq(EXP(x, (k : Num)), 1, mod((b : Num)))"),
  )
  let t622 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => op_eq_eq(EXP(x, (k : Num)), 1, mod((a : Num)))"),
  )
  let t621 = @tactics.match_mp_tac(chinese_remainder_count())
  let t626 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t621),
          t622,
        ),
        t623,
      ),
      t624,
    ),
    t625,
  )
  count_roots_modulo_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ k : Num, ∀ m : Num, ∀ n : Num, coprime((a, b)) && HAS_SIZE({(x : Num) | x < a && op_eq_eq(EXP(x, k), 1, mod(a))}, m) && HAS_SIZE({(x : Num) | x < b && op_eq_eq(EXP(x, k), 1, mod(b))}, n) → HAS_SIZE({(x : Num) | x < a * b && op_eq_eq(EXP(x, k), 1, mod(a * b))}, m * n)"),
      t626,
    ),
  )
}

///|
let count_roots_modulo_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_COPRIME",
)

///|
/// `COUNT_ROOTS_MODULO_COPRIME`
pub fn count_roots_modulo_coprime() -> @kernel.Thm {
  count_roots_modulo_coprime_c.get()
}

///|
/// inverse_mod
fn step_80() -> Unit raise {
  inverse_mod_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(inverse_mod : (Num, Num) -> Num)((n : Num), (x : Num)) == (if n <= 1 { 1 } else { select((y : Num) => y < n && op_eq_eq(x * y, gcd((n, x)), mod(n))) })"),
    ),
  )
}

///|
let inverse_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inverse_mod")

///|
/// `inverse_mod`
pub fn inverse_mod() -> @kernel.Thm {
  inverse_mod_c.get()
}

///|
let inverse_mod_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_BOUND",
)

///|
/// `INVERSE_MOD_BOUND`
pub fn inverse_mod_bound() -> @kernel.Thm {
  inverse_mod_bound_c.get()
}

///|
let inverse_mod_rmul_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_RMUL_GEN",
)

///|
/// `INVERSE_MOD_RMUL_GEN`
pub fn inverse_mod_rmul_gen() -> @kernel.Thm {
  inverse_mod_rmul_gen_c.get()
}

///|
/// INVERSE_MOD_BOUND, INVERSE_MOD_RMUL_GEN
fn step_81() -> Unit raise {
  let t639 = @simp.rewrite_tac(
    @list.List([@prime.gcd_sym(), @prime.divides_refl()]),
  )
  let t638 = @simp.asm_rewrite_tac(@list.List([cong_solve_lt_eq()]))
  let t637 = @tactics.conv_tac(@class.select_conv)
  let t640 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(
            @list.List([
              @int.arith_rule(@term_syntax.parse_term("(2 <= (n : Num)) == !(n <= 1)")),
            ]),
          ),
          t637,
        ),
        t638,
      ),
      t639,
    ),
    @int.asm_arith_tac,
  )
  let t636 = @simp.rewrite_tac(
    @list.List([
      cong_mod_0(),
      cong_mod_1(),
      @prime.gcd_0(),
      @arith.mult_clauses(),
    ]),
  )
  let t635 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t634 = @simp.asm_rewrite_tac(@list.List([]))
  let t632 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(n : Num) <= 1 → n == 0 || n == 1")),
  )
  let t641 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x633 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            @tactics.disj_cases_tac(t632(x633))
          }),
          t634,
        ),
        t635,
      ),
      t636,
    ),
    t640,
  ])
  let t631 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) <= 1"))
  let t629 = @term_syntax.parse_term("(x : Num)")
  let t630 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t629]),
  )
  let t628 = @simp.rewrite_tac(@list.List([inverse_mod()]))
  let t642 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
          t628,
        ),
        t630,
      ),
      t631,
    ),
    t641,
  )
  let t643 = (
    @term_syntax.parse_term("(∀ n : Num, ∀ x : Num, (inverse_mod(n, x) < n) == (2 <= n)) && (∀ n : Num, ∀ x : Num, op_eq_eq(x * inverse_mod(n, x), gcd((n, x)), mod(n)))"),
    t642,
  )
  let (inverse_mod_bound, inverse_mod_rmul_gen) = @bool.conj_pair(
    (fn(
      x627 : (
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
      @tactics.prove(x627.0, x627.1)
    })(t643),
  )
  inverse_mod_bound_c.set(inverse_mod_bound)
  inverse_mod_rmul_gen_c.set(inverse_mod_rmul_gen)
}

///|
/// INVERSE_MOD_LMUL_GEN
fn step_82() -> Unit raise {
  let t644 = @simp.rewrite_tac(@list.List([inverse_mod_rmul_gen()]))
  let t645 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
    t644,
  )
  inverse_mod_lmul_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(inverse_mod(n, x) * x, gcd((n, x)), mod(n))"),
      t645,
    ),
  )
}

///|
let inverse_mod_lmul_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_LMUL_GEN",
)

///|
/// `INVERSE_MOD_LMUL_GEN`
pub fn inverse_mod_lmul_gen() -> @kernel.Thm {
  inverse_mod_lmul_gen_c.get()
}

///|
/// INVERSE_MOD_RMUL_EQ
fn step_83() -> Unit raise {
  let t652 = @simp.rewrite_tac(@list.List([inverse_mod_rmul_gen()]))
  let t651 = @tactics.disch_then(fn(
    x650 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x647 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s648 = @tactics.subst1_tac(x647)
      fn(
        x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s648(x649)
      }
    })(@equal.sym(x650))
  })
  let t646 = @simp.rewrite_tac(@list.List([@prime.coprime_gcd()]))
  let t653 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          @list.List([@int.number_tac, @tactics.all_tac]),
        ),
        t646,
      ),
      t651,
    ),
    t652,
  )
  inverse_mod_rmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(x * inverse_mod(n, x), 1, mod(n)) == coprime((n, x))"),
      t653,
    ),
  )
}

///|
let inverse_mod_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_RMUL_EQ",
)

///|
/// `INVERSE_MOD_RMUL_EQ`
pub fn inverse_mod_rmul_eq() -> @kernel.Thm {
  inverse_mod_rmul_eq_c.get()
}

///|
/// INVERSE_MOD_LMUL_EQ
fn step_84() -> Unit raise {
  let t654 = @simp.rewrite_tac(@list.List([inverse_mod_rmul_eq()]))
  let t655 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
    t654,
  )
  inverse_mod_lmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, op_eq_eq(inverse_mod(n, x) * x, 1, mod(n)) == coprime((n, x))"),
      t655,
    ),
  )
}

///|
let inverse_mod_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_LMUL_EQ",
)

///|
/// `INVERSE_MOD_LMUL_EQ`
pub fn inverse_mod_lmul_eq() -> @kernel.Thm {
  inverse_mod_lmul_eq_c.get()
}

///|
/// INVERSE_MOD_LMUL
fn step_85() -> Unit raise {
  let t656 = @simp.rewrite_tac(@list.List([inverse_mod_lmul_eq()]))
  inverse_mod_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, coprime((n, x)) → op_eq_eq(inverse_mod(n, x) * x, 1, mod(n))"),
      t656,
    ),
  )
}

///|
let inverse_mod_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_LMUL",
)

///|
/// `INVERSE_MOD_LMUL`
pub fn inverse_mod_lmul() -> @kernel.Thm {
  inverse_mod_lmul_c.get()
}

///|
/// INVERSE_MOD_RMUL
fn step_86() -> Unit raise {
  let t657 = @simp.rewrite_tac(@list.List([inverse_mod_rmul_eq()]))
  inverse_mod_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, coprime((n, x)) → op_eq_eq(x * inverse_mod(n, x), 1, mod(n))"),
      t657,
    ),
  )
}

///|
let inverse_mod_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_RMUL",
)

///|
/// `INVERSE_MOD_RMUL`
pub fn inverse_mod_rmul() -> @kernel.Thm {
  inverse_mod_rmul_c.get()
}

///|
/// INVERSE_MOD_UNIQUE
fn step_87() -> Unit raise {
  let t679 = @tactics.conv_tac(@int.number_rule)
  let t678 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((a : Num) * (x : Num), 1, mod((n : Num)))"))
  let t677 = @simp.asm_rewrite_tac(@list.List([inverse_mod_rmul_eq()]))
  let t676 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a : Num) * (x : Num), 1, mod((n : Num))) && op_eq_eq(a * (y : Num), 1, mod(n)) → op_eq_eq(x, y, mod(n))"),
    ),
  )
  let t675 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([@int.asm_arith_tac, @tactics.all_tac]),
    ),
  )
  let t674 = @simp.asm_rewrite_tac(@list.List([inverse_mod_bound()]))
  let t673 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t672 = @tactics.match_mp_tac(cong_imp_eq())
  let t671 = @simp.asm_rewrite_tac(@list.List([]))
  let t668 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("!((n : Num) == 1 && (x : Num) == 0) → !(x == n) && x <= n → !(n == 1)"),
    ),
  )
  let t670 = @tactics.first_x_assum(fn(
    x669 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x665 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s666 = @tactics.mp_tac(x665)
      fn(
        x667 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s666(x667)
      }
    })(t668(x669))
  })
  let t663 = @tactics.repeat_tac(@tactics.strip_tac)
  let t662 = @simp.simp_tac(@list.List([inverse_mod(), @arith.le_refl()]))
  let t661 = @simp.rewrite_tac(@list.List([@int.divides_one()]))
  let t664 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            @int.number_rule(
              @term_syntax.parse_term("op_eq_eq((a : Num) * (n : Num), (z : Num), mod(n)) == divides(n, z)"),
            ),
          ]),
        ),
        t661,
      ),
      t662,
    ),
    t663,
  ])
  let t660 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (n : Num)"))
  let t659 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([cong_mod_0(), @arith.mult_eq_1()])),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t658 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t680 = @tactics.then_tac(
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.repeat_tac(@tactics.gen_tac),
                                t658,
                              ),
                              t659,
                            ),
                            t660,
                          ),
                          t664,
                        ),
                        t670,
                      ),
                      t671,
                    ),
                    @tactics.disch_tac,
                  ),
                  t672,
                ),
                t673,
              ),
              t674,
            ),
            t675,
          ),
          t676,
        ),
        t677,
      ),
      t678,
    ),
    t679,
  )
  inverse_mod_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ x : Num, op_eq_eq(a * x, 1, mod(n)) && x <= n && !(n == 1 && x == 0) → inverse_mod(n, a) == x"),
      t680,
    ),
  )
}

///|
let inverse_mod_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_UNIQUE",
)

///|
/// `INVERSE_MOD_UNIQUE`
pub fn inverse_mod_unique() -> @kernel.Thm {
  inverse_mod_unique_c.get()
}

///|
/// INVERSE_MOD_1
fn step_88() -> Unit raise {
  let t683 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) <= 1) → 1 <= n")),
      @calc_num.arith_eq(),
    ]),
  )
  let t681 = @tactics.match_mp_tac(inverse_mod_unique())
  let t682 = @list.List([
    @simp.asm_rewrite_tac(@list.List([inverse_mod()])),
    t681,
  ])
  let t684 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.gen_tac,
          @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) <= 1")),
        ),
        t682,
      ),
      t683,
    ),
    @int.number_tac,
  )
  inverse_mod_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, inverse_mod(n, 1) == 1"), t684),
  )
}

///|
let inverse_mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_MOD_1")

///|
/// `INVERSE_MOD_1`
pub fn inverse_mod_1() -> @kernel.Thm {
  inverse_mod_1_c.get()
}

///|
/// INVERSE_MOD_CONG
fn step_89() -> Unit raise {
  let t694 = @tactics.conv_tac(@int.number_rule)
  let t693 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((x : Num), (y : Num), mod((n : Num)))"))
  let t690 = @drule.match_mp(cong_gcd_right())
  let t692 = @tactics.first_assum(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x687 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s688 = @tactics.subst1_tac(x687)
      fn(
        x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s688(x689)
      }
    })(t690(x691))
  })
  let t686 = @simp.asm_rewrite_tac(@list.List([]))
  let t685 = @simp.rewrite_tac(@list.List([inverse_mod()]))
  let t695 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t685,
                  ),
                  @class.cond_cases_tac,
                ),
                t686,
              ),
              t692,
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.abs_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t693,
    ),
    t694,
  )
  inverse_mod_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(n)) → inverse_mod(n, x) == inverse_mod(n, y)"),
      t695,
    ),
  )
}

///|
let inverse_mod_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_CONG",
)

///|
/// `INVERSE_MOD_CONG`
pub fn inverse_mod_cong() -> @kernel.Thm {
  inverse_mod_cong_c.get()
}

///|
/// INVERSE_MOD_INVERSE_MOD_CONG
fn step_90() -> Unit raise {
  let t702 = @tactics.conv_tac(@int.number_rule)
  let t703 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x699 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s700 = @equal.rand_conv(x699)
        fn(x701 : @kernel.Term) -> @kernel.Thm raise { s700(x701) }
      },
      @list.List([inverse_mod_rmul_eq()]),
    ),
    t702,
  )
  let t704 = @list.List([
    @simp.asm_rewrite_tac(@list.List([inverse_mod_rmul_eq()])),
    t703,
  ])
  let t698 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t697 = @tactics.exists_tac(@term_syntax.parse_term("inverse_mod((n : Num), (x : Num))"))
  let t696 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("∀ x' : Num, op_eq_eq((x : Num) * x', 1, mod((n : Num))) && op_eq_eq(x' * (x'' : Num), 1, mod(n)) → op_eq_eq(x'', x, mod(n))"),
    ),
  )
  let t705 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t696),
          t697,
        ),
        t698,
      ),
      @tactics.conj_tac,
    ),
    t704,
  )
  inverse_mod_inverse_mod_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, coprime((n, x)) → op_eq_eq(inverse_mod(n, inverse_mod(n, x)), x, mod(n))"),
      t705,
    ),
  )
}

///|
let inverse_mod_inverse_mod_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_INVERSE_MOD_CONG",
)

///|
/// `INVERSE_MOD_INVERSE_MOD_CONG`
pub fn inverse_mod_inverse_mod_cong() -> @kernel.Thm {
  inverse_mod_inverse_mod_cong_c.get()
}

///|
/// INVERSE_MOD_INVERSE_MOD
fn step_91() -> Unit raise {
  let t707 = @simp.asm_simp_tac(
    @list.List([inverse_mod_lmul_eq(), @arith.le_1()]),
  )
  let t706 = @tactics.match_mp_tac(inverse_mod_unique())
  let t708 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t706),
    t707,
  )
  inverse_mod_inverse_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, coprime((n, x)) && 1 <= x && x <= n → inverse_mod(n, inverse_mod(n, x)) == x"),
      t708,
    ),
  )
}

///|
let inverse_mod_inverse_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_INVERSE_MOD",
)

///|
/// `INVERSE_MOD_INVERSE_MOD`
pub fn inverse_mod_inverse_mod() -> @kernel.Thm {
  inverse_mod_inverse_mod_c.get()
}

///|
/// INVERSE_MOD_NONZERO_ALT
fn step_92() -> Unit raise {
  let t713 = @simp.simp_tac(@list.List([@prime.divides_gcd()]))
  let t712 = @simp.asm_rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((a : Num) * 0, (b : Num), mod((n : Num))) == divides(n, b)"),
      ),
    ]),
  )
  let t710 = @term_syntax.parse_term("(a : Num)")
  let t711 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t710]),
      inverse_mod_rmul_gen(),
    ),
  )
  let t709 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t714 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t709),
          @tactics.disch_tac,
        ),
        t711,
      ),
      t712,
    ),
    t713,
  )
  inverse_mod_nonzero_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, !divides(n, a) → !(inverse_mod(n, a) == 0)"),
      t714,
    ),
  )
}

///|
let inverse_mod_nonzero_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_NONZERO_ALT",
)

///|
/// `INVERSE_MOD_NONZERO_ALT`
pub fn inverse_mod_nonzero_alt() -> @kernel.Thm {
  inverse_mod_nonzero_alt_c.get()
}

///|
/// INVERSE_MOD_NONZERO
fn step_93() -> Unit raise {
  let t716 = @simp.asm_simp_tac(
    @list.List([
      @int.divides_one(),
      @int.number_rule(
        @term_syntax.parse_term("coprime(((n : Num), (a : Num))) → divides(n, a) == divides(n, 1)"),
      ),
    ]),
  )
  let t717 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.match_mp_tac(inverse_mod_nonzero_alt()),
    ),
    t716,
  )
  let t718 = @list.List([
    @simp.asm_rewrite_tac(@list.List([inverse_mod(), @calc_num.arith()])),
    t717,
  ])
  let t715 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t719 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t715),
    t718,
  )
  inverse_mod_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, coprime((n, a)) → !(inverse_mod(n, a) == 0)"),
      t719,
    ),
  )
}

///|
let inverse_mod_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_NONZERO",
)

///|
/// `INVERSE_MOD_NONZERO`
pub fn inverse_mod_nonzero() -> @kernel.Thm {
  inverse_mod_nonzero_c.get()
}

///|
/// INVERSE_MOD_BOUND_LE
fn step_94() -> Unit raise {
  let t720 = @simp.rewrite_tac(@list.List([inverse_mod()]))
  let t721 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@arith.le_lt(), inverse_mod_bound()])),
      ),
      t720,
    ),
    @int.arith_tac,
  )
  inverse_mod_bound_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, (inverse_mod(n, a) <= n) == !(n == 0)"),
      t721,
    ),
  )
}

///|
let inverse_mod_bound_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_BOUND_LE",
)

///|
/// `INVERSE_MOD_BOUND_LE`
pub fn inverse_mod_bound_le() -> @kernel.Thm {
  inverse_mod_bound_le_c.get()
}

///|
/// INVERSE_MOD_INVERSION
fn step_95() -> Unit raise {
  let t758 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t757 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_mult_lcancel(), inverse_mod_bound_le()]),
  )
  let t756 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(m : Num) * (x : Num) <= m * (n : Num) && n * (y : Num) <= n * m && 2 * (m * n) <= (q : Num) * (m * n) → m * x + n * y == 1 + q * (m * n) → (u : Num) == (v : Num)"),
    ),
  )
  let t755 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @int.arith_tac),
    @tactics.all_tac,
  ])
  let t754 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 1"))
  let t752 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_0(), inverse_mod(), @calc_num.arith()]),
  )
  let t750 = @term_syntax.parse_term("(n : Num) == 1")
  let t751 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 1"), t750]),
  )
  let t753 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            @arith.mult_clauses(),
            @arith.add_clauses(),
            @arith.mult_eq_0(),
            @arith.mult_eq_1(),
            @int.arith_rule(
              @term_syntax.parse_term("((a : Num) + (b : Num) == 1) == (a == 0 && b == 1 || a == 1 && b == 0)"),
            ),
          ]),
        ),
        t751,
      ),
      t752,
    ),
    @tactics.all_tac,
  ])
  let t749 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 0"))
  let t747 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(
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
      let s745 = @tactics.mp_tac(x744)
      fn(
        x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s745(x746)
      }
    }),
  )
  let t743 = @simp.asm_rewrite_tac(
    @list.List([inverse_mod(), @calc_num.arith()]),
  )
  let t742 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t741 = @simp.asm_rewrite_tac(
    @list.List([inverse_mod(), @calc_num.arith()]),
  )
  let t748 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1")),
          t741,
        ),
        t742,
      ),
      t743,
    ),
    t747,
  ])
  let t740 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
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
    }),
  )
  let t735 = @simp.rewrite_tac(
    @list.List([
      cong_to_1(),
      @arith.add_eq_0(),
      @arith.mult_eq_0(),
      @arith.mult_eq_1(),
    ]),
  )
  let t734 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t732 = @int.number_rule(
    @term_syntax.parse_term("op_eq_eq((a : Num) + (m : Num) * (x : Num), 1, mod(m)) == op_eq_eq(a, 1, mod(m))"),
  )
  let t733 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((m : Num) * (x : Num) + (a : Num), 1, mod(m)) == op_eq_eq(a, 1, mod(m))"),
      ),
      t732,
      inverse_mod_rmul_eq(),
      inverse_mod_lmul_eq(),
    ]),
  )
  let t731 = @simp.asm_rewrite_tac(@list.List([]))
  let t736 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(cong_chinese()), t731),
        t733,
      ),
      t734,
    ),
    t735,
  ])
  let t730 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_eq((m : Num) * inverse_mod((n : Num), m) + n * inverse_mod(m, n), 1, mod(m * n))"),
    fn(
      x727 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s728 = @tactics.mp_tac(x727)
      fn(
        x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s728(x729)
      }
    },
  )
  let t726 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @prime.coprime_0(),
        inverse_mod(),
        @arith.mult_clauses(),
        @arith.add_clauses(),
        @calc_num.arith(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t725 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t724 = @tactics.repeat_tac(@tactics.gen_tac)
  let t723 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @prime.coprime_0(),
        inverse_mod(),
        @arith.mult_clauses(),
        @arith.add_clauses(),
        @calc_num.arith(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t722 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t759 = @tactics.then_tac(
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t722,
                                    ),
                                    t723,
                                  ),
                                  t724,
                                ),
                                t725,
                              ),
                              t726,
                            ),
                            @tactics.strip_tac,
                          ),
                          t730,
                        ),
                        t736,
                      ),
                      t740,
                    ),
                    t748,
                  ),
                  t749,
                ),
                t753,
              ),
              t754,
            ),
            t755,
          ),
          t756,
        ),
        t757,
      ),
      t758,
    ),
    @int.asm_arith_tac,
  )
  inverse_mod_inversion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, coprime((m, n)) → m * inverse_mod(n, m) + n * inverse_mod(m, n) == m * n + 1"),
      t759,
    ),
  )
}

///|
let inverse_mod_inversion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_MOD_INVERSION",
)

///|
/// `INVERSE_MOD_INVERSION`
pub fn inverse_mod_inversion() -> @kernel.Thm {
  inverse_mod_inversion_c.get()
}

///|
/// INVERSE_MOD_CONV
fn step_96() -> Unit raise {
  fn gcdex(x760 : @num.Num, x761 : @num.Num) -> (@num.Num, @num.Num) raise {
    let (m, n) = (x760, x761)
    if @num.lt_num(n, m) {
      let (x, y) = gcdex(n, m)
      (y, x)
    } else if @num.eq_num(m, @num.num_of_int64(0L)) {
      let t762 = @num.num_of_int64(1L)
      (@num.num_of_int64(0L), t762)
    } else {
      let q = @num.quo_num(n, m)
      let r = @num.sub_num(n, @num.mult_num(q, m))
      let (x_1, y_1) = gcdex(r, m)
      (@num.sub_num(y_1, @num.mult_num(q, x_1)), x_1)
    }
  }
  let t766 = @simp.asm_rewrite_tac(
    @list.List([@int.cong_v1(), @arith.mod_eq_self()]),
  )
  let t765 = @simp.once_rewrite_tac(@list.List([cong_sym()]))
  let t764 = @tactics.match_mp_tac(inverse_mod_unique())
  let t767 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.conj_tac,
            @list.List([
              @simp.rewrite_tac(@list.List([inverse_mod(), @calc_num.arith()])),
              @tactics.strip_tac,
            ]),
          ),
          t764,
        ),
        t765,
      ),
      t766,
    ),
    @int.asm_arith_tac,
  )
  let t768 = (
    @term_syntax.parse_term("(inverse_mod(0, (n : Num)) == 1 && inverse_mod(1, n) == 1) && (MAX(2, (p : Num)) <= n && MOD((m : Num) * p, n) == 1 → inverse_mod(n, m) == p)"),
    t767,
  )
  let (pth_01, pth) = @bool.conj_pair(
    (fn(
      x763 : (
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
      @tactics.prove(x763.0, x763.1)
    })(t768),
  )
  let t769 = @term_syntax.parse_term("inverse_mod")
  let dest_iterm : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x770 : @kernel.Term,
  ) => @basics.dest_binop(t769, x770)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let p_tm = @term_syntax.parse_term("(p : Num)")
  let baseconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x771 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x771
    },
    @list.List([pth_01]),
  )
  inverse_mod_conv_c.set(fn(x772 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x772
    let (ntm, mtm) = dest_iterm(tm)
    let n_1 = @basics.dest_numeral(ntm)
    let m_1 = @basics.dest_numeral(mtm)
    if @num.le_num(n_1, num_1()) {
      baseconv(tm)
    } else {
      let (x_2, y_2) = gcdex(m_1, n_1)
      let t773 = @num.mult_num(y_2, n_1)
      let d = @num.add_num(@num.mult_num(x_2, m_1), t773)
      if @num.neq_num(d, num_1()) {
        raise Failure("INVERSE_MOD_CONV: not coprime")
      } else {
        let p = @num.mod_num(x_2, n_1)
        let th = @kernel.inst_rule(
          @list.List([(mtm, m_tm), (ntm, n_tm), (@nums.mk_numeral(p), p_tm)]),
          pth,
        )
        @bool.mp(
          th,
          @bool.eqt_elim(
            @calc_num.num_reduce_conv(@equal.lhand(@kernel.concl(th))),
          ),
        )
      }
    }
  })
}

///|
let inverse_mod_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INVERSE_MOD_CONV",
)

///|
/// `INVERSE_MOD_CONV`
pub fn inverse_mod_conv(x : @kernel.Term) -> @kernel.Thm raise {
  inverse_mod_conv_c.get()(x)
}

///|
/// squarefree
fn step_97() -> Unit raise {
  squarefree_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(squarefree : (Num) -> Bool)((n : Num)) == (∀ m : Num, divides(EXP(m, 2), n) → m == 1)"),
    ),
  )
}

///|
let squarefree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("squarefree")

///|
/// `squarefree`
pub fn squarefree() -> @kernel.Thm {
  squarefree_c.get()
}

///|
/// SQUAREFREE_0
fn step_98() -> Unit raise {
  let t774 = @meson.meson_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!(1 == 0)"))]),
  )
  let t775 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([squarefree(), @prime.divides_0()])),
    t774,
  )
  squarefree_0_c.set(@tactics.prove(@term_syntax.parse_term("!squarefree(0)"), t775))
}

///|
let squarefree_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_0")

///|
/// `SQUAREFREE_0`
pub fn squarefree_0() -> @kernel.Thm {
  squarefree_0_c.get()
}

///|
/// SQUAREFREE_1
fn step_99() -> Unit raise {
  let t776 = @simp.rewrite_tac(
    @list.List([
      squarefree(),
      @int.divides_one(),
      @arith.exp_eq_1(),
      @calc_num.arith_eq(),
    ]),
  )
  squarefree_1_c.set(@tactics.prove(@term_syntax.parse_term("squarefree(1)"), t776))
}

///|
let squarefree_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_1")

///|
/// `SQUAREFREE_1`
pub fn squarefree_1() -> @kernel.Thm {
  squarefree_1_c.get()
}

///|
/// SQUAREFREE_IMP_NZ
fn step_100() -> Unit raise {
  let t777 = @meson.meson_tac(@list.List([squarefree_0()]))
  squarefree_imp_nz_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, squarefree(n) → !(n == 0)"), t777),
  )
}

///|
let squarefree_imp_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_IMP_NZ",
)

///|
/// `SQUAREFREE_IMP_NZ`
pub fn squarefree_imp_nz() -> @kernel.Thm {
  squarefree_imp_nz_c.get()
}

///|
let squarefree_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_PRIME",
)

///|
/// `SQUAREFREE_PRIME`
pub fn squarefree_prime() -> @kernel.Thm {
  squarefree_prime_c.get()
}

///|
let squarefree_prime_divisor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_PRIME_DIVISOR",
)

///|
/// `SQUAREFREE_PRIME_DIVISOR`
pub fn squarefree_prime_divisor() -> @kernel.Thm {
  squarefree_prime_divisor_c.get()
}

///|
/// SQUAREFREE_PRIME, SQUAREFREE_PRIME_DIVISOR
fn step_101() -> Unit raise {
  let t802 = @tactics.conv_tac(@int.number_rule)
  let t800 = @term_syntax.parse_term("divides((p : Num), (m : Num))")
  let t801 = @tactics.map_every(
    fn(
      x797 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s798 = @tactics.undisch_tac(x797)
      fn(
        x799 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s798(x799)
      }
    },
    @list.List([@term_syntax.parse_term("divides(EXP((m : Num), 2), (n : Num))"), t800]),
  )
  let t796 = @simp.asm_rewrite_tac(@list.List([@class.not_imp()]))
  let t792 = @term_syntax.parse_term("(p : Num)")
  let t795 = @tactics.first_x_assum(fn(
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
    (fn(
      x789 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s790 = @tactics.mp_tac(x789)
      fn(
        x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s790(x791)
      }
    })(((x793 : @kernel.Thm) => @bool.spec(t792, x793))(x794))
  })
  let t788 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t787 = @simp.asm_rewrite_tac(@list.List([]))
  let t786 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : Num)"), @prime.prime_factor()),
  )
  let t785 = @simp.asm_rewrite_tac(@list.List([]))
  let t784 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t783 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t782 = @list.List([
    @meson.meson_tac(@list.List([@prime.prime_1()])),
    @tactics.all_tac,
  ])
  let t781 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t780 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((q : Bool) → (r : Bool)) && ((p : Bool) → q) && (r → p) → p == q && p == r"),
    ),
  )
  let t779 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t803 = @tactics.then_tac(
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
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @simp.rewrite_tac(
                                        @list.List([
                                          @theorems.and_forall_thm(),
                                          squarefree(),
                                        ]),
                                      ),
                                      t779,
                                    ),
                                    t780,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t781,
                              ),
                              @tactics.conj_tac,
                            ),
                            t782,
                          ),
                          @tactics.disch_tac,
                        ),
                        t783,
                      ),
                      @tactics.disch_tac,
                    ),
                    t784,
                  ),
                  t785,
                ),
                t786,
              ),
              t787,
            ),
            t788,
          ),
          t795,
        ),
        t796,
      ),
      t801,
    ),
    t802,
  )
  let t804 = (
    @term_syntax.parse_term("(∀ n : Num, squarefree(n) == (∀ p : Num, prime(p) → !divides(EXP(p, 2), n))) && (∀ n : Num, squarefree(n) == (∀ p : Num, prime(p) && divides(p, n) → !divides(EXP(p, 2), n)))"),
    t803,
  )
  let (squarefree_prime, squarefree_prime_divisor) = @bool.conj_pair(
    (fn(
      x778 : (
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
      @tactics.prove(x778.0, x778.1)
    })(t804),
  )
  squarefree_prime_c.set(squarefree_prime)
  squarefree_prime_divisor_c.set(squarefree_prime_divisor)
}

///|
/// SQUAREFREE_INDEX
fn step_102() -> Unit raise {
  let t814 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t813 = @simp.asm_rewrite_tac(@list.List([@prime.index_def()]))
  let t812 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!(2 <= (n : Num)) == (n <= 1)"))]),
  )
  let t811 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t810 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t809 = @simp.gen_rewrite_tac(
    fn(
      x808 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x808
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t806 = @simp.asm_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool) → p) == (q → p)"))]),
  )
  let t807 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@int.arith_rule(@term_syntax.parse_term("!(1 == 0)"))]),
    ),
    t806,
  ])
  let t805 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t815 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.gen_tac,
                      @simp.rewrite_tac(
                        @list.List([
                          squarefree(),
                          @prime.primepow_divides_index(),
                        ]),
                      ),
                    ),
                    t805,
                  ),
                  t807,
                ),
                @tactics.ap_term_tac,
              ),
              t809,
            ),
            t810,
          ),
          t811,
        ),
        t812,
      ),
      t813,
    ),
    t814,
  )
  squarefree_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, squarefree(n) == (!(n == 0) && (∀ m : Num, index(m, n) <= 1))"),
      t815,
    ),
  )
}

///|
let squarefree_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_INDEX",
)

///|
/// `SQUAREFREE_INDEX`
pub fn squarefree_index() -> @kernel.Thm {
  squarefree_index_c.get()
}

///|
/// SQUAREFREE_PRIME_INDEX
fn step_103() -> Unit raise {
  let t819 = @meson.asm_meson_tac(
    @list.List([@prime.prime_1(), @prime.prime_2()]),
  )
  let t818 = @simp.asm_rewrite_tac(
    @list.List([
      @class.de_morgan_thm(),
      @int.arith_rule(@term_syntax.parse_term("!(2 <= (n : Num)) == (n <= 1)")),
    ]),
  )
  let t817 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t816 = @simp.rewrite_tac(@list.List([@prime.primepow_divides_index()]))
  let t820 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([squarefree_prime()])),
          ),
          t816,
        ),
        t817,
      ),
      t818,
    ),
    t819,
  )
  squarefree_prime_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, squarefree(n) == (!(n == 0) && (∀ p : Num, prime(p) → index(p, n) <= 1))"),
      t820,
    ),
  )
}

///|
let squarefree_prime_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_PRIME_INDEX",
)

///|
/// `SQUAREFREE_PRIME_INDEX`
pub fn squarefree_prime_index() -> @kernel.Thm {
  squarefree_prime_index_c.get()
}

///|
let squarefree_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_COPRIME",
)

///|
/// `SQUAREFREE_COPRIME`
pub fn squarefree_coprime() -> @kernel.Thm {
  squarefree_coprime_c.get()
}

///|
let squarefree_coprime_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_COPRIME_DIVISORS",
)

///|
/// `SQUAREFREE_COPRIME_DIVISORS`
pub fn squarefree_coprime_divisors() -> @kernel.Thm {
  squarefree_coprime_divisors_c.get()
}

///|
/// SQUAREFREE_COPRIME, SQUAREFREE_COPRIME_DIVISORS
fn step_104() -> Unit raise {
  let t827 = @meson.meson_tac(@list.List([@prime.divides_mul2()]))
  let t828 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.coprime(), @arith.exp_2()])),
    t827,
  )
  let t826 = @meson.meson_tac(@list.List([@prime.coprime_rmul()]))
  let t829 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@int.divides(), @equal.gsym(@arith.mult_assoc())]),
    ),
    t826,
  )
  let t825 = @meson.meson_tac(@list.List([@prime.coprime_refl()]))
  let t830 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.exp_2()])), t825),
    t829,
    t828,
  ])
  let t824 = @tactics.repeat_tac(@tactics.conj_tac)
  let t823 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((r : Bool) → (p : Bool)) && ((q : Bool) → r) && (p → q) → p == q && p == r"),
    ),
  )
  let t822 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t831 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([squarefree(), @theorems.and_forall_thm()]),
          ),
          t822,
        ),
        t823,
      ),
      t824,
    ),
    t830,
  )
  let t832 = (
    @term_syntax.parse_term("(∀ n : Num, squarefree(n) == (∀ a : Num, ∀ b : Num, a * b == n → coprime((a, b)))) && (∀ n : Num, squarefree(n) == (∀ a : Num, ∀ b : Num, divides(a * b, n) → coprime((a, b))))"),
    t831,
  )
  let (squarefree_coprime, squarefree_coprime_divisors) = @bool.conj_pair(
    (fn(
      x821 : (
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
      @tactics.prove(x821.0, x821.1)
    })(t832),
  )
  squarefree_coprime_c.set(squarefree_coprime)
  squarefree_coprime_divisors_c.set(squarefree_coprime_divisors)
}

///|
/// SQUAREFREE_DIVISOR
fn step_105() -> Unit raise {
  let t839 = @tactics.conv_tac(@int.number_rule)
  let t838 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x835 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s836 = @tactics.mp_tac(x835)
      fn(
        x837 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s836(x837)
      }
    }),
  )
  let t834 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t833 = @tactics.repeat_tac(@tactics.strip_tac)
  let t840 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([squarefree()])), t833),
        t834,
      ),
      t838,
    ),
    t839,
  )
  squarefree_divisor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, squarefree(n) && divides(m, n) → squarefree(m)"),
      t840,
    ),
  )
}

///|
let squarefree_divisor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_DIVISOR",
)

///|
/// `SQUAREFREE_DIVISOR`
pub fn squarefree_divisor() -> @kernel.Thm {
  squarefree_divisor_c.get()
}

///|
/// PRIME_IMP_SQUAREFREE
fn step_106() -> Unit raise {
  let t853 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t852 = @simp.asm_simp_tac(
    @list.List([@prime.divides_exp_le(), @prime.prime_ge_2()]),
  )
  let t851 = @simp.gen_rewrite_tac(
    fn(
      x850 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x844 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s845 = @equal.rand_conv(x844)
        fn(x846 : @kernel.Term) -> @kernel.Thm raise { s845(x846) }
      })(
        (fn(
          x847 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s848 = @equal.rand_conv(x847)
          fn(x849 : @kernel.Term) -> @kernel.Thm raise { s848(x849) }
        })(x850),
      )
    },
    @list.List([@equal.gsym(@arith.exp_1())]),
  )
  let t843 = @tactics.replicate_tac(
    2,
    @tactics.disch_then(fn(
      x842 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
  )
  let t841 = @simp.asm_simp_tac(
    @list.List([
      squarefree_prime_divisor(),
      @prime.divides_prime_prime(),
      @theorems.imp_conj(),
    ]),
  )
  let t854 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t841),
            @tactics.gen_tac,
          ),
          t843,
        ),
        t851,
      ),
      t852,
    ),
    t853,
  )
  prime_imp_squarefree_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → squarefree(p)"), t854),
  )
}

///|
let prime_imp_squarefree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_IMP_SQUAREFREE",
)

///|
/// `PRIME_IMP_SQUAREFREE`
pub fn prime_imp_squarefree() -> @kernel.Thm {
  prime_imp_squarefree_c.get()
}

///|
/// SQUAREFREE_MUL
fn step_107() -> Unit raise {
  let t859 = @simp.asm_simp_tac(
    @list.List([squarefree_prime(), @prime.prime_divprod_pow_eq()]),
  )
  let t858 = @meson.meson_tac(
    @list.List([@prime.divides_lmul(), @prime.divides_rmul()]),
  )
  let t860 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([squarefree()])), t858),
    t859,
  ])
  let t856 = @meson.asm_meson_tac(@list.List([squarefree_coprime()]))
  let t857 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t856])
  let t855 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((m : Num), (n : Num)))"))
  let t861 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t855),
        t857,
      ),
      @tactics.eq_tac,
    ),
    t860,
  )
  squarefree_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, squarefree(m * n) == (coprime((m, n)) && squarefree(m) && squarefree(n))"),
      t861,
    ),
  )
}

///|
let squarefree_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_MUL")

///|
/// `SQUAREFREE_MUL`
pub fn squarefree_mul() -> @kernel.Thm {
  squarefree_mul_c.get()
}

///|
/// SQUAREFREE_EXP
fn step_108() -> Unit raise {
  let t877 = @tactics.match_mp_tac(@prime.divides_exp_le_imp())
  let t876 = @simp.asm_rewrite_tac(@list.List([]))
  let t872 = @term_syntax.parse_term("(n : Num)")
  let t875 = @tactics.disch_then(fn(
    x874 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x869 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s870 = @tactics.mp_tac(x869)
      fn(
        x871 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s870(x871)
      }
    })(((x873 : @kernel.Thm) => @bool.spec(t872, x873))(x874))
  })
  let t868 = @simp.rewrite_tac(@list.List([squarefree()]))
  let t867 = @simp.asm_rewrite_tac(@list.List([@arith.exp_1()]))
  let t866 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1"))
  let t865 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), squarefree_1()]))
  let t864 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t863 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_one(), squarefree_1()]),
  )
  let t862 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t878 = @tactics.then_tac(
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
                        t862,
                      ),
                      t863,
                    ),
                    t864,
                  ),
                  t865,
                ),
                t866,
              ),
              t867,
            ),
            t868,
          ),
          t875,
        ),
        t876,
      ),
      t877,
    ),
    @int.asm_arith_tac,
  )
  squarefree_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, squarefree(EXP(n, k)) == (n == 1 || k == 0 || squarefree(n) && k == 1)"),
      t878,
    ),
  )
}

///|
let squarefree_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_EXP")

///|
/// `SQUAREFREE_EXP`
pub fn squarefree_exp() -> @kernel.Thm {
  squarefree_exp_c.get()
}

///|
/// SQUAREFREE_DIVIDES
fn step_109() -> Unit raise {
  let t896 = @simp.asm_rewrite_tac(@list.List([@theorems.forall_unwind_thm1()]))
  let t895 = @simp.once_rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → (r : Bool)) == (q → p → r)")),
    ]),
  )
  let t894 = @simp.asm_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@arith.le_0()]),
        @term_syntax.parse_term("((if (p : Bool) { 1 } else { 0 }) <= (x : Num)) == (p → 1 <= x)"),
      ),
    ]),
  )
  let t893 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t889 = @term_syntax.parse_term("(p : Num)")
  let t892 = @tactics.first_x_assum(fn(
    x891 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x886 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s887 = @tactics.mp_tac(x886)
      fn(
        x888 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s887(x888)
      }
    })(((x890 : @kernel.Thm) => @bool.spec(t889, x890))(x891))
  })
  let t885 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t884 = @simp.gen_rewrite_tac(
    fn(
      x883 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x883
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t882 = @simp.asm_simp_tac(@list.List([@prime.index_prime()]))
  let t881 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t880 = @simp.asm_simp_tac(
    @list.List([
      @theorems.imp_conj(),
      @prime.divides_index(),
      @prime.prime_imp_nz(),
    ]),
  )
  let t879 = @tactics.repeat_tac(@tactics.strip_tac)
  let t897 = @tactics.then_tac(
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
                              @list.List([squarefree_prime_index()]),
                            ),
                            t879,
                          ),
                          t880,
                        ),
                        t881,
                      ),
                      t882,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t884,
                ),
                t885,
              ),
              t892,
            ),
            t893,
          ),
          t894,
        ),
        t895,
      ),
      t896,
    ),
    @int.arith_tac,
  )
  squarefree_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ q : Num, ∀ n : Num, squarefree(q) → divides(q, n) == (∀ p : Num, prime(p) && divides(p, q) → divides(p, n))"),
      t897,
    ),
  )
}

///|
let squarefree_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_DIVIDES",
)

///|
/// `SQUAREFREE_DIVIDES`
pub fn squarefree_divides() -> @kernel.Thm {
  squarefree_divides_c.get()
}

///|
/// SQUAREFREE_DIVEXP
fn step_110() -> Unit raise {
  let t898 = @simp.simp_tac(
    @list.List([
      @theorems.imp_conj(),
      squarefree_divides(),
      @prime.prime_divexp_eq(),
    ]),
  )
  squarefree_divexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ q : Num, ∀ x : Num, squarefree(q) && divides(q, EXP(x, n)) → divides(q, x)"),
      t898,
    ),
  )
}

///|
let squarefree_divexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_DIVEXP",
)

///|
/// `SQUAREFREE_DIVEXP`
pub fn squarefree_divexp() -> @kernel.Thm {
  squarefree_divexp_c.get()
}

///|
/// SQUAREFREE_DIVEXP_EQ
fn step_111() -> Unit raise {
  let t899 = @meson.meson_tac(
    @list.List([@prime.divides_rexp(), squarefree_divexp()]),
  )
  squarefree_divexp_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ q : Num, ∀ x : Num, squarefree(q) && !(n == 0) → divides(q, EXP(x, n)) == divides(q, x)"),
      t899,
    ),
  )
}

///|
let squarefree_divexp_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_DIVEXP_EQ",
)

///|
/// `SQUAREFREE_DIVEXP_EQ`
pub fn squarefree_divexp_eq() -> @kernel.Thm {
  squarefree_divexp_eq_c.get()
}

///|
let squarefree_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE")

///|
/// `SQUAREFREE`
pub fn squarefree_v1() -> @kernel.Thm {
  squarefree_v1_c.get()
}

///|
let squarefree_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_ALT")

///|
/// `SQUAREFREE_ALT`
pub fn squarefree_alt() -> @kernel.Thm {
  squarefree_alt_c.get()
}

///|
/// SQUAREFREE, SQUAREFREE_ALT
fn step_112() -> Unit raise {
  let t933 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t932 = @simp.asm_simp_tac(
    @list.List([@prime.divides_rmul2_eq(), @int.divides_one()]),
  )
  let t931 = @simp.gen_rewrite_tac(
    fn(
      x930 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x924 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s925 = @equal.rand_conv(x924)
        fn(x926 : @kernel.Term) -> @kernel.Thm raise { s925(x926) }
      })(
        (fn(
          x927 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s928 = @equal.rand_conv(x927)
          fn(x929 : @kernel.Term) -> @kernel.Thm raise { s928(x929) }
        })(x930),
      )
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("(r : Num) == 1 * r"))]),
  )
  let t923 = @list.List([@tactics.conv_tac(@int.number_rule), @tactics.all_tac])
  let t922 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp_2(),
      @equal.gsym(@arith.mult_assoc()),
      @prime.divides_lmul2_eq(),
      @class.not_imp(),
    ]),
  )
  let t921 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @arith.mult_eq_0(),
        @arith.exp_eq_0(),
        @calc_num.arith_eq(),
        @class.de_morgan_thm(),
      ]),
    ),
  )
  let t917 = @term_syntax.parse_term("(p : Num) * (r : Num)")
  let t920 = @tactics.first_x_assum(fn(
    x919 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x914 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s915 = @tactics.mp_tac(x914)
      fn(
        x916 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s915(x916)
      }
    })(((x918 : @kernel.Thm) => @bool.spec(t917, x918))(x919))
  })
  let t910 = @simp.gen_rewrite_rule(
    fn(
      x909 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x909
    },
    @list.List([@int.divides()]),
  )
  let t911 = @tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(
    x906 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s907 = @tactics.subst_all_tac(x906)
    fn(
      x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s907(x908)
    }
  })
  let t913 = @tactics.first_x_assum(fn(
    x912 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t911(t910(x912))
  })
  let t905 = @tactics.repeat_tac(@tactics.strip_tac)
  let t904 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t903 = @simp.rewrite_tac(@list.List([squarefree_prime()]))
  let t902 = @list.List([
    @meson.meson_tac(@list.List([squarefree_divexp(), squarefree_0()])),
    @tactics.strip_tac,
  ])
  let t901 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(((p : Bool) → (q : Bool)) && (q → (r : Bool))) && (r → p) → p == q && p == r"),
    ),
  )
  let t934 = @tactics.then_tac(
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
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @simp.rewrite_tac(
                                    @list.List([@theorems.and_forall_thm()]),
                                  ),
                                  @tactics.gen_tac,
                                ),
                                t901,
                              ),
                              @tactics.conj_tac,
                            ),
                            t902,
                          ),
                          t903,
                        ),
                        t904,
                      ),
                      t905,
                    ),
                    t913,
                  ),
                  t920,
                ),
                t921,
              ),
              t922,
            ),
            @tactics.conj_tac,
          ),
          t923,
        ),
        t931,
      ),
      t932,
    ),
    t933,
  )
  let t935 = (
    @term_syntax.parse_term("(∀ n : Num, squarefree(n) == (!(n == 0) && (∀ m : Num, ∀ k : Num, divides(n, EXP(m, k)) → divides(n, m)))) && (∀ n : Num, squarefree(n) == (!(n == 0) && (∀ m : Num, divides(n, EXP(m, 2)) → divides(n, m))))"),
    t934,
  )
  let (squarefree_2, squarefree_alt) = @bool.conj_pair(
    (fn(
      x900 : (
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
      @tactics.prove(x900.0, x900.1)
    })(t935),
  )
  squarefree_v1_c.set(squarefree_2)
  squarefree_alt_c.set(squarefree_alt)
}

///|
/// SQUAREFREE_GCD
fn step_113() -> Unit raise {
  let t936 = @meson.meson_tac(@list.List([squarefree_divisor(), @int.gcd()]))
  squarefree_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, squarefree(m) || squarefree(n) → squarefree(gcd((m, n)))"),
      t936,
    ),
  )
}

///|
let squarefree_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREFREE_GCD")

///|
/// `SQUAREFREE_GCD`
pub fn squarefree_gcd() -> @kernel.Thm {
  squarefree_gcd_c.get()
}

///|
/// SQUAREFREE_GCD_SQUARE
fn step_114() -> Unit raise {
  let t962 = @simp.asm_simp_tac(
    @list.List([@prime.index_prime(), @prime.prime_imp_nz()]),
  )
  let t958 = @term_syntax.parse_term("(p : Num)")
  let t961 = @list.List([
    @int.arith_tac,
    @tactics.disch_then(fn(
      x960 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x955 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s956 = @tactics.mp_tac(x955)
        fn(
          x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s956(x957)
        }
      })(((x959 : @kernel.Thm) => @bool.spec(t958, x959))(x960))
    }),
  ])
  let t954 = @simp.asm_rewrite_tac(@list.List([]))
  let t953 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t952 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t951 = @simp.gen_rewrite_tac(
    fn(
      x950 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x950
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t949 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t948 = @simp.simp_tac(
    @list.List([
      @prime.gcd_zero(),
      @arith.exp_eq_0(),
      @class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)")),
    ]),
  )
  let t947 = @simp.asm_simp_tac(
    @list.List([
      @prime.gcd_zero(),
      @prime.index_gcd(),
      @prime.index_exp(),
      @arith.exp_eq_0(),
      @theorems.right_imp_forall_thm(),
      @class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)")),
    ]),
  )
  let t945 = @simp.asm_rewrite_tac(
    @list.List([@prime.divides_index(), squarefree_prime_index()]),
  )
  let t944 = @simp.rewrite_tac(@list.List([@int.divides_mod()]))
  let t940 = @term_syntax.parse_term("2")
  let t943 = @tactics.disch_then(fn(
    x942 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x937 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s938 = @tactics.mp_tac(x937)
      fn(
        x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s938(x939)
      }
    })(((x941 : @kernel.Thm) => @bool.spec(t940, x941))(x942))
  })
  let t946 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([squarefree_0(), @prime.gcd_0()])),
          t943,
        ),
        t944,
      ),
      @int.arith_tac,
    ),
    t945,
  ])
  let t963 = @tactics.then_tac(
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
                              @tactics.gen_tac,
                              @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
                            ),
                            t946,
                          ),
                          t947,
                        ),
                        t948,
                      ),
                      t949,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t951,
                ),
                t952,
              ),
              t953,
            ),
            t954,
          ),
          @tactics.eq_tac,
        ),
        t961,
      ),
      t962,
    ),
    @int.arith_tac,
  )
  squarefree_gcd_square_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, squarefree(n) == (∀ x : Num, divides(gcd((EXP(x, 2), n)), x))"),
      t963,
    ),
  )
}

///|
let squarefree_gcd_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_GCD_SQUARE",
)

///|
/// `SQUAREFREE_GCD_SQUARE`
pub fn squarefree_gcd_square() -> @kernel.Thm {
  squarefree_gcd_square_c.get()
}

///|
/// SQUAREFREE_NPRODUCT
fn step_115() -> Unit raise {
  let t967 = @meson.meson_tac(@list.List([@prime.coprime_sym()]))
  let t966 = @simp.simp_tac(
    @list.List([@sets.pairwise(), @prime.coprime_nproduct_eq()]),
  )
  let t965 = @simp.rewrite_tac(
    @list.List([
      @sets.pairwise_insert(),
      squarefree_mul(),
      @sets.forall_in_insert(),
    ]),
  )
  let t964 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      @sets.pairwise_empty(),
      @sets.not_in_empty(),
      squarefree_1(),
    ]),
  )
  let t968 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@sets.finite_induct_strong()),
          t964,
        ),
        t965,
      ),
      t966,
    ),
    t967,
  )
  squarefree_nproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → squarefree(nproduct(s, (n : Num) => n)) == (pairwise((a : Num) => (b : Num) => coprime((a, b)), s) && (∀ n : Num, IN(n, s) → squarefree(n)))"),
      t968,
    ),
  )
}

///|
let squarefree_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_NPRODUCT",
)

///|
/// `SQUAREFREE_NPRODUCT`
pub fn squarefree_nproduct() -> @kernel.Thm {
  squarefree_nproduct_c.get()
}

///|
/// SQUAREFREE_EXPAND
fn step_116() -> Unit raise {
  let t997 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t996 = @simp.asm_rewrite_tac(@list.List([@arith.exp_1()]))
  let t995 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)")),
      @prime.index_eq_0(),
    ]),
  )
  let t992 = @simp.rewrite_rule(@list.List([squarefree_index()]))
  let t989 = @term_syntax.parse_term("(p : Num)")
  let t994 = @tactics.first_x_assum(fn(
    x993 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x991 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x986 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s987 = @tactics.mp_tac(x986)
        fn(
          x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s987(x988)
        }
      })(((x990 : @kernel.Thm) => @bool.spec(t989, x990))(x991))
    })(t992(x993))
  })
  let t985 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t984 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t983 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_eq())(@iterate.monoidal_mul()),
  )
  let t982 = @simp.rewrite_tac(@list.List([@iterate.nproduct()]))
  let t981 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@theorems.eq_trans()),
  )
  let t980 = @simp.asm_rewrite_tac(@list.List([]))
  let t974 = @drule.part_match(
    fn(x973 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x973))
    },
    @prime.prime_factorization(),
  )
  let t969 = @tactics.repeat_tac(@tactics.strip_tac)
  let t998 = @tactics.then_tac(
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
                                @list.List([squarefree_index()]),
                              ),
                              t969,
                            ),
                            fn(
                              x979 : (
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
                                x978 : (
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
                                  x976 : @kernel.Term,
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
                                    x975 : @kernel.Term,
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
                                      x970 : @kernel.Thm,
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
                                      let s971 = @tactics.mp_tac(x970)
                                      fn(
                                        x972 : (
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
                                        s971(x972)
                                      }
                                    })(t974(x975))
                                  })(@kernel.rand(x976))
                                })(
                                  (fn(
                                    x977 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> @kernel.Term raise {
                                    x977.1
                                  })(x978),
                                )
                              })(x979)(x979)
                            },
                          ),
                          t980,
                        ),
                        t981,
                      ),
                      t982,
                    ),
                    t983,
                  ),
                  t984,
                ),
                t985,
              ),
              @tactics.strip_tac,
            ),
            t994,
          ),
          t995,
        ),
        @tactics.strip_tac,
      ),
      t996,
    ),
    t997,
  )
  squarefree_expand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, squarefree(n) → nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => p) == n"),
      t998,
    ),
  )
}

///|
let squarefree_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_EXPAND",
)

///|
/// `SQUAREFREE_EXPAND`
pub fn squarefree_expand() -> @kernel.Thm {
  squarefree_expand_c.get()
}

///|
/// SQUAREFREE_EXPAND_EQ
fn step_117() -> Unit raise {
  let t1009 = @meson.meson_tac(@list.List([@prime.coprime_prime_prime()]))
  let t1008 = @simp.simp_tac(
    @list.List([@sets.in_elim_thm(), prime_imp_squarefree(), @sets.pairwise()]),
  )
  let t1007 = @simp.asm_simp_tac(
    @list.List([squarefree_nproduct(), @prime.finite_special_divisors()]),
  )
  let t1006 = @tactics.disch_then(fn(
    x1005 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1002 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1003 = @tactics.subst1_tac(x1002)
      fn(
        x1004 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1003(x1004)
      }
    })(@equal.sym(x1005))
  })
  let t1001 = @simp.rewrite_tac(@list.List([squarefree_expand()]))
  let t999 = @simp.asm_rewrite_tac(@list.List([]))
  let t1000 = @list.List([
    @meson.asm_meson_tac(@list.List([squarefree_0()])),
    t999,
  ])
  let t1010 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
                ),
                t1000,
              ),
              @tactics.eq_tac,
            ),
            t1001,
          ),
          t1006,
        ),
        t1007,
      ),
      t1008,
    ),
    t1009,
  )
  squarefree_expand_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, squarefree(n) == (!(n == 0) && nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => p) == n)"),
      t1010,
    ),
  )
}

///|
let squarefree_expand_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_EXPAND_EQ",
)

///|
/// `SQUAREFREE_EXPAND_EQ`
pub fn squarefree_expand_eq() -> @kernel.Thm {
  squarefree_expand_eq_c.get()
}

///|
/// SQUAREFREE_DECOMPOSITION
fn step_118() -> Unit raise {
  let t1045 = @simp.rewrite_tac(
    @list.List([@arith.exp_exp(), @equal.gsym(@arith.exp_add())]),
  )
  let t1044 = @simp.asm_simp_tac(
    @list.List([squarefree_exp(), prime_imp_squarefree()]),
  )
  let t1042 = @term_syntax.parse_term("EXP((p : Num), DIV((k : Num), 2))")
  let t1043 = @tactics.map_every(
    fn(
      x1039 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1040 = @tactics.exists_tac(x1039)
      fn(
        x1041 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1040(x1041)
      }
    },
    @list.List([@term_syntax.parse_term("EXP((p : Num), MOD((k : Num), 2))"), t1042]),
  )
  let t1038 = @term_syntax.parse_term("(k : Num)")
  let t1046 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.map_every(
                    @tactics.x_gen_tac,
                    @list.List([@term_syntax.parse_term("(p : Num)"), t1038]),
                  ),
                  @tactics.disch_tac,
                ),
                t1043,
              ),
              t1044,
            ),
            @tactics.conj_tac,
          ),
          @list.List([@int.arith_tac, @tactics.all_tac]),
        ),
        t1045,
      ),
      @tactics.ap_term_tac,
    ),
    @int.arith_tac,
  )
  let t1037 = @simp.asm_rewrite_tac(@list.List([squarefree_mul()]))
  let t1035 = @term_syntax.parse_term("(na : Num) * (nb : Num)")
  let t1036 = @tactics.map_every(
    fn(
      x1032 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1033 = @tactics.exists_tac(x1032)
      fn(
        x1034 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1033(x1034)
      }
    },
    @list.List([@term_syntax.parse_term("(ma : Num) * (mb : Num)"), t1035]),
  )
  let t1031 = @simp.rewrite_tac(
    @list.List([@prime.coprime_lmul(), @prime.coprime_rmul()]),
  )
  let t1030 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x1029 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1026 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1027 = @tactics.subst1_tac(x1026)
        fn(
          x1028 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1027(x1028)
        }
      })(@equal.sym(x1029))
    }),
  )
  let t1025 = @tactics.undisch_tac(@term_syntax.parse_term("coprime(((a : Num), (b : Num)))"))
  let t1024 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1018 = @term_syntax.parse_term("(nb : Num)")
  let t1019 = @term_syntax.parse_term("(mb : Num)")
  let t1020 = @term_syntax.parse_term("(na : Num)")
  let t1021 = @term_syntax.parse_term("(ma : Num)")
  let t1022 = @term_syntax.parse_term("(b : Num)")
  let t1023 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : Num)"), t1022, t1021, t1020, t1019, t1018]),
  )
  let t1047 = @tactics.then_tac(
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
                        @theorems.right_imp_forall_thm(),
                        @theorems.left_imp_exists_thm(),
                      ]),
                    ),
                    t1023,
                  ),
                  t1024,
                ),
                t1025,
              ),
              t1030,
            ),
            t1031,
          ),
          @tactics.strip_tac,
        ),
        t1036,
      ),
      t1037,
    ),
    @int.arith_tac,
  )
  let t1017 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1016 = @simp.rewrite_tac(@list.List([squarefree_1()]))
  let t1015 = @term_syntax.parse_term("0")
  let t1048 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x1012 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1013 = @tactics.exists_tac(x1012)
            fn(
              x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1013(x1014)
            }
          },
          @list.List([@term_syntax.parse_term("1"), t1015]),
        ),
        t1016,
      ),
      t1017,
    ),
    t1047,
    t1046,
  ])
  let t1011 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1049 = @tactics.thenl(
    @tactics.then_tac(@tactics.match_mp_tac(@prime.induct_coprime_alt()), t1011),
    t1048,
  )
  squarefree_decomposition_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∃ m : Num, ∃ r : Num, squarefree(m) && m * EXP(r, 2) == n"),
      t1049,
    ),
  )
}

///|
let squarefree_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQUAREFREE_DECOMPOSITION",
)

///|
/// `SQUAREFREE_DECOMPOSITION`
pub fn squarefree_decomposition() -> @kernel.Thm {
  squarefree_decomposition_c.get()
}

///|
/// CONG_MOD_SQUAREFREE
fn step_119() -> Unit raise {
  let t1065 = @meson.asm_meson_tac(
    @list.List([@prime.divides_lmul(), @prime.divides_rmul()]),
  )
  let t1064 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(@bool.conjunct2(x1063))
  })
  let t1062 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1061 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1060 = @simp.simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((m : Num), (n : Num))) → op_eq_eq((a : Num), (b : Num), mod(m * n)) == (op_eq_eq(a, b, mod(m)) && op_eq_eq(a, b, mod(n)))"),
      ),
    ]),
  )
  let t1059 = @simp.asm_rewrite_tac(@list.List([]))
  let t1058 = @class.asm_cases_tac(@term_syntax.parse_term("squarefree((n : Num))"))
  let t1057 = @simp.asm_rewrite_tac(@list.List([squarefree_mul()]))
  let t1056 = @class.asm_cases_tac(@term_syntax.parse_term("squarefree((m : Num))"))
  let t1054 = @term_syntax.parse_term("(n : Num)")
  let t1055 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t1054]),
  )
  let t1053 = @list.List([
    @meson.meson_tac(@list.List([@prime.divides_prime_prime()])),
    @tactics.all_tac,
  ])
  let t1052 = @simp.rewrite_tac(@list.List([cong_mod_1(), squarefree_0()]))
  let t1051 = @tactics.match_mp_tac(@prime.complete_factor_induct())
  let t1066 = @tactics.then_tac(
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
                                    @tactics.replicate_tac(
                                      2,
                                      @tactics.then_tac(
                                        @simp.gen_rewrite_tac(
                                          fn(
                                            x1050 : (@kernel.Term) -> @kernel.Thm raise,
                                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                            x1050
                                          },
                                          @list.List([
                                            @theorems.swap_forall_thm(),
                                          ]),
                                        ),
                                        @tactics.gen_tac,
                                      ),
                                    ),
                                    t1051,
                                  ),
                                  t1052,
                                ),
                                @tactics.conj_tac,
                              ),
                              t1053,
                            ),
                            t1055,
                          ),
                          t1056,
                        ),
                        t1057,
                      ),
                      t1058,
                    ),
                    t1059,
                  ),
                  t1060,
                ),
                @tactics.strip_tac,
              ),
              @tactics.disch_tac,
            ),
            @tactics.conj_tac,
          ),
          t1061,
        ),
        t1062,
      ),
      t1064,
    ),
    t1065,
  )
  cong_mod_squarefree_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, squarefree(n) && (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(a, b, mod(p))) → op_eq_eq(a, b, mod(n))"),
      t1066,
    ),
  )
}

///|
let cong_mod_squarefree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MOD_SQUAREFREE",
)

///|
/// `CONG_MOD_SQUAREFREE`
pub fn cong_mod_squarefree() -> @kernel.Thm {
  cong_mod_squarefree_c.get()
}

///|
/// CONG_MOD_SQUAREFREE_EQ
fn step_120() -> Unit raise {
  let t1068 = @meson.asm_meson_tac(@list.List([cong_mod_squarefree()]))
  let t1067 = @list.List([@tactics.conv_tac(@int.number_rule), @tactics.all_tac])
  let t1069 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @tactics.eq_tac,
      ),
      t1067,
    ),
    t1068,
  )
  cong_mod_squarefree_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, squarefree(n) → op_eq_eq(a, b, mod(n)) == (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(a, b, mod(p)))"),
      t1069,
    ),
  )
}

///|
let cong_mod_squarefree_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MOD_SQUAREFREE_EQ",
)

///|
/// `CONG_MOD_SQUAREFREE_EQ`
pub fn cong_mod_squarefree_eq() -> @kernel.Thm {
  cong_mod_squarefree_eq_c.get()
}

///|
/// phi
fn step_121() -> Unit raise {
  phi_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(phi : (Num) -> Num)((n : Num)) == CARD({(m : Num) | 0 < m && m <= n && coprime((m, n))})"),
    ),
  )
}

///|
let phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("phi")

///|
/// `phi`
pub fn phi() -> @kernel.Thm {
  phi_c.get()
}

///|
/// PHI_ALT
fn step_122() -> Unit raise {
  let t1087 = @meson.asm_meson_tac(
    @list.List([@arith.le_lt(), @prime.coprime_refl(), @arith.lt_nz()]),
  )
  let t1088 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_0(), @prime.coprime_sym()])),
    t1087,
  ])
  let t1086 = @simp.asm_rewrite_tac(@list.List([@arith.lt()]))
  let t1085 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1084 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1083 = @simp.asm_rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1081 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1080 = @simp.rewrite_tac(@list.List([@prime.coprime_1()]))
  let t1079 = @simp.asm_rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_sing()]),
  )
  let t1078 = @list.List([
    @tactics.all_tac,
    @simp.simp_tac(
      @list.List([
        @sets.card_clauses(),
        @sets.finite_rules(),
        @sets.not_in_empty(),
      ]),
    ),
  ])
  let t1077 = @tactics.conjuncts_then(fn(
    x1074 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1075 = @tactics.subst1_tac(x1074)
    fn(
      x1076 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1075(x1076)
    }
  })
  let t1082 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("{(m : Num) | 0 < m && m <= (n : Num) && coprime((m, n))} == {1} && {(m : Num) | coprime((m, n)) && m < n} == {0}"),
                t1077,
              ),
              t1078,
            ),
            t1079,
          ),
          t1080,
        ),
        t1081,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1073 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1071 = @meson.meson_tac(@list.List([@arith.lt(), @arith.not_lt()]))
  let t1072 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.ap_term_tac,
        @simp.asm_rewrite_tac(
          @list.List([@sets.extension(), @sets.in_elim_thm()]),
        ),
      ),
      t1071,
    ),
    @tactics.all_tac,
  ])
  let t1070 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1089 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([phi()])),
                      t1070,
                    ),
                    t1072,
                  ),
                  t1073,
                ),
                t1082,
              ),
              @tactics.ap_term_tac,
            ),
            t1083,
          ),
          t1084,
        ),
        t1085,
      ),
      t1086,
    ),
    t1088,
  )
  phi_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("phi((n : Num)) == CARD({(m : Num) | coprime((m, n)) && m < n})"),
      t1089,
    ),
  )
}

///|
let phi_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_ALT")

///|
/// `PHI_ALT`
pub fn phi_alt() -> @kernel.Thm {
  phi_alt_c.get()
}

///|
/// PHI_FINITE_LEMMA
fn step_123() -> Unit raise {
  let t1092 = @simp.rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @sets.subset(),
      @iterate.in_numseg(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1091 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t1090 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1093 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1090),
        t1091,
      ),
      t1092,
    ),
    @int.arith_tac,
  )
  phi_finite_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, FINITE({(m : Num) | coprime((m, n)) && m < n})"),
      t1093,
    ),
  )
}

///|
let phi_finite_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_FINITE_LEMMA",
)

///|
/// `PHI_FINITE_LEMMA`
pub fn phi_finite_lemma() -> @kernel.Thm {
  phi_finite_lemma_c.get()
}

///|
/// PHI_ANOTHER
fn step_124() -> Unit raise {
  let t1096 = @meson.asm_meson_tac(
    @list.List([
      @arith.le_lt(),
      @prime.coprime_refl(),
      @prime.coprime_1(),
      @arith.lt_nz(),
    ]),
  )
  let t1095 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1094 = @simp.rewrite_tac(@list.List([phi()]))
  let t1097 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1094),
        @tactics.ap_term_tac,
      ),
      t1095,
    ),
    t1096,
  )
  phi_another_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 1) → phi(n) == CARD({(m : Num) | 0 < m && m < n && coprime((m, n))})"),
      t1097,
    ),
  )
}

///|
let phi_another_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_ANOTHER")

///|
/// `PHI_ANOTHER`
pub fn phi_another() -> @kernel.Thm {
  phi_another_c.get()
}

///|
/// PHI_LIMIT
fn step_125() -> Unit raise {
  let t1104 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1103 = @simp.asm_rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t1102 = @tactics.match_mp_tac(@sets.card_subset())
  let t1101 = @simp.gen_rewrite_tac(
    fn(
      x1098 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1099 = @equal.rand_conv(x1098)
      fn(x1100 : @kernel.Term) -> @kernel.Thm raise { s1099(x1100) }
    },
    @list.List([@equal.gsym(@sets.card_numseg_lt())]),
  )
  let t1105 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([phi_alt()])),
          ),
          t1101,
        ),
        t1102,
      ),
      t1103,
    ),
    t1104,
  )
  phi_limit_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, phi(n) <= n"), t1105))
}

///|
let phi_limit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_LIMIT")

///|
/// `PHI_LIMIT`
pub fn phi_limit() -> @kernel.Thm {
  phi_limit_c.get()
}

///|
/// PHI_LIMIT_STRONG
fn step_126() -> Unit raise {
  let t1118 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1117 = @simp.asm_rewrite_tac(@list.List([]))
  let t1116 = @tactics.match_mp_tac(@sets.card_subset())
  let t1115 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1108 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1109 = @tactics.assume_tac(x1108)
        fn(
          x1110 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1109(x1110)
        }
      },
      fn(
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
        (fn(
          x1111 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1112 = @tactics.subst1_tac(x1111)
          fn(
            x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1112(x1113)
          }
        })(@equal.sym(x1114))
      },
    ),
  )
  let t1107 = @simp.asm_simp_tac(@list.List([phi_another(), @sets.has_size()]))
  let t1106 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), finite_number_segment()),
  )
  let t1119 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1106),
            t1107,
          ),
          t1115,
        ),
        t1116,
      ),
      t1117,
    ),
    t1118,
  )
  phi_limit_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 1) → phi(n) <= n - 1"),
      t1119,
    ),
  )
}

///|
let phi_limit_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LIMIT_STRONG",
)

///|
/// `PHI_LIMIT_STRONG`
pub fn phi_limit_strong() -> @kernel.Thm {
  phi_limit_strong_c.get()
}

///|
/// PHI_0
fn step_127() -> Unit raise {
  let t1120 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1121 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), phi_limit())),
      t1120,
    ),
    @int.arith_tac,
  )
  phi_0_c.set(@tactics.prove(@term_syntax.parse_term("phi(0) == 0"), t1121))
}

///|
let phi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_0")

///|
/// `PHI_0`
pub fn phi_0() -> @kernel.Thm {
  phi_0_c.get()
}

///|
/// PHI_1
fn step_128() -> Unit raise {
  let t1122 = @simp.rewrite_tac(
    @list.List([phi_alt(), @prime.coprime_1(), @sets.card_numseg_lt()]),
  )
  phi_1_c.set(@tactics.prove(@term_syntax.parse_term("phi(1) == 1"), t1122))
}

///|
let phi_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_1")

///|
/// `PHI_1`
pub fn phi_1() -> @kernel.Thm {
  phi_1_c.get()
}

///|
/// PHI_LOWERBOUND_1_STRONG
fn step_129() -> Unit raise {
  let t1137 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1136 = @simp.rewrite_tac(
    @list.List([@sets.card_numseg_le(), @sets.finite_numseg_le()]),
  )
  let t1135 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Num) | b <= (n : Num)}"))
  let t1138 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1135),
      t1136,
    ),
    t1137,
  )
  let t1134 = @tactics.pop_assum(fn(
    x1131 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1132 = @tactics.mp_tac(x1131)
    fn(
      x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1132(x1133)
    }
  })
  let t1130 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.coprime_1(),
      ),
    ]),
  )
  let t1139 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.simp_tac(
              @list.List([
                @sets.subset(),
                @sets.in_insert(),
                @sets.not_in_empty(),
                @sets.in_elim_thm(),
              ]),
            ),
            t1130,
          ),
          @tactics.gen_tac,
        ),
        t1134,
      ),
      @int.arith_tac,
    ),
    t1138,
  ])
  let t1129 = @tactics.match_mp_tac(@sets.card_subset())
  let t1128 = @simp.rewrite_tac(@list.List([phi()]))
  let t1127 = @list.List([
    @simp.simp_tac(
      @list.List([
        @sets.card_clauses(),
        @sets.not_in_empty(),
        @sets.finite_rules(),
        @calc_num.arith(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1126 = @tactics.subgoal_then(@term_syntax.parse_term("1 == CARD({1})"), fn(
    x1123 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1124 = @tactics.subst1_tac(x1123)
    fn(
      x1125 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1124(x1125)
    }
  })
  let t1140 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1126),
            t1127,
          ),
          t1128,
        ),
        t1129,
      ),
      @tactics.conj_tac,
    ),
    t1139,
  )
  phi_lowerbound_1_strong_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → 1 <= phi(n)"), t1140),
  )
}

///|
let phi_lowerbound_1_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_1_STRONG",
)

///|
/// `PHI_LOWERBOUND_1_STRONG`
pub fn phi_lowerbound_1_strong() -> @kernel.Thm {
  phi_lowerbound_1_strong_c.get()
}

///|
/// PHI_LOWERBOUND_1
fn step_130() -> Unit raise {
  let t1141 = @meson.meson_tac(
    @list.List([
      phi_lowerbound_1_strong(),
      @arith.le_trans(),
      @int.arith_rule(@term_syntax.parse_term("1 <= 2")),
    ]),
  )
  phi_lowerbound_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 2 <= n → 1 <= phi(n)"), t1141),
  )
}

///|
let phi_lowerbound_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_1",
)

///|
/// `PHI_LOWERBOUND_1`
pub fn phi_lowerbound_1() -> @kernel.Thm {
  phi_lowerbound_1_c.get()
}

///|
/// PHI_LOWERBOUND_2
fn step_131() -> Unit raise {
  let t1167 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1166 = @simp.rewrite_tac(
    @list.List([@sets.card_numseg_le(), @sets.finite_numseg_le()]),
  )
  let t1165 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Num) | b <= (n : Num)}"))
  let t1168 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1165),
      t1166,
    ),
    t1167,
  )
  let t1163 = @simp.asm_simp_tac(@list.List([@prime.divides_sub()]))
  let t1164 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("3 <= (n : Num)")),
      @int.arith_tac,
    ),
    t1163,
  ])
  let t1162 = @tactics.subgoal_then(@term_syntax.parse_term("1 == (n : Num) - (n - 1)"), fn(
    x1159 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1160 = @tactics.subst1_tac(x1159)
    fn(
      x1161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1160(x1161)
    }
  })
  let t1158 = @simp.asm_rewrite_tac(@list.List([]))
  let t1157 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1156 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1154 = @bool.conjunct1(@prime.coprime_1())
  let t1155 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), t1154))
  let t1153 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1152 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1151 = @simp.asm_simp_tac(
    @list.List([
      @calc_num.arith(),
      @int.arith_rule(
        @term_syntax.parse_term("3 <= (n : Num) → 0 < n - 1 && n - 1 <= n && 1 <= n"),
      ),
    ]),
  )
  let t1150 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t1169 = @list.List([
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
                              @simp.simp_tac(
                                @list.List([
                                  @sets.subset(),
                                  @sets.in_insert(),
                                  @sets.not_in_empty(),
                                  @sets.in_elim_thm(),
                                ]),
                              ),
                              @tactics.gen_tac,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1150,
                        ),
                        t1151,
                      ),
                      t1152,
                    ),
                    t1153,
                  ),
                  @tactics.strip_tac,
                ),
                t1155,
              ),
              t1156,
            ),
            t1157,
          ),
          t1158,
        ),
        t1162,
      ),
      t1164,
    ),
    t1168,
  ])
  let t1149 = @tactics.match_mp_tac(@sets.card_subset())
  let t1148 = @simp.rewrite_tac(@list.List([phi()]))
  let t1146 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → !(1 == n - 1)"))]),
  )
  let t1147 = @list.List([
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @sets.card_clauses(),
          @sets.in_insert(),
          @sets.not_in_empty(),
          @sets.finite_rules(),
          @calc_num.arith(),
        ]),
      ),
      t1146,
    ),
    @tactics.all_tac,
  ])
  let t1145 = @tactics.subgoal_then(@term_syntax.parse_term("2 == CARD({1, (n : Num) - 1})"), fn(
    x1142 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1143 = @tactics.subst1_tac(x1142)
    fn(
      x1144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1143(x1144)
    }
  })
  let t1170 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1145),
            t1147,
          ),
          t1148,
        ),
        t1149,
      ),
      @tactics.conj_tac,
    ),
    t1169,
  )
  phi_lowerbound_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → 2 <= phi(n)"), t1170),
  )
}

///|
let phi_lowerbound_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_2",
)

///|
/// `PHI_LOWERBOUND_2`
pub fn phi_lowerbound_2() -> @kernel.Thm {
  phi_lowerbound_2_c.get()
}

///|
/// PHI_EQ_0
fn step_132() -> Unit raise {
  let t1172 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), phi_lowerbound_1_strong()),
  )
  let t1171 = @simp.simp_tac(@list.List([phi_0()]))
  let t1173 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
        t1171,
      ),
      t1172,
    ),
    @int.arith_tac,
  )
  phi_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, (phi(n) == 0) == (n == 0)"), t1173),
  )
}

///|
let phi_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_EQ_0")

///|
/// `PHI_EQ_0`
pub fn phi_eq_0() -> @kernel.Thm {
  phi_eq_0_c.get()
}

///|
/// PHI_PRIME_EQ
fn step_133() -> Unit raise {
  let t1196 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1195 = @simp.asm_rewrite_tac(@list.List([]))
  let t1194 = @tactics.match_mp_tac(@sets.card_subset_eq())
  let t1193 = @simp.simp_tac(@list.List([]))
  let t1191 = @tactics.conv_tac(@class.taut)
  let t1190 = @simp.rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1192 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.extension(), @sets.in_elim_thm()]),
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.abs_tac,
        ),
        t1190,
      ),
      t1191,
    ),
  ])
  let t1189 = @tactics.exists_tac(
    @term_syntax.parse_term("{(m : Num) | 0 < m && m < (n : Num) && coprime((m, n))} == {(m : Num) | 0 < m && m < n}"),
  )
  let t1188 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1187 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1180 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1181 = @tactics.assume_tac(x1180)
        fn(
          x1182 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1181(x1182)
        }
      },
      fn(
        x1186 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1183 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1184 = @tactics.subst1_tac(x1183)
          fn(
            x1185 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1184(x1185)
          }
        })(@equal.sym(x1186))
      },
    ),
  )
  let t1179 = @simp.asm_simp_tac(@list.List([phi_another(), @sets.has_size()]))
  let t1178 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), finite_number_segment()),
  )
  let t1177 = @simp.asm_rewrite_tac(@list.List([phi_1(), @calc_num.arith()]))
  let t1176 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1175 = @simp.asm_rewrite_tac(@list.List([]))
  let t1174 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1197 = @tactics.then_tac(
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
                                      @tactics.gen_tac,
                                      @simp.rewrite_tac(
                                        @list.List([@prime.prime()]),
                                      ),
                                    ),
                                    t1174,
                                  ),
                                  t1175,
                                ),
                                t1176,
                              ),
                              t1177,
                            ),
                            t1178,
                          ),
                          t1179,
                        ),
                        t1187,
                      ),
                      t1188,
                    ),
                    t1189,
                  ),
                  @tactics.conj_tac,
                ),
                t1192,
              ),
              @tactics.eq_tac,
            ),
            t1193,
          ),
          @tactics.disch_tac,
        ),
        t1194,
      ),
      t1195,
    ),
    t1196,
  )
  phi_prime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (phi(n) == n - 1 && !(n == 0) && !(n == 1)) == prime(n)"),
      t1197,
    ),
  )
}

///|
let phi_prime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_PRIME_EQ")

///|
/// `PHI_PRIME_EQ`
pub fn phi_prime_eq() -> @kernel.Thm {
  phi_prime_eq_c.get()
}

///|
/// PHI_PRIME
fn step_134() -> Unit raise {
  let t1198 = @meson.meson_tac(@list.List([phi_prime_eq()]))
  phi_prime_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → phi(p) == p - 1"), t1198),
  )
}

///|
let phi_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_PRIME")

///|
/// `PHI_PRIME`
pub fn phi_prime() -> @kernel.Thm {
  phi_prime_c.get()
}

///|
/// PHI_PRIMEPOW_SUC
fn step_135() -> Unit raise {
  let t1224 = @simp.asm_simp_tac(
    @list.List([@arith.lt_mult_lcancel(), @prime.prime_imp_nz()]),
  )
  let t1223 = @tactics.undisch_tac(@term_syntax.parse_term("(p : Num) * (n : Num) < p * EXP(p, (k : Num))"))
  let t1222 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1221 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_elim_thm()]),
  )
  let t1220 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(
      x1217 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1218 = @tactics.subst_all_tac(x1217)
      fn(
        x1219 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1218(x1219)
      }
    }),
  )
  let t1216 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1210 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1211 = @tactics.mp_tac(x1210)
        fn(
          x1212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1211(x1212)
        }
      },
      fn(
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
        let s1214 = @tactics.assume_tac(x1213)
        fn(
          x1215 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1214(x1215)
        }
      },
    ),
  )
  let t1209 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t1208 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1207 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @equal.gsym(@arith.add1()),
      @arith.exp(),
      @arith.lt_mult_lcancel(),
      @prime.prime_imp_nz(),
    ]),
  )
  let t1206 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @class.taut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == ((a → b) && (b → a))")),
      @theorems.forall_and_thm(),
      @sets.forall_in_image(),
    ]),
  )
  let t1205 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(m : Num) | divides((p : Num), m) && m < EXP(p, (k : Num) + 1)} == IMAGE((x : Num) => p * x, {(m : Num) | m < EXP(p, k)})"),
    fn(
      x1203 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1203
      @simp.asm_simp_tac(
        @list.List([
          th,
          @sets.card_image_inj(),
          @arith.eq_mult_lcancel(),
          @prime.prime_imp_nz(),
          @sets.finite_numseg_lt(),
          @sets.card_numseg_lt(),
        ]),
      )
    },
  )
  let t1202 = @simp.rewrite_tac(@list.List([@sets.card_numseg_lt()]))
  let t1201 = @simp.simp_tac(
    @list.List([
      @sets.finite_numseg_lt(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @sets.card_diff(),
    ]),
  )
  let t1200 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(n : _) | !(P : (_) -> Bool)(n) && (Q : (_) -> Bool)(n)} == DIFF({(n : _) | Q(n)}, {(n : _) | P(n) && Q(n)})"),
      ),
    ]),
  )
  let t1199 = @simp.asm_simp_tac(
    @list.List([
      phi_alt(),
      @prime.coprime_primepow(),
      @arith.add_eq_0(),
      @calc_num.arith(),
    ]),
  )
  let t1225 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.strip_tac),
                                      t1199,
                                    ),
                                    t1200,
                                  ),
                                  t1201,
                                ),
                                t1202,
                              ),
                              @tactics.ap_term_tac,
                            ),
                            t1205,
                          ),
                          t1206,
                        ),
                        t1207,
                      ),
                      @tactics.conj_tac,
                    ),
                    @list.List([@tactics.all_tac, @int.number_tac]),
                  ),
                  t1208,
                ),
                t1209,
              ),
              t1216,
            ),
            t1220,
          ),
          t1221,
        ),
        t1222,
      ),
      t1223,
    ),
    t1224,
  )
  phi_primepow_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) → phi(EXP(p, k + 1)) == EXP(p, k + 1) - EXP(p, k)"),
      t1225,
    ),
  )
}

///|
let phi_primepow_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_PRIMEPOW_SUC",
)

///|
/// `PHI_PRIMEPOW_SUC`
pub fn phi_primepow_suc() -> @kernel.Thm {
  phi_primepow_suc_c.get()
}

///|
/// PHI_PRIMEPOW
fn step_136() -> Unit raise {
  let t1227 = @simp.asm_simp_tac(
    @list.List([@arith.add1(), phi_primepow_suc(), @arith.add_sub()]),
  )
  let t1226 = @simp.rewrite_tac(
    @list.List([@nums.not_suc(), @bool.conjunct1(@arith.exp()), phi_1()]),
  )
  let t1228 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
            @tactics.gen_tac,
          ),
          @tactics.disch_tac,
        ),
        @nums.induct_tac,
      ),
      t1226,
    ),
    t1227,
  )
  phi_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) → phi(EXP(p, k)) == (if k == 0 { 1 } else { EXP(p, k) - EXP(p, k - 1) })"),
      t1228,
    ),
  )
}

///|
let phi_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_PRIMEPOW")

///|
/// `PHI_PRIMEPOW`
pub fn phi_primepow() -> @kernel.Thm {
  phi_primepow_c.get()
}

///|
/// PHI_PRIMEPOW_ALT
fn step_137() -> Unit raise {
  let t1233 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) → SUC(k - 1) == k")),
    ]),
  )
  let t1232 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @equal.gsym(@bool.conjunct2(@arith.exp())),
    ]),
  )
  let t1231 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t1230 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1229 = @simp.asm_simp_tac(@list.List([phi_primepow()]))
  let t1234 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.strip_tac),
              @class.cond_cases_tac,
            ),
            t1229,
          ),
          t1230,
        ),
        t1231,
      ),
      t1232,
    ),
    t1233,
  )
  phi_primepow_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) → phi(EXP(p, k)) == (if k == 0 { 1 } else { EXP(p, k - 1) * (p - 1) })"),
      t1234,
    ),
  )
}

///|
let phi_primepow_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_PRIMEPOW_ALT",
)

///|
/// `PHI_PRIMEPOW_ALT`
pub fn phi_primepow_alt() -> @kernel.Thm {
  phi_primepow_alt_c.get()
}

///|
/// PHI_2
fn step_138() -> Unit raise {
  let t1235 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1236 = @tactics.then_tac(
    @simp.simp_tac(@list.List([phi_prime(), @prime.prime_2()])),
    t1235,
  )
  phi_2_c.set(@tactics.prove(@term_syntax.parse_term("phi(2) == 1"), t1236))
}

///|
let phi_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_2")

///|
/// `PHI_2`
pub fn phi_2() -> @kernel.Thm {
  phi_2_c.get()
}

///|
/// PHI_MULTIPLICATIVE
fn step_139() -> Unit raise {
  let t1256 = @simp.asm_simp_tac(@list.List([@int.cong_v1(), @arith.mod_lt()]))
  let t1252 = @term_syntax.parse_term("(n : Num)")
  let t1253 = @term_syntax.parse_term("(m : Num)")
  let t1254 = @term_syntax.parse_term("(b : Num)")
  let t1255 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t1254, t1253, t1252]),
      chinese_remainder_coprime_unique(),
    ),
  )
  let t1251 = @simp.asm_rewrite_tac(
    @list.List([@pair.pair_eq(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t1249 = @term_syntax.parse_term("(n : Num)")
  let t1250 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t1249]),
  )
  let t1248 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1247 = @tactics.x_gen_tac(@term_syntax.parse_term("(pp : (Num, Num))"))
  let t1246 = @list.List([
    @meson.meson_tac(
      @list.List([@prime.coprime_lmul2(), @prime.coprime_rmul2()]),
    ),
    @tactics.all_tac,
  ])
  let t1245 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @int.coprime_lmod(), @arith.division()]),
  )
  let t1244 = @simp.rewrite_tac(
    @list.List([phi_finite_lemma(), @sets.in_elim_pair_thm()]),
  )
  let t1243 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => (MOD(p, (a : Num)), MOD(p, (b : Num)))"))
  let t1242 = @tactics.match_mp_tac(@sets.card_image_inj_eq())
  let t1241 = @tactics.conv_tac(@equal.sym_conv)
  let t1240 = @simp.simp_tac(
    @list.List([
      phi_alt(),
      @equal.gsym(@sets.card_product()),
      phi_finite_lemma(),
    ]),
  )
  let t1239 = @simp.asm_rewrite_tac(
    @list.List([phi_0(), @arith.mult_clauses()]),
  )
  let t1237 = @term_syntax.parse_term("(b : Num) == 0")
  let t1238 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(a : Num) == 0"), t1237]),
  )
  let t1257 = @tactics.then_tac(
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
                                    @tactics.repeat_tac(@tactics.strip_tac),
                                    t1238,
                                  ),
                                  t1239,
                                ),
                                t1240,
                              ),
                              t1241,
                            ),
                            t1242,
                          ),
                          t1243,
                        ),
                        t1244,
                      ),
                      t1245,
                    ),
                    @tactics.conj_tac,
                  ),
                  t1246,
                ),
                t1247,
              ),
              t1248,
            ),
            t1250,
          ),
          @tactics.strip_tac,
        ),
        t1251,
      ),
      t1255,
    ),
    t1256,
  )
  phi_multiplicative_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) → phi(a * b) == phi(a) * phi(b)"),
      t1257,
    ),
  )
}

///|
let phi_multiplicative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_MULTIPLICATIVE",
)

///|
/// `PHI_MULTIPLICATIVE`
pub fn phi_multiplicative() -> @kernel.Thm {
  phi_multiplicative_c.get()
}

///|
/// EVEN_PHI
fn step_140() -> Unit raise {
  let t1268 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_odd())]))
  let t1267 = @simp.asm_rewrite_tac(@list.List([]))
  let t1269 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1")),
        t1267,
      ),
      @int.asm_arith_tac,
    ),
    t1268,
  ])
  let t1266 = @simp.asm_rewrite_tac(@list.List([]))
  let t1263 = @drule.match_mp(@prime.prime_odd())
  let t1265 = @tactics.first_assum(fn(
    x1264 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.disj_cases_tac(t1263(x1264))
  })
  let t1262 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1261 = @simp.rewrite_tac(@list.List([@arith.even_exp()]))
  let t1260 = @list.List([
    @meson.meson_tac(
      @list.List([
        @prime.coprime_refl(),
        @int.arith_rule(@term_syntax.parse_term("!(2 == 1)")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1259 = @simp.simp_tac(
    @list.List([
      phi_primepow(),
      phi_multiplicative(),
      @arith.even_mult(),
      @arith.even_sub(),
    ]),
  )
  let t1258 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t1270 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([
                          @int.arith_rule(
                            @term_syntax.parse_term("(3 <= (n : Num)) == (1 < n && !(n == 2))"),
                          ),
                          @theorems.imp_conj(),
                        ]),
                      ),
                      t1258,
                    ),
                    t1259,
                  ),
                  @tactics.conj_tac,
                ),
                t1260,
              ),
              t1261,
            ),
            t1262,
          ),
          @tactics.strip_tac,
        ),
        t1265,
      ),
      t1266,
    ),
    t1269,
  )
  even_phi_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → EVEN(phi(n))"), t1270),
  )
}

///|
let even_phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_PHI")

///|
/// `EVEN_PHI`
pub fn even_phi() -> @kernel.Thm {
  even_phi_c.get()
}

///|
/// EVEN_PHI_EQ
fn step_141() -> Unit raise {
  let t1274 = @tactics.then_tac(
    @tactics.strip_tac,
    @simp.asm_simp_tac(@list.List([phi_0(), even_phi(), @arith.even()])),
  )
  let t1273 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1272 = @simp.asm_rewrite_tac(@list.List([phi_1(), phi_2()]))
  let t1271 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("!((n : Num) == 0 || 3 <= n) == (n == 1 || n == 2)"),
      ),
    ]),
  )
  let t1275 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(
              @list.List([@equal.gsym(@class.contrapos_thm())]),
            ),
            t1271,
          ),
          @tactics.strip_tac,
        ),
        t1272,
      ),
      t1273,
    ),
    t1274,
  ])
  let t1276 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
    t1275,
  )
  even_phi_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, EVEN(phi(n)) == (n == 0 || 3 <= n)"),
      t1276,
    ),
  )
}

///|
let even_phi_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_PHI_EQ")

///|
/// `EVEN_PHI_EQ`
pub fn even_phi_eq() -> @kernel.Thm {
  even_phi_eq_c.get()
}

///|
/// ODD_PHI_EQ
fn step_142() -> Unit raise {
  let t1277 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@arith.not_even()), even_phi_eq()]),
    ),
    @int.arith_tac,
  )
  odd_phi_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ODD(phi(n)) == (n == 1 || n == 2)"),
      t1277,
    ),
  )
}

///|
let odd_phi_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_PHI_EQ")

///|
/// `ODD_PHI_EQ`
pub fn odd_phi_eq() -> @kernel.Thm {
  odd_phi_eq_c.get()
}

///|
/// PHI_EQ_PRIME
fn step_143() -> Unit raise {
  let t1310 = @meson.asm_meson_tac(
    @list.List([@prime.prime_0(), @prime.prime_1()]),
  )
  let t1309 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((k : Num) - 1 == 0) == (k == 0 || k == 1)")),
    ]),
  )
  let t1308 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_eq_0(),
      @arith.le_exp(),
      @arith.exp_eq_1(),
      @int.arith_rule(@term_syntax.parse_term("(k : Num) - 1 <= k")),
    ]),
  )
  let t1305 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("EXP((p : Num), (k : Num)) - EXP(p, (k1 : Num)) == EXP(p, k) - 1 → !(EXP(p, k) == 0) && EXP(p, k1) <= EXP(p, k) → EXP(p, k1) == 1"),
    ),
  )
  let t1307 = @tactics.first_x_assum(fn(
    x1306 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1302 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1303 = @tactics.mp_tac(x1302)
      fn(
        x1304 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1303(x1304)
      }
    })(t1305(x1306))
  })
  let t1301 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1300 = @simp.simp_tac(@list.List([phi_primepow(), @prime.prime_exp()]))
  let t1299 = @term_syntax.parse_term("(k : Num)")
  let t1311 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.map_every(
                @tactics.x_gen_tac,
                @list.List([@term_syntax.parse_term("(p : Num)"), t1299]),
              ),
              t1300,
            ),
            t1301,
          ),
          t1307,
        ),
        t1308,
      ),
      t1309,
    ),
    t1310,
  )
  let t1298 = @tactics.thenl(
    @tactics.conj_tac,
    @list.List([@tactics.all_tac, @tactics.match_mp_tac(phi_limit_strong())]),
  )
  let t1297 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((n : Num) == 0) && (m : Num) <= n - 1 → m + 1 <= n"),
    ),
  )
  let t1296 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1295 = @simp.asm_simp_tac(
    @list.List([
      phi_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)")),
    ]),
  )
  let t1294 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((m : Num) == 0 && (n : Num) == 0) && (m + 1) * (n + 1) <= (k : Num) → !(m * n == k - 1)"),
    ),
  )
  let t1293 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")),
  )
  let t1292 = @simp.asm_simp_tac(@list.List([phi_multiplicative()]))
  let t1291 = @term_syntax.parse_term("(n : Num)")
  let t1312 = @list.List([
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
                        @tactics.map_every(
                          @tactics.x_gen_tac,
                          @list.List([@term_syntax.parse_term("(m : Num)"), t1291]),
                        ),
                        @tactics.strip_tac,
                      ),
                      t1292,
                    ),
                    t1293,
                  ),
                  t1294,
                ),
                t1295,
              ),
              t1296,
            ),
            @tactics.conj_tac,
          ),
          t1297,
        ),
        t1298,
      ),
      @int.asm_arith_tac,
    ),
    t1311,
  ])
  let t1290 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t1288 = @term_syntax.parse_term("(n : Num)")
  let t1289 = @tactics.spec_tac(@term_syntax.parse_term("(p : Num)"), t1288)
  let t1287 = @list.List([
    @int.asm_arith_tac,
    @tactics.pop_assum_list(fn(
      x1286 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
  ])
  let t1285 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (p : Num)"), fn(
    x1282 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1283 = @tactics.mp_tac(x1282)
    fn(
      x1284 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1283(x1284)
    }
  })
  let t1281 = @simp.rewrite_tac(@list.List([phi_prime()]))
  let t1280 = @simp.asm_rewrite_tac(
    @list.List([phi_1(), @prime.prime_1(), @calc_num.arith()]),
  )
  let t1279 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1278 = @simp.asm_rewrite_tac(@list.List([phi_0(), @calc_num.arith()]))
  let t1313 = @tactics.thenl(
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
                          @tactics.gen_tac,
                          @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")),
                        ),
                        t1278,
                      ),
                      t1279,
                    ),
                    t1280,
                  ),
                  @tactics.eq_tac,
                ),
                t1281,
              ),
              t1285,
            ),
            t1287,
          ),
          t1289,
        ),
        t1290,
      ),
      @tactics.conj_tac,
    ),
    t1312,
  )
  phi_eq_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, (phi(p) == p - 1) == (p == 0 || prime(p))"),
      t1313,
    ),
  )
}

///|
let phi_eq_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_EQ_PRIME")

///|
/// `PHI_EQ_PRIME`
pub fn phi_eq_prime() -> @kernel.Thm {
  phi_eq_prime_c.get()
}

///|
/// PHI_LIMIT_COMPOSITE
fn step_144() -> Unit raise {
  let t1314 = @simp.asm_simp_tac(
    @list.List([@arith.lt_le(), phi_limit_strong(), phi_eq_prime()]),
  )
  let t1315 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1314)
  phi_limit_composite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !prime(n) && !(n == 0) && !(n == 1) → phi(n) < n - 1"),
      t1315,
    ),
  )
}

///|
let phi_limit_composite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LIMIT_COMPOSITE",
)

///|
/// `PHI_LIMIT_COMPOSITE`
pub fn phi_limit_composite() -> @kernel.Thm {
  phi_limit_composite_c.get()
}

///|
/// NPRODUCT_MOD
fn step_145() -> Unit raise {
  let t1321 = @simp.asm_simp_tac(@list.List([cong_mod()]))
  let t1320 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1319 = @simp.simp_tac(
    @list.List([@iterate.neutral_mul(), cong_mult(), cong_refl()]),
  )
  let t1317 = @drule.match_mp(@iterate.iterate_related())(
    @iterate.monoidal_mul(),
  )
  let t1318 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Num) => (y : Num) => op_eq_eq(x, y, mod((n : Num)))"), t1317),
  )
  let t1316 = @simp.rewrite_tac(@list.List([@iterate.nproduct()]))
  let t1322 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1316),
          t1318,
        ),
        t1319,
      ),
      t1320,
    ),
    t1321,
  )
  nproduct_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : (A) -> Num, ∀ n : Num, FINITE(s) && !(n == 0) → op_eq_eq(nproduct(s, (m : A) => MOD(a(m), n)), nproduct(s, a), mod(n))"),
      t1322,
    ),
  )
}

///|
let nproduct_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_MOD")

///|
/// `NPRODUCT_MOD`
pub fn nproduct_mod() -> @kernel.Thm {
  nproduct_mod_c.get()
}

///|
/// NPRODUCT_CMUL
fn step_146() -> Unit raise {
  let t1325 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1324 = @simp.asm_simp_tac(
    @list.List([
      @iterate.iterate_clauses(),
      @iterate.monoidal_mul(),
      @iterate.neutral_mul(),
      @sets.card_clauses(),
      @arith.exp(),
      @arith.mult_clauses(),
    ]),
  )
  let t1323 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1326 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@iterate.nproduct(), @theorems.right_forall_imp_thm()]),
        ),
        t1323,
      ),
      t1324,
    ),
    t1325,
  )
  nproduct_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ a : (_) -> Num, ∀ c : Num, FINITE(s) → nproduct(s, (m : _) => c * a(m)) == EXP(c, CARD(s)) * nproduct(s, a)"),
      t1326,
    ),
  )
}

///|
let nproduct_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_CMUL")

///|
/// `NPRODUCT_CMUL`
pub fn nproduct_cmul() -> @kernel.Thm {
  nproduct_cmul_c.get()
}

///|
/// ITERATE_OVER_COPRIME
fn step_147() -> Unit raise {
  let t1327 = @meson.meson_tac(
    @list.List([cong_refl(), cong_sym(), cong_trans(), cong_mult(), cong_mod()]),
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("!((n : Num) == 0) → op_eq_eq((a : Num) * MOD((x : Num), n), (b : Num), mod(n)) == op_eq_eq(a * x, b, mod(n))"),
    t1327,
  )
  let t1346 = @tactics.conv_tac(@int.number_rule)
  let t1345 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((k : Num) * (m : Num), 1, mod((n : Num)))"))
  let t1343 = @simp.asm_simp_tac(@list.List([@int.cong_lmod()]))
  let t1344 = @tactics.try_tac(
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t1343),
  )
  let t1342 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1341 = @simp.asm_simp_tac(
    @list.List([
      @int.coprime_lmod(),
      cong_mod_lt(),
      @int.cong_lmod(),
      @arith.division(),
      lemma,
      @prime.coprime_lmul(),
    ]),
  )
  let t1340 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1338 = @term_syntax.parse_term("(x : Num) => MOD((m : Num) * x, (n : Num))")
  let t1339 = @tactics.map_every(
    fn(
      x1335 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1336 = @tactics.exists_tac(x1335)
      fn(
        x1337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1336(x1337)
      }
    },
    @list.List([@term_syntax.parse_term("(x : Num) => MOD((k : Num) * x, (n : Num))"), t1338]),
  )
  let t1332 = @drule.match_mp(@iterate.iterate_eq_general_inverses())
  let t1334 = @tactics.first_assum(fn(
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
    @tactics.match_mp_tac(t1332(x1333))
  })
  let t1331 = @list.List([
    @meson.asm_meson_tac(
      @list.List([cong_solve(), @arith.mult_sym(), cong_sym()]),
    ),
    @tactics.all_tac,
  ])
  let t1330 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ m : Num, op_eq_eq((k : Num) * m, 1, mod((n : Num)))"),
    @tactics.choose_tac,
  )
  let t1329 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @arith.lt(),
        @sets.set_rule(@term_syntax.parse_term("{(x : _) | false} == {}")),
        @iterate.iterate_clauses(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1328 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1347 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t1328,
                          ),
                          t1329,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1330,
                    ),
                    t1331,
                  ),
                  t1334,
                ),
                t1339,
              ),
              t1340,
            ),
            t1341,
          ),
          t1342,
        ),
        t1344,
      ),
      t1345,
    ),
    t1346,
  )
  iterate_over_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (_, _) -> _, ∀ f : (Num) -> _, ∀ n : Num, ∀ k : Num, monoidal(op) && coprime((k, n)) && (∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(n)) → f(x) == f(y)) → iterate(op, {(d : Num) | coprime((d, n)) && d < n}, (m : Num) => f(k * m)) == iterate(op, {(d : Num) | coprime((d, n)) && d < n}, f)"),
      t1347,
    ),
  )
}

///|
let iterate_over_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_OVER_COPRIME",
)

///|
/// `ITERATE_OVER_COPRIME`
pub fn iterate_over_coprime() -> @kernel.Thm {
  iterate_over_coprime_c.get()
}

///|
/// ITERATE_ITERATE_DIVISORS
fn step_148() -> Unit raise {
  let t1372 = @simp.asm_simp_tac(
    @list.List([
      @arith.div_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
    ]),
  )
  let t1369 = @drule.match_mp(@int.divides_le())
  let t1371 = @tactics.first_x_assum(fn(
    x1370 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1366 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1367 = @tactics.mp_tac(x1366)
      fn(
        x1368 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1367(x1368)
      }
    })(t1369(x1370))
  })
  let t1365 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(
      @list.List([@int.divides_div_mult(), @arith.mult_sym()]),
    ),
  ])
  let t1364 = @simp.asm_simp_tac(@list.List([@arith.div_mono()]))
  let t1363 = @simp.asm_rewrite_tac(@list.List([@prime.divides_zero()]))
  let t1362 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1373 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)")),
                      t1362,
                    ),
                    t1363,
                  ),
                  @list.List([@int.arith_tac, @tactics.all_tac]),
                ),
                @tactics.strip_tac,
              ),
              t1364,
            ),
            @tactics.conj_tac,
          ),
          t1365,
        ),
        t1371,
      ),
      t1372,
    ),
    @int.asm_arith_tac,
  )
  let t1361 = @tactics.disch_then(fn(
    x1360 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t1359 = @simp.simp_tac(
    @list.List([
      @arith.mult_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
    ]),
  )
  let t1358 = @simp.simp_tac(
    @list.List([
      @arith.div_mult(),
      @arith.le_1(),
      @equal.gsym(@arith.le_rdiv_eq()),
    ]),
  )
  let t1374 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")),
            t1358,
          ),
          t1359,
        ),
        t1361,
      ),
      @int.number_tac,
    ),
    t1373,
  ])
  let t1357 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1356 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1355 = @simp.asm_simp_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t1353 = @term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ n : Num, ∀ k : Num, GEQ(f((n, k)), (n * k, n)))")
  let t1354 = @tactics.map_every(
    fn(
      x1350 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1351 = @tactics.exists_tac(x1350)
      fn(
        x1352 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1351(x1352)
      }
    },
    @list.List([@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ n : Num, ∀ d : Num, GEQ(f((n, d)), (d, DIV(n, d))))"), t1353]),
  )
  let t1349 = @tactics.match_mp_tac(
    @simp.rewrite_rule(
      @list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]),
    )(@iterate.iterate_eq_general_inverses()),
  )
  let t1348 = @simp.asm_simp_tac(
    @list.List([
      @iterate.iterate_iterate_product(),
      @iterate.finite_numseg(),
      @prime.finite_divisors(),
      @iterate.in_numseg(),
      @arith.le_1(),
    ]),
  )
  let t1375 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1348,
                ),
                t1349,
              ),
              t1354,
            ),
            t1355,
          ),
          @tactics.conj_tac,
        ),
        t1356,
      ),
      t1357,
    ),
    t1374,
  )
  iterate_iterate_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, ∀ f : (Num, Num) -> A, ∀ x : Num, monoidal(op) → iterate(op, op_dot_dot(1, x), (n : Num) => iterate(op, {(d : Num) | divides(d, n)}, f(n))) == iterate(op, op_dot_dot(1, x), (n : Num) => iterate(op, op_dot_dot(1, DIV(x, n)), (k : Num) => f(k * n, n)))"),
      t1375,
    ),
  )
}

///|
let iterate_iterate_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_ITERATE_DIVISORS",
)

///|
/// `ITERATE_ITERATE_DIVISORS`
pub fn iterate_iterate_divisors() -> @kernel.Thm {
  iterate_iterate_divisors_c.get()
}

///|
/// FERMAT_LITTLE
fn step_149() -> Unit raise {
  let t1397 = @simp.asm_simp_tac(@list.List([phi_finite_lemma()]))
  let t1396 = @tactics.match_mp_tac(nproduct_mod())
  let t1395 = @simp.once_rewrite_tac(@list.List([cong_sym()]))
  let t1393 = @equal.gsym(@iterate.nproduct())
  let t1394 = @simp.asm_simp_tac(
    @list.List([@iterate.monoidal_mul(), @equal.gsym(@int.cong_v1()), t1393]),
  )
  let t1389 = @term_syntax.parse_term("(a : Num)")
  let t1390 = @term_syntax.parse_term("(n : Num)")
  let t1391 = @term_syntax.parse_term("(x : Num) => MOD(x, (n : Num))")
  let t1392 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("op_star"),
        t1391,
        t1390,
        t1389,
      ]),
      iterate_over_coprime(),
    ),
  )
  let t1388 = @simp.asm_simp_tac(
    @list.List([nproduct_mod(), phi_finite_lemma()]),
  )
  let t1387 = @tactics.exists_tac(
    @term_syntax.parse_term("nproduct({(m : Num) | coprime((m, (n : Num))) && m < n}, (m : Num) => MOD((a : Num) * m, n))"),
  )
  let t1386 = @tactics.match_mp_tac(cong_trans())
  let t1385 = @simp.once_rewrite_tac(@list.List([cong_sym()]))
  let t1383 = @equal.gsym(nproduct_cmul())
  let t1384 = @simp.simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.coprime_nproduct(),
      ),
      phi_finite_lemma(),
      t1383,
    ]),
  )
  let t1382 = @simp.rewrite_tac(@list.List([phi_alt(), @arith.mult_clauses()]))
  let t1381 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1380 = @tactics.exists_tac(
    @term_syntax.parse_term("nproduct({(m : Num) | coprime((m, (n : Num))) && m < n}, (m : Num) => m)"),
  )
  let t1379 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t1378 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1377 = @simp.asm_simp_tac(
    @list.List([@prime.coprime_0(), phi_0(), cong_mod_0()]),
  )
  let t1376 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1398 = @tactics.then_tac(
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
                                        @tactics.repeat_tac(@tactics.gen_tac),
                                        t1376,
                                      ),
                                      t1377,
                                    ),
                                    t1378,
                                  ),
                                  @tactics.disch_tac,
                                ),
                                t1379,
                              ),
                              t1380,
                            ),
                            t1381,
                          ),
                          t1382,
                        ),
                        t1384,
                      ),
                      t1385,
                    ),
                    t1386,
                  ),
                  t1387,
                ),
                t1388,
              ),
              t1392,
            ),
            t1394,
          ),
          @tactics.disch_tac,
        ),
        t1395,
      ),
      t1396,
    ),
    t1397,
  )
  fermat_little_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, coprime((a, n)) → op_eq_eq(EXP(a, phi(n)), 1, mod(n))"),
      t1398,
    ),
  )
}

///|
let fermat_little_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FERMAT_LITTLE")

///|
/// `FERMAT_LITTLE`
pub fn fermat_little() -> @kernel.Thm {
  fermat_little_c.get()
}

///|
/// FERMAT_LITTLE_PRIME
fn step_150() -> Unit raise {
  let t1399 = @meson.meson_tac(@list.List([fermat_little(), phi_prime_eq()]))
  fermat_little_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && coprime((a, p)) → op_eq_eq(EXP(a, p - 1), 1, mod(p))"),
      t1399,
    ),
  )
}

///|
let fermat_little_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FERMAT_LITTLE_PRIME",
)

///|
/// `FERMAT_LITTLE_PRIME`
pub fn fermat_little_prime() -> @kernel.Thm {
  fermat_little_prime_c.get()
}

///|
/// LUCAS_COPRIME_LEMMA
fn step_151() -> Unit raise {
  let t1437 = @simp.asm_simp_tac(
    @list.List([@arith.exp(), @prime.divides_rmul()]),
  )
  let t1438 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 0)")),
      @int.arith_tac,
    ),
    t1437,
  ])
  let t1436 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) == SUC(m - 1)"), fn(
    x1433 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1434 = @tactics.subst1_tac(x1433)
    fn(
      x1435 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1434(x1435)
    }
  })
  let t1432 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.division()), @prime.divides_lmul()]),
  )
  let t1431 = @tactics.exists_tac(@term_syntax.parse_term("DIV(EXP((a : Num), (m : Num)), (n : Num)) * n"))
  let t1430 = @tactics.match_mp_tac(@prime.divides_add_revr())
  let t1429 = @list.List([
    @tactics.all_tac,
    @simp.asm_simp_tac(@list.List([@int.divides_one()])),
  ])
  let t1428 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides((d : Num), MOD(EXP((a : Num), (m : Num)), (n : Num)))"),
    fn(
      x1425 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1426 = @tactics.mp_tac(x1425)
      fn(
        x1427 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1426(x1427)
      }
    },
  )
  let t1422 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t1423 = @tactics.map_every(
    fn(
      x1419 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1420 = @tactics.undisch_tac(x1419)
      fn(
        x1421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1420(x1421)
      }
    },
    @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t1422]),
  )
  let t1418 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t1417 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1424 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t1417),
          t1418,
        ),
        t1423,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1416 = @tactics.subgoal_then(@term_syntax.parse_term("MOD(1, (n : Num)) == 1"), fn(
    x1413 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1414 = @tactics.subst1_tac(x1413)
    fn(
      x1415 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1414(x1415)
    }
  })
  let t1412 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t1411 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t1410 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1409 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1408 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1407 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t1406 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1404 = @simp.simp_tac(@list.List([@prime.coprime_1()]))
  let t1403 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1402 = @simp.asm_rewrite_tac(@list.List([]))
  let t1401 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1405 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(@list.List([cong_mod_0(), @arith.exp_eq_1()])),
            t1401,
          ),
          t1402,
        ),
        t1403,
      ),
      t1404,
    ),
    @tactics.all_tac,
  ])
  let t1400 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1439 = @tactics.thenl(
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.repeat_tac(@tactics.gen_tac),
                                          t1400,
                                        ),
                                        t1405,
                                      ),
                                      t1406,
                                    ),
                                    t1407,
                                  ),
                                  t1408,
                                ),
                                t1409,
                              ),
                              t1410,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1411,
                        ),
                        t1412,
                      ),
                      t1416,
                    ),
                    t1424,
                  ),
                  @tactics.disch_tac,
                ),
                t1428,
              ),
              t1429,
            ),
            t1430,
          ),
          t1431,
        ),
        t1432,
      ),
      t1436,
    ),
    t1438,
  )
  lucas_coprime_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, !(m == 0) && op_eq_eq(EXP(a, m), 1, mod(n)) → coprime((a, n))"),
      t1439,
    ),
  )
}

///|
let lucas_coprime_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LUCAS_COPRIME_LEMMA",
)

///|
/// `LUCAS_COPRIME_LEMMA`
pub fn lucas_coprime_lemma() -> @kernel.Thm {
  lucas_coprime_lemma_c.get()
}

///|
/// LUCAS_WEAK
fn step_152() -> Unit raise {
  let t1458 = @simp.asm_simp_tac(
    @list.List([
      phi_lowerbound_1(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → 0 < n")),
    ]),
  )
  let t1457 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) → !(a && (b : Bool)) → !b")),
  )
  let t1456 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t1454 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n - 1 == 0)"))]),
  )
  let t1453 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - 1"))
  let t1455 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(lucas_coprime_lemma()), t1453),
      t1454,
    ),
    @tactics.all_tac,
  ])
  let t1452 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((a : Num), (n : Num)))"), fn(
    x1450 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1450
    @simp.simp_tac(@list.List([fermat_little(), th]))
  })
  let t1446 = @term_syntax.parse_term("phi((n : Num))")
  let t1449 = @tactics.first_x_assum(fn(
    x1448 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1443 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1444 = @tactics.mp_tac(x1443)
      fn(
        x1445 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1444(x1445)
      }
    })(((x1447 : @kernel.Thm) => @bool.spec(t1446, x1447))(x1448))
  })
  let t1440 = @int.arith_rule(
    @term_syntax.parse_term("2 <= (n : Num) → !(n == 0) && !(n == 1)"),
  )
  let t1441 = @equal.gsym(@arith.le_antisym())
  let t1442 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(phi_prime_eq()), phi_limit_strong(), t1441, t1440]),
  )
  let t1459 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1442),
              t1449,
            ),
            t1452,
          ),
          t1455,
        ),
        t1456,
      ),
      t1457,
    ),
    t1458,
  )
  lucas_weak_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, 2 <= n && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ m : Num, 0 < m && m < n - 1 → !op_eq_eq(EXP(a, m), 1, mod(n))) → prime(n)"),
      t1459,
    ),
  )
}

///|
let lucas_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LUCAS_WEAK")

///|
/// `LUCAS_WEAK`
pub fn lucas_weak() -> @kernel.Thm {
  lucas_weak_c.get()
}

///|
/// LUCAS
fn step_153() -> Unit raise {
  let t1595 = @simp.rewrite_tac(
    @list.List([@arith.exp_exp(), @arith.exp_one()]),
  )
  let t1594 = @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()]))
  let t1590 = @term_syntax.parse_term("MOD")
  let t1587 = @term_syntax.parse_term("(n : Num)")
  let t1593 = @tactics.disch_then(fn(
    x1592 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1589 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1582 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1583 = @tactics.mp_tac(x1582)
        fn(
          x1584 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1583(x1584)
        }
      })(
        (fn(x1588 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x1585 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x1586 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x1585, x1586)
            }
          })(x1588)(t1587)
        })(x1589),
      )
    })(((x1591 : @kernel.Thm) => @equal.ap_term(t1590, x1591))(x1592))
  })
  let t1578 = @term_syntax.parse_term("EXP")
  let t1575 = @term_syntax.parse_term("DIV((r : Num), (p : Num))")
  let t1581 = @tactics.disch_then(fn(
    x1580 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1577 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(
        (fn(x1576 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x1573 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x1574 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x1573, x1574)
            }
          })(x1576)(t1575)
        })(x1577),
      )
    })(((x1579 : @kernel.Thm) => @equal.ap_term(t1578, x1579))(x1580))
  })
  let t1569 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t1568 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t1566 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1565 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t1564 = @simp.asm_rewrite_tac(@list.List([]))
  let t1563 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t1562 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (r : Num))"))
  let t1561 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t1560 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → 0 < p"))]),
  )
  let t1559 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t1558 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1557 = @tactics.undisch_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t1556 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1567 = @list.List([
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
                                @tactics.match_mp_tac(@arith.div_uniq()),
                                t1556,
                              ),
                              t1557,
                            ),
                            t1558,
                          ),
                          t1559,
                        ),
                        t1560,
                      ),
                      @tactics.disch_tac,
                    ),
                    t1561,
                  ),
                  @tactics.ap_term_tac,
                ),
                t1562,
              ),
              t1563,
            ),
            @tactics.strip_tac,
          ),
          t1564,
        ),
        t1565,
      ),
      t1566,
    ),
    @tactics.all_tac,
  ])
  let t1555 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((m : Num) * (r : Num), (p : Num)) == m * DIV(r, p)"),
    fn(
      x1552 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1553 = @tactics.subst1_tac(x1552)
      fn(
        x1554 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1553(x1554)
      }
    },
  )
  let t1551 = @simp.asm_simp_tac(@list.List([@prime.divides_lmul()]))
  let t1547 = @term_syntax.parse_term("(p : Num)")
  let t1550 = @tactics.disch_then(fn(
    x1549 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1544 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1545 = @tactics.mp_tac(x1544)
      fn(
        x1546 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1545(x1546)
      }
    })(((x1548 : @kernel.Thm) => @bool.spec(t1547, x1548))(x1549))
  })
  let t1543 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ p : Num, prime(p) && divides(p, (m : Num) * (r : Num)) → !op_eq_eq(EXP((a : Num), DIV(m * r, p)), 1, mod((n : Num)))"),
  )
  let t1542 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
      x1539 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1540 = @tactics.mp_tac(x1539)
      fn(
        x1541 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1540(x1541)
      }
    }),
  )
  let t1536 = @drule.match_mp(@prime.prime_factor())
  let t1538 = @tactics.disch_then(fn(
    x1537 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1533 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1534 = @tactics.mp_tac(x1533)
      fn(
        x1535 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1534(x1535)
      }
    })(t1536(x1537))
  })
  let t1531 = @simp.simp_tac(
    @list.List([@arith.mult_clauses(), @arith.lt_refl()]),
  )
  let t1530 = @tactics.conv_tac(@class.contrapos_conv)
  let t1532 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) < m * (r : Num)")),
        t1530,
      ),
      t1531,
    ),
    @tactics.all_tac,
  ])
  let t1529 = @tactics.subgoal_then(@term_syntax.parse_term("!((r : Num) == 1)"), fn(
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
  })
  let t1525 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(
      x1522 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1523 = @tactics.subst_all_tac(x1522)
      fn(
        x1524 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1523(x1524)
      }
    }),
  )
  let t1521 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t1519 = @simp.rewrite_tac(@list.List([@arith.exp_one()]))
  let t1518 = @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()]))
  let t1517 = @simp.asm_rewrite_tac(@list.List([]))
  let t1516 = @list.List([
    @tactics.all_tac,
    @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()])),
  ])
  let t1515 = @tactics.exists_tac(
    @term_syntax.parse_term("MOD(EXP(MOD(EXP((a : Num), (m : Num)), (n : Num)), DIV(n - 1, m)), n)"),
  )
  let t1514 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1513 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1512 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t1511 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t1510 = @tactics.undisch_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), (n : Num) - 1), 1, mod(n))"),
  )
  let t1509 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t1508 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1507 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1506 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.division())]))
  let t1505 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t1503 = @simp.asm_simp_tac(@list.List([]))
  let t1502 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t1501 = @tactics.match_mp_tac(lucas_coprime_lemma())
  let t1500 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1499 = @tactics.match_mp_tac(@prime.coprime_exp())
  let t1504 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
              t1499,
            ),
            t1500,
          ),
          t1501,
        ),
        t1502,
      ),
      t1503,
    ),
    @tactics.all_tac,
  ])
  let t1498 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP((a : Num), DIV((n : Num) - 1, (m : Num)) * m)"),
  )
  let t1497 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t1495 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t1494 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t1496 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@arith.lt_trans()), t1494),
      t1495,
    ),
    @tactics.all_tac,
  ])
  let t1493 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t1489 = @term_syntax.parse_term("MOD((n : Num) - 1, (m : Num))")
  let t1492 = @tactics.first_x_assum(fn(
    x1491 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1486 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1487 = @tactics.mp_tac(x1486)
      fn(
        x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1487(x1488)
      }
    })(((x1490 : @kernel.Thm) => @bool.spec(t1489, x1490))(x1491))
  })
  let t1485 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("!(0 < (n : Num)) → n == 0")),
  )
  let t1484 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.mod_eq_0())]))
  let t1483 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1520 = @list.List([
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
                                                            @simp.rewrite_tac(
                                                              @list.List([
                                                                @int.divides(),
                                                              ]),
                                                            ),
                                                            t1483,
                                                          ),
                                                          t1484,
                                                        ),
                                                        t1485,
                                                      ),
                                                      @tactics.disch_tac,
                                                    ),
                                                    t1492,
                                                  ),
                                                  t1493,
                                                ),
                                                @tactics.conj_tac,
                                              ),
                                              t1496,
                                            ),
                                            t1497,
                                          ),
                                          t1498,
                                        ),
                                        @tactics.conj_tac,
                                      ),
                                      t1504,
                                    ),
                                    t1505,
                                  ),
                                  t1506,
                                ),
                                t1507,
                              ),
                              t1508,
                            ),
                            t1509,
                          ),
                          t1510,
                        ),
                        t1511,
                      ),
                      t1512,
                    ),
                    t1513,
                  ),
                  t1514,
                ),
                t1515,
              ),
              @tactics.conj_tac,
            ),
            t1516,
          ),
          t1517,
        ),
        t1518,
      ),
      t1519,
    ),
    @tactics.all_tac,
  ])
  let t1482 = @tactics.subgoal_then(@term_syntax.parse_term("divides((m : Num), (n : Num) - 1)"), fn(
    x1479 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1480 = @tactics.mp_tac(x1479)
    fn(
      x1481 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1480(x1481)
    }
  })
  let t1476 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) → !(n == 0)")),
  )
  let t1478 = @tactics.first_assum(fn(
    x1477 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1473 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1474 = @tactics.assume_tac(x1473)
      fn(
        x1475 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1474(x1475)
      }
    })(t1476(x1477))
  })
  let t1472 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1471 = @simp.once_rewrite_tac(@list.List([@arith.num_wop()]))
  let t1469 = @equal.gsym(@class.not_exists_thm())
  let t1470 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == !(a && b)")),
      t1469,
    ]),
  )
  let t1468 = @simp.asm_rewrite_tac(@list.List([]))
  let t1467 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t1466 = @tactics.match_mp_tac(lucas_weak())
  let t1463 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
  )
  let t1465 = @tactics.first_assum(fn(
    x1464 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1460 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1461 = @tactics.assume_tac(x1460)
      fn(
        x1462 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1461(x1462)
      }
    })(t1463(x1464))
  })
  let t1596 = @tactics.then_tac(
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
                                                          @tactics.repeat_tac(
                                                            @tactics.strip_tac,
                                                          ),
                                                          t1465,
                                                        ),
                                                        t1466,
                                                      ),
                                                      t1467,
                                                    ),
                                                    t1468,
                                                  ),
                                                  t1470,
                                                ),
                                                t1471,
                                              ),
                                              t1472,
                                            ),
                                            t1478,
                                          ),
                                          t1482,
                                        ),
                                        t1520,
                                      ),
                                      t1521,
                                    ),
                                    t1525,
                                  ),
                                  t1529,
                                ),
                                t1532,
                              ),
                              t1538,
                            ),
                            t1542,
                          ),
                          @tactics.strip_tac,
                        ),
                        t1543,
                      ),
                      t1550,
                    ),
                    t1551,
                  ),
                  t1555,
                ),
                t1567,
              ),
              t1568,
            ),
            t1569,
          ),
          t1581,
        ),
        t1593,
      ),
      t1594,
    ),
    t1595,
  )
  lucas_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, 2 <= n && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ p : Num, prime(p) && divides(p, n - 1) → !op_eq_eq(EXP(a, DIV(n - 1, p)), 1, mod(n))) → prime(n)"),
      t1596,
    ),
  )
}

///|
let lucas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LUCAS")

///|
/// `LUCAS`
pub fn lucas() -> @kernel.Thm {
  lucas_c.get()
}

///|
/// order
fn step_154() -> Unit raise {
  order_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(order : (Num, Num) -> Num)((n : Num), (a : Num)) == select((d : Num) => ∀ k : Num, op_eq_eq(EXP(a, k), 1, mod(n)) == divides(d, k))"),
    ),
  )
}

///|
let order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("order")

///|
/// `order`
pub fn order() -> @kernel.Thm {
  order_c.get()
}

///|
/// EXP_ITER
fn step_155() -> Unit raise {
  let t1597 = @simp.asm_rewrite_tac(@list.List([@iter.iter(), @arith.exp()]))
  let t1598 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t1597,
  )
  exp_iter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, EXP(x, n) == ITER(n, (y : Num) => x * y, 1)"),
      t1598,
    ),
  )
}

///|
let exp_iter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_ITER")

///|
/// `EXP_ITER`
pub fn exp_iter() -> @kernel.Thm {
  exp_iter_c.get()
}

///|
/// ORDER_DIVIDES
fn step_156() -> Unit raise {
  let t1605 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1604 = @simp.rewrite_tac(@list.List([@equal.gsym(exp_iter())]))
  let t1601 = @term_syntax.parse_term("1")
  let t1602 = @term_syntax.parse_term("(x : Num) => (a : Num) * x")
  let t1603 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : Num) => (y : Num) => op_eq_eq(x, y, mod((n : Num)))"),
        t1602,
        t1601,
      ]),
      @iter.order_existence_iter(),
    ),
  )
  let t1600 = @tactics.conv_tac(@class.select_conv)
  let t1599 = @simp.rewrite_tac(@list.List([order()]))
  let t1606 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
              t1599,
            ),
            t1600,
          ),
          t1603,
        ),
        t1604,
      ),
      t1605,
    ),
    @int.number_tac,
  )
  order_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ d : Num, op_eq_eq(EXP(a, d), 1, mod(n)) == divides(order(n, a), d)"),
      t1606,
    ),
  )
}

///|
let order_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_DIVIDES")

///|
/// `ORDER_DIVIDES`
pub fn order_divides() -> @kernel.Thm {
  order_divides_c.get()
}

///|
/// ORDER
fn step_157() -> Unit raise {
  let t1607 = @simp.rewrite_tac(
    @list.List([order_divides(), @prime.divides_refl()]),
  )
  order_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, op_eq_eq(EXP(a, order(n, a)), 1, mod(n))"),
      t1607,
    ),
  )
}

///|
let order_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER")

///|
/// `ORDER`
pub fn order_v1() -> @kernel.Thm {
  order_v1_c.get()
}

///|
/// ORDER_UNIQUE_ALT
fn step_158() -> Unit raise {
  let t1608 = @meson.meson_tac(
    @list.List([@prime.divides_refl(), @prime.divides_trans()]),
  )
  let t1609 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([order_divides(), @equal.gsym(@int.divides_antisym())]),
    ),
    t1608,
  )
  order_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ d : Num, (order(n, a) == d) == (∀ k : Num, op_eq_eq(EXP(a, k), 1, mod(n)) == divides(d, k))"),
      t1609,
    ),
  )
}

///|
let order_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_UNIQUE_ALT",
)

///|
/// `ORDER_UNIQUE_ALT`
pub fn order_unique_alt() -> @kernel.Thm {
  order_unique_alt_c.get()
}

///|
/// ORDER_MINIMAL
fn step_159() -> Unit raise {
  let t1614 = @drule.match_mp(@int.divides_le())
  let t1616 = @tactics.first_assum(fn(
    x1615 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1611 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1612 = @tactics.mp_tac(x1611)
      fn(
        x1613 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1612(x1613)
      }
    })(t1614(x1615))
  })
  let t1610 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1617 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([order_divides()])), t1610),
      t1616,
    ),
    @int.asm_arith_tac,
  )
  order_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ m : Num, 0 < m && m < order(n, a) → !op_eq_eq(EXP(a, m), 1, mod(n))"),
      t1617,
    ),
  )
}

///|
let order_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_MINIMAL")

///|
/// `ORDER_MINIMAL`
pub fn order_minimal() -> @kernel.Thm {
  order_minimal_c.get()
}

///|
/// ORDER_WORKS
fn step_160() -> Unit raise {
  let t1618 = @meson.meson_tac(@list.List([order_v1(), order_minimal()]))
  order_works_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, op_eq_eq(EXP(a, order(n, a)), 1, mod(n)) && (∀ m : Num, 0 < m && m < order(n, a) → !op_eq_eq(EXP(a, m), 1, mod(n)))"),
      t1618,
    ),
  )
}

///|
let order_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_WORKS")

///|
/// `ORDER_WORKS`
pub fn order_works() -> @kernel.Thm {
  order_works_c.get()
}

///|
/// ORDER_1
fn step_161() -> Unit raise {
  let t1619 = @equal.gsym(order_divides())
  let t1620 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@int.divides_one()),
      t1619,
      @arith.exp_1(),
      cong_refl(),
    ]),
  )
  order_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, order(n, 1) == 1"), t1620))
}

///|
let order_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_1")

///|
/// `ORDER_1`
pub fn order_1() -> @kernel.Thm {
  order_1_c.get()
}

///|
/// ORDER_EQ_0
fn step_162() -> Unit raise {
  let t1637 = @tactics.conv_tac(@int.number_rule)
  let t1636 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t1633 = @drule.match_mp(
    @class.taut(@term_syntax.parse_term("!(p : Bool) → ((q : Bool) → p) → q → (r : Bool)")),
  )
  let t1635 = @tactics.first_assum(fn(
    x1634 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t1633(x1634))
  })
  let t1632 = @simp.rewrite_tac(@list.List([]))
  let t1630 = @term_syntax.parse_term("(m : Num)")
  let t1631 = @tactics.spec_tac(@term_syntax.parse_term("order((n : Num), (a : Num))"), t1630)
  let t1629 = @term_syntax.parse_term("(a : Num)")
  let t1638 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("(n : Num)"), t1629]),
                  order_v1(),
                ),
              ),
              t1631,
            ),
            @nums.induct_tac,
          ),
          t1632,
        ),
        t1635,
      ),
      t1636,
    ),
    t1637,
  )
  let t1628 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_0(),
      order_1(),
      @int.arith_rule(@term_syntax.parse_term("!(1 == 0)")),
    ]),
  )
  let t1627 = @simp.asm_rewrite_tac(
    @list.List([order_divides(), @prime.divides_zero(), phi_eq_0()]),
  )
  let t1624 = @drule.match_mp(fermat_little())
  let t1626 = @tactics.first_assum(fn(
    x1625 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1621 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1622 = @tactics.mp_tac(x1621)
      fn(
        x1623 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1622(x1623)
      }
    })(t1624(x1625))
  })
  let t1639 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
            @tactics.disch_tac,
          ),
          t1626,
        ),
        t1627,
      ),
      t1628,
    ),
    t1638,
  ])
  let t1640 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t1639,
  )
  order_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, (order(n, a) == 0) == !coprime((n, a))"),
      t1640,
    ),
  )
}

///|
let order_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_EQ_0")

///|
/// `ORDER_EQ_0`
pub fn order_eq_0() -> @kernel.Thm {
  order_eq_0_c.get()
}

///|
/// ORDER_EQ_1
fn step_163() -> Unit raise {
  let t1641 = @meson.meson_tac(@list.List([cong_exp_1(), @arith.exp_1()]))
  let t1642 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([order_unique_alt(), @prime.divides_1()])),
    t1641,
  )
  order_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, (order(n, a) == 1) == op_eq_eq(a, 1, mod(n))"),
      t1642,
    ),
  )
}

///|
let order_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_EQ_1")

///|
/// `ORDER_EQ_1`
pub fn order_eq_1() -> @kernel.Thm {
  order_eq_1_c.get()
}

///|
/// ORDER_UNIQUE_PRIME
fn step_164() -> Unit raise {
  let t1645 = @meson.meson_tac(
    @list.List([
      @int.number_rule(@term_syntax.parse_term("divides(1, (n : Num)) && divides(n, n)")),
    ]),
  )
  let t1644 = @simp.rewrite_tac(@list.List([@int.prime()]))
  let t1643 = @simp.rewrite_tac(@list.List([@equal.gsym(order_eq_1())]))
  let t1646 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.simp_tac(@list.List([order_divides()])), t1643),
      t1644,
    ),
    t1645,
  )
  order_unique_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ p : Num, prime(p) → (order(n, a) == p) == (!op_eq_eq(a, 1, mod(n)) && op_eq_eq(EXP(a, p), 1, mod(n)))"),
      t1646,
    ),
  )
}

///|
let order_unique_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_UNIQUE_PRIME",
)

///|
/// `ORDER_UNIQUE_PRIME`
pub fn order_unique_prime() -> @kernel.Thm {
  order_unique_prime_c.get()
}

///|
/// ORDER_CONG
fn step_165() -> Unit raise {
  let t1648 = @meson.asm_meson_tac(
    @list.List([cong_exp(), cong_refl(), cong_sym(), cong_trans()]),
  )
  let t1647 = @simp.rewrite_tac(@list.List([order()]))
  let t1649 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1647),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    t1648,
  )
  order_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, op_eq_eq(a, b, mod(n)) → order(n, a) == order(n, b)"),
      t1649,
    ),
  )
}

///|
let order_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_CONG")

///|
/// `ORDER_CONG`
pub fn order_cong() -> @kernel.Thm {
  order_cong_c.get()
}

///|
/// ORDER_MOD
fn step_166() -> Unit raise {
  let t1651 = @simp.rewrite_tac(@list.List([@int.cong_lmod(), cong_refl()]))
  let t1650 = @tactics.match_mp_tac(order_cong())
  let t1652 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1650),
    t1651,
  )
  order_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, order(p, MOD(n, p)) == order(p, n)"),
      t1652,
    ),
  )
}

///|
let order_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_MOD")

///|
/// `ORDER_MOD`
pub fn order_mod() -> @kernel.Thm {
  order_mod_c.get()
}

///|
/// COPRIME_ORDER
fn step_167() -> Unit raise {
  let t1653 = @meson.meson_tac(@list.List([order_v1(), order_minimal()]))
  let t1654 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("((n : Num) > 0) == !(n == 0)")),
        order_eq_0(),
      ]),
    ),
    t1653,
  )
  coprime_order_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, coprime((n, a)) → order(n, a) > 0 && op_eq_eq(EXP(a, order(n, a)), 1, mod(n)) && (∀ m : Num, 0 < m && m < order(n, a) → !op_eq_eq(EXP(a, m), 1, mod(n)))"),
      t1654,
    ),
  )
}

///|
let coprime_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_ORDER")

///|
/// `COPRIME_ORDER`
pub fn coprime_order() -> @kernel.Thm {
  coprime_order_c.get()
}

///|
/// ORDER_DIVIDES_PHI
fn step_168() -> Unit raise {
  let t1655 = @meson.meson_tac(
    @list.List([order_divides(), fermat_little(), @prime.coprime_sym()]),
  )
  order_divides_phi_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, coprime((n, a)) → divides(order(n, a), phi(n))"),
      t1655,
    ),
  )
}

///|
let order_divides_phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_DIVIDES_PHI",
)

///|
/// `ORDER_DIVIDES_PHI`
pub fn order_divides_phi() -> @kernel.Thm {
  order_divides_phi_c.get()
}

///|
/// ORDER_LE_PHI
fn step_169() -> Unit raise {
  let t1661 = @meson.asm_meson_tac(@list.List([order_eq_0()]))
  let t1660 = @tactics.match_mp_tac(order_divides_phi())
  let t1659 = @simp.asm_rewrite_tac(@list.List([phi_eq_0()]))
  let t1658 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t1657 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t1656 = @class.asm_cases_tac(@term_syntax.parse_term("order((n : Num), (a : Num)) == 0"))
  let t1662 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1656),
            t1657,
          ),
          t1658,
        ),
        t1659,
      ),
      t1660,
    ),
    t1661,
  )
  order_le_phi_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → order(n, (a : Num)) <= phi(n)"),
      t1662,
    ),
  )
}

///|
let order_le_phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_LE_PHI")

///|
/// `ORDER_LE_PHI`
pub fn order_le_phi() -> @kernel.Thm {
  order_le_phi_c.get()
}

///|
/// ORDER_DIVIDES_EXPDIFF
fn step_170() -> Unit raise {
  let t1681 = @simp.rewrite_tac(
    @list.List([@arith.exp(), cong_0_divides(), order_divides()]),
  )
  let t1680 = @simp.asm_simp_tac(
    @list.List([
      cong_add_lcancel_eq(),
      @prime.coprime_exp(),
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        cong_mult_lcancel_eq(),
      ),
    ]),
  )
  let t1679 = @simp.rewrite_tac(@list.List([@arith.exp_add()]))
  let t1678 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(e : Num) + 0 + (c : Num) == e + c"))]),
  )
  let t1677 = @tactics.subst1_tac(
    @int.arith_rule(@term_syntax.parse_term("(e : Num) == e + 0")),
  )
  let t1676 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(
      x1673 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1674 = @tactics.subst1_tac(x1673)
      fn(
        x1675 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1674(x1675)
      }
    }),
  )
  let t1670 = @simp.gen_rewrite_rule(
    fn(
      x1669 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1669
    },
    @list.List([@arith.le_exists()]),
  )
  let t1672 = @tactics.first_x_assum(fn(
    x1671 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1666 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1667 = @tactics.mp_tac(x1666)
      fn(
        x1668 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1667(x1668)
      }
    })(t1670(x1671))
  })
  let t1665 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1682 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ d : Num, ∀ e : Num, coprime((n, a)) && e <= d → op_eq_eq(EXP(a, d), EXP(a, e), mod(n)) == op_eq_eq(d, e, mod(order(n, a)))"),
                    fn(
                      x1663 : @kernel.Thm,
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
                      let th = x1663
                      @meson.meson_tac(
                        @list.List([th, @arith.le_cases(), cong_sym()]),
                      )
                    },
                  ),
                  t1665,
                ),
                t1672,
              ),
              t1676,
            ),
            t1677,
          ),
          t1678,
        ),
        t1679,
      ),
      t1680,
    ),
    t1681,
  )
  order_divides_expdiff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ d : Num, ∀ e : Num, coprime((n, a)) → op_eq_eq(EXP(a, d), EXP(a, e), mod(n)) == op_eq_eq(d, e, mod(order(n, a)))"),
      t1682,
    ),
  )
}

///|
let order_divides_expdiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_DIVIDES_EXPDIFF",
)

///|
/// `ORDER_DIVIDES_EXPDIFF`
pub fn order_divides_expdiff() -> @kernel.Thm {
  order_divides_expdiff_c.get()
}

///|
/// ORDER_UNIQUE
fn step_171() -> Unit raise {
  let t1717 = @tactics.conv_tac(@int.number_rule)
  let t1716 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (k : Num)), 1, mod((n : Num)))"))
  let t1715 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @arith.lt()]))
  let t1712 = @term_syntax.parse_term("(k : Num)")
  let t1713 = @term_syntax.parse_term("(a : Num)")
  let t1714 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1713, t1712]),
      @prime.coprime_rexp(),
    ),
  )
  let t1709 = @simp.gen_rewrite_rule(
    fn(
      x1708 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1708
    },
    @list.List([order_eq_0()]),
  )
  let t1711 = @tactics.first_x_assum(fn(
    x1710 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1705 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1706 = @tactics.assume_tac(x1705)
      fn(
        x1707 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1706(x1707)
      }
    })(t1709(x1710))
  })
  let t1704 = @simp.asm_rewrite_tac(@list.List([]))
  let t1703 = @class.asm_cases_tac(@term_syntax.parse_term("order((n : Num), (a : Num)) == 0"))
  let t1702 = @simp.asm_rewrite_tac(@list.List([]))
  let t1698 = @term_syntax.parse_term("(k : Num)")
  let t1701 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1692 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1693 = @tactics.assume_tac(x1692)
        fn(
          x1694 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1693(x1694)
        }
      },
      fn(
        x1700 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1695 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1696 = @tactics.mp_tac(x1695)
          fn(
            x1697 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1696(x1697)
          }
        })(((x1699 : @kernel.Thm) => @bool.spec(t1698, x1699))(x1700))
      },
    ),
  )
  let t1690 = @term_syntax.parse_term("(a : Num)")
  let t1691 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1690]),
      order_works(),
    ),
  )
  let t1686 = @term_syntax.parse_term("order((n : Num), (a : Num))")
  let t1689 = @tactics.first_x_assum(fn(
    x1688 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1683 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1684 = @tactics.mp_tac(x1683)
      fn(
        x1685 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1684(x1685)
      }
    })(((x1687 : @kernel.Thm) => @bool.spec(t1686, x1687))(x1688))
  })
  let t1718 = @tactics.then_tac(
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
                          t1689,
                        ),
                        t1691,
                      ),
                      t1701,
                    ),
                    t1702,
                  ),
                  t1703,
                ),
                t1704,
              ),
              @list.List([@tactics.all_tac, @int.asm_arith_tac]),
            ),
            t1711,
          ),
          t1714,
        ),
        t1715,
      ),
      t1716,
    ),
    t1717,
  )
  order_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, 0 < k && op_eq_eq(EXP(a, k), 1, mod(n)) && (∀ m : Num, 0 < m && m < k → !op_eq_eq(EXP(a, m), 1, mod(n))) → order(n, a) == k"),
      t1718,
    ),
  )
}

///|
let order_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_UNIQUE")

///|
/// `ORDER_UNIQUE`
pub fn order_unique() -> @kernel.Thm {
  order_unique_c.get()
}

///|
/// ORDER_MUL_LCM
fn step_172() -> Unit raise {
  let t1721 = @simp.rewrite_tac(
    @list.List([order_divides(), @prime.lcm_divides()]),
  )
  let t1720 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((m : Num), (n : Num))) → op_eq_eq((x : Num), (y : Num), mod(m * n)) == (op_eq_eq(x, y, mod(m)) && op_eq_eq(x, y, mod(n)))"),
      ),
    ]),
  )
  let t1719 = @simp.rewrite_tac(@list.List([order_unique_alt()]))
  let t1722 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1719),
      t1720,
    ),
    t1721,
  )
  order_mul_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, coprime((m, n)) → order(m * n, a) == lcm((order(m, a), order(n, a)))"),
      t1722,
    ),
  )
}

///|
let order_mul_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_MUL_LCM")

///|
/// `ORDER_MUL_LCM`
pub fn order_mul_lcm() -> @kernel.Thm {
  order_mul_lcm_c.get()
}

///|
/// ORDER_EXP_GEN
fn step_173() -> Unit raise {
  let t1746 = @tactics.conv_tac(@int.number_rule)
  let t1745 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1742 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1743 = @tactics.mp_tac(x1742)
      fn(
        x1744 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1743(x1744)
      }
    }),
  )
  let t1741 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t1738 = @term_syntax.parse_term("(e : Num)")
  let t1740 = @tactics.disch_then((x1739 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1738, x1739)
  })
  let t1737 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.gcd_zero()])),
    @tactics.all_tac,
  ])
  let t1736 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1735 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Num) == gcd((order((p : Num), (a : Num)), (k : Num)))"))
  let t1734 = @simp.gen_rewrite_tac(
    fn(
      x1731 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1732 = @equal.land_conv(x1731)
      fn(x1733 : @kernel.Term) -> @kernel.Thm raise { s1732(x1733) }
    },
    @list.List([@int.divides()]),
  )
  let t1730 = @tactics.mp_tac(
    @int.number_rule(@term_syntax.parse_term("divides(gcd((order((p : Num), (a : Num)), (k : Num))), order(p, a))")),
  )
  let t1729 = @simp.rewrite_tac(@list.List([order_divides()]))
  let t1728 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t1727 = @simp.rewrite_tac(
    @list.List([order_unique_alt(), @arith.exp_exp()]),
  )
  let t1725 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(order_eq_0())]))
  let t1726 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@arith.div_0(), order_eq_0(), @prime.coprime_rexp()]),
      ),
      t1725,
    ),
    @tactics.all_tac,
  ])
  let t1724 = @class.asm_cases_tac(@term_syntax.parse_term("order((p : Num), (a : Num)) == 0"))
  let t1723 = @simp.asm_rewrite_tac(@list.List([order_1(), @arith.exp()]))
  let t1747 = @tactics.then_tac(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  @class.cond_cases_tac,
                                ),
                                t1723,
                              ),
                              t1724,
                            ),
                            t1726,
                          ),
                          t1727,
                        ),
                        t1728,
                      ),
                      t1729,
                    ),
                    t1730,
                  ),
                  t1734,
                ),
                t1735,
              ),
              t1736,
            ),
            t1737,
          ),
          t1740,
        ),
        t1741,
      ),
      t1745,
    ),
    t1746,
  )
  order_exp_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ k : Num, order(p, EXP(a, k)) == (if k == 0 { 1 } else { DIV(order(p, a), gcd((order(p, a), k))) })"),
      t1747,
    ),
  )
}

///|
let order_exp_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_EXP_GEN")

///|
/// `ORDER_EXP_GEN`
pub fn order_exp_gen() -> @kernel.Thm {
  order_exp_gen_c.get()
}

///|
/// ORDER_EXP
fn step_174() -> Unit raise {
  let t1749 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@prime.divides_gcd_right())]),
  )
  let t1748 = @simp.asm_rewrite_tac(@list.List([order_exp_gen()]))
  let t1750 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1748),
      @tactics.ap_term_tac,
    ),
    t1749,
  )
  order_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ k : Num, !(k == 0) && divides(k, order(p, a)) → order(p, EXP(a, k)) == DIV(order(p, a), k)"),
      t1750,
    ),
  )
}

///|
let order_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_EXP")

///|
/// `ORDER_EXP`
pub fn order_exp() -> @kernel.Thm {
  order_exp_c.get()
}

///|
/// ORDER_INVERSE_MOD
fn step_175() -> Unit raise {
  let t1763 = @simp.asm_rewrite_tac(@list.List([inverse_mod_lmul_eq()]))
  let t1762 = @tactics.match_mp_tac(cong_exp_1())
  let t1761 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp())]))
  let t1760 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a : Num) * (b : Num), 1, mod((n : Num))) → op_eq_eq(a, 1, mod(n)) == op_eq_eq(b, 1, mod(n))"),
    ),
  )
  let t1759 = @simp.rewrite_tac(@list.List([]))
  let t1758 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1757 = @simp.gen_rewrite_tac(
    fn(
      x1756 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1756
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1755 = @simp.rewrite_tac(@list.List([]))
  let t1754 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1753 = @simp.gen_rewrite_tac(
    fn(
      x1752 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1752
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1751 = @simp.rewrite_tac(@list.List([order()]))
  let t1764 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.strip_tac),
                                t1751,
                              ),
                              @tactics.ap_term_tac,
                            ),
                            t1753,
                          ),
                          t1754,
                        ),
                        t1755,
                      ),
                      @tactics.ap_term_tac,
                    ),
                    t1757,
                  ),
                  t1758,
                ),
                t1759,
              ),
              @tactics.ap_thm_tac,
            ),
            @tactics.ap_term_tac,
          ),
          t1760,
        ),
        t1761,
      ),
      t1762,
    ),
    t1763,
  )
  order_inverse_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, coprime((n, a)) → order(n, inverse_mod(n, a)) == order(n, a)"),
      t1764,
    ),
  )
}

///|
let order_inverse_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_INVERSE_MOD",
)

///|
/// `ORDER_INVERSE_MOD`
pub fn order_inverse_mod() -> @kernel.Thm {
  order_inverse_mod_c.get()
}

///|
/// ORDER_MUL_DIVIDES
fn step_176() -> Unit raise {
  let t1768 = @simp.rewrite_tac(@list.List([order_divides()]))
  let t1767 = @tactics.match_mp_tac(cong_mult_1())
  let t1766 = @simp.rewrite_tac(@list.List([@arith.mult_exp()]))
  let t1765 = @simp.rewrite_tac(@list.List([@equal.gsym(order_divides())]))
  let t1769 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1765),
          t1766,
        ),
        t1767,
      ),
      t1768,
    ),
    @int.number_tac,
  )
  order_mul_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, divides(order(p, a * b), order(p, a) * order(p, b))"),
      t1769,
    ),
  )
}

///|
let order_mul_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_MUL_DIVIDES",
)

///|
/// `ORDER_MUL_DIVIDES`
pub fn order_mul_divides() -> @kernel.Thm {
  order_mul_divides_c.get()
}

///|
/// ORDER_MUL_EQ
fn step_177() -> Unit raise {
  let t1797 = @simp.rewrite_tac(@list.List([order_works()]))
  let t1795 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a : Num), 1, mod((n : Num))) → op_eq_eq((b : Num), a * b, mod(n))"),
    ),
  )
  let t1796 = @list.List([
    @tactics.match_mp_tac(
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((b : Num), 1, mod((n : Num))) → op_eq_eq((a : Num), a * b, mod(n))"),
      ),
    ),
    t1795,
  ])
  let t1794 = @simp.rewrite_tac(@list.List([@arith.mult_exp()]))
  let t1793 = @tactics.match_mp_tac(cong_exp())
  let t1792 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t1790 = @simp.rewrite_tac(@list.List([order_works()]))
  let t1789 = @tactics.match_mp_tac(cong_exp_1())
  let t1788 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t1791 = @tactics.thenl(
    @tactics.conj_tac,
    @list.List([
      @tactics.all_tac,
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x1787 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                (fn(
                  x1783 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x1777 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s1778 = @equal.rator_conv(x1777)
                    fn(x1779 : @kernel.Term) -> @kernel.Thm raise {
                      s1778(x1779)
                    }
                  })(
                    (fn(
                      x1780 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s1781 = @equal.land_conv(x1780)
                      fn(x1782 : @kernel.Term) -> @kernel.Thm raise {
                        s1781(x1782)
                      }
                    })(x1783),
                  )
                })(
                  (fn(
                    x1784 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s1785 = @equal.rand_conv(x1784)
                    fn(x1786 : @kernel.Term) -> @kernel.Thm raise {
                      s1785(x1786)
                    }
                  })(x1787),
                )
              },
              @list.List([@arith.mult_sym()]),
            ),
            t1788,
          ),
          t1789,
        ),
        t1790,
      ),
    ]),
  )
  let t1775 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP((a : Num) * (b : Num), order((p : Num), a) * order(p, a * b))"),
  )
  let t1776 = @list.List([
    @tactics.exists_tac(
      @term_syntax.parse_term("EXP((a : Num) * (b : Num), order((p : Num), b) * order(p, a * b))"),
    ),
    t1775,
  ])
  let t1774 = @tactics.match_mp_tac(cong_trans())
  let t1773 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(order_divides())]))
  let t1772 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides((a : Num), (b : Num) * (c : Num)) && divides(b, a * c) && coprime((a, b)) → divides(a * b, c)"),
    ),
  )
  let t1771 = @simp.asm_simp_tac(@list.List([order_mul_divides()]))
  let t1770 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t1798 = @tactics.then_tac(
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t1770,
                          ),
                          t1771,
                        ),
                        t1772,
                      ),
                      t1773,
                    ),
                    @tactics.conj_tac,
                  ),
                  t1774,
                ),
                t1776,
              ),
              t1791,
            ),
            t1792,
          ),
          t1793,
        ),
        t1794,
      ),
      t1796,
    ),
    t1797,
  )
  order_mul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, coprime((order(p, a), order(p, b))) → order(p, a * b) == order(p, a) * order(p, b)"),
      t1798,
    ),
  )
}

///|
let order_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_MUL_EQ")

///|
/// `ORDER_MUL_EQ`
pub fn order_mul_eq() -> @kernel.Thm {
  order_mul_eq_c.get()
}

///|
/// ORDER_LCM_EXISTS
fn step_178() -> Unit raise {
  let t1823 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t1822 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1821 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("gcd(((a : Num) * (b : Num), a)) == a && gcd((a * b, b)) == b"),
      ),
    ]),
  )
  let t1820 = @tactics.thenl(
    @class.cond_cases_tac,
    @list.List([
      @meson.asm_meson_tac(@list.List([@arith.mult_clauses()])),
      @tactics.all_tac,
    ]),
  )
  let t1819 = @simp.asm_simp_tac(@list.List([order_exp_gen()]))
  let t1818 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((p : Num), EXP((a : Num), (m' : Num))) == (m : Num) && order(p, EXP((b : Num), (n' : Num))) == (n : Num)"),
    fn(
      x1816 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x1816
      @simp.asm_simp_tac(@list.List([th_1, order_mul_eq()]))
    },
  )
  let t1815 = @tactics.exists_tac(@term_syntax.parse_term("EXP((a : Num), (m' : Num)) * EXP((b : Num), (n' : Num))"))
  let t1814 = @tactics.disch_then(fn(
    x1811 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1811
    let t1813 = @tactics.assume_tac(@equal.sym(th))
    @tactics.then_tac(@tactics.subst1_tac(@equal.sym(th)), t1813)
  })
  let t1810 = @tactics.x_gen_tac(@term_syntax.parse_term("(n' : Num)"))
  let t1809 = @tactics.x_gen_tac(@term_syntax.parse_term("(m' : Num)"))
  let t1808 = @simp.rewrite_tac(
    @list.List([
      @int.divides(),
      @theorems.imp_conj(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1806 = @term_syntax.parse_term("(n : Num)")
  let t1807 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t1806]),
  )
  let t1805 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1803 = @term_syntax.parse_term("order((p : Num), (b : Num))")
  let t1804 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("order((p : Num), (a : Num))"), t1803]),
      @prime.lcm_coprime_decomp(),
    ),
  )
  let t1802 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.lcm_0()])),
    @tactics.all_tac,
  ])
  let t1801 = @class.asm_cases_tac(@term_syntax.parse_term("order((p : Num), (b : Num)) == 0"))
  let t1800 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.lcm_0()])),
    @tactics.all_tac,
  ])
  let t1799 = @class.asm_cases_tac(@term_syntax.parse_term("order((p : Num), (a : Num)) == 0"))
  let t1824 = @tactics.then_tac(
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
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.repeat_tac(
                                                @tactics.gen_tac,
                                              ),
                                              t1799,
                                            ),
                                            t1800,
                                          ),
                                          t1801,
                                        ),
                                        t1802,
                                      ),
                                      t1804,
                                    ),
                                    t1805,
                                  ),
                                  t1807,
                                ),
                                t1808,
                              ),
                              t1809,
                            ),
                            @tactics.disch_tac,
                          ),
                          t1810,
                        ),
                        @tactics.disch_tac,
                      ),
                      @tactics.disch_tac,
                    ),
                    t1814,
                  ),
                  t1815,
                ),
                t1818,
              ),
              t1819,
            ),
            @tactics.conj_tac,
          ),
          t1820,
        ),
        t1821,
      ),
      t1822,
    ),
    t1823,
  )
  order_lcm_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, ∃ c : Num, order(p, c) == lcm((order(p, a), order(p, b)))"),
      t1824,
    ),
  )
}

///|
let order_lcm_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_LCM_EXISTS",
)

///|
/// `ORDER_LCM_EXISTS`
pub fn order_lcm_exists() -> @kernel.Thm {
  order_lcm_exists_c.get()
}

///|
/// ORDER_DIVIDES_MAXIMAL
fn step_179() -> Unit raise {
  let t1872 = @simp.asm_rewrite_tac(
    @list.List([
      @prime.le_lcm(),
      @equal.gsym(@prime.divides_lcm_right()),
      order_eq_0(),
    ]),
  )
  let t1869 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → b <= a → a == b")),
  )
  let t1871 = @tactics.disch_then(fn(
    x1870 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1866 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1867 = @tactics.mp_tac(x1866)
      fn(
        x1868 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1867(x1868)
      }
    })(t1869(x1870))
  })
  let t1865 = @simp.asm_rewrite_tac(
    @list.List([order_mod(), @arith.mod_lt_eq()]),
  )
  let t1861 = @term_syntax.parse_term("MOD((q : Num), (p : Num))")
  let t1864 = @tactics.first_x_assum(fn(
    x1863 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1858 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1859 = @tactics.mp_tac(x1858)
      fn(
        x1860 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1859(x1860)
      }
    })(((x1862 : @kernel.Thm) => @bool.spec(t1861, x1862))(x1863))
  })
  let t1855 = @term_syntax.parse_term("(q : Num)")
  let t1857 = @tactics.disch_then((x1856 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1855, x1856)
  })
  let t1852 = @term_syntax.parse_term("(n : Num)")
  let t1853 = @term_syntax.parse_term("(m : Num)")
  let t1854 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t1853, t1852]),
      order_lcm_exists(),
    ),
  )
  let t1851 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1850 = @simp.asm_rewrite_tac(@list.List([]))
  let t1849 = @simp.rewrite_tac(@list.List([order_eq_0(), @prime.coprime_1()]))
  let t1846 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → !(a == 0) → !(b == 0)")),
  )
  let t1848 = @tactics.disch_then(fn(
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
      let s1844 = @tactics.mp_tac(x1843)
      fn(
        x1845 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1844(x1845)
      }
    })(t1846(x1847))
  })
  let t1839 = @term_syntax.parse_term("1")
  let t1842 = @tactics.first_assum(fn(
    x1841 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1836 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1837 = @tactics.mp_tac(x1836)
      fn(
        x1838 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1837(x1838)
      }
    })(((x1840 : @kernel.Thm) => @bool.spec(t1839, x1840))(x1841))
  })
  let t1835 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1834 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1833 = @simp.rewrite_tac(
    @list.List([
      @sets.exists_in_image(),
      @sets.forall_in_image(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1832 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.le_1()])),
    @tactics.all_tac,
  ])
  let t1831 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()]),
  )
  let t1830 = @simp.rewrite_tac(
    @list.List([@sets.member_not_empty(), @sets.image_eq_empty()]),
  )
  let t1829 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@sets.num_finite()),
      @sets.finite_image(),
      @sets.finite_numseg_lt(),
    ]),
  )
  let t1828 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.in_()]),
        @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool), (x : _)) == IN(x, IMAGE(f, s))"),
      ),
    ]),
  )
  let t1827 = @tactics.mp_tac(
    @bool.eq_imp_rule(
      @bool.ispec(
        @term_syntax.parse_term("IMAGE(order((p : Num)), {(k : Num) | k < p})"),
        @arith.num_max(),
      ),
    ).0,
  )
  let t1826 = @simp.asm_simp_tac(
    @list.List([
      @prime.coprime_0(),
      @prime.divides_refl(),
      @theorems.unwind_thm2(),
    ]),
  )
  let t1825 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1873 = @tactics.then_tac(
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
                                        @tactics.thenl(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.then_tac(
                                                          @tactics.repeat_tac(
                                                            @tactics.strip_tac,
                                                          ),
                                                          t1825,
                                                        ),
                                                        t1826,
                                                      ),
                                                      t1827,
                                                    ),
                                                    t1828,
                                                  ),
                                                  t1829,
                                                ),
                                                t1830,
                                              ),
                                              t1831,
                                            ),
                                            @tactics.ants_tac,
                                          ),
                                          t1832,
                                        ),
                                        t1833,
                                      ),
                                      t1834,
                                    ),
                                    t1835,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t1842,
                              ),
                              @tactics.ants_tac,
                            ),
                            @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                          ),
                          t1848,
                        ),
                        t1849,
                      ),
                      @tactics.disch_tac,
                    ),
                    t1850,
                  ),
                  t1851,
                ),
                @tactics.disch_tac,
              ),
              t1854,
            ),
            t1857,
          ),
          t1864,
        ),
        t1865,
      ),
      t1871,
    ),
    t1872,
  )
  order_divides_maximal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, !(p == 1) → (∃ n : Num, coprime((p, n)) && (∀ m : Num, coprime((p, m)) → divides(order(p, m), order(p, n))))"),
      t1873,
    ),
  )
}

///|
let order_divides_maximal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_DIVIDES_MAXIMAL",
)

///|
/// `ORDER_DIVIDES_MAXIMAL`
pub fn order_divides_maximal() -> @kernel.Thm {
  order_divides_maximal_c.get()
}

///|
/// POWER_RESIDUE_MODULO_COPRIME
fn step_180() -> Unit raise {
  let t1903 = @tactics.pop_assum(fn(
    x1900 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1901 = @tactics.mp_tac(x1900)
    fn(
      x1902 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1901(x1902)
    }
  })
  let t1897 = @drule.match_mp(order_divides_phi())
  let t1899 = @tactics.first_x_assum(fn(
    x1898 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1894 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1895 = @tactics.mp_tac(x1894)
      fn(
        x1896 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1895(x1896)
      }
    })(t1897(x1898))
  })
  let t1893 = @simp.asm_simp_tac(@list.List([order_divides_expdiff()]))
  let t1892 = @simp.gen_rewrite_tac(
    fn(
      x1889 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1890 = @equal.land_conv(x1889)
      fn(x1891 : @kernel.Term) -> @kernel.Thm raise { s1890(x1891) }
    },
    @list.List([@equal.gsym(@arith.exp_1())]),
  )
  let t1888 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1887 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t1886 = @tactics.exists_tac(@term_syntax.parse_term("EXP((a : Num), (l : Num))"))
  let t1883 = @term_syntax.parse_term("(l : Num)")
  let t1885 = @tactics.disch_then((x1884 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1883, x1884)
  })
  let t1880 = @drule.match_mp(cong_solve())
  let t1877 = @term_syntax.parse_term("1")
  let t1882 = @tactics.first_x_assum(fn(
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
      x1879 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1874 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1875 = @tactics.mp_tac(x1874)
        fn(
          x1876 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1875(x1876)
        }
      })(((x1878 : @kernel.Thm) => @bool.spec(t1877, x1878))(x1879))
    })(t1880(x1881))
  })
  let t1904 = @tactics.then_tac(
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
                      t1882,
                    ),
                    t1885,
                  ),
                  t1886,
                ),
                t1887,
              ),
              t1888,
            ),
            t1892,
          ),
          t1893,
        ),
        t1899,
      ),
      t1903,
    ),
    @int.number_tac,
  )
  power_residue_modulo_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, coprime((n, a)) && coprime((k, phi(n))) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n)))"),
      t1904,
    ),
  )
}

///|
let power_residue_modulo_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_COPRIME",
)

///|
/// `POWER_RESIDUE_MODULO_COPRIME`
pub fn power_residue_modulo_coprime() -> @kernel.Thm {
  power_residue_modulo_coprime_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIME
fn step_181() -> Unit raise {
  let t1906 = @simp.asm_simp_tac(
    @list.List([phi_prime(), @prime.prime_coprime_eq()]),
  )
  let t1905 = @tactics.match_mp_tac(power_residue_modulo_coprime())
  let t1907 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1905),
    t1906,
  )
  power_residue_modulo_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ k : Num, prime(p) && !divides(p, a) && coprime((k, p - 1)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(p)))"),
      t1907,
    ),
  )
}

///|
let power_residue_modulo_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIME",
)

///|
/// `POWER_RESIDUE_MODULO_PRIME`
pub fn power_residue_modulo_prime() -> @kernel.Thm {
  power_residue_modulo_prime_c.get()
}

///|
/// INJECTIVE_EXP_MODULO
fn step_182() -> Unit raise {
  let t1924 = @simp.asm_simp_tac(@list.List([order_divides_phi()]))
  let t1921 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a : Num), (b : Num), mod((d : Num))) → divides((e : Num), d) → op_eq_eq(a, b, mod(e))"),
    ),
  )
  let t1923 = @tactics.first_x_assum(fn(
    x1922 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t1921(x1922))
  })
  let t1920 = @simp.asm_simp_tac(
    @list.List([order_divides_expdiff(), @arith.exp_exp()]),
  )
  let t1919 = @simp.gen_rewrite_tac(
    fn(
      x1916 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1917 = @equal.land_conv(x1916)
      fn(x1918 : @kernel.Term) -> @kernel.Thm raise { s1917(x1918) }
    },
    @list.List([@equal.gsym(@arith.exp_1())]),
  )
  let t1915 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a' : Num), (a : Num), mod((n : Num))) && op_eq_eq((b' : Num), (b : Num), mod(n)) → op_eq_eq(a', b', mod(n)) → op_eq_eq(a, b, mod(n))"),
    ),
  )
  let t1914 = @list.List([
    @meson.asm_meson_tac(@list.List([cong_exp()])),
    @tactics.all_tac,
  ])
  let t1913 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_eq(EXP(EXP((a : Num), (k : Num)), (l : Num)), EXP(EXP((b : Num), k), l), mod((n : Num)))"),
    fn(
      x1910 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1911 = @tactics.mp_tac(x1910)
      fn(
        x1912 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1911(x1912)
      }
    },
  )
  let t1909 = @list.List([
    @meson.asm_meson_tac(@list.List([cong_solve()])),
    @tactics.all_tac,
  ])
  let t1908 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ l : Num, op_eq_eq((k : Num) * l, 1, mod(phi((n : Num))))"),
    @tactics.strip_assume_tac,
  )
  let t1925 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t1908,
                    ),
                    t1909,
                  ),
                  t1913,
                ),
                t1914,
              ),
              t1915,
            ),
            @tactics.conj_tac,
          ),
          t1919,
        ),
        t1920,
      ),
      t1923,
    ),
    t1924,
  )
  injective_exp_modulo_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, ∀ k : Num, coprime((k, phi(n))) && coprime((n, a)) && coprime((n, b)) && op_eq_eq(EXP(a, k), EXP(b, k), mod(n)) → op_eq_eq(a, b, mod(n))"),
      t1925,
    ),
  )
}

///|
let injective_exp_modulo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INJECTIVE_EXP_MODULO",
)

///|
/// `INJECTIVE_EXP_MODULO`
pub fn injective_exp_modulo() -> @kernel.Thm {
  injective_exp_modulo_c.get()
}

///|
/// PRIMITIVE_ROOT_IMP_COPRIME
fn step_183() -> Unit raise {
  let t1926 = @meson.meson_tac(@list.List([order_eq_0(), phi_eq_0()]))
  primitive_root_imp_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, order(n, g) == phi(n) → n == 0 || coprime((n, g))"),
      t1926,
    ),
  )
}

///|
let primitive_root_imp_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_IMP_COPRIME",
)

///|
/// `PRIMITIVE_ROOT_IMP_COPRIME`
pub fn primitive_root_imp_coprime() -> @kernel.Thm {
  primitive_root_imp_coprime_c.get()
}

///|
/// PRIMITIVE_ROOT_IMP_PRIME
fn step_184() -> Unit raise {
  let t1933 = @simp.asm_simp_tac(
    @list.List([phi_limit_strong(), order_le_phi()]),
  )
  let t1932 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(h : Num) <= (p : Num) - 1 && (g : Num) <= h → g == p - 1 → h == p - 1"),
    ),
  )
  let t1931 = @simp.asm_rewrite_tac(
    @list.List([@arith.sub_refl(), order_eq_0(), @prime.coprime_1()]),
  )
  let t1930 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1928 = @simp.rewrite_tac(@list.List([@equal.gsym(phi_eq_prime())]))
  let t1929 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t1928])
  let t1927 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1934 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1927),
            t1929,
          ),
          t1930,
        ),
        t1931,
      ),
      t1932,
    ),
    t1933,
  )
  primitive_root_imp_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ g : Num, order(p, g) == p - 1 → p == 0 || prime(p)"),
      t1934,
    ),
  )
}

///|
let primitive_root_imp_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_IMP_PRIME",
)

///|
/// `PRIMITIVE_ROOT_IMP_PRIME`
pub fn primitive_root_imp_prime() -> @kernel.Thm {
  primitive_root_imp_prime_c.get()
}

///|
/// PRIMITIVE_ROOT_IMAGE
fn step_185() -> Unit raise {
  let t1967 = @meson.meson_tac(@list.List([cong_imp_eq()]))
  let t1966 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @equal.gsym(@int.cong_v1()),
      order_divides_expdiff(),
    ]),
  )
  let t1964 = @tactics.disch_then(fn(
    x1961 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1962 = @tactics.subst1_tac(x1961)
    fn(
      x1963 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1962(x1963)
    }
  })
  let t1960 = @sets.set_tac(@list.List([]))
  let t1959 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t1958 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | i < (n : Num)}"))
  let t1965 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1958),
        t1959,
      ),
      t1960,
    ),
    t1964,
  ])
  let t1957 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.finite_numseg_lt(),
      @equal.gsym(phi_alt()),
      @sets.card_numseg_lt(),
    ]),
  )
  let t1952 = @drule.part_match(
    fn(x1951 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1951))
    },
    @sets.surjective_iff_injective_gen(),
  )
  let t1947 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("SUBSET((t : (_) -> Bool), IMAGE((f : (_) -> _), (s : (_) -> Bool))) == (∀ y : _, IN(y, t) → (∃ x : _, IN(x, s) && f(x) == y))"),
      ),
    ]),
  )
  let t1945 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t1944 = @simp.asm_rewrite_tac(
    @list.List([@int.coprime_lmod(), @prime.coprime_lexp(), @arith.mod_lt_eq()]),
  )
  let t1946 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @sets.subset(),
            @sets.forall_in_image(),
            @sets.in_elim_thm(),
          ]),
        ),
        t1944,
      ),
      t1945,
    ),
    @tactics.disch_tac,
  ])
  let t1943 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t1942 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t1941 = @list.List([
    @meson.asm_meson_tac(@list.List([order_eq_0(), phi_eq_0()])),
    @tactics.all_tac,
  ])
  let t1940 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((n : Num), (g : Num)))"), fn(
    x1937 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1938 = @tactics.assume_tac(x1937)
    fn(
      x1939 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1938(x1939)
    }
  })
  let t1936 = @simp.asm_rewrite_tac(
    @list.List([
      phi_0(),
      @bool.conjunct1(@arith.lt()),
      @sets.empty_gspec(),
      @sets.image_clauses(),
    ]),
  )
  let t1935 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1968 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  t1935,
                                ),
                                t1936,
                              ),
                              @tactics.disch_tac,
                            ),
                            t1940,
                          ),
                          t1941,
                        ),
                        t1942,
                      ),
                      t1943,
                    ),
                    @tactics.conj_tac,
                  ),
                  t1946,
                ),
                t1947,
              ),
              fn(
                x1956 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x1955 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x1953 : @kernel.Term,
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
                      x1948 : @kernel.Thm,
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
                      let s1949 = @tactics.mp_tac(x1948)
                      fn(
                        x1950 : (
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
                        s1949(x1950)
                      }
                    })(t1952(x1953))
                  })(
                    (fn(
                      x1954 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> @kernel.Term raise {
                      x1954.1
                    })(x1955),
                  )
                })(x1956)(x1956)
              },
            ),
            t1957,
          ),
          @tactics.ants_tac,
        ),
        t1965,
      ),
      t1966,
    ),
    t1967,
  )
  primitive_root_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, order(n, g) == phi(n) → IMAGE((i : Num) => MOD(EXP(g, i), n), {(i : Num) | i < phi(n)}) == {(a : Num) | coprime((a, n)) && a < n}"),
      t1968,
    ),
  )
}

///|
let primitive_root_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_IMAGE",
)

///|
/// `PRIMITIVE_ROOT_IMAGE`
pub fn primitive_root_image() -> @kernel.Thm {
  primitive_root_image_c.get()
}

///|
/// PRIMITIVE_ROOT_IMAGE_PRIME
fn step_186() -> Unit raise {
  let t1997 = @drule.match_mp(@int.divides_le_strong())
  let t1999 = @tactics.disch_then(fn(
    x1998 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1994 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1995 = @tactics.mp_tac(x1994)
      fn(
        x1996 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1995(x1996)
      }
    })(t1997(x1998))
  })
  let t1993 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(0 < (a : Num)) == !(a == 0)"))]),
  )
  let t1992 = @simp.asm_rewrite_tac(
    @list.List([@arith.lt_refl(), @prime.divides_0()]),
  )
  let t1991 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t1990 = @simp.asm_simp_tac(@list.List([@prime.prime_coprime_eq()]))
  let t1989 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1988 = @simp.asm_rewrite_tac(@list.List([]))
  let t1987 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) < (p : Num)"))
  let t1986 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t1985 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1984 = @tactics.disch_then(fn(
    x1981 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1982 = @tactics.subst1_tac(x1981)
    fn(
      x1983 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1982(x1983)
    }
  })
  let t1980 = @simp.asm_simp_tac(@list.List([phi_prime()]))
  let t1978 = @term_syntax.parse_term("(g : Num)")
  let t1979 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t1978]),
      primitive_root_image(),
    ),
  )
  let t1977 = @simp.asm_rewrite_tac(@list.List([]))
  let t1974 = @drule.match_mp(primitive_root_imp_prime())
  let t1976 = @tactics.first_assum(fn(
    x1975 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1971 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1972 = @tactics.mp_tac(x1971)
      fn(
        x1973 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1972(x1973)
      }
    })(t1974(x1975))
  })
  let t1970 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_num.arith(),
      @bool.conjunct1(@arith.lt()),
      @sets.empty_gspec(),
      @sets.image_clauses(),
    ]),
  )
  let t1969 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t2000 = @tactics.then_tac(
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
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t1969,
                                      ),
                                      t1970,
                                    ),
                                    t1976,
                                  ),
                                  t1977,
                                ),
                                @tactics.disch_tac,
                              ),
                              t1979,
                            ),
                            t1980,
                          ),
                          t1984,
                        ),
                        t1985,
                      ),
                      t1986,
                    ),
                    t1987,
                  ),
                  t1988,
                ),
                t1989,
              ),
              t1990,
            ),
            t1991,
          ),
          t1992,
        ),
        t1993,
      ),
      t1999,
    ),
    @int.asm_arith_tac,
  )
  primitive_root_image_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ g : Num, order(p, g) == p - 1 → IMAGE((i : Num) => MOD(EXP(g, i), p), {(i : Num) | i < p - 1}) == {(a : Num) | 0 < a && a < p}"),
      t2000,
    ),
  )
}

///|
let primitive_root_image_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_IMAGE_PRIME",
)

///|
/// `PRIMITIVE_ROOT_IMAGE_PRIME`
pub fn primitive_root_image_prime() -> @kernel.Thm {
  primitive_root_image_prime_c.get()
}

///|
/// PRIMITIVE_ROOT_SURJECTIVE
fn step_187() -> Unit raise {
  let t2021 = @meson.meson_tac(@list.List([@int.cong_v1()]))
  let t2020 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_elim_thm(), @int.coprime_lmod(), @arith.mod_lt_eq()]),
  )
  let t2016 = @term_syntax.parse_term("MOD((a : Num), (n : Num))")
  let t2019 = @tactics.disch_then(fn(
    x2018 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2013 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2014 = @tactics.mp_tac(x2013)
      fn(
        x2015 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2014(x2015)
      }
    })(((x2017 : @kernel.Thm) => @bool.spec(t2016, x2017))(x2018))
  })
  let t2010 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ y : _, IN(y, t) → (∃ x : _, IN(x, s) && f(x) == y))"),
    ),
  )
  let t2012 = @tactics.disch_then(fn(
    x2011 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2007 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2008 = @tactics.mp_tac(x2007)
      fn(
        x2009 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2008(x2009)
      }
    })(t2010(x2011))
  })
  let t2004 = @drule.match_mp(primitive_root_image())
  let t2006 = @tactics.first_assum(fn(
    x2005 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2001 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2002 = @tactics.mp_tac(x2001)
      fn(
        x2003 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2002(x2003)
      }
    })(t2004(x2005))
  })
  let t2022 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2006),
          t2012,
        ),
        t2019,
      ),
      t2020,
    ),
    t2021,
  )
  primitive_root_surjective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, ∀ a : Num, !(n == 0) && order(n, g) == phi(n) && coprime((a, n)) → (∃ m : Num, m < phi(n) && op_eq_eq(a, EXP(g, m), mod(n)))"),
      t2022,
    ),
  )
}

///|
let primitive_root_surjective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_SURJECTIVE",
)

///|
/// `PRIMITIVE_ROOT_SURJECTIVE`
pub fn primitive_root_surjective() -> @kernel.Thm {
  primitive_root_surjective_c.get()
}

///|
/// PRIMITIVE_ROOT_SURJECTIVE_ALT
fn step_188() -> Unit raise {
  let t2026 = @meson.meson_tac(@list.List([@arith.exp()]))
  let t2025 = @simp.asm_simp_tac(@list.List([@prime.coprime_0(), cong_mod_0()]))
  let t2024 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([primitive_root_surjective()])),
  ])
  let t2023 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2027 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2023),
        t2024,
      ),
      t2025,
    ),
    t2026,
  )
  primitive_root_surjective_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, ∀ a : Num, order(n, g) == phi(n) && coprime((a, n)) → (∃ m : Num, op_eq_eq(a, EXP(g, m), mod(n)))"),
      t2027,
    ),
  )
}

///|
let primitive_root_surjective_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_SURJECTIVE_ALT",
)

///|
/// `PRIMITIVE_ROOT_SURJECTIVE_ALT`
pub fn primitive_root_surjective_alt() -> @kernel.Thm {
  primitive_root_surjective_alt_c.get()
}

///|
/// PRIMITIVE_ROOT_SURJECTIVE_PRIME
fn step_189() -> Unit raise {
  let t2050 = @meson.asm_meson_tac(
    @list.List([
      @prime.prime_coprime_eq(),
      @prime.coprime_sym(),
      primitive_root_imp_prime(),
    ]),
  )
  let t2048 = @equal.gsym(@int.divides_mod())
  let t2049 = @simp.rewrite_tac(
    @list.List([
      @int.cong_v1(),
      @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == !(n == 0)")),
      t2048,
    ]),
  )
  let t2047 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_elim_thm(), @int.coprime_lmod(), @arith.mod_lt_eq()]),
  )
  let t2043 = @term_syntax.parse_term("MOD((a : Num), (p : Num))")
  let t2046 = @tactics.disch_then(fn(
    x2045 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2040 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2041 = @tactics.mp_tac(x2040)
      fn(
        x2042 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2041(x2042)
      }
    })(((x2044 : @kernel.Thm) => @bool.spec(t2043, x2044))(x2045))
  })
  let t2037 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ y : _, IN(y, t) → (∃ x : _, IN(x, s) && f(x) == y))"),
    ),
  )
  let t2039 = @tactics.disch_then(fn(
    x2038 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2034 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2035 = @tactics.mp_tac(x2034)
      fn(
        x2036 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2035(x2036)
      }
    })(t2037(x2038))
  })
  let t2031 = @drule.match_mp(primitive_root_image_prime())
  let t2033 = @tactics.first_assum(fn(
    x2032 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s2029 = @tactics.mp_tac(x2028)
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
    })(t2031(x2032))
  })
  let t2051 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2033),
            t2039,
          ),
          t2046,
        ),
        t2047,
      ),
      t2049,
    ),
    t2050,
  )
  primitive_root_surjective_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ g : Num, ∀ a : Num, !(p == 0) && order(p, g) == p - 1 && coprime((a, p)) → (∃ m : Num, m < p - 1 && op_eq_eq(a, EXP(g, m), mod(p)))"),
      t2051,
    ),
  )
}

///|
let primitive_root_surjective_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_SURJECTIVE_PRIME",
)

///|
/// `PRIMITIVE_ROOT_SURJECTIVE_PRIME`
pub fn primitive_root_surjective_prime() -> @kernel.Thm {
  primitive_root_surjective_prime_c.get()
}

///|
/// PRIMITIVE_ROOT_SURJECTIVE_PRIME_ALT
fn step_190() -> Unit raise {
  let t2055 = @meson.meson_tac(@list.List([@arith.exp()]))
  let t2054 = @simp.asm_simp_tac(@list.List([@prime.coprime_0(), cong_mod_0()]))
  let t2053 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([primitive_root_surjective_prime()])),
  ])
  let t2052 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t2056 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2052),
        t2053,
      ),
      t2054,
    ),
    t2055,
  )
  primitive_root_surjective_prime_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ g : Num, ∀ a : Num, order(p, g) == p - 1 && coprime((a, p)) → (∃ m : Num, op_eq_eq(a, EXP(g, m), mod(p)))"),
      t2056,
    ),
  )
}

///|
let primitive_root_surjective_prime_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_SURJECTIVE_PRIME_ALT",
)

///|
/// `PRIMITIVE_ROOT_SURJECTIVE_PRIME_ALT`
pub fn primitive_root_surjective_prime_alt() -> @kernel.Thm {
  primitive_root_surjective_prime_alt_c.get()
}

///|
/// PRIME_DIVISOR_SQRT
fn step_191() -> Unit raise {
  let t2119 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_rmul(),
      @prime.divides_lmul(),
      @prime.divides_refl(),
      @arith.mult_clauses(),
    ]),
  )
  let t2114 = @term_syntax.parse_term("(e : Num)")
  let t2117 = @tactics.first_x_assum(fn(
    x2116 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2111 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2112 = @tactics.mp_tac(x2111)
      fn(
        x2113 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2112(x2113)
      }
    })(((x2115 : @kernel.Thm) => @bool.spec(t2114, x2115))(x2116))
  })
  let t2108 = @term_syntax.parse_term("(d : Num)")
  let t2118 = @list.List([
    @tactics.first_x_assum(fn(
      x2110 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x2105 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2106 = @tactics.mp_tac(x2105)
        fn(
          x2107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2106(x2107)
        }
      })(((x2109 : @kernel.Thm) => @bool.spec(t2108, x2109))(x2110))
    }),
    t2117,
  ])
  let t2104 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t2103 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @arith.exp_2(),
          @arith.le_mult_lcancel(),
          @arith.le_mult_rcancel(),
        ]),
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2102 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP((d : Num), 2) <= d * (e : Num) || EXP(e, 2) <= d * e"),
    fn(
      x2099 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2100 = @tactics.mp_tac(x2099)
      fn(
        x2101 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2100(x2101)
      }
    },
  )
  let t2098 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(e : Num)"))(fn(
      x2095 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2096 = @tactics.subst_all_tac(x2095)
      fn(
        x2097 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2096(x2097)
      }
    }),
  )
  let t2094 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2093 = @tactics.undisch_tac(@term_syntax.parse_term("divides((d : Num), (n : Num))"))
  let t2090 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t2091 = @tactics.map_every(
    fn(
      x2087 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2088 = @tactics.undisch_tac(x2087)
      fn(
        x2089 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2088(x2089)
      }
    },
    @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t2090]),
  )
  let t2086 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_lcancel()]))
  let t2085 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_2(),
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) * n <= n) == (n * 1 < n * n)")),
    ]),
  )
  let t2084 = @simp.asm_rewrite_tac(@list.List([]))
  let t2083 = @tactics.undisch_tac(@term_syntax.parse_term("EXP((d : Num), 2) <= (n : Num)"))
  let t2082 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t2092 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == (n : Num)")),
                  t2082,
                ),
                t2083,
              ),
              t2084,
            ),
            t2085,
          ),
          t2086,
        ),
        t2091,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2081 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t2077 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t2074 = @term_syntax.parse_term("0")
  let t2078 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x2076 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x2071 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2072 = @tactics.mp_tac(x2071)
        fn(
          x2073 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2072(x2073)
        }
      })(((x2075 : @kernel.Thm) => @bool.spec(t2074, x2075))(x2076))
    }),
    t2077,
  )
  let t2070 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t2067 = @term_syntax.parse_term("2")
  let t2079 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x2069 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x2064 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s2065 = @tactics.mp_tac(x2064)
          fn(
            x2066 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2065(x2066)
          }
        })(((x2068 : @kernel.Thm) => @bool.spec(t2067, x2068))(x2069))
      }),
      t2070,
    ),
    t2078,
  ])
  let t2063 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(a : Bool) && !(b : Bool) → a == b")),
  )
  let t2080 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(
            @list.List([
              @prime.divides_0(),
              @arith.le(),
              @arith.exp_eq_0(),
              @calc_num.arith_eq(),
            ]),
          ),
          t2063,
        ),
        @tactics.conj_tac,
      ),
      t2079,
    ),
    @tactics.all_tac,
  ])
  let t2062 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2061 = @simp.asm_simp_tac(@list.List([@int.divides_one()]))
  let t2060 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t2120 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.gen_tac,
                                      @simp.gen_rewrite_tac(
                                        fn(
                                          x2057 : (@kernel.Term) -> @kernel.Thm raise,
                                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                          let s2058 = @equal.land_conv(x2057)
                                          fn(
                                            x2059 : @kernel.Term,
                                          ) -> @kernel.Thm raise {
                                            s2058(x2059)
                                          }
                                        },
                                        @list.List([@int.prime()]),
                                      ),
                                    ),
                                    t2060,
                                  ),
                                  t2061,
                                ),
                                t2062,
                              ),
                              t2080,
                            ),
                            @tactics.eq_tac,
                          ),
                          @tactics.disch_tac,
                        ),
                        t2081,
                      ),
                      @tactics.strip_tac,
                    ),
                    t2092,
                  ),
                  t2093,
                ),
                t2094,
              ),
              t2098,
            ),
            t2102,
          ),
          t2103,
        ),
        t2104,
      ),
      t2118,
    ),
    t2119,
  )
  prime_divisor_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, prime(n) == (!(n == 1) && (∀ d : Num, divides(d, n) && EXP(d, 2) <= n → d == 1))"),
      t2120,
    ),
  )
}

///|
let prime_divisor_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVISOR_SQRT",
)

///|
/// `PRIME_DIVISOR_SQRT`
pub fn prime_divisor_sqrt() -> @kernel.Thm {
  prime_divisor_sqrt_c.get()
}

///|
/// PRIME_PRIME_FACTOR_SQRT
fn step_192() -> Unit raise {
  let t2154 = @meson.asm_meson_tac(
    @list.List([@int.divides_le(), @prime.divides_zero()]),
  )
  let t2153 = @simp.rewrite_tac(
    @list.List([
      @calc_num.num_conv(@term_syntax.parse_term("2")),
      @arith.exp_mono_le(),
      @nums.not_suc(),
    ]),
  )
  let t2152 = @simp.asm_rewrite_tac(@list.List([]))
  let t2151 = @tactics.exists_tac(@term_syntax.parse_term("EXP((d : Num), 2)"))
  let t2150 = @tactics.match_mp_tac(@arith.le_trans())
  let t2149 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.divides_trans()])),
    @tactics.all_tac,
  ])
  let t2148 = @simp.asm_rewrite_tac(@list.List([]))
  let t2144 = @term_syntax.parse_term("(p : Num)")
  let t2147 = @tactics.first_x_assum(fn(
    x2146 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2141 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2142 = @tactics.mp_tac(x2141)
      fn(
        x2143 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2142(x2143)
      }
    })(((x2145 : @kernel.Thm) => @bool.spec(t2144, x2145))(x2146))
  })
  let t2140 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2137 = @drule.match_mp(@prime.prime_factor())
  let t2139 = @tactics.first_x_assum(fn(
    x2138 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2134 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2135 = @tactics.mp_tac(x2134)
      fn(
        x2136 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2135(x2136)
      }
    })(t2137(x2138))
  })
  let t2133 = @simp.asm_rewrite_tac(@list.List([]))
  let t2132 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t2131 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t2130 = @simp.asm_rewrite_tac(@list.List([]))
  let t2129 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t2128 = @list.List([
    @meson.meson_tac(@list.List([@prime.prime_1()])),
    @tactics.all_tac,
  ])
  let t2127 = @simp.gen_rewrite_tac(
    fn(
      x2124 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2125 = @equal.land_conv(x2124)
      fn(x2126 : @kernel.Term) -> @kernel.Thm raise { s2125(x2126) }
    },
    @list.List([prime_divisor_sqrt()]),
  )
  let t2123 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t2122 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2121 = @simp.asm_rewrite_tac(@list.List([@prime.prime_1()]))
  let t2155 = @tactics.then_tac(
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
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.gen_tac,
                                                    @class.asm_cases_tac(
                                                      @term_syntax.parse_term("(n : Num) == 1"),
                                                    ),
                                                  ),
                                                  t2121,
                                                ),
                                                t2122,
                                              ),
                                              t2123,
                                            ),
                                            t2127,
                                          ),
                                          @tactics.eq_tac,
                                        ),
                                        t2128,
                                      ),
                                      t2129,
                                    ),
                                    @tactics.disch_tac,
                                  ),
                                  t2130,
                                ),
                                t2131,
                              ),
                              @tactics.strip_tac,
                            ),
                            t2132,
                          ),
                          t2133,
                        ),
                        t2139,
                      ),
                      t2140,
                    ),
                    t2147,
                  ),
                  t2148,
                ),
                @tactics.conj_tac,
              ),
              t2149,
            ),
            t2150,
          ),
          t2151,
        ),
        t2152,
      ),
      t2153,
    ),
    t2154,
  )
  prime_prime_factor_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, prime(n) == (!(n == 0) && !(n == 1) && !(∃ p : Num, prime(p) && divides(p, n) && EXP(p, 2) <= n))"),
      t2155,
    ),
  )
}

///|
let prime_prime_factor_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_PRIME_FACTOR_SQRT",
)

///|
/// `PRIME_PRIME_FACTOR_SQRT`
pub fn prime_prime_factor_sqrt() -> @kernel.Thm {
  prime_prime_factor_sqrt_c.get()
}

///|
/// POCKLINGTON_LEMMA
fn step_193() -> Unit raise {
  let t2304 = @simp.rewrite_tac(@list.List([@arith.exp_one(), cong_refl()]))
  let t2303 = @simp.simp_tac(@list.List([cong_exp(), order_v1()]))
  let t2302 = @tactics.exists_tac(@term_syntax.parse_term("EXP(1, (t : Num))"))
  let t2301 = @tactics.match_mp_tac(cong_trans())
  let t2300 = @tactics.match_mp_tac(cong_1_divides())
  let t2299 = @simp.rewrite_tac(@list.List([@arith.exp_mult()]))
  let t2297 = @term_syntax.parse_term("(d : Num) * (t : Num) * (r : Num) == r * (d * t)")
  let t2298 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.mult_ac())(t2297)]),
  )
  let t2296 = @simp.asm_rewrite_tac(@list.List([]))
  let t2295 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@prime.prime_1()])),
  ])
  let t2294 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t2290 = @term_syntax.parse_term("(p : Num)")
  let t2293 = @tactics.disch_then(fn(
    x2292 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2287 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2288 = @tactics.mp_tac(x2287)
      fn(
        x2289 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2288(x2289)
      }
    })(((x2291 : @kernel.Thm) => @bool.spec(t2290, x2291))(x2292))
  })
  let t2286 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t2285 = @tactics.disch_then(fn(
    x2284 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2281 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2282 = @tactics.subst_all_tac(x2281)
      fn(
        x2283 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2282(x2283)
      }
    })(@equal.sym(x2284))
  })
  let t2280 = @simp.asm_rewrite_tac(@list.List([]))
  let t2279 = @simp.rewrite_tac(@list.List([@arith.eq_mult_lcancel()]))
  let t2278 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((a : Num) * ((p : Num) * (b : Num)) == p * (c : Num)) == (p * (a * b) == p * c)"),
      ),
    ]),
  )
  let t2277 = @tactics.undisch_tac(
    @term_syntax.parse_term("order((p : Num), EXP((a : Num), (r : Num))) * ((P : Num) * (t : Num)) == P * (s : Num)"),
  )
  let t2276 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Num)"))(fn(
      x2273 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2274 = @tactics.subst_all_tac(x2273)
      fn(
        x2275 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2274(x2275)
      }
    }),
  )
  let t2272 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2271 = @tactics.undisch_tac(@term_syntax.parse_term("divides((P : Num), (d : Num))"))
  let t2270 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t2269 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.prime_0()])),
    @tactics.all_tac,
  ])
  let t2268 = @tactics.subgoal_then(@term_syntax.parse_term("!((P : Num) == 0)"), fn(
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
    let s2266 = @tactics.assume_tac(x2265)
    fn(
      x2267 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2266(x2267)
    }
  })
  let t2264 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2263 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : Num)"))(fn(
      x2260 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2261 = @tactics.subst_all_tac(x2260)
      fn(
        x2262 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2261(x2262)
      }
    }),
  )
  let t2259 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2258 = @tactics.undisch_tac(@term_syntax.parse_term("divides((P : Num), (q : Num))"))
  let t2257 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")),
  )
  let t2256 = @simp.asm_rewrite_tac(@list.List([]))
  let t2252 = @term_syntax.parse_term("(P : Num)")
  let t2255 = @tactics.first_x_assum(fn(
    x2254 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2249 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2250 = @tactics.mp_tac(x2249)
      fn(
        x2251 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2250(x2251)
      }
    })(((x2253 : @kernel.Thm) => @bool.spec(t2252, x2253))(x2254))
  })
  let t2248 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.divides_lmul()])),
    @tactics.all_tac,
  ])
  let t2247 = @tactics.subgoal_then(@term_syntax.parse_term("divides((P : Num), (q : Num))"), fn(
    x2244 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2245 = @tactics.assume_tac(x2244)
    fn(
      x2246 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2245(x2246)
    }
  })
  let t2243 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(P : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2240 = @drule.match_mp(@prime.prime_factor())
  let t2242 = @tactics.first_assum(fn(
    x2241 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2237 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2238 = @tactics.mp_tac(x2237)
      fn(
        x2239 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2238(x2239)
      }
    })(t2240(x2241))
  })
  let t2236 = @tactics.disch_then(fn(
    x2235 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2232 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2233 = @tactics.assume_tac(x2232)
      fn(
        x2234 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2233(x2234)
      }
    })(@equal.sym(x2235))
  })
  let t2231 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses()]))
  let t2230 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t2229 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t2228 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t2226 = @meson.meson_tac(@list.List([@arith.mult_ac()]))
  let t2225 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t2224 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : Num)"))(fn(
      x2221 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2222 = @tactics.subst_all_tac(x2221)
      fn(
        x2223 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2222(x2223)
      }
    }),
  )
  let t2220 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2219 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t2218 = @simp.asm_rewrite_tac(@list.List([]))
  let t2217 = @tactics.undisch_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), (n : Num) - 1), 1, mod(n))"),
  )
  let t2216 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t2227 = @list.List([
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
                        @equal.gsym(order_divides()),
                        @arith.exp_exp(),
                      ]),
                    ),
                    t2216,
                  ),
                  t2217,
                ),
                t2218,
              ),
              t2219,
            ),
            t2220,
          ),
          t2224,
        ),
        t2225,
      ),
      t2226,
    ),
    @tactics.all_tac,
  ])
  let t2215 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(order((p : Num), EXP((a : Num), (r : Num))), (q : Num))"),
    fn(
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
      let s2213 = @tactics.mp_tac(x2212)
      fn(
        x2214 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2213(x2214)
      }
    },
  )
  let t2210 = @meson.asm_meson_tac(
    @list.List([
      @prime.divides_rmul(),
      @prime.divides_add(),
      @prime.divides_add_revl(),
    ]),
  )
  let t2209 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides_one(), @prime.prime_1()])),
    @tactics.all_tac,
  ])
  let t2208 = @tactics.subgoal_then(@term_syntax.parse_term("!divides((p : Num), 1)"), fn(
    x2205 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2206 = @tactics.mp_tac(x2205)
    fn(
      x2207 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2206(x2207)
    }
  })
  let t2204 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t2202 = @simp.asm_simp_tac(@list.List([@prime.divides_rmul()]))
  let t2201 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t2199 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → n - 1 == SUC(n - 2)")),
  )
  let t2203 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x2200 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x2196 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s2197 = @tactics.subst1_tac(x2196)
            fn(
              x2198 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s2197(x2198)
            }
          })(t2199(x2200))
        }),
        t2201,
      ),
      t2202,
    ),
    @tactics.all_tac,
  ])
  let t2195 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides((p : Num), EXP((a : Num), (n : Num) - 1))"),
    fn(
      x2192 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2193 = @tactics.assume_tac(x2192)
      fn(
        x2194 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2193(x2194)
      }
    },
  )
  let t2191 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.prime()])),
    @tactics.all_tac,
  ])
  let t2190 = @tactics.subgoal_then(@term_syntax.parse_term("(d : Num) == (p : Num)"), fn(
    x2187 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2188 = @tactics.subst_all_tac(x2187)
    fn(
      x2189 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2188(x2189)
    }
  })
  let t2186 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2185 = @simp.rewrite_tac(
    @list.List([@int.coprime(), @class.not_forall_thm(), @class.not_imp()]),
  )
  let t2184 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2183 = @tactics.undisch_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), (n : Num) - 1), 1, mod(n))"),
  )
  let t2182 = @tactics.match_mp_tac(@prime.coprime_exp())
  let t2181 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t2179 = @meson.asm_meson_tac(@list.List([@prime.prime_0()]))
  let t2178 = @simp.rewrite_tac(@list.List([nat_mod(), @int.cong()]))
  let t2175 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(p : Num) - 1 == (q : Num) * (d : Num) → !(p == 0) → p + q * 0 == 1 + q * d"),
    ),
  )
  let t2177 = @tactics.disch_then(fn(
    x2176 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2172 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2173 = @tactics.mp_tac(x2172)
      fn(
        x2174 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2173(x2174)
      }
    })(t2175(x2176))
  })
  let t2171 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t2170 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t2169 = @list.List([
    @meson.asm_meson_tac(@list.List([phi_prime_eq()])),
    @tactics.all_tac,
  ])
  let t2168 = @tactics.subgoal_then(@term_syntax.parse_term("phi((p : Num)) == p - 1"), fn(
    x2165 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2166 = @tactics.subst1_tac(x2165)
    fn(
      x2167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2166(x2167)
    }
  })
  let t2180 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @simp.asm_rewrite_tac(@list.List([order_divides()])),
                  t2168,
                ),
                t2169,
              ),
              t2170,
            ),
            t2171,
          ),
          t2177,
        ),
        t2178,
      ),
      t2179,
    ),
  ])
  let t2163 = @drule.match_mp(fermat_little())
  let t2211 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.thenl(
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
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.subgoal_then(
                                    @term_syntax.parse_term("coprime((EXP((a : Num), (r : Num)), (p : Num)))"),
                                    fn(
                                      x2164 : @kernel.Thm,
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
                                      (fn(
                                        x2160 : @kernel.Thm,
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
                                        let s2161 = @tactics.mp_tac(x2160)
                                        fn(
                                          x2162 : (
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
                                                (
                                                  @kernel.HolType,
                                                  @kernel.HolType,
                                                ),
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
                                                (
                                                  @kernel.HolType,
                                                  @kernel.HolType,
                                                ),
                                              ],
                                            ),
                                            @list.List[@kernel.Thm],
                                          ) -> @kernel.Thm raise,
                                        ) raise {
                                          s2161(x2162)
                                        }
                                      })(t2163(x2164))
                                    },
                                  ),
                                  t2180,
                                ),
                                t2181,
                              ),
                              t2182,
                            ),
                            t2183,
                          ),
                          t2184,
                        ),
                        t2185,
                      ),
                      t2186,
                    ),
                    t2190,
                  ),
                  t2191,
                ),
                t2195,
              ),
              t2203,
            ),
            t2204,
          ),
          t2208,
        ),
        t2209,
      ),
      t2210,
    ),
  ])
  let t2159 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((p : Num), EXP((a : Num), (r : Num))) == (q : Num)"),
    fn(
      x2156 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2157 = @tactics.assume_tac(x2156)
      fn(
        x2158 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2157(x2158)
      }
    },
  )
  let t2305 = @tactics.then_tac(
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
                                                                                  @tactics.thenl(
                                                                                    @tactics.then_tac(
                                                                                      @tactics.thenl(
                                                                                        @tactics.then_tac(
                                                                                          @tactics.repeat_tac(
                                                                                            @tactics.strip_tac,
                                                                                          ),
                                                                                          t2159,
                                                                                        ),
                                                                                        t2211,
                                                                                      ),
                                                                                      t2215,
                                                                                    ),
                                                                                    t2227,
                                                                                  ),
                                                                                  t2228,
                                                                                ),
                                                                                t2229,
                                                                              ),
                                                                              t2230,
                                                                            ),
                                                                            t2231,
                                                                          ),
                                                                          t2236,
                                                                        ),
                                                                        t2242,
                                                                      ),
                                                                      t2243,
                                                                    ),
                                                                    t2247,
                                                                  ),
                                                                  t2248,
                                                                ),
                                                                t2255,
                                                              ),
                                                              t2256,
                                                            ),
                                                            t2257,
                                                          ),
                                                          t2258,
                                                        ),
                                                        t2259,
                                                      ),
                                                      t2263,
                                                    ),
                                                    t2264,
                                                  ),
                                                  t2268,
                                                ),
                                                t2269,
                                              ),
                                              t2270,
                                            ),
                                            t2271,
                                          ),
                                          t2272,
                                        ),
                                        t2276,
                                      ),
                                      t2277,
                                    ),
                                    t2278,
                                  ),
                                  t2279,
                                ),
                                t2280,
                              ),
                              t2285,
                            ),
                            t2286,
                          ),
                          t2293,
                        ),
                        t2294,
                      ),
                      @tactics.conj_tac,
                    ),
                    t2295,
                  ),
                  t2296,
                ),
                t2298,
              ),
              t2299,
            ),
            t2300,
          ),
          t2301,
        ),
        t2302,
      ),
      t2303,
    ),
    t2304,
  )
  pocklington_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, 2 <= n && n - 1 == q * r && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ p : Num, prime(p) && divides(p, q) → coprime((EXP(a, DIV(n - 1, p)) - 1, n))) → (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(p, 1, mod(q)))"),
      t2305,
    ),
  )
}

///|
let pocklington_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POCKLINGTON_LEMMA",
)

///|
/// `POCKLINGTON_LEMMA`
pub fn pocklington_lemma() -> @kernel.Thm {
  pocklington_lemma_c.get()
}

///|
/// POCKLINGTON
fn step_194() -> Unit raise {
  let t2345 = @drule.match_mp(@prime.prime_ge_2())
  let t2347 = @tactics.first_assum(fn(
    x2346 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s2343 = @tactics.mp_tac(x2342)
      fn(
        x2344 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2343(x2344)
      }
    })(t2345(x2346))
  })
  let t2339 = @drule.match_mp(@int.divides_le())
  let t2341 = @tactics.disch_then(fn(
    x2340 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2336 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2337 = @tactics.mp_tac(x2336)
      fn(
        x2338 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2337(x2338)
      }
    })(t2339(x2340))
  })
  let t2333 = @drule.match_mp(cong_1_divides())
  let t2335 = @tactics.disch_then(fn(
    x2334 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2330 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2331 = @tactics.mp_tac(x2330)
      fn(
        x2332 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2331(x2332)
      }
    })(t2333(x2334))
  })
  let t2329 = @simp.rewrite_tac(@list.List([]))
  let t2328 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2327 = @simp.rewrite_tac(
    @list.List([
      @calc_num.num_conv(@term_syntax.parse_term("2")),
      @arith.exp_mono_le(),
      @nums.not_suc(),
    ]),
  )
  let t2326 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.le_trans()])),
    @tactics.all_tac,
  ])
  let t2325 = @tactics.subgoal_then(@term_syntax.parse_term("EXP((p : Num), 2) <= EXP((q : Num), 2)"), fn(
    x2322 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2323 = @tactics.mp_tac(x2322)
    fn(
      x2324 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2323(x2324)
    }
  })
  let t2321 = @simp.asm_rewrite_tac(@list.List([]))
  let t2317 = @term_syntax.parse_term("(p : Num)")
  let t2320 = @tactics.disch_then(fn(
    x2319 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s2315 = @tactics.mp_tac(x2314)
      fn(
        x2316 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2315(x2316)
      }
    })(((x2318 : @kernel.Thm) => @bool.spec(t2317, x2318))(x2319))
  })
  let t2313 = @simp.asm_rewrite_tac(@list.List([]))
  let t2309 = @term_syntax.parse_term("(r : Num)")
  let t2310 = @term_syntax.parse_term("(q : Num)")
  let t2311 = @term_syntax.parse_term("(n : Num)")
  let t2312 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t2311, t2310, t2309]),
      pocklington_lemma(),
    ),
  )
  let t2308 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2307 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0) && !(n == 1)")),
    ]),
  )
  let t2306 = @simp.once_rewrite_tac(@list.List([prime_prime_factor_sqrt()]))
  let t2348 = @tactics.then_tac(
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
                                  @tactics.repeat_tac(@tactics.strip_tac),
                                  t2306,
                                ),
                                t2307,
                              ),
                              t2308,
                            ),
                            t2312,
                          ),
                          t2313,
                        ),
                        t2320,
                      ),
                      t2321,
                    ),
                    t2325,
                  ),
                  t2326,
                ),
                t2327,
              ),
              t2328,
            ),
            t2329,
          ),
          t2335,
        ),
        t2341,
      ),
      t2347,
    ),
    @int.arith_tac,
  )
  pocklington_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, 2 <= n && n - 1 == q * r && n <= EXP(q, 2) && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ p : Num, prime(p) && divides(p, q) → coprime((EXP(a, DIV(n - 1, p)) - 1, n))) → prime(n)"),
      t2348,
    ),
  )
}

///|
let pocklington_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POCKLINGTON")

///|
/// `POCKLINGTON`
pub fn pocklington() -> @kernel.Thm {
  pocklington_c.get()
}

///|
/// POCKLINGTON_ALT
fn step_195() -> Unit raise {
  let t2437 = @simp.rewrite_tac(
    @list.List([@arith.exp(), @prime.divides_rmul()]),
  )
  let t2436 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) == 0)")),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2435 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) == SUC(p - 1)"), fn(
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
    let s2433 = @tactics.subst1_tac(x2432)
    fn(
      x2434 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2433(x2434)
    }
  })
  let t2431 = @simp.gen_rewrite_tac(
    fn(
      x2430 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2424 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2425 = @equal.rand_conv(x2424)
        fn(x2426 : @kernel.Term) -> @kernel.Thm raise { s2425(x2426) }
      })(
        (fn(
          x2427 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2428 = @equal.once_depth_conv(x2427)
          fn(x2429 : @kernel.Term) -> @kernel.Thm raise { s2428(x2429) }
        })(x2430),
      )
    },
    @list.List([@arith.exp_mult()]),
  )
  let t2423 = @simp.gen_rewrite_tac(
    fn(
      x2422 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2416 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2417 = @equal.rand_conv(x2416)
        fn(x2418 : @kernel.Term) -> @kernel.Thm raise { s2417(x2418) }
      })(
        (fn(
          x2419 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2420 = @equal.once_depth_conv(x2419)
          fn(x2421 : @kernel.Term) -> @kernel.Thm raise { s2420(x2421) }
        })(x2422),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t2415 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t2414 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.prime_0()])),
    @tactics.all_tac,
  ])
  let t2413 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(
    x2410 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2411 = @tactics.assume_tac(x2410)
    fn(
      x2412 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2411(x2412)
    }
  })
  let t2409 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2408 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x2405 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2406 = @tactics.subst1_tac(x2405)
      fn(
        x2407 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2406(x2407)
      }
    }),
  )
  let t2404 = @simp.gen_rewrite_tac(
    fn(
      x2401 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2402 = @equal.land_conv(x2401)
      fn(x2403 : @kernel.Term) -> @kernel.Thm raise { s2402(x2403) }
    },
    @list.List([@int.divides()]),
  )
  let t2400 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (q : Num))"))
  let t2399 = @simp.asm_rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t2398 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        cong_divides(),
        @int.divides_one(),
        @int.arith_rule(@term_syntax.parse_term("!(2 <= 1)")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t2397 = @tactics.subgoal_then(
    @term_syntax.parse_term("!divides((n : Num), EXP((a : Num), n - 1))"),
    fn(
      x2394 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2395 = @tactics.mp_tac(x2394)
      fn(
        x2396 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2395(x2396)
      }
    },
  )
  let t2393 = @simp.rewrite_tac(@list.List([cong_0_divides()]))
  let t2392 = @tactics.disch_then(fn(
    x2389 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2390 = @tactics.subst1_tac(x2389)
    fn(
      x2391 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2390(x2391)
    }
  })
  let t2388 = @simp.rewrite_tac(@list.List([]))
  let t2387 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2386 = @tactics.undisch_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), DIV((q : Num) * (r : Num), (p : Num))), (b : Num), mod((n : Num)))"),
  )
  let t2385 = @simp.asm_rewrite_tac(@list.List([]))
  let t2383 = @tactics.undisch_tac(@term_syntax.parse_term("2 <= (n : Num)"))
  let t2382 = @simp.rewrite_tac(
    @list.List([cong_0_divides(), @int.divides_one()]),
  )
  let t2381 = @simp.once_rewrite_tac(@list.List([cong_sym()]))
  let t2380 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.exp()]),
  )
  let t2377 = @kernel.assume_rule(@term_syntax.parse_term("2 <= (n : Num)"))
  let t2378 = @kernel.assume_rule(@term_syntax.parse_term("(a : Num) == 0"))
  let t2379 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → n - 1 == SUC(n - 2)")),
      t2378,
      t2377,
    ]),
  )
  let t2384 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_tac,
                  @tactics.undisch_tac(
                    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), (n : Num) - 1), 1, mod(n))"),
                  ),
                ),
                t2379,
              ),
              t2380,
            ),
            t2381,
          ),
          t2382,
        ),
        t2383,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2376 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Num) == 0)"), fn(
    x2373 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2374 = @tactics.assume_tac(x2373)
    fn(
      x2375 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2374(x2375)
    }
  })
  let t2372 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
      @arith.exp_eq_0(),
    ]),
  )
  let t2371 = @simp.asm_rewrite_tac(@list.List([cong_refl()]))
  let t2370 = @tactics.match_mp_tac(cong_sub())
  let t2369 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), DIV((q : Num) * (r : Num), (p : Num))) - 1, (b : Num) - 1, mod((n : Num)))"),
    fn(
      x2367 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x2367
      @meson.asm_meson_tac(
        @list.List([cong_coprime(), @prime.coprime_sym(), th]),
      )
    },
  )
  let t2366 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2365 = @simp.asm_rewrite_tac(@list.List([]))
  let t2361 = @term_syntax.parse_term("(p : Num)")
  let t2364 = @tactics.first_x_assum(fn(
    x2363 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2358 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2359 = @tactics.mp_tac(x2358)
      fn(
        x2360 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2359(x2360)
      }
    })(((x2362 : @kernel.Thm) => @bool.spec(t2361, x2362))(x2363))
  })
  let t2357 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2356 = @simp.asm_rewrite_tac(@list.List([]))
  let t2353 = @term_syntax.parse_term("(r : Num)")
  let t2354 = @term_syntax.parse_term("(q : Num)")
  let t2355 = @tactics.map_every(
    fn(
      x2350 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2351 = @tactics.exists_tac(x2350)
      fn(
        x2352 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2351(x2352)
      }
    },
    @list.List([@term_syntax.parse_term("(a : Num)"), t2354, t2353]),
  )
  let t2349 = @tactics.match_mp_tac(pocklington())
  let t2438 = @tactics.then_tac(
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
                                                                        @tactics.repeat_tac(
                                                                          @tactics.strip_tac,
                                                                        ),
                                                                        t2349,
                                                                      ),
                                                                      t2355,
                                                                    ),
                                                                    t2356,
                                                                  ),
                                                                  t2357,
                                                                ),
                                                                @tactics.strip_tac,
                                                              ),
                                                              t2364,
                                                            ),
                                                            t2365,
                                                          ),
                                                          t2366,
                                                        ),
                                                        t2369,
                                                      ),
                                                      t2370,
                                                    ),
                                                    t2371,
                                                  ),
                                                  t2372,
                                                ),
                                                t2376,
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
                                    t2392,
                                  ),
                                  t2393,
                                ),
                                t2397,
                              ),
                              t2398,
                            ),
                            t2399,
                          ),
                          t2400,
                        ),
                        t2404,
                      ),
                      t2408,
                    ),
                    t2409,
                  ),
                  t2413,
                ),
                t2414,
              ),
              t2415,
            ),
            t2423,
          ),
          t2431,
        ),
        t2435,
      ),
      t2436,
    ),
    t2437,
  )
  pocklington_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, 2 <= n && n - 1 == q * r && n <= EXP(q, 2) && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ p : Num, prime(p) && divides(p, q) → (∃ b : Num, op_eq_eq(EXP(a, DIV(n - 1, p)), b, mod(n)) && coprime((b - 1, n)))) → prime(n)"),
      t2438,
    ),
  )
}

///|
let pocklington_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POCKLINGTON_ALT",
)

///|
/// `POCKLINGTON_ALT`
pub fn pocklington_alt() -> @kernel.Thm {
  pocklington_alt_c.get()
}

///|
/// primefact
fn step_196() -> Unit raise {
  primefact_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(primefact : (List[Num], Num) -> Bool)((ps : List[Num]), (n : Num)) == (ITLIST(op_star, ps, 1) == n && (∀ p : Num, MEM(p, ps) → prime(p)))"),
    ),
  )
}

///|
let primefact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("primefact")

///|
/// `primefact`
pub fn primefact() -> @kernel.Thm {
  primefact_c.get()
}

///|
/// PRIMEFACT
fn step_197() -> Unit raise {
  let t2485 = @meson.asm_meson_tac(@list.List([]))
  let t2484 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.itlist()]))
  let t2483 = @tactics.exists_tac(@term_syntax.parse_term("CONS((p : Num), (ps : List[Num]))"))
  let t2482 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(ps : List[Num])"))(fn(
      x2479 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2480 = @tactics.assume_tac(x2479)
      fn(
        x2481 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2480(x2481)
      }
    }),
  )
  let t2478 = @simp.rewrite_tac(@list.List([primefact()]))
  let t2476 = @simp.asm_rewrite_tac(
    @list.List([@prime.prime_0(), @prime.prime_1()]),
  )
  let t2475 = @tactics.undisch_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t2474 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2477 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @int.arith_rule(
              @term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) → 1 < p"),
            ),
          ),
          t2474,
        ),
        t2475,
      ),
      t2476,
    ),
    @tactics.all_tac,
  ])
  let t2473 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (p : Num)"), fn(
    x2471 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x2471
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2470 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t2469 = @simp.gen_rewrite_tac(
    (x2468 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        3,
        fn(
          x2465 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2466 = @equal.land_conv(x2465)
          fn(x2467 : @kernel.Term) -> @kernel.Thm raise { s2466(x2467) }
        },
        x2468,
      )
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]),
  )
  let t2464 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t2463 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t2462 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) * (m : Num) == 0)"))
  let t2458 = @term_syntax.parse_term("(m : Num)")
  let t2461 = @tactics.first_x_assum(fn(
    x2460 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2455 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2456 = @tactics.mp_tac(x2455)
      fn(
        x2457 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2456(x2457)
      }
    })(((x2459 : @kernel.Thm) => @bool.spec(t2458, x2459))(x2460))
  })
  let t2454 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
      x2451 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2452 = @tactics.subst_all_tac(x2451)
      fn(
        x2453 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2452(x2453)
      }
    }),
  )
  let t2450 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2449 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t2445 = @drule.match_mp(@prime.prime_factor())
  let t2446 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
    @tactics.strip_assume_tac,
  )
  let t2448 = @tactics.first_assum(fn(
    x2447 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t2446(t2445(x2447))
  })
  let t2443 = @simp.rewrite_tac(
    @list.List([primefact(), @lists.itlist(), @lists.mem()]),
  )
  let t2442 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Num])"))
  let t2444 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t2442),
      t2443,
    ),
    @tactics.all_tac,
  ])
  let t2441 = @simp.asm_rewrite_tac(@list.List([]))
  let t2440 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t2439 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2486 = @tactics.then_tac(
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
                                        @tactics.then_tac(
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.match_mp_tac(
                                                    @arith.num_wf(),
                                                  ),
                                                  t2439,
                                                ),
                                                t2440,
                                              ),
                                              t2441,
                                            ),
                                            t2444,
                                          ),
                                          @tactics.disch_tac,
                                        ),
                                        @tactics.disch_tac,
                                      ),
                                      t2448,
                                    ),
                                    t2449,
                                  ),
                                  t2450,
                                ),
                                t2454,
                              ),
                              t2461,
                            ),
                            t2462,
                          ),
                          t2463,
                        ),
                        t2464,
                      ),
                      @tactics.disch_tac,
                    ),
                    t2469,
                  ),
                  t2470,
                ),
                t2473,
              ),
              t2477,
            ),
            t2478,
          ),
          t2482,
        ),
        t2483,
      ),
      t2484,
    ),
    t2485,
  )
  primefact_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → (∃ ps : List[Num], primefact(ps, n))"),
      t2486,
    ),
  )
}

///|
let primefact_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMEFACT")

///|
/// `PRIMEFACT`
pub fn primefact_v1() -> @kernel.Thm {
  primefact_v1_c.get()
}

///|
/// PRIMAFACT_CONTAINS
fn step_198() -> Unit raise {
  let t2511 = @meson.asm_meson_tac(@list.List([@int.prime(), @prime.prime_1()]))
  let t2508 = @drule.match_mp(@prime.prime_divprod())
  let t2510 = @tactics.disch_then(fn(
    x2509 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.disj_cases_tac(t2508(x2509))
  })
  let t2507 = @tactics.disch_then(fn(
    x2504 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x2504
    let t2506 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(@bool.conjunct1(th)), t2506)
  })
  let t2503 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides_one(), @prime.prime_1()])),
    @tactics.all_tac,
  ])
  let t2502 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem()]))
  let t2500 = @term_syntax.parse_term("(ps : List[Num])")
  let t2501 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t2500)
  let t2499 = @tactics.pop_assum(fn(
    x2498 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2495 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2496 = @tactics.subst1_tac(x2495)
      fn(
        x2497 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2496(x2497)
      }
    })(@equal.sym(x2498))
  })
  let t2494 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2488 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2489 = @tactics.assume_tac(x2488)
        fn(
          x2490 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2489(x2490)
        }
      },
      fn(
        x2491 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2492 = @tactics.mp_tac(x2491)
        fn(
          x2493 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2492(x2493)
        }
      },
    ),
  )
  let t2487 = @simp.rewrite_tac(@list.List([primefact()]))
  let t2512 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t2487,
                        ),
                        t2494,
                      ),
                      t2499,
                    ),
                    t2501,
                  ),
                  @lists.list_induct_tac,
                ),
                t2502,
              ),
              t2503,
            ),
            @tactics.strip_tac,
          ),
          @tactics.gen_tac,
        ),
        t2507,
      ),
      t2510,
    ),
    t2511,
  )
  primafact_contains_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ ps : List[Num], ∀ n : Num, primefact(ps, n) → (∀ p : Num, prime(p) && divides(p, n) → MEM(p, ps))"),
      t2512,
    ),
  )
}

///|
let primafact_contains_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMAFACT_CONTAINS",
)

///|
/// `PRIMAFACT_CONTAINS`
pub fn primafact_contains() -> @kernel.Thm {
  primafact_contains_c.get()
}

///|
/// PRIMEFACT_VARIANT
fn step_199() -> Unit raise {
  let t2517 = @meson.asm_meson_tac(@list.List([]))
  let t2516 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.all()]))
  let t2514 = @term_syntax.parse_term("(ps : List[Num])")
  let t2515 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t2514)
  let t2513 = @simp.rewrite_tac(@list.List([primefact()]))
  let t2518 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2513),
            @tactics.ap_term_tac,
          ),
          t2515,
        ),
        @lists.list_induct_tac,
      ),
      t2516,
    ),
    t2517,
  )
  primefact_variant_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ ps : List[Num], ∀ n : Num, primefact(ps, n) == (ITLIST(op_star, ps, 1) == n && ALL(prime, ps))"),
      t2518,
    ),
  )
}

///|
let primefact_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEFACT_VARIANT",
)

///|
/// `PRIMEFACT_VARIANT`
pub fn primefact_variant() -> @kernel.Thm {
  primefact_variant_c.get()
}

///|
/// LUCAS_PRIMEFACT
fn step_200() -> Unit raise {
  let t2545 = @meson.asm_meson_tac(@list.List([]))
  let t2544 = @simp.simp_tac(@list.List([@lists.all(), @lists.mem()]))
  let t2542 = @term_syntax.parse_term("(ps : List[Num])")
  let t2543 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t2542)
  let t2541 = @tactics.undisch_tac(
    @term_syntax.parse_term("ALL((p : Num) => prime(p) && !op_eq_eq(EXP((a : Num), DIV((n : Num) - 1, p)), 1, mod(n)), (ps : List[Num]))"),
  )
  let t2540 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2537 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2538 = @tactics.mp_tac(x2537)
      fn(
        x2539 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2538(x2539)
      }
    }),
  )
  let t2536 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2533 = @drule.match_mp(primafact_contains())
  let t2535 = @tactics.disch_then(fn(
    x2534 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2530 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2531 = @tactics.assume_tac(x2530)
      fn(
        x2532 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2531(x2532)
      }
    })(t2533(x2534))
  })
  let t2528 = @simp.asm_simp_tac(@list.List([]))
  let t2527 = @tactics.exists_tac(
    @term_syntax.parse_term("(p : Num) => prime(p) && !op_eq_eq(EXP((a : Num), DIV((n : Num) - 1, p)), 1, mod(n))"),
  )
  let t2526 = @tactics.match_mp_tac(@lists.all_imp())
  let t2529 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([primefact_variant()])),
          t2526,
        ),
        t2527,
      ),
      t2528,
    ),
    @tactics.all_tac,
  ])
  let t2525 = @tactics.subgoal_then(
    @term_syntax.parse_term("primefact((ps : List[Num]), (n : Num) - 1)"),
    fn(
      x2522 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2523 = @tactics.mp_tac(x2522)
      fn(
        x2524 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2523(x2524)
      }
    },
  )
  let t2521 = @simp.asm_rewrite_tac(@list.List([]))
  let t2520 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t2519 = @tactics.match_mp_tac(lucas())
  let t2546 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t2519,
                          ),
                          t2520,
                        ),
                        t2521,
                      ),
                      t2525,
                    ),
                    t2529,
                  ),
                  t2535,
                ),
                t2536,
              ),
              t2540,
            ),
            t2541,
          ),
          t2543,
        ),
        @lists.list_induct_tac,
      ),
      t2544,
    ),
    t2545,
  )
  lucas_primefact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("2 <= (n : Num) && op_eq_eq(EXP((a : Num), n - 1), 1, mod(n)) && ITLIST(op_star, (ps : List[Num]), 1) == n - 1 && ALL((p : Num) => prime(p) && !op_eq_eq(EXP(a, DIV(n - 1, p)), 1, mod(n)), ps) → prime(n)"),
      t2546,
    ),
  )
}

///|
let lucas_primefact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LUCAS_PRIMEFACT",
)

///|
/// `LUCAS_PRIMEFACT`
pub fn lucas_primefact() -> @kernel.Thm {
  lucas_primefact_c.get()
}

///|
/// POCKLINGTON_PRIMEFACT
fn step_201() -> Unit raise {
  let t2685 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t2684 = @simp.asm_simp_tac(
    @list.List([
      @arith.mod_mult(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t2683 = @simp.rewrite_tac(
    @list.List([@arith.exp(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t2682 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t2679 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → p == SUC(p - 1)")),
  )
  let t2681 = @tactics.first_assum(fn(
    x2680 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2676 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2677 = @tactics.subst1_tac(x2676)
      fn(
        x2678 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2677(x2678)
      }
    })(t2679(x2680))
  })
  let t2675 = @simp.asm_rewrite_tac(@list.List([]))
  let t2671 = @term_syntax.parse_term("MOD")
  let t2668 = @term_syntax.parse_term("(n : Num)")
  let t2674 = @tactics.disch_then(fn(
    x2673 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2670 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x2663 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2664 = @tactics.mp_tac(x2663)
        fn(
          x2665 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2664(x2665)
        }
      })(
        (fn(x2669 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x2666 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x2667 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x2666, x2667)
            }
          })(x2669)(t2668)
        })(x2670),
      )
    })(((x2672 : @kernel.Thm) => @equal.ap_term(t2671, x2672))(x2673))
  })
  let t2661 = @meson.asm_meson_tac(
    @list.List([@arith.div_mult(), @arith.mult_ac(), @prime.prime_0()]),
  )
  let t2660 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2659 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x2656 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2657 = @tactics.subst1_tac(x2656)
      fn(
        x2658 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2657(x2658)
      }
    }),
  )
  let t2655 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2654 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (q : Num))"))
  let t2662 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.subst1_tac(
                @equal.sym(
                  @kernel.assume_rule(@term_syntax.parse_term("(q : Num) * (r : Num) == (n : Num) - 1")),
                ),
              ),
              t2654,
            ),
            t2655,
          ),
          t2659,
        ),
        t2660,
      ),
      t2661,
    ),
    @tactics.all_tac,
  ])
  let t2653 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((n : Num) - 1, (p : Num)) * p == n - 1"),
    fn(
      x2650 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2651 = @tactics.subst1_tac(x2650)
      fn(
        x2652 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2651(x2652)
      }
    },
  )
  let t2649 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t2645 = @term_syntax.parse_term("EXP")
  let t2642 = @term_syntax.parse_term("(p : Num)")
  let t2648 = @tactics.disch_then(fn(
    x2647 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2644 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x2637 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2638 = @tactics.mp_tac(x2637)
        fn(
          x2639 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2638(x2639)
        }
      })(
        (fn(x2643 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x2640 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x2641 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x2640, x2641)
            }
          })(x2643)(t2642)
        })(x2644),
      )
    })(((x2646 : @kernel.Thm) => @equal.ap_term(t2645, x2646))(x2647))
  })
  let t2636 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : Num)"))(fn(
      x2633 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2634 = @tactics.mp_tac(x2633)
      fn(
        x2635 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2634(x2635)
      }
    }),
  )
  let t2632 = @simp.asm_simp_tac(
    @list.List([
      @arith.mod_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t2631 = @simp.asm_simp_tac(
    @list.List([
      @arith.mod_le(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t2630 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(a : Num) <= (b : Num) && !(a == 0) → 1 <= a && 1 <= b"),
    ),
  )
  let t2629 = @simp.asm_simp_tac(
    @list.List([
      cong_mod(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
      cong_refl(),
    ]),
  )
  let t2628 = @tactics.match_mp_tac(cong_sub())
  let t2627 = @tactics.match_mp_tac(cong_coprime())
  let t2625 = @simp.asm_simp_tac(
    @list.List([@arith.div_mult(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t2624 = @tactics.undisch_then(@term_syntax.parse_term("(p : Num) * (d : Num) * (r : Num) == (n : Num) - 1"), fn(
    x2623 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2620 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2621 = @tactics.subst1_tac(x2620)
      fn(
        x2622 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2621(x2622)
      }
    })(@equal.sym(x2623))
  })
  let t2619 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x2616 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2617 = @tactics.subst_all_tac(x2616)
      fn(
        x2618 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2617(x2618)
      }
    }),
  )
  let t2615 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2626 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (q : Num))")),
            t2615,
          ),
          t2619,
        ),
        t2624,
      ),
      t2625,
    ),
    @tactics.all_tac,
  ])
  let t2614 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((q : Num), (p : Num)) * (r : Num) == DIV((n : Num) - 1, p)"),
    fn(
      x2611 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2612 = @tactics.subst1_tac(x2611)
      fn(
        x2613 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2612(x2613)
      }
    },
  )
  let t2610 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.prime_0()])),
    @tactics.all_tac,
  ])
  let t2609 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(
    x2606 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2607 = @tactics.assume_tac(x2606)
    fn(
      x2608 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2607(x2608)
    }
  })
  let t2605 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t2604 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → a && b → c")),
  )
  let t2603 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2600 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2601 = @tactics.mp_tac(x2600)
      fn(
        x2602 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2601(x2602)
      }
    }),
  )
  let t2599 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@equal.gsym(@lists.all_mem())])),
  )
  let t2598 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2595 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2596 = @tactics.mp_tac(x2595)
      fn(
        x2597 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2596(x2597)
      }
    }),
  )
  let t2594 = @tactics.disch_then(fn(
    x2591 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x2591
    let t2593 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.strip_assume_tac(th_1), t2593)
  })
  let t2590 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2587 = @drule.match_mp(primafact_contains())
  let t2589 = @tactics.disch_then(fn(
    x2588 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2584 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2585 = @tactics.assume_tac(x2584)
      fn(
        x2586 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2585(x2586)
      }
    })(t2587(x2588))
  })
  let t2582 = @simp.asm_simp_tac(@list.List([]))
  let t2581 = @tactics.exists_tac(
    @term_syntax.parse_term("(p : Num) => prime(p) && coprime((MOD(EXP((a : Num), DIV((q : Num), p) * (r : Num)), (n : Num)) - 1, n))"),
  )
  let t2580 = @tactics.match_mp_tac(@lists.all_imp())
  let t2583 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([primefact_variant()])),
          t2580,
        ),
        t2581,
      ),
      t2582,
    ),
    @tactics.all_tac,
  ])
  let t2579 = @tactics.subgoal_then(@term_syntax.parse_term("primefact((ps : List[Num]), (q : Num))"), fn(
    x2576 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2577 = @tactics.mp_tac(x2576)
    fn(
      x2578 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2577(x2578)
    }
  })
  let t2573 = @term_syntax.parse_term("(Q : Num)")
  let t2574 = @tactics.map_every(
    fn(
      x2570 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2571 = @tactics.exists_tac(x2570)
      fn(
        x2572 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2571(x2572)
      }
    },
    @list.List([@term_syntax.parse_term("0"), t2573]),
  )
  let t2569 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t2568 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t2567 = @simp.abbrev_tac(@term_syntax.parse_term("(Q : Num) == DIV(EXP((a : Num), (n : Num) - 1), n)"))
  let t2566 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)"))]),
  )
  let t2565 = @term_syntax.parse_term("(n : Num)")
  let t2575 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.mp_tac(
                    @bool.specl(
                      @list.List([@term_syntax.parse_term("EXP((a : Num), (n : Num) - 1)"), t2565]),
                      @arith.division(),
                    ),
                  ),
                  t2566,
                ),
                @tactics.strip_tac,
              ),
              t2567,
            ),
            t2568,
          ),
          t2569,
        ),
        t2574,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2564 = @simp.asm_rewrite_tac(@list.List([@arith.exp_2()]))
  let t2561 = @term_syntax.parse_term("(r : Num)")
  let t2562 = @term_syntax.parse_term("(q : Num)")
  let t2563 = @tactics.map_every(
    fn(
      x2558 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2559 = @tactics.exists_tac(x2558)
      fn(
        x2560 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2559(x2560)
      }
    },
    @list.List([@term_syntax.parse_term("(a : Num)"), t2562, t2561]),
  )
  let t2557 = @tactics.match_mp_tac(pocklington())
  let t2556 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2555 = @simp.simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(@arith.exp_exp()),
    ]),
  )
  let t2554 = @simp.simp_tac(
    @list.List([
      @arith.mod_exp_mod(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t2686 = @tactics.then_tac(
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
                                                                  @tactics.then_tac(
                                                                    @tactics.thenl(
                                                                      @tactics.then_tac(
                                                                        @tactics.then_tac(
                                                                          @tactics.then_tac(
                                                                            @tactics.then_tac(
                                                                              @tactics.then_tac(
                                                                                @tactics.then_tac(
                                                                                  @tactics.then_tac(
                                                                                    @tactics.disch_then(fn(
                                                                                        x2547 : @kernel.Thm,
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
                                                                                        let th = x2547
                                                                                        let t2553 = @tactics.mp_tac(
                                                                                          th,
                                                                                        )
                                                                                        @tactics.then_tac(
                                                                                          @tactics.disch_then(fn(
                                                                                              x2552 : @kernel.Thm,
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
                                                                                                x2549 : @kernel.Thm,
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
                                                                                                let s2550 = @tactics.subst1_tac(
                                                                                                  x2549,
                                                                                                )
                                                                                                fn(
                                                                                                  x2551 : (
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
                                                                                                  s2550(
                                                                                                    x2551,
                                                                                                  )
                                                                                                }
                                                                                              })(
                                                                                                @equal.sym(
                                                                                                  x2552,
                                                                                                ),
                                                                                              )
                                                                                            },
                                                                                          ),
                                                                                          t2553,
                                                                                        )
                                                                                      },
                                                                                    ),
                                                                                    t2554,
                                                                                  ),
                                                                                  t2555,
                                                                                ),
                                                                                t2556,
                                                                              ),
                                                                              t2557,
                                                                            ),
                                                                            t2563,
                                                                          ),
                                                                          t2564,
                                                                        ),
                                                                        @tactics.conj_tac,
                                                                      ),
                                                                      t2575,
                                                                    ),
                                                                    t2579,
                                                                  ),
                                                                  t2583,
                                                                ),
                                                                t2589,
                                                              ),
                                                              t2590,
                                                            ),
                                                            t2594,
                                                          ),
                                                          t2598,
                                                        ),
                                                        t2599,
                                                      ),
                                                      t2603,
                                                    ),
                                                    t2604,
                                                  ),
                                                  @tactics.disch_tac,
                                                ),
                                                t2605,
                                              ),
                                              t2609,
                                            ),
                                            t2610,
                                          ),
                                          t2614,
                                        ),
                                        t2626,
                                      ),
                                      t2627,
                                    ),
                                    t2628,
                                  ),
                                  t2629,
                                ),
                                t2630,
                              ),
                              t2631,
                            ),
                            t2632,
                          ),
                          t2636,
                        ),
                        t2648,
                      ),
                      t2649,
                    ),
                    t2653,
                  ),
                  t2662,
                ),
                t2674,
              ),
              t2675,
            ),
            t2681,
          ),
          t2682,
        ),
        t2683,
      ),
      t2684,
    ),
    t2685,
  )
  pocklington_primefact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("2 <= (n : Num) && (q : Num) * (r : Num) == n - 1 && n <= q * q → MOD(EXP((a : Num), r), n) == (b : Num) → ITLIST(op_star, (ps : List[Num]), 1) == q → MOD(EXP(b, q), n) == 1 → ALL((p : Num) => prime(p) && coprime((MOD(EXP(b, DIV(q, p)), n) - 1, n)), ps) → prime(n)"),
      t2686,
    ),
  )
}

///|
let pocklington_primefact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POCKLINGTON_PRIMEFACT",
)

///|
/// `POCKLINGTON_PRIMEFACT`
pub fn pocklington_primefact() -> @kernel.Thm {
  pocklington_primefact_c.get()
}

///|
/// `even_num`
pub fn even_num(x2687 : @num.Num) -> Bool raise {
  let n = x2687
  @num.eq_num(@num.mod_num(n, num_2()), num_0())
}

///|
/// odd_num
fn step_202() -> Unit raise {
  odd_num_c.set(fn(x2689 : @num.Num) -> Bool raise {
    (fn(x2688 : Bool) -> Bool raise { !x2688 })(even_num(x2689))
  })
}

///|
let odd_num_c : @lib.Cell[(@num.Num) -> Bool raise] = @lib.Cell::new("odd_num")

///|
/// `odd_num`
pub fn odd_num(x : @num.Num) -> Bool raise {
  odd_num_c.get()(x)
}

///|
/// log2
fn step_203() -> Unit raise {
  fn log2_1(x2690 : @num.Num, x2691 : @num.Num) -> @num.Num raise {
    let x = x2690
    let y = x2691
    if @num.lt_num(x, num_1()) {
      y
    } else {
      let t2692 = @num.add_num(y, num_1())
      log2_1(@num.quo_num(x, num_2()), t2692)
    }
  }
  log2_c.set(fn(x2693 : @num.Num) -> @num.Num raise {
    let x_1 = x2693
    log2_1(@num.sub_num(x_1, num_1()), num_0())
  })
}

///|
let log2_c : @lib.Cell[(@num.Num) -> @num.Num raise] = @lib.Cell::new("log2")

///|
/// `log2`
pub fn log2(x : @num.Num) -> @num.Num raise {
  log2_c.get()(x)
}

///|
/// `powermod`
pub fn powermod(
  x2694 : @num.Num,
  x2695 : @num.Num,
  x2696 : @num.Num,
) -> @num.Num raise {
  let x = x2694
  let m = x2695
  let n = x2696
  if @num.eq_num(m, num_0()) {
    num_1()
  } else {
    let y = powermod(x, @num.quo_num(m, num_2()), n)
    let z = @num.mod_num(@num.mult_num(y, y), n)
    if even_num(m) {
      z
    } else {
      @num.mod_num(@num.mult_num(x, z), n)
    }
  }
}

///|
/// factor
fn step_204() -> Unit raise {
  let suck_file : (String) -> String raise = fn(
    x2697 : String,
  ) -> String raise {
    let s = x2697
    let data = @lib.string_of_file(s)
    @lib.sys_remove(s)
    data
  }
  let extract_output : (String) -> @list.List[(@num.Num, @num.Num)] raise = fn(
    x2698 : String,
  ) -> @list.List[(@num.Num, @num.Num)] raise {
    let s_1 = x2698
    let l0 = @lib.explode(s_1)
    let l0_p = @lib.rev(l0)
    let l1 = @lib.chop_list(@lib.index("]", l0_p), l0_p).1
    let l2 = @lib.rev(@lib.chop_list(@lib.index("[", l1), l1).0).prepend("[")
    // GP prints the factorisation as a matrix `[p1, e1; p2, e2; ...]`: read
    // the numbers off in order and pair them up.
    let nums : Array[@num.Num] = []
    let mut digits = ""
    for c in @lib.implode(l2) {
      if c >= '0' && c <= '9' {
        digits = digits + c.to_string()
      } else if digits != "" {
        nums.push(@num.num_of_string(digits))
        digits = ""
      }
    }
    @list.List(Array::makei(nums.length() / 2, i => (nums[2 * i], nums[2 * i + 1])))
  }
  factor_c.set(fn(x2702 : @num.Num) -> @list.List[(@num.Num, @num.Num)] raise {
    let n = x2702
    if @num.eq_num(n, num_1()) {
      @list.List([])
    } else {
      let filename = @lib.temp_file("pocklington", ".out")
      let t2703 = "))  \n quit' | gp >" + (filename + " 2>/dev/null")
      let s_2 = "echo 'print(factorint(" + (@num.string_of_num(n) + t2703)
      if Int::to_int64(@lib.sys_command(s_2)) == 0L {
        let output = suck_file(filename)
        extract_output(output)
      } else {
        raise Failure("factor: Call to GP/PARI failed")
      }
    }
  })
}

///|
let factor_c : @lib.Cell[(@num.Num) -> @list.List[(@num.Num, @num.Num)] raise] = @lib.Cell::new(
  "factor",
)

///|
/// `factor`
pub fn factor(x : @num.Num) -> @list.List[(@num.Num, @num.Num)] raise {
  factor_c.get()(x)
}

///|
/// PARI_THRESHOLD
fn step_205() -> Unit raise {
  pari_threshold_c.set(@num.pow2(25))
}

///|
let pari_threshold_c : @lib.Cell[@num.Num] = @lib.Cell::new("PARI_THRESHOLD")

///|
/// `PARI_THRESHOLD`
pub fn pari_threshold() -> @num.Num {
  pari_threshold_c.get()
}

///|
/// multifactor
fn step_206() -> Unit raise {
  fn findfactor(x2704 : @num.Num, x2705 : @num.Num) -> @num.Num raise {
    let m = x2704
    let n = x2705
    if @num.eq_num(@num.mod_num(n, m), num_0()) {
      m
    } else if @num.gt_num(@num.mult_num(m, m), n) {
      n
    } else {
      findfactor(@num.add_num(m, num_1()), n)
    }
  }
  fn stupidfactor(x2706 : @num.Num) -> @list.List[@num.Num] raise {
    let n_1 = x2706
    let p = findfactor(num_2(), n_1)
    if @num.eq_num(p, n_1) {
      @list.List([n_1])
    } else {
      stupidfactor(@num.quo_num(n_1, p)).prepend(p)
    }
  }
  multifactor_c.set(fn(x2709 : @num.Num) -> @list.List[@num.Num] raise {
    let n_3 = x2709
    try {
      if @num.lt_num(n_3, pari_threshold()) {
        raise Failure("")
      } else {
        multilist_l(factor(n_3))
      }
    } catch {
      Failure(_) =>
        @lib.sort(
          fn(x2710 : @num.Num, x2711 : @num.Num) -> Bool raise {
            @num.lt_num(x2710, x2711)
          },
          stupidfactor(n_3),
        )
      e => raise e
    }
  })
}

///|
let multifactor_c : @lib.Cell[(@num.Num) -> @list.List[@num.Num] raise] = @lib.Cell::new(
  "multifactor",
)

///|
/// `multifactor`
pub fn multifactor(x : @num.Num) -> @list.List[@num.Num] raise {
  multifactor_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] multilist_l(
  x2707 : @list.List[(TA, @num.Num)],
) -> @list.List[TA] raise {
  let l = x2707
  if l == @list.List([]) {
    @list.List([])
  } else {
    let (x, n_2) = @lib.hd(l)
    let t2708 = multilist_l(@lib.tl(l))
    @lib.replicate(x, @lib.int63_to_int(@num.int63_of_num(n_2))).concat(t2708)
  }
}

///|
/// `certificate`
pub(all) enum Certificate {
  Prime_2
  Primroot_and_factors(
    (
      (@num.Num, @list.List[@num.Num]),
      @num.Num,
      @list.List[(@num.Num, Certificate)],
    )
  )
} derive(Eq, Debug)

///|
pub extend Certificate with Eq::{not_equal, equal}

///|
pub extend Certificate with Debug::{to_repr}

///|
pub extend Certificate with @lib.OCompare::{ocompare}

///|
pub extend Certificate with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Certificate(x : Certificate) -> Int {
  match x {
    Prime_2 => 0
    Primroot_and_factors(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Certificate with fn ocompare(self, other) {
  match (self, other) {
    (Primroot_and_factors(a0), Primroot_and_factors(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Certificate(self).compare(ocaml_rank_Certificate(other))
  }
}

///|
pub impl @lib.OHash for Certificate with fn ohash_visit(self, h) {
  match self {
    Prime_2 => h.int(0L)
    Primroot_and_factors(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// find_primitive_root
fn step_207() -> Unit raise {
  fn find_primitive_root_1(
    x2712 : @num.Num,
    x2713 : @num.Num,
    x2714 : @list.List[@num.Num],
    x2715 : @num.Num,
  ) -> @num.Num raise {
    let a = x2712
    let m = x2713
    let ms = x2714
    let n = x2715
    if @num.eq_num(@num.gcd_num(a, n), num_1()) &&
      @num.eq_num(powermod(a, m, n), num_1()) &&
      @lib.forall(
        fn(x2716 : @num.Num) -> Bool raise {
          let k = x2716
          @num.neq_num(powermod(a, k, n), num_1())
        },
        ms,
      ) {
      a
    } else {
      find_primitive_root_1(@num.add_num(a, num_1()), m, ms, n)
    }
  }
  let find_primitive_root_from_2 : (@num.Num) -> ((@list.List[@num.Num]) -> ((
    @num.Num,
  ) -> @num.Num raise) raise) raise = fn(
    x2720 : @num.Num,
  ) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
    fn(x2721 : @list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise {
      fn(x2722 : @num.Num) -> @num.Num raise {
        ((x2717 : @num.Num, x2718 : @list.List[@num.Num], x2719 : @num.Num) => {
          find_primitive_root_1(num_2(), x2717, x2718, x2719)
        })(x2720, x2721, x2722)
      }
    }
  }
  find_primitive_root_c.set(fn(
    x2723 : @num.Num,
  ) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
    let m_1 = x2723
    fn(x2724 : @list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise {
      let ms_1 = x2724
      fn(x2725 : @num.Num) -> @num.Num raise {
        let n_1 = x2725
        if @num.lt_num(n_1, num_2()) {
          raise Failure("find_primitive_root: input too small")
        } else {
          find_primitive_root_from_2(m_1)(ms_1)(n_1)
        }
      }
    }
  })
}

///|
let find_primitive_root_c : @lib.Cell[
  (@num.Num) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise,
] = @lib.Cell::new("find_primitive_root")

///|
/// `find_primitive_root`
pub fn find_primitive_root(
  x : @num.Num,
) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
  find_primitive_root_c.get()(x)
}

///|
/// uniq_num
fn step_208() -> Unit raise {
  fn uniq(
    x2726 : @num.Num,
    x2727 : @list.List[@num.Num],
  ) -> @list.List[@num.Num] raise {
    let x = x2726
    let l = x2727
    match l {
      Empty => raise @lib.Unchanged
      More(h, tail=t) =>
        if @num.eq_num(x, h) {
          uniq(x, t) catch {
            @lib.Unchanged => l
            e => raise e
          }
        } else {
          uniq(h, t).prepend(x)
        }
    }
  }
  uniq_num_c.set(fn(
    x2728 : @list.List[@num.Num],
  ) -> @list.List[@num.Num] raise {
    let l_1 = x2728
    if l_1 == @list.List([]) {
      @list.List([])
    } else {
      let t2729 = @lib.tl(l_1)
      uniq(@lib.hd(l_1), t2729)
    }
  })
}

///|
let uniq_num_c : @lib.Cell[(@list.List[@num.Num]) -> @list.List[@num.Num] raise] = @lib.Cell::new(
  "uniq_num",
)

///|
/// `uniq_num`
pub fn uniq_num(x : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
  uniq_num_c.get()(x)
}

///|
/// `setify_num`
pub fn setify_num(x2730 : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
  let s = x2730
  let s_p = @lib.sort(
    fn(x2731 : @num.Num, x2732 : @num.Num) -> Bool raise {
      @num.le_num(x2731, x2732)
    },
    s,
  )
  uniq_num(s_p) catch {
    @lib.Unchanged => s_p
    e => raise e
  }
}

///|
/// `general_certify_prime`
pub fn general_certify_prime(
  x2733 : (@num.Num) -> @list.List[@num.Num] raise,
) -> ((@num.Num) -> Certificate raise) raise {
  let factorizer = x2733
  fn cert_prime(x2735 : @num.Num) -> Certificate raise {
    let n = x2735
    if @num.le_num(n, num_2()) {
      if @num.eq_num(n, num_2()) {
        Certificate::Prime_2
      } else {
        raise Failure("certify_prime: not a prime!")
      }
    } else {
      let m = @num.sub_num(n, num_1())
      let pfact = factorizer(m)
      let primes = setify_num(pfact)
      let ms = @lib.map(
        fn(x2736 : @num.Num) -> @num.Num raise {
          let d = x2736
          @num.div_num(m, d)
        },
        primes,
      )
      let a = find_primitive_root(m)(ms)(n)
      Certificate::Primroot_and_factors(
        (
          (n, pfact),
          a,
          @lib.map(
            fn(x2737 : @num.Num) -> (@num.Num, Certificate) raise {
              let n_1 = x2737
              (n_1, cert_prime(n_1))
            },
            primes,
          ),
        ),
      )
    }
  }
  fn(x2738 : @num.Num) -> Certificate raise {
    let n_2 = x2738
    if Int::to_int64(@lib.length(factorizer(n_2))) == 1L {
      cert_prime(n_2)
    } else {
      raise Failure("guided_certify_prime: input is not a prime")
    }
  }
}

///|
/// certify_prime
fn step_209() -> Unit raise {
  certify_prime_c.set(general_certify_prime(multifactor))
}

///|
let certify_prime_c : @lib.Cell[(@num.Num) -> Certificate raise] = @lib.Cell::new(
  "certify_prime",
)

///|
/// `certify_prime`
pub fn certify_prime(x : @num.Num) -> Certificate raise {
  certify_prime_c.get()(x)
}

///|
/// prime_theorem_cache
fn step_210() -> Unit raise {
  prime_theorem_cache_c.set(Ref::{ val: @list.List([]), })
}

///|
let prime_theorem_cache_c : @lib.Cell[Ref[@list.List[(@num.Num, @kernel.Thm)]]] = @lib.Cell::new(
  "prime_theorem_cache",
)

///|
/// `prime_theorem_cache`
pub fn prime_theorem_cache() -> Ref[@list.List[(@num.Num, @kernel.Thm)]] {
  prime_theorem_cache_c.get()
}

///|
/// `lookup_under_num`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] lookup_under_num(
  x2739 : @num.Num,
  x2740 : @list.List[(@num.Num, TA)],
) -> TA raise {
  let n = x2739
  let l = x2740
  if l == @list.List([]) {
    raise Failure("lookup_under_num")
  } else {
    let h = @lib.hd(l)
    if @num.eq_num(h.0, n) {
      h.1
    } else {
      lookup_under_num(n, @lib.tl(l))
    }
  }
}

///|
/// `split_factors`
pub fn split_factors(
  x2741 : @num.Num,
  x2742 : @list.List[@num.Num],
  x2743 : @list.List[@num.Num],
  x2744 : @num.Num,
) -> (@list.List[@num.Num], @list.List[@num.Num]) raise {
  let q = x2741
  let qs = x2742
  let ps = x2743
  let n = x2744
  if @num.ge_num(@num.mult_num(q, q), n) {
    (@lib.rev(qs), ps)
  } else {
    let t2745 = @lib.tl(ps)
    let t2746 = qs.prepend(@lib.hd(ps))
    split_factors(@num.mult_num(q, @lib.hd(ps)), t2746, t2745, n)
  }
}

///|
/// check_certificate
fn step_211() -> Unit raise {
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let a_tm = @term_syntax.parse_term("(a : Num)")
  let q_tm = @term_syntax.parse_term("(q : Num)")
  let r_tm = @term_syntax.parse_term("(r : Num)")
  let b_tm = @term_syntax.parse_term("(b : Num)")
  let ps_tm = @term_syntax.parse_term("(ps : List[Num])")
  let conv_itlist : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x2747 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2748 = @equal.top_depth_conv(x2747)
        fn(x2749 : @kernel.Term) -> @kernel.Thm raise { s2748(x2749) }
      },
      @list.List([@lists.itlist()]),
    ),
    @calc_num.num_reduce_conv,
  )
  let t2756 = @simp.gen_rewrite_conv(
    fn(
      x2753 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2754 = @equal.depth_conv(x2753)
      fn(x2755 : @kernel.Term) -> @kernel.Thm raise { s2754(x2755) }
    },
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) && a && (b : Bool)) == (a && b) && (a && a) == a"),
      ),
    ]),
  )
  let conv_all : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x2750 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2751 = @equal.top_depth_conv(x2750)
        fn(x2752 : @kernel.Term) -> @kernel.Thm raise { s2751(x2752) }
      },
      @list.List([
        @lists.all(),
        @theorems.beta_thm(),
        @class.taut(@term_syntax.parse_term("((a : Bool) && true) == a")),
      ]),
    ),
    t2756,
  )
  let t2765 = @simp.rewr_conv(@class.taut(@term_syntax.parse_term("(true && (p : Bool)) == p")))
  let t2766 = (@term_syntax.parse_term("true && (p : Bool)"), t2765)
  let t2764 = @simp.rewr_conv(@class.taut(@term_syntax.parse_term("((p : Bool) && true) == p")))
  let t2767 = (@term_syntax.parse_term("(p : Bool) && true"), t2764)
  let t2768 = (@term_syntax.parse_term("coprime(((a : Num), (b : Num)))"), @prime.coprime_conv)
  let t2769 = (@term_syntax.parse_term("MOD(EXP((a : Num), (b : Num)), (c : Num))"), @calc_num.exp_mod_conv)
  let t2770 = (@term_syntax.parse_term("DIV((a : Num), (b : Num))"), @calc_num.num_div_conv)
  let gconv_net = @lib.itlist(
    fn(
      x2761 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x2762 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s2763 = ((x2760 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x2757 : @kernel.Term,
            x2758 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x2759 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x2757, x2758, x2759)
            }
          },
          x2760,
        )
      })(x2761)
      s2763(x2762)
    },
    @list.List([
      (@term_syntax.parse_term("(a : Num) - (b : Num)"), @calc_num.num_sub_conv),
      t2770,
      t2769,
      t2768,
      t2767,
      t2766,
    ]),
    @nets.empty_net(),
  )
  let subarith_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.depth_conv(
    @simp.rewrites_conv(gconv_net),
  )
  fn check_certificate_1(x2771 : Certificate) -> @kernel.Thm raise {
    let cert = x2771
    match cert {
      Certificate::Prime_2 => @prime.prime_2()
      Certificate::Primroot_and_factors(((n, ps), a, ncerts)) =>
        lookup_under_num(n, prime_theorem_cache().val) catch {
          Failure(_) => {
            let (qs, rs) = split_factors(
              num_1(),
              @list.List([]),
              @lib.rev(ps),
              n,
            )
            let q = @lib.itlist(
              fn(x2772 : @num.Num, x2773 : @num.Num) -> @num.Num raise {
                @num.mult_num(x2772, x2773)
              },
              qs,
              num_1(),
            )
            let r = @lib.itlist(
              fn(x2774 : @num.Num, x2775 : @num.Num) -> @num.Num raise {
                @num.mult_num(x2774, x2775)
              },
              rs,
              num_1(),
            )
            let t2776 = (@nums.mk_numeral(a), a_tm)
            let t2777 = (@nums.mk_numeral(r), r_tm)
            let t2778 = (@nums.mk_numeral(q), q_tm)
            let t2779 = (@lists.mk_flist(@lib.map(@nums.mk_numeral, qs)), ps_tm)
            let th1 = @kernel.inst_rule(
              @list.List([
                (@nums.mk_numeral(n), n_tm),
                t2779,
                t2778,
                t2777,
                t2776,
              ]),
              pocklington_primefact(),
            )
            let th2 = @bool.mp(
              th1,
              @bool.eqt_elim(
                @calc_num.num_reduce_conv(@equal.lhand(@kernel.concl(th1))),
              ),
            )
            let tha = @calc_num.exp_mod_conv(
              @equal.lhand(@equal.lhand(@kernel.concl(th2))),
            )
            let thb = @bool.mp(
              @kernel.inst_rule(
                @list.List([(@kernel.rand(@kernel.concl(tha)), b_tm)]),
                th2,
              ),
              tha,
            )
            let th3 = @bool.mp(
              thb,
              @bool.eqt_elim(conv_itlist(@equal.lhand(@kernel.concl(thb)))),
            )
            let th4 = @bool.mp(
              th3,
              @calc_num.exp_mod_conv(
                @equal.lhand(@equal.lhand(@kernel.concl(th3))),
              ),
            )
            let th5 = conv_all(@equal.lhand(@kernel.concl(th4)))
            let th6 = @kernel.trans(
              th5,
              subarith_conv(@kernel.rand(@kernel.concl(th5))),
            )
            let th7 = @bool.imp_trans(@bool.eq_imp_rule(th6).1, th4)
            let ants = @basics.conjuncts(@equal.lhand(@kernel.concl(th7)))
            let certs = @lib.map(
              fn(x2780 : @kernel.Term) -> Certificate raise {
                let t = x2780
                lookup_under_num(@basics.dest_numeral(@kernel.rand(t)), ncerts)
              },
              ants,
            )
            let ths = @lib.map(check_certificate_1, certs)
            let fth = @bool.mp(th7, @lib.end_itlist(@bool.conj, ths))
            {
              prime_theorem_cache().val = prime_theorem_cache().val.prepend(
                (n, fth),
              )
              ()
            }
            fth
          }
          e => raise e
        }
    }
  }
  check_certificate_c.set(check_certificate_1)
}

///|
let check_certificate_c : @lib.Cell[(Certificate) -> @kernel.Thm raise] = @lib.Cell::new(
  "check_certificate",
)

///|
/// `check_certificate`
pub fn check_certificate(x : Certificate) -> @kernel.Thm raise {
  check_certificate_c.get()(x)
}

///|
/// PROVE_PRIME
fn step_212() -> Unit raise {
  prove_prime_c.set(fn(x2781 : @num.Num) -> @kernel.Thm raise {
    check_certificate(certify_prime(x2781))
  })
}

///|
let prove_prime_c : @lib.Cell[(@num.Num) -> @kernel.Thm raise] = @lib.Cell::new(
  "PROVE_PRIME",
)

///|
/// `PROVE_PRIME`
pub fn prove_prime(x : @num.Num) -> @kernel.Thm raise {
  prove_prime_c.get()(x)
}

///|
/// PROVE_PRIMEFACT
fn step_213() -> Unit raise {
  let pth = @bool.spec_all(primefact_variant())
  let start_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.pure_rewrite_conv(@list.List([@lists.itlist(), @lists.all()])),
    @calc_num.num_reduce_conv,
  )
  let ps_tm = @term_syntax.parse_term("(ps : List[Num])")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  prove_primefact_c.set(fn(x2782 : @num.Num) -> @kernel.Thm raise {
    let n = x2782
    let pfact = multifactor(n)
    let t2783 = (@nums.mk_numeral(n), n_tm)
    let th1 = @kernel.inst_rule(
      @list.List([
        (@lists.mk_flist(@lib.map(@nums.mk_numeral, pfact)), ps_tm),
        t2783,
      ]),
      pth,
    )
    let th2 = @kernel.trans(th1, start_conv(@kernel.rand(@kernel.concl(th1))))
    let ths = @lib.map(prove_prime, pfact)
    let t2784 = @lib.end_itlist(@bool.conj, ths)
    @kernel.eq_mp(@equal.sym(th2), t2784)
  })
}

///|
let prove_primefact_c : @lib.Cell[(@num.Num) -> @kernel.Thm raise] = @lib.Cell::new(
  "PROVE_PRIMEFACT",
)

///|
/// `PROVE_PRIMEFACT`
pub fn prove_primefact(x : @num.Num) -> @kernel.Thm raise {
  prove_primefact_c.get()(x)
}

///|
/// PRIME_TEST
fn step_214() -> Unit raise {
  let t2785 = @meson.meson_tac(@list.List([@int.prime(), @int.divides()]))
  let not_prime_thm = @tactics.prove(
    @term_syntax.parse_term("((m : Num) == 1) == false → (m == (p : Num)) == false → m * (n : Num) == p → prime(p) == false"),
    t2785,
  )
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let p_tm = @term_syntax.parse_term("(p : Num)")
  prime_test_c.set(fn(x2786 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2786
    let p = @basics.dest_numeral(tm)
    if @num.eq_num(p, num_0()) {
      @bool.eqf_intro(@prime.prime_0())
    } else if @num.eq_num(p, num_1()) {
      @bool.eqf_intro(@prime.prime_1())
    } else {
      let pfact = multifactor(p)
      if Int::to_int64(@lib.length(pfact)) == 1L {
        @lib.remark("proving that " + (@num.string_of_num(p) + " is prime"))
        @bool.eqt_intro(prove_prime(p))
      } else {
        @lib.remark("proving that " + (@num.string_of_num(p) + " is composite"))
        let m = @lib.hd(pfact)
        let n = @lib.end_itlist(
          fn(x2787 : @num.Num, x2788 : @num.Num) -> @num.Num raise {
            @num.mult_num(x2787, x2788)
          },
          @lib.tl(pfact),
        )
        let t2789 = (@nums.mk_numeral(p), p_tm)
        let t2790 = (@nums.mk_numeral(n), n_tm)
        let th0 = @kernel.inst_rule(
          @list.List([(@nums.mk_numeral(m), m_tm), t2790, t2789]),
          not_prime_thm,
        )
        let th1 = @bool.mp(
          th0,
          @calc_num.num_eq_conv(@equal.lhand(@equal.lhand(@kernel.concl(th0)))),
        )
        let th2 = @bool.mp(
          th1,
          @calc_num.num_eq_conv(@equal.lhand(@equal.lhand(@kernel.concl(th1)))),
        )
        @bool.mp(
          th2,
          @calc_num.num_mult_conv(
            @equal.lhand(@equal.lhand(@kernel.concl(th2))),
          ),
        )
      }
    }
  })
}

///|
let prime_test_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "PRIME_TEST",
)

///|
/// `PRIME_TEST`
pub fn prime_test(x : @kernel.Term) -> @kernel.Thm raise {
  prime_test_c.get()(x)
}

///|
/// PRIME_CONV
fn step_215() -> Unit raise {
  let prime_tm = @term_syntax.parse_term("prime")
  prime_conv_c.set(fn(x2791 : @kernel.Term) -> @kernel.Thm raise {
    let tm0 = x2791
    let (ptm, tm) = @kernel.dest_comb(tm0)
    if ptm != prime_tm {
      raise Failure("expected term of form prime(n)")
    } else {
      prime_test(tm)
    }
  })
}

///|
let prime_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "PRIME_CONV",
)

///|
/// `PRIME_CONV`
pub fn prime_conv(x : @kernel.Term) -> @kernel.Thm raise {
  prime_conv_c.get()(x)
}

///|
/// extract_primes_from_certificate
fn step_216() -> Unit raise {
  fn extr(
    x2792 : Certificate,
    x2793 : @list.List[@num.Num],
  ) -> @list.List[@num.Num] raise {
    let cert = x2792
    let acc = x2793
    match cert {
      Certificate::Prime_2 => acc.prepend(num_2())
      Certificate::Primroot_and_factors(((p, _), _, l)) =>
        @lib.itlist(
          fn(
            x2794 : (@num.Num, Certificate),
            x2795 : @list.List[@num.Num],
          ) -> @list.List[@num.Num] raise {
            let (q, d) = x2794
            let a = x2795
            extr(d, a.prepend(q))
          },
          l,
          acc.prepend(p),
        )
    }
  }
  extract_primes_from_certificate_c.set(fn(
    x2796 : @num.Num,
  ) -> @list.List[String] raise {
    let n = x2796
    @lib.uniq(
      @lib.map(
        fn(x2797 : @num.Num) -> String raise { @num.string_of_num(x2797) },
        @lib.sort(
          fn(x2798 : @num.Num, x2799 : @num.Num) -> Bool raise {
            @num.lt_num(x2798, x2799)
          },
          extr(certify_prime(n), @list.List([])),
        ),
      ),
    )
  })
}

///|
let extract_primes_from_certificate_c : @lib.Cell[
  (@num.Num) -> @list.List[String] raise,
] = @lib.Cell::new("extract_primes_from_certificate")

///|
/// `extract_primes_from_certificate`
pub fn extract_primes_from_certificate(
  x : @num.Num,
) -> @list.List[String] raise {
  extract_primes_from_certificate_c.get()(x)
}

///|
/// `guided_certify_prime`
pub fn guided_certify_prime(
  x2800 : @list.List[@num.Num],
) -> ((@num.Num) -> Certificate raise) raise {
  let hints = x2800
  fn guidedfactor(x2802 : @num.Num) -> @list.List[@num.Num] raise {
    let n = x2802
    if @lib.exists(
        fn(x2803 : @num.Num) -> Bool raise {
          let p = x2803
          @num.eq_num(p, n)
        },
        hints,
      ) {
      @list.List([n])
    } else {
      let p_2 = @lib.find(
        fn(x2804 : @num.Num) -> Bool raise {
          let p_1 = x2804
          @num.eq_num(@num.mod_num(n, p_1), num_0())
        },
        hints,
      )
      guidedfactor(@num.quo_num(n, p_2)).prepend(p_2)
    }
  }
  general_certify_prime(guidedfactor)
}

///|
/// `GUIDED_PROVE_PRIME`
pub fn guided_prove_prime(
  x2805 : @list.List[@num.Num],
) -> ((@num.Num) -> @kernel.Thm raise) raise {
  let hints = x2805
  let t2807 = guided_certify_prime(hints)
  fn(x2808 : @num.Num) -> @kernel.Thm raise { check_certificate(t2807(x2808)) }
}

///|
/// PRIME_RULE
fn step_217() -> Unit raise {
  let prime_tm = @term_syntax.parse_term("prime")
  prime_rule_c.set(fn(
    x2809 : @list.List[String],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let hints = x2809
    fn(x2810 : @kernel.Term) -> @kernel.Thm raise {
      let tm0 = x2810
      let (ptm, tm) = @kernel.dest_comb(tm0)
      if ptm != prime_tm {
        raise Failure("expected term of form prime(n)")
      } else {
        let n = @basics.dest_numeral(tm)
        guided_prove_prime(
          @lib.map(@num.num_of_string, hints).concat(@list.List([n])),
        )(n)
      }
    }
  })
}

///|
let prime_rule_c : @lib.Cell[
  (@list.List[String]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("PRIME_RULE")

///|
/// `PRIME_RULE`
pub fn prime_rule(
  x : @list.List[String],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  prime_rule_c.get()(x)
}

///|
/// Library/pocklington.ml:2606
fn step_218() -> Unit raise {
  ignore(
    @lib.map(
      fn(x2812 : Int64) -> @kernel.Thm raise {
        ((x2811 : @kernel.Term) => @lib.time(prime_test, x2811))(
          @nums.mk_small_numeral(x2812),
        )
      },
      @lib.range(0L, 50L),
    ),
  )
}

///|
/// Library/pocklington.ml:2608
fn step_219() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65535")))
}

///|
/// Library/pocklington.ml:2610
fn step_220() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65536")))
}

///|
/// Library/pocklington.ml:2612
fn step_221() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65537")))
}

///|
/// Library/pocklington.ml:2614
fn step_222() -> Unit raise {
  ignore(@lib.time(prove_primefact, @num.num_of_int64(222L)))
}

///|
/// Library/pocklington.ml:2616
fn step_223() -> Unit raise {
  ignore(@lib.time(prove_primefact, @num.num_of_int64(151L)))
}

///|
/// Library/pocklington.ml:2622
fn step_224() -> Unit raise {
  ignore(
    @lib.map(
      fn(x2814 : Int64) -> @kernel.Thm raise {
        ((x2813 : @kernel.Term) => @lib.time(prime_test, x2813))(
          @nums.mk_small_numeral(x2814),
        )
      },
      @list.List([
        3L, 5L, 7L, 13L, 23L, 43L, 83L, 163L, 317L, 631L, 1259L, 2503L, 4001L,
      ]),
    ),
  )
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
}
