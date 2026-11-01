// Translated from upstream Library/binomial.ml; edit this file directly.

///|
/// binom
fn step_1() -> Unit raise {
  binom_c.set(
    @define.define_(
      @term_syntax.parse_term("(∀ n : Num, (binom : ((Num, Num)) -> Num)((n, 0)) == 1) && (∀ k : Num, binom((0, SUC(k))) == 0) && (∀ n : Num, ∀ k : Num, binom((SUC(n), SUC(k))) == binom((n, SUC(k))) + binom((n, k)))"),
    ),
  )
}

///|
let binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("binom")

///|
/// `binom`
pub fn binom() -> @kernel.Thm {
  binom_c.get()
}

///|
/// BINOM_0
fn step_2() -> Unit raise {
  let t1 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.rewrite_tac(@list.List([binom(), @nums.not_suc()])),
  )
  binom_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, binom((0, n)) == (if n == 0 { 1 } else { 0 })"),
      t1,
    ),
  )
}

///|
let binom_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_0")

///|
/// `BINOM_0`
pub fn binom_0() -> @kernel.Thm {
  binom_0_c.get()
}

///|
/// BINOM_LT
fn step_3() -> Unit raise {
  let t3 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(n : Num) < (k : Num) → n < SUC(k)")),
      @calc_num.arith(),
    ]),
  )
  let t2 = @simp.rewrite_tac(
    @list.List([binom(), @calc_num.arith(), @arith.lt_suc(), @arith.lt()]),
  )
  let t4 = @tactics.then_tac(
    @tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @nums.induct_tac), t2),
    t3,
  )
  binom_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, n < k → binom((n, k)) == 0"), t4),
  )
}

///|
let binom_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_LT")

///|
/// `BINOM_LT`
pub fn binom_lt() -> @kernel.Thm {
  binom_lt_c.get()
}

///|
/// BINOM_REFL
fn step_4() -> Unit raise {
  let t5 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_simp_tac(
      @list.List([binom(), binom_lt(), @arith.lt(), @calc_num.arith()]),
    ),
  )
  binom_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, binom((n, n)) == 1"), t5))
}

///|
let binom_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_REFL")

///|
/// `BINOM_REFL`
pub fn binom_refl() -> @kernel.Thm {
  binom_refl_c.get()
}

///|
/// BINOM_1
fn step_5() -> Unit raise {
  let t6 = @simp.asm_rewrite_tac(@list.List([binom()]))
  let t7 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))]),
        ),
        @nums.induct_tac,
      ),
      t6,
    ),
    @int.arith_tac,
  )
  binom_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, binom((n, 1)) == n"), t7))
}

///|
let binom_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_1")

///|
/// `BINOM_1`
pub fn binom_1() -> @kernel.Thm {
  binom_1_c.get()
}

///|
/// BINOM_FACT
fn step_6() -> Unit raise {
  let t21 = @tactics.conv_tac(@grobner.num_ring)
  let t20 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.fact(), binom()]),
  )
  let t19 = @tactics.pop_assum(fn(
    x16 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s17 = @tactics.mp_tac(x16)
    fn(
      x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s17(x18)
    }
  })
  let t12 = @term_syntax.parse_term("SUC((k : Num))")
  let t15 = @tactics.first_x_assum(fn(
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
    (fn(
      x9 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s10 = @tactics.mp_tac(x9)
      fn(
        x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s10(x11)
      }
    })(((x13 : @kernel.Thm) => @bool.spec(t12, x13))(x14))
  })
  let t8 = @simp.rewrite_tac(
    @list.List([
      @arith.add_clauses(),
      @arith.fact(),
      @arith.mult_clauses(),
      binom(),
    ]),
  )
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.rewrite_tac(
                  @list.List([
                    @arith.fact(),
                    @arith.add_clauses(),
                    @arith.mult_clauses(),
                    binom_refl(),
                  ]),
                ),
              ),
              @nums.induct_tac,
            ),
            t8,
          ),
          t15,
        ),
        t19,
      ),
      t20,
    ),
    t21,
  )
  binom_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, FACT(n) * (FACT(k) * binom((n + k, k))) == FACT(n + k)"),
      t22,
    ),
  )
}

///|
let binom_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_FACT")

///|
/// `BINOM_FACT`
pub fn binom_fact() -> @kernel.Thm {
  binom_fact_c.get()
}

///|
/// BINOM_EQ_0
fn step_7() -> Unit raise {
  let t33 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@arith.lt_nz()),
      @arith.mult_clauses(),
      @arith.fact_lt(),
    ]),
  )
  let t31 = @term_syntax.parse_term("(k : Num)")
  let t32 = @tactics.mp_tac(
    @equal.sym(
      @bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t31]), binom_fact()),
    ),
  )
  let t30 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
    }),
  )
  let t26 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t25 = @simp.rewrite_tac(@list.List([@arith.not_lt(), @arith.le_exists()]))
  let t24 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t23 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([binom_lt()])),
  ])
  let t34 = @tactics.then_tac(
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
                  t23,
                ),
                t24,
              ),
              t25,
            ),
            t26,
          ),
          t30,
        ),
        @tactics.disch_tac,
      ),
      t32,
    ),
    t33,
  )
  binom_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, (binom((n, k)) == 0) == (n < k)"), t34),
  )
}

///|
let binom_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_EQ_0")

///|
/// `BINOM_EQ_0`
pub fn binom_eq_0() -> @kernel.Thm {
  binom_eq_0_c.get()
}

///|
/// BINOM_PENULT
fn step_8() -> Unit raise {
  let t39 = @simp.rewrite_tac(
    @list.List([@arith.add(), @arith.add_0(), @arith.add_suc(), @nums.suc_inj()]),
  )
  let t40 = @list.List([
    @simp.rewrite_tac(@list.List([binom_eq_0(), @arith.lt()])),
    t39,
  ])
  let t38 = @tactics.subgoal_then(@term_syntax.parse_term("binom(((n : Num), SUC(n))) == 0"), fn(
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
    let s36 = @tactics.subst1_tac(x35)
    fn(
      x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s36(x37)
    }
  })
  let t41 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @nums.induct_tac,
        @simp.asm_rewrite_tac(@list.List([binom(), @arith.one(), binom_refl()])),
      ),
      t38,
    ),
    t40,
  )
  binom_penult_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, binom((SUC(n), n)) == SUC(n)"), t41),
  )
}

///|
let binom_penult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_PENULT")

///|
/// `BINOM_PENULT`
pub fn binom_penult() -> @kernel.Thm {
  binom_penult_c.get()
}

///|
/// BINOM_GE_TOP
fn step_9() -> Unit raise {
  let t55 = @simp.rewrite_tac(@list.List([binom_eq_0()]))
  let t54 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((c : Num) == 0) → (n : Num) <= (b : Num) → n + 1 <= c + b"),
    ),
  )
  let t50 = @term_syntax.parse_term("(n : Num)")
  let t53 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s48 = @tactics.mp_tac(x47)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x51 : @kernel.Thm) => @bool.spec(t50, x51))(x52))
  })
  let t46 = @simp.rewrite_tac(@list.List([@arith.add1(), @arith.le_refl()]))
  let t45 = @simp.asm_simp_tac(
    @list.List([binom_1(), @calc_num.arith_suc(), binom()]),
  )
  let t44 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t43 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t42 = @simp.rewrite_tac(@list.List([binom()]))
  let t56 = @tactics.then_tac(
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
                          @tactics.then_tac(@nums.induct_tac, @nums.induct_tac),
                          t42,
                        ),
                        t43,
                      ),
                      @tactics.strip_tac,
                    ),
                    t44,
                  ),
                  t45,
                ),
                t46,
              ),
              t53,
            ),
            @tactics.ants_tac,
          ),
          @list.List([@int.asm_arith_tac, @tactics.all_tac]),
        ),
        t54,
      ),
      t55,
    ),
    @int.asm_arith_tac,
  )
  binom_ge_top_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, 1 <= m && m < n → n <= binom((n, m))"),
      t56,
    ),
  )
}

///|
let binom_ge_top_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_GE_TOP")

///|
/// `BINOM_GE_TOP`
pub fn binom_ge_top() -> @kernel.Thm {
  binom_ge_top_c.get()
}

///|
/// BINOM_TOP_STEP
fn step_10() -> Unit raise {
  let t83 = @tactics.conv_tac(@grobner.num_ring)
  let t82 = @simp.rewrite_tac(@list.List([@arith.lt_nz()]))
  let t80 = @term_syntax.parse_term("(k : Num)")
  let t81 = @tactics.map_every(
    fn(
      x78 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x78
      @tactics.mp_tac(@bool.spec(t, @arith.fact_lt()))
    },
    @list.List([@term_syntax.parse_term("(d : Num)"), t80]),
  )
  let t77 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add1()),
      @arith.add_clauses(),
      @arith.fact(),
      @arith.add_ac(),
    ]),
  )
  let t75 = @term_syntax.parse_term("(k : Num)")
  let t76 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t75]), binom_fact()),
  )
  let t73 = @term_syntax.parse_term("(k : Num)")
  let t74 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(d : Num) + 1"), t73]), binom_fact()),
  )
  let t72 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add_assoc()),
      @arith.add_sub(),
      @arith.add_sub2(),
    ]),
  )
  let t71 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x68 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s69 = @tactics.subst1_tac(x68)
      fn(
        x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s69(x70)
      }
    }),
  )
  let t65 = @simp.rewrite_rule(
    @list.List([@arith.not_lt(), @arith.le_exists()]),
  )
  let t67 = @tactics.first_x_assum(fn(
    x66 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(t65(x66))
  })
  let t60 = @simp.asm_simp_tac(
    @list.List([binom_lt(), @arith.sub_refl(), @arith.mult_clauses()]),
  )
  let t58 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(n : Num) < (k : Num) → n + 1 == k || n + 1 < k")),
  )
  let t61 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x59 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.disj_cases_tac(t58(x59))
      }),
      t60,
    ),
    @tactics.all_tac,
  ])
  let t57 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < (k : Num)"))
  let t84 = @tactics.then_tac(
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
                        t57,
                      ),
                      t61,
                    ),
                    t67,
                  ),
                  t71,
                ),
                t72,
              ),
              t74,
            ),
            t76,
          ),
          t77,
        ),
        t81,
      ),
      t82,
    ),
    t83,
  )
  binom_top_step_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (n + 1 - k) * binom((n + 1, k)) == (n + 1) * binom((n, k))"),
      t84,
    ),
  )
}

///|
let binom_top_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_TOP_STEP")

///|
/// `BINOM_TOP_STEP`
pub fn binom_top_step() -> @kernel.Thm {
  binom_top_step_c.get()
}

///|
/// BINOM_BOTTOM_STEP
fn step_11() -> Unit raise {
  let t111 = @tactics.conv_tac(@grobner.num_ring)
  let t110 = @simp.rewrite_tac(@list.List([@arith.lt_nz()]))
  let t108 = @term_syntax.parse_term("(k : Num)")
  let t109 = @tactics.map_every(
    fn(
      x106 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x106
      @tactics.mp_tac(@bool.spec(t, @arith.fact_lt()))
    },
    @list.List([@term_syntax.parse_term("(d : Num)"), t108]),
  )
  let t105 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add1()),
      @arith.add_clauses(),
      @arith.fact(),
      @arith.add_ac(),
    ]),
  )
  let t103 = @term_syntax.parse_term("(k : Num) + 1")
  let t104 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t103]), binom_fact()),
  )
  let t101 = @term_syntax.parse_term("(k : Num)")
  let t102 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(d : Num) + 1"), t101]), binom_fact()),
  )
  let t100 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add_assoc()),
      @arith.add_sub(),
      @arith.add_sub2(),
    ]),
  )
  let t99 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x96 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s97 = @tactics.subst1_tac(x96)
      fn(
        x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s97(x98)
      }
    }),
  )
  let t93 = @simp.rewrite_rule(
    @list.List([@arith.not_lt(), @arith.le_exists()]),
  )
  let t95 = @tactics.first_x_assum(fn(
    x94 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s91 = @tactics.mp_tac(x90)
      fn(
        x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s91(x92)
      }
    })(t93(x94))
  })
  let t88 = @simp.asm_simp_tac(
    @list.List([binom_lt(), @arith.sub_refl(), @arith.mult_clauses()]),
  )
  let t86 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(n : Num) < (k : Num) + 1 → n == k || n < k")),
  )
  let t89 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x87 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.disj_cases_tac(t86(x87))
      }),
      t88,
    ),
    @tactics.all_tac,
  ])
  let t85 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < (k : Num) + 1"))
  let t112 = @tactics.then_tac(
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
                        t85,
                      ),
                      t89,
                    ),
                    t95,
                  ),
                  t99,
                ),
                t100,
              ),
              t102,
            ),
            t104,
          ),
          t105,
        ),
        t109,
      ),
      t110,
    ),
    t111,
  )
  binom_bottom_step_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (k + 1) * binom((n, k + 1)) == (n - k) * binom((n, k))"),
      t112,
    ),
  )
}

///|
let binom_bottom_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_BOTTOM_STEP",
)

///|
/// `BINOM_BOTTOM_STEP`
pub fn binom_bottom_step() -> @kernel.Thm {
  binom_bottom_step_c.get()
}

///|
/// HAS_SIZE_RESTRICTED_POWERSET
fn step_12() -> Unit raise {
  let t114 = @meson.asm_meson_tac(@list.List([]))
  let t113 = @tactics.repeat_tac(@nums.induct_tac)
  let t115 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
      t113,
    ),
    t114,
  )
  let binom_induct = @tactics.prove(
    @term_syntax.parse_term("∀ P : (Num, Num) -> Bool, (∀ n : Num, P(n, 0)) && (∀ k : Num, P(0, SUC(k))) && (∀ n : Num, ∀ k : Num, P(n, SUC(k)) && P(n, k) → P(SUC(n), SUC(k))) → (∀ m : Num, ∀ n : Num, P(m, n))"),
    t115,
  )
  let t122 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t121 = @tactics.mp_tac(@nums.suc_inj())
  let t120 = @simp.simp_tac(@list.List([@sets.card_clauses()]))
  let t119 = @simp.once_rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == !(p && q → !r)")),
    ]),
  )
  let t118 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), @sets.finite_insert()]),
  )
  let t117 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.set_rule(
        @term_syntax.parse_term("{(y : _) | IN(y, UNION((t : (_) -> Bool), IMAGE((f : (_) -> _), (s : (_) -> Bool)))) && (P : (_) -> Bool)(y)} == UNION({(y : _) | IN(y, t) && P(y)}, IMAGE(f, {(x : _) | IN(x, s) && P(f(x))}))"),
      ),
    ]),
  )
  let t116 = @tactics.repeat_tac(@tactics.strip_tac)
  let t123 = @tactics.then_tac(
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
                        @simp.rewrite_rule(
                          @list.List([@sets.extension(), @sets.in_elim_thm()]),
                        )(@sets.powerset_clauses()),
                      ]),
                    ),
                    t116,
                  ),
                  t117,
                ),
                @tactics.ap_term_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t118,
          ),
          t119,
        ),
        t120,
      ),
      t121,
    ),
    t122,
  )
  let setstep_lemma = @tactics.prove(
    @term_syntax.parse_term("!IN((a : A), (t : (A) -> Bool)) → {(u : (A) -> Bool) | SUBSET(u, INSERT(a, t)) && HAS_SIZE(u, SUC((m : Num)))} == UNION({(u : (A) -> Bool) | SUBSET(u, t) && HAS_SIZE(u, SUC(m))}, IMAGE((u : (A) -> Bool) => INSERT(a, u), {(u : (A) -> Bool) | SUBSET(u, t) && HAS_SIZE(u, m)}))"),
    t123,
  )
  let t157 = @sets.set_tac(@list.List([]))
  let t156 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((a : A), (t : (A) -> Bool))"))
  let t155 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_elim_thm(), @sets.has_size_suc()]),
  )
  let t154 = @simp.rewrite_tac(
    @list.List([
      @sets.disjoint(),
      @sets.extension(),
      @sets.in_inter(),
      @sets.not_in_empty(),
    ]),
  )
  let t152 = @sets.set_tac(@list.List([]))
  let t151 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((a : A), (t : (A) -> Bool))"))
  let t150 = @simp.asm_simp_tac(@list.List([]))
  let t153 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@sets.has_size_image_inj()),
          t150,
        ),
        t151,
      ),
      t152,
    ),
    @tactics.all_tac,
  ])
  let t149 = @simp.asm_simp_tac(@list.List([]))
  let t148 = @tactics.match_mp_tac(@sets.has_size_union())
  let t147 = @simp.asm_simp_tac(@list.List([setstep_lemma]))
  let t146 = @tactics.first_x_assum(fn(
    x143 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s144 = @tactics.subst_all_tac(x143)
    fn(
      x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s144(x145)
    }
  })
  let t141 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t142 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t141]),
  )
  let t140 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t139 = @simp.gen_rewrite_tac(
    fn(
      x136 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s137 = @equal.land_conv(x136)
      fn(x138 : @kernel.Term) -> @kernel.Thm raise { s137(x138) }
    },
    @list.List([@sets.has_size_clauses()]),
  )
  let t134 = @term_syntax.parse_term("(m : Num)")
  let t135 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t134]),
  )
  let t131 = @sets.set_tac(@list.List([]))
  let t132 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @sets.has_size_0(),
        @sets.subset_empty(),
        @sets.has_size_suc(),
      ]),
    ),
    t131,
  )
  let t130 = @sets.set_tac(@list.List([]))
  let t129 = @simp.rewrite_tac(
    @list.List([@sets.not_in_empty(), @sets.has_size_0()]),
  )
  let t128 = @simp.simp_tac(
    @list.List([@sets.extension(), @sets.in_sing(), @sets.in_elim_thm()]),
  )
  let t127 = @tactics.exists_tac(@term_syntax.parse_term("({} : (A) -> Bool)"))
  let t126 = @tactics.conv_tac(@sets.has_size_conv)
  let t133 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t126),
            t127,
          ),
          t128,
        ),
        t129,
      ),
      t130,
    ),
    t132,
    @tactics.all_tac,
  ])
  let t125 = @tactics.repeat_tac(@tactics.conj_tac)
  let t124 = @simp.rewrite_tac(@list.List([binom()]))
  let t158 = @tactics.then_tac(
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
                                          @tactics.match_mp_tac(binom_induct),
                                          t124,
                                        ),
                                        t125,
                                      ),
                                      t133,
                                    ),
                                    t135,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                @tactics.gen_tac,
                              ),
                              t139,
                            ),
                            t140,
                          ),
                          t142,
                        ),
                        @tactics.strip_tac,
                      ),
                      t146,
                    ),
                    t147,
                  ),
                  t148,
                ),
                t149,
              ),
              @tactics.conj_tac,
            ),
            t153,
          ),
          t154,
        ),
        t155,
      ),
      t156,
    ),
    t157,
  )
  has_size_restricted_powerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ s : (A) -> Bool, HAS_SIZE(s, n) → HAS_SIZE({(t : (A) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, m)}, binom((n, m)))"),
      t158,
    ),
  )
}

///|
let has_size_restricted_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_RESTRICTED_POWERSET",
)

///|
/// `HAS_SIZE_RESTRICTED_POWERSET`
pub fn has_size_restricted_powerset() -> @kernel.Thm {
  has_size_restricted_powerset_c.get()
}

///|
/// CARD_RESTRICTED_POWERSET
fn step_13() -> Unit raise {
  let t169 = @simp.simp_tac(@list.List([@sets.has_size()]))
  let t166 = @drule.match_mp(has_size_restricted_powerset())
  let t163 = @term_syntax.parse_term("(k : Num)")
  let t168 = @tactics.disch_then(fn(
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
      x165 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x160 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s161 = @tactics.mp_tac(x160)
        fn(
          x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s161(x162)
        }
      })(((x164 : @kernel.Thm) => @bool.spec(t163, x164))(x165))
    })(t166(x167))
  })
  let t159 = @simp.rewrite_tac(@list.List([@sets.finite_has_size()]))
  let t170 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t159),
      t168,
    ),
    t169,
  )
  card_restricted_powerset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ k : Num, FINITE(s) → CARD({(t : (_) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, k)}) == binom((CARD(s), k))"),
      t170,
    ),
  )
}

///|
let card_restricted_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_RESTRICTED_POWERSET",
)

///|
/// `CARD_RESTRICTED_POWERSET`
pub fn card_restricted_powerset() -> @kernel.Thm {
  card_restricted_powerset_c.get()
}

///|
/// BINOMIAL_THEOREM
fn step_14() -> Unit raise {
  let t186 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t185 = @simp.simp_tac(
    @list.List([
      @calc_num.arith(),
      @int.arith_rule(@term_syntax.parse_term("(k : Num) <= (n : Num) → SUC(n) - k == SUC(n - k)")),
      @arith.exp(),
    ]),
  )
  let t184 = @simp.simp_tac(
    @list.List([
      binom_lt(),
      @arith.lt(),
      @arith.mult_clauses(),
      @arith.add_clauses(),
      @arith.sub_0(),
      @arith.exp(),
      binom(),
    ]),
  )
  let t183 = @simp.simp_tac(
    @list.List([@iterate.nsum_clauses_left(), @arith.le_0()]),
  )
  let t182 = @simp.rewrite_tac(
    @list.List([
      @iterate.nsum_clauses_numseg(),
      @equal.gsym(@arith.add1()),
      @arith.le_suc(),
      @arith.le_0(),
    ]),
  )
  let t180 = @term_syntax.parse_term("nsum(op_dot_dot((m : Num) + 1, (n : Num) + 1), (i : Num) => (f : (Num) -> Num)(i))")
  let t181 = @simp.simp_tac(
    @list.List([
      @arith.add1(),
      @equal.sym(@simp.rewrite_conv(@list.List([@iterate.nsum_offset()]))(t180)),
    ]),
  )
  let t178 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp())]))
  let t179 = @list.List([
    @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.sub_suc()])),
    t178,
  ])
  let t177 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(a : Num) == (e : Num) && (b : Num) == (c : Num) + (d : Num) → a + b == c + (d + e)"),
    ),
  )
  let t176 = @simp.rewrite_tac(
    @list.List([
      @arith.right_add_distrib(),
      @iterate.nsum_add_numseg(),
      @arith.mult_clauses(),
      @arith.sub_0(),
    ]),
  )
  let t174 = @equal.gsym(@iterate.nsum_lmul())
  let t175 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), binom(), @equal.gsym(@arith.add1()), t174]),
  )
  let t173 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses_left(),
      @arith.add1(),
      @int.arith_rule(@term_syntax.parse_term("0 <= (n : Num) + 1")),
      @iterate.nsum_offset(),
    ]),
  )
  let t172 = @simp.rewrite_tac(
    @list.List([
      @iterate.nsum_sing_numseg(),
      binom(),
      @arith.sub_refl(),
      @arith.exp(),
      @arith.mult_clauses(),
    ]),
  )
  let t171 = @simp.asm_rewrite_tac(@list.List([@arith.exp()]))
  let t187 = @tactics.then_tac(
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
                                @nums.induct_tac,
                                @tactics.repeat_tac(@tactics.gen_tac),
                              ),
                              t171,
                            ),
                            t172,
                          ),
                          t173,
                        ),
                        t175,
                      ),
                      t176,
                    ),
                    t177,
                  ),
                  @tactics.conj_tac,
                ),
                t179,
              ),
              t181,
            ),
            t182,
          ),
          t183,
        ),
        t184,
      ),
      t185,
    ),
    t186,
  )
  binomial_theorem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, EXP(x + y, n) == nsum(op_dot_dot(0, n), (k : Num) => binom((n, k)) * (EXP(x, k) * EXP(y, n - k)))"),
      t187,
    ),
  )
}

///|
let binomial_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOMIAL_THEOREM",
)

///|
/// `BINOMIAL_THEOREM`
pub fn binomial_theorem() -> @kernel.Thm {
  binomial_theorem_c.get()
}

///|
/// REAL_BINOMIAL_THEOREM
fn step_15() -> Unit raise {
  let t203 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t202 = @simp.simp_tac(
    @list.List([
      @calc_num.arith(),
      @int.arith_rule(@term_syntax.parse_term("(k : Num) <= (n : Num) → SUC(n) - k == SUC(n - k)")),
      @realax.real_pow(),
    ]),
  )
  let t201 = @simp.simp_tac(
    @list.List([
      @iterate.sum_clauses_left(),
      @arith.le_0(),
      binom_lt(),
      @arith.lt(),
      @realax.real_mul_lid(),
      @arith.sub_0(),
      @realax.real_pow(),
      binom(),
      @calc_int.real_mul_lzero(),
      @calc_int.real_add_rid(),
    ]),
  )
  let t200 = @simp.rewrite_tac(
    @list.List([
      @iterate.sum_clauses_numseg(),
      @equal.gsym(@arith.add1()),
      @arith.le_suc(),
      @arith.le_0(),
    ]),
  )
  let t198 = @term_syntax.parse_term("sum(op_dot_dot((m : Num) + 1, (n : Num) + 1), (i : Num) => (f : (Num) -> Real)(i))")
  let t199 = @simp.simp_tac(
    @list.List([
      @arith.add1(),
      @equal.sym(@simp.rewrite_conv(@list.List([@iterate.sum_offset()]))(t198)),
    ]),
  )
  let t196 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_pow())]))
  let t197 = @list.List([
    @simp.simp_tac(@list.List([@real.real_mul_ac(), @arith.sub_suc()])),
    t196,
  ])
  let t195 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) == (e : Real) && (b : Real) == (c : Real) + (d : Real) → a + b == c + (d + e)"),
    ),
  )
  let t194 = @simp.rewrite_tac(
    @list.List([
      @real.real_add_rdistrib(),
      @iterate.sum_add_numseg(),
      @realax.real_mul_lid(),
      @arith.sub_0(),
    ]),
  )
  let t193 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_add())]),
  )
  let t191 = @equal.gsym(@iterate.sum_lmul())
  let t192 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), binom(), @equal.gsym(@arith.add1()), t191]),
  )
  let t190 = @simp.simp_tac(
    @list.List([
      @iterate.sum_clauses_left(),
      @arith.add1(),
      @int.arith_rule(@term_syntax.parse_term("0 <= (n : Num) + 1")),
      @iterate.sum_offset(),
    ]),
  )
  let t189 = @simp.rewrite_tac(
    @list.List([
      @iterate.sum_sing_numseg(),
      binom(),
      @arith.sub_refl(),
      @realax.real_pow(),
      @realax.real_mul_lid(),
    ]),
  )
  let t188 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t204 = @tactics.then_tac(
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
                                @nums.induct_tac,
                                @tactics.repeat_tac(@tactics.gen_tac),
                              ),
                              t188,
                            ),
                            t189,
                          ),
                          t190,
                        ),
                        t192,
                      ),
                      t193,
                    ),
                    t194,
                  ),
                  t195,
                ),
                @tactics.conj_tac,
              ),
              t197,
            ),
            t199,
          ),
          t200,
        ),
        t201,
      ),
      t202,
    ),
    t203,
  )
  real_binomial_theorem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, pow(x + y, n) == sum(op_dot_dot(0, n), (k : Num) => real_of_num(binom((n, k))) * (pow(x, k) * pow(y, n - k)))"),
      t204,
    ),
  )
}

///|
let real_binomial_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_BINOMIAL_THEOREM",
)

///|
/// `REAL_BINOMIAL_THEOREM`
pub fn real_binomial_theorem() -> @kernel.Thm {
  real_binomial_theorem_c.get()
}

///|
/// BINOM_TOP_STEP_REAL
fn step_16() -> Unit raise {
  let t218 = @tactics.conv_tac(@calc_rat.real_field)
  let t217 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_le())]),
  )
  let t216 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) <= (n : Num)"))
  let t212 = @equal.gsym(@real.real_of_num_sub())
  let t213 = @equal.gsym(@realax.real_of_num_add())
  let t214 = @equal.gsym(@realax.real_of_num_mul())
  let t215 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@realax.real_of_num_eq()), t214, t213, t212]),
  )
  let t210 = @term_syntax.parse_term("(k : Num)")
  let t211 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t210]),
      binom_top_step(),
    ),
  )
  let t209 = @simp.asm_simp_tac(
    @list.List([binom_lt(), @calc_int.real_mul_rzero()]),
  )
  let t206 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("!((k : Num) == (n : Num) + 1) → n < k && n + 1 < k || k <= n && k <= n + 1"),
    ),
  )
  let t208 = @tactics.first_x_assum(fn(
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
    @tactics.strip_assume_tac(t206(x207))
  })
  let t205 = @simp.asm_rewrite_tac(@list.List([binom_refl()]))
  let t219 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    @class.cond_cases_tac,
                  ),
                  t205,
                ),
                t208,
              ),
              t209,
            ),
            t211,
          ),
          t215,
        ),
        t216,
      ),
      t217,
    ),
    t218,
  )
  binom_top_step_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, real_of_num(binom((n + 1, k))) == (if k == n + 1 { real_of_num(1) } else { (real_of_num(n) + real_of_num(1)) / (real_of_num(n) + (real_of_num(1) - real_of_num(k))) * real_of_num(binom((n, k))) })"),
      t219,
    ),
  )
}

///|
let binom_top_step_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_TOP_STEP_REAL",
)

///|
/// `BINOM_TOP_STEP_REAL`
pub fn binom_top_step_real() -> @kernel.Thm {
  binom_top_step_real_c.get()
}

///|
/// BINOM_BOTTOM_STEP_REAL
fn step_17() -> Unit raise {
  let t226 = @tactics.conv_tac(@calc_rat.real_field)
  let t222 = @equal.gsym(@real.real_of_num_sub())
  let t223 = @equal.gsym(@realax.real_of_num_add())
  let t224 = @equal.gsym(@realax.real_of_num_mul())
  let t225 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@realax.real_of_num_eq()), t224, t223, t222]),
  )
  let t221 = @term_syntax.parse_term("(k : Num)")
  let t227 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.specl(
          @list.List([@term_syntax.parse_term("(n : Num)"), t221]),
          binom_bottom_step(),
        ),
      ),
      t225,
    ),
    t226,
  )
  let t228 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        binom_lt(),
        @int.arith_rule(@term_syntax.parse_term("(n : Num) < (k : Num) → n < k + 1")),
        @calc_int.real_mul_rzero(),
      ]),
    ),
    t227,
  ])
  let t220 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(n : Num) < (k : Num) || k <= n")),
  )
  let t229 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t220),
    t228,
  )
  binom_bottom_step_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, real_of_num(binom((n, k + 1))) == (real_of_num(n) - real_of_num(k)) / (real_of_num(k) + real_of_num(1)) * real_of_num(binom((n, k)))"),
      t229,
    ),
  )
}

///|
let binom_bottom_step_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_BOTTOM_STEP_REAL",
)

///|
/// `BINOM_BOTTOM_STEP_REAL`
pub fn binom_bottom_step_real() -> @kernel.Thm {
  binom_bottom_step_real_c.get()
}

///|
/// REAL_OF_NUM_BINOM
fn step_18() -> Unit raise {
  let t242 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @arith.mult_ac()]),
  )
  let t241 = @simp.rewrite_tac(@list.List([@equal.gsym(binom_fact())]))
  let t240 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t239 = @simp.rewrite_tac(@list.List([@arith.add_sub2()]))
  let t235 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t236 = @tactics.choose_then(fn(
    x232 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s233 = @tactics.subst1_tac(x232)
    fn(
      x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s233(x234)
    }
  })
  let t238 = @tactics.first_assum(fn(
    x237 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t236(t235(x237))
  })
  let t231 = @simp.simp_tac(
    @list.List([
      @real.real_eq_rdiv_eq(),
      @real.real_lt_mul(),
      @real.real_of_num_lt(),
      @arith.fact_lt(),
    ]),
  )
  let t230 = @simp.asm_simp_tac(
    @list.List([binom_lt(), @equal.gsym(@arith.not_le())]),
  )
  let t243 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @class.cond_cases_tac,
                ),
                t230,
              ),
              t231,
            ),
            t238,
          ),
          t239,
        ),
        t240,
      ),
      t241,
    ),
    t242,
  )
  real_of_num_binom_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, real_of_num(binom((n, k))) == (if k <= n { real_of_num(FACT(n)) / (real_of_num(FACT(n - k)) * real_of_num(FACT(k))) } else { real_of_num(0) })"),
      t243,
    ),
  )
}

///|
let real_of_num_binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_BINOM",
)

///|
/// `REAL_OF_NUM_BINOM`
pub fn real_of_num_binom() -> @kernel.Thm {
  real_of_num_binom_c.get()
}

///|
/// BINOM_BOTH_STEP_REAL
fn step_19() -> Unit raise {
  let t253 = @tactics.conv_tac(@calc_rat.real_field)
  let t251 = @equal.gsym(@realax.real_of_num_eq())
  let t252 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_add()), t251]),
  )
  let t250 = @tactics.pop_assum(fn(
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
    let s248 = @tactics.mp_tac(x247)
    fn(
      x249 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s248(x249)
    }
  })
  let t246 = @simp.asm_rewrite_tac(@list.List([binom_refl()]))
  let t245 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
  let t244 = @tactics.repeat_tac(@tactics.gen_tac)
  let t254 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([binom_top_step_real(), binom_bottom_step_real()]),
                ),
                t244,
              ),
              t245,
            ),
            @class.cond_cases_tac,
          ),
          t246,
        ),
        t250,
      ),
      t252,
    ),
    t253,
  )
  binom_both_step_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, real_of_num(binom((p + 1, k + 1))) == (real_of_num(p) + real_of_num(1)) / (real_of_num(k) + real_of_num(1)) * real_of_num(binom((p, k)))"),
      t254,
    ),
  )
}

///|
let binom_both_step_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_BOTH_STEP_REAL",
)

///|
/// `BINOM_BOTH_STEP_REAL`
pub fn binom_both_step_real() -> @kernel.Thm {
  binom_both_step_real_c.get()
}

///|
/// BINOM_BOTH_STEP
fn step_20() -> Unit raise {
  let t257 = @tactics.conv_tac(@calc_rat.real_field)
  let t256 = @simp.rewrite_tac(
    @list.List([binom_both_step_real(), @equal.gsym(@realax.real_of_num_add())]),
  )
  let t255 = @equal.gsym(@realax.real_of_num_mul())
  let t258 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.gsym(@realax.real_of_num_eq()), t255]),
      ),
      t256,
    ),
    t257,
  )
  binom_both_step_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, (k + 1) * binom((p + 1, k + 1)) == (p + 1) * binom((p, k))"),
      t258,
    ),
  )
}

///|
let binom_both_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_BOTH_STEP",
)

///|
/// `BINOM_BOTH_STEP`
pub fn binom_both_step() -> @kernel.Thm {
  binom_both_step_c.get()
}

///|
/// BINOM_BOTH_STEP_DOWN
fn step_21() -> Unit raise {
  let t261 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t260 = @simp.rewrite_tac(
    @list.List([@arith.suc_sub1(), @arith.add1(), binom_both_step()]),
  )
  let t259 = @simp.simp_tac(
    @list.List([binom_lt(), @arith.lt_0(), @arith.lt_refl(), @calc_num.arith()]),
  )
  let t262 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t259),
      t260,
    ),
    t261,
  )
  binom_both_step_down_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, (k == 0 → p == 0) → k * binom((p, k)) == p * binom((p - 1, k - 1))"),
      t262,
    ),
  )
}

///|
let binom_both_step_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_BOTH_STEP_DOWN",
)

///|
/// `BINOM_BOTH_STEP_DOWN`
pub fn binom_both_step_down() -> @kernel.Thm {
  binom_both_step_down_c.get()
}

///|
/// BINOM
fn step_22() -> Unit raise {
  let t278 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t277 = @simp.rewrite_tac(
    @list.List([@equal.gsym(binom_fact()), @arith.add_sub()]),
  )
  let t276 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t272 = @simp.gen_rewrite_rule(
    fn(
      x271 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x271
    },
    @list.List([@arith.le_exists()]),
  )
  let t273 = @tactics.choose_then(fn(
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
    let s269 = @tactics.subst1_tac(x268)
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
  })
  let t275 = @tactics.first_x_assum(fn(
    x274 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t273(t272(x274))
  })
  let t267 = @simp.simp_tac(
    @list.List([@arith.lt_mult(), @arith.fact_lt(), @arith.add_clauses()]),
  )
  let t266 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t265 = @tactics.match_mp_tac(@arith.div_uniq())
  let t264 = @tactics.conv_tac(@equal.sym_conv)
  let t263 = @simp.asm_simp_tac(
    @list.List([binom_eq_0(), @equal.gsym(@arith.not_le())]),
  )
  let t279 = @tactics.then_tac(
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
                      @class.cond_cases_tac,
                    ),
                    t263,
                  ),
                  t264,
                ),
                t265,
              ),
              t266,
            ),
            t267,
          ),
          t275,
        ),
        t276,
      ),
      t277,
    ),
    t278,
  )
  binom_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, binom((n, k)) == (if k <= n { DIV(FACT(n), FACT(n - k) * FACT(k)) } else { 0 })"),
      t279,
    ),
  )
}

///|
let binom_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM")

///|
/// `BINOM`
pub fn binom_v1() -> @kernel.Thm {
  binom_v1_c.get()
}

///|
/// DIVIDES_GCD_BINOM
fn step_23() -> Unit raise {
  let t300 = @tactics.conv_tac(@int.number_rule)
  let t299 = @tactics.pop_assum(fn(
    x296 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s297 = @tactics.mp_tac(x296)
    fn(
      x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s297(x298)
    }
  })
  let t295 = @simp.asm_rewrite_tac(@list.List([]))
  let t288 = @drule.part_match(
    fn(x287 : @kernel.Term) -> @kernel.Term raise {
      (fn(x286 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@equal.lhand(x286))
      })(@kernel.rand(x287))
    },
    binom_both_step_down(),
  )
  let t281 = @tactics.conv_tac(@int.number_rule)
  let t282 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t281),
    @tactics.all_tac,
  ])
  let t280 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t301 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t280),
            t282,
          ),
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
            (fn(
              x293 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x291 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x290 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x289 : @kernel.Term,
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
                      x283 : @kernel.Thm,
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
                      let s284 = @tactics.mp_tac(x283)
                      fn(
                        x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s284(x285)
                      }
                    })(t288(x289))
                  })(@kernel.rand(x290))
                })(@kernel.rand(x291))
              })(
                (fn(
                  x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x292.1
                })(x293),
              )
            })(x294)(x294)
          },
        ),
        t295,
      ),
      t299,
    ),
    t300,
  )
  divides_gcd_binom_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, divides(n, gcd((n, k)) * binom((n, k)))"),
      t301,
    ),
  )
}

///|
let divides_gcd_binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_GCD_BINOM",
)

///|
/// `DIVIDES_GCD_BINOM`
pub fn divides_gcd_binom() -> @kernel.Thm {
  divides_gcd_binom_c.get()
}

///|
/// DIVIDES_COPRIME_BINOM
fn step_24() -> Unit raise {
  let t302 = @meson.meson_tac(
    @list.List([
      divides_gcd_binom(),
      @arith.mult_clauses(),
      @int.number_rule(@term_syntax.parse_term("coprime(((n : Num), (k : Num))) == (gcd((n, k)) == 1)")),
    ]),
  )
  divides_coprime_binom_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, coprime((n, k)) → divides(n, binom((n, k)))"),
      t302,
    ),
  )
}

///|
let divides_coprime_binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_COPRIME_BINOM",
)

///|
/// `DIVIDES_COPRIME_BINOM`
pub fn divides_coprime_binom() -> @kernel.Thm {
  divides_coprime_binom_c.get()
}

///|
/// DIVIDES_PRIME_BINOM
fn step_25() -> Unit raise {
  let t310 = @meson.asm_meson_tac(
    @list.List([@int.prime_coprime_eq_nondivisible()]),
  )
  let t308 = @drule.match_mp(@int.divides_le())
  let t311 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
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
      }),
      @int.asm_arith_tac,
    ),
    t310,
  ])
  let t304 = @class.asm_cases_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t303 = @tactics.match_mp_tac(divides_coprime_binom())
  let t312 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t303),
      t304,
    ),
    t311,
  )
  divides_prime_binom_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) && 0 < n && n < p → divides(p, binom((p, n)))"),
      t312,
    ),
  )
}

///|
let divides_prime_binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_PRIME_BINOM",
)

///|
/// `DIVIDES_PRIME_BINOM`
pub fn divides_prime_binom() -> @kernel.Thm {
  divides_prime_binom_c.get()
}

///|
/// BINOM_SYM
fn step_26() -> Unit raise {
  let t317 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @arith.mult_sym()]),
  )
  let t316 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(k : Num) <= (n : Num) → n - (n - k) == k")),
    ]),
  )
  let t315 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) - (k : Num) <= n"))]),
  )
  let t314 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_eq()), real_of_num_binom()]),
  )
  let t313 = @simp.asm_simp_tac(
    @list.List([
      binom(),
      @int.arith_rule(@term_syntax.parse_term("!((k : Num) <= (n : Num)) → n - k == 0")),
    ]),
  )
  let t318 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @class.cond_cases_tac,
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
  binom_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, binom((n, n - k)) == (if k <= n { binom((n, k)) } else { 1 })"),
      t318,
    ),
  )
}

///|
let binom_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_SYM")

///|
/// `BINOM_SYM`
pub fn binom_sym() -> @kernel.Thm {
  binom_sym_c.get()
}

///|
/// BINOM_MUL_SHIFT
fn step_27() -> Unit raise {
  let t338 = @tactics.conv_tac(@calc_rat.real_field)
  let t337 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_eq())]),
  )
  let t332 = @term_syntax.parse_term("(m : Num) - (k : Num)")
  let t333 = @term_syntax.parse_term("(n : Num) - (k : Num)")
  let t334 = @term_syntax.parse_term("(n : Num) - (m : Num)")
  let t335 = @term_syntax.parse_term("(m : Num)")
  let t336 = @tactics.map_every(
    fn(
      x331 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x325 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s326 = @tactics.mp_tac(x325)
        fn(
          x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s326(x327)
        }
      })(
        (fn(x330 : @kernel.Term) -> @kernel.Thm raise {
          (fn(
            x328 : @kernel.Term,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x329 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.spec(x328, x329)
            }
          })(x330)(@arith.fact_nz())
        })(x331),
      )
    },
    @list.List([@term_syntax.parse_term("(n : Num)"), t335, t334, t333, t332]),
  )
  let t324 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(k : Num) <= (m : Num) && m <= (n : Num) → n - k - (m - k) == n - m"),
      ),
    ]),
  )
  let t323 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.not_lt()])),
  )
  let t339 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(
              @tactics.thenl(
                @class.cond_cases_tac,
                @list.List([
                  @tactics.all_tac,
                  @tactics.then_tac(
                    @tactics.match_mp_tac(
                      @class.taut(@term_syntax.parse_term("false → (p : Bool)")),
                    ),
                    @int.asm_arith_tac,
                  ),
                ]),
              ),
            ),
            t323,
          ),
          t324,
        ),
        t336,
      ),
      t337,
    ),
    t338,
  )
  let t322 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("false → (p : Bool)")))
  let t340 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.then_tac(
            @class.cond_cases_tac,
            @simp.asm_rewrite_tac(
              @list.List([
                @calc_int.real_mul_lzero(),
                @calc_int.real_mul_rzero(),
              ]),
            ),
          ),
        ),
        t322,
      ),
      @int.asm_arith_tac,
    ),
    t339,
  ])
  let t321 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < (m : Num)"))
  let t319 = @equal.gsym(@realax.real_of_num_mul())
  let t320 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@realax.real_of_num_eq()),
      t319,
      real_of_num_binom(),
    ]),
  )
  let t341 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t320),
      t321,
    ),
    t340,
  )
  binom_mul_shift_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ k : Num, k <= m → binom((n, m)) * binom((m, k)) == binom((n, k)) * binom((n - k, m - k))"),
      t341,
    ),
  )
}

///|
let binom_mul_shift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINOM_MUL_SHIFT",
)

///|
/// `BINOM_MUL_SHIFT`
pub fn binom_mul_shift() -> @kernel.Thm {
  binom_mul_shift_c.get()
}

///|
/// APPELL_SEQUENCE
fn step_28() -> Unit raise {
  let t355 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_of_num_mul(),
      @realax.real_of_num_eq(),
      binom_mul_shift(),
    ]),
  )
  let t354 = @tactics.match_mp_tac(
    @calc_rat.real_ring(
      @term_syntax.parse_term("(c : Real) * (d : Real) == (a : Real) * (b : Real) → a * ((z : Real) * (b * ((x : Real) * (y : Real)))) == c * (d * (z * x) * y)"),
    ),
  )
  let t353 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(j : Num) <= (k : Num) && k <= (n : Num) → n - j - (k - j) == n - k"),
      ),
    ]),
  )
  let t352 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([@int.asm_arith_tac, @tactics.all_tac]),
    ),
  )
  let t351 = @list.List([
    @int.arith_tac,
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac),
  ])
  let t350 = @simp.rewrite_tac(
    @list.List([@pair.pair_eq(), @iterate.in_numseg()]),
  )
  let t349 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @sets.in_elim_pair_thm()]),
  )
  let t348 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (x + y, x)))"),
  )
  let t347 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x - y)))"),
  )
  let t346 = @tactics.match_mp_tac(@iterate.sum_eq_general_inverses())
  let t345 = @simp.simp_tac(
    @list.List([@iterate.sum_sum_product(), @iterate.finite_numseg()]),
  )
  let t343 = @equal.gsym(@iterate.sum_rmul())
  let t344 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@iterate.sum_lmul()), t343]),
  )
  let t342 = @simp.rewrite_tac(@list.List([real_binomial_theorem()]))
  let t356 = @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.gen_tac),
                              t342,
                            ),
                            t344,
                          ),
                          t345,
                        ),
                        t346,
                      ),
                      t347,
                    ),
                    t348,
                  ),
                  t349,
                ),
                t350,
              ),
              @tactics.conj_tac,
            ),
            t351,
          ),
          t352,
        ),
        t353,
      ),
      t354,
    ),
    t355,
  )
  appell_sequence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : (Num) -> Real, ∀ n : Num, ∀ x : Real, ∀ y : Real, sum(op_dot_dot(0, n), (k : Num) => real_of_num(binom((n, k))) * (sum(op_dot_dot(0, k), (l : Num) => real_of_num(binom((k, l))) * (c(l) * pow(x, k - l))) * pow(y, n - k))) == sum(op_dot_dot(0, n), (k : Num) => real_of_num(binom((n, k))) * (c(k) * pow(x + y, n - k)))"),
      t356,
    ),
  )
}

///|
let appell_sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "APPELL_SEQUENCE",
)

///|
/// `APPELL_SEQUENCE`
pub fn appell_sequence() -> @kernel.Thm {
  appell_sequence_c.get()
}

///|
/// NUM_BINOM_CONV
fn step_29() -> Unit raise {
  let t361 = @simp.rewrite_tac(
    @list.List([
      @arith.add1(),
      @equal.gsym(binom_top_step()),
      @arith.eq_mult_lcancel(),
      @arith.sub_eq_0(),
    ]),
  )
  let t362 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x360 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x357 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s358 = @tactics.subst1_tac(x357)
          fn(
            x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s358(x359)
          }
        })(@equal.sym(x360))
      }),
      t361,
    ),
    @int.arith_tac,
  )
  let pth_step = @tactics.prove(
    @term_syntax.parse_term("binom(((n : Num), (k : Num))) == (y : Num) → k <= n → SUC(n) * y == (n + 1 - k) * (x : Num) → binom((SUC(n), k)) == x"),
    t362,
  )
  let t363 = @simp.rewrite_tac(@list.List([binom_lt()]))
  let pth_0 = @tactics.prove(
    @term_syntax.parse_term("(n : Num) < (k : Num) → binom((n, k)) == 0"),
    t363,
  )
  let t364 = @simp.rewrite_tac(@list.List([binom_refl()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("binom(((n : Num), n)) == 1"), t364)
  let t365 = @meson.meson_tac(@list.List([binom_sym()]))
  let pth_swap = @tactics.prove(
    @term_syntax.parse_term("(k : Num) <= (n : Num) → binom((n, k)) == binom((n, n - k))"),
    t365,
  )
  let k_tm = @term_syntax.parse_term("(k : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let x_tm = @term_syntax.parse_term("(x : Num)")
  let y_tm = @term_syntax.parse_term("(y : Num)")
  let binom_tm = @term_syntax.parse_term("binom")
  fn binom_rule(x366 : @num.Num, x367 : @num.Num) -> @kernel.Thm raise {
    let (n, k) = (x366, x367)
    if @num.lt_num(n, k) {
      let t368 = (@nums.mk_numeral(k), k_tm)
      let th = @kernel.inst_rule(
        @list.List([(@nums.mk_numeral(n), n_tm), t368]),
        pth_0,
      )
      @drule.mp_conv(@calc_num.num_lt_conv, th)
    } else if @num.eq_num(n, k) {
      @kernel.inst_rule(@list.List([(@nums.mk_numeral(n), n_tm)]), pth_1)
    } else if @num.lt_num(@num.mult_num(@num.num_of_int64(2L), k), n) {
      let t369 = (@nums.mk_numeral(k), k_tm)
      let th1 = @kernel.inst_rule(
        @list.List([(@nums.mk_numeral(n), n_tm), t369]),
        pth_swap,
      )
      let th2 = @bool.mp(
        th1,
        @bool.eqt_elim(@calc_num.num_le_conv(@equal.lhand(@kernel.concl(th1)))),
      )
      let th3 = @equal.conv_rule(
        @lib.funpow(
          3,
          fn(
            x370 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s371 = @equal.rand_conv(x370)
            fn(x372 : @kernel.Term) -> @kernel.Thm raise { s371(x372) }
          },
          @calc_num.num_sub_conv,
        ),
        th2,
      )
      @kernel.trans(th3, binom_rule(n, @num.sub_num(n, k)))
    } else {
      let th1_1 = binom_rule(@num.sub_num(n, @num.num_of_int64(1L)), k)
      let y = @basics.dest_numeral(@kernel.rand(@kernel.concl(th1_1)))
      let x = @num.mult_num(@num.div_num(n, @num.sub_num(n, k)), y)
      let t373 = (@nums.mk_numeral(y), y_tm)
      let t374 = (@nums.mk_numeral(x), x_tm)
      let t375 = (@nums.mk_numeral(k), k_tm)
      let th2_1 = @kernel.inst_rule(
        @list.List([
          (@nums.mk_numeral(@num.sub_num(n, @num.num_of_int64(1L))), n_tm),
          t375,
          t374,
          t373,
        ]),
        pth_step,
      )
      let th3_1 = @drule.mp_conv(
        @calc_num.num_reduce_conv,
        @drule.mp_conv(@calc_num.num_le_conv, @bool.mp(th2_1, th1_1)),
      )
      @equal.conv_rule(
        @equal.land_conv(
          @equal.rand_conv(@equal.land_conv(@calc_num.num_suc_conv)),
        ),
        th3_1,
      )
    }
  }
  num_binom_conv_c.set(fn(x376 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x376
    let (bop, nkp) = @kernel.dest_comb(tm)
    if bop != binom_tm {
      raise Failure("NUM_BINOM_CONV")
    } else {
      let (nt, kt) = @pair.dest_pair(nkp)
      let t377 = @basics.dest_numeral(kt)
      binom_rule(@basics.dest_numeral(nt), t377)
    }
  })
}

///|
let num_binom_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_BINOM_CONV",
)

///|
/// `NUM_BINOM_CONV`
pub fn num_binom_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_binom_conv_c.get()(x)
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
}
