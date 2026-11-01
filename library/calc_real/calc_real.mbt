// Translated from upstream Library/calc_real.ml; edit this file directly.

///|
/// REAL_SUB_SUM0
fn step_1() -> Unit raise {
  let t1 = @simp.asm_rewrite_tac(@list.List([@analysis.sum()]))
  let t2 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv)),
            @tactics.gen_tac,
          ),
          @tactics.gen_tac,
        ),
        @nums.induct_tac,
      ),
      t1,
    ),
    @calc_rat.real_arith_tac,
  )
  real_sub_sum0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Real, ∀ y : (Num) -> Real, ∀ m : Num, sum((0, m), x) - sum((0, m), y) == sum((0, m), (i : Num) => x(i) - y(i))"),
      t2,
    ),
  )
}

///|
let real_sub_sum0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_SUM0")

///|
/// `REAL_SUB_SUM0`
pub fn real_sub_sum0() -> @kernel.Thm {
  real_sub_sum0_c.get()
}

///|
/// REAL_MUL_RSUM0
fn step_2() -> Unit raise {
  let t3 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([
        @analysis.sum(),
        @analysis.real_mul_rzero(),
        @realax.real_add_ldistrib(),
      ]),
    ),
  )
  real_mul_rsum0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ c : Real, ∀ x : (Num) -> Real, c * sum((0, m), x) == sum((0, m), (i : Num) => c * x(i))"),
      t3,
    ),
  )
}

///|
let real_mul_rsum0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RSUM0")

///|
/// `REAL_MUL_RSUM0`
pub fn real_mul_rsum0() -> @kernel.Thm {
  real_mul_rsum0_c.get()
}

///|
/// REAL_ABS_LEMMA
fn step_3() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_mul(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  real_abs_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Real, ∀ n : Num, pow(real_of_num(a), n) * abs(b) == abs(pow(real_of_num(a), n) * b)"),
      t4,
    ),
  )
}

///|
let real_abs_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_LEMMA")

///|
/// `REAL_ABS_LEMMA`
pub fn real_abs_lemma() -> @kernel.Thm {
  real_abs_lemma_c.get()
}

///|
/// REAL_ABS_LEMMA1
fn step_4() -> Unit raise {
  let t5 = @simp.rewrite_tac(
    @list.List([@real.real_abs_mul(), @calc_int.real_abs_num()]),
  )
  real_abs_lemma1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Real, real_of_num(a) * abs(b) == abs(real_of_num(a) * b)"), t5),
  )
}

///|
let real_abs_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_LEMMA1",
)

///|
/// `REAL_ABS_LEMMA1`
pub fn real_abs_lemma1() -> @kernel.Thm {
  real_abs_lemma1_c.get()
}

///|
/// REAL_ABS_TRIANGLE_LEMMA
fn step_5() -> Unit raise {
  real_abs_triangle_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, abs(x - y) + abs(z - x) < u → abs(z - y) < u"),
      @calc_rat.real_arith_tac,
    ),
  )
}

///|
let real_abs_triangle_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_TRIANGLE_LEMMA",
)

///|
/// `REAL_ABS_TRIANGLE_LEMMA`
pub fn real_abs_triangle_lemma() -> @kernel.Thm {
  real_abs_triangle_lemma_c.get()
}

///|
/// REAL_MONO_POW2
fn step_6() -> Unit raise {
  let t18 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : Num)"), @real.real_lt_pow2()),
  )
  let t17 = @tactics.pop_assum(fn(
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
    let s15 = @tactics.mp_tac(x14)
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
      s15(x16)
    }
  })
  let t13 = @simp.rewrite_tac(
    @list.List([
      @arith.add_clauses(),
      @realax.real_pow(),
      @analysis.real_le_refl(),
    ]),
  )
  let t11 = @term_syntax.parse_term("(d : Num)")
  let t12 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t11)
  let t10 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x7 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s8 = @tactics.subst1_tac(x7)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
  )
  let t6 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t19 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t6),
                t10,
              ),
              t12,
            ),
            @nums.induct_tac,
          ),
          t13,
        ),
        t17,
      ),
      t18,
    ),
    @calc_rat.real_arith_tac,
  )
  real_mono_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → pow(real_of_num(2), m) <= pow(real_of_num(2), n)"),
      t19,
    ),
  )
}

///|
let real_mono_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MONO_POW2")

///|
/// `REAL_MONO_POW2`
pub fn real_mono_pow2() -> @kernel.Thm {
  real_mono_pow2_c.get()
}

///|
/// REAL_LE_SUC_POW2
fn step_7() -> Unit raise {
  let t20 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(
      @list.List([
        @realax.real_pow(),
        @real.real_mul_2(),
        @analysis.real_le_ladd(),
        @real.real_le_pow2(),
      ]),
    ),
  )
  real_le_suc_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, pow(real_of_num(2), m) + real_of_num(1) <= pow(real_of_num(2), SUC(m))"),
      t20,
    ),
  )
}

///|
let real_le_suc_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_SUC_POW2",
)

///|
/// `REAL_LE_SUC_POW2`
pub fn real_le_suc_pow2() -> @kernel.Thm {
  real_le_suc_pow2_c.get()
}

///|
/// REAL_OPPSIGN_LEMMA
fn step_8() -> Unit raise {
  let t42 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @analysis.real_neg_neg(),
    ]),
  )
  let t41 = @tactics.disch_then(fn(
    x38 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x38
    let t40 = @tactics.mp_tac(th)
    @tactics.then_tac(
      @tactics.mp_tac(@drule.match_mp(@real.real_lt_mul())(th)),
      t40,
    )
  })
  let t37 = @tactics.pop_assum_list(fn(
    x36 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x32 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s33 = @tactics.mp_tac(x32)
      fn(
        x34 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s33(x34)
      }
    })(
      ((x35 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x35))(x36),
    )
  })
  let t31 = @simp.asm_rewrite_tac(
    @list.List([
      @analysis.real_mul_lzero(),
      @analysis.real_mul_rzero(),
      @realarith.real_lt_refl(),
    ]),
  )
  let t29 = @bool.spec(
    @term_syntax.parse_term("(y : Real)"),
    @analysis.real_lt_negtotal(),
  )
  let t30 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
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
    let s27 = @tactics.assume_tac(x26)
    fn(
      x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s27(x28)
    }
  })(t29)
  let t24 = @bool.spec(
    @term_syntax.parse_term("(x : Real)"),
    @analysis.real_lt_negtotal(),
  )
  let t25 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
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
    let s22 = @tactics.assume_tac(x21)
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
  })(t24)
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t25),
              t30,
            ),
            t31,
          ),
          t37,
        ),
        t41,
      ),
      t42,
    ),
    @calc_rat.real_arith_tac,
  )
  real_oppsign_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x * y < real_of_num(0)) == (x < real_of_num(0) && real_of_num(0) < y || real_of_num(0) < x && y < real_of_num(0))"),
      t43,
    ),
  )
}

///|
let real_oppsign_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OPPSIGN_LEMMA",
)

///|
/// `REAL_OPPSIGN_LEMMA`
pub fn real_oppsign_lemma() -> @kernel.Thm {
  real_oppsign_lemma_c.get()
}

///|
/// REAL_OPPSIGN
fn step_9() -> Unit raise {
  let t44 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@analysis.real_not_lt()), real_oppsign_lemma()]),
    ),
    @calc_rat.real_arith_tac,
  )
  real_oppsign_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((real_of_num(0) < (x : Real) → real_of_num(0) <= (y : Real)) && (x < real_of_num(0) → y <= real_of_num(0))) == (real_of_num(0) <= x * y)"),
      t44,
    ),
  )
}

///|
let real_oppsign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OPPSIGN")

///|
/// `REAL_OPPSIGN`
pub fn real_oppsign() -> @kernel.Thm {
  real_oppsign_c.get()
}

///|
/// REAL_NDIV_LEMMA1a
fn step_10() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t81 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t80 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t79 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t78 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t77 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t76 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_mul_2()), @real.real_le_addr()]),
  )
  let t74 = @term_syntax.parse_term("(a : Real) + (b : Real) + (c : Real) == b + (a + c)")
  let t75 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@calc_int.real_add_ac())(t74)]),
  )
  let t73 = @simp.rewrite_tac(
    @list.List([@real.real_lt_pow2(), @equal.gsym(@calc_int.real_of_num_pow())]),
  )
  let t72 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(EXP(2, (m : Num)))"))
  let t71 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t70 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_rid(),
      @realax.real_add_assoc(),
      @real.real_lt_addl(),
    ]),
  )
  let t69 = @simp.rewrite_tac(
    @list.List([
      @real.real_mul_2(),
      @realax.real_add_ldistrib(),
      @real.real_add_rdistrib(),
    ]),
  )
  let t68 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]),
  )
  let t67 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_abs_neg(),
      @analysis.real_not_le(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t66 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(a : Real) + (b : Real) - a == b && a - (a + b) == -b"),
      ),
    ]),
  )
  let t65 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_add())]),
  )
  let t61 = @simp.rewrite_rule(@list.List([@arith.lt_exists()]))
  let t62 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x58 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s59 = @tactics.subst1_tac(x58)
    fn(
      x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s59(x60)
    }
  })
  let t64 = @tactics.pop_assum(fn(
    x63 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t62(t61(x63))
  })
  let t57 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t55 = @tactics.conv_tac(@class.contrapos_conv)
  let t54 = @simp.asm_rewrite_tac(@list.List([]))
  let t51 = @term_syntax.parse_term("EXP(2, (n : Num))")
  let t52 = @bool.specl(
    @list.List([@term_syntax.parse_term("(a : Num)"), t51]),
    @arith.lt_cases(),
  )
  let t53 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
    x48 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s49 = @tactics.assume_tac(x48)
    fn(
      x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s49(x50)
    }
  })(t52)
  let t47 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t46 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_mul(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t45 = @simp.rewrite_tac(
    @list.List([
      @real.real_pow_add(),
      @equal.gsym(@analysis.real_sub_ldistrib()),
    ]),
  )
  let t83 = @tactics.then_tac(
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
                                                  @tactics.then_tac(
                                                    @tactics.repeat_tac(
                                                      @tactics.gen_tac,
                                                    ),
                                                    t45,
                                                  ),
                                                  t46,
                                                ),
                                                t47,
                                              ),
                                              t53,
                                            ),
                                            t54,
                                          ),
                                          t55,
                                        ),
                                        t57,
                                      ),
                                      t64,
                                    ),
                                    t65,
                                  ),
                                  t66,
                                ),
                                t67,
                              ),
                              t68,
                            ),
                            t69,
                          ),
                          t70,
                        ),
                        t71,
                      ),
                      t72,
                    ),
                    t73,
                  ),
                  t75,
                ),
                t76,
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
    ),
    t82,
  )
  real_ndiv_lemma1a_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, real_of_num(2) * abs(pow(real_of_num(2), m) * real_of_num(a) - pow(real_of_num(2), m + n)) <= pow(real_of_num(2), m) → real_of_num(a) == pow(real_of_num(2), n)"),
      t83,
    ),
  )
}

///|
let real_ndiv_lemma1a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NDIV_LEMMA1a",
)

///|
/// `REAL_NDIV_LEMMA1a`
pub fn real_ndiv_lemma1a() -> @kernel.Thm {
  real_ndiv_lemma1a_c.get()
}

///|
/// REAL_NDIV_LEMMA1b
fn step_11() -> Unit raise {
  let t103 = @simp.rewrite_tac(
    @list.List([
      @real.real_le_pow2(),
      @real.real_le_addl(),
      @analysis.real_pos(),
    ]),
  )
  let t102 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num))"))
  let t104 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t102),
    t103,
  )
  let t101 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t100 = @tactics.match_mp_tac(@real.real_pow_le())
  let t99 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t105 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_mul()), t99),
        t100,
      ),
      t101,
    ),
    t104,
  ])
  let t98 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t106 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
        t98,
      ),
      @tactics.conj_tac,
    ),
    t105,
  )
  let t97 = @simp.rewrite_tac(
    @list.List([@real.real_lt_addr(), @real.real_lt_pow2()]),
  )
  let t107 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@analysis.real_mul_rid(), @real.real_mul_2()]),
      ),
      t97,
    ),
    t106,
  ])
  let t96 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * pow(real_of_num(2), (m : Num)) * real_of_num(1)"))
  let t95 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t94 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_abs(), @analysis.real_not_le()]),
  )
  let t108 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@real.real_abs_pow(), @calc_int.real_abs_num()]),
            ),
            t94,
          ),
          t95,
        ),
        t96,
      ),
      @tactics.conj_tac,
    ),
    t107,
  )
  let t93 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t92 = @tactics.match_mp_tac(@real.real_pow_le())
  let t91 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t109 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), t91),
        t92,
      ),
      t93,
    ),
    t108,
  ])
  let t90 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= real_of_num((a : Num)) + pow(real_of_num(2), (n : Num))"), fn(
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
    let s88 = @tactics.assume_tac(x87)
    fn(
      x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s88(x89)
    }
  })
  let t86 = @simp.rewrite_tac(
    @list.List([@real.real_abs_mul(), @equal.gsym(@realax.real_add_ldistrib())]),
  )
  let t85 = @simp.rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @real.real_pow_add()]),
  )
  let t84 = @simp.rewrite_tac(
    @list.List([@realax.real_sub(), @equal.gsym(@analysis.real_neg_add())]),
  )
  let t110 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t84),
          t85,
        ),
        t86,
      ),
      t90,
    ),
    t109,
  )
  real_ndiv_lemma1b_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(real_of_num(2) * abs(-(pow(real_of_num(2), m) * real_of_num(a)) - pow(real_of_num(2), m + n)) <= pow(real_of_num(2), m))"),
      t110,
    ),
  )
}

///|
let real_ndiv_lemma1b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NDIV_LEMMA1b",
)

///|
/// `REAL_NDIV_LEMMA1b`
pub fn real_ndiv_lemma1b() -> @kernel.Thm {
  real_ndiv_lemma1b_c.get()
}

///|
/// REAL_NDIV_LEMMA2
fn step_12() -> Unit raise {
  let t136 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t133 = @drule.match_mp(real_ndiv_lemma1a())
  let t135 = @tactics.disch_then(fn(
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
      let s131 = @tactics.subst1_tac(x130)
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
  let t129 = @simp.rewrite_tac(@list.List([real_ndiv_lemma1b()]))
  let t128 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_abs_neg(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
      @analysis.real_neg_neg(),
    ]),
  )
  let t127 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]),
  )
  let t125 = @calc_rat.real_arith(
    @term_syntax.parse_term("(a : Real) == abs(a) || a == -abs(a)"),
  )
  let t126 = @tactics.disj_cases_then(fn(
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
    let s123 = @tactics.subst1_tac(x122)
    fn(
      x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s123(x124)
    }
  })(t125)
  let t121 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x115 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s116 = @tactics.assume_tac(x115)
        fn(
          x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s116(x117)
        }
      },
      fn(
        x118 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s119 = @tactics.mp_tac(x118)
        fn(
          x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s119(x120)
        }
      },
    ),
  )
  let t114 = @tactics.disch_then(
    @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(
      x111 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s112 = @tactics.mp_tac(x111)
      fn(
        x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s112(x113)
      }
    }),
  )
  let t137 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114),
                t121,
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
    t136,
  )
  real_ndiv_lemma2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ m : Num, ∀ n : Num, (∃ k : Num, b == real_of_num(k) || b == -real_of_num(k)) && abs(a) == pow(real_of_num(2), m) && real_of_num(2) * abs(a * b - pow(real_of_num(2), m + n)) <= abs(a) → a * b == pow(real_of_num(2), m + n)"),
      t137,
    ),
  )
}

///|
let real_ndiv_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NDIV_LEMMA2",
)

///|
/// `REAL_NDIV_LEMMA2`
pub fn real_ndiv_lemma2() -> @kernel.Thm {
  real_ndiv_lemma2_c.get()
}

///|
/// REAL_NDIV_LEMMA3
fn step_13() -> Unit raise {
  let t152 = @simp.rewrite_tac(@list.List([real_ndiv_lemma2()]))
  let t148 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t149 = @tactics.choose_then(fn(
    x145 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s146 = @tactics.subst1_tac(x145)
    fn(
      x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s146(x147)
    }
  })
  let t151 = @tactics.pop_assum(fn(
    x150 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t149(t148(x150))
  })
  let t144 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x138 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s139 = @tactics.assume_tac(x138)
        fn(
          x140 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s139(x140)
        }
      },
      fn(
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
        let s142 = @tactics.mp_tac(x141)
        fn(
          x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s142(x143)
        }
      },
    ),
  )
  let t153 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t144),
      t151,
    ),
    t152,
  )
  real_ndiv_lemma3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ m : Num, ∀ n : Num, m <= n && (∃ k : Num, b == real_of_num(k) || b == -real_of_num(k)) && abs(a) == pow(real_of_num(2), m) && real_of_num(2) * abs(a * b - pow(real_of_num(2), n)) <= abs(a) → a * b == pow(real_of_num(2), n)"),
      t153,
    ),
  )
}

///|
let real_ndiv_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NDIV_LEMMA3",
)

///|
/// `REAL_NDIV_LEMMA3`
pub fn real_ndiv_lemma3() -> @kernel.Thm {
  real_ndiv_lemma3_c.get()
}

///|
/// log2
fn step_14() -> Unit raise {
  fn log2_1(x154 : @num.Num, x155 : @num.Num) -> @num.Num raise {
    let x = x154
    let y = x155
    if @num.lt_num(x, @num.num_of_int64(1L)) {
      y
    } else {
      let t156 = @num.add_num(y, @num.num_of_int64(1L))
      log2_1(@num.quo_num(x, @num.num_of_int64(2L)), t156)
    }
  }
  log2_c.set(fn(x157 : @num.Num) -> @num.Num raise {
    let x_1 = x157
    let t158 = @num.num_of_int64(0L)
    log2_1(@num.sub_num(x_1, @num.num_of_int64(1L)), t158)
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
/// REALCALC_DOWNGRADE
fn step_15() -> Unit raise {
  let t189 = @simp.rewrite_tac(
    @list.List([
      @realax.real_pow(),
      @equal.gsym(@real.real_mul_2()),
      @analysis.real_le_refl(),
    ]),
  )
  let t187 = @simp.asm_rewrite_tac(@list.List([]))
  let t188 = @list.List([
    @calc_rat.real_arith_tac,
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_add2()), t187),
  ])
  let t186 = @simp.rewrite_tac(@list.List([@real.real_mul_2()]))
  let t185 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + real_of_num(1)"))
  let t184 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t183 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @analysis.real_le_refl()]),
  )
  let t181 = @term_syntax.parse_term("(d0 : Num)")
  let t182 = @tactics.spec_tac(@term_syntax.parse_term("(d0 : Num)"), t181)
  let t180 = @simp.asm_rewrite_tac(@list.List([]))
  let t179 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t178 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add())]),
  )
  let t177 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t176 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t175 = @simp.asm_rewrite_tac(@list.List([]))
  let t174 = @tactics.match_mp_tac(@analysis.real_lte_add2())
  let t173 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real)"))
  let t190 = @list.List([
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
                                    @tactics.match_mp_tac(
                                      real_abs_triangle_lemma(),
                                    ),
                                    t173,
                                  ),
                                  t174,
                                ),
                                t175,
                              ),
                              t176,
                            ),
                            t177,
                          ),
                          t178,
                        ),
                        t179,
                      ),
                      t180,
                    ),
                    t182,
                  ),
                  @nums.induct_tac,
                ),
                t183,
              ),
              t184,
            ),
            t185,
          ),
          t186,
        ),
        @tactics.conj_tac,
      ),
      t188,
    ),
    t189,
  ])
  let t172 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (d0 : Num)) + pow(real_of_num(2), d0)"))
  let t171 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t191 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              real_abs_lemma(),
              @analysis.real_mul_rid(),
              @analysis.real_sub_ldistrib(),
            ]),
          ),
          t171,
        ),
        t172,
      ),
      @tactics.conj_tac,
    ),
    t190,
  )
  let t192 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@real.real_pow_lt()),
      @calc_rat.real_arith_tac,
    ),
    t191,
  ])
  let t170 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), SUC((d0 : Num)))"))
  let t169 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t168 = @tactics.repeat_tac(@tactics.disch_tac)
  let t167 = @tactics.disch_then(fn(
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
    (fn(
      x163 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s164 = @tactics.subst1_tac(x163)
      fn(
        x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s164(x165)
      }
    })(@equal.sym(x166))
  })
  let t193 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(fn(
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
                (fn(
                  x159 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s160 = @tactics.subst1_tac(x159)
                  fn(
                    x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s160(x161)
                  }
                })(@equal.sym(x162))
              }),
              t167,
            ),
            t168,
          ),
          t169,
        ),
        t170,
      ),
      @tactics.conj_tac,
    ),
    t192,
  )
  realcalc_downgrade_c.set(
    @tactics.prove(
      @term_syntax.parse_term("SUC((d0 : Num)) == (d : Num) → (n : Num) + d == (n0 : Num) → abs((a : Real) - pow(real_of_num(2), n0) * (x : Real)) < real_of_num(1) → abs(pow(real_of_num(2), d) * (b : Real) - a) <= pow(real_of_num(2), d0) → abs(b - pow(real_of_num(2), n) * x) < real_of_num(1)"),
      t193,
    ),
  )
}

///|
let realcalc_downgrade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REALCALC_DOWNGRADE",
)

///|
/// `REALCALC_DOWNGRADE`
pub fn realcalc_downgrade() -> @kernel.Thm {
  realcalc_downgrade_c.get()
}

///|
/// REALCALC_INT
fn step_16() -> Unit raise {
  let t194 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_sub_refl(),
      @real.real_abs_0(),
      @analysis.real_lt_01(),
    ]),
  )
  realcalc_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs(pow(real_of_num(2), (n : Num)) * (a : Real) - pow(real_of_num(2), n) * a) < real_of_num(1)"),
      t194,
    ),
  )
}

///|
let realcalc_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_INT")

///|
/// `REALCALC_INT`
pub fn realcalc_int() -> @kernel.Thm {
  realcalc_int_c.get()
}

///|
/// REALCALC_NEG
fn step_17() -> Unit raise {
  let t195 = @simp.rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @calc_int.real_mul_rneg()]),
  )
  let t196 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@realax.real_sub(), @equal.gsym(@analysis.real_neg_add())]),
    ),
    t195,
  )
  realcalc_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) → abs(-a - pow(real_of_num(2), n) * -x) < real_of_num(1)"),
      t196,
    ),
  )
}

///|
let realcalc_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_NEG")

///|
/// `REALCALC_NEG`
pub fn realcalc_neg() -> @kernel.Thm {
  realcalc_neg_c.get()
}

///|
/// REALCALC_ABS
fn step_18() -> Unit raise {
  let t199 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_sub_abs()]))
  let t198 = @tactics.exists_tac(@term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real))"))
  let t197 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t200 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @simp.rewrite_tac(@list.List([real_abs_lemma()])),
        ),
        t197,
      ),
      t198,
    ),
    t199,
  )
  realcalc_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) → abs(abs(a) - pow(real_of_num(2), n) * abs(x)) < real_of_num(1)"),
      t200,
    ),
  )
}

///|
let realcalc_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_ABS")

///|
/// `REALCALC_ABS`
pub fn realcalc_abs() -> @kernel.Thm {
  realcalc_abs_c.get()
}

///|
/// REALCALC_INV_LEMMA
fn step_19() -> Unit raise {
  let lemma1 = @calc_rat.real_arith(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ b : Real, real_of_num(2) * abs(x - y) <= b && real_of_num(2) * abs(y - z) < b → real_of_num(2) * abs(x - z) < real_of_num(2) * b"),
  )
  let lemma2 = @calc_rat.real_arith(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x + real_of_num(1) <= abs(z) && abs(z - y) < real_of_num(1) → x <= abs(y)"),
  )
  let lemma3 = @calc_rat.real_arith(
    @term_syntax.parse_term("(abs((x : Real)) <= real_of_num(1) && real_of_num(0) < abs((y : Real)) && abs(y) < real_of_num(1)) && (real_of_num(0) < x → real_of_num(0) <= y) && (x < real_of_num(0) → y <= real_of_num(0)) → abs(x - y) < real_of_num(1)"),
  )
  let lemma4 = @calc_rat.real_arith(
    @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, c <= abs(a) + abs(b) && abs(a - b) < c → (real_of_num(0) < a → real_of_num(0) <= b) && (a < real_of_num(0) → b <= real_of_num(0))"),
  )
  let t552 = @simp.rewrite_tac(@list.List([real_oppsign()]))
  let t550 = @simp.rewrite_tac(
    @list.List([@real.real_le_addr(), @real.real_abs_pos()]),
  )
  let t549 = @simp.rewrite_tac(@list.List([@arith.not_lt(), @arith.le()]))
  let t548 = @tactics.conv_tac(@class.contrapos_conv)
  let t547 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t546 = @tactics.undisch_tac(@term_syntax.parse_term("!(real_of_num((m : Num)) == real_of_num(0))"))
  let t545 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) == real_of_num(0)) == (x == real_of_num(0))")),
      ]),
    ),
  )
  let t544 = @simp.rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t542 = @term_syntax.parse_term("SUC(0)")
  let t543 = @simp.rewrite_tac(
    @list.List([
      @equal.sym(@simp.rewrite_conv(@list.List([@calc_num.arith_suc()]))(t542)),
    ]),
  )
  let t541 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t540 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @calc_int.real_abs_num()]),
  )
  let t539 = @tactics.disch_then(
    @tactics.choose_then(
      @tactics.disj_cases_then(fn(
        x536 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s537 = @tactics.subst_all_tac(x536)
        fn(
          x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s537(x538)
        }
      }),
    ),
  )
  let t551 = @list.List([
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
                          @term_syntax.parse_term("∃ m : Num, (a : Real) == real_of_num(m) || a == -real_of_num(m)"),
                        ),
                        t539,
                      ),
                      t540,
                    ),
                    t541,
                  ),
                  t543,
                ),
                t544,
              ),
              t545,
            ),
            t546,
          ),
          t547,
        ),
        t548,
      ),
      t549,
    ),
    t550,
  ])
  let t535 = @tactics.exists_tac(@term_syntax.parse_term("abs((a : Real))"))
  let t534 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t533 = @simp.asm_rewrite_tac(@list.List([]))
  let t532 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t531 = @tactics.match_mp_tac(lemma4)
  let t530 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_oppsign())]))
  let t528 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)")
  let t529 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t528)]),
  )
  let t527 = @simp.rewrite_tac(
    @list.List([
      @real.real_lt_pow2(),
      @analysis.real_mul_rzero(),
      @realax.real_mul_lid(),
    ]),
  )
  let t526 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (k : Num))"))
  let t525 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t524 = @tactics.first_assum(fn(
    x515 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x515
    @simp.gen_rewrite_tac(
      fn(
        x523 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x517 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s518 = @equal.rand_conv(x517)
          fn(x519 : @kernel.Term) -> @kernel.Thm raise { s518(x519) }
        })(
          (fn(
            x520 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s521 = @equal.land_conv(x520)
            fn(x522 : @kernel.Term) -> @kernel.Thm raise { s521(x522) }
          })(x523),
        )
      },
      @list.List([@drule.match_mp(@realax.real_mul_linv())(th_2)]),
    )
  })
  let t513 = @bool.spec_all(@real.real_lt_pow2())
  let t514 = @simp.rewrite_tac(
    @list.List([@drule.match_mp(@analysis.real_lt_imp_le())(t513)]),
  )
  let t512 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t510 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * ((d : Real) * (e : Real))) == d * (e * a * (c * b))")
  let t511 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t510)]),
  )
  let t509 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rzero()]))
  let t508 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_square()]))
  let t507 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) * x"))
  let t506 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t505 = @simp.asm_rewrite_tac(@list.List([]))
  let t504 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t502 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)")
  let t503 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t502)]),
  )
  let t501 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rzero()]))
  let t500 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_square()]))
  let t499 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) * a"))
  let t553 = @list.List([
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
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.match_mp_tac(
                                                          @real.real_le_lcancel_imp(),
                                                        ),
                                                        t499,
                                                      ),
                                                      t500,
                                                    ),
                                                    t501,
                                                  ),
                                                  t503,
                                                ),
                                                t504,
                                              ),
                                              t505,
                                            ),
                                            t506,
                                          ),
                                          t507,
                                        ),
                                        t508,
                                      ),
                                      t509,
                                    ),
                                    t511,
                                  ),
                                  t512,
                                ),
                                t514,
                              ),
                              t524,
                            ),
                            t525,
                          ),
                          t526,
                        ),
                        t527,
                      ),
                      t529,
                    ),
                    t530,
                  ),
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
        @tactics.conj_tac,
      ),
      t551,
    ),
    t552,
  ])
  let t554 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (b : Real) * (pow(real_of_num(2), (n : Num)) * inv((x : Real)))"), fn(
      x496 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s497 = @tactics.mp_tac(x496)
      fn(
        x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s497(x498)
      }
    }),
    t553,
  )
  let t489 = @simp.asm_rewrite_tac(@list.List([]))
  let t490 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (k : Num)) * (x : Real)) < real_of_num(1)")),
      t489,
    ),
    @calc_rat.real_arith_tac,
  )
  let t488 = @simp.asm_rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t491 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_mono_pow2()), t488),
    t490,
  ])
  let t487 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num))"))
  let t486 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t485 = @simp.rewrite_tac(
    @list.List([
      real_le_suc_pow2(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t484 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t483 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t482 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t481 = @simp.rewrite_tac(
    @list.List([@analysis.real_lt_sub_radd(), @analysis.real_le_sub_ladd()]),
  )
  let t480 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), SUC((n : Num) + (k : Num))) - real_of_num(1)"))
  let t479 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t478 = @simp.rewrite_tac(
    @list.List([@real.real_lt_pow2(), real_abs_lemma()]),
  )
  let t477 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (k : Num))"))
  let t476 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t492 = @tactics.thenl(
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
                                @list.List([@analysis.real_mul_rid()]),
                              ),
                              t476,
                            ),
                            t477,
                          ),
                          t478,
                        ),
                        t479,
                      ),
                      t480,
                    ),
                    t481,
                  ),
                  t482,
                ),
                t483,
              ),
              t484,
            ),
            t485,
          ),
          t486,
        ),
        t487,
      ),
      @tactics.conj_tac,
    ),
    t491,
  )
  let t475 = @simp.asm_rewrite_tac(@list.List([]))
  let t493 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@realax.real_mul_linv()), t475),
    t492,
  ])
  let t474 = @tactics.subgoal_then(@term_syntax.parse_term("inv((x : Real)) * x == real_of_num(1)"), fn(
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
    let s472 = @tactics.subst1_tac(x471)
    fn(
      x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s472(x473)
    }
  })
  let t469 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (c * a)")
  let t470 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t469)]),
  )
  let t467 = @equal.gsym(@real.real_abs_mul())
  let t468 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_nz()), t467]),
  )
  let t466 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t494 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@real.real_lt_lcancel_imp()),
            t466,
          ),
          t468,
        ),
        t470,
      ),
      t474,
    ),
    t493,
  )
  let t465 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t464 = @tactics.match_mp_tac(@analysis.real_lt_imp_nz())
  let t495 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            @equal.gsym(@real.real_abs_nz()),
            @realarith.real_entire(),
            @real.real_inv_eq_0(),
          ]),
        ),
        t464,
      ),
      t465,
    ),
    t494,
  ])
  let t555 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac),
      t495,
    ),
    t554,
  ])
  let t463 = @tactics.match_mp_tac(lemma3)
  let t458 = @equal.gsym(@real.real_abs_mul())
  let t459 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@real.real_abs_nz()),
      t458,
      @analysis.real_mul_rid(),
    ]),
  )
  let t457 = @tactics.exists_tac(@term_syntax.parse_term("abs((a : Real))"))
  let t456 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t460 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t456),
      t457,
    ),
    t459,
  )
  let t454 = @simp.asm_rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t453 = @tactics.match_mp_tac(real_mono_pow2())
  let t452 = @tactics.first_assum(fn(
    x447 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x447
    @simp.gen_rewrite_tac(
      fn(
        x449 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s450 = @equal.rand_conv(x449)
        fn(x451 : @kernel.Term) -> @kernel.Thm raise { s450(x451) }
      },
      @list.List([@equal.sym(th_1)]),
    )
  })
  let t455 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@equal.gsym(@bool.conjunct2(@realax.real_pow()))]),
          ),
          t452,
        ),
        t453,
      ),
      t454,
    ),
    @calc_rat.real_arith_tac,
  ])
  let t446 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(2) * pow(real_of_num(2), (n : Num) + (k : Num)) <= abs((a : Real))"),
    fn(
      x443 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s444 = @tactics.mp_tac(x443)
      fn(
        x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s444(x445)
      }
    },
  )
  let t442 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@realarith.real_entire()])),
    @tactics.all_tac,
  ])
  let t441 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Real) * (b : Real) == real_of_num(0))"), fn(
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
    let s439 = @tactics.mp_tac(x438)
    fn(
      x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s439(x440)
    }
  })
  let t437 = @tactics.undisch_tac(@term_syntax.parse_term("abs((a : Real)) <= abs(a * (b : Real))"))
  let t436 = @tactics.undisch_tac(
    @term_syntax.parse_term("real_of_num(2) * abs((a : Real) * (b : Real) - pow(real_of_num(2), (n : Num) + (k : Num))) <= abs(a)"),
  )
  let t461 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.mp_tac(
                  @bool.spec(
                    @term_syntax.parse_term("(n : Num) + (k : Num)"),
                    @real.real_lt_pow2(),
                  ),
                ),
                t436,
              ),
              t437,
            ),
            t441,
          ),
          t442,
        ),
        t446,
      ),
      t455,
    ),
    t460,
  ])
  let t435 = @tactics.subgoal_then(
    @term_syntax.parse_term("abs((a : Real) * (b : Real)) <= abs(a) && real_of_num(0) <= a * b"),
    fn(
      x432 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s433 = @tactics.assume_tac(x432)
      fn(
        x434 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s433(x434)
      }
    },
  )
  let t428 = @simp.rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t426 = @term_syntax.parse_term("SUC(0)")
  let t427 = @simp.rewrite_tac(
    @list.List([
      @equal.sym(@simp.rewrite_conv(@list.List([@calc_num.arith_suc()]))(t426)),
    ]),
  )
  let t425 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_abs_num(),
      @realax.real_of_num_le(),
      @real.real_of_num_lt(),
    ]),
  )
  let t424 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_nz()]))
  let t429 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(@term_syntax.parse_term("!((b : Real) == real_of_num(0))")),
          t424,
        ),
        t425,
      ),
      t427,
    ),
    t428,
  )
  let t423 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @calc_int.real_abs_num()]),
  )
  let t422 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t421 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.disj_cases_tac),
  )
  let t430 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(
            @term_syntax.parse_term("∃ m : Num, (b : Real) == real_of_num(m) || b == -real_of_num(m)"),
          ),
          t421,
        ),
        t422,
      ),
      t423,
    ),
    t429,
  ])
  let t420 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ q : Num, abs((b : Real)) == real_of_num(q)"),
    @tactics.choose_tac,
  )
  let t419 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t418 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t417 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t431 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x416 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x410 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s411 = @equal.land_conv(x410)
                    fn(x412 : @kernel.Term) -> @kernel.Thm raise { s411(x412) }
                  })(
                    (fn(
                      x413 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s414 = @equal.rand_conv(x413)
                      fn(x415 : @kernel.Term) -> @kernel.Thm raise {
                        s414(x415)
                      }
                    })(x416),
                  )
                },
                @list.List([@equal.gsym(@analysis.real_mul_rid())]),
              ),
              t417,
            ),
            t418,
          ),
          t419,
        ),
        t420,
      ),
      t430,
    ),
    @tactics.all_tac,
  ])
  let t409 = @tactics.subgoal_then(@term_syntax.parse_term("abs((a : Real)) <= abs(a * (b : Real))"), fn(
    x406 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s407 = @tactics.assume_tac(x406)
    fn(
      x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s407(x408)
    }
  })
  let t405 = @simp.asm_rewrite_tac(
    @list.List([
      @real.real_abs_0(),
      @analysis.real_mul_rzero(),
      @analysis.real_pos(),
    ]),
  )
  let t462 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @class.asm_cases_tac(@term_syntax.parse_term("(b : Real) == real_of_num(0)")),
              t405,
            ),
            t409,
          ),
          t431,
        ),
        t435,
      ),
      t461,
    ),
    @tactics.all_tac,
  ])
  let t556 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("abs((b : Real)) <= real_of_num(1) && real_of_num(0) <= (a : Real) * b"),
            @tactics.strip_assume_tac,
          ),
          t462,
        ),
        t463,
      ),
      @tactics.conj_tac,
    ),
    t555,
  )
  let t401 = @tactics.then_tac(
    @simp.asm_rewrite_tac(@list.List([])),
    @calc_rat.real_arith_tac,
  )
  let t400 = @simp.asm_rewrite_tac(@list.List([]))
  let t399 = @tactics.match_mp_tac(@real.real_let_imp(@real.real_abs_sub_abs()))
  let t402 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([real_abs_lemma()])), t399),
      t400,
    ),
    t401,
  ])
  let t398 = @tactics.subgoal_then(
    @term_syntax.parse_term("abs(abs((a : Real)) - pow(real_of_num(2), (k : Num)) * abs((x : Real))) < real_of_num(1)"),
    fn(
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
      let s396 = @tactics.mp_tac(x395)
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
    },
  )
  let t394 = @simp.rewrite_tac(@list.List([real_le_suc_pow2()]))
  let t393 = @simp.rewrite_tac(
    @list.List([@analysis.real_le_sub_radd(), @analysis.real_le_sub_ladd()]),
  )
  let t392 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), SUC((d : Num))) - real_of_num(1)"))
  let t391 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t390 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t389 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t403 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @realax.real_pow(),
                      @equal.gsym(@realax.real_mul_assoc()),
                    ]),
                  ),
                  t389,
                ),
                t390,
              ),
              t391,
            ),
            t392,
          ),
          t393,
        ),
        t394,
      ),
      t398,
    ),
    t402,
  )
  let t388 = @simp.rewrite_tac(
    @list.List([@nums.suc_inj(), @equal.gsym(@theorems.exists_refl())]),
  )
  let t387 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.add_clauses(),
      @arith.le(),
      @nums.not_suc(),
    ]),
  )
  let t385 = @term_syntax.parse_term("(e : Num)")
  let t386 = @tactics.spec_tac(@term_syntax.parse_term("(e : Num)"), t385)
  let t404 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.undisch_tac(@term_syntax.parse_term("SUC((n : Num) + (k : Num)) <= 2 * (e : Num)")),
            t386,
          ),
          @nums.induct_tac,
        ),
        t387,
      ),
      t388,
    ),
    t403,
  ])
  let t383 = @tactics.choose_then(fn(
    x380 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s381 = @tactics.subst_all_tac(x380)
    fn(
      x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s381(x382)
    }
  })
  let t384 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Num, (e : Num) == SUC(d)"), t383)
  let t379 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t378 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t374 = @bool.spec_all(@real.real_lt_pow2())
  let t375 = @simp.rewrite_tac(
    @list.List([@drule.match_mp(@analysis.real_lt_imp_le())(t374)]),
  )
  let t373 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t372 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_2(),
      @real.real_pow_add(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t376 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.subst1_tac(
          @equal.sym(
            @kernel.assume_rule(@term_syntax.parse_term("pow(real_of_num(2), (e : Num)) == abs((a : Real))")),
          ),
        ),
        t372,
      ),
      t373,
    ),
    t375,
  )
  let t371 = @simp.asm_rewrite_tac(@list.List([]))
  let t370 = @tactics.match_mp_tac(real_mono_pow2())
  let t377 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@equal.gsym(@real.real_pow_add()), @arith.add_clauses()]),
        ),
        t370,
      ),
      t371,
    ),
    t376,
  ])
  let t369 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), 2 * (e : Num))"))
  let t368 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t365 = @simp.rewrite_tac(
    @list.List([@analysis.real_mul_rid(), @real.real_lt_pow2()]),
  )
  let t364 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), SUC((k : Num)))"))
  let t366 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_rcancel_imp()), t364),
    t365,
  )
  let t363 = @simp.asm_rewrite_tac(
    @list.List([@real.real_lt_pow2(), @analysis.real_mul_rid()]),
  )
  let t362 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t367 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@real.real_abs_pow(), @calc_int.real_abs_num()]),
        ),
        t362,
      ),
      t363,
    ),
    t366,
  ])
  let t361 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * real_of_num(1)"))
  let t360 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t359 = @simp.once_rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t357 = @kernel.assume_rule(@term_syntax.parse_term("!((x : Real) == real_of_num(0))"))
  let t358 = @simp.rewrite_tac(
    @list.List([@drule.match_mp(@realax.real_mul_linv())(t357)]),
  )
  let t356 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_sub_rdistrib(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t355 = @simp.gen_rewrite_tac(
    fn(
      x354 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x348 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s349 = @equal.land_conv(x348)
        fn(x350 : @kernel.Term) -> @kernel.Thm raise { s349(x350) }
      })(
        (fn(
          x351 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s352 = @equal.rand_conv(x351)
          fn(x353 : @kernel.Term) -> @kernel.Thm raise { s352(x353) }
        })(x354),
      )
    },
    @list.List([@equal.gsym(@real.real_abs_mul())]),
  )
  let t346 = @equal.gsym(@realax.real_mul_assoc())
  let t347 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_nz()), t346]),
  )
  let t345 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t344 = @tactics.match_mp_tac(@real.real_lt_rcancel_imp())
  let t343 = @simp.rewrite_tac(
    @list.List([@real.real_abs_mul(), @analysis.real_mul_rid()]),
  )
  let t342 = @simp.rewrite_tac(
    @list.List([
      @real.real_pow_add(),
      @equal.gsym(@analysis.real_sub_ldistrib()),
    ]),
  )
  let t340 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)")
  let t341 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t340)]),
  )
  let t339 = @simp.asm_rewrite_tac(@list.List([@analysis.real_sub_ldistrib()]))
  let t337 = @equal.gsym(@real.real_abs_mul())
  let t338 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_nz()), t337]),
  )
  let t336 = @tactics.exists_tac(@term_syntax.parse_term("abs((a : Real))"))
  let t335 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t333 = @simp.asm_rewrite_tac(@list.List([]))
  let t332 = @tactics.exists_tac(@term_syntax.parse_term("(e : Num)"))
  let t334 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(real_ndiv_lemma3()), t332),
      t333,
    ),
    @tactics.all_tac,
  ])
  let t557 = @list.List([
    @tactics.thenl(
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
                                                            @term_syntax.parse_term("(a : Real) * (b : Real) == pow(real_of_num(2), (n : Num) + (k : Num))"),
                                                            fn(
                                                              x329 : @kernel.Thm,
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
                                                              let s330 = @tactics.assume_tac(
                                                                x329,
                                                              )
                                                              fn(
                                                                x331 : (
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
                                                                s330(x331)
                                                              }
                                                            },
                                                          ),
                                                          t334,
                                                        ),
                                                        t335,
                                                      ),
                                                      t336,
                                                    ),
                                                    t338,
                                                  ),
                                                  t339,
                                                ),
                                                t341,
                                              ),
                                              t342,
                                            ),
                                            t343,
                                          ),
                                          t344,
                                        ),
                                        t345,
                                      ),
                                      t347,
                                    ),
                                    t355,
                                  ),
                                  t356,
                                ),
                                t358,
                              ),
                              t359,
                            ),
                            t360,
                          ),
                          t361,
                        ),
                        @tactics.conj_tac,
                      ),
                      t367,
                    ),
                    t368,
                  ),
                  t369,
                ),
                @tactics.conj_tac,
              ),
              t377,
            ),
            t378,
          ),
          t379,
        ),
        t384,
      ),
      t404,
    ),
    t556,
  ])
  let t328 = @term_syntax.parse_term("(n : Num) + (k : Num)")
  let t558 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.disj_cases_tac(
        @bool.specl(
          @list.List([@term_syntax.parse_term("(e : Num)"), t328]),
          @arith.let_cases(),
        ),
      ),
    ),
    t557,
  )
  let t321 = @simp.asm_rewrite_tac(@list.List([]))
  let t320 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num)) + real_of_num(1)"))
  let t322 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t320),
      t321,
    ),
    @calc_rat.real_arith_tac,
  )
  let t319 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t323 = @tactics.then_tac(
    @tactics.match_mp_tac(@analysis.real_lt_imp_le()),
    t319,
  )
  let t318 = @simp.asm_rewrite_tac(@list.List([]))
  let t317 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real)"))
  let t316 = @tactics.match_mp_tac(lemma2)
  let t324 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([real_abs_lemma()])), t316),
      t317,
    ),
    t318,
  )
  let t315 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t325 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_lt_imp_le()), t315),
    t324,
    t323,
    t322,
  ])
  let t314 = @tactics.repeat_tac(@tactics.conj_tac)
  let t326 = @tactics.thenl(
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_mul2()), t314),
    t325,
  )
  let t313 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
  let t312 = @tactics.match_mp_tac(real_mono_pow2())
  let t310 = @equal.gsym(@bool.conjunct2(@realax.real_pow()))
  let t311 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_pow_add()), t310]),
  )
  let t309 = @term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == c * (b * a)")
  let t327 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(
            @list.List([@theorems.ac(@real.real_mul_ac())(t309)]),
          ),
          t311,
        ),
        t312,
      ),
      t313,
    ),
    t326,
  ])
  let t308 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num)) * pow(real_of_num(2), e)"))
  let t307 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t306 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_mul(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t304 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == a * c * b")
  let t305 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t304)]),
  )
  let t303 = @simp.rewrite_tac(
    @list.List([
      @real.real_lt_pow2(),
      @analysis.real_mul_rid(),
      real_abs_lemma(),
    ]),
  )
  let t302 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (k : Num))"))
  let t301 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t297 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t296 = @tactics.first_assum(fn(
    x294 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x294
    @simp.rewrite_tac(
      @list.List([@drule.match_mp(@analysis.real_mul_rinv())(th)]),
    )
  })
  let t293 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t292 = @simp.gen_rewrite_tac(
    fn(
      x291 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x287 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x281 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s282 = @equal.land_conv(x281)
          fn(x283 : @kernel.Term) -> @kernel.Thm raise { s282(x283) }
        })(
          (fn(
            x284 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s285 = @equal.rand_conv(x284)
            fn(x286 : @kernel.Term) -> @kernel.Thm raise { s285(x286) }
          })(x287),
        )
      })(
        (fn(
          x288 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s289 = @equal.land_conv(x288)
          fn(x290 : @kernel.Term) -> @kernel.Thm raise { s289(x290) }
        })(x291),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t280 = @simp.once_rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t298 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@analysis.real_sub_rdistrib()])),
            t280,
          ),
          t292,
        ),
        t293,
      ),
      t296,
    ),
    t297,
  )
  let t279 = @simp.rewrite_tac(@list.List([]))
  let t278 = @tactics.conv_tac(
    @equal.rand_conv(@equal.land_conv(@calc_int.real_int_eq_conv)),
  )
  let t299 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@equal.gsym(@real.real_abs_nz()), @real.real_pow_eq_0()]),
        ),
        t278,
      ),
      t279,
    ),
    t298,
  ])
  let t277 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t300 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.match_mp_tac(@real.real_lt_lmul()),
              @tactics.conj_tac,
            ),
            @list.List([@calc_rat.real_arith_tac, @tactics.all_tac]),
          ),
          t277,
        ),
        @tactics.conj_tac,
      ),
      t299,
    ),
    @tactics.all_tac,
  ])
  let t276 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * (abs(pow(real_of_num(2), (n : Num))) * real_of_num(1))"))
  let t275 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t274 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_mul())]),
  )
  let t273 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t272 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_nz())]),
  )
  let t271 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t270 = @tactics.match_mp_tac(@real.real_lt_rcancel_imp())
  let t269 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@analysis.real_sub_ldistrib()),
      @real.real_abs_mul(),
    ]),
  )
  let t268 = @simp.rewrite_tac(
    @list.List([@real.real_pow_add(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t267 = @simp.gen_rewrite_tac(
    fn(
      x266 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x259 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s260 = @equal.land_conv(x259)
        fn(x261 : @kernel.Term) -> @kernel.Thm raise { s260(x261) }
      })(
        ((x265 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            3,
            fn(
              x262 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s263 = @equal.rand_conv(x262)
              fn(x264 : @kernel.Term) -> @kernel.Thm raise { s263(x264) }
            },
            x265,
          )
        })(x266),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t256 = @simp.asm_rewrite_tac(@list.List([]))
  let t255 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num) + (k : Num))"))
  let t254 = @tactics.match_mp_tac(lemma1)
  let t253 = @simp.rewrite_tac(
    @list.List([@analysis.real_sub_ldistrib(), @analysis.real_mul_rid()]),
  )
  let t252 = @equal.gsym(@real.real_abs_mul())
  let t257 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@equal.gsym(@realax.real_mul_assoc()), t252]),
          ),
          t253,
        ),
        t254,
      ),
      t255,
    ),
    t256,
  )
  let t251 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_nz())]),
  )
  let t258 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t251),
      @calc_rat.real_arith_tac,
    ),
    t257,
  ])
  let t250 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * abs((a : Real))"))
  let t559 = @list.List([
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
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.thenl(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.disch_tac,
                                                      @tactics.match_mp_tac(
                                                        @real.real_lt_lcancel_imp(),
                                                      ),
                                                    ),
                                                    t250,
                                                  ),
                                                  @tactics.conj_tac,
                                                ),
                                                t258,
                                              ),
                                              t267,
                                            ),
                                            t268,
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
                          ),
                          @tactics.conj_tac,
                        ),
                        t300,
                      ),
                      t301,
                    ),
                    t302,
                  ),
                  t303,
                ),
                t305,
              ),
              t306,
            ),
            t307,
          ),
          t308,
        ),
        @tactics.conj_tac,
      ),
      t327,
    ),
    t558,
  ])
  let t249 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x246 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s247 = @tactics.mp_tac(x246)
      fn(
        x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s247(x248)
      }
    }),
  )
  let t243 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t244 = @tactics.then_tac(
    @tactics.undisch_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num)) <= abs((a : Real))")),
    t243,
  )
  let t240 = @equal.gsym(@calc_int.real_of_num_pow())
  let t241 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_le()), t240]),
  )
  let t238 = @equal.gsym(@arith.le_lt())
  let t239 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.add1()), @arith.le_suc_lt(), t238]),
  )
  let t237 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_add(),
      @realax.real_of_num_le(),
      @realax.real_of_num_eq(),
    ]),
  )
  let t236 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@calc_int.real_abs_neg(), @calc_int.real_abs_num()]),
    ),
  )
  let t235 = @simp.rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @calc_int.real_abs_num()]),
  )
  let t234 = @tactics.first_assum(
    @tactics.choose_then(
      @tactics.disj_cases_then(fn(
        x231 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s232 = @tactics.subst_all_tac(x231)
        fn(
          x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s232(x233)
        }
      }),
    ),
  )
  let t245 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])),
                t234,
              ),
              t235,
            ),
            t236,
          ),
          t237,
        ),
        t239,
      ),
      t241,
    ),
    t244,
  ])
  let t230 = @tactics.subgoal_then(
    @term_syntax.parse_term("pow(real_of_num(2), (e : Num)) + real_of_num(1) <= abs((a : Real)) || pow(real_of_num(2), e) == abs(a)"),
    fn(
      x227 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s228 = @tactics.mp_tac(x227)
      fn(
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
        s228(x229)
      }
    },
  )
  let t225 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow2()]))
  let t224 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num))"))
  let t223 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t222 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_rzero(),
      @analysis.real_sub_rzero(),
      @analysis.real_not_lt(),
    ]),
  )
  let t221 = @tactics.undisch_tac(
    @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (k : Num)) * real_of_num(0)) < real_of_num(1)"),
  )
  let t226 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(fn(
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
                let s219 = @tactics.subst_all_tac(x218)
                fn(
                  x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s219(x220)
                }
              }),
              t221,
            ),
            t222,
          ),
          t223,
        ),
        t224,
      ),
      t225,
    ),
    @tactics.all_tac,
  ])
  let t217 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Real) == real_of_num(0))"), fn(
    x214 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s215 = @tactics.assume_tac(x214)
    fn(
      x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s215(x216)
    }
  })
  let t212 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_0(),
      @equal.gsym(@analysis.real_not_lt()),
      @real.real_lt_pow2(),
    ]),
  )
  let t211 = @tactics.undisch_tac(@term_syntax.parse_term("pow(real_of_num(2), (e : Num)) <= abs(real_of_num(0))"))
  let t213 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
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
          let s209 = @tactics.subst_all_tac(x208)
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
        }),
        t211,
      ),
      t212,
    ),
    @tactics.all_tac,
  ])
  let t207 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Real) == real_of_num(0))"), fn(
    x204 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s205 = @tactics.assume_tac(x204)
    fn(
      x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s205(x206)
    }
  })
  let t560 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.disch_then(
                    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
                      x201 : @kernel.Thm,
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
                      let s202 = @tactics.assume_tac(x201)
                      fn(
                        x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s202(x203)
                      }
                    }),
                  ),
                  t207,
                ),
                t213,
              ),
              t217,
            ),
            t226,
          ),
          t230,
        ),
        t245,
      ),
      t249,
    ),
    t559,
  )
  realcalc_inv_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ m : Num, (b : Real) == real_of_num(m) || b == -real_of_num(m)) && (∃ m : Num, (a : Real) == real_of_num(m) || a == -real_of_num(m)) && SUC((n : Num) + (k : Num)) <= 2 * (e : Num) && pow(real_of_num(2), e) <= abs(a) && abs(a - pow(real_of_num(2), k) * (x : Real)) < real_of_num(1) && real_of_num(2) * abs(a * b - pow(real_of_num(2), n + k)) <= abs(a) → abs(b - pow(real_of_num(2), n) * inv(x)) < real_of_num(1)"),
      t560,
    ),
  )
}

///|
let realcalc_inv_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REALCALC_INV_LEMMA",
)

///|
/// `REALCALC_INV_LEMMA`
pub fn realcalc_inv_lemma() -> @kernel.Thm {
  realcalc_inv_lemma_c.get()
}

///|
/// REALCALC_INV
fn step_20() -> Unit raise {
  let t562 = @simp.asm_rewrite_tac(@list.List([]))
  let t561 = @tactics.match_mp_tac(realcalc_inv_lemma())
  let t563 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t561),
    t562,
  )
  realcalc_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (k : Num)) * (x : Real)) < real_of_num(1) → (∃ m : Num, a == real_of_num(m) || a == -real_of_num(m)) → (∃ m : Num, (b : Real) == real_of_num(m) || b == -real_of_num(m)) → SUC((n : Num) + k) <= 2 * (e : Num) → pow(real_of_num(2), e) <= abs(a) → real_of_num(2) * abs(a * b - pow(real_of_num(2), n + k)) <= abs(a) → abs(b - pow(real_of_num(2), n) * inv(x)) < real_of_num(1)"),
      t563,
    ),
  )
}

///|
let realcalc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_INV")

///|
/// `REALCALC_INV`
pub fn realcalc_inv() -> @kernel.Thm {
  realcalc_inv_c.get()
}

///|
/// REALCALC_ADD
fn step_21() -> Unit raise {
  let t591 = @simp.asm_rewrite_tac(@list.List([]))
  let t590 = @tactics.match_mp_tac(@analysis.real_lt_add2())
  let t589 = @tactics.match_mp_tac(
    @real.real_let_imp(@real.real_abs_triangle()),
  )
  let t588 = @simp.gen_rewrite_tac(
    fn(
      x585 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s586 = @equal.rand_conv(x585)
      fn(x587 : @kernel.Term) -> @kernel.Thm raise { s586(x587) }
    },
    @list.List([
      @equal.sym(@calc_int.real_int_reduce_conv(@term_syntax.parse_term("real_of_num(1) + real_of_num(1)"))),
    ]),
  )
  let t584 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(x : Real) + (y : Real) - (a : Real) * ((u : Real) + (v : Real)) == x - a * u + (y - a * v)"),
      ),
    ]),
  )
  let t583 = @simp.asm_rewrite_tac(@list.List([]))
  let t582 = @tactics.match_mp_tac(@analysis.real_lte_add2())
  let t581 = @simp.gen_rewrite_tac(
    fn(
      x578 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s579 = @equal.rand_conv(x578)
      fn(x580 : @kernel.Term) -> @kernel.Thm raise { s579(x580) }
    },
    @list.List([
      @equal.sym(@calc_int.real_int_reduce_conv(@term_syntax.parse_term("real_of_num(2) + real_of_num(2)"))),
    ]),
  )
  let t577 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) + (b : Real)"))
  let t576 = @tactics.match_mp_tac(real_abs_triangle_lemma())
  let t575 = @tactics.subst1_tac(
    @calc_int.real_int_reduce_conv(@term_syntax.parse_term("pow(real_of_num(2), 2)")),
  )
  let t574 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t573 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add())]),
  )
  let t572 = @simp.rewrite_tac(
    @list.List([
      real_abs_lemma(),
      @analysis.real_sub_ldistrib(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t571 = @tactics.conv_tac(@equal.land_conv(@calc_int.real_int_reduce_conv))
  let t570 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), 2)"))
  let t569 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t568 = @tactics.repeat_tac(@tactics.disch_tac)
  let t592 = @tactics.then_tac(
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
                                      @tactics.disch_then(fn(
                                        x567 : @kernel.Thm,
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
                                          x564 : @kernel.Thm,
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
                                        ) raise) raise {
                                          let s565 = @tactics.subst_all_tac(
                                            x564,
                                          )
                                          fn(
                                            x566 : (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ) -> (
                                            (
                                              @list.List[@kernel.Term],
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
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
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
                                            ],
                                            (
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
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
                                            s565(x566)
                                          }
                                        })(@equal.sym(x567))
                                      }),
                                      t568,
                                    ),
                                    t569,
                                  ),
                                  t570,
                                ),
                                t571,
                              ),
                              t572,
                            ),
                            t573,
                          ),
                          t574,
                        ),
                        t575,
                      ),
                      t576,
                    ),
                    t577,
                  ),
                  t581,
                ),
                t582,
              ),
              t583,
            ),
            t584,
          ),
          t588,
        ),
        t589,
      ),
      t590,
    ),
    t591,
  )
  realcalc_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(n : Num) + 2 == (n' : Num) → abs((a : Real) - pow(real_of_num(2), n') * (x : Real)) < real_of_num(1) → abs((b : Real) - pow(real_of_num(2), n') * (y : Real)) < real_of_num(1) → abs(real_of_num(4) * (c : Real) - (a + b)) <= real_of_num(2) → abs(c - pow(real_of_num(2), n) * (x + y)) < real_of_num(1)"),
      t592,
    ),
  )
}

///|
let realcalc_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_ADD")

///|
/// `REALCALC_ADD`
pub fn realcalc_add() -> @kernel.Thm {
  realcalc_add_c.get()
}

///|
/// REALCALC_MUL
fn step_22() -> Unit raise {
  let t664 = @simp.asm_rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t657 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t658 = @tactics.then_tac(
    @tactics.match_mp_tac(@real.real_lt_mul2()),
    t657,
  )
  let t656 = @simp.asm_rewrite_tac(@list.List([]))
  let t655 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t654 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t659 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t654),
        t655,
      ),
      t656,
    ),
    t658,
  ])
  let t660 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(@real.real_let_add2()),
      @tactics.conj_tac,
    ),
    t659,
  )
  let t653 = @simp.asm_rewrite_tac(@list.List([]))
  let t652 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t651 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t661 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t651),
        t652,
      ),
      t653,
    ),
    t660,
  ])
  let t662 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(@real.real_let_add2()),
      @tactics.conj_tac,
    ),
    t661,
  )
  let t663 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul())])),
      @calc_rat.real_arith_tac,
    ),
    t662,
  ])
  let t650 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((a : Real)) * abs((e : Real)) + (abs((b : Real)) * abs((d : Real)) + abs(d) * abs(e))"),
  )
  let t649 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t648 = @simp.rewrite_tac(@list.List([]))
  let t647 = @tactics.conv_tac(
    @equal.land_conv(fn(x646 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x646))
    }),
  )
  let t665 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(@real.real_lt_lmul()),
                t647,
              ),
              t648,
            ),
            t649,
          ),
          t650,
        ),
        @tactics.conj_tac,
      ),
      t663,
    ),
    t664,
  ])
  let t645 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(2) * (abs((a : Real)) * real_of_num(1) + (abs((b : Real)) * real_of_num(1) + real_of_num(1) * real_of_num(1)))"),
  )
  let t644 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t642 = @tactics.disch_then(
    @tactics.choose_then(
      @tactics.conjuncts_then2(
        fn(
          x636 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s637 = @tactics.assume_tac(x636)
          fn(
            x638 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s637(x638)
          }
        },
        fn(
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
          let s640 = @tactics.subst1_tac(x639)
          fn(
            x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s640(x641)
          }
        },
      ),
    ),
  )
  let t635 = @tactics.undisch_tac(
    @term_syntax.parse_term("abs((b : Real) - pow(real_of_num(2), (l : Num)) * (y : Real)) < real_of_num(1)"),
  )
  let t643 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (l : Num)) * (y : Real) - (b : Real)")),
        t635,
      ),
      @calc_rat.real_arith_tac,
    ),
    t642,
  ])
  let t634 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ e : Real, abs(e) < real_of_num(1) && pow(real_of_num(2), (l : Num)) * (y : Real) == (b : Real) + e"),
    fn(
      x631 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s632 = @tactics.mp_tac(x631)
      fn(
        x633 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s632(x633)
      }
    },
  )
  let t629 = @tactics.disch_then(
    @tactics.choose_then(
      @tactics.conjuncts_then2(
        fn(
          x623 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s624 = @tactics.assume_tac(x623)
          fn(
            x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s624(x625)
          }
        },
        fn(
          x626 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s627 = @tactics.subst1_tac(x626)
          fn(
            x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s627(x628)
          }
        },
      ),
    ),
  )
  let t622 = @tactics.undisch_tac(
    @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (k : Num)) * (x : Real)) < real_of_num(1)"),
  )
  let t630 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (k : Num)) * (x : Real) - (a : Real)")),
        t622,
      ),
      @calc_rat.real_arith_tac,
    ),
    t629,
  ])
  let t621 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ d : Real, abs(d) < real_of_num(1) && pow(real_of_num(2), (k : Num)) * (x : Real) == (a : Real) + d"),
    fn(
      x618 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s619 = @tactics.mp_tac(x618)
      fn(
        x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s619(x620)
      }
    },
  )
  let t616 = @term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) * (d : Real) == a * c * (b * d)")
  let t617 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t616)]),
  )
  let t615 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t614 = @simp.asm_rewrite_tac(@list.List([]))
  let t613 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t612 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add())]),
  )
  let t611 = @simp.asm_rewrite_tac(@list.List([]))
  let t610 = @tactics.match_mp_tac(@real.real_let_add2())
  let t609 = @simp.rewrite_tac(@list.List([]))
  let t608 = @tactics.conv_tac(
    @equal.land_conv(fn(x607 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x607))
    }),
  )
  let t606 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(2) * abs(pow(real_of_num(2), (m : Num)) * (c : Real) - (a : Real) * (b : Real)) + real_of_num(2) * abs(a * b - pow(real_of_num(2), m) * (pow(real_of_num(2), (n : Num)) * ((x : Real) * (y : Real))))"),
  )
  let t605 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t604 = @simp.gen_rewrite_tac(
    fn(
      x601 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s602 = @equal.rand_conv(x601)
      fn(x603 : @kernel.Term) -> @kernel.Thm raise { s602(x603) }
    },
    @list.List([@real.real_mul_2()]),
  )
  let t600 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t599 = @tactics.conv_tac(
    @equal.land_conv(fn(x598 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x598))
    }),
  )
  let t597 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2)"))
  let t596 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t595 = @simp.rewrite_tac(
    @list.List([
      @real.real_lt_pow2(),
      real_abs_lemma(),
      @analysis.real_sub_ldistrib(),
    ]),
  )
  let t594 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (m : Num))"))
  let t593 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t666 = @tactics.thenl(
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
                                                        t593,
                                                      ),
                                                      t594,
                                                    ),
                                                    t595,
                                                  ),
                                                  t596,
                                                ),
                                                t597,
                                              ),
                                              t599,
                                            ),
                                            t600,
                                          ),
                                          t604,
                                        ),
                                        t605,
                                      ),
                                      t606,
                                    ),
                                    t608,
                                  ),
                                  t609,
                                ),
                                t610,
                              ),
                              t611,
                            ),
                            t612,
                          ),
                          t613,
                        ),
                        t614,
                      ),
                      t615,
                    ),
                    t617,
                  ),
                  t621,
                ),
                t630,
              ),
              t634,
            ),
            t643,
          ),
          t644,
        ),
        t645,
      ),
      @tactics.conj_tac,
    ),
    t665,
  )
  realcalc_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (k : Num)) * (x : Real)) < real_of_num(1) → abs((b : Real) - pow(real_of_num(2), (l : Num)) * (y : Real)) < real_of_num(1) → (n : Num) + (m : Num) == k + l → real_of_num(2) * (abs(a) + (abs(b) + real_of_num(1))) <= pow(real_of_num(2), m) → real_of_num(2) * abs(pow(real_of_num(2), m) * (c : Real) - a * b) <= pow(real_of_num(2), m) → abs(c - pow(real_of_num(2), n) * (x * y)) < real_of_num(1)"),
      t666,
    ),
  )
}

///|
let realcalc_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_MUL")

///|
/// `REALCALC_MUL`
pub fn realcalc_mul() -> @kernel.Thm {
  realcalc_mul_c.get()
}

///|
/// REALCALC_SQRT
fn step_23() -> Unit raise {
  let t713 = @simp.asm_simp_tac(@list.List([@real.sqrt_pos_le()]))
  let t712 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t711 = @simp.rewrite_tac(@list.List([@analysis.pow_2()]))
  let t714 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x708 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s709 = @equal.rand_conv(x708)
            fn(x710 : @kernel.Term) -> @kernel.Thm raise { s709(x710) }
          },
          @list.List([@equal.gsym(@realax.real_mul_lid())]),
        ),
        t711,
      ),
      t712,
    ),
    t713,
  )
  let t707 = @simp.asm_rewrite_tac(@list.List([@real.sqrt_pow2()]))
  let t715 = @list.List([
    @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t707),
    t714,
  ])
  let t706 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Real) == pow(sqrt(x), 2)"), fn(
    x703 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s704 = @tactics.subst1_tac(x703)
    fn(
      x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s704(x705)
    }
  })
  let t702 = @simp.rewrite_tac(@list.List([@analysis.real_not_le()]))
  let t701 = @tactics.conv_tac(@class.contrapos_conv)
  let t700 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= (x : Real)"))
  let t697 = @drule.match_mp(
    @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) <= x")),
  )
  let t699 = @tactics.first_assum(fn(
    x698 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x694 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s695 = @tactics.assume_tac(x694)
      fn(
        x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s695(x696)
      }
    })(t697(x698))
  })
  let t691 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) <= x"))
  let t692 = @equal.gsym(@analysis.pow_2())
  let t693 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@realax.real_mul_assoc()),
      t692,
      @real.sqrt_pow_2(),
      t691,
    ]),
  )
  let t690 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t689 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t688 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t687 = @simp.simp_tac(
    @list.List([@real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]),
  )
  let t686 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t685 = @simp.rewrite_tac(
    @list.List([@real.real_abs_pow(), @calc_int.real_abs_num()]),
  )
  let t684 = @tactics.match_mp_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (c : Real) → a < abs((b : Real) + c) - b")),
  )
  let t683 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@analysis.real_sub_ldistrib()),
      @real.real_abs_mul(),
    ]),
  )
  let t682 = @simp.rewrite_tac(
    @list.List([@realarith.real_pow_2(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t681 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_pow_2())]),
  )
  let t679 = @term_syntax.parse_term("(b : Real)")
  let t680 = @tactics.map_every(
    fn(
      x676 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s677 = @tactics.exists_tac(x676)
      fn(
        x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s677(x678)
      }
    },
    @list.List([@term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * (a : Real)"), t679]),
  )
  let t675 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ c : Real, ∀ d : Real, abs((b : Real) - c) <= d && abs(c - (a : Real)) < (e : Real) - d → abs(b - a) < e"),
    ),
  )
  let t674 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((a : Real) + (b : Real)) * (a - b) == a * a - b * b"),
      ),
    ]),
  )
  let t673 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_abs_mul()), @analysis.real_mul_rid()]),
  )
  let t671 = @simp.asm_simp_tac(
    @list.List([
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
      @real.real_lt_mul(),
      @real.sqrt_pos_lt(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) < x")),
    ]),
  )
  let t670 = @simp.asm_rewrite_tac(@list.List([]))
  let t669 = @tactics.exists_tac(@term_syntax.parse_term("pow((b : Real), 2) - pow(real_of_num(2), (n : Num)) * (a : Real)"))
  let t672 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @calc_rat.real_arith(
              @term_syntax.parse_term("∀ z : Real, abs(z) <= (b : Real) && real_of_num(0) < (c : Real) → real_of_num(0) < abs(b + c)"),
            ),
          ),
          t669,
        ),
        t670,
      ),
      t671,
    ),
    @tactics.all_tac,
  ])
  let t668 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((b : Real) + pow(real_of_num(2), (n : Num)) * sqrt((x : Real)))"),
  )
  let t667 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t716 = @tactics.thenl(
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
                                                      @tactics.repeat_tac(
                                                        @tactics.strip_tac,
                                                      ),
                                                      t667,
                                                    ),
                                                    t668,
                                                  ),
                                                  @tactics.conj_tac,
                                                ),
                                                t672,
                                              ),
                                              t673,
                                            ),
                                            t674,
                                          ),
                                          t675,
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
                              ),
                              t685,
                            ),
                            t686,
                          ),
                          t687,
                        ),
                        t688,
                      ),
                      t689,
                    ),
                    t690,
                  ),
                  t693,
                ),
                t699,
              ),
              t700,
            ),
            t701,
          ),
          t702,
        ),
        @tactics.disch_tac,
      ),
      t706,
    ),
    t715,
  )
  realcalc_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) → real_of_num(1) <= x → abs(pow((b : Real), 2) - pow(real_of_num(2), n) * a) <= b → abs(b - pow(real_of_num(2), n) * sqrt(x)) < real_of_num(1)"),
      t716,
    ),
  )
}

///|
let realcalc_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_SQRT")

///|
/// `REALCALC_SQRT`
pub fn realcalc_sqrt() -> @kernel.Thm {
  realcalc_sqrt_c.get()
}

///|
/// STEP_LEMMA1
fn step_24() -> Unit raise {
  let t746 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t743 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t744 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t745 = @list.List([
    @tactics.match_mp_tac(@real.real_le_lmul()),
    t744,
    t743,
  ])
  let t742 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t740 = @tactics.match_mp_tac(@real.real_le_add2())
  let t741 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@real.real_le_imp(@real.real_abs_triangle())),
        t740,
      ),
      @tactics.conj_tac,
    ),
  )
  let t739 = @tactics.subst1_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("((c : Real) + (u : Real)) * ((d : Real) + (v : Real)) - c * d == c * v + (d * u + u * v)"),
    ),
  )
  let t738 = @list.List([
    @tactics.then_tac(
      @tactics.pop_assum_list(fn(
        x737 : @list.List[@kernel.Thm],
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
        })(
          ((x736 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x736))(
            x737,
          ),
        )
      }),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t732 = @tactics.subgoal_then(@term_syntax.parse_term("(b : Real) == (d : Real) + (v : Real)"), fn(
    x729 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s730 = @tactics.subst1_tac(x729)
    fn(
      x731 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s730(x731)
    }
  })
  let t728 = @list.List([
    @tactics.then_tac(
      @tactics.pop_assum_list(fn(
        x727 : @list.List[@kernel.Thm],
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x723 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s724 = @tactics.mp_tac(x723)
          fn(
            x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s724(x725)
          }
        })(
          ((x726 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x726))(
            x727,
          ),
        )
      }),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t722 = @tactics.subgoal_then(@term_syntax.parse_term("(a : Real) == (c : Real) + (u : Real)"), fn(
    x719 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s720 = @tactics.subst1_tac(x719)
    fn(
      x721 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s720(x721)
    }
  })
  let t718 = @simp.abbrev_tac(@term_syntax.parse_term("(v : Real) == (b : Real) - (d : Real)"))
  let t717 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Real) == (a : Real) - (c : Real)"))
  let t747 = @tactics.then_tac(
    @tactics.thenl(
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
                          t717,
                        ),
                        t718,
                      ),
                      t722,
                    ),
                    t728,
                  ),
                  t732,
                ),
                t738,
              ),
              @tactics.strip_tac,
            ),
            t739,
          ),
          t741,
        ),
        t742,
      ),
      t745,
    ),
    t746,
  )
  step_lemma1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ x : Real, ∀ y : Real, abs(a - c) <= x && abs(b - d) <= y → abs(a * b - c * d) <= abs(c) * y + (abs(d) * x + x * y)"),
      t747,
    ),
  )
}

///|
let step_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LEMMA1")

///|
/// `STEP_LEMMA1`
pub fn step_lemma1() -> @kernel.Thm {
  step_lemma1_c.get()
}

///|
/// STEP_LEMMA2
fn step_25() -> Unit raise {
  let t891 = @simp.asm_rewrite_tac(@list.List([]))
  let t890 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t889 = @simp.asm_rewrite_tac(@list.List([real_abs_lemma()]))
  let t892 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t889),
      t890,
    ),
    t891,
  )
  let t893 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (a : Real)")),
      @calc_rat.real_arith_tac,
    ),
    t892,
  ])
  let t888 = @tactics.subgoal_then(@term_syntax.parse_term("abs((a : Real)) == a"), fn(
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
    let s886 = @tactics.subst1_tac(x885)
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
  })
  let t884 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t882 = @equal.gsym(@analysis.real_sub_ldistrib())
  let t883 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_ldistrib()), t882]),
  )
  let t881 = @simp.asm_rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t879 = @term_syntax.parse_term("(a : Real) + (b : Real) + (c : Real) == a + (c + b)")
  let t880 = @simp.gen_rewrite_tac(
    fn(
      x876 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s877 = @equal.rand_conv(x876)
      fn(x878 : @kernel.Term) -> @kernel.Thm raise { s877(x878) }
    },
    @list.List([@theorems.ac(@calc_int.real_add_ac())(t879)]),
  )
  let t874 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * (f : Real))))) == c * (a * f * (e * (d * b)))")
  let t875 = @simp.gen_rewrite_tac(
    fn(
      x873 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x867 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s868 = @equal.rand_conv(x867)
        fn(x869 : @kernel.Term) -> @kernel.Thm raise { s868(x869) }
      })(
        (fn(
          x870 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s871 = @equal.rand_conv(x870)
          fn(x872 : @kernel.Term) -> @kernel.Thm raise { s871(x872) }
        })(x873),
      )
    },
    @list.List([@theorems.ac(@real.real_mul_ac())(t874)]),
  )
  let t865 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * ((f : Real) * (g : Real)))))) == c * (e * g * (f * a * (d * b)))")
  let t866 = @simp.gen_rewrite_tac(
    fn(
      x864 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x860 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x854 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s855 = @equal.rand_conv(x854)
          fn(x856 : @kernel.Term) -> @kernel.Thm raise { s855(x856) }
        })(
          (fn(
            x857 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s858 = @equal.land_conv(x857)
            fn(x859 : @kernel.Term) -> @kernel.Thm raise { s858(x859) }
          })(x860),
        )
      })(
        (fn(
          x861 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s862 = @equal.rand_conv(x861)
          fn(x863 : @kernel.Term) -> @kernel.Thm raise { s862(x863) }
        })(x864),
      )
    },
    @list.List([@theorems.ac(@real.real_mul_ac())(t865)]),
  )
  let t852 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * (f : Real))))) == c * (a * e * (f * (d * b)))")
  let t853 = @simp.gen_rewrite_tac(
    fn(
      x851 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x847 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x841 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s842 = @equal.rand_conv(x841)
          fn(x843 : @kernel.Term) -> @kernel.Thm raise { s842(x843) }
        })(
          (fn(
            x844 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s845 = @equal.land_conv(x844)
            fn(x846 : @kernel.Term) -> @kernel.Thm raise { s845(x846) }
          })(x847),
        )
      })(
        (fn(
          x848 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s849 = @equal.land_conv(x848)
          fn(x850 : @kernel.Term) -> @kernel.Thm raise { s849(x850) }
        })(x851),
      )
    },
    @list.List([@theorems.ac(@real.real_mul_ac())(t852)]),
  )
  let t839 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * ((f : Real) * (g : Real)))))) == d * (a * f * (c * g * (e * b)))")
  let t840 = @simp.gen_rewrite_tac(
    fn(
      x838 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x832 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s833 = @equal.land_conv(x832)
        fn(x834 : @kernel.Term) -> @kernel.Thm raise { s833(x834) }
      })(
        (fn(
          x835 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s836 = @equal.once_depth_conv(x835)
          fn(x837 : @kernel.Term) -> @kernel.Thm raise { s836(x837) }
        })(x838),
      )
    },
    @list.List([@theorems.ac(@real.real_mul_ac())(t839)]),
  )
  let t831 = @simp.rewrite_tac(@list.List([]))
  let t830 = @tactics.conv_tac(
    @equal.land_conv(fn(x829 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x829))
    }),
  )
  let t828 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t827 = @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_lemma1())]))
  let t824 = @term_syntax.parse_term("real_of_num(2)")
  let t894 = @tactics.thenl(
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
                                @lib.map(
                                  fn(x826 : @kernel.Thm) -> @kernel.Thm raise {
                                    @equal.gsym(
                                      ((x825 : @kernel.Thm) => {
                                        @bool.spec(t824, x825)
                                      })(x826),
                                    )
                                  },
                                  @list.List([
                                    @analysis.real_sub_ldistrib(),
                                    @realax.real_add_ldistrib(),
                                  ]),
                                ),
                              ),
                              t827,
                            ),
                            t828,
                          ),
                          t830,
                        ),
                        t831,
                      ),
                      t840,
                    ),
                    t853,
                  ),
                  t866,
                ),
                t875,
              ),
              t880,
            ),
            t881,
          ),
          t883,
        ),
        t884,
      ),
      t888,
    ),
    t893,
  )
  let t823 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t822 = @simp.gen_rewrite_tac(
    fn(
      x821 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x817 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x810 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s811 = @equal.land_conv(x810)
          fn(x812 : @kernel.Term) -> @kernel.Thm raise { s811(x812) }
        })(
          ((x816 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              2,
              fn(
                x813 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s814 = @equal.rand_conv(x813)
                fn(x815 : @kernel.Term) -> @kernel.Thm raise { s814(x815) }
              },
              x816,
            )
          })(x817),
        )
      })(
        (fn(
          x818 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s819 = @equal.land_conv(x818)
          fn(x820 : @kernel.Term) -> @kernel.Thm raise { s819(x820) }
        })(x821),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t809 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t807 = @equal.gsym(real_abs_lemma1())
  let t808 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@analysis.real_sub_ldistrib()), t807]),
  )
  let t806 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc()), @analysis.real_mul_rid()]),
  )
  let t895 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x803 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s804 = @equal.rand_conv(x803)
                  fn(x805 : @kernel.Term) -> @kernel.Thm raise { s804(x805) }
                },
                @list.List([@realax.real_mul_sym()]),
              ),
              t806,
            ),
            t808,
          ),
          t809,
        ),
        t822,
      ),
      t823,
    ),
    t894,
  ])
  let t802 = @tactics.match_mp_tac(@real.real_le_add2())
  let t800 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (d : Real)"))
  let t799 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_0()]))
  let t798 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t801 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t798),
          t799,
        ),
        t800,
      ),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t797 = @tactics.subgoal_then(
    @term_syntax.parse_term("inv(real_of_num(2)) * real_of_num(2) == real_of_num(1) && inv(pow(real_of_num(2), (n : Num))) * pow(real_of_num(2), n) == real_of_num(1) && inv((d : Real)) * d == real_of_num(1)"),
    @tactics.strip_assume_tac,
  )
  let t796 = @simp.gen_rewrite_tac(
    fn(
      x793 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s794 = @equal.rand_conv(x793)
      fn(x795 : @kernel.Term) -> @kernel.Thm raise { s794(x795) }
    },
    @list.List([@realax.real_add_sym()]),
  )
  let t792 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc()), @realax.real_add_assoc()]),
  )
  let t791 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * ((a : Real) * ((s : Real) * (t : Real)))"))
  let t789 = @term_syntax.parse_term("abs((a : Real) - (b : Real)) + abs(b - (c : Real)) <= (d : Real) → abs(a - c) <= d")
  let t790 = (fn(
    x788 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(@bool.gen_all(x788))
  })(@calc_rat.real_arith(t789))
  let t787 = @simp.rewrite_tac(@list.List([@analysis.real_sub_ldistrib()]))
  let t785 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < real_of_num(2) * (pow(real_of_num(2), (n : Num)) * (d : Real))"))
  let t786 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()])),
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t785,
      ),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t784 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ z : Real, real_of_num(2) * (pow(real_of_num(2), (n : Num)) * (d : Real)) * abs(z) == abs(real_of_num(2) * (pow(real_of_num(2), n) * d) * z)"),
    fn(
      x782 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x782
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t781 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_add_ldistrib(),
      @real.real_add_rdistrib(),
    ]),
  )
  let t780 = @simp.asm_rewrite_tac(@list.List([]))
  let t779 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * (pow(real_of_num(2), (n : Num)) * (d : Real))"))
  let t778 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t776 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t777 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@real.real_lt_mul()),
            @tactics.conj_tac,
          ),
        ),
        t776,
      ),
      @calc_rat.real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t775 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(0) < real_of_num(2) * (pow(real_of_num(2), (n : Num)) * (d : Real))"),
    fn(
      x772 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s773 = @tactics.assume_tac(x772)
      fn(
        x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s773(x774)
      }
    },
  )
  let t766 = @drule.match_mp(step_lemma1())
  let t771 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x767 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x763 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s764 = @tactics.assume_tac(x763)
          fn(
            x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s764(x765)
          }
        })(t766(x767))
      },
      fn(
        x768 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s769 = @tactics.assume_tac(x768)
        fn(
          x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s769(x770)
        }
      },
    ),
  )
  let t762 = @simp.once_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t761 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x755 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s756 = @tactics.assume_tac(x755)
        fn(
          x757 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s756(x757)
        }
      },
      fn(
        x758 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s759 = @tactics.mp_tac(x758)
        fn(
          x760 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s759(x760)
        }
      },
    ),
  )
  let t754 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x748 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s749 = @tactics.assume_tac(x748)
        fn(
          x750 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s749(x750)
        }
      },
      fn(
        x751 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s752 = @tactics.mp_tac(x751)
        fn(
          x753 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s752(x753)
        }
      },
    ),
  )
  let t896 = @tactics.thenl(
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
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.repeat_tac(
                                                @tactics.gen_tac,
                                              ),
                                              t754,
                                            ),
                                            t761,
                                          ),
                                          t762,
                                        ),
                                        t771,
                                      ),
                                      t775,
                                    ),
                                    t777,
                                  ),
                                  t778,
                                ),
                                t779,
                              ),
                              t780,
                            ),
                            t781,
                          ),
                          t784,
                        ),
                        t786,
                      ),
                      t787,
                    ),
                    t790,
                  ),
                  t791,
                ),
                t792,
              ),
              t796,
            ),
            t797,
          ),
          t801,
        ),
        t802,
      ),
      @tactics.conj_tac,
    ),
    t895,
  )
  step_lemma2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ s : Real, ∀ t : Real, ∀ u : Real, ∀ x : Real, ∀ y : Real, ∀ k : Real, ∀ l : Real, ∀ a : Real, ∀ d : Real, real_of_num(0) < a && real_of_num(0) < d && abs(s - pow(real_of_num(2), n) * x) <= k && abs(t - pow(real_of_num(2), n) * y) <= l && real_of_num(2) * abs(u * (pow(real_of_num(2), n) * d) - a * (s * t)) <= pow(real_of_num(2), n) * d → abs(u - pow(real_of_num(2), n) * (a / d * (x * y))) <= a / d * ((abs(x) + k / pow(real_of_num(2), n)) * l) + (a / d * (k * abs(y)) + real_of_num(1) / real_of_num(2))"),
      t896,
    ),
  )
}

///|
let step_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LEMMA2")

///|
/// `STEP_LEMMA2`
pub fn step_lemma2() -> @kernel.Thm {
  step_lemma2_c.get()
}

///|
/// STEP_EXP
fn step_26() -> Unit raise {
  let t947 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @arith.le_0()]),
  )
  let t946 = @tactics.match_mp_tac(@real.real_le_inv())
  let t948 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (a : Real) → abs(a) <= a")),
      ),
      t946,
    ),
    t947,
  )
  let t945 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t944 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t949 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@real.real_abs_pow()])),
        t944,
      ),
      t945,
    ),
    t948,
  ])
  let t943 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t942 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t941 = @simp.gen_rewrite_tac(
    fn(
      x938 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s939 = @equal.rand_conv(x938)
      fn(x940 : @kernel.Term) -> @kernel.Thm raise { s939(x940) }
    },
    @list.List([@equal.gsym(@realax.real_mul_lid())]),
  )
  let t950 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@real.real_abs_mul()])),
            t941,
          ),
          t942,
        ),
        t943,
      ),
      @tactics.conj_tac,
    ),
    t949,
  )
  let t935 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t934 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((t : Real) - pow(real_of_num(2), (n : Num)) * (pow((x : Real), (i : Num)) / real_of_num(FACT(i))))"),
  )
  let t936 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t934),
    t935,
  )
  let t933 = @simp.rewrite_tac(@list.List([@real.real_le_pow2()]))
  let t932 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t931 = @simp.asm_rewrite_tac(@list.List([]))
  let t930 = @tactics.match_mp_tac(@real.real_le_add2())
  let t937 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x927 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s928 = @equal.rand_conv(x927)
                fn(x929 : @kernel.Term) -> @kernel.Thm raise { s928(x929) }
              },
              @list.List([
                @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) == real_of_num(1) + real_of_num(1)")),
              ]),
            ),
            t930,
          ),
          t931,
        ),
        t932,
      ),
      t933,
    ),
    t936,
  ])
  let t951 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.match_mp_tac(@real.real_le_rmul()),
        @tactics.conj_tac,
      ),
      t937,
    ),
    t950,
  ])
  let t952 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(@real.real_le_add2()),
      @tactics.conj_tac,
    ),
    t951,
  )
  let t926 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @arith.le_0()]),
  )
  let t953 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv()), t926),
    t952,
  ])
  let t925 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t923 = @equal.gsym(@realax.real_mul_assoc())
  let t924 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_ldistrib()), t923]),
  )
  let t922 = @simp.gen_rewrite_tac(
    fn(
      x921 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x917 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x911 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s912 = @equal.rand_conv(x911)
          fn(x913 : @kernel.Term) -> @kernel.Thm raise { s912(x913) }
        })(
          (fn(
            x914 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s915 = @equal.land_conv(x914)
            fn(x916 : @kernel.Term) -> @kernel.Thm raise { s915(x916) }
          })(x917),
        )
      })(
        (fn(
          x918 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s919 = @equal.land_conv(x918)
          fn(x920 : @kernel.Term) -> @kernel.Thm raise { s919(x920) }
        })(x921),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t954 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@realax.real_add_assoc(), @analysis.real_le_radd()]),
            ),
            t922,
          ),
          t924,
        ),
        t925,
      ),
      @tactics.conj_tac,
    ),
    t953,
  )
  let t955 = @list.List([
    @simp.rewrite_tac(@list.List([@real.real_mul_ac()])),
    t954,
  ])
  let t910 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) <= (d : Real) → a <= c → b <= d"),
    ),
  )
  let t909 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_lid(), @real.real_inv_mul()]),
  )
  let t908 = @simp.rewrite_tac(
    @list.List([
      @arith.fact(),
      @realax.real_div(),
      @equal.gsym(@realax.real_of_num_mul()),
      @realax.real_pow(),
    ]),
  )
  let t907 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @arith.lt_0()]),
  )
  let t906 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_lt_01(), @realax.real_mul_lid()]),
  )
  let t897 = @term_syntax.parse_term("real_of_num(SUC((i : Num)))")
  let t898 = @term_syntax.parse_term("real_of_num(1)")
  let t899 = @term_syntax.parse_term("(k : Real)")
  let t900 = @term_syntax.parse_term("real_of_num(1)")
  let t901 = @term_syntax.parse_term("pow((x : Real), (i : Num)) / real_of_num(FACT(i))")
  let t902 = @term_syntax.parse_term("(x : Real)")
  let t903 = @term_syntax.parse_term("(u : Real)")
  let t904 = @term_syntax.parse_term("(t : Real)")
  let t905 = @term_syntax.parse_term("(s : Real)")
  let t956 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.strip_tac,
                  @tactics.mp_tac(
                    @bool.specl(
                      @list.List([
                        @term_syntax.parse_term("(n : Num)"),
                        t905,
                        t904,
                        t903,
                        t902,
                        t901,
                        t900,
                        t899,
                        t898,
                        t897,
                      ]),
                      step_lemma2(),
                    ),
                  ),
                ),
                t906,
              ),
              t907,
            ),
            t908,
          ),
          t909,
        ),
        t910,
      ),
      @tactics.conj_tac,
    ),
    t955,
  )
  step_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) <= real_of_num(1) && abs((t : Real) - pow(real_of_num(2), n) * (pow(x, (i : Num)) / real_of_num(FACT(i)))) <= (k : Real) && real_of_num(2) * abs((u : Real) * (pow(real_of_num(2), n) * real_of_num(SUC(i))) - s * t) <= pow(real_of_num(2), n) * real_of_num(SUC(i)) → abs(u - pow(real_of_num(2), n) * (pow(x, SUC(i)) / real_of_num(FACT(SUC(i))))) <= real_of_num(2) / real_of_num(SUC(i)) * k + (real_of_num(1) / real_of_num(FACT(SUC(i))) + real_of_num(1) / real_of_num(2))"),
      t956,
    ),
  )
}

///|
let step_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP")

///|
/// `STEP_EXP`
pub fn step_exp() -> @kernel.Thm {
  step_exp_c.get()
}

///|
/// STEP_SIN
fn step_27() -> Unit raise {
  let t1062 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @arith.fact_le()]),
  )
  let t1061 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t1063 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@real.real_abs_inv(), @calc_int.real_abs_num()]),
      ),
      t1061,
    ),
    t1062,
  )
  let t1060 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1059 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1064 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@real.real_abs_pow()])),
        t1059,
      ),
      t1060,
    ),
    t1063,
  ])
  let t1058 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1057 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1056 = @simp.gen_rewrite_tac(
    fn(
      x1053 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1054 = @equal.rand_conv(x1053)
      fn(x1055 : @kernel.Term) -> @kernel.Thm raise { s1054(x1055) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1065 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@realax.real_div(), @real.real_abs_mul()]),
            ),
            t1056,
          ),
          t1057,
        ),
        t1058,
      ),
      @tactics.conj_tac,
    ),
    t1064,
  )
  let t1050 = @simp.rewrite_tac(@list.List([@real.real_le_pow2()]))
  let t1049 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t1051 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@realax.real_div(), @realax.real_mul_lid()]),
      ),
      t1049,
    ),
    t1050,
  )
  let t1048 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1047 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1052 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@calc_int.real_abs_neg(), @real.real_abs_pow()]),
        ),
        t1047,
      ),
      t1048,
    ),
    t1051,
  ])
  let t1046 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1066 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x1043 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1044 = @equal.rand_conv(x1043)
              fn(x1045 : @kernel.Term) -> @kernel.Thm raise { s1044(x1045) }
            },
            @list.List([
              @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) == real_of_num(1) + real_of_num(1)")),
            ]),
          ),
          t1046,
        ),
        @tactics.conj_tac,
      ),
      t1052,
    ),
    t1065,
  ])
  let t1042 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1039 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t1038 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1037 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t1036 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_mul_lid(),
      @real.real_le_inv_eq(),
      @real.real_abs_pos(),
    ]),
  )
  let t1035 = @tactics.match_mp_tac(@realarith.real_le_add())
  let t1034 = @simp.rewrite_tac(
    @list.List([@analysis.real_mul_rid(), @real.real_abs_pos()]),
  )
  let t1040 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@realarith.real_le_add()),
            t1034,
          ),
          t1035,
        ),
        t1036,
      ),
      t1037,
    ),
    t1038,
  )
  let t1033 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @analysis.real_pos()]),
  )
  let t1041 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @realax.real_div(),
          @realax.real_mul_lid(),
          @real.real_le_inv_eq(),
        ]),
      ),
      t1033,
    ),
    t1040,
    t1039,
  ])
  let t1032 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1031 = @simp.asm_rewrite_tac(@list.List([]))
  let t1030 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1029 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_ldistrib())]),
  )
  let t1028 = @simp.gen_rewrite_tac(
    fn(
      x1027 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1021 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1022 = @equal.rand_conv(x1021)
        fn(x1023 : @kernel.Term) -> @kernel.Thm raise { s1022(x1023) }
      })(
        (fn(
          x1024 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1025 = @equal.rand_conv(x1024)
          fn(x1026 : @kernel.Term) -> @kernel.Thm raise { s1025(x1026) }
        })(x1027),
      )
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1020 = @simp.rewrite_tac(
    @list.List([
      @equal.sym(
        @calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(1) / real_of_num(6) * real_of_num(2)")),
      ),
    ]),
  )
  let t1018 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t1017 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1016 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1015 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @realax.real_of_num_le()]),
  )
  let t1014 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(6) == real_of_num(2) * real_of_num(3)"))]),
  )
  let t1013 = @simp.rewrite_tac(@list.List([]))
  let t1012 = @tactics.conv_tac(
    @equal.land_conv(fn(x1011 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x1011))
    }),
  )
  let t1010 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1019 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([@realax.real_div(), @realax.real_mul_lid()]),
                    ),
                    t1010,
                  ),
                  t1012,
                ),
                t1013,
              ),
              t1014,
            ),
            t1015,
          ),
          t1016,
        ),
        t1017,
      ),
      t1018,
    ),
    @tactics.all_tac,
  ])
  let t1009 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(1) / (real_of_num(2 * (i : Num) + 2) * real_of_num(2 * i + 3)) <= real_of_num(1) / real_of_num(6)"),
    fn(
      x1006 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1007 = @tactics.assume_tac(x1006)
      fn(
        x1008 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1007(x1008)
      }
    },
  )
  let t1005 = @simp.rewrite_tac(
    @list.List([@realax.real_add_assoc(), @analysis.real_le_radd()]),
  )
  let t1067 = @tactics.thenl(
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
                            @simp.gen_rewrite_tac(
                              fn(
                                x1002 : (@kernel.Term) -> @kernel.Thm raise,
                              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                let s1003 = @equal.rand_conv(x1002)
                                fn(x1004 : @kernel.Term) -> @kernel.Thm raise {
                                  s1003(x1004)
                                }
                              },
                              @list.List([
                                @equal.sym(
                                  @calc_rat.real_rat_reduce_conv(
                                    @term_syntax.parse_term("real_of_num(1) / real_of_num(3) + (real_of_num(1) / real_of_num(6) + real_of_num(1) / real_of_num(2))"),
                                  ),
                                ),
                              ]),
                            ),
                            t1005,
                          ),
                          t1009,
                        ),
                        t1019,
                      ),
                      t1020,
                    ),
                    t1028,
                  ),
                  t1029,
                ),
                t1030,
              ),
              t1031,
            ),
            t1032,
          ),
          t1041,
        ),
        t1042,
      ),
      @tactics.conj_tac,
    ),
    t1066,
  )
  let t999 = @simp.rewrite_tac(
    @list.List([@realarith.real_pow_2(), @real.real_mul_ac()]),
  )
  let t998 = @simp.rewrite_tac(
    @list.List([
      @realax.real_mul_lid(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_mul_lneg(),
    ]),
  )
  let t996 = @equal.gsym(@realax.real_of_num_add())
  let t997 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_inv_mul(),
      @equal.gsym(@realax.real_of_num_mul()),
      t996,
    ]),
  )
  let t995 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t994 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@arith.add_assoc())]),
  )
  let t1000 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@realax.real_pow(), @arith.fact()])),
            t994,
          ),
          t995,
        ),
        t997,
      ),
      t998,
    ),
    t999,
  )
  let t992 = @equal.gsym(@realax.real_of_num_add())
  let t993 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_mul()), t992]),
  )
  let t1001 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x991 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x991
          },
          @list.List([@equal.gsym(@realax.real_of_num_eq())]),
        ),
        t993,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1000,
  ])
  let t990 = @tactics.subgoal_then(
    @term_syntax.parse_term("2 * SUC((i : Num)) + 1 == SUC(SUC(2 * i + 1))"),
    fn(
      x987 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s988 = @tactics.subst1_tac(x987)
      fn(
        x989 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s988(x989)
      }
    },
  )
  let t1068 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac),
          @tactics.ap_term_tac,
        ),
        t990,
      ),
      t1001,
    ),
    t1067,
  ])
  let t986 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) <= (d : Real) → a <= c → b <= d"),
    ),
  )
  let t984 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.mult_clauses(), @arith.lt_0()]),
  )
  let t983 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @real.real_of_num_lt()]),
  )
  let t981 = @term_syntax.parse_term("1")
  let t982 = @term_syntax.parse_term("2")
  let t985 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @lib.map(
            @calc_num.num_conv,
            @list.List([@term_syntax.parse_term("3"), t982, t981]),
          ),
        ),
        t983,
      ),
      t984,
    ),
    @tactics.all_tac,
  ])
  let t966 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_lt_01(), @realax.real_mul_lid()]),
  )
  let t957 = @term_syntax.parse_term("real_of_num(2 * (i : Num) + 2) * real_of_num(2 * i + 3)")
  let t958 = @term_syntax.parse_term("real_of_num(1)")
  let t959 = @term_syntax.parse_term("real_of_num(1)")
  let t960 = @term_syntax.parse_term("real_of_num(1)")
  let t961 = @term_syntax.parse_term("pow((x : Real), 2 * (i : Num) + 1) / real_of_num(FACT(2 * i + 1))")
  let t962 = @term_syntax.parse_term("-pow((x : Real), 2)")
  let t963 = @term_syntax.parse_term("(u : Real)")
  let t964 = @term_syntax.parse_term("(t : Real)")
  let t965 = @term_syntax.parse_term("(s : Real)")
  let t1069 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.strip_tac,
                @tactics.mp_tac(
                  @bool.specl(
                    @list.List([
                      @term_syntax.parse_term("(n : Num)"),
                      t965,
                      t964,
                      t963,
                      t962,
                      t961,
                      t960,
                      t959,
                      t958,
                      t957,
                    ]),
                    step_lemma2(),
                  ),
                ),
              ),
              t966,
            ),
            fn(
              x980 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x979 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x977 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x973 : @kernel.Term,
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
                      x967 : @kernel.Term,
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
                    ) raise) raise) raise {
                      fn(
                        x968 : (@kernel.Thm) -> ((
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
                        let s969 = @tactics.subgoal_then(x967, x968)
                        fn(
                          x970 : (
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
                          s969(x970)
                        }
                      }
                    })(x973)(fn(
                      x971 : @kernel.Thm,
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
                      let th = x971
                      @simp.rewrite_tac(@list.List([th]))
                    })
                  })(
                    ((x976 : @kernel.Term) => {
                      @lib.funpow(
                        2,
                        fn(x975 : @kernel.Term) -> @kernel.Term raise {
                          (fn(
                            x974 : (@kernel.Term, @kernel.Term),
                          ) -> @kernel.Term raise {
                            x974.0
                          })(@basics.dest_imp(x975))
                        },
                        x976,
                      )
                    })(x977),
                  )
                })(
                  (fn(
                    x978 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x978.1
                  })(x979),
                )
              })(x980)(x980)
            },
          ),
          t985,
        ),
        t986,
      ),
      @tactics.conj_tac,
    ),
    t1068,
  )
  step_sin_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * -pow(x, 2)) <= real_of_num(1) && abs((t : Real) - pow(real_of_num(2), n) * (pow(x, 2 * (i : Num) + 1) / real_of_num(FACT(2 * i + 1)))) <= real_of_num(1) && real_of_num(2) * abs((u : Real) * (pow(real_of_num(2), n) * (real_of_num(2 * i + 2) * real_of_num(2 * i + 3))) - s * t) <= pow(real_of_num(2), n) * (real_of_num(2 * i + 2) * real_of_num(2 * i + 3)) → abs(u - pow(real_of_num(2), n) * (-pow(x, 2 * SUC(i) + 1) / real_of_num(FACT(2 * SUC(i) + 1)))) <= real_of_num(1)"),
      t1069,
    ),
  )
}

///|
let step_sin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_SIN")

///|
/// `STEP_SIN`
pub fn step_sin() -> @kernel.Thm {
  step_sin_c.get()
}

///|
/// STEP_COS
fn step_28() -> Unit raise {
  let t1157 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1156 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1158 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@real.real_abs_pow()])),
      t1156,
    ),
    t1157,
  )
  let t1155 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1154 = @simp.rewrite_tac(
    @list.List([@arith.fact(), @realax.real_of_num_mul()]),
  )
  let t1152 = @equal.sym(@calc_num.num_conv(@term_syntax.parse_term("1")))
  let t1153 = @simp.rewrite_tac(
    @list.List([@equal.sym(@calc_num.num_conv(@term_syntax.parse_term("2"))), t1152]),
  )
  let t1150 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t1151 = @simp.rewrite_tac(
    @list.List([
      @calc_num.num_conv(@term_syntax.parse_term("2")),
      t1150,
      @arith.add_clauses(),
    ]),
  )
  let t1149 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t1148 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_inv_mul()), @calc_int.real_abs_num()]),
  )
  let t1159 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@real.real_abs_inv()])),
                t1148,
              ),
              t1149,
            ),
            @tactics.ap_term_tac,
          ),
          t1151,
        ),
        t1153,
      ),
      t1154,
    ),
    t1155,
  )
  let t1147 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_pos(),
      @real.real_abs_pos(),
      @real.real_le_inv_eq(),
    ]),
  )
  let t1160 = @list.List([
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@analysis.real_le_mul()),
          @tactics.conj_tac,
        ),
      ),
      t1147,
    ),
    t1159,
    t1158,
  ])
  let t1146 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1145 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1144 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1142 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == d * (a * b) * c")
  let t1143 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t1142)]),
  )
  let t1141 = @simp.gen_rewrite_tac(
    fn(
      x1138 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1139 = @equal.rand_conv(x1138)
      fn(x1140 : @kernel.Term) -> @kernel.Thm raise { s1139(x1140) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1161 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([
                  @realax.real_div(),
                  @realax.real_mul_lid(),
                  @real.real_inv_mul(),
                  @real.real_abs_mul(),
                ]),
              ),
              t1141,
            ),
            t1143,
          ),
          t1144,
        ),
        t1145,
      ),
      t1146,
    ),
    t1160,
  )
  let t1135 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1134 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((t : Real) - pow(real_of_num(2), (n : Num)) * (pow((x : Real), 2 * (i : Num)) / real_of_num(FACT(2 * i))))"),
  )
  let t1136 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t1134),
    t1135,
  )
  let t1129 = @simp.rewrite_tac(@list.List([@real.real_le_pow2()]))
  let t1130 = @tactics.then_tac(
    @tactics.match_mp_tac(@real.real_inv_le_1()),
    t1129,
  )
  let t1128 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1127 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1131 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@calc_int.real_abs_neg(), @real.real_abs_pow()]),
        ),
        t1127,
      ),
      t1128,
    ),
    t1130,
  ])
  let t1126 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1132 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x1123 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1124 = @equal.rand_conv(x1123)
            fn(x1125 : @kernel.Term) -> @kernel.Thm raise { s1124(x1125) }
          },
          @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) == real_of_num(1) + real_of_num(1)"))]),
        ),
        t1126,
      ),
      @tactics.conj_tac,
    ),
    t1131,
  )
  let t1122 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @analysis.real_pos()]),
  )
  let t1133 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv()), t1122),
    t1132,
  ])
  let t1121 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1120 = @simp.gen_rewrite_tac(
    fn(
      x1117 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1118 = @equal.rand_conv(x1117)
      fn(x1119 : @kernel.Term) -> @kernel.Thm raise { s1118(x1119) }
    },
    @list.List([@equal.gsym(@realax.real_mul_sym())]),
  )
  let t1137 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@realax.real_div(), @realax.real_mul_lid()]),
            ),
            t1120,
          ),
          t1121,
        ),
        @tactics.conj_tac,
      ),
      t1133,
    ),
    t1136,
  ])
  let t1116 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1162 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
          t1116,
        ),
        @tactics.conj_tac,
      ),
      t1137,
    ),
    t1161,
  ])
  let t1115 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1163 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@realax.real_add_assoc(), @analysis.real_le_radd()]),
        ),
        t1115,
      ),
      @tactics.conj_tac,
    ),
    t1162,
  )
  let t1112 = @simp.rewrite_tac(
    @list.List([@realarith.real_pow_2(), @real.real_mul_ac()]),
  )
  let t1111 = @simp.rewrite_tac(
    @list.List([
      @realax.real_mul_lid(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_mul_lneg(),
    ]),
  )
  let t1109 = @equal.gsym(@realax.real_of_num_add())
  let t1110 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_inv_mul(),
      @equal.gsym(@realax.real_of_num_mul()),
      t1109,
    ]),
  )
  let t1108 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1107 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@arith.add_assoc())]),
  )
  let t1113 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@realax.real_pow(), @arith.fact()])),
            t1107,
          ),
          t1108,
        ),
        t1110,
      ),
      t1111,
    ),
    t1112,
  )
  let t1105 = @equal.gsym(@realax.real_of_num_add())
  let t1106 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_mul()), t1105]),
  )
  let t1114 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x1104 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x1104
          },
          @list.List([@equal.gsym(@realax.real_of_num_eq())]),
        ),
        t1106,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1113,
  ])
  let t1103 = @tactics.subgoal_then(
    @term_syntax.parse_term("2 * SUC((i : Num)) == SUC(SUC(2 * i))"),
    fn(
      x1100 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1101 = @tactics.subst1_tac(x1100)
      fn(
        x1102 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1101(x1102)
      }
    },
  )
  let t1164 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac),
          @tactics.ap_term_tac,
        ),
        t1103,
      ),
      t1114,
    ),
    t1163,
  ])
  let t1099 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) <= (d : Real) → a <= c → b <= d"),
    ),
  )
  let t1097 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.mult_clauses(), @arith.lt_0()]),
  )
  let t1096 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @real.real_of_num_lt()]),
  )
  let t1094 = @term_syntax.parse_term("1")
  let t1095 = @term_syntax.parse_term("2")
  let t1098 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @lib.map(
            @calc_num.num_conv,
            @list.List([@term_syntax.parse_term("3"), t1095, t1094]),
          ),
        ),
        t1096,
      ),
      t1097,
    ),
    @tactics.all_tac,
  ])
  let t1079 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_lt_01(), @realax.real_mul_lid()]),
  )
  let t1070 = @term_syntax.parse_term("real_of_num(2 * (i : Num) + 1) * real_of_num(2 * i + 2)")
  let t1071 = @term_syntax.parse_term("real_of_num(1)")
  let t1072 = @term_syntax.parse_term("(k : Real)")
  let t1073 = @term_syntax.parse_term("real_of_num(1)")
  let t1074 = @term_syntax.parse_term("pow((x : Real), 2 * (i : Num)) / real_of_num(FACT(2 * i))")
  let t1075 = @term_syntax.parse_term("-pow((x : Real), 2)")
  let t1076 = @term_syntax.parse_term("(u : Real)")
  let t1077 = @term_syntax.parse_term("(t : Real)")
  let t1078 = @term_syntax.parse_term("(s : Real)")
  let t1165 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.strip_tac,
                @tactics.mp_tac(
                  @bool.specl(
                    @list.List([
                      @term_syntax.parse_term("(n : Num)"),
                      t1078,
                      t1077,
                      t1076,
                      t1075,
                      t1074,
                      t1073,
                      t1072,
                      t1071,
                      t1070,
                    ]),
                    step_lemma2(),
                  ),
                ),
              ),
              t1079,
            ),
            fn(
              x1093 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x1092 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x1090 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1086 : @kernel.Term,
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
                      x1080 : @kernel.Term,
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
                    ) raise) raise) raise {
                      fn(
                        x1081 : (@kernel.Thm) -> ((
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
                        let s1082 = @tactics.subgoal_then(x1080, x1081)
                        fn(
                          x1083 : (
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
                          s1082(x1083)
                        }
                      }
                    })(x1086)(fn(
                      x1084 : @kernel.Thm,
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
                      let th = x1084
                      @simp.rewrite_tac(@list.List([th]))
                    })
                  })(
                    ((x1089 : @kernel.Term) => {
                      @lib.funpow(
                        2,
                        fn(x1088 : @kernel.Term) -> @kernel.Term raise {
                          (fn(
                            x1087 : (@kernel.Term, @kernel.Term),
                          ) -> @kernel.Term raise {
                            x1087.0
                          })(@basics.dest_imp(x1088))
                        },
                        x1089,
                      )
                    })(x1090),
                  )
                })(
                  (fn(
                    x1091 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x1091.1
                  })(x1092),
                )
              })(x1093)(x1093)
            },
          ),
          t1098,
        ),
        t1099,
      ),
      @tactics.conj_tac,
    ),
    t1164,
  )
  step_cos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * -pow(x, 2)) <= real_of_num(1) && abs((t : Real) - pow(real_of_num(2), n) * (pow(x, 2 * (i : Num)) / real_of_num(FACT(2 * i)))) <= (k : Real) && real_of_num(2) * abs((u : Real) * (pow(real_of_num(2), n) * (real_of_num(2 * i + 1) * real_of_num(2 * i + 2))) - s * t) <= pow(real_of_num(2), n) * (real_of_num(2 * i + 1) * real_of_num(2 * i + 2)) → abs(u - pow(real_of_num(2), n) * (-pow(x, 2 * SUC(i)) / real_of_num(FACT(2 * SUC(i))))) <= real_of_num(2) * inv(real_of_num(2 * i + 1) * real_of_num(2 * i + 2)) * k + (inv(real_of_num(FACT(2 * i + 2))) + real_of_num(1) / real_of_num(2))"),
      t1165,
    ),
  )
}

///|
let step_cos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_COS")

///|
/// `STEP_COS`
pub fn step_cos() -> @kernel.Thm {
  step_cos_c.get()
}

///|
/// STEP_LN
fn step_29() -> Unit raise {
  let t1278 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1277 = @simp.asm_rewrite_tac(@list.List([]))
  let t1276 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"))
  let t1275 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1274 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1279 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_1_le()), t1274),
          t1275,
        ),
        t1276,
      ),
      t1277,
    ),
    t1278,
  )
  let t1273 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1280 = @tactics.then_tac(
    @tactics.match_mp_tac(@real.real_pow_le()),
    t1273,
  )
  let t1272 = @simp.asm_rewrite_tac(@list.List([]))
  let t1281 = @list.List([
    @tactics.then_tac(
      @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_rat_reduce_conv)),
      t1272,
    ),
    t1280,
    t1279,
  ])
  let t1271 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1270 = @simp.rewrite_tac(
    @list.List([@real.real_le_inv_eq(), @real.real_abs_pos()]),
  )
  let t1269 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1268 = @simp.gen_rewrite_tac(
    fn(
      x1265 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1266 = @equal.rand_conv(x1265)
      fn(x1267 : @kernel.Term) -> @kernel.Thm raise { s1266(x1267) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1282 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@realax.real_pow(), @real.real_abs_pow()]),
            ),
            t1268,
          ),
          t1269,
        ),
        t1270,
      ),
      t1271,
    ),
    t1281,
  )
  let t1264 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(i : Num)"), @analysis.real_pos()),
  )
  let t1263 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]),
  )
  let t1262 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t1283 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv2()), t1262),
          t1263,
        ),
        t1264,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1282,
  ])
  let t1261 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_pos(),
      @real.real_abs_pos(),
      @real.real_le_inv_eq(),
      @equal.gsym(@real.real_abs_pow()),
    ]),
  )
  let t1260 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1259 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_mul_rid(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1284 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x1256 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s1257 = @equal.rand_conv(x1256)
                fn(x1258 : @kernel.Term) -> @kernel.Thm raise { s1257(x1258) }
              },
              @list.List([
                @bool.eqt_elim(
                  @calc_rat.real_rat_reduce_conv(
                    @term_syntax.parse_term("inv(real_of_num(4)) == inv(real_of_num(2)) * inv(real_of_num(2))"),
                  ),
                ),
              ]),
            ),
            t1259,
          ),
          t1260,
        ),
        t1261,
      ),
      @tactics.conj_tac,
    ),
    t1283,
  )
  let t1255 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @nums.not_suc()]),
  )
  let t1285 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@realax.real_mul_linv()), t1255),
    t1284,
  ])
  let t1254 = @tactics.subgoal_then(
    @term_syntax.parse_term("inv(real_of_num(SUC((i : Num)))) * real_of_num(SUC(i)) == real_of_num(1)"),
    fn(
      x1251 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1252 = @tactics.assume_tac(x1251)
      fn(
        x1253 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1252(x1253)
      }
    },
  )
  let t1250 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1249 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1248 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1247 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num()]))
  let t1246 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_pow(),
      @calc_int.real_abs_neg(),
      @realax.real_mul_lid(),
    ]),
  )
  let t1286 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @realax.real_div(),
                    @real.real_abs_mul(),
                    @calc_int.real_abs_neg(),
                    @real.real_abs_inv(),
                  ]),
                ),
                t1246,
              ),
              t1247,
            ),
            t1248,
          ),
          t1249,
        ),
        t1250,
      ),
      t1254,
    ),
    t1285,
  )
  let t1241 = @simp.asm_rewrite_tac(@list.List([]))
  let t1240 = @tactics.match_mp_tac(real_mono_pow2())
  let t1239 = @tactics.subst1_tac(
    @equal.sym(@calc_int.real_int_reduce_conv(@term_syntax.parse_term("pow(real_of_num(2), 2)"))),
  )
  let t1238 = @simp.rewrite_tac(@list.List([]))
  let t1237 = @tactics.conv_tac(
    @equal.land_conv(fn(x1236 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x1236))
    }),
  )
  let t1235 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1234 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @realax.real_mul_lid()]),
  )
  let t1233 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_abs_neg()]))
  let t1242 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@real.real_le_add2()),
                  t1233,
                ),
                t1234,
              ),
              t1235,
            ),
            t1237,
          ),
          t1238,
        ),
        t1239,
      ),
      t1240,
    ),
    t1241,
  )
  let t1232 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1231 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t1230 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_mul_lid(),
      @real.real_le_inv_eq(),
    ]),
  )
  let t1229 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1243 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@realarith.real_le_add()),
          t1229,
        ),
        t1230,
      ),
      t1231,
    ),
    t1232,
  )
  let t1228 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @nums.not_suc()]),
  )
  let t1227 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t1226 = @tactics.match_mp_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == real_of_num(1) → real_of_num(0) <= x && x <= real_of_num(1)")),
  )
  let t1225 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @arith.le()]),
  )
  let t1224 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t1223 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1222 = @simp.gen_rewrite_tac(
    fn(
      x1219 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1220 = @equal.rand_conv(x1219)
      fn(x1221 : @kernel.Term) -> @kernel.Thm raise { s1220(x1221) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1218 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_mul_lid(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1217 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @arith.lt_0()]),
  )
  let t1216 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(SUC(SUC((i : Num))))"))
  let t1244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.match_mp_tac(@real.real_le_rcancel_imp()),
                      t1216,
                    ),
                    t1217,
                  ),
                  t1218,
                ),
                t1222,
              ),
              t1223,
            ),
            t1224,
          ),
          t1225,
        ),
        t1226,
      ),
      t1227,
    ),
    t1228,
  )
  let t1215 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @nums.not_suc()]),
  )
  let t1214 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t1213 = @tactics.match_mp_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == real_of_num(1) → real_of_num(0) <= x")),
  )
  let t1212 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t1211 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t1210 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1209 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_lzero(),
      @real.real_of_num_lt(),
      @arith.lt_0(),
    ]),
  )
  let t1208 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(SUC(SUC((i : Num))))"))
  let t1245 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.match_mp_tac(@real.real_le_rcancel_imp()),
                    t1208,
                  ),
                  t1209,
                ),
                t1210,
              ),
              t1211,
            ),
            t1212,
          ),
          t1213,
        ),
        t1214,
      ),
      t1215,
    ),
    t1244,
    t1243,
    t1242,
  ])
  let t1207 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1206 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1205 = @simp.gen_rewrite_tac(
    fn(
      x1202 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1203 = @equal.rand_conv(x1202)
      fn(x1204 : @kernel.Term) -> @kernel.Thm raise { s1203(x1204) }
    },
    @list.List([@equal.gsym(@realax.real_mul_lid())]),
  )
  let t1201 = @simp.rewrite_tac(@list.List([]))
  let t1200 = @tactics.conv_tac(
    @equal.rand_conv(fn(x1199 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x1199))
    }),
  )
  let t1198 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1287 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
                  t1198,
                ),
                t1200,
              ),
              t1201,
            ),
            t1205,
          ),
          t1206,
        ),
        t1207,
      ),
      t1245,
    ),
    t1286,
  ])
  let t1197 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1196 = @simp.rewrite_tac(
    @list.List([@realax.real_add_assoc(), @analysis.real_le_radd()]),
  )
  let t1288 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x1193 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1194 = @equal.rand_conv(x1193)
              fn(x1195 : @kernel.Term) -> @kernel.Thm raise { s1194(x1195) }
            },
            @list.List([
              @equal.sym(
                @calc_rat.real_rat_reduce_conv(
                  @term_syntax.parse_term("(real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(4)) * real_of_num(3) + (real_of_num(1) / real_of_num(4) + real_of_num(1) / real_of_num(2))"),
                ),
              ),
            ]),
          ),
          t1196,
        ),
        t1197,
      ),
      @tactics.conj_tac,
    ),
    t1287,
  )
  let t1190 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t1191 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([@realax.real_mul_assoc(), @realax.real_mul_lid()]),
    ),
    t1190,
  )
  let t1189 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @nums.not_suc()]),
  )
  let t1192 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@realax.real_mul_linv()), t1189),
    t1191,
  ])
  let t1188 = @tactics.subgoal_then(
    @term_syntax.parse_term("inv(real_of_num(SUC((i : Num)))) * real_of_num(SUC(i)) == real_of_num(1)"),
    fn(
      x1185 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1186 = @tactics.assume_tac(x1185)
      fn(
        x1187 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1186(x1187)
      }
    },
  )
  let t1184 = @simp.gen_rewrite_tac(
    fn(
      x1181 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1182 = @equal.land_conv(x1181)
      fn(x1183 : @kernel.Term) -> @kernel.Thm raise { s1182(x1183) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1180 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1179 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @analysis.real_neg_neg(),
    ]),
  )
  let t1178 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realax.real_div(), @real.real_inv_mul()]),
  )
  let t1289 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.ap_term_tac, @tactics.ap_term_tac,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t1178,
                ),
                t1179,
              ),
              @tactics.ap_term_tac,
            ),
            t1180,
          ),
          t1184,
        ),
        t1188,
      ),
      t1192,
    ),
    t1288,
  ])
  let t1177 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) <= (d : Real) → a <= c → b <= d"),
    ),
  )
  let t1176 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @arith.lt_0()]),
  )
  let t1175 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_lt_01(), @realax.real_mul_lid()]),
  )
  let t1166 = @term_syntax.parse_term("real_of_num(SUC(SUC((i : Num))))")
  let t1167 = @term_syntax.parse_term("real_of_num(SUC((i : Num)))")
  let t1168 = @term_syntax.parse_term("real_of_num(3)")
  let t1169 = @term_syntax.parse_term("real_of_num(1)")
  let t1170 = @term_syntax.parse_term("-(pow(-(x : Real), SUC((i : Num))) / real_of_num(SUC(i)))")
  let t1171 = @term_syntax.parse_term("-(x : Real)")
  let t1172 = @term_syntax.parse_term("(u : Real)")
  let t1173 = @term_syntax.parse_term("(t : Real)")
  let t1174 = @term_syntax.parse_term("(s : Real)")
  let t1290 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.strip_tac,
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([
                    @term_syntax.parse_term("(n : Num)"),
                    t1174,
                    t1173,
                    t1172,
                    t1171,
                    t1170,
                    t1169,
                    t1168,
                    t1167,
                    t1166,
                  ]),
                  step_lemma2(),
                ),
              ),
            ),
            t1175,
          ),
          t1176,
        ),
        t1177,
      ),
      @tactics.conj_tac,
    ),
    t1289,
  )
  step_ln_c.set(
    @tactics.prove(
      @term_syntax.parse_term("2 <= (n : Num) && abs((x : Real)) <= real_of_num(1) / real_of_num(2) && abs((s : Real) - pow(real_of_num(2), n) * -x) <= real_of_num(1) && abs((t : Real) - pow(real_of_num(2), n) * -(pow(-x, SUC((i : Num))) / real_of_num(SUC(i)))) <= real_of_num(3) && real_of_num(2) * abs((u : Real) * (pow(real_of_num(2), n) * real_of_num(SUC(SUC(i)))) - real_of_num(SUC(i)) * (s * t)) <= pow(real_of_num(2), n) * real_of_num(SUC(SUC(i))) → abs(u - pow(real_of_num(2), n) * -(pow(-x, SUC(SUC(i))) / real_of_num(SUC(SUC(i))))) <= real_of_num(3)"),
      t1290,
    ),
  )
}

///|
let step_ln_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LN")

///|
/// `STEP_LN`
pub fn step_ln() -> @kernel.Thm {
  step_ln_c.get()
}

///|
/// EXPAND_RANGE_CONV
fn step_30() -> Unit raise {
  let t1291 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("(∀ k : Num, SUC(k) < 0 → (P : (Num) -> Bool)(k)) == true"),
    t1291,
  )
  let t1292 = @meson.meson_tac(@list.List([]))
  let t1293 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.lt()])),
    t1292,
  )
  let pth1 = @tactics.prove(
    @term_syntax.parse_term("(∀ k : Num, k < SUC((m : Num)) → (P : (Num) -> Bool)(k)) == ((∀ k : Num, k < m → P(k)) && P(m))"),
    t1293,
  )
  let t1294 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let pth2 = @tactics.prove(
    @term_syntax.parse_term("(∀ k : Num, k < 0 → (P : (Num) -> Bool)(k)) == true"),
    t1294,
  )
  let triv_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1295 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1295
    },
    @list.List([pth0]),
  )
  let trivial_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1296 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1296
    },
    @list.List([pth2]),
  )
  let nontrivial_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1297 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1297
    },
    @list.List([pth1]),
  )
  let s_tm = @term_syntax.parse_term("(s : Real)")
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  fn expand_conv(x1298 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1298
    trivial_conv(tm) catch {
      Failure(_) => {
        let mth = @calc_num.num_conv(
          @kernel.rand(@equal.lhand(@basics.body(@kernel.rand(tm)))),
        )
        let th1 = @equal.binder_conv(
          @equal.land_conv(
            @equal.rand_conv(fn(x1299 : @kernel.Term) -> @kernel.Thm raise {
              mth
            }),
          ),
        )(tm)
        let th2 = @kernel.trans(
          th1,
          nontrivial_conv(@kernel.rand(@kernel.concl(th1))),
        )
        let t1300 = @kernel.rand(@kernel.concl(th2))
        let t1301 = @equal.subs_conv(@list.List([@equal.sym(mth)]))
        let th3 = @equal.comb2_conv(@equal.rand_conv(expand_conv), t1301)(t1300)
        @kernel.trans(th2, th3)
      }
      e => raise e
    }
  }
  let t1302 = @simp.rewr_conv(@arith.lt_suc())
  let hack_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.orelsec(
    triv_conv,
    @equal.thenc(
      @equal.binder_conv(
        @equal.land_conv(
          @equal.thenc(@equal.rand_conv(@calc_num.num_conv), t1302),
        ),
      ),
      expand_conv,
    ),
  )
  expand_range_conv_c.set(hack_conv)
}

///|
let expand_range_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "EXPAND_RANGE_CONV",
)

///|
/// `EXPAND_RANGE_CONV`
pub fn expand_range_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_range_conv_c.get()(x)
}

///|
/// STEP_EXP_THM
fn step_31() -> Unit raise {
  let t1311 = @simp.asm_rewrite_tac(@list.List([]))
  let t1310 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t1309 = @simp.asm_rewrite_tac(@list.List([]))
  let t1307 = @term_syntax.parse_term("(t : (Num) -> Real)((i : Num))")
  let t1308 = @tactics.map_every(
    fn(
      x1304 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1305 = @tactics.exists_tac(x1304)
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
    @list.List([@term_syntax.parse_term("(s : Real)"), t1307]),
  )
  let t1303 = @tactics.match_mp_tac(@bool.gen_all(step_exp()))
  let t1312 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1303),
          t1308,
        ),
        t1309,
      ),
      t1310,
    ),
    t1311,
  )
  step_exp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && abs((t : (Num) -> Real)((i : Num)) - pow(real_of_num(2), n) * (pow(x, i) / real_of_num(FACT(i)))) <= (k : Real) → real_of_num(2) * abs(t(SUC(i)) * (pow(real_of_num(2), n) * real_of_num(SUC(i))) - s * t(i)) <= pow(real_of_num(2), n) * real_of_num(SUC(i)) → abs(t(SUC(i)) - pow(real_of_num(2), n) * (pow(x, SUC(i)) / real_of_num(FACT(SUC(i))))) <= real_of_num(2) / real_of_num(SUC(i)) * k + (real_of_num(1) / real_of_num(FACT(SUC(i))) + real_of_num(1) / real_of_num(2))"),
      t1312,
    ),
  )
}

///|
let step_exp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_THM")

///|
/// `STEP_EXP_THM`
pub fn step_exp_thm() -> @kernel.Thm {
  step_exp_thm_c.get()
}

///|
/// `STEP_EXP_RULE`
pub fn step_exp_rule(x1313 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x1313
  let th1 = @drule.match_mp(step_exp_thm())(th)
  let th2 = @bool.undisch(
    @simp.pure_rewrite_rule(@list.List([@calc_num.arith_suc()]))(th1),
  )
  let th3 = @equal.conv_rule(
    @equal.rand_conv(@equal.once_depth_conv(@calc_num.num_fact_conv)),
    th2,
  )
  let th4 = @equal.conv_rule(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
    th3,
  )
  let th5 = @kernel.assume_rule(
    @lib.find(
      fn(x1314 : @kernel.Term) -> Bool raise { @basics.is_conj(x1314) },
      @kernel.hyp(th),
    ),
  )
  let t1316 = @bool.conj_pair(th5)
  let t1317 = @bool.conjunct1(t1316.1)
  let (th6a, th6b) = (
    (fn(x1315 : @kernel.Thm) -> @kernel.Thm raise { x1315 })(t1316.0),
    t1317,
  )
  @bool.conj(th6a, @bool.conj(th6b, th4))
}

///|
/// STEP_EXP_0
fn step_32() -> Unit raise {
  let t1320 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_sub_refl(),
      @real.real_abs_0(),
      @analysis.real_le_refl(),
    ]),
  )
  let t1319 = @simp.rewrite_tac(
    @list.List([
      @realax.real_pow(),
      @arith.fact(),
      @realax.real_div(),
      @real.real_inv_1(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t1321 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @simp.asm_rewrite_tac(@list.List([])),
      ),
      t1319,
    ),
    t1320,
  )
  let t1322 = (
    @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) → abs(x) <= real_of_num(1) && abs(s - pow(real_of_num(2), n) * x) < real_of_num(1) && abs(t(0) - pow(real_of_num(2), n) * (pow(x, 0) / real_of_num(FACT(0)))) <= real_of_num(0)"),
    t1321,
  )
  step_exp_0_c.set(
    @bool.undisch(
      (fn(
        x1318 : (
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
        @tactics.prove(x1318.0, x1318.1)
      })(t1322),
    ),
  )
}

///|
let step_exp_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_0")

///|
/// `STEP_EXP_0`
pub fn step_exp_0() -> @kernel.Thm {
  step_exp_0_c.get()
}

///|
/// STEP_EXP_1
fn step_33() -> Unit raise {
  step_exp_1_c.set(step_exp_rule(step_exp_0()))
}

///|
let step_exp_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_1")

///|
/// `STEP_EXP_1`
pub fn step_exp_1() -> @kernel.Thm {
  step_exp_1_c.get()
}

///|
/// STEP_EXP_2
fn step_34() -> Unit raise {
  step_exp_2_c.set(step_exp_rule(step_exp_1()))
}

///|
let step_exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_2")

///|
/// `STEP_EXP_2`
pub fn step_exp_2() -> @kernel.Thm {
  step_exp_2_c.get()
}

///|
/// STEP_EXP_3
fn step_35() -> Unit raise {
  step_exp_3_c.set(step_exp_rule(step_exp_2()))
}

///|
let step_exp_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_3")

///|
/// `STEP_EXP_3`
pub fn step_exp_3() -> @kernel.Thm {
  step_exp_3_c.get()
}

///|
/// STEP_EXP_4
fn step_36() -> Unit raise {
  step_exp_4_c.set(step_exp_rule(step_exp_3()))
}

///|
let step_exp_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_4")

///|
/// `STEP_EXP_4`
pub fn step_exp_4() -> @kernel.Thm {
  step_exp_4_c.get()
}

///|
/// STEP_EXP_5
fn step_37() -> Unit raise {
  step_exp_5_c.set(step_exp_rule(step_exp_4()))
}

///|
let step_exp_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_EXP_5")

///|
/// `STEP_EXP_5`
pub fn step_exp_5() -> @kernel.Thm {
  step_exp_5_c.get()
}

///|
/// STEP_EXP_4_PLUS
fn step_38() -> Unit raise {
  let t1323 = @meson.meson_tac(@list.List([]))
  let t1324 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.lt()])),
    t1323,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("(∀ k : Num, k < SUC((m : Num)) → (P : (Num) -> Bool)(k)) == ((∀ k : Num, k < m → P(k)) && P(m))"),
    t1324,
  )
  let t1404 = @simp.rewrite_tac(
    @list.List([
      @calc_num.num_conv(@term_syntax.parse_term("5")),
      @arith.le_suc(),
      @arith.le_add(),
    ]),
  )
  let t1403 = @tactics.match_mp_tac(@arith.fact_mono())
  let t1402 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t1401 = @tactics.subst1_tac(
    @equal.sym(@calc_num.num_fact_conv(@term_syntax.parse_term("FACT(5)"))),
  )
  let t1400 = @simp.rewrite_tac(@list.List([]))
  let t1399 = @tactics.conv_tac(
    @equal.land_conv(fn(x1398 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(@calc_rat.real_arith(x1398))
    }),
  )
  let t1397 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1405 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([@realax.real_div(), @realax.real_mul_lid()]),
                ),
                t1397,
              ),
              t1399,
            ),
            t1400,
          ),
          t1401,
        ),
        t1402,
      ),
      t1403,
    ),
    t1404,
  )
  let t1396 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(d' : Num)"), @analysis.real_pos()),
  )
  let t1395 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]),
  )
  let t1394 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1393 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= real_of_num(4)"))]),
  )
  let t1392 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1391 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * real_of_num(2) == real_of_num(4)"))]),
  )
  let t1390 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @realax.real_mul_assoc()]),
  )
  let t1406 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
                    t1390,
                  ),
                  t1391,
                ),
                t1392,
              ),
              t1393,
            ),
            t1394,
          ),
          t1395,
        ),
        t1396,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1405,
  ])
  let t1389 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1388 = @simp.rewrite_tac(@list.List([]))
  let t1387 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1386 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) / real_of_num(5) + real_of_num(1) / real_of_num(120)"))
  let t1385 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1384 = @simp.rewrite_tac(
    @list.List([@analysis.real_le_radd(), @realax.real_add_assoc()]),
  )
  let t1407 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.gen_rewrite_tac(
                    fn(
                      x1381 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s1382 = @equal.rand_conv(x1381)
                      fn(x1383 : @kernel.Term) -> @kernel.Thm raise {
                        s1382(x1383)
                      }
                    },
                    @list.List([
                      @equal.sym(
                        @calc_rat.real_rat_reduce_conv(
                          @term_syntax.parse_term("real_of_num(3) / real_of_num(2) + real_of_num(1) / real_of_num(2)"),
                        ),
                      ),
                    ]),
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
        t1389,
      ),
      @tactics.conj_tac,
    ),
    t1406,
  )
  let t1378 = @simp.asm_rewrite_tac(@list.List([]))
  let t1379 = @tactics.then_tac(
    @tactics.first_assum(@tactics.match_mp_tac),
    t1378,
  )
  let t1377 = @simp.asm_rewrite_tac(@list.List([]))
  let t1380 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_lt_imp_le()), t1377),
    t1379,
  ])
  let t1376 = @simp.asm_rewrite_tac(@list.List([]))
  let t1375 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Num) -> Real)(4 + (d : Num))"))
  let t1374 = @tactics.exists_tac(@term_syntax.parse_term("(s : Real)"))
  let t1373 = @simp.asm_rewrite_tac(@list.List([]))
  let t1408 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(@bool.gen_all(step_exp())),
                t1373,
              ),
              t1374,
            ),
            t1375,
          ),
          t1376,
        ),
        @tactics.conj_tac,
      ),
      t1380,
    ),
    t1407,
  ])
  let t1372 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(2) / real_of_num(SUC(4 + (d : Num))) * real_of_num(2) + (real_of_num(1) / real_of_num(FACT(SUC(4 + d))) + real_of_num(1) / real_of_num(2))"),
  )
  let t1371 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1409 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@arith.add_clauses(), lemma])),
            @tactics.strip_tac,
          ),
          t1371,
        ),
        t1372,
      ),
      @tactics.conj_tac,
    ),
    t1408,
  )
  let t1370 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1369 = @tactics.match_mp_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (c : Real) → (a : Real) <= b → a <= c")),
  )
  let t1368 = @simp.asm_rewrite_tac(@list.List([]))
  let t1367 = @tactics.mp_tac(@bool.disch_all(step_exp_4()))
  let t1366 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t1365 = @simp.rewrite_tac(@list.List([@calc_num.arith_suc()]))
  let t1364 = @simp.rewrite_tac(@list.List([lemma]))
  let t1362 = @term_syntax.parse_term("4")
  let t1363 = @tactics.subst1_tac(
    @equal.top_depth_conv(@calc_num.num_conv)(t1362),
  )
  let t1410 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([@arith.add_clauses()])),
                      t1363,
                    ),
                    t1364,
                  ),
                  t1365,
                ),
                t1366,
              ),
              @tactics.strip_tac,
            ),
            t1367,
          ),
          t1368,
        ),
        t1369,
      ),
      t1370,
    ),
    t1409,
  ])
  let t1360 = @term_syntax.parse_term("(d : Num)")
  let t1361 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t1360)
  let t1359 = @simp.rewrite_tac(@list.List([@arith.lt_suc()]))
  let t1358 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1352 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1353 = @tactics.assume_tac(x1352)
        fn(
          x1354 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1353(x1354)
        }
      },
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
        let s1356 = @tactics.mp_tac(x1355)
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
    ),
  )
  let t1351 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1345 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1346 = @tactics.assume_tac(x1345)
        fn(
          x1347 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1346(x1347)
        }
      },
      fn(
        x1348 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1349 = @tactics.mp_tac(x1348)
        fn(
          x1350 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1349(x1350)
        }
      },
    ),
  )
  let t1344 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1338 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1339 = @tactics.assume_tac(x1338)
        fn(
          x1340 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1339(x1340)
        }
      },
      fn(
        x1341 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1342 = @tactics.mp_tac(x1341)
        fn(
          x1343 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1342(x1343)
        }
      },
    ),
  )
  let t1334 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t1335 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x1331 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1332 = @tactics.subst1_tac(x1331)
    fn(
      x1333 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1332(x1333)
    }
  })
  let t1337 = @tactics.pop_assum(fn(
    x1336 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1335(t1334(x1336))
  })
  let t1411 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_then(
                    @tactics.conjuncts_then2(
                      fn(
                        x1325 : @kernel.Thm,
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
                        let s1326 = @tactics.assume_tac(x1325)
                        fn(
                          x1327 : (
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
                          s1326(x1327)
                        }
                      },
                      fn(
                        x1328 : @kernel.Thm,
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
                        let s1329 = @tactics.mp_tac(x1328)
                        fn(
                          x1330 : (
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
                          s1329(x1330)
                        }
                      },
                    ),
                  ),
                  t1337,
                ),
                t1344,
              ),
              t1351,
            ),
            t1358,
          ),
          t1359,
        ),
        t1361,
      ),
      @nums.induct_tac,
    ),
    t1410,
  )
  step_exp_4_plus_c.set(
    @tactics.prove(
      @term_syntax.parse_term("4 <= (m : Num) && abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < SUC(m) → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(t(m) - pow(real_of_num(2), n) * (pow(x, m) / real_of_num(FACT(m)))) <= real_of_num(2)"),
      t1411,
    ),
  )
}

///|
let step_exp_4_plus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STEP_EXP_4_PLUS",
)

///|
/// `STEP_EXP_4_PLUS`
pub fn step_exp_4_plus() -> @kernel.Thm {
  step_exp_4_plus_c.get()
}

///|
/// STEPS_EXP_0
fn step_39() -> Unit raise {
  let t1412 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_rzero(),
      @real.real_abs_0(),
      @analysis.real_sub_refl(),
      @analysis.real_le_refl(),
    ]),
  )
  let t1413 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      @simp.asm_rewrite_tac(@list.List([@analysis.sum()])),
    ),
    t1412,
  )
  steps_exp_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < 0 → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, 0), t) - pow(real_of_num(2), n) * sum((0, 0), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(0)"),
      t1413,
    ),
  )
}

///|
let steps_exp_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP_0")

///|
/// `STEPS_EXP_0`
pub fn steps_exp_0() -> @kernel.Thm {
  steps_exp_0_c.get()
}

///|
/// STEPS_EXP_1
fn step_40() -> Unit raise {
  let t1421 = @simp.asm_rewrite_tac(@list.List([]))
  let t1420 = @tactics.mp_tac(@bool.disch_all(step_exp_0()))
  let t1419 = @simp.rewrite_tac(@list.List([]))
  let t1418 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1417 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t1416 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1415 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1414 = @simp.rewrite_tac(@list.List([]))
  let t1422 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.conv_tac(@equal.once_depth_conv(expand_range_conv)),
                    t1414,
                  ),
                  @tactics.strip_tac,
                ),
                t1415,
              ),
              t1416,
            ),
            t1417,
          ),
          t1418,
        ),
        t1419,
      ),
      t1420,
    ),
    t1421,
  )
  steps_exp_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < 1 → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, 1), t) - pow(real_of_num(2), n) * sum((0, 1), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(1)"),
      t1422,
    ),
  )
}

///|
let steps_exp_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP_1")

///|
/// `STEPS_EXP_1`
pub fn steps_exp_1() -> @kernel.Thm {
  steps_exp_1_c.get()
}

///|
/// STEPS_EXP_2
fn step_41() -> Unit raise {
  let t1434 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1435 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_1())),
    t1434,
  )
  let t1433 = @simp.asm_rewrite_tac(@list.List([]))
  let t1436 = @list.List([
    @tactics.then_tac(@tactics.mp_tac(@bool.disch_all(step_exp_0())), t1433),
    t1435,
  ])
  let t1432 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1431 = @tactics.match_mp_tac(
    @real.real_le_imp(
      @calc_rat.real_arith(@term_syntax.parse_term("abs((a : Real) + (b : Real)) <= abs(a) + abs(b)")),
    ),
  )
  let t1430 = @simp.rewrite_tac(@list.List([]))
  let t1429 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1428 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0) + real_of_num(3) / real_of_num(2)"))
  let t1427 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1426 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(a : Real) + (b : Real) - ((c : Real) + (d : Real)) == a - c + (b - d)"),
      ),
    ]),
  )
  let t1425 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t1424 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1423 = @simp.rewrite_tac(@list.List([]))
  let t1437 = @tactics.thenl(
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
                              @equal.once_depth_conv(expand_range_conv),
                            ),
                            t1423,
                          ),
                          @tactics.strip_tac,
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
              t1429,
            ),
            t1430,
          ),
          t1431,
        ),
        t1432,
      ),
      @tactics.conj_tac,
    ),
    t1436,
  )
  steps_exp_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < 2 → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, 2), t) - pow(real_of_num(2), n) * sum((0, 2), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(2)"),
      t1437,
    ),
  )
}

///|
let steps_exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP_2")

///|
/// `STEPS_EXP_2`
pub fn steps_exp_2() -> @kernel.Thm {
  steps_exp_2_c.get()
}

///|
/// STEPS_EXP_3
fn step_42() -> Unit raise {
  let t1451 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1452 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_2())),
    t1451,
  )
  let t1450 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1453 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_1())),
    t1450,
  )
  let t1449 = @simp.asm_rewrite_tac(@list.List([]))
  let t1454 = @list.List([
    @tactics.then_tac(@tactics.mp_tac(@bool.disch_all(step_exp_0())), t1449),
    t1453,
    t1452,
  ])
  let t1447 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1448 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @real.real_le_imp(
            @calc_rat.real_arith(
              @term_syntax.parse_term("abs((a : Real) + (b : Real)) <= abs(a) + abs(b)"),
            ),
          ),
        ),
        t1447,
      ),
      @tactics.conj_tac,
    ),
  )
  let t1446 = @simp.rewrite_tac(@list.List([]))
  let t1445 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1444 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0) + (real_of_num(3) / real_of_num(2) + real_of_num(5) / real_of_num(2))"))
  let t1443 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1442 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_assoc())]),
  )
  let t1441 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(a : Real) + (b : Real) - ((c : Real) + (d : Real)) == a - c + (b - d)"),
      ),
    ]),
  )
  let t1440 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t1439 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1438 = @simp.rewrite_tac(@list.List([]))
  let t1455 = @tactics.thenl(
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
                            @equal.once_depth_conv(expand_range_conv),
                          ),
                          t1438,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1439,
                    ),
                    t1440,
                  ),
                  t1441,
                ),
                t1442,
              ),
              t1443,
            ),
            t1444,
          ),
          t1445,
        ),
        t1446,
      ),
      t1448,
    ),
    t1454,
  )
  steps_exp_3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < 3 → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, 3), t) - pow(real_of_num(2), n) * sum((0, 3), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(3)"),
      t1455,
    ),
  )
}

///|
let steps_exp_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP_3")

///|
/// `STEPS_EXP_3`
pub fn steps_exp_3() -> @kernel.Thm {
  steps_exp_3_c.get()
}

///|
/// STEPS_EXP_4
fn step_43() -> Unit raise {
  let t1470 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1471 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_3())),
    t1470,
  )
  let t1469 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1472 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_2())),
    t1469,
  )
  let t1468 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1473 = @tactics.then_tac(
    @tactics.mp_tac(@bool.disch_all(step_exp_1())),
    t1468,
  )
  let t1467 = @simp.asm_rewrite_tac(@list.List([]))
  let t1474 = @list.List([
    @tactics.then_tac(@tactics.mp_tac(@bool.disch_all(step_exp_0())), t1467),
    t1473,
    t1472,
    t1471,
  ])
  let t1465 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1466 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @real.real_le_imp(
            @calc_rat.real_arith(
              @term_syntax.parse_term("abs((a : Real) + (b : Real)) <= abs(a) + abs(b)"),
            ),
          ),
        ),
        t1465,
      ),
      @tactics.conj_tac,
    ),
  )
  let t1464 = @simp.rewrite_tac(@list.List([]))
  let t1463 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1462 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(0) + (real_of_num(3) / real_of_num(2) + (real_of_num(5) / real_of_num(2) + real_of_num(7) / real_of_num(3)))"),
  )
  let t1461 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1460 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_assoc())]),
  )
  let t1459 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(a : Real) + (b : Real) - ((c : Real) + (d : Real)) == a - c + (b - d)"),
      ),
    ]),
  )
  let t1458 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t1457 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1456 = @simp.rewrite_tac(@list.List([]))
  let t1475 = @tactics.thenl(
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
                            @equal.once_depth_conv(expand_range_conv),
                          ),
                          t1456,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1457,
                    ),
                    t1458,
                  ),
                  t1459,
                ),
                t1460,
              ),
              t1461,
            ),
            t1462,
          ),
          t1463,
        ),
        t1464,
      ),
      t1466,
    ),
    t1474,
  )
  steps_exp_4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < 4 → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, 4), t) - pow(real_of_num(2), n) * sum((0, 4), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(4)"),
      t1475,
    ),
  )
}

///|
let steps_exp_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP_4")

///|
/// `STEPS_EXP_4`
pub fn steps_exp_4() -> @kernel.Thm {
  steps_exp_4_c.get()
}

///|
/// STEPS_EXP_LEMMA
fn step_44() -> Unit raise {
  let t1513 = @simp.asm_rewrite_tac(@list.List([]))
  let t1512 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
      x1509 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1510 = @tactics.subst1_tac(x1509)
      fn(
        x1511 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1510(x1511)
      }
    }),
  )
  let t1508 = @simp.rewrite_tac(@list.List([@calc_num.arith_suc()]))
  let t1507 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t1506 = @term_syntax.parse_term("4")
  let t1514 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.subst1_tac(@equal.top_depth_conv(@calc_num.num_conv)(t1506)),
          t1507,
        ),
        t1508,
      ),
      t1512,
    ),
    t1513,
  )
  let t1505 = @simp.asm_rewrite_tac(@list.List([]))
  let t1504 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1501 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t1502 = @tactics.choose_then(fn(
    x1498 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1499 = @tactics.subst1_tac(x1498)
    fn(
      x1500 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1499(x1500)
    }
  })
  let t1515 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x1503 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          t1502(t1501(x1503))
        }),
        t1504,
      ),
      t1505,
    ),
    t1514,
  ])
  let t1496 = @term_syntax.parse_term("(m : Num)")
  let t1497 = @bool.specl(
    @list.List([@term_syntax.parse_term("4"), t1496]),
    @arith.le_cases(),
  )
  let t1516 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.disj_cases_then(fn(
        x1493 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1494 = @tactics.mp_tac(x1493)
        fn(
          x1495 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1494(x1495)
        }
      })(t1497),
    ),
    t1515,
  )
  let t1490 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t1489 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1488 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1487 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1491 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()])),
          t1487,
        ),
        t1488,
      ),
      t1489,
    ),
    t1490,
  )
  let t1486 = @simp.asm_rewrite_tac(@list.List([]))
  let t1485 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1484 = @simp.asm_rewrite_tac(@list.List([]))
  let t1492 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1484),
        t1485,
      ),
      t1486,
    ),
    t1491,
  ])
  let t1483 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1482 = @tactics.match_mp_tac(
    @real.real_le_imp(
      @calc_rat.real_arith(@term_syntax.parse_term("abs((a : Real) + (b : Real)) <= abs(a) + abs(b)")),
    ),
  )
  let t1481 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t1480 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_add())]),
  )
  let t1479 = @simp.rewrite_tac(@list.List([@analysis.sum(), @arith.add1()]))
  let t1517 = @list.List([
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
                      @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()])),
                    ),
                    @tactics.disch_tac,
                  ),
                  t1479,
                ),
                t1480,
              ),
              t1481,
            ),
            t1482,
          ),
          t1483,
        ),
        @tactics.conj_tac,
      ),
      t1492,
    ),
    t1516,
  ])
  let t1518 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.strip_tac,
      @tactics.subgoal_then(
        @term_syntax.parse_term("∀ d : Num, (P : (Num) -> Bool)(d + 4) → abs(sum((0, d + 4), (z : (Num) -> Real))) <= real_of_num(2) * real_of_num(d + 4)"),
        fn(
          x1476 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1477 = @tactics.assume_tac(x1476)
          fn(
            x1478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1477(x1478)
          }
        },
      ),
    ),
    t1517,
  )
  steps_exp_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ k : Num, (P : (Num) -> Bool)(SUC(k)) → P(k)) && (P(0) → abs(sum((0, 0), (z : (Num) -> Real))) <= real_of_num(2) * real_of_num(0)) && (P(1) → abs(sum((0, 1), z)) <= real_of_num(2) * real_of_num(1)) && (P(2) → abs(sum((0, 2), z)) <= real_of_num(2) * real_of_num(2)) && (P(3) → abs(sum((0, 3), z)) <= real_of_num(2) * real_of_num(3)) && (P(4) → abs(sum((0, 4), z)) <= real_of_num(2) * real_of_num(4)) && (∀ m : Num, 4 <= m && P(SUC(m)) → abs(z(m)) <= real_of_num(2)) → (∀ m : Num, P(m) → abs(sum((0, m), z)) <= real_of_num(2) * real_of_num(m))"),
      t1518,
    ),
  )
}

///|
let steps_exp_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STEPS_EXP_LEMMA",
)

///|
/// `STEPS_EXP_LEMMA`
pub fn steps_exp_lemma() -> @kernel.Thm {
  steps_exp_lemma_c.get()
}

///|
/// STEPS_EXP
fn step_45() -> Unit raise {
  let t1531 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t1530 = @simp.asm_rewrite_tac(@list.List([]))
  let t1529 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num)"))
  let t1528 = @tactics.match_mp_tac(@arith.lt_trans())
  let t1527 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1526 = @simp.asm_rewrite_tac(@list.List([]))
  let t1525 = @simp.rewrite_tac(@list.List([steps_exp_4(), step_exp_4_plus()]))
  let t1524 = @simp.rewrite_tac(
    @list.List([steps_exp_0(), steps_exp_1(), steps_exp_2(), steps_exp_3()]),
  )
  let t1522 = @equal.gsym(real_mul_rsum0())
  let t1523 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_sub_sum0()), t1522]),
  )
  let t1521 = @tactics.match_mp_tac(steps_exp_lemma())
  let t1519 = @term_syntax.parse_term("(m : Num)")
  let t1520 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t1519)
  let t1532 = @tactics.then_tac(
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
                                  @list.List([real_mul_rsum0(), real_sub_sum0()]),
                                ),
                                t1520,
                              ),
                              t1521,
                            ),
                            t1523,
                          ),
                          t1524,
                        ),
                        t1525,
                      ),
                      @tactics.gen_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t1526,
                ),
                @tactics.gen_tac,
              ),
              @tactics.disch_tac,
            ),
            t1527,
          ),
          t1528,
        ),
        t1529,
      ),
      t1530,
    ),
    t1531,
  )
  steps_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), (n : Num)) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), n) && (∀ k : Num, SUC(k) < (m : Num) → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), n) * real_of_num(SUC(k))) → abs(sum((0, m), t) - pow(real_of_num(2), n) * sum((0, m), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) <= real_of_num(2) * real_of_num(m)"),
      t1532,
    ),
  )
}

///|
let steps_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_EXP")

///|
/// `STEPS_EXP`
pub fn steps_exp() -> @kernel.Thm {
  steps_exp_c.get()
}

///|
/// STEPS_LN
fn step_46() -> Unit raise {
  let t1705 = @simp.rewrite_tac(
    @list.List([
      @real.real_of_num_lt(),
      @calc_num.arith(),
      @realax.real_of_num_le(),
    ]),
  )
  let t1706 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv2()), t1705),
    @int.arith_tac,
  )
  let t1702 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t1701 = @tactics.match_mp_tac(@real.real_pow_mono())
  let t1700 = @list.List([
    @tactics.conv_tac(@calc_rat.real_rat_reduce_conv),
    @tactics.all_tac,
  ])
  let t1699 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1703 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@real.real_pow_inv()])),
              t1699,
            ),
            @tactics.conj_tac,
          ),
          t1700,
        ),
        t1701,
      ),
      t1702,
    ),
    @int.arith_tac,
  )
  let t1698 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1697 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1704 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), t1697),
      t1698,
    ),
    t1703,
  ])
  let t1696 = @tactics.exists_tac(@term_syntax.parse_term("pow(inv(real_of_num(2)), SUC((p : Num)))"))
  let t1707 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@analysis.real_le_trans()),
          t1696,
        ),
        @tactics.conj_tac,
      ),
      t1704,
    ),
    t1706,
  ])
  let t1695 = @simp.simp_tac(
    @list.List([
      @real.real_abs_pos(),
      @real.real_pow_le(),
      @real.real_le_inv_eq(),
      @arith.le_0(),
      @realax.real_of_num_le(),
    ]),
  )
  let t1694 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1693 = @list.List([
    @tactics.all_tac,
    @tactics.conv_tac(@calc_rat.real_rat_reduce_conv),
  ])
  let t1692 = @tactics.exists_tac(@term_syntax.parse_term("pow(inv(real_of_num(2)), 1) * inv(real_of_num(2))"))
  let t1691 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1690 = @simp.rewrite_tac(
    @list.List([@real.real_pow_one(), @realax.real_mul_lid()]),
  )
  let t1689 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_rid(),
      @realax.real_div(),
      @real.real_abs_mul(),
      @real.real_abs_pow(),
      @calc_int.real_abs_neg(),
      @calc_int.real_abs_num(),
      @real.real_abs_inv(),
    ]),
  )
  let t1688 = @simp.asm_simp_tac(
    @list.List([
      @real.real_le_lmul(),
      @real.real_abs_pos(),
      @analysis.real_lt_imp_le(),
    ]),
  )
  let t1687 = @tactics.exists_tac(
    @term_syntax.parse_term("abs(pow(-real_of_num(1), (p : Num)) * (pow((x : Real), SUC(p)) / real_of_num(SUC(SUC(p))))) * real_of_num(1)"),
  )
  let t1686 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1685 = @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t1683 = @simp.rewrite_tac(
    @list.List([@analysis.real_neg_neg(), @real.real_mul_ac()]),
  )
  let t1682 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @realax.real_mul_lid(),
    ]),
  )
  let t1681 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_sub_ldistrib(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1684 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @realax.real_pow(),
              @realax.real_div(),
              @equal.gsym(@real.real_of_num_suc()),
            ]),
          ),
          t1681,
        ),
        t1682,
      ),
      t1683,
    ),
    @tactics.all_tac,
  ])
  let t1680 = @tactics.subgoal_then(
    @term_syntax.parse_term("pow(-real_of_num(1), (p : Num)) * ((s : Real) * (pow((x : Real), SUC(p)) / real_of_num(SUC(SUC(p))))) - pow(real_of_num(2), (n : Num)) * (pow(-real_of_num(1), SUC(p)) * (pow(x, SUC(SUC(p))) / real_of_num(SUC(SUC(p))))) == pow(-real_of_num(1), p) * (pow(x, SUC(p)) / real_of_num(SUC(SUC(p)))) * (s - pow(real_of_num(2), n) * -x)"),
    fn(
      x1677 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1678 = @tactics.subst1_tac(x1677)
      fn(
        x1679 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1678(x1679)
      }
    },
  )
  let t1673 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t1672 = @tactics.match_mp_tac(@real.real_pow_mono())
  let t1671 = @tactics.subst1_tac(
    @equal.sym(@calc_int.real_int_reduce_conv(@term_syntax.parse_term("pow(real_of_num(2), 2)"))),
  )
  let t1670 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @calc_num.arith()]),
  )
  let t1669 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1668 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @realax.real_mul_lid()]),
  )
  let t1667 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1666 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@analysis.real_le_sub_ladd())]),
  )
  let t1665 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t1664 = @simp.rewrite_tac(@list.List([@analysis.real_le_sub_ladd()]))
  let t1663 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_lid(), @analysis.real_mul_rid()]),
  )
  let t1662 = @simp.simp_tac(
    @list.List([
      @analysis.real_mul_rinv(),
      @real.real_pow_eq_0(),
      @realax.real_of_num_eq(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1661 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @analysis.real_sub_rdistrib(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1660 = @simp.asm_rewrite_tac(@list.List([]))
  let t1659 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"))
  let t1658 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1657 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t1656 = @simp.simp_tac(
    @list.List([
      @realax.real_mul_assoc(),
      @realax.real_mul_linv(),
      @real.real_pow_eq_0(),
      @realax.real_of_num_eq(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1655 = @simp.gen_rewrite_tac(
    fn(
      x1652 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1653 = @equal.land_conv(x1652)
      fn(x1654 : @kernel.Term) -> @kernel.Thm raise { s1653(x1654) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1651 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_mul(),
      @calc_int.real_abs_neg(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t1650 = @simp.simp_tac(
    @list.List([
      @real.real_lt_inv_eq(),
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
    ]),
  )
  let t1649 = @tactics.exists_tac(@term_syntax.parse_term("inv(pow(real_of_num(2), (n : Num)))"))
  let t1648 = @tactics.match_mp_tac(@real.real_le_rcancel_imp())
  let t1647 = @simp.asm_rewrite_tac(@list.List([]))
  let t1646 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * -(x : Real)"))
  let t1645 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ y : Real, abs((x : Real) - y) < real_of_num(1) && abs(y) <= (d : Real) - real_of_num(1) → abs(x) <= d"),
    ),
  )
  let t1644 = @simp.simp_tac(
    @list.List([
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t1643 = @simp.simp_tac(
    @list.List([
      @realax.real_mul_linv(),
      @real.real_pow_eq_0(),
      @realax.real_of_num_eq(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1642 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1641 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num))"))
  let t1674 = @tactics.then_tac(
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
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.then_tac(
                                                              @tactics.match_mp_tac(
                                                                @real.real_le_rcancel_imp(),
                                                              ),
                                                              t1641,
                                                            ),
                                                            t1642,
                                                          ),
                                                          t1643,
                                                        ),
                                                        t1644,
                                                      ),
                                                      t1645,
                                                    ),
                                                    t1646,
                                                  ),
                                                  t1647,
                                                ),
                                                t1648,
                                              ),
                                              t1649,
                                            ),
                                            t1650,
                                          ),
                                          t1651,
                                        ),
                                        t1655,
                                      ),
                                      t1656,
                                    ),
                                    t1657,
                                  ),
                                  t1658,
                                ),
                                t1659,
                              ),
                              t1660,
                            ),
                            t1661,
                          ),
                          t1662,
                        ),
                        t1663,
                      ),
                      t1664,
                    ),
                    t1665,
                  ),
                  t1666,
                ),
                t1667,
              ),
              t1668,
            ),
            t1669,
          ),
          t1670,
        ),
        t1671,
      ),
      t1672,
    ),
    t1673,
  )
  let t1640 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]),
  )
  let t1639 = @simp.rewrite_tac(
    @list.List([
      @real.real_inv_1(),
      @realax.real_mul_lid(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t1638 = @simp.simp_tac(
    @list.List([
      @realax.real_mul_assoc(),
      @analysis.real_mul_rinv(),
      @realax.real_of_num_eq(),
      @nums.not_suc(),
    ]),
  )
  let t1637 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(SUC(SUC((p : Num))))"))
  let t1675 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(@real.real_le_lcancel_imp()),
              t1637,
            ),
            t1638,
          ),
          t1639,
        ),
        t1640,
      ),
      @int.arith_tac,
    ),
    t1674,
  ])
  let t1636 = @simp.simp_tac(
    @list.List([
      @analysis.real_le_mul(),
      @real.real_le_inv_eq(),
      @analysis.real_pos(),
      @real.real_pow_le(),
      @real.real_abs_pos(),
    ]),
  )
  let t1635 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1634 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1633 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t1632 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1631 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1630 = @simp.rewrite_tac(@list.List([]))
  let t1629 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1628 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num(1)) * (real_of_num(3) / real_of_num(4) * real_of_num(3))"))
  let t1627 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1625 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * (e : Real)))) == d * a * (b * c * e)")
  let t1626 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t1625)]),
  )
  let t1624 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1623 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t1622 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_mul(),
      @calc_int.real_abs_num(),
      @real.real_abs_inv(),
      @real.real_abs_pow(),
    ]),
  )
  let t1621 = @simp.asm_simp_tac(
    @list.List([@real.real_le_lmul(), @real.real_abs_pos()]),
  )
  let t1620 = @tactics.exists_tac(
    @term_syntax.parse_term("abs(real_of_num(SUC((p : Num))) * ((s : Real) * inv(pow(real_of_num(2), (n : Num)) * real_of_num(SUC(SUC(p)))))) * real_of_num(3)"),
  )
  let t1619 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1618 = @simp.gen_rewrite_tac(
    fn(
      x1617 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1613 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1607 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1608 = @equal.land_conv(x1607)
          fn(x1609 : @kernel.Term) -> @kernel.Thm raise { s1608(x1609) }
        })(
          (fn(
            x1610 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1611 = @equal.land_conv(x1610)
            fn(x1612 : @kernel.Term) -> @kernel.Thm raise { s1611(x1612) }
          })(x1613),
        )
      })(
        (fn(
          x1614 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1615 = @equal.redepth_conv(x1614)
          fn(x1616 : @kernel.Term) -> @kernel.Thm raise { s1615(x1616) }
        })(x1617),
      )
    },
    @list.List([@equal.gsym(@real.real_abs_mul())]),
  )
  let t1605 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == a * (b * d) * c")
  let t1606 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t1605)]),
  )
  let t1604 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t1603 = @simp.rewrite_tac(
    @list.List([@real.real_abs_mul(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1602 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_mul_assoc(),
      @equal.gsym(@analysis.real_sub_rdistrib()),
    ]),
  )
  let t1601 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@analysis.real_sub_ldistrib()),
      @real.real_abs_mul(),
    ]),
  )
  let t1599 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t1598 = @simp.simp_tac(
    @list.List([
      @realax.real_mul_linv(),
      @real.real_pow_eq_0(),
      @realax.real_of_num_eq(),
      @calc_num.arith(),
      @nums.not_suc(),
    ]),
  )
  let t1596 = @term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * ((f : Real) * ((g : Real) * (h : Real))))))) == d * (b * (e * (h * (g * c * (f * a)))))")
  let t1597 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t1596)]),
  )
  let t1600 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @realax.real_div(),
              @equal.gsym(@realax.real_mul_assoc()),
              @real.real_inv_mul(),
            ]),
          ),
          t1597,
        ),
        t1598,
      ),
      t1599,
    ),
    @tactics.all_tac,
  ])
  let t1676 = @list.List([
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
                                                          @term_syntax.parse_term("pow(-real_of_num(1), (p : Num)) * ((s : Real) * (pow((x : Real), SUC(p)) / real_of_num(SUC(SUC(p))))) == real_of_num(SUC(p)) * (s * (pow(real_of_num(2), (n : Num)) * (pow(-real_of_num(1), p) * (pow(x, SUC(p)) / real_of_num(SUC(p)))) / (pow(real_of_num(2), n) * real_of_num(SUC(SUC(p))))))"),
                                                          fn(
                                                            x1593 : @kernel.Thm,
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
                                                            let s1594 = @tactics.subst1_tac(
                                                              x1593,
                                                            )
                                                            fn(
                                                              x1595 : (
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
                                                              s1594(x1595)
                                                            }
                                                          },
                                                        ),
                                                        t1600,
                                                      ),
                                                      t1601,
                                                    ),
                                                    t1602,
                                                  ),
                                                  t1603,
                                                ),
                                                t1604,
                                              ),
                                              t1606,
                                            ),
                                            t1618,
                                          ),
                                          t1619,
                                        ),
                                        t1620,
                                      ),
                                      t1621,
                                    ),
                                    t1622,
                                  ),
                                  t1623,
                                ),
                                t1624,
                              ),
                              t1626,
                            ),
                            t1627,
                          ),
                          t1628,
                        ),
                        t1629,
                      ),
                      t1630,
                    ),
                    t1631,
                  ),
                  t1632,
                ),
                t1633,
              ),
              t1634,
            ),
            t1635,
          ),
          t1636,
        ),
        @tactics.conj_tac,
      ),
      t1675,
    ),
    @tactics.all_tac,
  ])
  let t1592 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1591 = @simp.once_rewrite_tac(
    @list.List([
      @equal.sym(
        @calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(9) / real_of_num(4) + real_of_num(1) / real_of_num(4)")),
      ),
    ]),
  )
  let t1590 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(-real_of_num(1), (p : Num)) * ((s : Real) * (pow((x : Real), SUC(p)) / real_of_num(SUC(SUC(p)))))"),
  )
  let t1589 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ y : Real, abs((x : Real) - y) + abs(y - (z : Real)) <= (e : Real) → abs(x - z) <= e"),
    ),
  )
  let t1587 = @simp.simp_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      @realax.real_mul_linv(),
      @analysis.real_mul_rid(),
      @analysis.real_lt_imp_nz(),
    ]),
  )
  let t1586 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, real_of_num(0) < a → b * (c * (d / a)) * a == b * (c * d)"),
    fn(
      x1584 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_2 = x1584
      @simp.asm_simp_tac(@list.List([th_2]))
    },
  )
  let t1583 = @simp.rewrite_tac(@list.List([@analysis.real_sub_rdistrib()]))
  let t1582 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc()), @realax.real_mul_lid()]),
  )
  let t1581 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1580 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1579 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2)"))
  let t1578 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t1576 = @simp.asm_simp_tac(
    @list.List([@realax.real_abs(), @analysis.real_lt_imp_le()]),
  )
  let t1575 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t1577 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1575),
        @tactics.ap_term_tac,
      ),
      t1576,
    ),
    @tactics.all_tac,
  ])
  let t1574 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < y → abs(x) * y == abs(x * y)"),
    fn(
      x1572 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x1572
      @simp.asm_simp_tac(@list.List([th_1]))
    },
  )
  let t1571 = @simp.asm_rewrite_tac(@list.List([]))
  let t1569 = @simp.simp_tac(
    @list.List([
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @arith.lt_0(),
      @calc_num.arith(),
    ]),
  )
  let t1570 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t1569),
    @tactics.all_tac,
  ])
  let t1568 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(0) < pow(real_of_num(2), (n : Num)) * real_of_num(SUC(SUC((p : Num))))"),
    fn(
      x1565 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1566 = @tactics.assume_tac(x1565)
      fn(
        x1567 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1566(x1567)
      }
    },
  )
  let t1564 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * real_of_num(SUC(SUC((p : Num))))"),
  )
  let t1588 = @list.List([
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
                                @tactics.match_mp_tac(
                                  @real.real_le_rcancel_imp(),
                                ),
                                t1564,
                              ),
                              t1568,
                            ),
                            t1570,
                          ),
                          t1571,
                        ),
                        t1574,
                      ),
                      t1577,
                    ),
                    t1578,
                  ),
                  t1579,
                ),
                t1580,
              ),
              t1581,
            ),
            t1582,
          ),
          t1583,
        ),
        t1586,
      ),
      t1587,
    ),
    @tactics.all_tac,
  ])
  let t1563 = @tactics.match_mp_tac(@real.real_le_add2())
  let t1562 = @simp.once_rewrite_tac(
    @list.List([
      @equal.sym(
        @calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) + real_of_num(5) / real_of_num(2)")),
      ),
    ]),
  )
  let t1561 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(SUC((p : Num))) * ((s : Real) * ((t : (Num) -> Real)(p) / (pow(real_of_num(2), (n : Num)) * real_of_num(SUC(SUC(p))))))"),
  )
  let t1560 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ y : Real, abs((x : Real) - y) + abs(y - (z : Real)) <= (e : Real) → abs(x - z) <= e"),
    ),
  )
  let t1559 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("SUC((p : Num)) < (m : Num)")),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1557 = @tactics.ante_res_then(fn(
    x1554 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1555 = @tactics.mp_tac(x1554)
    fn(
      x1556 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1555(x1556)
    }
  })
  let t1558 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) < (m : Num)"), t1557)
  let t1553 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x1550 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1551 = @tactics.mp_tac(x1550)
      fn(
        x1552 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1551(x1552)
      }
    }),
  )
  let t1549 = @tactics.disch_then(fn(
    x1546 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1546
    let t1548 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t1548)
  })
  let t1544 = @simp.asm_simp_tac(
    @list.List([
      @calc_int.real_abs_neg(),
      @analysis.real_lt_imp_le(),
      @realax.real_of_num_le(),
      @calc_num.arith(),
    ]),
  )
  let t1543 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1542 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1541 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("-(a : Real) - (b : Real) * (c : Real) == -(a - b * -c)")),
    ]),
  )
  let t1540 = @simp.asm_rewrite_tac(@list.List([]))
  let t1545 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @realax.real_pow(),
                    @calc_num.arith(),
                    @real.real_div_1(),
                    @realax.real_mul_lid(),
                    @analysis.real_mul_rid(),
                  ]),
                ),
                @tactics.disch_tac,
              ),
              t1540,
            ),
            t1541,
          ),
          t1542,
        ),
        t1543,
      ),
      t1544,
    ),
    @tactics.all_tac,
  ])
  let t1539 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.le_0()]),
  )
  let t1538 = @tactics.match_mp_tac(@analysis.sum_bound())
  let t1537 = @tactics.match_mp_tac(@real.real_le_imp(@analysis.sum_abs_le()))
  let t1536 = @simp.gen_rewrite_tac(
    fn(
      x1533 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1534 = @equal.rand_conv(x1533)
      fn(x1535 : @kernel.Term) -> @kernel.Thm raise { s1534(x1535) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1708 = @tactics.thenl(
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
                                  @tactics.thenl(
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
                                                                                    @simp.rewrite_tac(
                                                                                      @list.List([
                                                                                          real_mul_rsum0(),
                                                                                          real_sub_sum0(),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    @tactics.strip_tac,
                                                                                  ),
                                                                                  t1536,
                                                                                ),
                                                                                t1537,
                                                                              ),
                                                                              t1538,
                                                                            ),
                                                                            t1539,
                                                                          ),
                                                                          @nums.induct_tac,
                                                                        ),
                                                                        t1545,
                                                                      ),
                                                                      t1549,
                                                                    ),
                                                                    t1553,
                                                                  ),
                                                                  t1558,
                                                                ),
                                                                t1559,
                                                              ),
                                                              @tactics.disch_tac,
                                                            ),
                                                            @tactics.disch_tac,
                                                          ),
                                                          t1560,
                                                        ),
                                                        t1561,
                                                      ),
                                                      t1562,
                                                    ),
                                                    t1563,
                                                  ),
                                                  @tactics.conj_tac,
                                                ),
                                                t1588,
                                              ),
                                              t1589,
                                            ),
                                            t1590,
                                          ),
                                          t1591,
                                        ),
                                        t1592,
                                      ),
                                      @tactics.conj_tac,
                                    ),
                                    t1676,
                                  ),
                                  t1680,
                                ),
                                t1684,
                              ),
                              t1685,
                            ),
                            t1686,
                          ),
                          t1687,
                        ),
                        t1688,
                      ),
                      t1689,
                    ),
                    t1690,
                  ),
                  t1691,
                ),
                t1692,
              ),
              @tactics.conj_tac,
            ),
            t1693,
          ),
          t1694,
        ),
        t1695,
      ),
      @tactics.conj_tac,
    ),
    t1707,
  )
  steps_ln_c.set(
    @tactics.prove(
      @term_syntax.parse_term("2 <= (n : Num) && abs((x : Real)) <= real_of_num(1) / real_of_num(2) && abs((s : Real) - pow(real_of_num(2), n) * -x) < real_of_num(1) && (t : (Num) -> Real)(0) == -s && (∀ k : Num, SUC(k) < (m : Num) → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), n) * real_of_num(SUC(SUC(k)))) - real_of_num(SUC(k)) * (s * t(k))) <= pow(real_of_num(2), n) * real_of_num(SUC(SUC(k)))) → abs(sum((0, m), t) - pow(real_of_num(2), n) * sum((0, m), (i : Num) => pow(-real_of_num(1), i) * (pow(x, SUC(i)) / real_of_num(SUC(i))))) <= real_of_num(3) * real_of_num(m)"),
      t1708,
    ),
  )
}

///|
let steps_ln_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEPS_LN")

///|
/// `STEPS_LN`
pub fn steps_ln() -> @kernel.Thm {
  steps_ln_c.get()
}

///|
/// MCLAURIN_EXP_LE1
fn step_47() -> Unit raise {
  let t1716 = @simp.asm_rewrite_tac(@list.List([]))
  let t1715 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t1714 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1713 = @simp.asm_rewrite_tac(@list.List([]))
  let t1712 = @tactics.exists_tac(@term_syntax.parse_term("(t : Real)"))
  let t1711 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1709 = @term_syntax.parse_term("(n : Num)")
  let t1710 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t1709]),
      @transc.mclaurin_exp_le(),
    ),
  )
  let t1717 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1710),
              t1711,
            ),
            t1712,
          ),
          t1713,
        ),
        t1714,
      ),
      t1715,
    ),
    t1716,
  )
  mclaurin_exp_le1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, abs(x) <= real_of_num(1) → (∃ t : Real, abs(t) <= real_of_num(1) && exp(x) == sum((0, n), (m : Num) => pow(x, m) / real_of_num(FACT(m))) + exp(t) / real_of_num(FACT(n)) * pow(x, n))"),
      t1717,
    ),
  )
}

///|
let mclaurin_exp_le1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MCLAURIN_EXP_LE1",
)

///|
/// `MCLAURIN_EXP_LE1`
pub fn mclaurin_exp_le1() -> @kernel.Thm {
  mclaurin_exp_le1_c.get()
}

///|
/// REAL_EXP_15
fn step_48() -> Unit raise {
  let t1726 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1725 = @tactics.match_mp_tac(@transc.real_exp_bound_lemma())
  let t1724 = @simp.rewrite_tac(@list.List([@transc.real_exp_pos_le()]))
  let t1723 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1722 = @simp.rewrite_tac(@list.List([]))
  let t1721 = @tactics.conv_tac(
    @equal.rand_conv(@calc_rat.real_rat_reduce_conv),
  )
  let t1720 = @tactics.exists_tac(
    @term_syntax.parse_term("(real_of_num(1) + real_of_num(2) * inv(real_of_num(2))) * (real_of_num(1) + real_of_num(2) * inv(real_of_num(2)))"),
  )
  let t1719 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1718 = @simp.rewrite_tac(@list.List([@transc.real_exp_add()]))
  let t1727 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.subst1_tac(
                      @equal.sym(
                        @calc_rat.real_rat_reduce_conv(
                          @term_syntax.parse_term("inv(real_of_num(2)) + inv(real_of_num(2))"),
                        ),
                      ),
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
        ),
        t1724,
      ),
      t1725,
    ),
    t1726,
  )
  real_exp_15_c.set(@tactics.prove(@term_syntax.parse_term("exp(real_of_num(1)) < real_of_num(5)"), t1727))
}

///|
let real_exp_15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EXP_15")

///|
/// `REAL_EXP_15`
pub fn real_exp_15() -> @kernel.Thm {
  real_exp_15_c.get()
}

///|
/// TAYLOR_EXP_WEAK
fn step_49() -> Unit raise {
  let t1773 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1772 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1771 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t1770 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_inv(),
      @analysis.abs_n(),
      @analysis.real_le_refl(),
    ]),
  )
  let t1769 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1768 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1767 = @simp.gen_rewrite_tac(
    fn(
      x1764 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1765 = @equal.rand_conv(x1764)
      fn(x1766 : @kernel.Term) -> @kernel.Thm raise { s1765(x1766) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1763 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t1774 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@analysis.real_le_lmul_imp()),
                  t1763,
                ),
                t1767,
              ),
              t1768,
            ),
            t1769,
          ),
          t1770,
        ),
        t1771,
      ),
      t1772,
    ),
    t1773,
  )
  let t1760 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : Num)"), @arith.fact_lt()),
  )
  let t1759 = @simp.rewrite_tac(
    @list.List([@real.real_inv_eq_0(), @realax.real_of_num_eq()]),
  )
  let t1758 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@analysis.abs_nz()), @real.real_pow_eq_0()]),
  )
  let t1761 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t1758),
        t1759,
      ),
      t1760,
    ),
    @int.arith_tac,
  )
  let t1757 = @tactics.undisch_tac(@term_syntax.parse_term("abs((t : Real)) <= real_of_num(1)"))
  let t1756 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_abs(),
      @transc.real_exp_pos_le(),
      @transc.real_exp_mono_le(),
      real_exp_15(),
    ]),
  )
  let t1755 = @tactics.exists_tac(@term_syntax.parse_term("abs(exp(real_of_num(1)))"))
  let t1762 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@realarith.real_let_trans()),
            t1755,
          ),
          t1756,
        ),
        t1757,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1761,
  ])
  let t1775 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.match_mp_tac(@analysis.real_lt_rmul_imp()),
        @tactics.conj_tac,
      ),
      t1762,
    ),
    t1774,
  ])
  let t1754 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(5) * (abs(inv(real_of_num(FACT((m : Num))))) * abs(pow((x : Real), m)))"),
  )
  let t1776 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@analysis.real_lte_trans()),
        t1754,
      ),
      @tactics.conj_tac,
    ),
    t1775,
  )
  let t1751 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @arith.fact_lt()]),
  )
  let t1750 = @tactics.match_mp_tac(@analysis.real_inv_pos())
  let t1749 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @calc_num.arith()]),
  )
  let t1748 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1752 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @analysis.pow_0(),
              @real.real_abs_0(),
              @analysis.real_mul_rzero(),
            ]),
          ),
          t1748,
        ),
        t1749,
      ),
      t1750,
    ),
    t1751,
  )
  let t1747 = @tactics.undisch_tac(@term_syntax.parse_term("abs((t : Real)) <= real_of_num(1)"))
  let t1746 = @simp.rewrite_tac(@list.List([@transc.real_exp_mono_le()]))
  let t1745 = @simp.rewrite_tac(@list.List([real_exp_15()]))
  let t1744 = @tactics.exists_tac(@term_syntax.parse_term("exp(real_of_num(1))"))
  let t1743 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1742 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_abs(), @transc.real_exp_pos_le()]),
  )
  let t1753 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @realax.real_pow(),
                      @arith.fact(),
                      @analysis.abs_n(),
                      @real.real_inv_1(),
                      @analysis.real_mul_rid(),
                    ]),
                  ),
                  t1742,
                ),
                t1743,
              ),
              t1744,
            ),
            t1745,
          ),
          t1746,
        ),
        t1747,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1752,
  ])
  let t1740 = @term_syntax.parse_term("(m : Num)")
  let t1741 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t1740)
  let t1777 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1741),
        @nums.induct_tac,
      ),
      t1753,
    ),
    t1776,
  ])
  let t1739 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t1738 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_abs_mul(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1737 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) + (y : Real) - x) == abs(y)")),
    ]),
  )
  let t1736 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1734 = @drule.match_mp(mclaurin_exp_le1())
  let t1731 = @term_syntax.parse_term("(m : Num)")
  let t1778 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @tactics.first_assum(fn(
                x1735 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
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
                  (fn(
                    x1728 : @kernel.Thm,
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
                    let s1729 = @tactics.mp_tac(x1728)
                    fn(
                      x1730 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1729(x1730)
                    }
                  })(((x1732 : @kernel.Thm) => @bool.spec(t1731, x1732))(x1733))
                })(t1734(x1735))
              }),
            ),
            t1736,
          ),
          t1737,
        ),
        t1738,
      ),
      t1739,
    ),
    t1777,
  )
  taylor_exp_weak_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) → abs(exp(x) - sum((0, (m : Num)), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) < real_of_num(5) * inv(real_of_num(FACT(m)))"),
      t1778,
    ),
  )
}

///|
let taylor_exp_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TAYLOR_EXP_WEAK",
)

///|
/// `TAYLOR_EXP_WEAK`
pub fn taylor_exp_weak() -> @kernel.Thm {
  taylor_exp_weak_c.get()
}

///|
/// REAL_EXP_13
fn step_50() -> Unit raise {
  let t1787 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1786 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("(b : Real) + (e : Real) <= (c : Real) → abs((a : Real) - b) < e → a < c"),
    ),
  )
  let t1785 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1784 = @tactics.conv_tac(@equal.once_depth_conv(@calc_num.num_fact_conv))
  let t1783 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1782 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1780 = @term_syntax.parse_term("(m : Num)")
  let t1781 = (@term_syntax.parse_term("5"), t1780)
  let t1779 = @term_syntax.parse_term("(x : Real)")
  let t1788 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @kernel.inst_rule(
                  @list.List([(@term_syntax.parse_term("real_of_num(1)"), t1779), t1781]),
                  taylor_exp_weak(),
                ),
              ),
              t1782,
            ),
            t1783,
          ),
          t1784,
        ),
        t1785,
      ),
      t1786,
    ),
    t1787,
  )
  real_exp_13_c.set(@tactics.prove(@term_syntax.parse_term("exp(real_of_num(1)) < real_of_num(3)"), t1788))
}

///|
let real_exp_13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EXP_13")

///|
/// `REAL_EXP_13`
pub fn real_exp_13() -> @kernel.Thm {
  real_exp_13_c.get()
}

///|
/// TAYLOR_EXP
fn step_51() -> Unit raise {
  let t1834 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1833 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t1832 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t1831 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_inv(),
      @analysis.abs_n(),
      @analysis.real_le_refl(),
    ]),
  )
  let t1830 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1829 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1828 = @simp.gen_rewrite_tac(
    fn(
      x1825 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1826 = @equal.rand_conv(x1825)
      fn(x1827 : @kernel.Term) -> @kernel.Thm raise { s1826(x1827) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1824 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t1835 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@analysis.real_le_lmul_imp()),
                  t1824,
                ),
                t1828,
              ),
              t1829,
            ),
            t1830,
          ),
          t1831,
        ),
        t1832,
      ),
      t1833,
    ),
    t1834,
  )
  let t1821 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : Num)"), @arith.fact_lt()),
  )
  let t1820 = @simp.rewrite_tac(
    @list.List([@real.real_inv_eq_0(), @realax.real_of_num_eq()]),
  )
  let t1819 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@analysis.abs_nz()), @real.real_pow_eq_0()]),
  )
  let t1822 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t1819),
        t1820,
      ),
      t1821,
    ),
    @int.arith_tac,
  )
  let t1818 = @tactics.undisch_tac(@term_syntax.parse_term("abs((t : Real)) <= real_of_num(1)"))
  let t1817 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_abs(),
      @transc.real_exp_pos_le(),
      @transc.real_exp_mono_le(),
      real_exp_13(),
    ]),
  )
  let t1816 = @tactics.exists_tac(@term_syntax.parse_term("abs(exp(real_of_num(1)))"))
  let t1823 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@realarith.real_let_trans()),
            t1816,
          ),
          t1817,
        ),
        t1818,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1822,
  ])
  let t1836 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.match_mp_tac(@analysis.real_lt_rmul_imp()),
        @tactics.conj_tac,
      ),
      t1823,
    ),
    t1835,
  ])
  let t1815 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(3) * (abs(inv(real_of_num(FACT((m : Num))))) * abs(pow((x : Real), m)))"),
  )
  let t1837 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@analysis.real_lte_trans()),
        t1815,
      ),
      @tactics.conj_tac,
    ),
    t1836,
  )
  let t1812 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @arith.fact_lt()]),
  )
  let t1811 = @tactics.match_mp_tac(@analysis.real_inv_pos())
  let t1810 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @calc_num.arith()]),
  )
  let t1809 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1813 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @analysis.pow_0(),
              @real.real_abs_0(),
              @analysis.real_mul_rzero(),
            ]),
          ),
          t1809,
        ),
        t1810,
      ),
      t1811,
    ),
    t1812,
  )
  let t1808 = @tactics.undisch_tac(@term_syntax.parse_term("abs((t : Real)) <= real_of_num(1)"))
  let t1807 = @simp.rewrite_tac(@list.List([@transc.real_exp_mono_le()]))
  let t1806 = @simp.rewrite_tac(@list.List([real_exp_13()]))
  let t1805 = @tactics.exists_tac(@term_syntax.parse_term("exp(real_of_num(1))"))
  let t1804 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1803 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_abs(), @transc.real_exp_pos_le()]),
  )
  let t1814 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @realax.real_pow(),
                      @arith.fact(),
                      @analysis.abs_n(),
                      @real.real_inv_1(),
                      @analysis.real_mul_rid(),
                    ]),
                  ),
                  t1803,
                ),
                t1804,
              ),
              t1805,
            ),
            t1806,
          ),
          t1807,
        ),
        t1808,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1813,
  ])
  let t1801 = @term_syntax.parse_term("(m : Num)")
  let t1802 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t1801)
  let t1838 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1802),
        @nums.induct_tac,
      ),
      t1814,
    ),
    t1837,
  ])
  let t1800 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t1799 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_abs_mul(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1798 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) + (y : Real) - x) == abs(y)")),
    ]),
  )
  let t1797 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1795 = @drule.match_mp(mclaurin_exp_le1())
  let t1792 = @term_syntax.parse_term("(m : Num)")
  let t1839 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @tactics.first_assum(fn(
                x1796 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x1794 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1789 : @kernel.Thm,
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
                    let s1790 = @tactics.mp_tac(x1789)
                    fn(
                      x1791 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1790(x1791)
                    }
                  })(((x1793 : @kernel.Thm) => @bool.spec(t1792, x1793))(x1794))
                })(t1795(x1796))
              }),
            ),
            t1797,
          ),
          t1798,
        ),
        t1799,
      ),
      t1800,
    ),
    t1838,
  )
  taylor_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) → abs(exp(x) - sum((0, (m : Num)), (i : Num) => pow(x, i) / real_of_num(FACT(i)))) < real_of_num(3) * inv(real_of_num(FACT(m)))"),
      t1839,
    ),
  )
}

///|
let taylor_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAYLOR_EXP")

///|
/// `TAYLOR_EXP`
pub fn taylor_exp() -> @kernel.Thm {
  taylor_exp_c.get()
}

///|
/// TAYLOR_LN
fn step_52() -> Unit raise {
  let t1841 = @equal.sym(@bool.spec_all(@analysis.sum_reindex()))
  let t1840 = @term_syntax.parse_term("(k : Num)")
  let lemma = @kernel.inst_rule(
    @list.List([(@term_syntax.parse_term("1"), t1840)]),
    t1841,
  )
  let t1904 = @simp.asm_rewrite_tac(
    @list.List([@real.real_pow_one(), @nums.not_suc(), @real.real_abs_pos()]),
  )
  let t1903 = @tactics.match_mp_tac(@real.real_pow_lt2())
  let t1905 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.subst1_tac(
        @equal.sym(
          @bool.spec(@term_syntax.parse_term("SUC((m : Num))"), @real.real_pow_one()),
        ),
      ),
      t1903,
    ),
    t1904,
  )
  let t1902 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (t : Real)"))
  let t1901 = @tactics.match_mp_tac(@real.real_lt_inv2())
  let t1900 = @simp.gen_rewrite_tac(
    fn(
      x1897 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1898 = @equal.rand_conv(x1897)
      fn(x1899 : @kernel.Term) -> @kernel.Thm raise { s1898(x1899) }
    },
    @list.List([@equal.gsym(@real.real_inv_1())]),
  )
  let t1906 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@real.real_abs_inv()])),
            t1900,
          ),
          t1901,
        ),
        t1902,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1905,
  ])
  let t1896 = @tactics.subgoal_then(
    @term_syntax.parse_term("abs(inv(real_of_num(1) + (t : Real))) < real_of_num(1)"),
    fn(
      x1893 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1894 = @tactics.assume_tac(x1893)
      fn(
        x1895 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1894(x1895)
      }
    },
  )
  let t1891 = @equal.gsym(@real.real_abs_inv())
  let t1892 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_pow_inv()), t1891]),
  )
  let t1890 = @simp.simp_tac(
    @list.List([
      @real.real_lt_mul(),
      @real.real_lt_inv_eq(),
      @real.real_of_num_lt(),
      @arith.lt_0(),
      @real.real_pow_lt(),
      @calc_num.arith(),
    ]),
  )
  let t1889 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t1888 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1907 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x1885 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s1886 = @equal.rand_conv(x1885)
                  fn(x1887 : @kernel.Term) -> @kernel.Thm raise { s1886(x1887) }
                },
                @list.List([@equal.gsym(@analysis.real_mul_rid())]),
              ),
              t1888,
            ),
            t1889,
          ),
          t1890,
        ),
        t1892,
      ),
      t1896,
    ),
    t1906,
  )
  let t1884 = @simp.asm_simp_tac(
    @list.List([
      @real.real_pow_inv(),
      @realax.real_abs(),
      @analysis.real_lt_imp_le(),
    ]),
  )
  let t1883 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t1882 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t1881 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_inv())]))
  let t1880 = @simp.simp_tac(
    @list.List([
      @analysis.real_le_mul(),
      @real.real_le_inv_eq(),
      @analysis.real_pos(),
      @real.real_abs_pos(),
      @real.real_pow_le(),
    ]),
  )
  let t1879 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1908 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([@equal.gsym(@realax.real_mul_assoc())]),
                ),
                t1879,
              ),
              t1880,
            ),
            t1881,
          ),
          t1882,
        ),
        t1883,
      ),
      t1884,
    ),
    t1907,
  ])
  let t1878 = @tactics.exists_tac(
    @term_syntax.parse_term("inv(pow(real_of_num(2), (k : Num) * SUC((m : Num)))) * (inv(real_of_num(SUC(m))) * inv(pow(abs(real_of_num(1) + (t : Real)), SUC(m))))"),
  )
  let t1877 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1876 = @simp.rewrite_tac(
    @list.List([
      @realax.real_mul_lid(),
      @real.real_inv_mul(),
      @equal.gsym(@realax.real_mul_assoc()),
    ]),
  )
  let t1875 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_abs_neg(),
      @calc_int.real_abs_num(),
      @real.real_pow_one(),
    ]),
  )
  let t1874 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_abs_mul(),
      @real.real_abs_inv(),
      @real.real_abs_pow(),
    ]),
  )
  let t1873 = @simp.asm_rewrite_tac(
    @list.List([
      @analysis.real_sub_rzero(),
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) - a == b")),
    ]),
  )
  let t1872 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1871 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t1870 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t1869 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1868 = @simp.asm_rewrite_tac(@list.List([@arith.lt_0()]))
  let t1866 = @term_syntax.parse_term("SUC((m : Num))")
  let t1867 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t1866]),
      @transc.mclaurin_ln_pos(),
    ),
  )
  let t1865 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t1864 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_inv_0(),
      @analysis.real_mul_rzero(),
    ]),
  )
  let t1863 = @tactics.conv_tac(@equal.once_depth_conv(@analysis.real_sum_conv))
  let t1862 = @simp.once_rewrite_tac(@list.List([@analysis.sum_diff()]))
  let t1861 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1860 = @simp.rewrite_tac(@list.List([@arith.add1(), lemma]))
  let t1858 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t1859 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @realax.real_pow(),
          @calc_int.real_mul_lneg(),
          @calc_int.real_mul_rneg(),
          @analysis.real_neg_neg(),
        ]),
      ),
      t1858,
    ),
    @tactics.all_tac,
  ])
  let t1857 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, pow(-real_of_num(1), i) == pow(-real_of_num(1), SUC(SUC(i)))"),
    fn(
      x1855 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1855
      @simp.once_rewrite_tac(@list.List([th]))
    },
  )
  let t1853 = @simp.simp_tac(
    @list.List([
      @real.real_lt_inv_eq(),
      @real.real_lt_mul(),
      @real.real_pow_lt(),
      @real.real_of_num_lt(),
      @arith.lt_0(),
      @calc_num.arith(),
    ]),
  )
  let t1852 = @simp.rewrite_tac(
    @list.List([@calc_int.real_abs_neg(), @real.real_abs_0()]),
  )
  let t1851 = @simp.rewrite_tac(
    @list.List([
      @analysis.sum_0(),
      @calc_int.real_add_rid(),
      @analysis.real_sub_lzero(),
      @transc.ln_1(),
    ]),
  )
  let t1854 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @realax.real_pow(),
              @analysis.real_mul_lzero(),
              @analysis.real_mul_rzero(),
              @realax.real_div(),
            ]),
          ),
          t1851,
        ),
        t1852,
      ),
      t1853,
    ),
  ])
  let t1850 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
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
        let s1844 = @tactics.assume_tac(x1843)
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
      },
      fn(
        x1849 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x1846 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1847 = @tactics.subst1_tac(x1846)
          fn(
            x1848 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1847(x1848)
          }
        })(@equal.sym(x1849))
      },
    ),
  )
  let t1842 = @simp.rewrite_tac(@list.List([@analysis.real_le_lt()]))
  let t1909 = @tactics.thenl(
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
                                              @tactics.thenl(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.strip_tac,
                                                      @tactics.undisch_tac(
                                                        @term_syntax.parse_term("real_of_num(0) <= (x : Real)"),
                                                      ),
                                                    ),
                                                    t1842,
                                                  ),
                                                  t1850,
                                                ),
                                                t1854,
                                              ),
                                              t1857,
                                            ),
                                            t1859,
                                          ),
                                          t1860,
                                        ),
                                        t1861,
                                      ),
                                      t1862,
                                    ),
                                    t1863,
                                  ),
                                  t1864,
                                ),
                                t1865,
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
                  ),
                  t1873,
                ),
                t1874,
              ),
              t1875,
            ),
            t1876,
          ),
          t1877,
        ),
        t1878,
      ),
      @tactics.conj_tac,
    ),
    t1908,
  )
  taylor_ln_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= inv(pow(real_of_num(2), (k : Num))) → abs(ln(real_of_num(1) + x) - sum((0, (m : Num)), (i : Num) => pow(-real_of_num(1), i) * (pow(x, SUC(i)) / real_of_num(SUC(i))))) < inv(pow(real_of_num(2), k * SUC(m)) * real_of_num(SUC(m)))"),
      t1909,
    ),
  )
}

///|
let taylor_ln_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAYLOR_LN")

///|
/// `TAYLOR_LN`
pub fn taylor_ln() -> @kernel.Thm {
  taylor_ln_c.get()
}

///|
/// APPROX_LEMMA1
fn step_53() -> Unit raise {
  let t1989 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t1988 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_0()]))
  let t1987 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t1986 = @tactics.subgoal_then(
    @term_syntax.parse_term("inv(pow(real_of_num(2), (n : Num) + 2)) * pow(real_of_num(2), n + 2) == real_of_num(1)"),
    fn(
      x1984 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1984
      @simp.asm_rewrite_tac(@list.List([th, @realax.real_mul_lid()]))
    },
  )
  let t1983 = @simp.once_rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t1982 = @simp.rewrite_tac(
    @list.List([@analysis.real_mul_rid(), @realax.real_mul_assoc()]),
  )
  let t1981 = @simp.rewrite_tac(
    @list.List([@real.real_lt_inv_eq(), @real.real_lt_pow2()]),
  )
  let t1980 = @tactics.exists_tac(@term_syntax.parse_term("inv(pow(real_of_num(2), (n : Num) + 2))"))
  let t1979 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t1978 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1977 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1976 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t1975 = @simp.gen_rewrite_tac(
    fn(
      x1972 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1973 = @equal.rand_conv(x1972)
      fn(x1974 : @kernel.Term) -> @kernel.Thm raise { s1973(x1974) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1971 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1970 = @simp.once_rewrite_tac(@list.List([@real.real_pow_add()]))
  let t1969 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t1968 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1967 = @equal.gsym(real_abs_lemma())
  let t1990 = @tactics.then_tac(
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
                                        @simp.rewrite_tac(
                                          @list.List([
                                            @equal.gsym(
                                              @analysis.real_sub_ldistrib(),
                                            ),
                                            t1967,
                                          ]),
                                        ),
                                        t1968,
                                      ),
                                      t1969,
                                    ),
                                    t1970,
                                  ),
                                  t1971,
                                ),
                                t1975,
                              ),
                              t1976,
                            ),
                            t1977,
                          ),
                          t1978,
                        ),
                        t1979,
                      ),
                      t1980,
                    ),
                    t1981,
                  ),
                  t1982,
                ),
                t1983,
              ),
              t1986,
            ),
            t1987,
          ),
          t1988,
        ),
        t1989,
      ),
      @tactics.disj1_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  let t1966 = @simp.asm_rewrite_tac(@list.List([]))
  let t1965 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((k : Num)) * real_of_num((m : Num))"))
  let t1991 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t1965),
      t1966,
    ),
    t1990,
  ])
  let t1964 = @tactics.match_mp_tac(@real.real_let_add2())
  let t1963 = @simp.rewrite_tac(
    @list.List([@real.real_pow_1(), @real.real_mul_2()]),
  )
  let t1962 = @simp.gen_rewrite_tac(
    fn(
      x1959 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1960 = @equal.rand_conv(x1959)
      fn(x1961 : @kernel.Term) -> @kernel.Thm raise { s1960(x1961) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1958 = @simp.gen_rewrite_tac(
    fn(
      x1955 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1956 = @equal.rand_conv(x1955)
      fn(x1957 : @kernel.Term) -> @kernel.Thm raise { s1956(x1957) }
    },
    @list.List([@real.real_pow_add()]),
  )
  let t1954 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(real_of_num(2), (n : Num) + ((e : Num) + 2)) * sum((0, (m : Num)), (i : Num) => (P : (Num, Real) -> Real)(i, (x : Real)))"),
  )
  let t1952 = @calc_rat.real_arith(
    @term_syntax.parse_term("abs((a : Real) - (b : Real)) + abs(b - (c : Real)) < (d : Real) → abs(a - c) < d"),
  )
  let t1953 = @tactics.match_mp_tac(@bool.gen_all(t1952))
  let t1951 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1950 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1949 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t1948 = @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_lemma())]))
  let t1947 = @simp.gen_rewrite_tac(
    fn(
      x1944 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1945 = @equal.rand_conv(x1944)
      fn(x1946 : @kernel.Term) -> @kernel.Thm raise { s1945(x1946) }
    },
    @list.List([@real.real_pow_add()]),
  )
  let t1943 = @equal.gsym(@analysis.real_sub_ldistrib())
  let t1992 = @tactics.thenl(
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
                                @equal.gsym(@realax.real_mul_assoc()),
                                t1943,
                              ]),
                            ),
                            t1947,
                          ),
                          t1948,
                        ),
                        t1949,
                      ),
                      t1950,
                    ),
                    t1951,
                  ),
                  t1953,
                ),
                t1954,
              ),
              t1958,
            ),
            t1962,
          ),
          t1963,
        ),
        t1964,
      ),
      @tactics.conj_tac,
    ),
    t1991,
  )
  let t1942 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1941 = @tactics.match_mp_tac(@analysis.real_lt_imp_le())
  let t1940 = @simp.asm_rewrite_tac(@list.List([]))
  let t1939 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1938 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1937 = @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_lemma())]))
  let t1935 = @equal.gsym(@analysis.real_sub_ldistrib())
  let t1936 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc()), t1935]),
  )
  let t1934 = @simp.gen_rewrite_tac(
    fn(
      x1933 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1929 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1923 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1924 = @equal.land_conv(x1923)
          fn(x1925 : @kernel.Term) -> @kernel.Thm raise { s1924(x1925) }
        })(
          (fn(
            x1926 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1927 = @equal.rand_conv(x1926)
            fn(x1928 : @kernel.Term) -> @kernel.Thm raise { s1927(x1928) }
          })(x1929),
        )
      })(
        (fn(
          x1930 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1931 = @equal.land_conv(x1930)
          fn(x1932 : @kernel.Term) -> @kernel.Thm raise { s1931(x1932) }
        })(x1933),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1993 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.once_rewrite_tac(@list.List([@real.real_pow_add()])),
                    t1934,
                  ),
                  t1936,
                ),
                t1937,
              ),
              t1938,
            ),
            t1939,
          ),
          t1940,
        ),
        t1941,
      ),
      t1942,
    ),
    t1992,
  ])
  let t1922 = @tactics.match_mp_tac(@real.real_let_add2())
  let t1921 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @realax.real_pow(), @real.real_mul_2()]),
  )
  let t1920 = @tactics.conv_tac(
    @lib.funpow(
      4,
      fn(
        x1917 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1918 = @equal.rand_conv(x1917)
        fn(x1919 : @kernel.Term) -> @kernel.Thm raise { s1918(x1919) }
      },
      @calc_num.num_conv,
    ),
  )
  let t1916 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * (u : Real)"))
  let t1914 = @calc_rat.real_arith(
    @term_syntax.parse_term("abs((a : Real) - (b : Real)) + abs(b - (c : Real)) < (d : Real) → abs(a - c) < d"),
  )
  let t1915 = @tactics.match_mp_tac(@bool.gen_all(t1914))
  let t1913 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1912 = @simp.rewrite_tac(
    @list.List([
      real_abs_lemma(),
      @analysis.real_sub_ldistrib(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t1911 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t1910 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), (n : Num) + ((e : Num) + 2))"))
  let t1994 = @tactics.thenl(
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
                          @tactics.strip_tac,
                          @tactics.match_mp_tac(@real.real_lt_lcancel_imp()),
                        ),
                        t1910,
                      ),
                      t1911,
                    ),
                    t1912,
                  ),
                  t1913,
                ),
                t1915,
              ),
              t1916,
            ),
            t1920,
          ),
          t1921,
        ),
        t1922,
      ),
      @tactics.conj_tac,
    ),
    t1993,
  )
  approx_lemma1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((f : (Real) -> Real)((x : Real)) - sum((0, (m : Num)), (i : Num) => (P : (Num, Real) -> Real)(i, x))) < inv(pow(real_of_num(2), (n : Num) + 2)) && abs((u : Real) - pow(real_of_num(2), n + ((e : Num) + 2)) * sum((0, m), (i : Num) => P(i, x))) <= real_of_num((k : Num)) * real_of_num(m) && real_of_num(k) * real_of_num(m) <= pow(real_of_num(2), e) && abs((s : Real) * pow(real_of_num(2), e + 2) - u) <= pow(real_of_num(2), e + 1) → abs(s - pow(real_of_num(2), n) * f(x)) < real_of_num(1)"),
      t1994,
    ),
  )
}

///|
let approx_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROX_LEMMA1")

///|
/// `APPROX_LEMMA1`
pub fn approx_lemma1() -> @kernel.Thm {
  approx_lemma1_c.get()
}

///|
/// APPROX_EXP
fn step_54() -> Unit raise {
  let t2017 = @simp.asm_rewrite_tac(@list.List([]))
  let t2018 = @tactics.then_tac(@tactics.match_mp_tac(steps_exp()), t2017)
  let t2014 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t2012 = @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(3) == real_of_num(0))"))
  let t2013 = @simp.rewrite_tac(
    @list.List([@drule.match_mp(@analysis.real_mul_rinv())(t2012)]),
  )
  let t2011 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t2010 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(3)"))
  let t2009 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t2008 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t2007 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2006 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t2015 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.subst1_tac(
                      @equal.sym(
                        @bool.spec(
                          @term_syntax.parse_term("real_of_num(3)"),
                          @real.real_inv_inv(),
                        ),
                      ),
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
          ),
          t2011,
        ),
        t2013,
      ),
      t2014,
    ),
    @calc_rat.real_arith_tac,
  )
  let t2005 = @simp.asm_rewrite_tac(@list.List([]))
  let t2016 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(taylor_exp()), t2005),
    t2015,
  ])
  let t2004 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(3) * inv(real_of_num(FACT((m : Num))))"))
  let t2019 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@analysis.real_lte_trans()),
          t2004,
        ),
        @tactics.conj_tac,
      ),
      t2016,
    ),
    t2018,
  ])
  let t2003 = @simp.asm_rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t1998 = @term_syntax.parse_term("(e : Num)")
  let t1999 = @term_syntax.parse_term("sum((0, (m : Num)), (t : (Num) -> Real))")
  let t2000 = @term_syntax.parse_term("(m : Num)")
  let t2001 = @term_syntax.parse_term("2")
  let t2002 = @tactics.map_every(
    fn(
      x1995 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1996 = @tactics.exists_tac(x1995)
      fn(
        x1997 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1996(x1997)
      }
    },
    @list.List([
      @term_syntax.parse_term("(i : Num) => (x : Real) => pow(x, i) / real_of_num(FACT(i))"),
      t2001,
      t2000,
      t1999,
      t1998,
    ]),
  )
  let t2020 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.strip_tac,
            @tactics.match_mp_tac(@bool.gen_all(approx_lemma1())),
          ),
          t2002,
        ),
        t2003,
      ),
      @tactics.conj_tac,
    ),
    t2019,
  )
  approx_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(n : Num) + ((e : Num) + 2) == (p : Num) && real_of_num(3) * pow(real_of_num(2), n + 2) <= real_of_num(FACT((m : Num))) && real_of_num(2) * real_of_num(m) <= pow(real_of_num(2), e) && abs((x : Real)) <= real_of_num(1) && abs((s : Real) - pow(real_of_num(2), p) * x) < real_of_num(1) && (t : (Num) -> Real)(0) == pow(real_of_num(2), p) && (∀ k : Num, SUC(k) < m → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), p) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), p) * real_of_num(SUC(k))) && abs((u : Real) * pow(real_of_num(2), e + 2) - sum((0, m), t)) <= pow(real_of_num(2), e + 1) → abs(u - pow(real_of_num(2), n) * exp(x)) < real_of_num(1)"),
      t2020,
    ),
  )
}

///|
let approx_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROX_EXP")

///|
/// `APPROX_EXP`
pub fn approx_exp() -> @kernel.Thm {
  approx_exp_c.get()
}

///|
/// APPROX_LN
fn step_55() -> Unit raise {
  let t2064 = @tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) == 0)"))
  let t2063 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t2062 = @tactics.match_mp_tac(@real.real_pow_mono())
  let t2061 = @simp.rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t2060 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2059 = @simp.gen_rewrite_tac(
    fn(
      x2058 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2052 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2053 = @equal.rand_conv(x2052)
        fn(x2054 : @kernel.Term) -> @kernel.Thm raise { s2053(x2054) }
      })(
        (fn(
          x2055 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2056 = @equal.rand_conv(x2055)
          fn(x2057 : @kernel.Term) -> @kernel.Thm raise { s2056(x2057) }
        })(x2058),
      )
    },
    @list.List([@equal.gsym(@real.real_pow_1())]),
  )
  let t2051 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @realax.real_mul_lid()]),
  )
  let t2050 = @simp.asm_rewrite_tac(@list.List([]))
  let t2049 = @tactics.exists_tac(@term_syntax.parse_term("inv(pow(real_of_num(2), (k : Num)))"))
  let t2048 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t2047 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs()]))
  let t2065 = @tactics.then_tac(
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
                          @tactics.subgoal_then(
                            @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) / real_of_num(2)"),
                            fn(
                              x2045 : @kernel.Thm,
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
                            ) raise) raise {
                              let th = x2045
                              @simp.asm_rewrite_tac(@list.List([th]))
                            },
                          ),
                          t2047,
                        ),
                        t2048,
                      ),
                      t2049,
                    ),
                    t2050,
                  ),
                  t2051,
                ),
                t2059,
              ),
              t2060,
            ),
            t2061,
          ),
          t2062,
        ),
        t2063,
      ),
      t2064,
    ),
    @int.arith_tac,
  )
  let t2044 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t2043 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t2066 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@arith.add_assoc()])),
        t2043,
      ),
      t2044,
    ),
    t2065,
  ])
  let t2042 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= (n : Num) + ((e : Num) + 2)"), fn(
    x2039 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2040 = @tactics.mp_tac(x2039)
    fn(
      x2041 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2040(x2041)
    }
  })
  let t2038 = @simp.asm_rewrite_tac(@list.List([]))
  let t2067 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(steps_ln()), t2038),
      t2042,
    ),
    t2066,
  )
  let t2035 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_pow2()]))
  let t2036 = @tactics.then_tac(
    @tactics.match_mp_tac(@real.real_le_inv2()),
    t2035,
  )
  let t2034 = @simp.asm_rewrite_tac(@list.List([]))
  let t2037 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(taylor_ln()), t2034),
    t2036,
  ])
  let t2033 = @tactics.exists_tac(
    @term_syntax.parse_term("inv(pow(real_of_num(2), (k : Num) * SUC((m : Num))) * real_of_num(SUC(m)))"),
  )
  let t2068 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@analysis.real_lte_trans()),
          t2033,
        ),
        @tactics.conj_tac,
      ),
      t2037,
    ),
    t2067,
  ])
  let t2032 = @simp.asm_rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t2027 = @term_syntax.parse_term("(e : Num)")
  let t2028 = @term_syntax.parse_term("sum((0, (m : Num)), (t : (Num) -> Real))")
  let t2029 = @term_syntax.parse_term("(m : Num)")
  let t2030 = @term_syntax.parse_term("3")
  let t2031 = @tactics.map_every(
    fn(
      x2024 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2025 = @tactics.exists_tac(x2024)
      fn(
        x2026 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2025(x2026)
      }
    },
    @list.List([
      @term_syntax.parse_term("(i : Num) => (x : Real) => pow(-real_of_num(1), i) * (pow(x, SUC(i)) / real_of_num(SUC(i)))"),
      t2030,
      t2029,
      t2028,
      t2027,
    ]),
  )
  let t2022 = @term_syntax.parse_term("(f : (Real) -> Real)")
  let t2023 = @kernel.inst_rule(
    @list.List([(@term_syntax.parse_term("(x : Real) => ln(real_of_num(1) + x)"), t2022)]),
    approx_lemma1(),
  )
  let t2069 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.strip_tac,
            (fn(
              x2021 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              @tactics.match_mp_tac(@bool.gen_all(x2021))
            })(@equal.beta_rule(t2023)),
          ),
          t2031,
        ),
        t2032,
      ),
      @tactics.conj_tac,
    ),
    t2068,
  )
  approx_ln_c.set(
    @tactics.prove(
      @term_syntax.parse_term("!((k : Num) == 0) && (n : Num) + ((e : Num) + 2) == (p : Num) && pow(real_of_num(2), n + 2) <= pow(real_of_num(2), k * SUC((m : Num))) * real_of_num(SUC(m)) && real_of_num(3) * real_of_num(m) <= pow(real_of_num(2), e) && (real_of_num(0) <= (x : Real) && x <= inv(pow(real_of_num(2), k))) && abs((s : Real) - pow(real_of_num(2), p) * -x) < real_of_num(1) && (t : (Num) -> Real)(0) == -s && (∀ k : Num, SUC(k) < m → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), p) * real_of_num(SUC(SUC(k)))) - real_of_num(SUC(k)) * (s * t(k))) <= pow(real_of_num(2), p) * real_of_num(SUC(SUC(k)))) && abs((u : Real) * pow(real_of_num(2), e + 2) - sum((0, m), t)) <= pow(real_of_num(2), e + 1) → abs(u - pow(real_of_num(2), n) * ln(real_of_num(1) + x)) < real_of_num(1)"),
      t2069,
    ),
  )
}

///|
let approx_ln_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROX_LN")

///|
/// `APPROX_LN`
pub fn approx_ln() -> @kernel.Thm {
  approx_ln_c.get()
}

///|
/// ELIMINATE_DEF
fn step_56() -> Unit raise {
  let x_tm = @term_syntax.parse_term("(x : Num)")
  let a_tm = @term_syntax.parse_term("real_of_num(0)")
  let sconv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(
    @list.List([@calc_num.arith()]),
  )
  eliminate_def_c.set(fn(
    x2070 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let tdefs = x2070
    fn(x2071 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x2071
      if tdefs == @list.List([]) {
        th
      } else {
        let ctm = @lib.itlist(
          fn(x2072 : @kernel.Term, x2073 : @kernel.Term) -> @kernel.Term raise {
            let tm = x2072
            let acc = x2073
            let t2075 = @kernel.dest_eq(tm)
            let t2076 = (fn(x2074 : @kernel.Term) -> @kernel.Term raise {
              x2074
            })(t2075.1)
            let (l, r) = (@kernel.rand(t2075.0), t2076)
            @class.mk_cond(@basics.mk_eq(x_tm, l), r, acc)
          },
          tdefs,
          a_tm,
        )
        let atm = @kernel.mk_abs(x_tm, ctm)
        let ttm = @kernel.rator(@equal.lhs(@lib.hd(tdefs)))
        let tth = @kernel.assume_rule(@basics.mk_eq(ttm, atm))
        let t2080 = @equal.subs_conv(@list.List([tth]))
        let t2077 = @equal.rand_conv(sconv)
        let ths = @lib.map(
          fn(x2081 : @kernel.Term) -> @kernel.Thm raise {
            (fn(x2079 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.eqt_elim(
                ((x2078 : @kernel.Thm) => @equal.conv_rule(t2077, x2078))(x2079),
              )
            })(t2080(x2081))
          },
          tdefs,
        )
        let dth = @bool.prove_hyp(@lib.end_itlist(@bool.conj, ths), th)
        let t2082 = @kernel.refl(atm)
        @bool.mp(
          @kernel.inst_rule(@list.List([(atm, ttm)]), @bool.disch_all(dth)),
          t2082,
        )
      }
    }
  })
}

///|
let eliminate_def_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("ELIMINATE_DEF")

///|
/// `ELIMINATE_DEF`
pub fn eliminate_def(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  eliminate_def_c.get()(x)
}

///|
/// realcalc_cache
fn step_57() -> Unit raise {
  realcalc_cache_c.set(Ref::{ val: @list.List([]), })
}

///|
let realcalc_cache_c : @lib.Cell[
  Ref[
    @list.List[
      (
        @kernel.Term,
        (
          (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
          (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
        ),
      ),
    ],
  ],
] = @lib.Cell::new("realcalc_cache")

///|
/// `realcalc_cache`
pub fn realcalc_cache() -> Ref[
  @list.List[
    (
      @kernel.Term,
      (
        (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
        (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
      ),
    ),
  ],
] {
  realcalc_cache_c.get()
}

///|
let realcalc_conv_c : @lib.Cell[
  (@kernel.Term) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise,
] = @lib.Cell::new("REALCALC_CONV")

///|
/// `REALCALC_CONV`
pub fn realcalc_conv(
  x : @kernel.Term,
) -> (
  (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
) raise {
  realcalc_conv_c.get()(x)
}

///|
let thm_eval_c : @lib.Cell[
  ((Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise)) -> ((
    @num.Num,
  ) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("thm_eval")

///|
/// `thm_eval`
pub fn thm_eval(
  x : (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
) -> ((@num.Num) -> @kernel.Thm raise) raise {
  thm_eval_c.get()(x)
}

///|
let raw_eval_c : @lib.Cell[
  ((Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise)) -> ((@num.Num) -> @num.Num raise) raise,
] = @lib.Cell::new("raw_eval")

///|
/// `raw_eval`
pub fn raw_eval(
  x : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
) -> ((@num.Num) -> @num.Num raise) raise {
  raw_eval_c.get()(x)
}

///|
let thm_wrap_c : @lib.Cell[
  ((@num.Num) -> @kernel.Thm raise) -> (
    Ref[(@num.Num, @kernel.Thm)],
    (@num.Num) -> @kernel.Thm raise,
  ) raise,
] = @lib.Cell::new("thm_wrap")

///|
/// `thm_wrap`
pub fn thm_wrap(
  x : (@num.Num) -> @kernel.Thm raise,
) -> (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise) raise {
  thm_wrap_c.get()(x)
}

///|
/// REALCALC_CONV, thm_eval, raw_eval, thm_wrap
fn step_58() -> Unit raise {
  let a_tm = @term_syntax.parse_term("(a : Real)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let n_p_tm = @term_syntax.parse_term("(n' : Num)")
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let b_tm = @term_syntax.parse_term("(b : Real)")
  let e_tm = @term_syntax.parse_term("(e : Num)")
  let c_tm = @term_syntax.parse_term("(c : Real)")
  let neg_tm = @term_syntax.parse_term("real_neg")
  let abs_tm = @term_syntax.parse_term("real_abs")
  let inv_tm = @term_syntax.parse_term("inv")
  let sqrt_tm = @term_syntax.parse_term("sqrt")
  let add_tm = @term_syntax.parse_term("real_add")
  let mul_tm = @term_syntax.parse_term("real_mul")
  let sub_tm = @term_syntax.parse_term("real_sub")
  let exp_tm = @term_syntax.parse_term("exp")
  let ln_tm = @term_syntax.parse_term("ln")
  let add1_tm = @term_syntax.parse_term("op_plus(real_of_num(1))")
  let pow2_tm = @term_syntax.parse_term("pow(real_of_num(2))")
  let one_tm = @term_syntax.parse_term("real_of_num(1)")
  let lt_tm = @term_syntax.parse_term("real_lt")
  let t2083 = @simp.rewrite_conv(
    @list.List([
      @real.real_eq_neg2(),
      @equal.gsym(@theorems.exists_refl()),
      @theorems.exists_or_thm(),
      @realax.real_of_num_eq(),
    ]),
  )
  let integer_prove : (@kernel.Term) -> @kernel.Thm raise = fn(
    x2084 : @kernel.Term,
  ) -> @kernel.Thm raise {
    @bool.eqt_elim(t2083(x2084))
  }
  let ndiv : (@num.Num) -> ((@num.Num) -> @num.Num raise) raise = fn(
    x2085 : @num.Num,
  ) -> ((@num.Num) -> @num.Num raise) raise {
    let x = x2085
    fn(x2086 : @num.Num) -> @num.Num raise {
      let y = x2086
      let q = @num.quo_num(x, y)
      let r = @num.sub_num(x, @num.mult_num(q, y))
      let t2087 = @num.abs_num(y)
      if @num.le_num(
          @num.abs_num(@num.mult_num(@num.num_of_int64(2L), r)),
          t2087,
        ) {
        q
      } else {
        let t2089 = @num.abs_num(y)
        let t2088 = @num.sub_num(r, y)
        if @num.le_num(
            @num.abs_num(@num.mult_num(@num.num_of_int64(2L), t2088)),
            t2089,
          ) {
          @num.add_num(q, @num.num_of_int64(1L))
        } else {
          let t2091 = @num.abs_num(y)
          let t2090 = @num.add_num(r, y)
          if @num.le_num(
              @num.abs_num(@num.mult_num(@num.num_of_int64(2L), t2090)),
              t2091,
            ) {
            @num.sub_num(q, @num.num_of_int64(1L))
          } else {
            let t2092 = " and " + @num.string_of_num(y)
            let s = @num.string_of_num(x) + t2092
            raise Failure("ndiv: " + s)
          }
        }
      }
    }
  }
  let raw_wrap : ((@num.Num) -> @num.Num raise) -> (
    Ref[(@num.Num, @num.Num)],
    (@num.Num) -> @num.Num raise,
  ) raise = fn(
    x2093 : (@num.Num) -> @num.Num raise,
  ) -> (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise) raise {
    let _ as f = x2093
    let t2094 = @num.num_of_int64(0L)
    (Ref::{ val: (@num.num_of_int64(-1L), t2094), }, f)
  }
  let raw_eval : ((Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise)) -> ((
    @num.Num,
  ) -> @num.Num raise) raise = fn(
    x2095 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) -> ((@num.Num) -> @num.Num raise) raise {
    let (r_1, _ as f_1) = x2095
    fn(x2096 : @num.Num) -> @num.Num raise {
      let n = x2096
      let (n0, y0) = r_1.val
      if @num.le_num(n, n0) {
        let t2097 = @num.sub_num(n0, n)
        let t2098 = @num.power_num(@num.num_of_int64(2L), t2097)
        ndiv(y0)(t2098)
      } else {
        let y_1 = f_1(n)
        {
          r_1.val = (n, y_1)
          ()
        }
        y_1
      }
    }
  }
  let suc_tm = @term_syntax.parse_term("SUC")
  let t2099 = @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)")
  let mk_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x2102 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x2103 : @kernel.Term) -> @kernel.Term raise {
      ((x2100 : @kernel.Term, x2101 : @kernel.Term) => {
        @basics.mk_binop(t2099, x2100, x2101)
      })(x2102, x2103)
    }
  }
  let thm_eval : (
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) -> ((@num.Num) -> @kernel.Thm raise) raise = fn(
    x2104 : (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) -> ((@num.Num) -> @kernel.Thm raise) raise {
    let (r_2, _ as f_2) = x2104
    fn(x2105 : @num.Num) -> @kernel.Thm raise {
      let n_1 = x2105
      let (n0_1, y0th) = r_2.val
      if @num.le_num(n_1, n0_1) {
        if @num.eq_num(n_1, n0_1) {
          y0th
        } else {
          let th1 = @calc_num.num_suc_conv(
            @kernel.mk_comb(
              suc_tm,
              @nums.mk_numeral(
                @num.sub_num(n0_1, @num.add_num(n_1, @num.num_of_int64(1L))),
              ),
            ),
          )
          let th2 = @drule.match_mp(realcalc_downgrade())(th1)
          let t2106 = @nums.mk_numeral(@num.sub_num(n0_1, n_1))
          let th3 = @calc_num.num_add_conv(mk_add(@nums.mk_numeral(n_1))(t2106))
          let th4 = @drule.match_mp(th2)(th3)
          let th5 = @drule.match_mp(th4)(y0th)
          let tm5 = @basics.dest_imp(@kernel.concl(th5)).0
          let (tm5a, tm5b) = @kernel.dest_comb(tm5)
          let th6 = @calc_int.real_int_pow_conv(tm5b)
          let tm5c = @kernel.rand(@kernel.rand(tm5a))
          let (tm5d, tm5e) = @kernel.dest_comb(tm5c)
          let (tm5f, tm5g) = @kernel.dest_comb(@kernel.rand(tm5d))
          let tm5h = @kernel.rand(@kernel.rand(tm5f))
          let t2107 = @basics.dest_numeral(tm5h)
          let t2108 = @num.power_num(@num.num_of_int64(2L), t2107)
          let bin = @calc_int.mk_realintconst(
            ndiv(@calc_int.dest_realintconst(tm5e))(t2108),
          )
          let th7 = @equal.ap_term(@kernel.rator(@kernel.rand(tm5f)), th1)
          let th8 = @simp.gen_rewrite_rule(
            fn(
              x2109 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2110 = @equal.land_conv(x2109)
              fn(x2111 : @kernel.Term) -> @kernel.Thm raise { s2110(x2111) }
            },
            @list.List([@bool.conjunct2(@realax.real_pow())]),
          )(th7)
          let th9 = @equal.sym(
            @simp.gen_rewrite_rule(
              fn(
                x2118 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                (fn(
                  x2112 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s2113 = @equal.land_conv(x2112)
                  fn(x2114 : @kernel.Term) -> @kernel.Thm raise { s2113(x2114) }
                })(
                  (fn(
                    x2115 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s2116 = @equal.rand_conv(x2115)
                    fn(x2117 : @kernel.Term) -> @kernel.Thm raise {
                      s2116(x2117)
                    }
                  })(x2118),
                )
              },
              @list.List([th6]),
            )(th8),
          )
          let th10 = @kernel.trans(
            th9,
            @calc_int.real_int_mul_conv(@kernel.rand(@kernel.concl(th9))),
          )
          let th11 = @equal.ap_thm(
            @equal.ap_term(@kernel.rator(tm5f), th10),
            bin,
          )
          let th12 = @kernel.trans(
            th11,
            @calc_int.real_int_mul_conv(@kernel.rand(@kernel.concl(th11))),
          )
          let th13 = @equal.ap_thm(
            @equal.ap_term(@kernel.rator(tm5d), th12),
            tm5e,
          )
          let th14 = @kernel.trans(
            th13,
            @calc_int.real_int_sub_conv(@kernel.rand(@kernel.concl(th13))),
          )
          let th15 = @equal.ap_term(@kernel.rator(@kernel.rand(tm5a)), th14)
          let th16 = @kernel.trans(
            th15,
            @calc_int.real_int_abs_conv(@kernel.rand(@kernel.concl(th15))),
          )
          let th17 = @kernel.mk_comb_rule(
            @equal.ap_term(@kernel.rator(tm5a), th16),
            th6,
          )
          let th18 = @kernel.trans(
            th17,
            @calc_int.real_int_le_conv(@kernel.rand(@kernel.concl(th17))),
          )
          let t2119 = @bool.eqt_elim(th18)
          @drule.match_mp(th5)(t2119)
        }
      } else {
        let yth = f_2(n_1)
        {
          r_2.val = (n_1, yth)
          ()
        }
        yth
      }
    }
  }
  let thm_wrap : ((@num.Num) -> @kernel.Thm raise) -> (
    Ref[(@num.Num, @kernel.Thm)],
    (@num.Num) -> @kernel.Thm raise,
  ) raise = fn(
    x2120 : (@num.Num) -> @kernel.Thm raise,
  ) -> (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise) raise {
    let _ as f_3 = x2120
    (Ref::{ val: (@num.num_of_int64(-1L), @bool.truth()), }, f_3)
  }
  fn find_msd(
    x2121 : @num.Num,
    x2122 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) -> @num.Num raise {
    let n_2 = x2121
    let f_4 = x2122
    let t2123 = @num.abs_num(raw_eval(f_4)(n_2))
    if @num.lt_num(@num.num_of_int64(1L), t2123) {
      n_2
    } else {
      find_msd(@num.add_num(n_2, @num.num_of_int64(1L)), f_4)
    }
  }
  let t2124 = @num.num_of_int64(0L)
  let find_msd_1 : ((Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise)) -> @num.Num raise = (
    x2125 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) => find_msd(t2124, x2125)
  fn find_msd_2(
    x2126 : @num.Num,
    x2127 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) -> @num.Num raise {
    let n_3 = x2126
    let f_5 = x2127
    let t2128 = @num.abs_num(raw_eval(f_5)(n_3))
    if @num.lt_num(@num.num_of_int64(32L), t2128) {
      n_3
    } else {
      find_msd_2(@num.add_num(n_3, @num.num_of_int64(1L)), f_5)
    }
  }
  let t2129 = @num.num_of_int64(0L)
  let find_acc : ((Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise)) -> @num.Num raise = (
    x2130 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) => find_msd_2(t2129, x2130)
  let find_ubound : ((Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise)) -> @num.Num raise = fn(
    x2131 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  ) -> @num.Num raise {
    let f_6 = x2131
    let k = find_acc(f_6)
    let a = @num.abs_num(raw_eval(f_6)(k))
    @num.sub_num(k, log2(@num.add_num(a, @num.num_of_int64(1L))))
  }
  let t_tm = @term_syntax.parse_term("(t : (Num) -> Real)")
  let n_tm_1 = @term_syntax.parse_term("(n : Num)")
  let m_tm_1 = @term_syntax.parse_term("(m : Num)")
  let e_tm_1 = @term_syntax.parse_term("(e : Num)")
  let p_tm = @term_syntax.parse_term("(p : Num)")
  let s_tm = @term_syntax.parse_term("(s : Real)")
  let u_tm = @term_syntax.parse_term("(u : Real)")
  let x_tm = @term_syntax.parse_term("(x : Real)")
  fn calculate_m(
    x2132 : @num.Num,
    x2133 : @num.Num,
    x2134 : @num.Num,
  ) -> @num.Num raise {
    let acc = x2132
    let i = x2133
    let r_3 = x2134
    if @num.ge_num(acc, r_3) {
      i
    } else {
      let i_p = @num.add_num(i, @num.num_of_int64(1L))
      calculate_m(@num.mult_num(i_p, acc), i_p, r_3)
    }
  }
  fn calculate_exp_sequence(
    x2135 : @num.Num,
    x2136 : @num.Num,
    x2137 : @num.Num,
  ) -> @list.List[@num.Num] raise {
    let p2 = x2135
    let s_1 = x2136
    let i_1 = x2137
    if @num.lt_num(i_1, @num.num_of_int64(0L)) {
      @list.List([])
    } else if @num.eq_num(i_1, @num.num_of_int64(0L)) {
      @list.List([p2])
    } else {
      let acc_1 = calculate_exp_sequence(
        p2,
        s_1,
        @num.sub_num(i_1, @num.num_of_int64(1L)),
      )
      let t = @lib.hd(acc_1)
      let t2138 = @num.mult_num(p2, i_1)
      let t_p = ndiv(@num.mult_num(s_1, t))(t2138)
      acc_1.prepend(t_p)
    }
  }
  let calculate_exp_sequence_1 : (@num.Num) -> ((@num.Num) -> ((@num.Num) -> @list.List[
    @num.Num,
  ] raise) raise) raise = fn(
    x2139 : @num.Num,
  ) -> ((@num.Num) -> ((@num.Num) -> @list.List[@num.Num] raise) raise) raise {
    let p = x2139
    fn(x2140 : @num.Num) -> ((@num.Num) -> @list.List[@num.Num] raise) raise {
      let s_2 = x2140
      fn(x2141 : @num.Num) -> @list.List[@num.Num] raise {
        let m = x2141
        let p2_1 = @num.power_num(@num.num_of_int64(2L), p)
        @lib.rev(
          calculate_exp_sequence(
            p2_1,
            s_2,
            @num.sub_num(m, @num.num_of_int64(1L)),
          ),
        )
      }
    }
  }
  let t2143 = @simp.asm_rewrite_tac(@list.List([]))
  let t2142 = @tactics.match_mp_tac(approx_exp())
  let t2144 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2142),
    t2143,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) → abs((s : Real) - pow(real_of_num(2), (p : Num)) * x) < real_of_num(1) → (n : Num) + ((e : Num) + 2) == p && real_of_num(3) * pow(real_of_num(2), n + 2) <= real_of_num(FACT((m : Num))) && real_of_num(2) * real_of_num(m) <= pow(real_of_num(2), e) && (t : (Num) -> Real)(0) == pow(real_of_num(2), p) && (∀ k : Num, SUC(k) < m → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), p) * real_of_num(SUC(k))) - s * t(k)) <= pow(real_of_num(2), p) * real_of_num(SUC(k))) && abs((u : Real) * pow(real_of_num(2), e + 2) - sum((0, m), t)) <= pow(real_of_num(2), e + 1) → abs(u - pow(real_of_num(2), n) * exp(x)) < real_of_num(1)"),
    t2144,
  )
  let t2145 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let left_zero_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.once_rewrite_rule(
    @list.List([@tactics.prove(@term_syntax.parse_term("0 + (n : Num) == n"), t2145)]),
  )
  let realcalc_exp_conv : (
    (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise = fn(
    x2146 : (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise {
    let (fn1, fn2) = x2146
    let raw_fn : (@num.Num) -> @num.Num raise = fn(
      x2147 : @num.Num,
    ) -> @num.Num raise {
      let n_4 = x2147
      let t2148 = @num.add_num(n_4, @num.num_of_int64(2L))
      let t2149 = @num.power_num(@num.num_of_int64(2L), t2148)
      let t2150 = @num.mult_num(@num.num_of_int64(3L), t2149)
      let t2151 = @num.num_of_int64(0L)
      let m_1 = calculate_m(@num.num_of_int64(1L), t2151, t2150)
      let e = log2(@num.mult_num(@num.num_of_int64(2L), m_1))
      let t2152 = @num.num_of_int64(2L)
      let p_1 = @num.add_num(@num.add_num(n_4, e), t2152)
      let s_3 = raw_eval(fn1)(p_1)
      let seq = calculate_exp_sequence_1(p_1)(s_3)(m_1)
      let u0 = @lib.itlist(
        fn(x2153 : @num.Num, x2154 : @num.Num) -> @num.Num raise {
          @num.add_num(x2153, x2154)
        },
        seq,
        @num.num_of_int64(0L),
      )
      let t2155 = @num.add_num(e, @num.num_of_int64(2L))
      let t2156 = @num.power_num(@num.num_of_int64(2L), t2155)
      ndiv(u0)(t2156)
    }
    let thm_fn : (@num.Num) -> @kernel.Thm raise = fn(
      x2157 : @num.Num,
    ) -> @kernel.Thm raise {
      let n_5 = x2157
      let t2158 = @num.add_num(n_5, @num.num_of_int64(2L))
      let t2159 = @num.power_num(@num.num_of_int64(2L), t2158)
      let t2160 = @num.mult_num(@num.num_of_int64(3L), t2159)
      let t2161 = @num.num_of_int64(0L)
      let m_2 = calculate_m(@num.num_of_int64(1L), t2161, t2160)
      let e_1 = log2(@num.mult_num(@num.num_of_int64(2L), m_2))
      let t2162 = @num.num_of_int64(2L)
      let p_2 = @num.add_num(@num.add_num(n_5, e_1), t2162)
      let sth = thm_eval(fn2)(p_2)
      let tm1 = @kernel.rand(@equal.lhand(@kernel.concl(sth)))
      let s_num = @equal.lhand(tm1)
      let x_num = @kernel.rand(@kernel.rand(tm1))
      let s_4 = @calc_int.dest_realintconst(s_num)
      let seq_1 = calculate_exp_sequence_1(p_2)(s_4)(m_2)
      let u0_1 = @lib.itlist(
        fn(x2163 : @num.Num, x2164 : @num.Num) -> @num.Num raise {
          @num.add_num(x2163, x2164)
        },
        seq_1,
        @num.num_of_int64(0L),
      )
      let t2165 = @num.add_num(e_1, @num.num_of_int64(2L))
      let t2166 = @num.power_num(@num.num_of_int64(2L), t2165)
      let u = ndiv(u0_1)(t2166)
      let m_num = @nums.mk_numeral(m_2)
      let n_num = @nums.mk_numeral(n_5)
      let e_num = @nums.mk_numeral(e_1)
      let p_num = @nums.mk_numeral(p_2)
      let u_num = @calc_int.mk_realintconst(u)
      let tdefs = @lib.map2(
        fn(x2167 : Int64, x2168 : @num.Num) -> @kernel.Term raise {
          let a_1 = x2167
          let b = x2168
          let t2169 = @calc_int.mk_realintconst(b)
          @basics.mk_eq(
            @kernel.mk_comb(t_tm, @nums.mk_small_numeral(a_1)),
            t2169,
          )
        },
        @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(seq_1)), 1L)),
        seq_1,
      )
      let p2th = @calc_int.real_int_pow_conv(@kernel.mk_comb(pow2_tm, p_num))
      let th0 = @kernel.inst_rule(
        @list.List([
          (m_num, m_tm_1),
          (n_num, n_tm_1),
          (e_num, e_tm_1),
          (x_num, x_tm),
          (p_num, p_tm),
          (s_num, s_tm),
          (u_num, u_tm),
        ]),
        pth,
      )
      let th0_p = @bool.mp(
        th0,
        @bool.eqt_elim(
          @calc_rat.real_rat_reduce_conv(@equal.lhand(@kernel.concl(th0))),
        ),
      )
      let th1_1 = @bool.mp(th0_p, sth)
      let th2_1 = @equal.conv_rule(
        @equal.once_depth_conv(expand_range_conv),
        th1_1,
      )
      let th3_1 = left_zero_rule(
        @equal.conv_rule(@equal.once_depth_conv(@analysis.real_sum_conv), th2_1),
      )
      let ths = @bool.conjuncts_rule(
        @kernel.assume_rule(@bool.list_mk_conj(tdefs)),
      ) catch {
        Failure(_) => @list.List([])
        e => raise e
      }
      let th4_1 = @equal.subs(ths.prepend(p2th), th3_1)
      let t2170 = @equal.once_depth_conv(@calc_num.num_fact_conv)
      let th5_1 = @equal.conv_rule(
        @equal.land_conv(
          @equal.thenc(
            @equal.thenc(@equal.depth_conv(@calc_num.num_add_conv), t2170),
            @calc_int.real_int_reduce_conv,
          ),
        ),
        th4_1,
      )
      @bool.mp(eliminate_def(tdefs)(th5_1), @bool.truth())
    }
    let t2171 = thm_wrap(thm_fn)
    (raw_wrap(raw_fn), t2171)
  }
  let t_tm_1 = @term_syntax.parse_term("(t : (Num) -> Real)")
  let n_tm_2 = @term_syntax.parse_term("(n : Num)")
  let m_tm_2 = @term_syntax.parse_term("(m : Num)")
  let e_tm_2 = @term_syntax.parse_term("(e : Num)")
  let p_tm_1 = @term_syntax.parse_term("(p : Num)")
  let s_tm_1 = @term_syntax.parse_term("(s : Real)")
  let u_tm_1 = @term_syntax.parse_term("(u : Real)")
  let k_tm = @term_syntax.parse_term("(k : Num)")
  let x_tm_1 = @term_syntax.parse_term("(x : Real)")
  fn calculate_m_1(
    x2172 : @num.Num,
    x2173 : @num.Num,
    x2174 : @num.Num,
    x2175 : @num.Num,
  ) -> @num.Num raise {
    let acc_2 = x2172
    let k2 = x2173
    let m_3 = x2174
    let r_4 = x2175
    if @num.ge_num(
        @num.mult_num(acc_2, @num.add_num(m_3, @num.num_of_int64(1L))),
        r_4,
      ) {
      m_3
    } else {
      let t2176 = @num.add_num(m_3, @num.num_of_int64(1L))
      calculate_m_1(@num.mult_num(k2, acc_2), k2, t2176, r_4)
    }
  }
  fn calculate_ln_sequence(
    x2177 : @num.Num,
    x2178 : @num.Num,
    x2179 : @num.Num,
  ) -> @list.List[@num.Num] raise {
    let p2_2 = x2177
    let s_5 = x2178
    let i_2 = x2179
    if @num.lt_num(i_2, @num.num_of_int64(0L)) {
      @list.List([])
    } else if @num.eq_num(i_2, @num.num_of_int64(0L)) {
      @list.List([s_5])
    } else {
      let acc_3 = calculate_ln_sequence(
        p2_2,
        s_5,
        @num.sub_num(i_2, @num.num_of_int64(1L)),
      )
      let t_1 = @lib.hd(acc_3)
      let t2180 = @num.mult_num(p2_2, @num.add_num(i_2, @num.num_of_int64(1L)))
      let t_p_1 = ndiv(
        @num.mult_num(
          @num.mult_num(@num.mult_num(@num.num_of_int64(-1L), s_5), t_1),
          i_2,
        ),
      )(t2180)
      acc_3.prepend(t_p_1)
    }
  }
  let calculate_ln_sequence_1 : (@num.Num) -> ((@num.Num) -> ((@num.Num) -> @list.List[
    @num.Num,
  ] raise) raise) raise = fn(
    x2181 : @num.Num,
  ) -> ((@num.Num) -> ((@num.Num) -> @list.List[@num.Num] raise) raise) raise {
    let p_3 = x2181
    fn(x2182 : @num.Num) -> ((@num.Num) -> @list.List[@num.Num] raise) raise {
      let s_6 = x2182
      fn(x2183 : @num.Num) -> @list.List[@num.Num] raise {
        let m_4 = x2183
        let p2_3 = @num.power_num(@num.num_of_int64(2L), p_3)
        @lib.rev(
          calculate_ln_sequence(
            p2_3,
            s_6,
            @num.sub_num(m_4, @num.num_of_int64(1L)),
          ),
        )
      }
    }
  }
  let t2189 = @simp.asm_rewrite_tac(@list.List([]))
  let t2188 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("abs(-(a : Real) - -(b : Real)) == abs(a - b)")),
    ]),
  )
  let t2187 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg()]))
  let t2186 = @simp.asm_rewrite_tac(@list.List([@analysis.real_neg_neg()]))
  let t2184 = @term_syntax.parse_term("(s : Real)")
  let t2185 = @tactics.match_mp_tac(
    @kernel.inst_rule(
      @list.List([(@term_syntax.parse_term("-(s : Real)"), t2184)]),
      approx_ln(),
    ),
  )
  let t2190 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2185),
          t2186,
        ),
        t2187,
      ),
      t2188,
    ),
    t2189,
  )
  let pth_1 = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= inv(pow(real_of_num(2), (k : Num))) → abs((s : Real) - pow(real_of_num(2), (p : Num)) * x) < real_of_num(1) → !(k == 0) && (n : Num) + ((e : Num) + 2) == p && pow(real_of_num(2), n + 2) <= pow(real_of_num(2), k * SUC((m : Num))) * real_of_num(SUC(m)) && real_of_num(3) * real_of_num(m) <= pow(real_of_num(2), e) && (t : (Num) -> Real)(0) == s && (∀ k : Num, SUC(k) < m → real_of_num(2) * abs(t(SUC(k)) * (pow(real_of_num(2), p) * real_of_num(SUC(SUC(k)))) - real_of_num(SUC(k)) * (-s * t(k))) <= pow(real_of_num(2), p) * real_of_num(SUC(SUC(k)))) && abs((u : Real) * pow(real_of_num(2), e + 2) - sum((0, m), t)) <= pow(real_of_num(2), e + 1) → abs(u - pow(real_of_num(2), n) * ln(real_of_num(1) + x)) < real_of_num(1)"),
    t2190,
  )
  let t2191 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let left_zero_rule_1 : (@kernel.Thm) -> @kernel.Thm raise = @simp.once_rewrite_rule(
    @list.List([@tactics.prove(@term_syntax.parse_term("0 + (n : Num) == n"), t2191)]),
  )
  let pow2_tm_1 = @term_syntax.parse_term("pow(real_of_num(2))")
  let default_tdefs = @list.List([@term_syntax.parse_term("(t : (Num) -> Real)(0) == real_of_num(0)")])
  let realcalc_ln_conv : (
    (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise = fn(
    x2192 : (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise {
    let (fn1_1, fn2_1) = x2192
    let raw_fn_1 : (@num.Num) -> @num.Num raise = fn(
      x2193 : @num.Num,
    ) -> @num.Num raise {
      let n_6 = x2193
      let k_1 = find_ubound(fn1_1)
      if @num.lt_num(k_1, @num.num_of_int64(1L)) {
        raise Failure("ln of number not provably <= 1/2")
      } else {
        let k2_1 = @num.power_num(@num.num_of_int64(2L), k_1)
        let t2194 = @num.add_num(n_6, @num.num_of_int64(2L))
        let t2195 = @num.power_num(@num.num_of_int64(2L), t2194)
        let m_5 = calculate_m_1(k2_1, k2_1, @num.num_of_int64(0L), t2195)
        let e_2 = log2(@num.mult_num(@num.num_of_int64(3L), m_5))
        let t2196 = @num.num_of_int64(2L)
        let p_4 = @num.add_num(@num.add_num(n_6, e_2), t2196)
        let s_7 = raw_eval(fn1_1)(p_4)
        let seq_2 = calculate_ln_sequence_1(p_4)(s_7)(m_5)
        let u0_2 = @lib.itlist(
          fn(x2197 : @num.Num, x2198 : @num.Num) -> @num.Num raise {
            @num.add_num(x2197, x2198)
          },
          seq_2,
          @num.num_of_int64(0L),
        )
        let t2199 = @num.add_num(e_2, @num.num_of_int64(2L))
        let t2200 = @num.power_num(@num.num_of_int64(2L), t2199)
        ndiv(u0_2)(t2200)
      }
    }
    let thm_fn_1 : (@num.Num) -> @kernel.Thm raise = fn(
      x2201 : @num.Num,
    ) -> @kernel.Thm raise {
      let n_7 = x2201
      let k_2 = find_ubound(fn1_1)
      if @num.lt_num(k_2, @num.num_of_int64(1L)) {
        raise Failure("ln of number not provably <= 1/2")
      } else {
        let k2_2 = @num.power_num(@num.num_of_int64(2L), k_2)
        let t2202 = @num.add_num(n_7, @num.num_of_int64(2L))
        let t2203 = @num.power_num(@num.num_of_int64(2L), t2202)
        let m_6 = calculate_m_1(k2_2, k2_2, @num.num_of_int64(0L), t2203)
        let e_3 = log2(@num.mult_num(@num.num_of_int64(3L), m_6))
        let t2204 = @num.num_of_int64(2L)
        let p_5 = @num.add_num(@num.add_num(n_7, e_3), t2204)
        let sth_1 = thm_eval(fn2_1)(p_5)
        let tm1_1 = @kernel.rand(@equal.lhand(@kernel.concl(sth_1)))
        let s_num_1 = @equal.lhand(tm1_1)
        let x_num_1 = @kernel.rand(@kernel.rand(tm1_1))
        let s_8 = @calc_int.dest_realintconst(s_num_1)
        let seq_3 = calculate_ln_sequence_1(p_5)(s_8)(m_6)
        let u0_3 = @lib.itlist(
          fn(x2205 : @num.Num, x2206 : @num.Num) -> @num.Num raise {
            @num.add_num(x2205, x2206)
          },
          seq_3,
          @num.num_of_int64(0L),
        )
        let t2207 = @num.add_num(e_3, @num.num_of_int64(2L))
        let t2208 = @num.power_num(@num.num_of_int64(2L), t2207)
        let u_1 = ndiv(u0_3)(t2208)
        let m_num_1 = @nums.mk_numeral(m_6)
        let n_num_1 = @nums.mk_numeral(n_7)
        let e_num_1 = @nums.mk_numeral(e_3)
        let p_num_1 = @nums.mk_numeral(p_5)
        let k_num = @nums.mk_numeral(k_2)
        let u_num_1 = @calc_int.mk_realintconst(u_1)
        let tdefs0 = @lib.map2(
          fn(x2209 : Int64, x2210 : @num.Num) -> @kernel.Term raise {
            let a_2 = x2209
            let b_1 = x2210
            let t2211 = @calc_int.mk_realintconst(b_1)
            @basics.mk_eq(
              @kernel.mk_comb(t_tm_1, @nums.mk_small_numeral(a_2)),
              t2211,
            )
          },
          @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(seq_3)), 1L)),
          seq_3,
        )
        let tdefs_1 = if tdefs0 == @list.List([]) {
          default_tdefs
        } else {
          tdefs0
        }
        let p2th_1 = @calc_int.real_int_pow_conv(
          @kernel.mk_comb(pow2_tm_1, p_num_1),
        )
        let th0_1 = @kernel.inst_rule(
          @list.List([
            (m_num_1, m_tm_2),
            (n_num_1, n_tm_2),
            (e_num_1, e_tm_2),
            (k_num, k_tm),
            (x_num_1, x_tm_1),
            (p_num_1, p_tm_1),
            (s_num_1, s_tm_1),
            (u_num_1, u_tm_1),
          ]),
          pth_1,
        )
        let th0_p_1 = @bool.mp(
          th0_1,
          @bool.eqt_elim(
            @calc_rat.real_rat_reduce_conv(@equal.lhand(@kernel.concl(th0_1))),
          ),
        )
        let th1_2 = @bool.mp(th0_p_1, sth_1)
        let th2_2 = @equal.conv_rule(
          @equal.once_depth_conv(expand_range_conv),
          th1_2,
        )
        let th3_2 = left_zero_rule_1(
          @equal.conv_rule(
            @equal.once_depth_conv(@analysis.real_sum_conv),
            th2_2,
          ),
        )
        let ths_1 = @bool.conjuncts_rule(
          @kernel.assume_rule(@bool.list_mk_conj(tdefs_1)),
        ) catch {
          Failure(_) => @list.List([])
          e => raise e
        }
        let th4_2 = @equal.subs(ths_1.prepend(p2th_1), th3_2)
        let th5_2 = @equal.conv_rule(
          @equal.land_conv(
            @equal.thenc(
              @calc_num.num_reduce_conv, @calc_int.real_int_reduce_conv,
            ),
          ),
          th4_2,
        )
        @bool.mp(eliminate_def(tdefs_1)(th5_2), @bool.truth())
      }
    }
    let t2212 = thm_wrap(thm_fn_1)
    (raw_wrap(raw_fn_1), t2212)
  }
  fn isolate_sqrt(
    x2213 : (@num.Num, @num.Num),
    x2214 : @num.Num,
  ) -> @num.Num raise {
    let (a_3, b_2) = x2213
    let y_2 = x2214
    let t2215 = @num.num_of_int64(1L)
    if @num.le_num(@num.abs_num(@num.sub_num(a_3, b_2)), t2215) {
      if @num.le_num(
          @num.abs_num(@num.sub_num(@num.mult_num(a_3, a_3), y_2)),
          a_3,
        ) {
        a_3
      } else {
        b_2
      }
    } else {
      let t2216 = @num.num_of_int64(2L)
      let c = @num.quo_num(@num.add_num(a_3, b_2), t2216)
      if @num.le_num(@num.mult_num(c, c), y_2) {
        isolate_sqrt((c, b_2), y_2)
      } else {
        isolate_sqrt((a_3, c), y_2)
      }
    }
  }
  let num_sqrt : (@num.Num) -> @num.Num raise = fn(
    x2217 : @num.Num,
  ) -> @num.Num raise {
    let n_8 = x2217
    isolate_sqrt((@num.num_of_int64(0L), n_8), n_8)
  }
  let match_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    realcalc_sqrt(),
  )
  let b_tm_1 = @term_syntax.parse_term("(b : Real)")
  let t2233 = @simp.asm_simp_tac(@list.List([@real.sqrt_pos_le()]))
  let t2232 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t2231 = @simp.rewrite_tac(@list.List([@analysis.pow_2()]))
  let t2234 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x2228 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2229 = @equal.rand_conv(x2228)
            fn(x2230 : @kernel.Term) -> @kernel.Thm raise { s2229(x2230) }
          },
          @list.List([@equal.gsym(@realax.real_mul_lid())]),
        ),
        t2231,
      ),
      t2232,
    ),
    t2233,
  )
  let t2227 = @simp.asm_rewrite_tac(@list.List([@real.sqrt_pow2()]))
  let t2235 = @list.List([
    @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t2227),
    t2234,
  ])
  let t2226 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Real) == pow(sqrt(x), 2)"), fn(
    x2223 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2224 = @tactics.subst1_tac(x2223)
    fn(
      x2225 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2224(x2225)
    }
  })
  let t2222 = @simp.rewrite_tac(@list.List([@analysis.real_not_le()]))
  let t2221 = @tactics.conv_tac(@class.contrapos_conv)
  let t2236 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(fn(
              x2218 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let th = x2218
              let t2220 = @tactics.mp_tac(th)
              @tactics.then_tac(
                @tactics.assume_tac(
                  @drule.match_mp(
                    @calc_rat.real_arith(
                      @term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) <= x"),
                    ),
                  )(th),
                ),
                t2220,
              )
            }),
            t2221,
          ),
          t2222,
        ),
        @tactics.disch_tac,
      ),
      t2226,
    ),
    t2235,
  )
  let pth_2 = @tactics.prove(
    @term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) <= sqrt(x)"),
    t2236,
  )
  let t2237 = @tactics.conv_tac(@calc_rat.real_rat_le_conv)
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(
    @tactics.repeat_tac(@tactics.match_mp_tac(pth_2)),
    t2237,
  )
  let prove_1_le_sqrt : (@kernel.Term) -> @kernel.Thm raise = fn(
    x2238 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x2238
    @tactics.prove(tm, tac) catch {
      Failure(_) => raise Failure("Need root body >= &1")
      e => raise e
    }
  }
  let realcalc_sqrt_conv : (
    (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise = fn(
    x2239 : (
      (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
      (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
    ),
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise {
    let (fn1_2, fn2_2) = x2239
    let raw_fn_2 : (@num.Num) -> @num.Num raise = fn(
      x2240 : @num.Num,
    ) -> @num.Num raise {
      let n_9 = x2240
      let t2241 = raw_eval(fn1_2)(n_9)
      num_sqrt(@num.mult_num(@num.power_num(@num.num_of_int64(2L), n_9), t2241))
    }
    let thm_fn_2 : (@num.Num) -> @kernel.Thm raise = fn(
      x2242 : @num.Num,
    ) -> @kernel.Thm raise {
      let n_10 = x2242
      let th1_3 = match_pth(thm_eval(fn2_2)(n_10))
      let th2_3 = @bool.mp(
        th1_3,
        prove_1_le_sqrt(@equal.lhand(@kernel.concl(th1_3))),
      )
      let th3_3 = @equal.conv_rule(
        @lib.funpow(
          2,
          fn(
            x2243 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2244 = @equal.land_conv(x2243)
            fn(x2245 : @kernel.Term) -> @kernel.Thm raise { s2244(x2245) }
          },
          @lib.funpow(
            2,
            fn(
              x2246 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2247 = @equal.rand_conv(x2246)
              fn(x2248 : @kernel.Term) -> @kernel.Thm raise { s2247(x2248) }
            },
            @calc_rat.real_rat_reduce_conv,
          ),
        ),
        th2_3,
      )
      let k_3 = @calc_int.dest_realintconst(
        @kernel.rand(
          @kernel.rand(@equal.lhand(@equal.lhand(@kernel.concl(th3_3)))),
        ),
      )
      let th4_3 = @kernel.inst_rule(
        @list.List([(@calc_int.mk_realintconst(num_sqrt(k_3)), b_tm_1)]),
        th3_3,
      )
      @bool.mp(
        th4_3,
        @bool.eqt_elim(
          @calc_rat.real_rat_reduce_conv(@equal.lhand(@kernel.concl(th4_3))),
        ),
      )
    }
    let t2249 = thm_wrap(thm_fn_2)
    (raw_wrap(raw_fn_2), t2249)
  }
  fn realcalc_conv(
    x2250 : @kernel.Term,
  ) -> (
    (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
  ) raise {
    let tm_1 = x2250
    @lib.assoc(tm_1, realcalc_cache().val) catch {
      Failure(_) =>
        if @calc_int.is_ratconst(tm_1) {
          let x_1 = @calc_int.rat_of_term(tm_1)
          let raw_fn_3 : (@num.Num) -> @num.Num raise = fn(
            x2251 : @num.Num,
          ) -> @num.Num raise {
            let acc_4 = x2251
            @num.floor_num(
              @num.mult_num(@num.power_num(@num.num_of_int64(2L), acc_4), x_1),
            )
          }
          let thm_fn_3 : (@num.Num) -> @kernel.Thm raise = fn(
            x2252 : @num.Num,
          ) -> @kernel.Thm raise {
            let acc_5 = x2252
            let a_4 = @num.floor_num(
              @num.mult_num(@num.power_num(@num.num_of_int64(2L), acc_5), x_1),
            )
            let atm = @calc_int.mk_realintconst(a_4)
            let rtm = @kernel.mk_comb(
              @kernel.mk_comb(
                mul_tm,
                @kernel.mk_comb(pow2_tm, @nums.mk_numeral(acc_5)),
              ),
              tm_1,
            )
            let btm = @kernel.mk_comb(
              abs_tm,
              @kernel.mk_comb(@kernel.mk_comb(sub_tm, atm), rtm),
            )
            let ftm = @kernel.mk_comb(@kernel.mk_comb(lt_tm, btm), one_tm)
            @bool.eqt_elim(@calc_rat.real_rat_reduce_conv(ftm))
          }
          let t2253 = thm_wrap(thm_fn_3)
          (raw_wrap(raw_fn_3), t2253)
        } else {
          let (lop, r_5) = @kernel.dest_comb(tm_1)
          if lop == neg_tm {
            let (rfn, tfn) = realcalc_conv(r_5)
            let raw_fn_4 : (@num.Num) -> @num.Num raise = fn(
              x2254 : @num.Num,
            ) -> @num.Num raise {
              let acc_6 = x2254
              @num.minus_num(raw_eval(rfn)(acc_6))
            }
            let thm_fn_4 : (@num.Num) -> @kernel.Thm raise = fn(
              x2255 : @num.Num,
            ) -> @kernel.Thm raise {
              let acc_7 = x2255
              let th1_4 = thm_eval(tfn)(acc_7)
              let th2_4 = @drule.match_mp(realcalc_neg())(th1_4)
              try {
                let t2256 = @kernel.concl(th2_4)
                @kernel.eq_mp(
                  @equal.land_conv(
                    @equal.rand_conv(
                      @equal.land_conv(@calc_int.real_int_neg_conv),
                    ),
                  )(t2256),
                  th2_4,
                )
              } catch {
                Failure(_) => th2_4
                e => raise e
              }
            }
            let t2257 = thm_wrap(thm_fn_4)
            (raw_wrap(raw_fn_4), t2257)
          } else if lop == abs_tm {
            let (rfn_1, tfn_1) = realcalc_conv(r_5)
            let raw_fn_5 : (@num.Num) -> @num.Num raise = fn(
              x2258 : @num.Num,
            ) -> @num.Num raise {
              let acc_8 = x2258
              @num.abs_num(raw_eval(rfn_1)(acc_8))
            }
            let thm_fn_5 : (@num.Num) -> @kernel.Thm raise = fn(
              x2259 : @num.Num,
            ) -> @kernel.Thm raise {
              let acc_9 = x2259
              let th1_5 = thm_eval(tfn_1)(acc_9)
              let th2_5 = @drule.match_mp(realcalc_abs())(th1_5)
              @equal.conv_rule(
                @equal.land_conv(
                  @equal.rand_conv(
                    @equal.land_conv(@calc_int.real_int_abs_conv),
                  ),
                ),
                th2_5,
              )
            }
            let t2260 = thm_wrap(thm_fn_5)
            (raw_wrap(raw_fn_5), t2260)
          } else if lop == sqrt_tm {
            realcalc_sqrt_conv(realcalc_conv(r_5))
          } else if lop == inv_tm {
            let (rfn_2, tfn_2) = realcalc_conv(r_5)
            let t2261 = @num.num_of_int64(0L)
            let x0 = raw_eval(rfn_2)(t2261)
            let ax0 = @num.abs_num(x0)
            let t2262 = @num.num_of_int64(1L)
            let r_6 = @num.sub_num(log2(ax0), t2262)
            let get_ek : (@num.Num) -> (@num.Num, @num.Num) raise = fn(
              x2263 : @num.Num,
            ) -> (@num.Num, @num.Num) raise {
              let acc_10 = x2263
              if @lib.compare(r_6, @num.num_of_int64(0L)) < 0 {
                let p_6 = find_msd_1(rfn_2)
                let t2264 = @num.num_of_int64(1L)
                let e_4 = @num.add_num(@num.add_num(acc_10, p_6), t2264)
                let k_4 = @num.add_num(e_4, p_6)
                (e_4, k_4)
              } else {
                let t2265 = @num.mult_num(@num.num_of_int64(2L), r_6)
                let k0 = @num.sub_num(
                  @num.add_num(acc_10, @num.num_of_int64(1L)),
                  t2265,
                )
                let k_5 = if @num.lt_num(k0, @num.num_of_int64(0L)) {
                  @num.num_of_int64(0L)
                } else {
                  k0
                }
                let e_5 = @num.add_num(r_6, k_5)
                (e_5, k_5)
              }
            }
            let raw_fn_6 : (@num.Num) -> @num.Num raise = fn(
              x2266 : @num.Num,
            ) -> @num.Num raise {
              let acc_11 = x2266
              let (_, k_6) = get_ek(acc_11)
              let t2267 = @num.add_num(acc_11, k_6)
              let nk2 = @num.power_num(@num.num_of_int64(2L), t2267)
              let t2268 = raw_eval(rfn_2)(k_6)
              ndiv(nk2)(t2268)
            }
            let thm_fn_6 : (@num.Num) -> @kernel.Thm raise = fn(
              x2269 : @num.Num,
            ) -> @kernel.Thm raise {
              let acc_12 = x2269
              let (e_6, k_7) = get_ek(acc_12)
              let t2270 = @num.add_num(acc_12, k_7)
              let nk2_1 = @num.power_num(@num.num_of_int64(2L), t2270)
              let th1_6 = thm_eval(tfn_2)(k_7)
              let atm_1 = @equal.lhand(
                @kernel.rand(@equal.lhand(@kernel.concl(th1_6))),
              )
              let a_5 = @calc_int.dest_realintconst(atm_1)
              let b_3 = ndiv(nk2_1)(a_5)
              let btm_1 = @calc_int.mk_realintconst(b_3)
              let etm = @nums.mk_numeral(e_6)
              let ntm = @nums.mk_numeral(acc_12)
              let th2_6 = @drule.match_mp(realcalc_inv())(th1_6)
              let th3_4 = @kernel.inst_rule(
                @list.List([(btm_1, b_tm), (etm, e_tm), (ntm, n_tm)]),
                th2_6,
              )
              let th4_4 = @bool.mp(
                th3_4,
                integer_prove(@equal.lhand(@kernel.concl(th3_4))),
              )
              let th5_3 = @bool.mp(
                th4_4,
                integer_prove(@equal.lhand(@kernel.concl(th4_4))),
              )
              let th6_1 = @bool.mp(
                th5_3,
                @bool.eqt_elim(
                  @calc_num.num_reduce_conv(@equal.lhand(@kernel.concl(th5_3))),
                ),
              )
              let th7_1 = @bool.mp(
                th6_1,
                @bool.eqt_elim(
                  @calc_int.real_int_reduce_conv(
                    @equal.lhand(@kernel.concl(th6_1)),
                  ),
                ),
              )
              let t2274 = @equal.lhand(@kernel.concl(th7_1))
              @bool.mp(
                th7_1,
                @bool.eqt_elim(
                  @equal.thenc(
                    @equal.land_conv(
                      @lib.funpow(
                        4,
                        fn(
                          x2271 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          let s2272 = @equal.rand_conv(x2271)
                          fn(x2273 : @kernel.Term) -> @kernel.Thm raise {
                            s2272(x2273)
                          }
                        },
                        @calc_num.num_add_conv,
                      ),
                    ),
                    @calc_int.real_int_reduce_conv,
                  )(t2274),
                ),
              )
            }
            let t2275 = thm_wrap(thm_fn_6)
            (raw_wrap(raw_fn_6), t2275)
          } else if lop == exp_tm {
            let (rfn_3, tfn_3) = realcalc_conv(r_5)
            realcalc_exp_conv((rfn_3, tfn_3))
          } else if lop == ln_tm {
            let (r1, r2) = @kernel.dest_comb(r_5)
            if r1 == add1_tm {
              let (rfn_4, tfn_4) = realcalc_conv(r2)
              realcalc_ln_conv((rfn_4, tfn_4))
            } else {
              raise Failure(
                "Can only do logs like ln(&1 + x) for small rational x",
              )
            }
          } else {
            let (op, l) = @kernel.dest_comb(lop)
            if op == add_tm {
              let (rfn1, tfn1) = realcalc_conv(l)
              let (rfn2, tfn2) = realcalc_conv(r_5)
              let raw_fn_7 : (@num.Num) -> @num.Num raise = fn(
                x2276 : @num.Num,
              ) -> @num.Num raise {
                let acc_13 = x2276
                let acc_p = @num.add_num(acc_13, @num.num_of_int64(2L))
                let t2278 = @num.num_of_int64(4L)
                let t2277 = raw_eval(rfn2)(acc_p)
                ndiv(@num.add_num(raw_eval(rfn1)(acc_p), t2277))(t2278)
              }
              let thm_fn_7 : (@num.Num) -> @kernel.Thm raise = fn(
                x2279 : @num.Num,
              ) -> @kernel.Thm raise {
                let acc_14 = x2279
                let acc_p_1 = @num.add_num(acc_14, @num.num_of_int64(2L))
                let th1_7 = @kernel.inst_rule(
                  @list.List([(@nums.mk_numeral(acc_14), n_tm)]),
                  realcalc_add(),
                )
                let t2280 = @calc_num.num_add_conv(
                  @equal.lhand(@equal.lhand(@kernel.concl(th1_7))),
                )
                let th2_7 = @drule.match_mp(th1_7)(t2280)
                let th3_5 = thm_eval(tfn1)(acc_p_1)
                let th4_5 = @drule.match_mp(th2_7)(th3_5)
                let th5_4 = thm_eval(tfn2)(acc_p_1)
                let th6_2 = @drule.match_mp(th4_5)(th5_4)
                let n1 = @calc_int.dest_realintconst(
                  @equal.lhand(@kernel.rand(@equal.lhand(@kernel.concl(th3_5)))),
                )
                let n2 = @calc_int.dest_realintconst(
                  @equal.lhand(@kernel.rand(@equal.lhand(@kernel.concl(th5_4)))),
                )
                let t2281 = @num.num_of_int64(4L)
                let ci = @calc_int.mk_realintconst(
                  ndiv(@num.add_num(n1, n2))(t2281),
                )
                let th7_2 = @kernel.inst_rule(@list.List([(ci, c_tm)]), th6_2)
                let th8_1 = @bool.eqt_elim(
                  @calc_int.real_int_reduce_conv(
                    @equal.lhand(@kernel.concl(th7_2)),
                  ),
                )
                @bool.mp(th7_2, th8_1)
              }
              let t2282 = thm_wrap(thm_fn_7)
              (raw_wrap(raw_fn_7), t2282)
            } else if op == mul_tm {
              let (rfn1_1, tfn1_1) = realcalc_conv(l)
              let (rfn2_1, tfn2_1) = realcalc_conv(r_5)
              let get_kl : (@num.Num) -> (@num.Num, @num.Num) raise = fn(
                x2283 : @num.Num,
              ) -> (@num.Num, @num.Num) raise {
                let acc_15 = x2283
                let n_p = @num.add_num(acc_15, @num.num_of_int64(2L))
                let r_7 = @num.quo_num(n_p, @num.num_of_int64(2L))
                let s_9 = @num.sub_num(n_p, r_7)
                let p_7 = log2(@num.abs_num(raw_eval(rfn1_1)(r_7)))
                let q_1 = log2(@num.abs_num(raw_eval(rfn2_1)(s_9)))
                let t2284 = @num.num_of_int64(1L)
                let k_8 = @num.add_num(@num.add_num(q_1, r_7), t2284)
                let t2285 = @num.num_of_int64(1L)
                let l_1 = @num.add_num(@num.add_num(p_7, s_9), t2285)
                if @num.eq_num(p_7, @num.num_of_int64(0L)) &&
                  @num.eq_num(q_1, @num.num_of_int64(0L)) {
                  if @num.lt_num(k_8, l_1) {
                    (@num.add_num(k_8, @num.num_of_int64(1L)), l_1)
                  } else {
                    (k_8, @num.add_num(l_1, @num.num_of_int64(1L)))
                  }
                } else {
                  (k_8, l_1)
                }
              }
              let raw_fn_8 : (@num.Num) -> @num.Num raise = fn(
                x2286 : @num.Num,
              ) -> @num.Num raise {
                let acc_16 = x2286
                let (k_9, l_2) = get_kl(acc_16)
                let m_7 = @num.sub_num(@num.add_num(k_9, l_2), acc_16)
                let t2288 = @num.power_num(@num.num_of_int64(2L), m_7)
                let t2287 = raw_eval(rfn2_1)(l_2)
                ndiv(@num.mult_num(raw_eval(rfn1_1)(k_9), t2287))(t2288)
              }
              let thm_fn_8 : (@num.Num) -> @kernel.Thm raise = fn(
                x2289 : @num.Num,
              ) -> @kernel.Thm raise {
                let acc_17 = x2289
                let (k_10, l_3) = get_kl(acc_17)
                let m_8 = @num.sub_num(@num.add_num(k_10, l_3), acc_17)
                let th1a = thm_eval(tfn1_1)(k_10)
                let th1b = thm_eval(tfn2_1)(l_3)
                let a_6 = @calc_int.dest_realintconst(
                  @equal.lhand(@kernel.rand(@equal.lhand(@kernel.concl(th1a)))),
                )
                let b_4 = @calc_int.dest_realintconst(
                  @equal.lhand(@kernel.rand(@equal.lhand(@kernel.concl(th1b)))),
                )
                let t2290 = @num.power_num(@num.num_of_int64(2L), m_8)
                let c_1 = ndiv(@num.mult_num(a_6, b_4))(t2290)
                let ntm_1 = @nums.mk_numeral(acc_17)
                let mtm = @nums.mk_numeral(m_8)
                let ctm = @calc_int.mk_realintconst(c_1)
                let th1_8 = @drule.match_mp(realcalc_mul())(th1a)
                let th2_8 = @drule.match_mp(th1_8)(th1b)
                let th3_6 = @kernel.inst_rule(
                  @list.List([(ntm_1, n_tm), (mtm, m_tm), (ctm, c_tm)]),
                  th2_8,
                )
                let th4_6 = @bool.mp(
                  th3_6,
                  @bool.eqt_elim(
                    @calc_num.num_reduce_conv(
                      @equal.lhand(@kernel.concl(th3_6)),
                    ),
                  ),
                )
                let th5_5 = @bool.mp(
                  th4_6,
                  @bool.eqt_elim(
                    @calc_int.real_int_reduce_conv(
                      @equal.lhand(@kernel.concl(th4_6)),
                    ),
                  ),
                )
                @bool.mp(
                  th5_5,
                  @bool.eqt_elim(
                    @calc_int.real_int_reduce_conv(
                      @equal.lhand(@kernel.concl(th5_5)),
                    ),
                  ),
                )
              }
              let t2291 = thm_wrap(thm_fn_8)
              (raw_wrap(raw_fn_8), t2291)
            } else {
              raise Failure("No other operators work yet, sorry!")
            }
          }
        }
      e => raise e
    }
  }
  let (realcalc_conv_1, thm_eval_1, raw_eval_1, thm_wrap_1) = (
    realcalc_conv, thm_eval, raw_eval, thm_wrap,
  )
  realcalc_conv_c.set(realcalc_conv_1)
  thm_eval_c.set(thm_eval_1)
  raw_eval_c.set(raw_eval_1)
  thm_wrap_c.set(thm_wrap_1)
}

///|
/// `REALCALC_PRECONV`
pub fn[TA] realcalc_preconv(
  x2292 : (TA) -> @kernel.Thm raise,
  x2293 : TA,
) -> (
  (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
  (Ref[(@num.Num, @kernel.Thm)], (@num.Num) -> @kernel.Thm raise),
) raise {
  let conv = x2292
  let tm = x2293
  let th = conv(tm)
  let (rfn, tfn) = realcalc_conv(@kernel.rand(@kernel.concl(th)))
  (
    rfn,
    thm_wrap(fn(x2294 : @num.Num) -> @kernel.Thm raise {
      let n = x2294
      let th1 = thm_eval(tfn)(n)
      @simp.gen_rewrite_rule(
        fn(
          x2302 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x2295 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2296 = @equal.land_conv(x2295)
            fn(x2297 : @kernel.Term) -> @kernel.Thm raise { s2296(x2297) }
          })(
            ((x2301 : (@kernel.Term) -> @kernel.Thm raise) => {
              @lib.funpow(
                3,
                fn(
                  x2298 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s2299 = @equal.rand_conv(x2298)
                  fn(x2300 : @kernel.Term) -> @kernel.Thm raise { s2299(x2300) }
                },
                x2301,
              )
            })(x2302),
          )
        },
        @list.List([@equal.sym(th)]),
      )(th1)
    }),
  )
}

///|
/// REALCALC_LT
fn step_59() -> Unit raise {
  let t2310 = @tactics.then_tac(
    @tactics.pop_assum_list(fn(
      x2309 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x2305 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2306 = @tactics.mp_tac(x2305)
        fn(
          x2307 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2306(x2307)
        }
      })(
        ((x2308 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x2308))(
          x2309,
        ),
      )
    }),
    @calc_rat.real_arith_tac,
  )
  let t2311 = @list.List([
    @simp.simp_tac(
      @list.List([
        @analysis.real_lt_lmul_eq(),
        @real.real_pow_lt(),
        @real.real_of_num_lt(),
        @calc_num.arith(),
      ]),
    ),
    t2310,
  ])
  let t2304 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * (x : Real) < pow(real_of_num(2), n) * (y : Real)"),
  )
  let t2303 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2312 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2303),
        t2304,
      ),
      @tactics.conj_tac,
    ),
    t2311,
  )
  realcalc_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) && abs((b : Real) - pow(real_of_num(2), n) * (y : Real)) < real_of_num(1) → real_of_num(2) <= abs(a - b) → (x < y) == (a < b)"),
      t2312,
    ),
  )
}

///|
let realcalc_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_LT")

///|
/// `REALCALC_LT`
pub fn realcalc_lt() -> @kernel.Thm {
  realcalc_lt_c.get()
}

///|
/// REALCALC_LE
fn step_60() -> Unit raise {
  let t2320 = @tactics.then_tac(
    @tactics.pop_assum_list(fn(
      x2319 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x2315 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2316 = @tactics.mp_tac(x2315)
        fn(
          x2317 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2316(x2317)
        }
      })(
        ((x2318 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x2318))(
          x2319,
        ),
      )
    }),
    @calc_rat.real_arith_tac,
  )
  let t2321 = @list.List([
    @simp.simp_tac(
      @list.List([
        @real.real_le_lmul_eq(),
        @real.real_pow_lt(),
        @real.real_of_num_lt(),
        @calc_num.arith(),
      ]),
    ),
    t2320,
  ])
  let t2314 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * (x : Real) <= pow(real_of_num(2), n) * (y : Real)"),
  )
  let t2313 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2322 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2313),
        t2314,
      ),
      @tactics.conj_tac,
    ),
    t2321,
  )
  realcalc_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) && abs((b : Real) - pow(real_of_num(2), n) * (y : Real)) < real_of_num(1) → real_of_num(2) <= abs(a - b) → (x <= y) == (a <= b)"),
      t2322,
    ),
  )
}

///|
let realcalc_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_LE")

///|
/// `REALCALC_LE`
pub fn realcalc_le() -> @kernel.Thm {
  realcalc_le_c.get()
}

///|
/// REALCALC_GT
fn step_61() -> Unit raise {
  let t2323 = @simp.rewrite_tac(@list.List([@realax.real_gt(), realcalc_lt()]))
  let t2324 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([@theorems.conj_sym(), @real.real_abs_sub()]),
    ),
    t2323,
  )
  realcalc_gt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) && abs((b : Real) - pow(real_of_num(2), n) * (y : Real)) < real_of_num(1) → real_of_num(2) <= abs(a - b) → (x > y) == (a > b)"),
      t2324,
    ),
  )
}

///|
let realcalc_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_GT")

///|
/// `REALCALC_GT`
pub fn realcalc_gt() -> @kernel.Thm {
  realcalc_gt_c.get()
}

///|
/// REALCALC_GE
fn step_62() -> Unit raise {
  let t2325 = @simp.rewrite_tac(@list.List([@realax.real_ge(), realcalc_le()]))
  let t2326 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([@theorems.conj_sym(), @real.real_abs_sub()]),
    ),
    t2325,
  )
  realcalc_ge_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) && abs((b : Real) - pow(real_of_num(2), n) * (y : Real)) < real_of_num(1) → real_of_num(2) <= abs(a - b) → (x >= y) == (a >= b)"),
      t2326,
    ),
  )
}

///|
let realcalc_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_GE")

///|
/// `REALCALC_GE`
pub fn realcalc_ge() -> @kernel.Thm {
  realcalc_ge_c.get()
}

///|
/// REALCALC_EQ
fn step_63() -> Unit raise {
  let t2327 = @simp.asm_rewrite_tac(@list.List([]))
  let t2328 = @tactics.then_tac(
    @tactics.then_tac(
      @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (y : Real)")),
      t2327,
    ),
    @calc_rat.real_arith_tac,
  )
  realcalc_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("abs((a : Real) - pow(real_of_num(2), (n : Num)) * (x : Real)) < real_of_num(1) && abs((b : Real) - pow(real_of_num(2), n) * (y : Real)) < real_of_num(1) → real_of_num(2) <= abs(a - b) → (x == y) == false"),
      t2328,
    ),
  )
}

///|
let realcalc_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALCALC_EQ")

///|
/// `REALCALC_EQ`
pub fn realcalc_eq() -> @kernel.Thm {
  realcalc_eq_c.get()
}

///|
/// realcalc_rel_conv
fn step_64() -> Unit raise {
  let t2339 = (
    @term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)"),
    fn(x2337 : @num.Num) -> ((@num.Num) -> Bool raise) raise {
      fn(x2338 : @num.Num) -> Bool raise { @num.eq_num(x2337, x2338) }
    },
  )
  let t2340 = (
    @term_syntax.parse_term("real_ge"),
    fn(x2335 : @num.Num) -> ((@num.Num) -> Bool raise) raise {
      fn(x2336 : @num.Num) -> Bool raise { @num.ge_num(x2335, x2336) }
    },
  )
  let t2341 = (
    @term_syntax.parse_term("real_gt"),
    fn(x2333 : @num.Num) -> ((@num.Num) -> Bool raise) raise {
      fn(x2334 : @num.Num) -> Bool raise { @num.gt_num(x2333, x2334) }
    },
  )
  let t2342 = (
    @term_syntax.parse_term("real_le"),
    fn(x2331 : @num.Num) -> ((@num.Num) -> Bool raise) raise {
      fn(x2332 : @num.Num) -> Bool raise { @num.le_num(x2331, x2332) }
    },
  )
  let pops = @list.List([
    (
      @term_syntax.parse_term("real_lt"),
      fn(x2329 : @num.Num) -> ((@num.Num) -> Bool raise) raise {
        fn(x2330 : @num.Num) -> Bool raise { @num.lt_num(x2329, x2330) }
      },
    ),
    t2342,
    t2341,
    t2340,
    t2339,
  ])
  fn find_n(
    x2343 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    x2344 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    x2345 : @num.Num,
  ) -> @num.Num raise {
    let rfn1 = x2343
    let rfn2 = x2344
    let n = x2345
    if @num.gt_num(n, @num.num_of_int64(1000L)) {
      raise Failure("realcalc_rel_conv: too close to discriminate")
    } else {
      let t2347 = @num.num_of_int64(4L)
      let t2346 = raw_eval(rfn2)(n)
      if @num.ge_num(
          @num.abs_num(@num.sub_num(raw_eval(rfn1)(n), t2346)),
          t2347,
        ) {
        n
      } else {
        find_n(rfn1, rfn2, @num.add_num(n, @num.num_of_int64(1L)))
      }
    }
  }
  realcalc_rel_conv_c.set(fn(x2348 : @kernel.Term) -> Bool raise {
    let tm = x2348
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, l) = @kernel.dest_comb(lop)
    let pop : (@num.Num) -> ((@num.Num) -> Bool raise) raise = @lib.assoc(
      op, pops,
    ) catch {
      Failure(_) => raise Failure("realcalc_rel_conv: unknown operator")
      e => raise e
    }
    let (rfn1_1, tfn1) = realcalc_conv(l)
    let (rfn2_1, tfn2) = realcalc_conv(r)
    let n_1 = find_n(rfn1_1, rfn2_1, @num.num_of_int64(1L))
    let t2349 = raw_eval(rfn2_1)(n_1)
    pop(raw_eval(rfn1_1)(n_1))(t2349)
  })
}

///|
let realcalc_rel_conv_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new(
  "realcalc_rel_conv",
)

///|
/// `realcalc_rel_conv`
pub fn realcalc_rel_conv(x : @kernel.Term) -> Bool raise {
  realcalc_rel_conv_c.get()(x)
}

///|
/// REALCALC_REL_CONV
fn step_65() -> Unit raise {
  let t2350 = (@term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)"), realcalc_eq())
  let t2351 = (@term_syntax.parse_term("real_ge"), realcalc_ge())
  let t2352 = (@term_syntax.parse_term("real_gt"), realcalc_gt())
  let t2353 = (@term_syntax.parse_term("real_le"), realcalc_le())
  let pths = @list.List([
    (@term_syntax.parse_term("real_lt"), realcalc_lt()),
    t2353,
    t2352,
    t2351,
    t2350,
  ])
  fn find_n(
    x2354 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    x2355 : (Ref[(@num.Num, @num.Num)], (@num.Num) -> @num.Num raise),
    x2356 : @num.Num,
  ) -> @num.Num raise {
    let rfn1 = x2354
    let rfn2 = x2355
    let n = x2356
    if @num.gt_num(n, @num.num_of_int64(1000L)) {
      raise Failure("realcalc_rel_conv: too close to discriminate")
    } else {
      let t2358 = @num.num_of_int64(4L)
      let t2357 = raw_eval(rfn2)(n)
      if @num.ge_num(
          @num.abs_num(@num.sub_num(raw_eval(rfn1)(n), t2357)),
          t2358,
        ) {
        n
      } else {
        find_n(rfn1, rfn2, @num.add_num(n, @num.num_of_int64(1L)))
      }
    }
  }
  realcalc_rel_conv_v1_c.set(fn(x2359 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2359
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, l) = @kernel.dest_comb(lop)
    let pth = @lib.assoc(op, pths) catch {
      Failure(_) => raise Failure("realcalc_rel_conv: unknown operator")
      e => raise e
    }
    let (rfn1_1, tfn1) = realcalc_conv(l)
    let (rfn2_1, tfn2) = realcalc_conv(r)
    let n_1 = find_n(rfn1_1, rfn2_1, @num.num_of_int64(1L))
    let th1 = thm_eval(tfn1)(n_1)
    let th2 = thm_eval(tfn2)(n_1)
    let t2360 = @bool.conj(th1, th2)
    let th3 = @drule.match_mp(pth)(t2360)
    let th4 = @bool.mp(
      th3,
      @bool.eqt_elim(
        @calc_int.real_int_reduce_conv(@equal.lhand(@kernel.concl(th3))),
      ),
    )
    @equal.conv_rule(@equal.rand_conv(@calc_rat.real_rat_reduce_conv), th4)
  })
}

///|
let realcalc_rel_conv_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REALCALC_REL_CONV",
)

///|
/// `REALCALC_REL_CONV`
pub fn realcalc_rel_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  realcalc_rel_conv_v1_c.get()(x)
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
}
