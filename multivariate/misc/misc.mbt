// Translated from upstream Multivariate/misc.ml; edit this file directly.

///|
/// Multivariate/misc.ml:10
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// `ASSERT_TAC`
pub fn assert_tac(x1 : @kernel.Term) -> @tactics.Tactic raise {
  let tm = x1
  @tactics.subgoal_then(tm, @tactics.strip_assume_tac)
}

///|
/// `EQ_TRANS_TAC`
pub fn eq_trans_tac(x3 : @kernel.Term) -> @tactics.Tactic raise {
  let tm = x3
  let t5 = @tactics.exists_tac(tm)
  @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t5),
    @tactics.conj_tac,
  )
}

///|
/// FORALL_DIFF
fn step_2() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([@sets.compl_compl()]))
  forall_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(UNIV, s))) == (∀ s : (A) -> Bool, P(s))"),
      t6,
    ),
  )
}

///|
let forall_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_DIFF")

///|
/// `FORALL_DIFF`
pub fn forall_diff() -> @kernel.Thm {
  forall_diff_c.get()
}

///|
/// EXISTS_DIFF
fn step_3() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([@sets.compl_compl()]))
  exists_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(UNIV, s))) == (∃ s : (A) -> Bool, P(s))"),
      t7,
    ),
  )
}

///|
let exists_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_DIFF")

///|
/// `EXISTS_DIFF`
pub fn exists_diff() -> @kernel.Thm {
  exists_diff_c.get()
}

///|
/// FORALL_DIFF_ALT
fn step_4() -> Unit raise {
  let t18 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t17 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t16 = @simp.rewrite_tac(@list.List([@sets.subset_diff()]))
  let t12 = @term_syntax.parse_term("DIFF((u : (A) -> Bool), (s : (A) -> Bool))")
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
  let t8 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t19 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
                  @tactics.disch_tac,
                ),
                t8,
              ),
              @tactics.disch_tac,
            ),
            t15,
          ),
          t16,
        ),
        t17,
      ),
      @tactics.ap_term_tac,
    ),
    t18,
  )
  forall_diff_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, (∀ s : (A) -> Bool, SUBSET(s, u) → (P : ((A) -> Bool) -> Bool)(DIFF(u, s))) == (∀ s : (A) -> Bool, SUBSET(s, u) → P(s))"),
      t19,
    ),
  )
}

///|
let forall_diff_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_DIFF_ALT",
)

///|
/// `FORALL_DIFF_ALT`
pub fn forall_diff_alt() -> @kernel.Thm {
  forall_diff_alt_c.get()
}

///|
/// FORALL_DIFF_GEN
fn step_5() -> Unit raise {
  let t31 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t30 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t29 = @simp.rewrite_tac(@list.List([@sets.subset_diff()]))
  let t25 = @term_syntax.parse_term("DIFF((u : (A) -> Bool), (s : (A) -> Bool))")
  let t28 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s23 = @tactics.mp_tac(x22)
      fn(
        x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s23(x24)
      }
    })(((x26 : @kernel.Thm) => @bool.spec(t25, x26))(x27))
  })
  let t21 = @tactics.try_tac(@tactics.disch_tac)
  let t20 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t32 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
                  @tactics.disch_tac,
                ),
                t20,
              ),
              t21,
            ),
            t28,
          ),
          t29,
        ),
        t30,
      ),
      @tactics.ap_term_tac,
    ),
    t31,
  )
  forall_diff_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, (∀ s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(u, s))) == (∀ s : (A) -> Bool, SUBSET(s, u) → P(s))"),
      t32,
    ),
  )
}

///|
let forall_diff_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_DIFF_GEN",
)

///|
/// `FORALL_DIFF_GEN`
pub fn forall_diff_gen() -> @kernel.Thm {
  forall_diff_gen_c.get()
}

///|
/// GE_REFL
fn step_6() -> Unit raise {
  let t33 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_refl()]))
  ge_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n >= n"), t33))
}

///|
let ge_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GE_REFL")

///|
/// `GE_REFL`
pub fn ge_refl() -> @kernel.Thm {
  ge_refl_c.get()
}

///|
/// FORALL_SUC
fn step_7() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([@nums.num_cases(), @nums.not_suc()]))
  forall_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, !(n == 0) → (P : (Num) -> Bool)(n)) == (∀ n : Num, P(SUC(n)))"),
      t34,
    ),
  )
}

///|
let forall_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_SUC")

///|
/// `FORALL_SUC`
pub fn forall_suc() -> @kernel.Thm {
  forall_suc_c.get()
}

///|
/// SEQ_MONO_LEMMA
fn step_8() -> Unit raise {
  let t35 = @meson.meson_tac(
    @list.List([@arith.ge(), @realarith.real_lte_trans()]),
  )
  seq_mono_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : (Num) -> Real, ∀ e : (Num) -> Real, (∀ n : Num, n >= (m : Num) → d(n) < e(n)) && (∀ n : Num, n >= m → e(n) <= e(m)) → (∀ n : Num, n >= m → d(n) < e(m))"),
      t35,
    ),
  )
}

///|
let seq_mono_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQ_MONO_LEMMA")

///|
/// `SEQ_MONO_LEMMA`
pub fn seq_mono_lemma() -> @kernel.Thm {
  seq_mono_lemma_c.get()
}

///|
/// REAL_HALF
fn step_9() -> Unit raise {
  real_half_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ e : Real, (real_of_num(0) < e / real_of_num(2)) == (real_of_num(0) < e)) && (∀ e : Real, e / real_of_num(2) + e / real_of_num(2) == e) && (∀ e : Real, real_of_num(2) * (e / real_of_num(2)) == e)"),
      @calc_rat.real_arith_tac,
    ),
  )
}

///|
let real_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_HALF")

///|
/// `REAL_HALF`
pub fn real_half() -> @kernel.Thm {
  real_half_c.get()
}

///|
/// ABS_SQUARE_LT_1
fn step_10() -> Unit raise {
  let t36 = @simp.rewrite_tac(@list.List([@real.real_lt_square_abs()]))
  let t37 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([@equal.gsym(@calc_int.real_abs_num())]),
      ),
      t36,
    ),
    @calc_rat.real_arith_tac,
  )
  abs_square_lt_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (pow(x, 2) < real_of_num(1)) == (abs(x) < real_of_num(1))"), t37),
  )
}

///|
let abs_square_lt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ABS_SQUARE_LT_1",
)

///|
/// `ABS_SQUARE_LT_1`
pub fn abs_square_lt_1() -> @kernel.Thm {
  abs_square_lt_1_c.get()
}

///|
/// ABS_SQUARE_LE_1
fn step_11() -> Unit raise {
  let t38 = @simp.rewrite_tac(
    @list.List([
      @real.real_lt_square_abs(),
      @equal.gsym(@realarith.real_not_lt()),
    ]),
  )
  let t39 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([@equal.gsym(@calc_int.real_abs_num())]),
      ),
      t38,
    ),
    @calc_rat.real_arith_tac,
  )
  abs_square_le_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (pow(x, 2) <= real_of_num(1)) == (abs(x) <= real_of_num(1))"),
      t39,
    ),
  )
}

///|
let abs_square_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ABS_SQUARE_LE_1",
)

///|
/// `ABS_SQUARE_LE_1`
pub fn abs_square_le_1() -> @kernel.Thm {
  abs_square_le_1_c.get()
}

///|
/// ABS_SQUARE_EQ_1
fn step_12() -> Unit raise {
  let t40 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @calc_rat.real_ring(
          @term_syntax.parse_term("(pow((x : Real), 2) == real_of_num(1)) == (x == real_of_num(1) || x == -real_of_num(1))"),
        ),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  abs_square_eq_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (pow(x, 2) == real_of_num(1)) == (abs(x) == real_of_num(1))"), t40),
  )
}

///|
let abs_square_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ABS_SQUARE_EQ_1",
)

///|
/// `ABS_SQUARE_EQ_1`
pub fn abs_square_eq_1() -> @kernel.Thm {
  abs_square_eq_1_c.get()
}

///|
/// UPPER_BOUND_FINITE_SET
fn step_13() -> Unit raise {
  let t42 = @metis.metis_tac(
    @list.List([@arith.le_cases(), @arith.le_refl(), @arith.le_trans()]),
  )
  let t41 = @simp.rewrite_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty()]),
  )
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t41,
    ),
    t42,
  )
  upper_bound_finite_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → (∃ a : Num, ∀ x : A, IN(x, s) → f(x) <= a)"),
      t43,
    ),
  )
}

///|
let upper_bound_finite_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UPPER_BOUND_FINITE_SET",
)

///|
/// `UPPER_BOUND_FINITE_SET`
pub fn upper_bound_finite_set() -> @kernel.Thm {
  upper_bound_finite_set_c.get()
}

///|
/// UPPER_BOUND_FINITE_SET_REAL
fn step_14() -> Unit raise {
  let t45 = @metis.metis_tac(
    @list.List([
      @realax.real_le_total(),
      @realax.real_le_refl(),
      @realax.real_le_trans(),
    ]),
  )
  let t44 = @simp.rewrite_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty()]),
  )
  let t46 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t44,
    ),
    t45,
  )
  upper_bound_finite_set_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → (∃ a : Real, ∀ x : A, IN(x, s) → f(x) <= a)"),
      t46,
    ),
  )
}

///|
let upper_bound_finite_set_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UPPER_BOUND_FINITE_SET_REAL",
)

///|
/// `UPPER_BOUND_FINITE_SET_REAL`
pub fn upper_bound_finite_set_real() -> @kernel.Thm {
  upper_bound_finite_set_real_c.get()
}

///|
/// LOWER_BOUND_FINITE_SET
fn step_15() -> Unit raise {
  let t48 = @metis.metis_tac(
    @list.List([@arith.le_cases(), @arith.le_refl(), @arith.le_trans()]),
  )
  let t47 = @simp.rewrite_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty()]),
  )
  let t49 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t47,
    ),
    t48,
  )
  lower_bound_finite_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → (∃ a : Num, ∀ x : A, IN(x, s) → a <= f(x))"),
      t49,
    ),
  )
}

///|
let lower_bound_finite_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LOWER_BOUND_FINITE_SET",
)

///|
/// `LOWER_BOUND_FINITE_SET`
pub fn lower_bound_finite_set() -> @kernel.Thm {
  lower_bound_finite_set_c.get()
}

///|
/// LOWER_BOUND_FINITE_SET_REAL
fn step_16() -> Unit raise {
  let t51 = @metis.metis_tac(
    @list.List([
      @realax.real_le_total(),
      @realax.real_le_refl(),
      @realax.real_le_trans(),
    ]),
  )
  let t50 = @simp.rewrite_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty()]),
  )
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t50,
    ),
    t51,
  )
  lower_bound_finite_set_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → (∃ a : Real, ∀ x : A, IN(x, s) → a <= f(x))"),
      t52,
    ),
  )
}

///|
let lower_bound_finite_set_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LOWER_BOUND_FINITE_SET_REAL",
)

///|
/// `LOWER_BOUND_FINITE_SET_REAL`
pub fn lower_bound_finite_set_real() -> @kernel.Thm {
  lower_bound_finite_set_real_c.get()
}

///|
/// REAL_CONVEX_SUM_BOUND_LE
fn step_17() -> Unit raise {
  let t88 = @simp.asm_rewrite_tac(
    @list.List([
      @iterate.sum_lmul(),
      @realarith.real_mul_rid(),
      @realax.real_le_refl(),
    ]),
  )
  let t87 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul()]))
  let t89 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le()), t87),
    t88,
  ])
  let t85 = @term_syntax.parse_term("sum((t : (A) -> Bool), (i : A) => (d : Real) * (x : (A) -> Real)(i))")
  let t86 = @tactics.trans_tac(@realax.real_le_trans())(t85)
  let t84 = @simp.asm_simp_tac(
    @list.List([
      @real.real_abs_mul(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")),
    ]),
  )
  let t83 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @realax.real_le_trans(),
    ),
  )
  let t82 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_sub_rdistrib())]),
  )
  let t76 = @drule.part_match(
    fn(x75 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x75))
    },
    @iterate.sum_abs(),
  )
  let t71 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.sum_sub())]))
  let t70 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t69 = @tactics.first_assum(fn(
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
    (fn(
      x65 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s66 = @tactics.subst1_tac(x65)
      fn(
        x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s66(x67)
      }
    })(@equal.sym(x68))
  })
  let t64 = @simp.once_rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) == a - b * real_of_num(1)"))]),
  )
  let t63 = @simp.rewrite_tac(
    @list.List([
      @iterate.sum_restrict_set(),
      @meson.meson(
        @list.List([@calc_int.real_mul_lzero()]),
        @term_syntax.parse_term("(if !((a : Real) == real_of_num(0)) { a * (x : Real) } else { real_of_num(0) }) == a * x"),
      ),
    ]),
  )
  let t62 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t61 = @tactics.subgoal_then(
    @term_syntax.parse_term("(∀ i : A, IN(i, (t : (A) -> Bool)) → real_of_num(0) <= (x : (A) -> Real)(i)) && (∀ i : A, IN(i, t) → abs((a : (A) -> Real)(i) - (b : Real)) <= (d : Real))"),
    @tactics.strip_assume_tac,
  )
  let t60 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t59 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t58 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (A) -> Bool))"))
  let t57 = @simp.abbrev_tac(
    @term_syntax.parse_term("(t : (A) -> Bool) == {(i : A) | IN(i, (s : (A) -> Bool)) && !((x : (A) -> Real)(i) == real_of_num(0))}"),
  )
  let t56 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !((P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x))} == {(x : _) | IN(x, {(y : _) | IN(y, s) && !Q(y)}) && !P(x)}"),
      ),
    ]),
  )
  let t55 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@iterate.sum()),
      @iterate.neutral_real_add(),
      @iterate.support(),
      @realarith.real_entire(),
    ]),
  )
  let t54 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t53 = @simp.rewrite_tac(@list.List([@iterate.sum()]))
  let t90 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
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
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t53,
                                              ),
                                              t54,
                                            ),
                                            t55,
                                          ),
                                          t56,
                                        ),
                                        t57,
                                      ),
                                      t58,
                                    ),
                                    t59,
                                  ),
                                  t60,
                                ),
                                @tactics.strip_tac,
                              ),
                              t61,
                            ),
                            t62,
                          ),
                          t63,
                        ),
                        t64,
                      ),
                      t69,
                    ),
                    t70,
                  ),
                  t71,
                ),
                fn(
                  x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        x77 : @kernel.Term,
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
                          x72 : @kernel.Thm,
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
                          let s73 = @tactics.mp_tac(x72)
                          fn(
                            x74 : (
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
                            s73(x74)
                          }
                        })(t76(x77))
                      })(@equal.lhand(x78))
                    })(
                      (fn(
                        x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> @kernel.Term raise {
                        x79.1
                      })(x80),
                    )
                  })(x81)(x81)
                },
              ),
              t82,
            ),
            t83,
          ),
          t84,
        ),
        t86,
      ),
      @tactics.conj_tac,
    ),
    t89,
  )
  real_convex_sum_bound_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ d : Real, ∀ a : (A) -> Real, ∀ b : Real, ∀ x : (A) -> Real, (∀ i : A, IN(i, s) → real_of_num(0) <= x(i)) && sum(s, x) == real_of_num(1) && (∀ i : A, IN(i, s) → abs(a(i) - b) <= d) → abs(sum(s, (i : A) => a(i) * x(i)) - b) <= d"),
      t90,
    ),
  )
}

///|
let real_convex_sum_bound_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_SUM_BOUND_LE",
)

///|
/// `REAL_CONVEX_SUM_BOUND_LE`
pub fn real_convex_sum_bound_le() -> @kernel.Thm {
  real_convex_sum_bound_le_c.get()
}

///|
/// REAL_CONVEX_SUM_BOUND_LT
fn step_18() -> Unit raise {
  let t133 = @simp.asm_rewrite_tac(
    @list.List([
      @iterate.sum_lmul(),
      @realarith.real_mul_rid(),
      @realax.real_le_refl(),
    ]),
  )
  let t132 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@iterate.sum_clauses()])),
  )
  let t131 = @tactics.disch_then(fn(
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
    let s129 = @tactics.subst_all_tac(x128)
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
  })
  let t127 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul_eq()]))
  let t134 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_lt_all()), t127),
          t131,
        ),
        t132,
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t133,
  ])
  let t125 = @term_syntax.parse_term("sum((t : (A) -> Bool), (i : A) => (d : Real) * (x : (A) -> Real)(i))")
  let t126 = @tactics.trans_tac(@realarith.real_lte_trans())(t125)
  let t124 = @simp.asm_simp_tac(
    @list.List([
      @real.real_abs_mul(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")),
    ]),
  )
  let t123 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @realarith.real_let_trans(),
    ),
  )
  let t122 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@real.real_sub_rdistrib())]),
  )
  let t116 = @drule.part_match(
    fn(x115 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x115))
    },
    @iterate.sum_abs(),
  )
  let t111 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.sum_sub())]))
  let t110 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t109 = @tactics.first_assum(fn(
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
      x105 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s106 = @tactics.subst1_tac(x105)
      fn(
        x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s106(x107)
      }
    })(@equal.sym(x108))
  })
  let t104 = @simp.once_rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) == a - b * real_of_num(1)"))]),
  )
  let t103 = @simp.rewrite_tac(
    @list.List([
      @iterate.sum_restrict_set(),
      @meson.meson(
        @list.List([@calc_int.real_mul_lzero()]),
        @term_syntax.parse_term("(if !((a : Real) == real_of_num(0)) { a * (x : Real) } else { real_of_num(0) }) == a * x"),
      ),
    ]),
  )
  let t101 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t100 = @simp.simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))"),
      ),
    ]),
  )
  let t102 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("t"), t100), t101),
    @tactics.all_tac,
  ])
  let t99 = @tactics.subgoal_then(
    @term_syntax.parse_term("(∀ i : A, IN(i, (t : (A) -> Bool)) → real_of_num(0) < (x : (A) -> Real)(i)) && (∀ i : A, IN(i, t) → abs((a : (A) -> Real)(i) - (b : Real)) < (d : Real))"),
    @tactics.strip_assume_tac,
  )
  let t98 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t97 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t96 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (A) -> Bool))"))
  let t95 = @simp.abbrev_tac(
    @term_syntax.parse_term("(t : (A) -> Bool) == {(i : A) | IN(i, (s : (A) -> Bool)) && !((x : (A) -> Real)(i) == real_of_num(0))}"),
  )
  let t94 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !((P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x))} == {(x : _) | IN(x, {(y : _) | IN(y, s) && !Q(y)}) && !P(x)}"),
      ),
    ]),
  )
  let t93 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@iterate.sum()),
      @iterate.neutral_real_add(),
      @iterate.support(),
      @realarith.real_entire(),
    ]),
  )
  let t92 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t91 = @simp.rewrite_tac(@list.List([@iterate.sum()]))
  let t135 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
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
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t91,
                                              ),
                                              t92,
                                            ),
                                            t93,
                                          ),
                                          t94,
                                        ),
                                        t95,
                                      ),
                                      t96,
                                    ),
                                    t97,
                                  ),
                                  t98,
                                ),
                                @tactics.strip_tac,
                              ),
                              t99,
                            ),
                            t102,
                          ),
                          t103,
                        ),
                        t104,
                      ),
                      t109,
                    ),
                    t110,
                  ),
                  t111,
                ),
                fn(
                  x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      x118 : @kernel.Term,
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
                        x117 : @kernel.Term,
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
                          x112 : @kernel.Thm,
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
                          let s113 = @tactics.mp_tac(x112)
                          fn(
                            x114 : (
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
                            s113(x114)
                          }
                        })(t116(x117))
                      })(@equal.lhand(x118))
                    })(
                      (fn(
                        x119 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> @kernel.Term raise {
                        x119.1
                      })(x120),
                    )
                  })(x121)(x121)
                },
              ),
              t122,
            ),
            t123,
          ),
          t124,
        ),
        t126,
      ),
      @tactics.conj_tac,
    ),
    t134,
  )
  real_convex_sum_bound_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ d : Real, ∀ a : (A) -> Real, ∀ b : Real, ∀ x : (A) -> Real, (∀ i : A, IN(i, s) → real_of_num(0) <= x(i)) && sum(s, x) == real_of_num(1) && (∀ i : A, IN(i, s) → abs(a(i) - b) < d) → abs(sum(s, (i : A) => a(i) * x(i)) - b) < d"),
      t135,
    ),
  )
}

///|
let real_convex_sum_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_SUM_BOUND_LT",
)

///|
/// `REAL_CONVEX_SUM_BOUND_LT`
pub fn real_convex_sum_bound_lt() -> @kernel.Thm {
  real_convex_sum_bound_lt_c.get()
}

///|
/// APPROACHABLE_LT_LE
fn step_19() -> Unit raise {
  let t136 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @real.real_le_rdiv_eq(),
        @real.real_of_num_lt(),
        @calc_num.arith(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (d : Real) → (x : Real) <= d / real_of_num(2) → x < d"),
    t136,
  )
  let t137 = @meson.meson_tac(
    @list.List([@realarith.real_lt_imp_le(), lemma, real_half()]),
  )
  approachable_lt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (_) -> Bool, ∀ f : (_) -> Real, (∃ d : Real, real_of_num(0) < d && (∀ x : _, f(x) < d → P(x))) == (∃ d : Real, real_of_num(0) < d && (∀ x : _, f(x) <= d → P(x)))"),
      t137,
    ),
  )
}

///|
let approachable_lt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "APPROACHABLE_LT_LE",
)

///|
/// `APPROACHABLE_LT_LE`
pub fn approachable_lt_le() -> @kernel.Thm {
  approachable_lt_le_c.get()
}

///|
/// REAL_LE_BETWEEN
fn step_20() -> Unit raise {
  let t138 = @meson.meson_tac(
    @list.List([@realax.real_le_trans(), @realax.real_le_refl()]),
  )
  real_le_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (a <= b) == (∃ x : Real, a <= x && x <= b)"),
      t138,
    ),
  )
}

///|
let real_le_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_BETWEEN",
)

///|
/// `REAL_LE_BETWEEN`
pub fn real_le_between() -> @kernel.Thm {
  real_le_between_c.get()
}

///|
/// REAL_LET_BETWEEN
fn step_21() -> Unit raise {
  let t139 = @meson.meson_tac(
    @list.List([@realax.real_le_refl(), @realarith.real_let_trans()]),
  )
  real_let_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (a < b) == (∃ x : Real, a <= x && x < b)"),
      t139,
    ),
  )
}

///|
let real_let_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LET_BETWEEN",
)

///|
/// `REAL_LET_BETWEEN`
pub fn real_let_between() -> @kernel.Thm {
  real_let_between_c.get()
}

///|
/// REAL_LTE_BETWEEN
fn step_22() -> Unit raise {
  let t140 = @meson.meson_tac(
    @list.List([@realax.real_le_refl(), @realarith.real_lte_trans()]),
  )
  real_lte_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (a < b) == (∃ x : Real, a < x && x <= b)"),
      t140,
    ),
  )
}

///|
let real_lte_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LTE_BETWEEN",
)

///|
/// `REAL_LTE_BETWEEN`
pub fn real_lte_between() -> @kernel.Thm {
  real_lte_between_c.get()
}

///|
/// REAL_LT_BETWEEN
fn step_23() -> Unit raise {
  let t147 = @tactics.pop_assum(fn(
    x144 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s145 = @tactics.mp_tac(x144)
    fn(
      x146 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s145(x146)
    }
  })
  let t143 = @simp.simp_tac(
    @list.List([
      @real.real_lt_rdiv_eq(),
      @real.real_lt_ldiv_eq(),
      @real.real_of_num_lt(),
      @calc_num.arith(),
    ]),
  )
  let t142 = @tactics.exists_tac(@term_syntax.parse_term("((a : Real) + (b : Real)) / real_of_num(2)"))
  let t141 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@realarith.real_lt_trans()])),
  ])
  let t148 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              t141,
            ),
            @tactics.disch_tac,
          ),
          t142,
        ),
        t143,
      ),
      t147,
    ),
    @calc_rat.real_arith_tac,
  )
  real_lt_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (a < b) == (∃ x : Real, a < x && x < b)"),
      t148,
    ),
  )
}

///|
let real_lt_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_BETWEEN",
)

///|
/// `REAL_LT_BETWEEN`
pub fn real_lt_between() -> @kernel.Thm {
  real_lt_between_c.get()
}

///|
/// REAL_LT_BETWEEN_GEN
fn step_24() -> Unit raise {
  let t159 = @meson.meson_tac(@list.List([]))
  let t158 = @simp.asm_simp_tac(
    @list.List([@sets.real_sup_lt_finite(), @sets.real_lt_inf_finite()]),
  )
  let t157 = @simp.rewrite_tac(@list.List([@equal.gsym(real_lt_between())]))
  let t156 = @list.List([
    @meson.meson_tac(
      @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(t : Real) < t + real_of_num(1)"))]),
    ),
    @tactics.all_tac,
  ])
  let t155 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t154 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Real) -> Bool) == {}"))
  let t153 = @list.List([
    @meson.meson_tac(
      @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) - real_of_num(1) < s"))]),
    ),
    @tactics.all_tac,
  ])
  let t152 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t151 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (Real) -> Bool) == {}"))
  let t150 = @simp.simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.real_lt_inf_finite(), @sets.not_in_empty()]),
        @term_syntax.parse_term("FINITE((t : (Real) -> Bool)) → (∀ b : Real, IN(b, t) → (x : Real) < b) == (t == {} || x < inf(t))"),
      ),
    ]),
  )
  let t149 = @simp.simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@sets.real_sup_lt_finite(), @sets.not_in_empty()]),
        @term_syntax.parse_term("FINITE((s : (Real) -> Bool)) → (∀ a : Real, IN(a, s) → a < (x : Real)) == (s == {} || sup(s) < x)"),
      ),
    ]),
  )
  let t160 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t149,
                        ),
                        t150,
                      ),
                      @tactics.strip_tac,
                    ),
                    t151,
                  ),
                  t152,
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
      ),
      t158,
    ),
    t159,
  )
  real_lt_between_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ t : (Real) -> Bool, FINITE(s) && FINITE(t) → (∃ x : Real, (∀ a : Real, IN(a, s) → a < x) && (∀ b : Real, IN(b, t) → x < b)) == (∀ a : Real, ∀ b : Real, IN(a, s) && IN(b, t) → a < b)"),
      t160,
    ),
  )
}

///|
let real_lt_between_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_BETWEEN_GEN",
)

///|
/// `REAL_LT_BETWEEN_GEN`
pub fn real_lt_between_gen() -> @kernel.Thm {
  real_lt_between_gen_c.get()
}

///|
/// TRIANGLE_LEMMA
fn step_25() -> Unit raise {
  let t173 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_le_mul(),
      @realarith.real_pow_2(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) * x + (y : Real) * y <= (x + y) * (x + y)) == (real_of_num(0) <= x * y)"),
      ),
    ]),
  )
  let t172 = @simp.asm_simp_tac(
    @list.List([
      @real.real_pow_lt2(),
      @realarith.real_le_add(),
      @calc_num.arith_eq(),
    ]),
  )
  let t171 = @tactics.exists_tac(@term_syntax.parse_term("pow((y : Real) + (z : Real), 2)"))
  let t170 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t169 = @simp.rewrite_tac(@list.List([@real.real_not_le()]))
  let t168 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t167 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s162 = @tactics.assume_tac(x161)
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
        },
        fn(
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
          let s165 = @tactics.mp_tac(x164)
          fn(
            x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s165(x166)
          }
        },
      ),
    ),
  )
  let t174 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t167),
                t168,
              ),
              t169,
            ),
            @tactics.disch_tac,
          ),
          t170,
        ),
        t171,
      ),
      t172,
    ),
    t173,
  )
  triangle_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= x && real_of_num(0) <= y && real_of_num(0) <= z && pow(x, 2) <= pow(y, 2) + pow(z, 2) → x <= y + z"),
      t174,
    ),
  )
}

///|
let triangle_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIANGLE_LEMMA")

///|
/// `TRIANGLE_LEMMA`
pub fn triangle_lemma() -> @kernel.Thm {
  triangle_lemma_c.get()
}

///|
/// LAMBDA_SKOLEM
fn step_26() -> Unit raise {
  let t182 = @simp.asm_rewrite_tac(@list.List([]))
  let t181 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => op_dollar((x : Cart[A, N]), i)"))
  let t179 = @term_syntax.parse_term("(x : Cart[A, N])")
  let t183 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then((x180 : @kernel.Thm) => {
        @tactics.x_choose_tac(t179, x180)
      }),
      t181,
    ),
    t182,
  )
  let t178 = @simp.asm_simp_tac(@list.List([@cart.lambda_beta()]))
  let t177 = @tactics.exists_tac(@term_syntax.parse_term("(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (x : (Num) -> A)(i))"))
  let t175 = @term_syntax.parse_term("(x : (Num) -> A)")
  let t184 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then((x176 : @kernel.Thm) => {
          @tactics.x_choose_tac(t175, x176)
        }),
        t177,
      ),
      t178,
    ),
    t183,
  ])
  let t185 = @tactics.thenl(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@class.right_imp_exists_thm(), @class.skolem_thm()]),
      ),
      @tactics.eq_tac,
    ),
    t184,
  )
  lambda_skolem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (∃ x : A, (P : (Num, A) -> Bool)(i, x))) == (∃ x : Cart[A, N], ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P(i, (op_dollar : (Cart[A, N], Num) -> A)(x, i)))"),
      t185,
    ),
  )
}

///|
let lambda_skolem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_SKOLEM")

///|
/// `LAMBDA_SKOLEM`
pub fn lambda_skolem() -> @kernel.Thm {
  lambda_skolem_c.get()
}

///|
/// EPSILON_DELTA_MINIMAL
fn step_27() -> Unit raise {
  let t220 = @simp.asm_simp_tac(@list.List([]))
  let t219 = @tactics.exists_tac(@term_syntax.parse_term("(d : (A) -> Real)((a : A))"))
  let t218 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t217 = @simp.asm_simp_tac(@list.List([]))
  let t221 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@realarith.real_le_lt()])),
            @tactics.strip_tac,
          ),
          t217,
        ),
        t218,
      ),
      t219,
    ),
    t220,
  )
  let t216 = @meson.asm_meson_tac(@list.List([@realax.real_le_refl()]))
  let t215 = @simp.rewrite_tac(
    @list.List([
      @sets.exists_in_image(),
      @sets.forall_in_image(),
      @sets.in_elim_thm(),
    ]),
  )
  let t222 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            @sets.real_lt_inf_finite(),
            @sets.real_inf_le_finite(),
            @sets.finite_image(),
            @sets.image_eq_empty(),
          ]),
        ),
        t215,
      ),
      t216,
    ),
    t221,
  ])
  let t214 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(0) < inf(IMAGE((d : (A) -> Real), {(x : A) | (Q : (A) -> Bool)(x)})) && inf(IMAGE(d, {(x : A) | Q(x)})) <= d((a : A))"),
    fn(
      x211 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s212 = @tactics.mp_tac(x211)
      fn(
        x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s212(x213)
      }
    },
  )
  let t210 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t209 = @simp.asm_simp_tac(
    @list.List([@sets.forall_in_image(), @sets.forall_in_gspec()]),
  )
  let t208 = @simp.asm_simp_tac(
    @list.List([
      @sets.real_lt_inf_finite(),
      @sets.finite_image(),
      @sets.image_eq_empty(),
    ]),
  )
  let t207 = @tactics.exists_tac(@term_syntax.parse_term("inf(IMAGE((d : (A) -> Real), {(x : A) | (Q : (A) -> Bool)(x)}))"))
  let t206 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : (A) -> Real)"))
  let t205 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t203 = @simp.gen_rewrite_rule(
    fn(
      x200 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s201 = @equal.binder_conv(x200)
      fn(x202 : @kernel.Term) -> @kernel.Thm raise { s201(x202) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t223 = @tactics.thenl(
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
                          x197 : @kernel.Thm,
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
                          let s198 = @tactics.mp_tac(x197)
                          fn(
                            x199 : (
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
                            s198(x199)
                          }
                        })(t203(x204))
                      }),
                      t205,
                    ),
                    t206,
                  ),
                  @tactics.disch_tac,
                ),
                t207,
              ),
              t208,
            ),
            t209,
          ),
          t210,
        ),
        @tactics.disch_tac,
      ),
      t214,
    ),
    t222,
  )
  let t196 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_01()]))
  let t195 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t194 = @simp.rewrite_tac(
    @list.List([@sets.not_in_empty(), @sets.in_elim_thm()]),
  )
  let t192 = @simp.gen_rewrite_rule(
    fn(
      x191 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x191
    },
    @list.List([@sets.extension()]),
  )
  let t224 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_x_assum(fn(
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
                x188 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s189 = @tactics.mp_tac(x188)
                fn(
                  x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s189(x190)
                }
              })(t192(x193))
            }),
            t194,
          ),
          @tactics.disch_tac,
        ),
        t195,
      ),
      t196,
    ),
    t223,
  ])
  let t187 = @class.asm_cases_tac(@term_syntax.parse_term("{(x : A) | (Q : (A) -> Bool)(x)} == {}"))
  let t186 = @tactics.repeat_tac(@tactics.strip_tac)
  let t225 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@theorems.imp_imp()])),
        t186,
      ),
      t187,
    ),
    t224,
  )
  epsilon_delta_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real, A) -> Bool, ∀ Q : (A) -> Bool, FINITE({(x : A) | Q(x)}) && (∀ d : Real, ∀ e : Real, ∀ x : A, Q(x) && real_of_num(0) < e && e < d → P(d, x) → P(e, x)) && (∀ x : A, Q(x) → (∃ d : Real, real_of_num(0) < d && P(d, x))) → (∃ d : Real, real_of_num(0) < d && (∀ x : A, Q(x) → P(d, x)))"),
      t225,
    ),
  )
}

///|
let epsilon_delta_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EPSILON_DELTA_MINIMAL",
)

///|
/// `EPSILON_DELTA_MINIMAL`
pub fn epsilon_delta_minimal() -> @kernel.Thm {
  epsilon_delta_minimal_c.get()
}

///|
/// HAS_SIZE_1_EXISTS
fn step_28() -> Unit raise {
  let t228 = @meson.meson_tac(@list.List([]))
  let t227 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing()]))
  let t226 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t229 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t226),
      t227,
    ),
    t228,
  )
  has_size_1_exists_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, HAS_SIZE(s, 1) == existsunique((x : _) => IN(x, s))"), t229),
  )
}

///|
let has_size_1_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_1_EXISTS",
)

///|
/// `HAS_SIZE_1_EXISTS`
pub fn has_size_1_exists() -> @kernel.Thm {
  has_size_1_exists_c.get()
}

///|
/// LINEAR_EQUATIONS_1_EQ
fn step_29() -> Unit raise {
  let t233 = @meson.meson_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t232 = @simp.asm_simp_tac(
    @list.List([
      @calc_rat.real_field(
        @term_syntax.parse_term("!((a : Real) == real_of_num(0)) → (a * (x : Real) == (b : Real)) == (x == b / a)"),
      ),
    ]),
  )
  let t231 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Real) == real_of_num(0)"))
  let t230 = @list.List([
    @tactics.conv_tac(@calc_rat.real_ring),
    @tactics.all_tac,
  ])
  let t234 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          t230,
        ),
        t231,
      ),
      t232,
    ),
    t233,
  )
  linear_equations_1_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (∃ x : Real, a * x == b) == (a == real_of_num(0) → b == real_of_num(0))"),
      t234,
    ),
  )
}

///|
let linear_equations_1_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LINEAR_EQUATIONS_1_EQ",
)

///|
/// `LINEAR_EQUATIONS_1_EQ`
pub fn linear_equations_1_eq() -> @kernel.Thm {
  linear_equations_1_eq_c.get()
}

///|
/// LINEAR_EQUATIONS_2_EQ
fn step_30() -> Unit raise {
  let t255 = @tactics.conv_tac(@calc_rat.real_ring)
  let t254 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x251 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s252 = @tactics.mp_tac(x251)
      fn(
        x253 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s252(x253)
      }
    }),
  )
  let t250 = @simp.rewrite_tac(@list.List([linear_equations_1_eq()]))
  let t249 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t248 = @simp.gen_rewrite_tac(
    fn(
      x247 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x247
    },
    @list.List([@theorems.swap_exists_thm()]),
  )
  let t246 = @simp.asm_simp_tac(
    @list.List([
      @calc_rat.real_field(
        @term_syntax.parse_term("!((a : Real) == real_of_num(0)) → (a * (x : Real) + (b : Real) * (y : Real) == (u : Real) && (c : Real) * x + (d : Real) * y == (v : Real)) == (x == (u - b * y) / a && (a * d - b * c) * y == a * v - c * u)"),
      ),
    ]),
  )
  let t242 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t241 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t243 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])),
      t241,
    ),
    t242,
  )
  let t244 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t240 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t245 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])),
      t240,
    ),
    t244,
    t243,
  ])
  let t239 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t238 = @list.List([
    @metis.asm_metis_tac(
      @list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid()]),
    ),
    @tactics.all_tac,
  ])
  let t237 = @simp.asm_rewrite_tac(@list.List([]))
  let t236 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0) && (v : Real) == real_of_num(0)"))
  let t235 = @list.List([
    @tactics.conv_tac(@calc_rat.real_ring),
    @tactics.all_tac,
  ])
  let t256 = @tactics.then_tac(
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
                            @tactics.then_tac(
                              @tactics.repeat_tac(@tactics.gen_tac),
                              @tactics.eq_tac,
                            ),
                            t235,
                          ),
                          t236,
                        ),
                        t237,
                      ),
                      t238,
                    ),
                    t239,
                  ),
                  @tactics.strip_tac,
                ),
                t245,
              ),
              t246,
            ),
            t248,
          ),
          t249,
        ),
        t250,
      ),
      t254,
    ),
    t255,
  )
  linear_equations_2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ u : Real, ∀ v : Real, (∃ x : Real, ∃ y : Real, a * x + b * y == u && c * x + d * y == v) == ((a * d == b * c → d * u == b * v && c * u == a * v) && (a == real_of_num(0) && b == real_of_num(0) && c == real_of_num(0) && d == real_of_num(0) → u == real_of_num(0) && v == real_of_num(0)))"),
      t256,
    ),
  )
}

///|
let linear_equations_2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LINEAR_EQUATIONS_2_EQ",
)

///|
/// `LINEAR_EQUATIONS_2_EQ`
pub fn linear_equations_2_eq() -> @kernel.Thm {
  linear_equations_2_eq_c.get()
}

///|
/// is_realinterval
fn step_31() -> Unit raise {
  is_realinterval_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(is_realinterval : ((Real) -> Bool) -> Bool)((s : (Real) -> Bool)) == (∀ a : Real, ∀ b : Real, ∀ c : Real, IN(a, s) && IN(b, s) && a <= c && c <= b → IN(c, s))"),
    ),
  )
}

///|
let is_realinterval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "is_realinterval",
)

///|
/// `is_realinterval`
pub fn is_realinterval() -> @kernel.Thm {
  is_realinterval_c.get()
}

///|
/// IS_REALINTERVAL_EMPTY
fn step_32() -> Unit raise {
  let t257 = @simp.rewrite_tac(
    @list.List([is_realinterval(), @sets.not_in_empty()]),
  )
  is_realinterval_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("is_realinterval({})"), t257),
  )
}

///|
let is_realinterval_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_EMPTY",
)

///|
/// `IS_REALINTERVAL_EMPTY`
pub fn is_realinterval_empty() -> @kernel.Thm {
  is_realinterval_empty_c.get()
}

///|
/// IS_REALINTERVAL_UNION
fn step_33() -> Unit raise {
  let t258 = @meson.meson_tac(
    @list.List([@realax.real_le_trans(), @realax.real_le_total()]),
  )
  let t259 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        is_realinterval(),
        @sets.in_union(),
        @sets.in_inter(),
        @sets.not_in_empty(),
        @sets.extension(),
      ]),
    ),
    t258,
  )
  is_realinterval_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ t : (Real) -> Bool, is_realinterval(s) && is_realinterval(t) && !(INTER(s, t) == {}) → is_realinterval(UNION(s, t))"),
      t259,
    ),
  )
}

///|
let is_realinterval_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_UNION",
)

///|
/// `IS_REALINTERVAL_UNION`
pub fn is_realinterval_union() -> @kernel.Thm {
  is_realinterval_union_c.get()
}

///|
/// IS_REALINTERVAL_UNIV
fn step_34() -> Unit raise {
  let t260 = @simp.rewrite_tac(@list.List([is_realinterval(), @sets.in_univ()]))
  is_realinterval_univ_c.set(
    @tactics.prove(@term_syntax.parse_term("is_realinterval(UNIV)"), t260),
  )
}

///|
let is_realinterval_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_UNIV",
)

///|
/// `IS_REALINTERVAL_UNIV`
pub fn is_realinterval_univ() -> @kernel.Thm {
  is_realinterval_univ_c.get()
}

///|
/// IS_REALINTERVAL_INTER
fn step_35() -> Unit raise {
  let t261 = @meson.meson_tac(@list.List([]))
  let t262 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([is_realinterval(), @sets.in_inter()])),
    t261,
  )
  is_realinterval_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ t : (Real) -> Bool, is_realinterval(s) && is_realinterval(t) → is_realinterval(INTER(s, t))"),
      t262,
    ),
  )
}

///|
let is_realinterval_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_INTER",
)

///|
/// `IS_REALINTERVAL_INTER`
pub fn is_realinterval_inter() -> @kernel.Thm {
  is_realinterval_inter_c.get()
}

///|
/// open_real_interval
fn step_36() -> Unit raise {
  open_real_interval_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(open_real_interval : ((Real, Real), Real) -> Bool)(((a : Real), (b : Real))) == {(x : Real) | a < x && x < b}"),
    ),
  )
}

///|
let open_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "open_real_interval",
)

///|
/// `open_real_interval`
pub fn open_real_interval() -> @kernel.Thm {
  open_real_interval_c.get()
}

///|
/// closed_real_interval
fn step_37() -> Unit raise {
  closed_real_interval_c.set(
    @define.define_(
      @term_syntax.parse_term("(closed_real_interval : (List[(Real, Real)], Real) -> Bool)([((a : Real), (b : Real))]) == {(x : Real) | a <= x && x <= b}"),
    ),
  )
}

///|
let closed_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "closed_real_interval",
)

///|
/// `closed_real_interval`
pub fn closed_real_interval() -> @kernel.Thm {
  closed_real_interval_c.get()
}

///|
/// Multivariate/misc.ml:346
fn step_38() -> Unit raise {
  @preterm.make_overloadable("real_interval", @term_syntax.parse_type("A"))
}

///|
/// Multivariate/misc.ml:348
fn step_39() -> Unit raise {
  @preterm.overload_interface(
    "real_interval",
    @term_syntax.parse_term("open_real_interval"),
  )
}

///|
/// Multivariate/misc.ml:349
fn step_40() -> Unit raise {
  @preterm.overload_interface(
    "real_interval",
    @term_syntax.parse_term("closed_real_interval"),
  )
}

///|
/// real_interval
fn step_41() -> Unit raise {
  let t263 = @simp.rewrite_tac(
    @list.List([open_real_interval(), closed_real_interval()]),
  )
  real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_interval(((a : Real), (b : Real))) == {(x : Real) | a < x && x < b} && real_interval([(a, b)]) == {(x : Real) | a <= x && x <= b}"),
      t263,
    ),
  )
}

///|
let real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_interval")

///|
/// `real_interval`
pub fn real_interval() -> @kernel.Thm {
  real_interval_c.get()
}

///|
/// IN_REAL_INTERVAL
fn step_42() -> Unit raise {
  let t264 = @simp.rewrite_tac(
    @list.List([real_interval(), @sets.in_elim_thm()]),
  )
  in_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Real, IN(x, real_interval([(a, b)])) == (a <= x && x <= b) && IN(x, real_interval((a, b))) == (a < x && x < b)"),
      t264,
    ),
  )
}

///|
let in_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IN_REAL_INTERVAL",
)

///|
/// `IN_REAL_INTERVAL`
pub fn in_real_interval() -> @kernel.Thm {
  in_real_interval_c.get()
}

///|
/// EMPTY_AS_REAL_INTERVAL
fn step_43() -> Unit raise {
  let t265 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), in_real_interval(), @sets.not_in_empty()]),
    ),
    @calc_rat.real_arith_tac,
  )
  empty_as_real_interval_c.set(
    @tactics.prove(@term_syntax.parse_term("{} == real_interval([(real_of_num(1), real_of_num(0))])"), t265),
  )
}

///|
let empty_as_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EMPTY_AS_REAL_INTERVAL",
)

///|
/// `EMPTY_AS_REAL_INTERVAL`
pub fn empty_as_real_interval() -> @kernel.Thm {
  empty_as_real_interval_c.get()
}

///|
/// REAL_INTERVAL_OPEN_SUBSET_CLOSED
fn step_44() -> Unit raise {
  let t266 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.subset(), in_real_interval()])),
    @calc_rat.real_arith_tac,
  )
  real_interval_open_subset_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, SUBSET(real_interval((a, b)), real_interval([(a, b)]))"),
      t266,
    ),
  )
}

///|
let real_interval_open_subset_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_INTERVAL_OPEN_SUBSET_CLOSED",
)

///|
/// `REAL_INTERVAL_OPEN_SUBSET_CLOSED`
pub fn real_interval_open_subset_closed() -> @kernel.Thm {
  real_interval_open_subset_closed_c.get()
}

///|
/// REAL_INTERVAL_EQ_EMPTY
fn step_45() -> Unit raise {
  let t268 = @equal.gsym(real_le_between())
  let t269 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_lt_between()), t268]),
  )
  let t267 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.not_exists_thm())]),
  )
  let t270 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @sets.extension(),
            in_real_interval(),
            @sets.not_in_empty(),
          ]),
        ),
        t267,
      ),
      t269,
    ),
    @calc_rat.real_arith_tac,
  )
  real_interval_eq_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Real, ∀ b : Real, (real_interval([(a, b)]) == {}) == (b < a)) && (∀ a : Real, ∀ b : Real, (real_interval((a, b)) == {}) == (b <= a))"),
      t270,
    ),
  )
}

///|
let real_interval_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_INTERVAL_EQ_EMPTY",
)

///|
/// `REAL_INTERVAL_EQ_EMPTY`
pub fn real_interval_eq_empty() -> @kernel.Thm {
  real_interval_eq_empty_c.get()
}

///|
/// REAL_INTERVAL_NE_EMPTY
fn step_46() -> Unit raise {
  let t271 = @simp.rewrite_tac(
    @list.List([
      real_interval_eq_empty(),
      @real.real_not_le(),
      @realarith.real_not_lt(),
    ]),
  )
  real_interval_ne_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Real, ∀ b : Real, !(real_interval([(a, b)]) == {}) == (a <= b)) && (∀ a : Real, ∀ b : Real, !(real_interval((a, b)) == {}) == (a < b))"),
      t271,
    ),
  )
}

///|
let real_interval_ne_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_INTERVAL_NE_EMPTY",
)

///|
/// `REAL_INTERVAL_NE_EMPTY`
pub fn real_interval_ne_empty() -> @kernel.Thm {
  real_interval_ne_empty_c.get()
}

///|
/// REAL_INTERVAL_SING
fn step_47() -> Unit raise {
  let t272 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_sing(),
        @sets.not_in_empty(),
        in_real_interval(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  real_interval_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, real_interval([(a, a)]) == {a} && real_interval((a, a)) == {}"),
      t272,
    ),
  )
}

///|
let real_interval_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_INTERVAL_SING",
)

///|
/// `REAL_INTERVAL_SING`
pub fn real_interval_sing() -> @kernel.Thm {
  real_interval_sing_c.get()
}

///|
/// ENDS_IN_REAL_INTERVAL
fn step_48() -> Unit raise {
  let t273 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([in_real_interval(), real_interval_eq_empty()]),
    ),
    @calc_rat.real_arith_tac,
  )
  ends_in_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Real, ∀ b : Real, IN(a, real_interval([(a, b)])) == !(real_interval([(a, b)]) == {})) && (∀ a : Real, ∀ b : Real, IN(b, real_interval([(a, b)])) == !(real_interval([(a, b)]) == {})) && (∀ a : Real, ∀ b : Real, !IN(a, real_interval((a, b)))) && (∀ a : Real, ∀ b : Real, !IN(b, real_interval((a, b))))"),
      t273,
    ),
  )
}

///|
let ends_in_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ENDS_IN_REAL_INTERVAL",
)

///|
/// `ENDS_IN_REAL_INTERVAL`
pub fn ends_in_real_interval() -> @kernel.Thm {
  ends_in_real_interval_c.get()
}

///|
/// IN_REAL_INTERVAL_REFLECT
fn step_49() -> Unit raise {
  let t274 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([in_real_interval()])),
    @calc_rat.real_arith_tac,
  )
  in_real_interval_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Real, ∀ b : Real, ∀ x : Real, IN(-x, real_interval([(-b, -a)])) == IN(x, real_interval([(a, b)]))) && (∀ a : Real, ∀ b : Real, ∀ x : Real, IN(-x, real_interval((-b, -a))) == IN(x, real_interval((a, b))))"),
      t274,
    ),
  )
}

///|
let in_real_interval_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IN_REAL_INTERVAL_REFLECT",
)

///|
/// `IN_REAL_INTERVAL_REFLECT`
pub fn in_real_interval_reflect() -> @kernel.Thm {
  in_real_interval_reflect_c.get()
}

///|
/// REFLECT_REAL_INTERVAL
fn step_50() -> Unit raise {
  let t276 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t275 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == -(y : Real)) == (-x == y)")),
    ]),
  )
  let t277 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @sets.extension(),
            @sets.in_elim_thm(),
            @sets.in_image(),
            in_real_interval(),
          ]),
        ),
        t275,
      ),
      t276,
    ),
    @calc_rat.real_arith_tac,
  )
  reflect_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Real, ∀ b : Real, IMAGE(op_minus_minus, real_interval([(a, b)])) == real_interval([(-b, -a)])) && (∀ a : Real, ∀ b : Real, IMAGE(op_minus_minus, real_interval((a, b))) == real_interval((-b, -a)))"),
      t277,
    ),
  )
}

///|
let reflect_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REFLECT_REAL_INTERVAL",
)

///|
/// `REFLECT_REAL_INTERVAL`
pub fn reflect_real_interval() -> @kernel.Thm {
  reflect_real_interval_c.get()
}

///|
/// IS_REALINTERVAL_INTERVAL
fn step_51() -> Unit raise {
  let t278 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([is_realinterval(), in_real_interval()])),
    @calc_rat.real_arith_tac,
  )
  is_realinterval_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, is_realinterval(real_interval((a, b))) && is_realinterval(real_interval([(a, b)]))"),
      t278,
    ),
  )
}

///|
let is_realinterval_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_INTERVAL",
)

///|
/// `IS_REALINTERVAL_INTERVAL`
pub fn is_realinterval_interval() -> @kernel.Thm {
  is_realinterval_interval_c.get()
}

///|
/// ENDS_IN_UNIT_REAL_INTERVAL
fn step_52() -> Unit raise {
  let t279 = @simp.rewrite_tac(
    @list.List([
      in_real_interval(),
      @realarith.real_pos(),
      @realax.real_le_refl(),
    ]),
  )
  ends_in_unit_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("IN(real_of_num(0), real_interval([(real_of_num(0), real_of_num(1))])) && IN(real_of_num(1), real_interval([(real_of_num(0), real_of_num(1))]))"),
      t279,
    ),
  )
}

///|
let ends_in_unit_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ENDS_IN_UNIT_REAL_INTERVAL",
)

///|
/// `ENDS_IN_UNIT_REAL_INTERVAL`
pub fn ends_in_unit_real_interval() -> @kernel.Thm {
  ends_in_unit_real_interval_c.get()
}

///|
/// INTER_REAL_INTERVAL
fn step_53() -> Unit raise {
  let t280 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_inter(), in_real_interval()]),
    ),
    @calc_rat.real_arith_tac,
  )
  inter_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, INTER(real_interval([(a, b)]), real_interval([(c, d)])) == real_interval([(max(a, c), min(b, d))])"),
      t280,
    ),
  )
}

///|
let inter_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTER_REAL_INTERVAL",
)

///|
/// `INTER_REAL_INTERVAL`
pub fn inter_real_interval() -> @kernel.Thm {
  inter_real_interval_c.get()
}

///|
/// REAL_OPEN_CLOSED_INTERVAL
fn step_54() -> Unit raise {
  let t281 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @sets.extension(),
        @sets.in_diff(),
        in_real_interval(),
        @sets.in_insert(),
        @sets.not_in_empty(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  real_open_closed_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_interval((a, b)) == DIFF(real_interval([(a, b)]), {a, b})"),
      t281,
    ),
  )
}

///|
let real_open_closed_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OPEN_CLOSED_INTERVAL",
)

///|
/// `REAL_OPEN_CLOSED_INTERVAL`
pub fn real_open_closed_interval() -> @kernel.Thm {
  real_open_closed_interval_c.get()
}

///|
/// REAL_CLOSED_OPEN_INTERVAL
fn step_55() -> Unit raise {
  let t282 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @sets.extension(),
        @sets.in_union(),
        in_real_interval(),
        @sets.in_insert(),
        @sets.not_in_empty(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  real_closed_open_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, a <= b → real_interval([(a, b)]) == UNION(real_interval((a, b)), {a, b})"),
      t282,
    ),
  )
}

///|
let real_closed_open_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CLOSED_OPEN_INTERVAL",
)

///|
/// `REAL_CLOSED_OPEN_INTERVAL`
pub fn real_closed_open_interval() -> @kernel.Thm {
  real_closed_open_interval_c.get()
}

///|
/// IS_REALINTERVAL_SING
fn step_56() -> Unit raise {
  let t283 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([is_realinterval(), @sets.in_sing()])),
    @calc_rat.real_arith_tac,
  )
  is_realinterval_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Real, is_realinterval({a})"), t283),
  )
}

///|
let is_realinterval_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_SING",
)

///|
/// `IS_REALINTERVAL_SING`
pub fn is_realinterval_sing() -> @kernel.Thm {
  is_realinterval_sing_c.get()
}

///|
/// IS_REALINTERVAL_CONTAINS_INTERVAL
fn step_57() -> Unit raise {
  let t284 = @meson.meson_tac(@list.List([]))
  let t285 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.subset(), is_realinterval(), in_real_interval()]),
    ),
    t284,
  )
  is_realinterval_contains_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ a : Real, ∀ b : Real, is_realinterval(s) && IN(a, s) && IN(b, s) → SUBSET(real_interval([(a, b)]), s)"),
      t285,
    ),
  )
}

///|
let is_realinterval_contains_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_CONTAINS_INTERVAL",
)

///|
/// `IS_REALINTERVAL_CONTAINS_INTERVAL`
pub fn is_realinterval_contains_interval() -> @kernel.Thm {
  is_realinterval_contains_interval_c.get()
}

///|
/// IS_REALINTERVAL_SHRINK
fn step_58() -> Unit raise {
  let t294 = @meson.meson_tac(
    @list.List([
      @calc_rat.real_shrink_range(),
      @calc_rat.real_shrink_grow(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("(a : Real) <= (x : Real) && x <= (b : Real) && abs(a) < real_of_num(1) && abs(b) < real_of_num(1) → abs(x) < real_of_num(1)"),
      ),
    ]),
  )
  let t293 = @list.List([
    @meson.meson_tac(@list.List([@calc_rat.real_shrink_le()])),
    @tactics.all_tac,
  ])
  let t292 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(q : Bool) == (r : Bool) && (p : Bool) → (p && q) == r")),
  )
  let t291 = @simp.rewrite_tac(
    @list.List([@theorems.forall_and_thm(), @theorems.right_imp_forall_thm()]),
  )
  let t290 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"),
      ),
    ]),
  )
  let t289 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@calc_rat.real_shrink_galois()]),
        @term_syntax.parse_term("(∃ x : Real, x / (real_of_num(1) + abs(x)) == (c : Real) && IN(x, (s : (Real) -> Bool))) == ((∃ x : Real, x / (real_of_num(1) + abs(x)) == c) && (∀ x : Real, x / (real_of_num(1) + abs(x)) == c → IN(x, s)))"),
      ),
    ]),
  )
  let t288 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("IN((y : _), IMAGE((f : (_) -> _), (s : (_) -> Bool))) == (∃ x : _, f(x) == y && IN(x, s))"),
      ),
    ]),
  )
  let t287 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_imp_forall_thm(),
      @theorems.imp_imp(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t286 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t295 = @tactics.then_tac(
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
                        @simp.rewrite_tac(
                          @list.List([
                            is_realinterval(),
                            @theorems.imp_conj(),
                            @theorems.right_forall_imp_thm(),
                          ]),
                        ),
                        @tactics.gen_tac,
                      ),
                      t286,
                    ),
                    t287,
                  ),
                  t288,
                ),
                t289,
              ),
              t290,
            ),
            t291,
          ),
          t292,
        ),
        @tactics.conj_tac,
      ),
      t293,
    ),
    t294,
  )
  is_realinterval_shrink_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Real) -> Bool, is_realinterval(IMAGE((x : Real) => x / (real_of_num(1) + abs(x)), s)) == is_realinterval(s)"),
      t295,
    ),
  )
}

///|
let is_realinterval_shrink_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IS_REALINTERVAL_SHRINK",
)

///|
/// `IS_REALINTERVAL_SHRINK`
pub fn is_realinterval_shrink() -> @kernel.Thm {
  is_realinterval_shrink_c.get()
}

///|
/// SUBSET_REAL_INTERVAL
fn step_59() -> Unit raise {
  let t302 = @tactics.disch_then(fn(
    x299 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x299
    let t301 = @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("(max((d : Real), (a : Real)) + (b : Real)) / real_of_num(2)"), th),
    )
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("((a : Real) + min((b : Real), (c : Real))) / real_of_num(2)"), th)),
      t301,
    )
  })
  let t298 = @tactics.thenl(
    @tactics.eq_tac,
    @list.List([@tactics.all_tac, @calc_rat.real_arith_tac]),
  )
  let t297 = @tactics.repeat_tac(@tactics.conj_tac)
  let t296 = @simp.rewrite_tac(@list.List([@sets.subset(), in_real_interval()]))
  let t303 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t296),
          t297,
        ),
        t298,
      ),
      t302,
    ),
    @calc_rat.real_arith_tac,
  )
  subset_real_interval_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, SUBSET(real_interval([(a, b)]), real_interval([(c, d)])) == (b < a || c <= a && a <= b && b <= d) && SUBSET(real_interval([(a, b)]), real_interval((c, d))) == (b < a || c < a && a <= b && b < d) && SUBSET(real_interval((a, b)), real_interval([(c, d)])) == (b <= a || c <= a && a < b && b <= d) && SUBSET(real_interval((a, b)), real_interval((c, d))) == (b <= a || c <= a && a < b && b <= d)"),
      t303,
    ),
  )
}

///|
let subset_real_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBSET_REAL_INTERVAL",
)

///|
/// `SUBSET_REAL_INTERVAL`
pub fn subset_real_interval() -> @kernel.Thm {
  subset_real_interval_c.get()
}

///|
/// vectorize
fn step_60() -> Unit raise {
  vectorize_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(vectorize : (Cart[Cart[A, N], M]) -> Cart[A, Finite_prod[M, N]]) == ((x : Cart[Cart[A, N], M]) => (lambda : ((Num) -> A) -> Cart[A, Finite_prod[M, N]])((i : Num) => (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])(x, 1 + DIV(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))), 1 + MOD(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))))"),
    ),
  )
}

///|
let vectorize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vectorize")

///|
/// `vectorize`
pub fn vectorize() -> @kernel.Thm {
  vectorize_c.get()
}

///|
/// matrify
fn step_61() -> Unit raise {
  matrify_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matrify : (Cart[A, Finite_prod[M, N]]) -> Cart[Cart[A, N], M]) == ((x : Cart[A, Finite_prod[M, N]]) => (lambda : ((Num) -> Cart[A, N]) -> Cart[Cart[A, N], M])((i : Num) => (lambda : ((Num) -> A) -> Cart[A, N])((j : Num) => (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)(x, (i - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + j))))"),
    ),
  )
}

///|
let matrify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matrify")

///|
/// `matrify`
pub fn matrify() -> @kernel.Thm {
  matrify_c.get()
}

///|
/// VECTORIZE_COMPONENT
fn step_62() -> Unit raise {
  let t304 = @simp.simp_tac(
    @list.List([vectorize(), @cart.lambda_beta(), @cart.dimindex_finite_prod()]),
  )
  vectorize_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Cart[Cart[A, N], M], ∀ i : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)((vectorize : (Cart[Cart[A, N], M]) -> Cart[A, Finite_prod[M, N]])(m), i) == (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])(m, 1 + DIV(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))), 1 + MOD(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"),
      t304,
    ),
  )
}

///|
let vectorize_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VECTORIZE_COMPONENT",
)

///|
/// `VECTORIZE_COMPONENT`
pub fn vectorize_component() -> @kernel.Thm {
  vectorize_component_c.get()
}

///|
/// MATRIFY_COMPONENT
fn step_63() -> Unit raise {
  let t305 = @simp.simp_tac(@list.List([matrify(), @cart.lambda_beta()]))
  matrify_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ v : Cart[A, Finite_prod[M, N]], ∀ i : Num, ∀ j : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) && 1 <= j && j <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])((matrify : (Cart[A, Finite_prod[M, N]]) -> Cart[Cart[A, N], M])(v), i), j) == (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)(v, (i - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + j)"),
      t305,
    ),
  )
}

///|
let matrify_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATRIFY_COMPONENT",
)

///|
/// `MATRIFY_COMPONENT`
pub fn matrify_component() -> @kernel.Thm {
  matrify_component_c.get()
}

///|
/// VECTORIZE_MATRIFY
fn step_64() -> Unit raise {
  let t345 = @simp.simp_tac(@list.List([@cart.dimindex_ge_1(), @arith.le_1()]))
  let t344 = @tactics.match_mp_tac(@arith.division())
  let t343 = @simp.asm_rewrite_tac(@list.List([]))
  let t342 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("1 <= (i : Num) && i - 1 == (d : Num) * (n : Num) + (m : Num) && m < n → d * n + (1 + m) == i"),
    ),
  )
  let t341 = @simp.rewrite_tac(@list.List([@arith.add_sub2()]))
  let t340 = @tactics.disch_then(fn(
    x337 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s338 = @tactics.subst1_tac(x337)
    fn(
      x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s338(x339)
    }
  })
  let t336 = @simp.simp_tac(
    @list.List([@arith.division(), @cart.dimindex_ge_1(), @arith.le_1()]),
  )
  let t335 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= 1 + (x : Num) && 1 + (y : Num) <= (z : Num)) == (y < z)")),
    ]),
  )
  let t329 = @drule.part_match(
    fn(x328 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x328))
    },
    @cart.lambda_beta(),
  )
  let t324 = @list.List([
    @int.asm_arith_tac,
    @tactics.disch_then(fn(
      x321 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s322 = @tactics.subst1_tac(x321)
      fn(
        x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s322(x323)
      }
    }),
  ])
  let t320 = @simp.simp_tac(
    @list.List([@arith.rdiv_lt_eq(), @cart.dimindex_ge_1(), @arith.le_1()]),
  )
  let t319 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= 1 + (x : Num) && 1 + (y : Num) <= (z : Num)) == (y < z)")),
    ]),
  )
  let t312 = @drule.part_match(
    fn(x311 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x311))
    },
    @cart.lambda_beta(),
  )
  let t307 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t306 = @simp.rewrite_tac(@list.List([@cart.dimindex_finite_prod()]))
  let t346 = @tactics.then_tac(
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
                                        @tactics.gen_tac,
                                        @simp.simp_tac(
                                          @list.List([
                                            @cart.cart_eq(),
                                            vectorize(),
                                            matrify(),
                                            @cart.lambda_beta(),
                                          ]),
                                        ),
                                      ),
                                      t306,
                                    ),
                                    t307,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                fn(
                                  x318 : (
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
                                  (fn(
                                    x317 : (
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
                                      x315 : @kernel.Term,
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
                                        x314 : @kernel.Term,
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
                                          x313 : @kernel.Term,
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
                                          (fn(
                                            x308 : @kernel.Thm,
                                          ) -> ((
                                            (
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
                                          ) raise) raise {
                                            let s309 = @tactics.mp_tac(x308)
                                            fn(
                                              x310 : (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
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
                                              s309(x310)
                                            }
                                          })(t312(x313))
                                        })(@equal.lhand(x314))
                                      })(@equal.lhand(x315))
                                    })(
                                      (fn(
                                        x316 : (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ) -> @kernel.Term raise {
                                        x316.1
                                      })(x317),
                                    )
                                  })(x318)(x318)
                                },
                              ),
                              t319,
                            ),
                            t320,
                          ),
                          @tactics.ants_tac,
                        ),
                        t324,
                      ),
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
                          x333 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
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
                            x331 : @kernel.Term,
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
                              x330 : @kernel.Term,
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
                              (fn(
                                x325 : @kernel.Thm,
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
                                let s326 = @tactics.mp_tac(x325)
                                fn(
                                  x327 : (
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
                                  s326(x327)
                                }
                              })(t329(x330))
                            })(@equal.lhand(x331))
                          })(
                            (fn(
                              x332 : (
                                @list.List[(String, @kernel.Thm)],
                                @kernel.Term,
                              ),
                            ) -> @kernel.Term raise {
                              x332.1
                            })(x333),
                          )
                        })(x334)(x334)
                      },
                    ),
                    t335,
                  ),
                  t336,
                ),
                t340,
              ),
              @tactics.ap_term_tac,
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
  )
  vectorize_matrify_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Cart[A, Finite_prod[M, N]], vectorize(matrify(a)) == a"),
      t346,
    ),
  )
}

///|
let vectorize_matrify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VECTORIZE_MATRIFY",
)

///|
/// `VECTORIZE_MATRIFY`
pub fn vectorize_matrify() -> @kernel.Thm {
  vectorize_matrify_c.get()
}

///|
/// MATRIFY_VECTORIZE
fn step_65() -> Unit raise {
  let t374 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) - 1"))
  let t375 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t374),
    @int.asm_arith_tac,
  )
  let t373 = @tactics.exists_tac(@term_syntax.parse_term("(j : Num) - 1"))
  let t376 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@arith.div_uniq()), t373),
      @int.asm_arith_tac,
    ),
    t375,
  ])
  let t372 = @simp.asm_rewrite_tac(@list.List([]))
  let t371 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && (j : Num) == i - 1 → 1 + j == i")),
  )
  let t370 = @simp.rewrite_tac(@list.List([]))
  let t368 = @tactics.disch_then(fn(
    x365 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s366 = @tactics.subst1_tac(x365)
    fn(
      x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s366(x367)
    }
  })
  let t364 = @simp.asm_simp_tac(
    @list.List([@arith.le_mult_rcancel(), @cart.dimindex_ge_1()]),
  )
  let t363 = @simp.asm_simp_tac(
    @list.List([@arith.sub_add(), @cart.dimindex_finite_prod()]),
  )
  let t362 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) * (n : Num) + n == (x + 1) * n"))]),
  )
  let t361 = @simp.asm_rewrite_tac(@list.List([@arith.le_add_lcancel()]))
  let t359 = @term_syntax.parse_term("((i : Num) - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let t360 = @tactics.trans_tac(@arith.le_trans())(t359)
  let t369 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.conj_tac,
                @list.List([@int.asm_arith_tac, @tactics.all_tac]),
              ),
              t360,
            ),
            t361,
          ),
          t362,
        ),
        t363,
      ),
      t364,
    ),
    t368,
  ])
  let t353 = @drule.part_match(
    fn(x352 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x352))
    },
    @cart.lambda_beta(),
  )
  let t348 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t347 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t377 = @tactics.thenl(
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
                              @tactics.gen_tac,
                              @simp.simp_tac(
                                @list.List([
                                  @cart.cart_eq(),
                                  vectorize(),
                                  matrify(),
                                  @cart.lambda_beta(),
                                ]),
                              ),
                            ),
                            t347,
                          ),
                          @tactics.strip_tac,
                        ),
                        t348,
                      ),
                      @tactics.strip_tac,
                    ),
                    fn(
                      x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                          x355 : @kernel.Term,
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
                            x354 : @kernel.Term,
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
                              x349 : @kernel.Thm,
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
                              let s350 = @tactics.mp_tac(x349)
                              fn(
                                x351 : (
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
                                s350(x351)
                              }
                            })(t353(x354))
                          })(@equal.lhand(x355))
                        })(
                          (fn(
                            x356 : (
                              @list.List[(String, @kernel.Thm)],
                              @kernel.Term,
                            ),
                          ) -> @kernel.Term raise {
                            x356.1
                          })(x357),
                        )
                      })(x358)(x358)
                    },
                  ),
                  @tactics.ants_tac,
                ),
                t369,
              ),
              t370,
            ),
            @tactics.binop_tac,
          ),
          @list.List([@tactics.ap_term_tac, @tactics.all_tac]),
        ),
        t371,
      ),
      t372,
    ),
    t376,
  )
  matrify_vectorize_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Cart[Cart[A, N], M], matrify(vectorize(m)) == m"),
      t377,
    ),
  )
}

///|
let matrify_vectorize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATRIFY_VECTORIZE",
)

///|
/// `MATRIFY_VECTORIZE`
pub fn matrify_vectorize() -> @kernel.Thm {
  matrify_vectorize_c.get()
}

///|
/// FORALL_VECTORIZE
fn step_66() -> Unit raise {
  let t378 = @meson.meson_tac(
    @list.List([matrify_vectorize(), vectorize_matrify()]),
  )
  forall_vectorize_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[_, Finite_prod[_, _]]) -> Bool, (∀ x : Cart[_, Finite_prod[_, _]], P(x)) == (∀ x : Cart[Cart[_, _], _], P(vectorize(x)))"),
      t378,
    ),
  )
}

///|
let forall_vectorize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_VECTORIZE",
)

///|
/// `FORALL_VECTORIZE`
pub fn forall_vectorize() -> @kernel.Thm {
  forall_vectorize_c.get()
}

///|
/// FORALL_MATRIFY
fn step_67() -> Unit raise {
  let t379 = @meson.meson_tac(
    @list.List([matrify_vectorize(), vectorize_matrify()]),
  )
  forall_matrify_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[Cart[_, _], _]) -> Bool, (∀ x : Cart[Cart[_, _], _], P(x)) == (∀ x : Cart[_, Finite_prod[_, _]], P(matrify(x)))"),
      t379,
    ),
  )
}

///|
let forall_matrify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_MATRIFY")

///|
/// `FORALL_MATRIFY`
pub fn forall_matrify() -> @kernel.Thm {
  forall_matrify_c.get()
}

///|
/// EXISTS_VECTORIZE
fn step_68() -> Unit raise {
  let t380 = @meson.meson_tac(
    @list.List([matrify_vectorize(), vectorize_matrify()]),
  )
  exists_vectorize_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[_, Finite_prod[_, _]]) -> Bool, (∃ x : Cart[_, Finite_prod[_, _]], P(x)) == (∃ x : Cart[Cart[_, _], _], P(vectorize(x)))"),
      t380,
    ),
  )
}

///|
let exists_vectorize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_VECTORIZE",
)

///|
/// `EXISTS_VECTORIZE`
pub fn exists_vectorize() -> @kernel.Thm {
  exists_vectorize_c.get()
}

///|
/// EXISTS_MATRIFY
fn step_69() -> Unit raise {
  let t381 = @meson.meson_tac(
    @list.List([matrify_vectorize(), vectorize_matrify()]),
  )
  exists_matrify_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[Cart[_, _], _]) -> Bool, (∃ x : Cart[Cart[_, _], _], P(x)) == (∃ x : Cart[_, Finite_prod[_, _]], P(matrify(x)))"),
      t381,
    ),
  )
}

///|
let exists_matrify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MATRIFY")

///|
/// `EXISTS_MATRIFY`
pub fn exists_matrify() -> @kernel.Thm {
  exists_matrify_c.get()
}

///|
/// VECTORIZE_GSPEC
fn step_70() -> Unit raise {
  let t382 = @meson.meson_tac(
    @list.List([vectorize_matrify(), matrify_vectorize()]),
  )
  let t383 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()])),
    t382,
  )
  vectorize_gspec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[Cart[A, N], M]) -> Bool, {vectorize((m : Cart[Cart[A, N], M])) | P(m)} == {(v : Cart[A, Finite_prod[M, N]]) | P(matrify(v))}"),
      t383,
    ),
  )
}

///|
let vectorize_gspec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VECTORIZE_GSPEC",
)

///|
/// `VECTORIZE_GSPEC`
pub fn vectorize_gspec() -> @kernel.Thm {
  vectorize_gspec_c.get()
}

///|
/// VECTORIZE_EQ
fn step_71() -> Unit raise {
  let t384 = @meson.meson_tac(@list.List([matrify_vectorize()]))
  vectorize_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m1 : Cart[Cart[Real, N], M], ∀ m2 : Cart[Cart[Real, N], M], (vectorize(m1) == vectorize(m2)) == (m1 == m2)"),
      t384,
    ),
  )
}

///|
let vectorize_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTORIZE_EQ")

///|
/// `VECTORIZE_EQ`
pub fn vectorize_eq() -> @kernel.Thm {
  vectorize_eq_c.get()
}

///|
/// MATRIFY_EQ
fn step_72() -> Unit raise {
  let t385 = @meson.meson_tac(@list.List([vectorize_matrify()]))
  matrify_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m1 : Cart[Real, Finite_prod[M, N]], ∀ m2 : Cart[Real, Finite_prod[M, N]], (matrify(m1) == matrify(m2)) == (m1 == m2)"),
      t385,
    ),
  )
}

///|
let matrify_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATRIFY_EQ")

///|
/// `MATRIFY_EQ`
pub fn matrify_eq() -> @kernel.Thm {
  matrify_eq_c.get()
}

///|
/// Multivariate/misc.ml:575
fn step_73() -> Unit raise {
  @printer.parse_as_infix("hull", (21L, "left"))
}

///|
/// hull
fn step_74() -> Unit raise {
  hull_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(hull : (((_) -> Bool) -> Bool, (_) -> Bool, _) -> Bool)((P : ((_) -> Bool) -> Bool), (s : (_) -> Bool)) == INTERS({(t : (_) -> Bool) | P(t) && SUBSET(s, t)})"),
    ),
  )
}

///|
let hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hull")

///|
/// `hull`
pub fn hull() -> @kernel.Thm {
  hull_c.get()
}

///|
/// HULL_P
fn step_75() -> Unit raise {
  let t386 = @meson.meson_tac(@list.List([@sets.subset()]))
  let t387 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.extension(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t386,
  )
  hull_p_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, P(s) → hull(P, s) == s"), t387),
  )
}

///|
let hull_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_P")

///|
/// `HULL_P`
pub fn hull_p() -> @kernel.Thm {
  hull_p_c.get()
}

///|
/// P_HULL
fn step_76() -> Unit raise {
  let t388 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t389 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hull()])), t388)
  p_hull_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → P(s)) → P(INTERS(f))) → P(hull(P, s))"),
      t389,
    ),
  )
}

///|
let p_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P_HULL")

///|
/// `P_HULL`
pub fn p_hull() -> @kernel.Thm {
  p_hull_c.get()
}

///|
/// HULL_EQ
fn step_77() -> Unit raise {
  let t390 = @meson.meson_tac(@list.List([p_hull(), hull_p()]))
  hull_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → P(s)) → P(INTERS(f))) → (hull(P, s) == s) == P(s)"),
      t390,
    ),
  )
}

///|
let hull_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_EQ")

///|
/// `HULL_EQ`
pub fn hull_eq() -> @kernel.Thm {
  hull_eq_c.get()
}

///|
/// HULL_HULL
fn step_78() -> Unit raise {
  let t391 = @meson.meson_tac(@list.List([]))
  let t392 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.extension(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
        @sets.subset(),
      ]),
    ),
    t391,
  )
  hull_hull_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, hull(P, hull(P, s)) == hull(P, s)"),
      t392,
    ),
  )
}

///|
let hull_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_HULL")

///|
/// `HULL_HULL`
pub fn hull_hull() -> @kernel.Thm {
  hull_hull_c.get()
}

///|
/// HULL_SUBSET
fn step_79() -> Unit raise {
  let t393 = @meson.meson_tac(@list.List([]))
  let t394 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.subset(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t393,
  )
  hull_subset_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, SUBSET(s, hull(P, s))"), t394),
  )
}

///|
let hull_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_SUBSET")

///|
/// `HULL_SUBSET`
pub fn hull_subset() -> @kernel.Thm {
  hull_subset_c.get()
}

///|
/// HULL_MONO
fn step_80() -> Unit raise {
  let t395 = @meson.meson_tac(@list.List([]))
  let t396 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.subset(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t395,
  )
  hull_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) → SUBSET(hull(P, s), hull(P, t))"),
      t396,
    ),
  )
}

///|
let hull_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_MONO")

///|
/// `HULL_MONO`
pub fn hull_mono() -> @kernel.Thm {
  hull_mono_c.get()
}

///|
/// HULL_ANTIMONO
fn step_81() -> Unit raise {
  let t397 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t398 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.subset(),
        hull(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t397,
  )
  hull_antimono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ Q : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, SUBSET(P, Q) → SUBSET(hull(Q, s), hull(P, s))"),
      t398,
    ),
  )
}

///|
let hull_antimono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_ANTIMONO")

///|
/// `HULL_ANTIMONO`
pub fn hull_antimono() -> @kernel.Thm {
  hull_antimono_c.get()
}

///|
/// HULL_UNIV
fn step_82() -> Unit raise {
  let t399 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@sets.subset_antisym_eq()),
      @sets.subset_univ(),
      hull_subset(),
    ]),
  )
  hull_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, hull(P, UNIV) == UNIV"),
      t399,
    ),
  )
}

///|
let hull_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_UNIV")

///|
/// `HULL_UNIV`
pub fn hull_univ() -> @kernel.Thm {
  hull_univ_c.get()
}

///|
/// HULL_MINIMAL
fn step_83() -> Unit raise {
  let t400 = @meson.meson_tac(@list.List([]))
  let t401 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.subset(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t400,
  )
  hull_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) && P(t) → SUBSET(hull(P, s), t)"),
      t401,
    ),
  )
}

///|
let hull_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_MINIMAL")

///|
/// `HULL_MINIMAL`
pub fn hull_minimal() -> @kernel.Thm {
  hull_minimal_c.get()
}

///|
/// SUBSET_HULL
fn step_84() -> Unit raise {
  let t402 = @meson.meson_tac(@list.List([]))
  let t403 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        hull(),
        @sets.subset(),
        @sets.in_inters(),
        @sets.in_elim_thm(),
      ]),
    ),
    t402,
  )
  subset_hull_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, P(t) → SUBSET(hull(P, s), t) == SUBSET(s, t)"),
      t403,
    ),
  )
}

///|
let subset_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_HULL")

///|
/// `SUBSET_HULL`
pub fn subset_hull() -> @kernel.Thm {
  subset_hull_c.get()
}

///|
/// HULL_UNIQUE
fn step_85() -> Unit raise {
  let t406 = @meson.asm_meson_tac(@list.List([subset_hull(), @sets.subset()]))
  let t405 = @simp.rewrite_tac(
    @list.List([hull(), @sets.subset(), @sets.in_inters(), @sets.in_elim_thm()]),
  )
  let t404 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t407 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t404),
      t405,
    ),
    t406,
  )
  hull_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) && P(t) && (∀ t' : (_) -> Bool, SUBSET(s, t') && P(t') → SUBSET(t, t')) → hull(P, s) == t"),
      t407,
    ),
  )
}

///|
let hull_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_UNIQUE")

///|
/// `HULL_UNIQUE`
pub fn hull_unique() -> @kernel.Thm {
  hull_unique_c.get()
}

///|
/// HULL_UNION_SUBSET
fn step_86() -> Unit raise {
  let t408 = @simp.simp_tac(
    @list.List([@sets.union_subset(), hull_mono(), @sets.subset_union()]),
  )
  hull_union_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(hull(P, s), hull(P, t)), hull(P, UNION(s, t)))"),
      t408,
    ),
  )
}

///|
let hull_union_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_UNION_SUBSET",
)

///|
/// `HULL_UNION_SUBSET`
pub fn hull_union_subset() -> @kernel.Thm {
  hull_union_subset_c.get()
}

///|
/// HULL_UNION
fn step_87() -> Unit raise {
  let t411 = @meson.meson_tac(@list.List([subset_hull()]))
  let t410 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.union_subset()]),
  )
  let t409 = @simp.once_rewrite_tac(@list.List([hull()]))
  let t412 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t409),
        @tactics.ap_term_tac,
      ),
      t410,
    ),
    t411,
  )
  hull_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(hull(P, s), hull(P, t)))"),
      t412,
    ),
  )
}

///|
let hull_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_UNION")

///|
/// `HULL_UNION`
pub fn hull_union() -> @kernel.Thm {
  hull_union_c.get()
}

///|
/// HULL_UNION_LEFT
fn step_88() -> Unit raise {
  let t415 = @meson.meson_tac(@list.List([subset_hull()]))
  let t414 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.union_subset()]),
  )
  let t413 = @simp.once_rewrite_tac(@list.List([hull()]))
  let t416 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t413),
        @tactics.ap_term_tac,
      ),
      t414,
    ),
    t415,
  )
  hull_union_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(hull(P, s), t))"),
      t416,
    ),
  )
}

///|
let hull_union_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_UNION_LEFT",
)

///|
/// `HULL_UNION_LEFT`
pub fn hull_union_left() -> @kernel.Thm {
  hull_union_left_c.get()
}

///|
/// HULL_UNION_RIGHT
fn step_89() -> Unit raise {
  let t419 = @meson.meson_tac(@list.List([subset_hull()]))
  let t418 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.union_subset()]),
  )
  let t417 = @simp.once_rewrite_tac(@list.List([hull()]))
  let t420 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t417),
        @tactics.ap_term_tac,
      ),
      t418,
    ),
    t419,
  )
  hull_union_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(s, hull(P, t)))"),
      t420,
    ),
  )
}

///|
let hull_union_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_UNION_RIGHT",
)

///|
/// `HULL_UNION_RIGHT`
pub fn hull_union_right() -> @kernel.Thm {
  hull_union_right_c.get()
}

///|
/// HULL_INSERT
fn step_90() -> Unit raise {
  let t422 = @simp.rewrite_tac(@list.List([hull_hull()]))
  let t421 = @simp.once_rewrite_tac(@list.List([hull_union()]))
  let t423 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @sets.set_rule(@term_syntax.parse_term("INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)")),
        ]),
      ),
      t421,
    ),
    t422,
  )
  hull_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ a : _, ∀ s : (_) -> Bool, hull(P, INSERT(a, s)) == hull(P, INSERT(a, hull(P, s)))"),
      t423,
    ),
  )
}

///|
let hull_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_INSERT")

///|
/// `HULL_INSERT`
pub fn hull_insert() -> @kernel.Thm {
  hull_insert_c.get()
}

///|
/// HULL_REDUNDANT_EQ
fn step_91() -> Unit raise {
  let t424 = @sets.set_tac(@list.List([]))
  let t425 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hull()])), t424)
  hull_redundant_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ a : _, ∀ s : (_) -> Bool, IN(a, hull(P, s)) == (hull(P, INSERT(a, s)) == hull(P, s))"),
      t425,
    ),
  )
}

///|
let hull_redundant_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_REDUNDANT_EQ",
)

///|
/// `HULL_REDUNDANT_EQ`
pub fn hull_redundant_eq() -> @kernel.Thm {
  hull_redundant_eq_c.get()
}

///|
/// HULL_REDUNDANT
fn step_92() -> Unit raise {
  let t426 = @simp.rewrite_tac(@list.List([hull_redundant_eq()]))
  hull_redundant_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ a : _, ∀ s : (_) -> Bool, IN(a, hull(P, s)) → hull(P, INSERT(a, s)) == hull(P, s)"),
      t426,
    ),
  )
}

///|
let hull_redundant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_REDUNDANT")

///|
/// `HULL_REDUNDANT`
pub fn hull_redundant() -> @kernel.Thm {
  hull_redundant_c.get()
}

///|
/// HULL_INDUCT
fn step_93() -> Unit raise {
  let t430 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t427 = @term_syntax.parse_term("{(x : A) | (p : (A) -> Bool)(x)}")
  let t428 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t429 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)"), t428, t427]),
      hull_minimal(),
    ),
  )
  let t431 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t429),
    t430,
  )
  hull_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ p : (A) -> Bool, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → p(x)) && P({(x : A) | p(x)}) → (∀ x : A, IN(x, hull(P, s)) → p(x))"),
      t431,
    ),
  )
}

///|
let hull_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_INDUCT")

///|
/// `HULL_INDUCT`
pub fn hull_induct() -> @kernel.Thm {
  hull_induct_c.get()
}

///|
/// HULL_INC
fn step_94() -> Unit raise {
  let t432 = @meson.meson_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.subset()]))(hull_subset())]),
  )
  hull_inc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ x : _, IN(x, s) → IN(x, hull(P, s))"), t432),
  )
}

///|
let hull_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_INC")

///|
/// `HULL_INC`
pub fn hull_inc() -> @kernel.Thm {
  hull_inc_c.get()
}

///|
/// HULL_IMAGE_SUBSET
fn step_95() -> Unit raise {
  let t434 = @simp.asm_simp_tac(
    @list.List([@sets.image_subset(), hull_subset()]),
  )
  let t433 = @tactics.match_mp_tac(hull_minimal())
  let t435 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t433),
    t434,
  )
  hull_image_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ s : (_) -> Bool, P(hull(P, s)) && (∀ s : (_) -> Bool, P(s) → P(IMAGE(f, s))) → SUBSET(hull(P, IMAGE(f, s)), IMAGE(f, hull(P, s)))"),
      t435,
    ),
  )
}

///|
let hull_image_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_IMAGE_SUBSET",
)

///|
/// `HULL_IMAGE_SUBSET`
pub fn hull_image_subset() -> @kernel.Thm {
  hull_image_subset_c.get()
}

///|
/// HULL_IMAGE_GALOIS
fn step_96() -> Unit raise {
  let t443 = @simp.asm_simp_tac(@list.List([hull_subset()]))
  let t442 = @tactics.match_mp_tac(hull_minimal())
  let t441 = @tactics.first_assum(fn(
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
    let th = x438
    @simp.gen_rewrite_tac(
      fn(
        x440 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x440
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t437 = @simp.asm_simp_tac(@list.List([hull_image_subset()]))
  let t436 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t444 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t436),
          t437,
        ),
        t441,
      ),
      t442,
    ),
    t443,
  )
  hull_image_galois_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : (_) -> _, ∀ g : (_) -> _, ∀ s : (_) -> Bool, (∀ s : (_) -> Bool, P(hull(P, s))) && (∀ s : (_) -> Bool, P(s) → P(IMAGE(f, s))) && (∀ s : (_) -> Bool, P(s) → P(IMAGE(g, s))) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, IMAGE(g, t)) == SUBSET(IMAGE(f, s), t)) → hull(P, IMAGE(f, s)) == IMAGE(f, hull(P, s))"),
      t444,
    ),
  )
}

///|
let hull_image_galois_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_IMAGE_GALOIS",
)

///|
/// `HULL_IMAGE_GALOIS`
pub fn hull_image_galois() -> @kernel.Thm {
  hull_image_galois_c.get()
}

///|
/// HULL_IMAGE
fn step_97() -> Unit raise {
  let t466 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t465 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t464 = @tactics.first_x_assum(fn(
    x459 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x459
    @simp.gen_rewrite_tac(
      fn(
        x461 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s462 = @equal.rand_conv(x461)
        fn(x463 : @kernel.Term) -> @kernel.Thm raise { s462(x463) }
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t458 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t457 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t456 = @simp.asm_rewrite_tac(@list.List([]))
  let t455 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> A)"))
  let t454 = @tactics.match_mp_tac(hull_image_galois())
  let t453 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(g : (A) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t452 = @simp.rewrite_tac(
    @list.List([@sets.bijective_left_right_inverse()]),
  )
  let t451 = @tactics.replicate_tac(
    2,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x445 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s446 = @tactics.assume_tac(x445)
          fn(
            x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s446(x447)
          }
        },
        fn(
          x448 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s449 = @tactics.mp_tac(x448)
          fn(
            x450 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s449(x450)
          }
        },
      ),
    ),
  )
  let t467 = @tactics.then_tac(
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
                            t451,
                          ),
                          t452,
                        ),
                        t453,
                      ),
                      t454,
                    ),
                    t455,
                  ),
                  t456,
                ),
                @tactics.conj_tac,
              ),
              t457,
            ),
            t458,
          ),
          t464,
        ),
        t465,
      ),
      @tactics.ap_term_tac,
    ),
    t466,
  )
  hull_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ f : (A) -> A, ∀ s : (A) -> Bool, (∀ s : (A) -> Bool, P(hull(P, s))) && (∀ s : (A) -> Bool, P(IMAGE(f, s)) == P(s)) && (∀ x : A, ∀ y : A, f(x) == f(y) → x == y) && (∀ y : A, ∃ x : A, f(x) == y) → hull(P, IMAGE(f, s)) == IMAGE(f, hull(P, s))"),
      t467,
    ),
  )
}

///|
let hull_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_IMAGE")

///|
/// `HULL_IMAGE`
pub fn hull_image() -> @kernel.Thm {
  hull_image_c.get()
}

///|
/// IS_HULL
fn step_98() -> Unit raise {
  let t468 = @meson.meson_tac(@list.List([hull_p(), p_hull()]))
  is_hull_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → P(s)) → P(INTERS(f))) → P(s) == (∃ t : (_) -> Bool, s == hull(P, t))"),
      t468,
    ),
  )
}

///|
let is_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_HULL")

///|
/// `IS_HULL`
pub fn is_hull() -> @kernel.Thm {
  is_hull_c.get()
}

///|
/// HULLS_EQ
fn step_99() -> Unit raise {
  let t471 = @simp.asm_simp_tac(@list.List([p_hull()]))
  let t470 = @tactics.match_mp_tac(hull_minimal())
  let t469 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t472 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t469),
        @tactics.conj_tac,
      ),
      t470,
    ),
    t471,
  )
  hulls_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → P(s)) → P(INTERS(f))) && SUBSET(s, hull(P, t)) && SUBSET(t, hull(P, s)) → hull(P, s) == hull(P, t)"),
      t472,
    ),
  )
}

///|
let hulls_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULLS_EQ")

///|
/// `HULLS_EQ`
pub fn hulls_eq() -> @kernel.Thm {
  hulls_eq_c.get()
}

///|
/// HULL_P_AND_Q
fn step_100() -> Unit raise {
  let t475 = @meson.asm_meson_tac(
    @list.List([p_hull(), hull_subset(), @sets.subset_trans()]),
  )
  let t474 = @simp.asm_simp_tac(@list.List([hull_inc(), subset_hull()]))
  let t473 = @tactics.match_mp_tac(hull_unique())
  let t476 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t473),
      t474,
    ),
    t475,
  )
  hull_p_and_q_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ Q : ((_) -> Bool) -> Bool, (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → P(s)) → P(INTERS(f))) && (∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → Q(s)) → Q(INTERS(f))) && (∀ s : (_) -> Bool, Q(s) → Q(hull(P, s))) → hull((x : (_) -> Bool) => P(x) && Q(x), (s : (_) -> Bool)) == hull(P, hull(Q, s))"),
      t476,
    ),
  )
}

///|
let hull_p_and_q_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HULL_P_AND_Q")

///|
/// `HULL_P_AND_Q`
pub fn hull_p_and_q() -> @kernel.Thm {
  hull_p_and_q_c.get()
}

///|
/// HULL_UNIONS_SUBSET
fn step_101() -> Unit raise {
  let t479 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t478 = @tactics.match_mp_tac(hull_mono())
  let t477 = @tactics.repeat_tac(@tactics.strip_tac)
  let t480 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@sets.unions_subset(), @sets.forall_in_gspec()]),
        ),
        t477,
      ),
      t478,
    ),
    t479,
  )
  hull_unions_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : ((_) -> Bool) -> Bool, SUBSET(UNIONS({hull(P, (s : (_) -> Bool)) | IN(s, f)}), hull(P, UNIONS(f)))"),
      t480,
    ),
  )
}

///|
let hull_unions_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_UNIONS_SUBSET",
)

///|
/// `HULL_UNIONS_SUBSET`
pub fn hull_unions_subset() -> @kernel.Thm {
  hull_unions_subset_c.get()
}

///|
/// HULL_INTERS_SUBSET
fn step_102() -> Unit raise {
  let t483 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t482 = @tactics.match_mp_tac(hull_mono())
  let t481 = @tactics.repeat_tac(@tactics.strip_tac)
  let t484 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@sets.subset_inters(), @sets.forall_in_gspec()]),
        ),
        t481,
      ),
      t482,
    ),
    t483,
  )
  hull_inters_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ f : ((_) -> Bool) -> Bool, SUBSET(hull(P, INTERS(f)), INTERS({hull(P, (s : (_) -> Bool)) | IN(s, f)}))"),
      t484,
    ),
  )
}

///|
let hull_inters_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_INTERS_SUBSET",
)

///|
/// `HULL_INTERS_SUBSET`
pub fn hull_inters_subset() -> @kernel.Thm {
  hull_inters_subset_c.get()
}

///|
/// HULL_INTER_SUBSET
fn step_103() -> Unit raise {
  let t485 = @sets.set_tac(@list.List([]))
  let t486 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([hull(), @sets.inters_gspec()])),
    t485,
  )
  hull_inter_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(hull(P, INTER(s, t)), INTER(hull(P, s), hull(P, t)))"),
      t486,
    ),
  )
}

///|
let hull_inter_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HULL_INTER_SUBSET",
)

///|
/// `HULL_INTER_SUBSET`
pub fn hull_inter_subset() -> @kernel.Thm {
  hull_inter_subset_c.get()
}

///|
/// FORALL_POS_MONO
fn step_104() -> Unit raise {
  let t487 = @meson.meson_tac(
    @list.List([@real.real_arch_inv(), @realarith.real_lt_trans()]),
  )
  forall_pos_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ d : Real, ∀ e : Real, d < e && P(d) → P(e)) && (∀ n : Num, !(n == 0) → P(inv(real_of_num(n)))) → (∀ e : Real, real_of_num(0) < e → P(e))"),
      t487,
    ),
  )
}

///|
let forall_pos_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_POS_MONO",
)

///|
/// `FORALL_POS_MONO`
pub fn forall_pos_mono() -> @kernel.Thm {
  forall_pos_mono_c.get()
}

///|
/// FORALL_POS_MONO_1
fn step_105() -> Unit raise {
  let t488 = @simp.rewrite_tac(
    @list.List([
      @real.real_of_num_suc(),
      @equal.gsym(forall_suc()),
      forall_pos_mono(),
    ]),
  )
  forall_pos_mono_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ d : Real, ∀ e : Real, d < e && P(d) → P(e)) && (∀ n : Num, P(inv(real_of_num(n) + real_of_num(1)))) → (∀ e : Real, real_of_num(0) < e → P(e))"),
      t488,
    ),
  )
}

///|
let forall_pos_mono_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_POS_MONO_1",
)

///|
/// `FORALL_POS_MONO_1`
pub fn forall_pos_mono_1() -> @kernel.Thm {
  forall_pos_mono_1_c.get()
}

///|
/// FORALL_POS_MONO_EQ
fn step_106() -> Unit raise {
  let t489 = @meson.meson_tac(
    @list.List([
      @real.real_arch_inv(),
      @real.real_lt_inv_eq(),
      @realarith.real_lt_trans(),
      @arith.le_1(),
      @real.real_of_num_lt(),
    ]),
  )
  forall_pos_mono_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ d : Real, ∀ e : Real, d < e && P(d) → P(e)) → (∀ e : Real, real_of_num(0) < e → P(e)) == (∀ n : Num, !(n == 0) → P(inv(real_of_num(n))))"),
      t489,
    ),
  )
}

///|
let forall_pos_mono_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_POS_MONO_EQ",
)

///|
/// `FORALL_POS_MONO_EQ`
pub fn forall_pos_mono_eq() -> @kernel.Thm {
  forall_pos_mono_eq_c.get()
}

///|
/// FORALL_POS_MONO_1_EQ
fn step_107() -> Unit raise {
  let t495 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_suc(), @equal.gsym(forall_suc())]),
  )
  let t493 = @drule.match_mp(forall_pos_mono_eq())
  let t496 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.disch_then(fn(
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
          x490 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s491 = @tactics.subst1_tac(x490)
          fn(
            x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s491(x492)
          }
        })(t493(x494))
      }),
    ),
    t495,
  )
  forall_pos_mono_1_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ d : Real, ∀ e : Real, d < e && P(d) → P(e)) → (∀ e : Real, real_of_num(0) < e → P(e)) == (∀ n : Num, P(inv(real_of_num(n) + real_of_num(1))))"),
      t496,
    ),
  )
}

///|
let forall_pos_mono_1_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_POS_MONO_1_EQ",
)

///|
/// `FORALL_POS_MONO_1_EQ`
pub fn forall_pos_mono_1_eq() -> @kernel.Thm {
  forall_pos_mono_1_eq_c.get()
}

///|
/// REAL_ARCH_RDIV_EQ_0
fn step_108() -> Unit raise {
  let t511 = @meson.asm_meson_tac(
    @list.List([
      @real.real_let_antisym(),
      @realax.real_mul_sym(),
      @arith.lt_nz(),
    ]),
  )
  let t510 = @meson.asm_meson_tac(@list.List([@real.real_let_antisym()]))
  let t509 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@calc_int.real_mul_lzero()])),
  )
  let t512 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.pop_assum(fn(
          x506 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s507 = @tactics.subst_all_tac(x506)
          fn(
            x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s507(x508)
          }
        }),
        t509,
      ),
      t510,
    ),
    t511,
  ])
  let t505 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t502 = @drule.match_mp(@real.real_arch())
  let t499 = @term_syntax.parse_term("(c : Real)")
  let t504 = @tactics.pop_assum(fn(
    x503 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x501 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(
        ((x500 : @kernel.Thm) => @bool.spec(t499, x500))(x501),
      )
    })(t502(x503))
  })
  let t498 = @tactics.repeat_tac(@tactics.strip_tac)
  let t497 = @equal.gsym(@realarith.real_not_lt())
  let t513 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(
            @list.List([@equal.gsym(@realax.real_le_antisym()), t497]),
          ),
          t498,
        ),
        t504,
      ),
      t505,
    ),
    t512,
  )
  real_arch_rdiv_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ c : Real, real_of_num(0) <= x && real_of_num(0) <= c && (∀ m : Num, 0 < m → real_of_num(m) * x <= c) → x == real_of_num(0)"),
      t513,
    ),
  )
}

///|
let real_arch_rdiv_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ARCH_RDIV_EQ_0",
)

///|
/// `REAL_ARCH_RDIV_EQ_0`
pub fn real_arch_rdiv_eq_0() -> @kernel.Thm {
  real_arch_rdiv_eq_0_c.get()
}

///|
/// FINITE_INDEX_NUMSEG_SPECIAL
fn step_109() -> Unit raise {
  let t522 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t521 = @simp.asm_simp_tac(
    @list.List([
      @sets.card_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
    ]),
  )
  let t520 = @simp.asm_rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @iterate.card_numseg_1(),
      @iterate.in_numseg(),
      @arith.le_refl(),
    ]),
  )
  let t518 = @sets.set_tac(@list.List([]))
  let t519 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t518),
  ])
  let t514 = @term_syntax.parse_term("(a : A)")
  let t515 = @term_syntax.parse_term("1")
  let t516 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t517 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("op_dot_dot(1, CARD((s : (A) -> Bool)))"), t516, t515, t514]),
      @sets.card_eq_bijections_special(),
    ),
  )
  let t523 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t517),
            @tactics.ants_tac,
          ),
          t519,
        ),
        t520,
      ),
      t521,
    ),
    t522,
  )
  finite_index_numseg_special_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → (∃ f : (Num) -> A, (∀ i : Num, ∀ j : Num, IN(i, op_dot_dot(1, CARD(s))) && IN(j, op_dot_dot(1, CARD(s))) && f(i) == f(j) → i == j) && s == IMAGE(f, op_dot_dot(1, CARD(s))) && f(1) == a)"),
      t523,
    ),
  )
}

///|
let finite_index_numseg_special_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_NUMSEG_SPECIAL",
)

///|
/// `FINITE_INDEX_NUMSEG_SPECIAL`
pub fn finite_index_numseg_special() -> @kernel.Thm {
  finite_index_numseg_special_c.get()
}

///|
/// SUM_GP_BASIC
fn step_110() -> Unit raise {
  let t526 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_add_ldistrib(), @realax.real_pow()]),
  )
  let t525 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realarith.real_mul_rid(), @arith.le_0()]),
  )
  let t524 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg()]))
  let t527 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
          t524,
        ),
        t525,
      ),
      t526,
    ),
    @calc_rat.real_arith_tac,
  )
  sum_gp_basic_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, (real_of_num(1) - x) * sum(op_dot_dot(0, n), (i : Num) => pow(x, i)) == real_of_num(1) - pow(x, SUC(n))"),
      t527,
    ),
  )
}

///|
let sum_gp_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GP_BASIC")

///|
/// `SUM_GP_BASIC`
pub fn sum_gp_basic() -> @kernel.Thm {
  sum_gp_basic_c.get()
}

///|
/// SUM_GP_MULTIPLIED
fn step_111() -> Unit raise {
  let t530 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → SUC(n - m) + m == SUC(n)")),
    ]),
  )
  let t529 = @simp.rewrite_tac(
    @list.List([
      @real.real_sub_rdistrib(),
      @equal.gsym(@real.real_pow_add()),
      @realax.real_mul_lid(),
    ]),
  )
  let t528 = @simp.asm_simp_tac(
    @list.List([
      @iterate.sum_offset_0(),
      @real.real_pow_add(),
      @realax.real_mul_assoc(),
      sum_gp_basic(),
      @iterate.sum_rmul(),
    ]),
  )
  let t531 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t528),
      t529,
    ),
    t530,
  )
  sum_gp_multiplied_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, m <= n → (real_of_num(1) - x) * sum(op_dot_dot(m, n), (i : Num) => pow(x, i)) == pow(x, m) - pow(x, SUC(n))"),
      t531,
    ),
  )
}

///|
let sum_gp_multiplied_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_GP_MULTIPLIED",
)

///|
/// `SUM_GP_MULTIPLIED`
pub fn sum_gp_multiplied() -> @kernel.Thm {
  sum_gp_multiplied_c.get()
}

///|
/// SUM_GP
fn step_112() -> Unit raise {
  let t537 = @simp.asm_simp_tac(
    @list.List([
      @real.real_div_lmul(),
      @realarith.real_sub_0(),
      sum_gp_multiplied(),
    ]),
  )
  let t536 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - (x : Real)"))
  let t535 = @tactics.match_mp_tac(@real.real_eq_lcancel_imp())
  let t534 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @real.real_pow_one(),
        @iterate.sum_const_numseg(),
        @realarith.real_mul_rid(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t533 = @simp.asm_simp_tac(@list.List([@iterate.sum_triv_numseg()]))
  let t532 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) || !(n < m) && m <= n")),
  )
  let t538 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t532),
              t533,
            ),
            @class.cond_cases_tac,
          ),
          t534,
        ),
        t535,
      ),
      t536,
    ),
    t537,
  )
  sum_gp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (i : Num) => pow(x, i)) == (if n < m { real_of_num(0) } else { if x == real_of_num(1) { real_of_num(n + 1 - m) } else { (pow(x, m) - pow(x, SUC(n))) / (real_of_num(1) - x) } })"),
      t538,
    ),
  )
}

///|
let sum_gp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GP")

///|
/// `SUM_GP`
pub fn sum_gp() -> @kernel.Thm {
  sum_gp_c.get()
}

///|
/// SUM_GP_OFFSET
fn step_113() -> Unit raise {
  let t541 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@realax.real_div(), @realax.real_pow(), @real.real_pow_add()]),
    ),
    @calc_rat.real_arith_tac,
  )
  let t542 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@realax.real_of_num_add()])),
        @tactics.ap_term_tac,
      ),
      @int.arith_tac,
    ),
    t541,
  ])
  let t540 = @simp.asm_rewrite_tac(@list.List([]))
  let t539 = @simp.rewrite_tac(
    @list.List([
      sum_gp(),
      @int.arith_rule(@term_syntax.parse_term("!((m : Num) + (n : Num) < m)")),
    ]),
  )
  let t543 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t539),
        @class.cond_cases_tac,
      ),
      t540,
    ),
    t542,
  )
  sum_gp_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, m + n), (i : Num) => pow(x, i)) == (if x == real_of_num(1) { real_of_num(n) + real_of_num(1) } else { pow(x, m) * ((real_of_num(1) - pow(x, SUC(n))) / (real_of_num(1) - x)) })"),
      t543,
    ),
  )
}

///|
let sum_gp_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GP_OFFSET")

///|
/// `SUM_GP_OFFSET`
pub fn sum_gp_offset() -> @kernel.Thm {
  sum_gp_offset_c.get()
}

///|
/// from
fn step_114() -> Unit raise {
  from_c.set(
    @pair.new_definition(@term_syntax.parse_term("(from : (Num, Num) -> Bool)((n : Num)) == {(m : Num) | n <= m}")),
  )
}

///|
let from_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("from")

///|
/// `from`
pub fn from() -> @kernel.Thm {
  from_c.get()
}

///|
/// FROM_0
fn step_115() -> Unit raise {
  let t544 = @sets.set_tac(@list.List([]))
  let t545 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([from(), @arith.le_0()])),
    t544,
  )
  from_0_c.set(@tactics.prove(@term_syntax.parse_term("from(0) == UNIV"), t545))
}

///|
let from_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FROM_0")

///|
/// `FROM_0`
pub fn from_0() -> @kernel.Thm {
  from_0_c.get()
}

///|
/// IN_FROM
fn step_116() -> Unit raise {
  let t546 = @simp.rewrite_tac(@list.List([from(), @sets.in_elim_thm()]))
  in_from_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, IN(m, from(n)) == (n <= m)"), t546),
  )
}

///|
let in_from_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_FROM")

///|
/// `IN_FROM`
pub fn in_from() -> @kernel.Thm {
  in_from_c.get()
}

///|
/// FROM_MONO
fn step_117() -> Unit raise {
  let t547 = @meson.meson_tac(@list.List([@arith.le_trans(), @arith.le_refl()]))
  let t548 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.subset(), in_from()])),
    t547,
  )
  from_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, SUBSET(from(m), from(n)) == (n <= m)"),
      t548,
    ),
  )
}

///|
let from_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FROM_MONO")

///|
/// `FROM_MONO`
pub fn from_mono() -> @kernel.Thm {
  from_mono_c.get()
}

///|
/// FROM_INTER_NUMSEG_GEN
fn step_118() -> Unit raise {
  let t553 = @simp.rewrite_tac(
    @list.List([
      from(),
      @sets.in_elim_thm(),
      @sets.in_inter(),
      @iterate.in_numseg(),
      @sets.extension(),
    ]),
  )
  let t552 = @tactics.pop_assum(fn(
    x549 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s550 = @tactics.mp_tac(x549)
    fn(
      x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s550(x551)
    }
  })
  let t554 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @class.cond_cases_tac,
        ),
        t552,
      ),
      t553,
    ),
    @int.arith_tac,
  )
  from_inter_numseg_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ m : Num, ∀ n : Num, INTER(from(k), op_dot_dot(m, n)) == (if m < k { op_dot_dot(k, n) } else { op_dot_dot(m, n) })"),
      t554,
    ),
  )
}

///|
let from_inter_numseg_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FROM_INTER_NUMSEG_GEN",
)

///|
/// `FROM_INTER_NUMSEG_GEN`
pub fn from_inter_numseg_gen() -> @kernel.Thm {
  from_inter_numseg_gen_c.get()
}

///|
/// FROM_INTER_NUMSEG_MAX
fn step_119() -> Unit raise {
  let t555 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_inter(),
        @iterate.in_numseg(),
        in_from(),
      ]),
    ),
    @int.arith_tac,
  )
  from_inter_numseg_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, INTER(from(p), op_dot_dot(m, n)) == op_dot_dot(MAX(p, m), n)"),
      t555,
    ),
  )
}

///|
let from_inter_numseg_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FROM_INTER_NUMSEG_MAX",
)

///|
/// `FROM_INTER_NUMSEG_MAX`
pub fn from_inter_numseg_max() -> @kernel.Thm {
  from_inter_numseg_max_c.get()
}

///|
/// FROM_INTER_NUMSEG
fn step_120() -> Unit raise {
  let t556 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        from(),
        @sets.in_elim_thm(),
        @sets.in_inter(),
        @iterate.in_numseg(),
        @sets.extension(),
      ]),
    ),
    @int.arith_tac,
  )
  from_inter_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ n : Num, INTER(from(k), op_dot_dot(0, n)) == op_dot_dot(k, n)"),
      t556,
    ),
  )
}

///|
let from_inter_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FROM_INTER_NUMSEG",
)

///|
/// `FROM_INTER_NUMSEG`
pub fn from_inter_numseg() -> @kernel.Thm {
  from_inter_numseg_c.get()
}

///|
/// INFINITE_FROM
fn step_121() -> Unit raise {
  let t559 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      from(),
      @sets.in_diff(),
      @sets.in_univ(),
      @sets.in_elim_thm(),
    ]),
  )
  let t560 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.subgoal_then(
          @term_syntax.parse_term("from((n : Num)) == DIFF(UNIV, {(i : Num) | i < n})"),
          fn(
            x557 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let th = x557
            @simp.simp_tac(
              @list.List([
                th,
                @sets.infinite_diff_finite(),
                @sets.finite_numseg_lt(),
                @sets.num_infinite(),
              ]),
            )
          },
        ),
      ),
      t559,
    ),
    @int.arith_tac,
  )
  infinite_from_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, INFINITE(from(n))"), t560),
  )
}

///|
let infinite_from_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_FROM")

///|
/// `INFINITE_FROM`
pub fn infinite_from() -> @kernel.Thm {
  infinite_from_c.get()
}

///|
/// FINITE_INTER_NUMSEG
fn step_122() -> Unit raise {
  let t561 = @meson.meson_tac(
    @list.List([
      @sets.finite_subset(),
      @iterate.finite_numseg(),
      @sets.inter_subset(),
    ]),
  )
  finite_inter_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ m : Num, ∀ n : Num, FINITE(INTER(s, op_dot_dot(m, n)))"), t561),
  )
}

///|
let finite_inter_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INTER_NUMSEG",
)

///|
/// `FINITE_INTER_NUMSEG`
pub fn finite_inter_numseg() -> @kernel.Thm {
  finite_inter_numseg_c.get()
}

///|
/// FROM_NONEMPTY
fn step_123() -> Unit raise {
  let t562 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t563 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(
        @list.List([@sets.extension(), in_from(), @sets.not_in_empty()]),
      ),
    ),
    t562,
  )
  from_nonempty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(from(n) == {})"), t563),
  )
}

///|
let from_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FROM_NONEMPTY")

///|
/// `FROM_NONEMPTY`
pub fn from_nonempty() -> @kernel.Thm {
  from_nonempty_c.get()
}

///|
/// HORNER_SUM_CONV
fn step_124() -> Unit raise {
  let t569 = @simp.simp_tac(
    @list.List([
      @iterate.sum_clauses_left(),
      @arith.le_0(),
      @realax.real_pow(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t568 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@bool.spec(@term_syntax.parse_term("1"), @iterate.sum_offset())),
    ]),
  )
  let t567 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@realax.real_pow())), @arith.add1()]),
  )
  let t566 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * ((c : Real) * (y : Real)) == c * (x * y)")),
    ]),
  )
  let t565 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t570 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@bool.conjunct1(@iterate.sum_clauses_numseg())]),
            ),
            t565,
          ),
          t566,
        ),
        t567,
      ),
      t568,
    ),
    t569,
  )
  let t571 = (
    @term_syntax.parse_term("sum(op_dot_dot(0, 0), (i : Num) => (c : (Num) -> Real)(i) * pow((x : Real), i)) == c(0) && sum(op_dot_dot(0, SUC((n : Num))), (i : Num) => c(i) * pow(x, i)) == c(0) + x * sum(op_dot_dot(0, n), (i : Num) => c(i + 1) * pow(x, i))"),
    t570,
  )
  let (horner_0, horner_s) = @bool.conj_pair(
    (fn(
      x564 : (
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
      @tactics.prove(x564.0, x564.1)
    })(t571),
  )
  let conv_0 : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x572 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x572
      },
      @list.List([horner_0]),
    ),
    @calc_num.num_reduce_conv,
  )
  let t582 = @simp.gen_rewrite_conv(
    fn(
      x579 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s580 = @equal.top_depth_conv(x579)
      fn(x581 : @kernel.Term) -> @kernel.Thm raise { s580(x581) }
    },
    @list.List([@equal.gsym(@arith.add_assoc())]),
  )
  let t578 = @simp.gen_rewrite_conv(
    fn(
      x575 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s576 = @equal.once_depth_conv(x575)
      fn(x577 : @kernel.Term) -> @kernel.Thm raise { s576(x577) }
    },
    @list.List([@arith.left_add_distrib()]),
  )
  let t574 = @simp.gen_rewrite_conv(
    fn(
      x573 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x573
    },
    @list.List([horner_s]),
  )
  let conv_s : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.land_conv(@equal.rand_conv(@calc_num.num_conv)),
          t574,
        ),
        t578,
      ),
      t582,
    ),
    @calc_num.num_reduce_conv,
  )
  fn conv(x583 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x583
    @equal.thenc(conv_0, @calc_rat.real_rat_reduce_conv)(tm) catch {
      Failure(_) =>
        @equal.thenc(
          @equal.thenc(conv_s, @equal.rand_conv(@equal.rand_conv(conv))),
          @calc_rat.real_rat_reduce_conv,
        )(tm)
      e => raise e
    }
  }
  horner_sum_conv_c.set(conv)
}

///|
let horner_sum_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "HORNER_SUM_CONV",
)

///|
/// `HORNER_SUM_CONV`
pub fn horner_sum_conv(x : @kernel.Term) -> @kernel.Thm raise {
  horner_sum_conv_c.get()(x)
}

///|
/// SUBSEQUENCE_STEPWISE
fn step_125() -> Unit raise {
  let t586 = @simp.asm_rewrite_tac(@list.List([]))
  let t585 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t584 = @simp.simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)"))]),
  )
  let t587 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t584,
          ),
          @tactics.disch_tac,
        ),
        t585,
      ),
      t586,
    ),
    @int.arith_tac,
  )
  subsequence_stepwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) == (∀ n : Num, r(n) < r(SUC(n)))"),
      t587,
    ),
  )
}

///|
let subsequence_stepwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBSEQUENCE_STEPWISE",
)

///|
/// `SUBSEQUENCE_STEPWISE`
pub fn subsequence_stepwise() -> @kernel.Thm {
  subsequence_stepwise_c.get()
}

///|
/// SUBSEQUENCE_IMP_INJECTIVE
fn step_126() -> Unit raise {
  let t589 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t588 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t590 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
      t588,
    ),
    t589,
  )
  subsequence_imp_injective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) → (∀ m : Num, ∀ n : Num, (r(m) == r(n)) == (m == n))"),
      t590,
    ),
  )
}

///|
let subsequence_imp_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBSEQUENCE_IMP_INJECTIVE",
)

///|
/// `SUBSEQUENCE_IMP_INJECTIVE`
pub fn subsequence_imp_injective() -> @kernel.Thm {
  subsequence_imp_injective_c.get()
}

///|
/// MONOTONE_BIGGER
fn step_127() -> Unit raise {
  let t591 = @meson.asm_meson_tac(
    @list.List([
      @arith.le_0(),
      @int.arith_rule(@term_syntax.parse_term("(n : Num) <= (m : Num) && m < (p : Num) → SUC(n) <= p")),
      @arith.lt(),
    ]),
  )
  let t592 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
      @nums.induct_tac,
    ),
    t591,
  )
  monotone_bigger_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) → (∀ n : Num, n <= r(n))"),
      t592,
    ),
  )
}

///|
let monotone_bigger_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOTONE_BIGGER",
)

///|
/// `MONOTONE_BIGGER`
pub fn monotone_bigger() -> @kernel.Thm {
  monotone_bigger_c.get()
}

///|
/// INFINITE_ENUMERATE_WEAK
fn step_128() -> Unit raise {
  let t599 = @sets.set_tac(@list.List([]))
  let t598 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t596 = @drule.match_mp(@sets.infinite_enumerate())
  let t600 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.disch_then(fn(
          x597 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x593 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s594 = @tactics.mp_tac(x593)
            fn(
              x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s594(x595)
            }
          })(t596(x597))
        }),
      ),
      t598,
    ),
    t599,
  )
  infinite_enumerate_weak_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, INFINITE(s) → (∃ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && (∀ n : Num, IN(r(n), s)))"),
      t600,
    ),
  )
}

///|
let infinite_enumerate_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_ENUMERATE_WEAK",
)

///|
/// `INFINITE_ENUMERATE_WEAK`
pub fn infinite_enumerate_weak() -> @kernel.Thm {
  infinite_enumerate_weak_c.get()
}

///|
/// INFINITE_ENUMERATE_EQ_ALT
fn step_129() -> Unit raise {
  let t607 = @meson.asm_meson_tac(@list.List([subsequence_imp_injective()]))
  let t606 = @simp.rewrite_tac(
    @list.List([@sets.num_infinite(), @sets.in_univ()]),
  )
  let t605 = @tactics.match_mp_tac(@sets.infinite_image())
  let t604 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image()]),
  )
  let t603 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((r : (Num) -> Num), UNIV)"),
  )
  let t602 = @tactics.match_mp_tac(@sets.infinite_superset())
  let t601 = @simp.rewrite_tac(@list.List([infinite_enumerate_weak()]))
  let t608 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
                  t601,
                ),
                @tactics.strip_tac,
              ),
              t602,
            ),
            t603,
          ),
          t604,
        ),
        t605,
      ),
      t606,
    ),
    t607,
  )
  infinite_enumerate_eq_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, INFINITE(s) == (∃ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && (∀ n : Num, IN(r(n), s)))"),
      t608,
    ),
  )
}

///|
let infinite_enumerate_eq_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_ENUMERATE_EQ_ALT",
)

///|
/// `INFINITE_ENUMERATE_EQ_ALT`
pub fn infinite_enumerate_eq_alt() -> @kernel.Thm {
  infinite_enumerate_eq_alt_c.get()
}

///|
/// MONOTONE_SUBSEQUENCE
fn step_130() -> Unit raise {
  let t642 = @meson.asm_meson_tac(
    @list.List([
      @realarith.real_lt_refl(),
      @arith.lt_le(),
      @arith.lte_trans(),
      @realax.real_le_refl(),
      @realarith.real_lt_le(),
      @realax.real_le_trans(),
      @arith.lt(),
    ]),
  )
  let t641 = @simp.asm_rewrite_tac(@list.List([]))
  let t640 = @tactics.try_tac(@tactics.strip_tac)
  let t639 = @simp.asm_rewrite_tac(@list.List([@arith.lt(), @arith.le()]))
  let t638 = @tactics.try_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.gen_tac,
        @tactics.then_tac(@tactics.disj1_tac, @tactics.gen_tac),
      ]),
    ),
  )
  let t643 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.subgoal_then(
                @term_syntax.parse_term("∀ n : Num, (N : Num) < (r : (Num) -> Num)(n)"),
                fn(
                  x635 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s636 = @tactics.assume_tac(x635)
                  fn(
                    x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s636(x637)
                  }
                },
              ),
              t638,
            ),
            @nums.induct_tac,
          ),
          t639,
        ),
        t640,
      ),
      t641,
    ),
    t642,
  )
  let t634 = @meson.asm_meson_tac(
    @list.List([
      @realax.real_le_trans(),
      @realax.real_le_refl(),
      @arith.lt_imp_le(),
      @arith.lt_trans(),
    ]),
  )
  let t633 = @simp.asm_rewrite_tac(@list.List([@arith.lt(), @arith.le()]))
  let t632 = @tactics.try_tac(@tactics.disj2_tac)
  let t631 = @tactics.try_tac(@tactics.conj_tac)
  let t644 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.subgoal_then(
                  @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (r : (Num) -> Num)(n) <= m → (s : (Num) -> Real)(m) <= s(r(n))"),
                  fn(
                    x628 : @kernel.Thm,
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
                    let s629 = @tactics.assume_tac(x628)
                    fn(
                      x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s629(x630)
                    }
                  },
                ),
                t631,
              ),
              t632,
            ),
            @tactics.gen_tac,
          ),
          @nums.induct_tac,
        ),
        t633,
      ),
      t634,
    ),
    t643,
  ])
  let t627 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t624 = @term_syntax.parse_term("(r : (Num) -> Num)(0) == (next : (Num) -> Num)(SUC((N : Num))) && (∀ n : Num, r(SUC(n)) == next(r(n)))")
  let t625 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t626 = (fn(
    x621 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s622 = @tactics.mp_tac(x621)
    fn(
      x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s622(x623)
    }
  })(t625(t624))
  let t620 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(next : (Num) -> Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t618 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(
      x615 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s616 = @tactics.mp_tac(x615)
      fn(
        x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s616(x617)
      }
    }),
  )
  let t619 = @list.List([@simp.abbrev_tac(@term_syntax.parse_term("(N : Num) == 0")), t618])
  let t614 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_or_exists_thm(),
      @class.skolem_thm(),
      @real.real_not_le(),
      @realarith.real_not_lt(),
    ]),
  )
  let t613 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @class.not_exists_thm(),
      @class.not_imp(),
      @class.de_morgan_thm(),
    ]),
  )
  let t612 = @tactics.pop_assum(fn(
    x609 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s610 = @tactics.mp_tac(x609)
    fn(
      x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s610(x611)
    }
  })
  let t645 = @tactics.thenl(
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
                        @tactics.gen_tac,
                        @class.asm_cases_tac(
                          @term_syntax.parse_term("∀ n : Num, ∃ p : Num, n < p && (∀ m : Num, p <= m → (s : (Num) -> Real)(m) <= s(p))"),
                        ),
                      ),
                      t612,
                    ),
                    t613,
                  ),
                  t614,
                ),
                t619,
              ),
              t620,
            ),
            t626,
          ),
          t627,
        ),
        @tactics.gen_tac,
      ),
      @tactics.strip_tac,
    ),
    t644,
  )
  monotone_subsequence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Real, ∃ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && ((∀ m : Num, ∀ n : Num, m <= n → s(r(m)) <= s(r(n))) || (∀ m : Num, ∀ n : Num, m <= n → s(r(n)) <= s(r(m))))"),
      t645,
    ),
  )
}

///|
let monotone_subsequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOTONE_SUBSEQUENCE",
)

///|
/// `MONOTONE_SUBSEQUENCE`
pub fn monotone_subsequence() -> @kernel.Thm {
  monotone_subsequence_c.get()
}

///|
/// CONVERGENT_BOUNDED_INCREASING
fn step_131() -> Unit raise {
  let t659 = @calc_rat.real_arith(
    @term_syntax.parse_term("(x : Real) <= (y : Real) && y <= (l : Real) && !(x <= l - (e : Real)) → abs(y - l) < e"),
  )
  let t660 = @meson.asm_meson_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (e : Real) → !((l : Real) <= l - e)")),
      t659,
    ]),
  )
  let t655 = @term_syntax.parse_term("(l : Real) - (e : Real)")
  let t658 = @tactics.first_x_assum(fn(
    x657 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s653 = @tactics.mp_tac(x652)
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
    })(((x656 : @kernel.Thm) => @bool.spec(t655, x656))(x657))
  })
  let t651 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t650 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : Real)"))
  let t649 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t648 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (b : Real) → x <= b")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t647 = @simp.rewrite_tac(@list.List([]))
  let t646 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(x : Real) => ∃ n : Num, (s : (Num) -> Real)(n) == x"),
      @realax.real_complete(),
    ),
  )
  let t661 = @tactics.then_tac(
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
                        t646,
                      ),
                      t647,
                    ),
                    @tactics.ants_tac,
                  ),
                  t648,
                ),
                t649,
              ),
              t650,
            ),
            @tactics.strip_tac,
          ),
          t651,
        ),
        @tactics.strip_tac,
      ),
      t658,
    ),
    t660,
  )
  convergent_bounded_increasing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Real, ∀ b : Real, (∀ m : Num, ∀ n : Num, m <= n → s(m) <= s(n)) && (∀ n : Num, abs(s(n)) <= b) → (∃ l : Real, ∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(s(n) - l) < e))"),
      t661,
    ),
  )
}

///|
let convergent_bounded_increasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONVERGENT_BOUNDED_INCREASING",
)

///|
/// `CONVERGENT_BOUNDED_INCREASING`
pub fn convergent_bounded_increasing() -> @kernel.Thm {
  convergent_bounded_increasing_c.get()
}

///|
/// CONVERGENT_BOUNDED_MONOTONE
fn step_132() -> Unit raise {
  let t665 = @meson.asm_meson_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - -(l : Real)) == abs(-x - l)")),
    ]),
  )
  let t664 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_le_neg2(), @calc_int.real_abs_neg()]),
  )
  let t663 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(n : Num) => -(s : (Num) -> Real)(n)"),
      convergent_bounded_increasing(),
    ),
  )
  let t662 = @list.List([
    @meson.asm_meson_tac(@list.List([convergent_bounded_increasing()])),
    @tactics.all_tac,
  ])
  let t666 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t662),
        t663,
      ),
      t664,
    ),
    t665,
  )
  convergent_bounded_monotone_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Real, ∀ b : Real, (∀ n : Num, abs(s(n)) <= b) && ((∀ m : Num, ∀ n : Num, m <= n → s(m) <= s(n)) || (∀ m : Num, ∀ n : Num, m <= n → s(n) <= s(m))) → (∃ l : Real, ∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(s(n) - l) < e))"),
      t666,
    ),
  )
}

///|
let convergent_bounded_monotone_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONVERGENT_BOUNDED_MONOTONE",
)

///|
/// `CONVERGENT_BOUNDED_MONOTONE`
pub fn convergent_bounded_monotone() -> @kernel.Thm {
  convergent_bounded_monotone_c.get()
}

///|
/// STRICTLY_INCREASING_ALT
fn step_133() -> Unit raise {
  let t667 = @metis.metis_tac(
    @list.List([
      @real.real_lt_total(),
      @realarith.real_le_lt(),
      @real.real_lt_antisym(),
    ]),
  )
  strictly_increasing_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (Real) -> Real, (∀ x : Real, ∀ y : Real, P(x) && P(y) && x < y → f(x) < f(y)) == ((∀ x : Real, ∀ y : Real, P(x) && P(y) && x <= y → f(x) <= f(y)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) && f(x) == f(y) → x == y))"),
      t667,
    ),
  )
}

///|
let strictly_increasing_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_INCREASING_ALT",
)

///|
/// `STRICTLY_INCREASING_ALT`
pub fn strictly_increasing_alt() -> @kernel.Thm {
  strictly_increasing_alt_c.get()
}

///|
/// STRICTLY_DECREASING_ALT
fn step_134() -> Unit raise {
  let t668 = @metis.metis_tac(
    @list.List([
      @real.real_lt_total(),
      @realarith.real_le_lt(),
      @real.real_lt_antisym(),
    ]),
  )
  strictly_decreasing_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (Real) -> Real, (∀ x : Real, ∀ y : Real, P(x) && P(y) && x < y → f(y) < f(x)) == ((∀ x : Real, ∀ y : Real, P(x) && P(y) && x <= y → f(y) <= f(x)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) && f(x) == f(y) → x == y))"),
      t668,
    ),
  )
}

///|
let strictly_decreasing_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_DECREASING_ALT",
)

///|
/// `STRICTLY_DECREASING_ALT`
pub fn strictly_decreasing_alt() -> @kernel.Thm {
  strictly_decreasing_alt_c.get()
}

///|
/// REAL_NON_MONOTONE
fn step_135() -> Unit raise {
  let t721 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x718 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s719 = @tactics.subst_all_tac(x718)
      fn(
        x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s719(x720)
      }
    }),
  )
  let t717 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t716 = @class.asm_cases_tac(@term_syntax.parse_term("(v : Real) == (z : Real)"))
  let t715 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t714 = @class.asm_cases_tac(@term_syntax.parse_term("(v : Real) == (w : Real)"))
  let t713 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t712 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == (z : Real)"))
  let t711 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t710 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == (w : Real)"))
  let t709 = @tactics.try_tac(@calc_rat.real_arith_tac)
  let t708 = @tactics.repeat_tac(@tactics.conj_tac)
  let t707 = @tactics.conv_tac(@canon.cnf_conv)
  let t706 = @tactics.conv_tac(@canon.nnfc_conv)
  let t705 = @tactics.pop_assum_list(fn(
    x704 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x702 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
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
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(
        ((x701 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x701))(
          x702,
        ),
      )
    })(
      (fn(x703 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        @lib.rev(x703)
      })(x704),
    )
  })
  let t697 = @simp.asm_simp_tac(
    @list.List([
      @realarith.real_lt_refl(),
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → !(b < a)")),
    ]),
  )
  let t693 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(P : (Real) -> Bool)((v : Real)) || P((z : Real)) → (∃ x : Real, P(x))"),
    ),
  )
  let t692 = @simp.asm_rewrite_tac(
    @list.List([@theorems.or_exists_thm(), @realarith.real_lt_refl()]),
  )
  let t694 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(P : (_, _) -> Bool)((w : _), (u : _)) || P(w, (v : _)) || P(w, (z : _)) → (∃ x : _, ∃ y : _, P(x, y))"),
        ),
      ),
      t692,
    ),
    t693,
  )
  let t691 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(P : (Real) -> Bool)((v : Real)) || P((z : Real)) → (∃ x : Real, P(x))"),
    ),
  )
  let t690 = @simp.asm_rewrite_tac(
    @list.List([@theorems.or_exists_thm(), @realarith.real_lt_refl()]),
  )
  let t695 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(P : (_, _) -> Bool)((u : _), (v : _)) || P(u, (w : _)) || P(u, (z : _)) → (∃ x : _, ∃ y : _, P(x, y))"),
        ),
      ),
      t690,
    ),
    t691,
  )
  let t689 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(P : (_, _, _) -> Bool)((w : _), (v : _), (z : _)) || P(w, z, v) → (∃ x : _, ∃ y : _, ∃ z : _, P(x, y, z))"),
    ),
  )
  let t696 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s687 = @tactics.subst_all_tac(x686)
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      }),
      t689,
    ),
    t695,
    t694,
  ])
  let t684 = @calc_rat.real_arith(
    @term_syntax.parse_term("(u : Real) == (w : Real) || u < w || w < u"),
  )
  let t685 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
    x681 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s682 = @tactics.assume_tac(x681)
    fn(
      x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s682(x683)
    }
  })(t684)
  let t679 = @term_syntax.parse_term("(z : Real)")
  let t680 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(w : Real)"), t679]),
  )
  let t677 = @term_syntax.parse_term("(v : Real)")
  let t678 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(u : Real)"), t677]),
  )
  let t675 = @meson.meson(
    @list.List([@realarith.real_lt_le()]),
    @term_syntax.parse_term("((x : Real) <= (y : Real) && (f : (Real) -> Real)(y) < f(x)) == (x < y && f(y) < f(x)) && (x <= y && f(x) < f(y)) == (x < y && f(x) < f(y))"),
  )
  let t676 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.conj_assoc()), @real.real_not_le(), t675]),
  )
  let t674 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t673 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t672 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @theorems.left_imp_exists_thm(),
      @class.not_imp(),
      @class.de_morgan_thm(),
    ]),
  )
  let t671 = @simp.gen_rewrite_tac(
    fn(
      x670 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x670
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t669 = @list.List([
    @meson.meson_tac(
      @list.List([@realarith.real_lt_imp_le(), @real.real_let_antisym()]),
    ),
    @tactics.all_tac,
  ])
  let t722 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
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
                                                          @tactics.then_tac(
                                                            @tactics.repeat_tac(
                                                              @tactics.strip_tac,
                                                            ),
                                                            @tactics.eq_tac,
                                                          ),
                                                          t669,
                                                        ),
                                                        t671,
                                                      ),
                                                      t672,
                                                    ),
                                                    t673,
                                                  ),
                                                  t674,
                                                ),
                                                t676,
                                              ),
                                              t678,
                                            ),
                                            @tactics.strip_tac,
                                          ),
                                          t680,
                                        ),
                                        @tactics.strip_tac,
                                      ),
                                      t685,
                                    ),
                                    t696,
                                  ),
                                  t697,
                                ),
                                t705,
                              ),
                              t706,
                            ),
                            t707,
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
              ),
              t714,
            ),
            t715,
          ),
          t716,
        ),
        t717,
      ),
      t721,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  real_non_monotone_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (Real) -> Real, ((∀ x : Real, ∀ y : Real, P(x) && P(y) && x <= y → f(x) <= f(y)) || (∀ x : Real, ∀ y : Real, P(x) && P(y) && x <= y → f(y) <= f(x))) == !(∃ x : Real, ∃ y : Real, ∃ z : Real, P(x) && P(y) && P(z) && x < y && y < z && (f(x) < f(y) && f(z) < f(y) || f(y) < f(x) && f(y) < f(z)))"),
      t722,
    ),
  )
}

///|
let real_non_monotone_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NON_MONOTONE",
)

///|
/// `REAL_NON_MONOTONE`
pub fn real_non_monotone() -> @kernel.Thm {
  real_non_monotone_c.get()
}

///|
/// SUBSEQUENCE_DIAGONALIZATION_LEMMA
fn step_136() -> Unit raise {
  let t824 = @meson.asm_meson_tac(@list.List([]))
  let t823 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t822 = @tactics.match_mp_tac(monotone_bigger())
  let t820 = @term_syntax.parse_term("(i : Num)")
  let t821 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t820)
  let t819 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@arith.le_trans()),
  )
  let t818 = @simp.rewrite_tac(@list.List([]))
  let t817 = @tactics.match_mp_tac(@theorems.mono_and())
  let t816 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t815 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t811 = @term_syntax.parse_term("(kk : (Num, (Num) -> A, Num) -> Num)(SUC((p : Num) + (d : Num)), o((r : (Num) -> A), (rr : (Num, Num) -> Num)(p + d)), (i : Num))")
  let t814 = @tactics.remove_then("+", fn(
    x813 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x808 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s809 = @tactics.mp_tac(x808)
      fn(
        x810 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s809(x810)
      }
    })(((x812 : @kernel.Thm) => @bool.spec(t811, x812))(x813))
  })
  let t807 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t806 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t805 = @tactics.disch_then(fn(
    x802 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s803 = ((x801 : @kernel.Thm) => @tactics.label_tac("+", x801))(x802)
    fn(
      x804 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s803(x804)
    }
  })
  let t800 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t799 = @list.List([
    @meson.meson_tac(@list.List([@arith.le_refl()])),
    @tactics.all_tac,
  ])
  let t798 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t797 = @tactics.match_mp_tac(@nums.num_induction())
  let t796 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t795 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ p : Num, ∀ d : Num, ∀ i : Num, ∃ j : Num, i <= j && (rr : (Num, Num) -> Num)(p + d, i) == rr(p, j)"),
    fn(
      x793 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x793
      @meson.meson_tac(@list.List([@arith.le_exists(), th]))
    },
  )
  let t791 = @meson.asm_meson_tac(@list.List([]))
  let t790 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num)"))
  let t789 = @simp.asm_rewrite_tac(@list.List([]))
  let t788 = @tactics.exists_tac(@term_syntax.parse_term("(rr : (Num, Num) -> Num)((i : Num))"))
  let t787 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t792 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")),
              t787,
            ),
            t788,
          ),
          t789,
        ),
        t790,
      ),
      t791,
    ),
  ])
  let t786 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ i : Num, n <= m → (∃ j : Num, i <= j && (rr : (Num, Num) -> Num)(m, i) == rr(n, j))"),
    fn(
      x783 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s784 = @tactics.assume_tac(x783)
      fn(
        x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s784(x785)
      }
    },
  )
  let t781 = @meson.asm_meson_tac(@list.List([@arith.lt_imp_le()]))
  let t780 = @tactics.exists_tac(@term_syntax.parse_term("(rr : (Num, Num) -> Num)((n : Num), (m : Num))"))
  let t779 = @tactics.match_mp_tac(@arith.let_trans())
  let t778 = @term_syntax.parse_term("(n : Num)")
  let t782 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.map_every(
              @tactics.x_gen_tac,
              @list.List([@term_syntax.parse_term("(m : Num)"), t778]),
            ),
            @tactics.disch_tac,
          ),
          t779,
        ),
        t780,
      ),
      t781,
    ),
    @tactics.all_tac,
  ])
  let t776 = @simp.asm_simp_tac(@list.List([]))
  let t775 = @tactics.match_mp_tac(monotone_bigger())
  let t773 = @term_syntax.parse_term("(n : Num)")
  let t774 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t773)
  let t769 = @term_syntax.parse_term("(i : Num) + (d : Num)")
  let t767 = @drule.match_mp(
    @meson.meson(
      @list.List([@arith.le_lt()]),
      @term_syntax.parse_term("∀ f : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → f(m) < f(n)) → (∀ m : Num, ∀ n : Num, m <= n → f(m) <= f(n))"),
    ),
  )
  let t772 = @tactics.first_assum(fn(
    x771 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      @tactics.match_mp_tac(t767(x768))
    })(((x770 : @kernel.Thm) => @bool.spec(t769, x770))(x771))
  })
  let t766 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t763 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@arith.le_trans()),
  )
  let t765 = @tactics.first_assum(fn(
    x764 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t763(x764))
  })
  let t762 = @simp.asm_rewrite_tac(@list.List([]))
  let t761 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.le_refl()]),
  )
  let t760 = @simp.simp_tac(@list.List([@theorems.forall_unwind_thm2()]))
  let t759 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t757 = @term_syntax.parse_term("(j : Num)")
  let t758 = @tactics.spec_tac(@term_syntax.parse_term("(j : Num)"), t757)
  let t756 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t755 = @simp.gen_rewrite_tac(
    fn(
      x752 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s753 = @equal.land_conv(x752)
      fn(x754 : @kernel.Term) -> @kernel.Thm raise { s753(x754) }
    },
    @list.List([@arith.le_exists()]),
  )
  let t777 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
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
                                t755,
                              ),
                              t756,
                            ),
                            t758,
                          ),
                          t759,
                        ),
                        t760,
                      ),
                      @nums.induct_tac,
                    ),
                    t761,
                  ),
                  t762,
                ),
                t765,
              ),
              t766,
            ),
            t772,
          ),
          t774,
        ),
        t775,
      ),
      t776,
    ),
    @tactics.all_tac,
  ])
  let t751 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, ∀ j : Num, ∀ n : Num, i <= j → (rr : (Num, Num) -> Num)(i, n) <= rr(j, n)"),
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
  )
  let t746 = @meson.asm_meson_tac(@list.List([]))
  let t745 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t744 = @simp.asm_rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t747 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
            @nums.induct_tac,
          ),
          t744,
        ),
        t745,
      ),
      t746,
    ),
    @tactics.all_tac,
  ])
  let t743 = @tactics.subgoal_then(
    @term_syntax.parse_term("(∀ i : Num, ∀ m : Num, ∀ n : Num, m < n → (rr : (Num, Num) -> Num)(i, m) < rr(i, n)) && (∀ i : Num, (P : (Num, (Num) -> A) -> Bool)(i, o((r : (Num) -> A), rr(i))))"),
    @tactics.strip_assume_tac,
  )
  let t742 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t741 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => (rr : (Num, Num) -> Num)(n, n)"),
  )
  let t738 = @term_syntax.parse_term("(rr : (Num, Num) -> Num)(0) == (kk : (Num, (Num) -> A, Num) -> Num)(0, (r : (Num) -> A)) && (∀ n : Num, rr(SUC(n)) == o(rr(n), kk(SUC(n), o(r, rr(n)))))")
  let t739 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t740 = @tactics.strip_assume_tac(t739(t738))
  let t737 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (Num) -> A)"))
  let t736 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(kk : (Num, (Num) -> A, Num) -> Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t735 = @simp.rewrite_tac(
    @list.List([
      @theorems.forall_and_thm(),
      @class.taut(
        @term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"),
      ),
    ]),
  )
  let t734 = @simp.gen_rewrite_tac(
    fn(
      x733 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x727 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s728 = @equal.land_conv(x727)
        fn(x729 : @kernel.Term) -> @kernel.Thm raise { s728(x729) }
      })(
        (fn(
          x730 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s731 = @equal.top_depth_conv(x730)
          fn(x732 : @kernel.Term) -> @kernel.Thm raise { s731(x732) }
        })(x733),
      )
    },
    @list.List([@class.skolem_thm()]),
  )
  let t726 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t825 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                                                                @tactics.then_tac(
                                                                  @tactics.then_tac(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.then_tac(
                                                                          @tactics.repeat_tac(
                                                                            @tactics.gen_tac,
                                                                          ),
                                                                          t726,
                                                                        ),
                                                                        t734,
                                                                      ),
                                                                      t735,
                                                                    ),
                                                                    t736,
                                                                  ),
                                                                  t737,
                                                                ),
                                                                t740,
                                                              ),
                                                              t741,
                                                            ),
                                                            t742,
                                                          ),
                                                          t743,
                                                        ),
                                                        t747,
                                                      ),
                                                      t751,
                                                    ),
                                                    t777,
                                                  ),
                                                  @tactics.conj_tac,
                                                ),
                                                t782,
                                              ),
                                              t786,
                                            ),
                                            t792,
                                          ),
                                          t795,
                                        ),
                                        t796,
                                      ),
                                      t797,
                                    ),
                                    t798,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t799,
                              ),
                              t800,
                            ),
                            t805,
                          ),
                          t806,
                        ),
                        t807,
                      ),
                      t814,
                    ),
                    t815,
                  ),
                  t816,
                ),
                t817,
              ),
              t818,
            ),
            t819,
          ),
          t821,
        ),
        t822,
      ),
      t823,
    ),
    t824,
  )
  subsequence_diagonalization_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, (Num) -> A) -> Bool, (∀ i : Num, ∀ r : (Num) -> A, ∃ k : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → k(m) < k(n)) && P(i, o(r, k))) && (∀ i : Num, ∀ r : (Num) -> A, ∀ k1 : (Num) -> Num, ∀ k2 : (Num) -> Num, ∀ N : Num, P(i, o(r, k1)) && (∀ j : Num, N <= j → (∃ j' : Num, j <= j' && k2(j) == k1(j'))) → P(i, o(r, k2))) → (∀ r : (Num) -> A, ∃ k : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → k(m) < k(n)) && (∀ i : Num, P(i, o(r, k))))"),
      t825,
    ),
  )
}

///|
let subsequence_diagonalization_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBSEQUENCE_DIAGONALIZATION_LEMMA",
)

///|
/// `SUBSEQUENCE_DIAGONALIZATION_LEMMA`
pub fn subsequence_diagonalization_lemma() -> @kernel.Thm {
  subsequence_diagonalization_lemma_c.get()
}

///|
/// COUNTABLE_INTEGER
fn step_137() -> Unit raise {
  let t829 = @simp.rewrite_tac(
    @list.List([@sets.in_(), @floor.integer_cases()]),
  )
  let t828 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_union(),
      @sets.in_image(),
      @sets.in_univ(),
    ]),
  )
  let t827 = @simp.simp_tac(
    @list.List([
      @card.countable_image(),
      @card.countable_union(),
      @card.num_countable(),
    ]),
  )
  let t826 = @tactics.exists_tac(
    @term_syntax.parse_term("UNION(IMAGE((n : Num) => real_of_num(n), UNIV), IMAGE((n : Num) => -real_of_num(n), UNIV))"),
  )
  let t830 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@card.countable_subset()), t826),
        t827,
      ),
      t828,
    ),
    t829,
  )
  countable_integer_c.set(
    @tactics.prove(@term_syntax.parse_term("COUNTABLE(integer)"), t830),
  )
}

///|
let countable_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTEGER",
)

///|
/// `COUNTABLE_INTEGER`
pub fn countable_integer() -> @kernel.Thm {
  countable_integer_c.get()
}

///|
/// CARD_EQ_INTEGER
fn step_138() -> Unit raise {
  let t835 = @simp.rewrite_tac(
    @list.List([@sets.in_(), @floor.integer_closed()]),
  )
  let t834 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @realax.real_of_num_eq()]),
  )
  let t833 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num"))
  let t832 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t831 = @equal.gsym(@card.countable_alt())
  let t836 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @equal.gsym(@card.card_le_antisym()),
              t831,
              countable_integer(),
            ]),
          ),
          t832,
        ),
        t833,
      ),
      t834,
    ),
    t835,
  )
  card_eq_integer_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : ((Real) -> Bool, (Num) -> Bool) -> Bool)(integer, (UNIV : (Num) -> Bool))"), t836),
  )
}

///|
let card_eq_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_INTEGER",
)

///|
/// `CARD_EQ_INTEGER`
pub fn card_eq_integer() -> @kernel.Thm {
  card_eq_integer_c.get()
}

///|
/// COUNTABLE_RATIONAL
fn step_139() -> Unit raise {
  let t841 = @meson.meson_tac(@list.List([]))
  let t840 = @simp.rewrite_tac(@list.List([@floor.rational(), @sets.in_()]))
  let t839 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_image(),
      @pair.exists_pair_thm(),
      @sets.in_cross(),
    ]),
  )
  let t838 = @simp.simp_tac(
    @list.List([
      @card.countable_image(),
      @card.countable_cross(),
      countable_integer(),
    ]),
  )
  let t837 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), x / y)), CROSS(integer, integer))"),
  )
  let t842 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@card.countable_subset()),
            t837,
          ),
          t838,
        ),
        t839,
      ),
      t840,
    ),
    t841,
  )
  countable_rational_c.set(
    @tactics.prove(@term_syntax.parse_term("COUNTABLE(rational)"), t842),
  )
}

///|
let countable_rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_RATIONAL",
)

///|
/// `COUNTABLE_RATIONAL`
pub fn countable_rational() -> @kernel.Thm {
  countable_rational_c.get()
}

///|
/// CARD_EQ_RATIONAL
fn step_140() -> Unit raise {
  let t847 = @simp.rewrite_tac(
    @list.List([@sets.in_(), @floor.rational_closed()]),
  )
  let t846 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @realax.real_of_num_eq()]),
  )
  let t845 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num"))
  let t844 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t843 = @equal.gsym(@card.countable_alt())
  let t848 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @equal.gsym(@card.card_le_antisym()),
              t843,
              countable_rational(),
            ]),
          ),
          t844,
        ),
        t845,
      ),
      t846,
    ),
    t847,
  )
  card_eq_rational_c.set(
    @tactics.prove(@term_syntax.parse_term("(op_eq_us_c : ((Real) -> Bool, (Num) -> Bool) -> Bool)(rational, (UNIV : (Num) -> Bool))"), t848),
  )
}

///|
let card_eq_rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EQ_RATIONAL",
)

///|
/// `CARD_EQ_RATIONAL`
pub fn card_eq_rational() -> @kernel.Thm {
  card_eq_rational_c.get()
}

///|
/// COUNTABLE_INTEGER_COORDINATES
fn step_141() -> Unit raise {
  let t849 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x)} == P")),
      countable_integer(),
    ]),
  )
  let t850 = @tactics.then_tac(
    @tactics.match_mp_tac(@card.countable_cart()),
    t849,
  )
  countable_integer_coordinates_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(COUNTABLE : ((Cart[Real, N]) -> Bool) -> Bool)({(x : Cart[Real, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → integer((op_dollar : (Cart[Real, N], Num) -> Real)(x, i))})"),
      t850,
    ),
  )
}

///|
let countable_integer_coordinates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTEGER_COORDINATES",
)

///|
/// `COUNTABLE_INTEGER_COORDINATES`
pub fn countable_integer_coordinates() -> @kernel.Thm {
  countable_integer_coordinates_c.get()
}

///|
/// COUNTABLE_RATIONAL_COORDINATES
fn step_142() -> Unit raise {
  let t851 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x)} == P")),
      countable_rational(),
    ]),
  )
  let t852 = @tactics.then_tac(
    @tactics.match_mp_tac(@card.countable_cart()),
    t851,
  )
  countable_rational_coordinates_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(COUNTABLE : ((Cart[Real, N]) -> Bool) -> Bool)({(x : Cart[Real, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → rational((op_dollar : (Cart[Real, N], Num) -> Real)(x, i))})"),
      t852,
    ),
  )
}

///|
let countable_rational_coordinates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_RATIONAL_COORDINATES",
)

///|
/// `COUNTABLE_RATIONAL_COORDINATES`
pub fn countable_rational_coordinates() -> @kernel.Thm {
  countable_rational_coordinates_c.get()
}

///|
/// IRRATIONAL_APPROXIMATION
fn step_143() -> Unit raise {
  let t862 = @meson.asm_meson_tac(
    @list.List([
      @floor.rational_closed(),
      @calc_rat.real_arith(@term_syntax.parse_term("(z : Real) == (q : Real) - (q - z)")),
    ]),
  )
  let t861 = @simp.rewrite_tac(@list.List([]))
  let t860 = @tactics.undisch_tac(@term_syntax.parse_term("!rational((z : Real))"))
  let t859 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(q : Real) - (z : Real) - (x : Real) == q - (z + x)")),
    ]),
  )
  let t858 = @tactics.exists_tac(@term_syntax.parse_term("(q : Real) - (z : Real)"))
  let t857 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Real)"))
  let t856 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t855 = @term_syntax.parse_term("(e : Real)")
  let t863 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.mp_tac(
                      @bool.ispecl(
                        @list.List([@term_syntax.parse_term("(z : Real) + (x : Real)"), t855]),
                        @floor.rational_approximation(),
                      ),
                    ),
                    t856,
                  ),
                  t857,
                ),
                @tactics.strip_tac,
              ),
              t858,
            ),
            t859,
          ),
          @tactics.disch_tac,
        ),
        t860,
      ),
      t861,
    ),
    t862,
  )
  let t854 = @meson.meson_tac(
    @list.List([countable_rational(), @card.uncountable_real()]),
  )
  let t864 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @sets.set_rule(@term_syntax.parse_term("!((s : (Real) -> Bool) == UNIV) → (∃ z : Real, !s(z))")),
      ),
      t854,
    ),
    t863,
  ])
  let t853 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ z : Real, !rational(z)"),
    @tactics.strip_assume_tac,
  )
  let t865 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t853),
    t864,
  )
  irrational_approximation_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ y : Real, !rational(y) && abs(y - x) < e)"),
      t865,
    ),
  )
}

///|
let irrational_approximation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_APPROXIMATION",
)

///|
/// `IRRATIONAL_APPROXIMATION`
pub fn irrational_approximation() -> @kernel.Thm {
  irrational_approximation_c.get()
}

///|
/// IRRATIONAL_BETWEEN
fn step_144() -> Unit raise {
  let t868 = @simp.simp_tac(@list.List([]))
  let t869 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t868),
  ])
  let t866 = @term_syntax.parse_term("((b : Real) - (a : Real)) / real_of_num(4)")
  let t867 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("((a : Real) + (b : Real)) / real_of_num(2)"), t866]),
      irrational_approximation(),
    ),
  )
  let t870 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t867),
        @tactics.ants_tac,
      ),
      t869,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  irrational_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, a < b → (∃ q : Real, !rational(q) && a < q && q < b)"),
      t870,
    ),
  )
}

///|
let irrational_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_BETWEEN",
)

///|
/// `IRRATIONAL_BETWEEN`
pub fn irrational_between() -> @kernel.Thm {
  irrational_between_c.get()
}

///|
/// IRRATIONAL_BETWEEN_EQ
fn step_145() -> Unit raise {
  let t871 = @meson.meson_tac(
    @list.List([irrational_between(), @realarith.real_lt_trans()]),
  )
  irrational_between_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (∃ q : Real, !rational(q) && a < q && q < b) == (a < b)"),
      t871,
    ),
  )
}

///|
let irrational_between_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_BETWEEN_EQ",
)

///|
/// `IRRATIONAL_BETWEEN_EQ`
pub fn irrational_between_eq() -> @kernel.Thm {
  irrational_between_eq_c.get()
}

///|
/// IRRATIONAL_APPROXIMATION_STRADDLE
fn step_146() -> Unit raise {
  let t878 = @simp.asm_rewrite_tac(@list.List([]))
  let t877 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@theorems.mono_exists()),
        @tactics.gen_tac,
      ),
      @tactics.strip_tac,
    ),
  ])
  let t875 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t876 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real) + (e : Real) / real_of_num(4)"), t875]),
      irrational_approximation(),
    ),
  )
  let t874 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@theorems.mono_exists()),
        @tactics.gen_tac,
      ),
      @tactics.strip_tac,
    ),
  ])
  let t872 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t873 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real) - (e : Real) / real_of_num(4)"), t872]),
      irrational_approximation(),
    ),
  )
  let t879 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t873),
                @tactics.ants_tac,
              ),
              t874,
            ),
            t876,
          ),
          @tactics.ants_tac,
        ),
        t877,
      ),
      t878,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  irrational_approximation_straddle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ a : Real, ∃ b : Real, !rational(a) && !rational(b) && a < x && x < b && abs(b - a) < e)"),
      t879,
    ),
  )
}

///|
let irrational_approximation_straddle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_APPROXIMATION_STRADDLE",
)

///|
/// `IRRATIONAL_APPROXIMATION_STRADDLE`
pub fn irrational_approximation_straddle() -> @kernel.Thm {
  irrational_approximation_straddle_c.get()
}

///|
/// IRRATIONAL_APPROXIMATION_ABOVE
fn step_147() -> Unit raise {
  let t885 = @simp.asm_rewrite_tac(@list.List([]))
  let t884 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t883 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t882 = @simp.asm_rewrite_tac(@list.List([]))
  let t880 = @term_syntax.parse_term("(e : Real)")
  let t881 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t880]),
      irrational_approximation_straddle(),
    ),
  )
  let t886 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t881),
                t882,
              ),
              t883,
            ),
            t884,
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      t885,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  irrational_approximation_above_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ q : Real, !rational(q) && x < q && q < x + e)"),
      t886,
    ),
  )
}

///|
let irrational_approximation_above_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_APPROXIMATION_ABOVE",
)

///|
/// `IRRATIONAL_APPROXIMATION_ABOVE`
pub fn irrational_approximation_above() -> @kernel.Thm {
  irrational_approximation_above_c.get()
}

///|
/// IRRATIONAL_APPROXIMATION_BELOW
fn step_148() -> Unit raise {
  let t891 = @simp.asm_rewrite_tac(@list.List([]))
  let t890 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t889 = @simp.asm_rewrite_tac(@list.List([]))
  let t887 = @term_syntax.parse_term("(e : Real)")
  let t888 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t887]),
      irrational_approximation_straddle(),
    ),
  )
  let t892 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t888),
              t889,
            ),
            t890,
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      t891,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  irrational_approximation_below_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ q : Real, !rational(q) && x - e < q && q < x)"),
      t892,
    ),
  )
}

///|
let irrational_approximation_below_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRRATIONAL_APPROXIMATION_BELOW",
)

///|
/// `IRRATIONAL_APPROXIMATION_BELOW`
pub fn irrational_approximation_below() -> @kernel.Thm {
  irrational_approximation_below_c.get()
}

///|
/// INFINITE_IRRATIONAL_IN_RANGE
fn step_149() -> Unit raise {
  let t907 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_trans()]))
  let t906 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t905 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (q : (Num) -> Real)(n) < q(m)"),
    fn(
      x903 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x903
      @meson.meson_tac(
        @list.List([@arith.lt_cases(), th, @realarith.real_lt_refl()]),
      )
    },
  )
  let t902 = @simp.rewrite_tac(
    @list.List([@sets.num_infinite(), @sets.in_univ()]),
  )
  let t901 = @tactics.match_mp_tac(@sets.infinite_image())
  let t900 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t899 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((q : (Num) -> Real), UNIV)"),
  )
  let t908 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@sets.infinite_superset()),
                  t899,
                ),
                @tactics.conj_tac,
              ),
              t900,
            ),
            t901,
          ),
          t902,
        ),
        t905,
      ),
      t906,
    ),
    t907,
  )
  let t898 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t897 = @tactics.match_mp_tac(irrational_between())
  let t896 = @tactics.repeat_tac(@tactics.strip_tac)
  let t894 = @equal.gsym(@real.real_lt_min())
  let t895 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.conj_assoc()), t894]),
  )
  let t909 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@arith.dependent_choice()),
            t895,
          ),
          t896,
        ),
        t897,
      ),
      t898,
    ),
    t908,
  ])
  let t893 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ q : (Num) -> Real, (∀ n : Num, !rational(q(n)) && (a : Real) < q(n) && q(n) < (b : Real)) && (∀ n : Num, q(SUC(n)) < q(n))"),
    @tactics.strip_assume_tac,
  )
  let t910 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t893),
    t909,
  )
  infinite_irrational_in_range_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, a < b → INFINITE({(q : Real) | !rational(q) && a < q && q < b})"),
      t910,
    ),
  )
}

///|
let infinite_irrational_in_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_IRRATIONAL_IN_RANGE",
)

///|
/// `INFINITE_IRRATIONAL_IN_RANGE`
pub fn infinite_irrational_in_range() -> @kernel.Thm {
  infinite_irrational_in_range_c.get()
}

///|
/// COUNTABLE_LOCAL_MAXIMA
fn step_150() -> Unit raise {
  let t931 = @tactics.try_tac(@tactics.first_x_assum(@tactics.match_mp_tac))
  let t930 = @tactics.repeat_tac(@tactics.strip_tac)
  let t929 = @tactics.try_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Real)")))
  let t928 = @tactics.repeat_tac(@tactics.strip_tac)
  let t926 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @sets.exists_in_gspec()]),
  )
  let t925 = @tactics.match_mp_tac(@sets.real_sup_unique())
  let t927 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t925),
      t926,
    ),
    @tactics.all_tac,
  ])
  let t924 = @simp.asm_rewrite_tac(@list.List([@sets.in_()]))
  let t923 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : Real)"))
  let t922 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t921 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t920 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t919 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_cross(), @sets.in_elim_pair_thm()]),
  )
  let t917 = @term_syntax.parse_term("(d : Real)")
  let t918 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t917]),
      @floor.rational_approximation_straddle(),
    ),
  )
  let t916 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_inter(), @pair.exists_pair_thm()]),
  )
  let t915 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t914 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t913 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t912 = @simp.simp_tac(
    @list.List([
      @card.countable_inter(),
      @card.countable_cross(),
      countable_rational(),
      @card.countable_image(),
      @sets.subset(),
      @sets.forall_in_gspec(),
    ]),
  )
  let t911 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(fn { (a, b) => sup({(f : (Real) -> Real)((x : Real)) | a <= x && x <= b}) }, INTER(CROSS(rational, rational), {((a : Real), (b : Real)) | ∃ x : Real, a < x && x < b && (∀ x' : Real, a <= x' && x' <= b → f(x') <= f(x))}))"),
  )
  let t932 = @tactics.then_tac(
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
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.gen_tac,
                                              @tactics.match_mp_tac(
                                                @card.countable_subset(),
                                              ),
                                            ),
                                            t911,
                                          ),
                                          t912,
                                        ),
                                        t913,
                                      ),
                                      t914,
                                    ),
                                    t915,
                                  ),
                                  t916,
                                ),
                                t918,
                              ),
                              t919,
                            ),
                            t920,
                          ),
                          t921,
                        ),
                        t922,
                      ),
                      t923,
                    ),
                    @tactics.strip_tac,
                  ),
                  t924,
                ),
                @tactics.conj_tac,
              ),
              t927,
            ),
            t928,
          ),
          t929,
        ),
        t930,
      ),
      t931,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  countable_local_maxima_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Real) -> Real, COUNTABLE({f(x) | x : Real | ∃ d : Real, real_of_num(0) < d && (∀ x' : Real, abs(x' - x) < d → f(x') <= f(x))})"),
      t932,
    ),
  )
}

///|
let countable_local_maxima_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_LOCAL_MAXIMA",
)

///|
/// `COUNTABLE_LOCAL_MAXIMA`
pub fn countable_local_maxima() -> @kernel.Thm {
  countable_local_maxima_c.get()
}

///|
/// COUNTABLE_LOCAL_MINIMA
fn step_151() -> Unit raise {
  let t938 = @simp.simp_tac(@list.List([@real.real_eq_neg2()]))
  let t937 = @tactics.match_mp_tac(@card.countable_image_inj_eq())
  let t936 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t935 = @simp.rewrite_tac(
    @list.List([@trivia.o_thm(), @calc_int.real_le_neg2()]),
  )
  let t934 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.image_o()]))
  let t933 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t939 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.mp_tac(
                  @bool.spec(
                    @term_syntax.parse_term("o(op_minus_minus, (f : (Real) -> Real))"),
                    countable_local_maxima(),
                  ),
                ),
              ),
              t933,
            ),
            t934,
          ),
          t935,
        ),
        t936,
      ),
      t937,
    ),
    t938,
  )
  countable_local_minima_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Real) -> Real, COUNTABLE({f(x) | x : Real | ∃ d : Real, real_of_num(0) < d && (∀ x' : Real, abs(x' - x) < d → f(x) <= f(x'))})"),
      t939,
    ),
  )
}

///|
let countable_local_minima_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_LOCAL_MINIMA",
)

///|
/// `COUNTABLE_LOCAL_MINIMA`
pub fn countable_local_minima() -> @kernel.Thm {
  countable_local_minima_c.get()
}

///|
/// COUNTABLE_STRICT_LOCAL_MAXIMA
fn step_152() -> Unit raise {
  let t957 = @meson.asm_meson_tac(
    @list.List([@real.real_lt_antisym(), @realarith.real_lt_imp_le()]),
  )
  let t956 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t958 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t956),
      @calc_rat.asm_real_arith_tac,
    ),
    t957,
  ])
  let t955 = @simp.asm_rewrite_tac(@list.List([]))
  let t954 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(P : (_) -> Bool)((x : _)) && (∀ x : _, ∀ y : _, P(x) && P(y) → x == y) → x == select((y : _) => P(y)) && (∃ y : _, P(y))"),
    ),
  )
  let t953 = @simp.asm_rewrite_tac(@list.List([@sets.in_()]))
  let t952 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : Real)"))
  let t951 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t950 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t949 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t948 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_cross(), @sets.in_elim_pair_thm()]),
  )
  let t946 = @term_syntax.parse_term("(d : Real)")
  let t947 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t946]),
      @floor.rational_approximation_straddle(),
    ),
  )
  let t945 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @sets.in_inter(), @pair.exists_pair_thm()]),
  )
  let t944 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t943 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t942 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t941 = @simp.simp_tac(
    @list.List([
      @card.countable_inter(),
      @card.countable_cross(),
      countable_rational(),
      @card.countable_image(),
      @sets.subset(),
      @sets.forall_in_gspec(),
    ]),
  )
  let t940 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(fn { (a, b) => select((x : Real) => a < x && x < b && (∀ x' : Real, a <= x' && x' <= b && !(x' == x) → (f : (Real) -> Real)(x') < f(x))) }, INTER(CROSS(rational, rational), {((a : Real), (b : Real)) | ∃ x : Real, a < x && x < b && (∀ x' : Real, a <= x' && x' <= b && !(x' == x) → f(x') < f(x))}))"),
  )
  let t959 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
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
                                        @tactics.match_mp_tac(
                                          @card.countable_subset(),
                                        ),
                                      ),
                                      t940,
                                    ),
                                    t941,
                                  ),
                                  t942,
                                ),
                                t943,
                              ),
                              t944,
                            ),
                            t945,
                          ),
                          t947,
                        ),
                        t948,
                      ),
                      t949,
                    ),
                    t950,
                  ),
                  t951,
                ),
                t952,
              ),
              @tactics.strip_tac,
            ),
            t953,
          ),
          t954,
        ),
        t955,
      ),
      @tactics.conj_tac,
    ),
    t958,
  )
  countable_strict_local_maxima_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Real) -> Real, COUNTABLE({(x : Real) | ∃ d : Real, real_of_num(0) < d && (∀ x' : Real, abs(x' - x) < d && !(x' == x) → f(x') < f(x))})"),
      t959,
    ),
  )
}

///|
let countable_strict_local_maxima_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_STRICT_LOCAL_MAXIMA",
)

///|
/// `COUNTABLE_STRICT_LOCAL_MAXIMA`
pub fn countable_strict_local_maxima() -> @kernel.Thm {
  countable_strict_local_maxima_c.get()
}

///|
/// COUNTABLE_STRICT_LOCAL_MINIMA
fn step_153() -> Unit raise {
  let t965 = @simp.simp_tac(@list.List([@real.real_eq_neg2()]))
  let t964 = @tactics.match_mp_tac(@card.countable_image_inj_eq())
  let t963 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t962 = @simp.rewrite_tac(
    @list.List([@trivia.o_thm(), @real.real_lt_neg2()]),
  )
  let t961 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.image_o()]))
  let t960 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t966 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.mp_tac(
                  @bool.spec(
                    @term_syntax.parse_term("o(op_minus_minus, (f : (Real) -> Real))"),
                    countable_strict_local_maxima(),
                  ),
                ),
              ),
              t960,
            ),
            t961,
          ),
          t962,
        ),
        t963,
      ),
      t964,
    ),
    t965,
  )
  countable_strict_local_minima_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Real) -> Real, COUNTABLE({(x : Real) | ∃ d : Real, real_of_num(0) < d && (∀ x' : Real, abs(x' - x) < d && !(x' == x) → f(x) < f(x'))})"),
      t966,
    ),
  )
}

///|
let countable_strict_local_minima_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_STRICT_LOCAL_MINIMA",
)

///|
/// `COUNTABLE_STRICT_LOCAL_MINIMA`
pub fn countable_strict_local_minima() -> @kernel.Thm {
  countable_strict_local_minima_c.get()
}

///|
/// Multivariate/misc.ml:1346
fn step_154() -> Unit raise {
  @printer.parse_as_infix("relative_to", (14L, "left"))
}

///|
/// relative_to
fn step_155() -> Unit raise {
  relative_to_c.set(
    @define.define_(
      @term_syntax.parse_term("(relative_to : (((_) -> Bool) -> Bool, (_) -> Bool, (_) -> Bool) -> Bool)((P : ((_) -> Bool) -> Bool), (s : (_) -> Bool), (t : (_) -> Bool)) == (∃ u : (_) -> Bool, P(u) && INTER(s, u) == t)"),
    ),
  )
}

///|
let relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("relative_to")

///|
/// `relative_to`
pub fn relative_to() -> @kernel.Thm {
  relative_to_c.get()
}

///|
/// RELATIVE_TO_UNIV
fn step_156() -> Unit raise {
  let t967 = @meson.meson_tac(@list.List([]))
  let t968 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to(), @sets.inter_univ()])),
    t967,
  )
  relative_to_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, relative_to(P, UNIV, s) == P(s)"),
      t968,
    ),
  )
}

///|
let relative_to_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_UNIV",
)

///|
/// `RELATIVE_TO_UNIV`
pub fn relative_to_univ() -> @kernel.Thm {
  relative_to_univ_c.get()
}

///|
/// RELATIVE_TO_IMP_SUBSET
fn step_157() -> Unit raise {
  let t969 = @sets.set_tac(@list.List([]))
  let t970 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to()])),
    t969,
  )
  relative_to_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, relative_to(P, s, t) → SUBSET(t, s)"),
      t970,
    ),
  )
}

///|
let relative_to_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_IMP_SUBSET",
)

///|
/// `RELATIVE_TO_IMP_SUBSET`
pub fn relative_to_imp_subset() -> @kernel.Thm {
  relative_to_imp_subset_c.get()
}

///|
/// FORALL_RELATIVE_TO
fn step_158() -> Unit raise {
  let t971 = @meson.meson_tac(@list.List([]))
  let t972 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to()])),
    t971,
  )
  forall_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (_) -> Bool, relative_to((P : ((_) -> Bool) -> Bool), (u : (_) -> Bool), s) → (Q : ((_) -> Bool) -> Bool)(s)) == (∀ s : (_) -> Bool, P(s) → Q(INTER(u, s)))"),
      t972,
    ),
  )
}

///|
let forall_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_RELATIVE_TO",
)

///|
/// `FORALL_RELATIVE_TO`
pub fn forall_relative_to() -> @kernel.Thm {
  forall_relative_to_c.get()
}

///|
/// RELATIVE_TO_INC
fn step_159() -> Unit raise {
  let t973 = @meson.meson_tac(@list.List([]))
  let t974 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to()])),
    t973,
  )
  relative_to_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, P(s) → relative_to(P, u, INTER(u, s))"),
      t974,
    ),
  )
}

///|
let relative_to_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_INC",
)

///|
/// `RELATIVE_TO_INC`
pub fn relative_to_inc() -> @kernel.Thm {
  relative_to_inc_c.get()
}

///|
/// RELATIVE_TO
fn step_160() -> Unit raise {
  let t976 = @sets.set_tac(@list.List([]))
  let t975 = @simp.rewrite_tac(@list.List([relative_to(), @sets.in_()]))
  let t977 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_inter()]),
      ),
      t975,
    ),
    t976,
  )
  relative_to_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("relative_to((P : ((_) -> Bool) -> Bool), (u : (_) -> Bool)) == {INTER(u, (s : (_) -> Bool)) | P(s)}"),
      t977,
    ),
  )
}

///|
let relative_to_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELATIVE_TO")

///|
/// `RELATIVE_TO`
pub fn relative_to_v1() -> @kernel.Thm {
  relative_to_v1_c.get()
}

///|
/// RELATIVE_TO_RELATIVE_TO
fn step_161() -> Unit raise {
  let t979 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("INTER(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (s' : (_) -> Bool)) == INTER(t, INTER(s, s'))"),
      ),
    ]),
  )
  let t978 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(f : (_) -> _)((x : _)) | {(g : (_) -> _)((y : _)) | (P : (_) -> Bool)(y)}(x)} == {f(g((y : _))) | P(y)}"),
      ),
    ]),
  )
  let t980 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([relative_to_v1()])), t978),
    t979,
  )
  relative_to_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, relative_to(relative_to(P, s), t) == relative_to(P, INTER(s, t))"),
      t980,
    ),
  )
}

///|
let relative_to_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_RELATIVE_TO",
)

///|
/// `RELATIVE_TO_RELATIVE_TO`
pub fn relative_to_relative_to() -> @kernel.Thm {
  relative_to_relative_to_c.get()
}

///|
/// RELATIVE_TO_COMPL
fn step_162() -> Unit raise {
  let t987 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t986 = @simp.rewrite_tac(@list.List([@sets.compl_compl()]))
  let t985 = @simp.gen_rewrite_tac(
    fn(
      x982 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s983 = @equal.rand_conv(x982)
      fn(x984 : @kernel.Term) -> @kernel.Thm raise { s983(x984) }
    },
    @list.List([@equal.gsym(exists_diff())]),
  )
  let t981 = @simp.rewrite_tac(@list.List([relative_to()]))
  let t988 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t981),
            t985,
          ),
          t986,
        ),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    t987,
  )
  relative_to_compl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, ∀ s : (A) -> Bool, SUBSET(s, u) → relative_to(P, u, DIFF(u, s)) == relative_to((c : (A) -> Bool) => P(DIFF(UNIV, c)), u, s)"),
      t988,
    ),
  )
}

///|
let relative_to_compl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_COMPL",
)

///|
/// `RELATIVE_TO_COMPL`
pub fn relative_to_compl() -> @kernel.Thm {
  relative_to_compl_c.get()
}

///|
/// RELATIVE_TO_SUBSET
fn step_163() -> Unit raise {
  let t991 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t990 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t989 = @simp.rewrite_tac(@list.List([relative_to()]))
  let t992 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t989),
      t990,
    ),
    t991,
  )
  relative_to_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && P(s) → relative_to(P, t, s)"),
      t992,
    ),
  )
}

///|
let relative_to_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_SUBSET",
)

///|
/// `RELATIVE_TO_SUBSET`
pub fn relative_to_subset() -> @kernel.Thm {
  relative_to_subset_c.get()
}

///|
/// RELATIVE_TO_SUBSET_TRANS
fn step_164() -> Unit raise {
  let t999 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t998 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t997 = @simp.rewrite_tac(@list.List([relative_to()]))
  let t996 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s994 = @tactics.mp_tac(x993)
        fn(
          x995 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s994(x995)
        }
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t1000 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t996),
        t997,
      ),
      t998,
    ),
    t999,
  )
  relative_to_subset_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, relative_to(P, u, s) && SUBSET(s, t) && SUBSET(t, u) → relative_to(P, t, s)"),
      t1000,
    ),
  )
}

///|
let relative_to_subset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_SUBSET_TRANS",
)

///|
/// `RELATIVE_TO_SUBSET_TRANS`
pub fn relative_to_subset_trans() -> @kernel.Thm {
  relative_to_subset_trans_c.get()
}

///|
/// RELATIVE_TO_MONO
fn step_165() -> Unit raise {
  let t1001 = @meson.meson_tac(@list.List([]))
  let t1002 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to()])),
    t1001,
  )
  relative_to_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, ∀ Q : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, P(s) → Q(s)) → (∀ u : (_) -> Bool, relative_to(P, u, (s : (_) -> Bool)) → relative_to(Q, u, s))"),
      t1002,
    ),
  )
}

///|
let relative_to_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_MONO",
)

///|
/// `RELATIVE_TO_MONO`
pub fn relative_to_mono() -> @kernel.Thm {
  relative_to_mono_c.get()
}

///|
/// RELATIVE_TO_SUBSET_INC
fn step_166() -> Unit raise {
  let t1003 = @meson.meson_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (u : (_) -> Bool)) → INTER(u, s) == s")),
    ]),
  )
  let t1004 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([relative_to()])),
    t1003,
  )
  relative_to_subset_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, ∀ s : (A) -> Bool, SUBSET(s, u) && P(s) → relative_to(P, u, s)"),
      t1004,
    ),
  )
}

///|
let relative_to_subset_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_SUBSET_INC",
)

///|
/// `RELATIVE_TO_SUBSET_INC`
pub fn relative_to_subset_inc() -> @kernel.Thm {
  relative_to_subset_inc_c.get()
}

///|
/// RELATIVE_TO_INTER
fn step_167() -> Unit raise {
  let t1013 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1012 = @simp.asm_simp_tac(@list.List([]))
  let t1011 = @tactics.exists_tac(@term_syntax.parse_term("INTER((c' : (A) -> Bool), (d' : (A) -> Bool))"))
  let t1009 = @tactics.x_choose_then(@term_syntax.parse_term("(d' : (A) -> Bool)"))(fn(
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
    @tactics.strip_assume_tac(@equal.gsym(x1008))
  })
  let t1010 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(c' : (A) -> Bool)"))(fn(
        x1007 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.strip_assume_tac(@equal.gsym(x1007))
      }),
      t1009,
    ),
  )
  let t1006 = @simp.rewrite_tac(@list.List([relative_to()]))
  let t1005 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1014 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.disch_tac,
              ),
              t1005,
            ),
            t1006,
          ),
          t1010,
        ),
        t1011,
      ),
      t1012,
    ),
    t1013,
  )
  relative_to_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, (∀ c : (A) -> Bool, ∀ d : (A) -> Bool, P(c) && P(d) → P(INTER(c, d))) → (∀ c : (A) -> Bool, ∀ d : (A) -> Bool, relative_to(P, s, c) && relative_to(P, s, d) → relative_to(P, s, INTER(c, d)))"),
      t1014,
    ),
  )
}

///|
let relative_to_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_INTER",
)

///|
/// `RELATIVE_TO_INTER`
pub fn relative_to_inter() -> @kernel.Thm {
  relative_to_inter_c.get()
}

///|
/// RELATIVE_TO_UNION
fn step_168() -> Unit raise {
  let t1023 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1022 = @simp.asm_simp_tac(@list.List([]))
  let t1021 = @tactics.exists_tac(@term_syntax.parse_term("UNION((c' : (A) -> Bool), (d' : (A) -> Bool))"))
  let t1019 = @tactics.x_choose_then(@term_syntax.parse_term("(d' : (A) -> Bool)"))(fn(
    x1018 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1018))
  })
  let t1020 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(c' : (A) -> Bool)"))(fn(
        x1017 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.strip_assume_tac(@equal.gsym(x1017))
      }),
      t1019,
    ),
  )
  let t1016 = @simp.rewrite_tac(@list.List([relative_to()]))
  let t1015 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1024 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.disch_tac,
              ),
              t1015,
            ),
            t1016,
          ),
          t1020,
        ),
        t1021,
      ),
      t1022,
    ),
    t1023,
  )
  relative_to_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, (∀ c : (A) -> Bool, ∀ d : (A) -> Bool, P(c) && P(d) → P(UNION(c, d))) → (∀ c : (A) -> Bool, ∀ d : (A) -> Bool, relative_to(P, s, c) && relative_to(P, s, d) → relative_to(P, s, UNION(c, d)))"),
      t1024,
    ),
  )
}

///|
let relative_to_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELATIVE_TO_UNION",
)

///|
/// `RELATIVE_TO_UNION`
pub fn relative_to_union() -> @kernel.Thm {
  relative_to_union_c.get()
}

///|
/// ARBITRARY_UNION_OF_RELATIVE_TO
fn step_169() -> Unit raise {
  let t1055 = @simp.asm_simp_tac(
    @list.List([@sets.arbitrary(), @sets.forall_in_image()]),
  )
  let t1054 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1053 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1052 = @tactics.exists_tac(
    @term_syntax.parse_term("UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1051 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1050 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1047 = @simp.gen_rewrite_rule(
    fn(
      x1044 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1045 = @equal.binder_conv(x1044)
      fn(x1046 : @kernel.Term) -> @kernel.Thm raise { s1045(x1046) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1049 = @tactics.first_x_assum(fn(
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
      let s1042 = @tactics.mp_tac(x1041)
      fn(
        x1043 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1042(x1043)
      }
    })(t1047(x1048))
  })
  let t1056 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.disch_then(
                      @tactics.x_choose_then(
                        @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"),
                      )(@tactics.strip_assume_tac),
                    ),
                    t1049,
                  ),
                  t1050,
                ),
                t1051,
              ),
              @tactics.strip_tac,
            ),
            t1052,
          ),
          @tactics.conj_tac,
        ),
        t1053,
      ),
      t1054,
    ),
    t1055,
  )
  let t1040 = @meson.asm_meson_tac(@list.List([]))
  let t1039 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      @sets.arbitrary(),
      @sets.forall_in_image(),
    ]),
  )
  let t1038 = @simp.asm_rewrite_tac(@list.List([@sets.inter_unions()]))
  let t1037 = @tactics.exists_tac(
    @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
  )
  let t1036 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1035 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1035))
    }),
  )
  let t1034 = @tactics.conjuncts_then2(
    fn(
      x1027 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1028 = @tactics.mp_tac(x1027)
      fn(
        x1029 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1028(x1029)
      }
    },
    fn(
      x1033 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1030 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1031 = @tactics.subst1_tac(x1030)
        fn(
          x1032 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1031(x1032)
        }
      })(@equal.sym(x1033))
    },
  )
  let t1057 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(
                @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1034),
              ),
              t1036,
            ),
            t1037,
          ),
          t1038,
        ),
        t1039,
      ),
      t1040,
    ),
    t1056,
  ])
  let t1026 = @simp.rewrite_tac(@list.List([@sets.union_of(), relative_to()]))
  let t1025 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1058 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
          t1025,
        ),
        t1026,
      ),
      @tactics.eq_tac,
    ),
    t1057,
  )
  arbitrary_union_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(UNION_OF(ARBITRARY, P), u) == UNION_OF(ARBITRARY, relative_to(P, u))"),
      t1058,
    ),
  )
}

///|
let arbitrary_union_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ARBITRARY_UNION_OF_RELATIVE_TO",
)

///|
/// `ARBITRARY_UNION_OF_RELATIVE_TO`
pub fn arbitrary_union_of_relative_to() -> @kernel.Thm {
  arbitrary_union_of_relative_to_c.get()
}

///|
/// FINITE_UNION_OF_RELATIVE_TO
fn step_170() -> Unit raise {
  let t1089 = @simp.asm_simp_tac(
    @list.List([@sets.finite_image(), @sets.forall_in_image()]),
  )
  let t1088 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1087 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1086 = @tactics.exists_tac(
    @term_syntax.parse_term("UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1085 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1084 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1081 = @simp.gen_rewrite_rule(
    fn(
      x1078 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1079 = @equal.binder_conv(x1078)
      fn(x1080 : @kernel.Term) -> @kernel.Thm raise { s1079(x1080) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1083 = @tactics.first_x_assum(fn(
    x1082 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1075 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1076 = @tactics.mp_tac(x1075)
      fn(
        x1077 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1076(x1077)
      }
    })(t1081(x1082))
  })
  let t1090 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.disch_then(
                      @tactics.x_choose_then(
                        @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"),
                      )(@tactics.strip_assume_tac),
                    ),
                    t1083,
                  ),
                  t1084,
                ),
                t1085,
              ),
              @tactics.strip_tac,
            ),
            t1086,
          ),
          @tactics.conj_tac,
        ),
        t1087,
      ),
      t1088,
    ),
    t1089,
  )
  let t1074 = @meson.asm_meson_tac(@list.List([]))
  let t1073 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      @sets.finite_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t1072 = @simp.asm_rewrite_tac(@list.List([@sets.inter_unions()]))
  let t1071 = @tactics.exists_tac(
    @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
  )
  let t1070 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1069 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1069))
    }),
  )
  let t1068 = @tactics.conjuncts_then2(
    fn(
      x1061 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1062 = @tactics.mp_tac(x1061)
      fn(
        x1063 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1062(x1063)
      }
    },
    fn(
      x1067 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1064 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1065 = @tactics.subst1_tac(x1064)
        fn(
          x1066 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1065(x1066)
        }
      })(@equal.sym(x1067))
    },
  )
  let t1091 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(
                @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1068),
              ),
              t1070,
            ),
            t1071,
          ),
          t1072,
        ),
        t1073,
      ),
      t1074,
    ),
    t1090,
  ])
  let t1060 = @simp.rewrite_tac(@list.List([@sets.union_of(), relative_to()]))
  let t1059 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1092 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
          t1059,
        ),
        t1060,
      ),
      @tactics.eq_tac,
    ),
    t1091,
  )
  finite_union_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(UNION_OF(FINITE, P), u) == UNION_OF(FINITE, relative_to(P, u))"),
      t1092,
    ),
  )
}

///|
let finite_union_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_UNION_OF_RELATIVE_TO",
)

///|
/// `FINITE_UNION_OF_RELATIVE_TO`
pub fn finite_union_of_relative_to() -> @kernel.Thm {
  finite_union_of_relative_to_c.get()
}

///|
/// COUNTABLE_UNION_OF_RELATIVE_TO
fn step_171() -> Unit raise {
  let t1123 = @simp.asm_simp_tac(
    @list.List([@card.countable_image(), @sets.forall_in_image()]),
  )
  let t1122 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1121 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1120 = @tactics.exists_tac(
    @term_syntax.parse_term("UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1119 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1118 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1115 = @simp.gen_rewrite_rule(
    fn(
      x1112 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1113 = @equal.binder_conv(x1112)
      fn(x1114 : @kernel.Term) -> @kernel.Thm raise { s1113(x1114) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1117 = @tactics.first_x_assum(fn(
    x1116 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
    })(t1115(x1116))
  })
  let t1124 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.disch_then(
                      @tactics.x_choose_then(
                        @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"),
                      )(@tactics.strip_assume_tac),
                    ),
                    t1117,
                  ),
                  t1118,
                ),
                t1119,
              ),
              @tactics.strip_tac,
            ),
            t1120,
          ),
          @tactics.conj_tac,
        ),
        t1121,
      ),
      t1122,
    ),
    t1123,
  )
  let t1108 = @meson.asm_meson_tac(@list.List([]))
  let t1107 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      @card.countable_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t1106 = @simp.asm_rewrite_tac(@list.List([@sets.inter_unions()]))
  let t1105 = @tactics.exists_tac(
    @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
  )
  let t1104 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1103 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1103))
    }),
  )
  let t1102 = @tactics.conjuncts_then2(
    fn(
      x1095 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1096 = @tactics.mp_tac(x1095)
      fn(
        x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1096(x1097)
      }
    },
    fn(
      x1101 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1098 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1099 = @tactics.subst1_tac(x1098)
        fn(
          x1100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1099(x1100)
        }
      })(@equal.sym(x1101))
    },
  )
  let t1125 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(
                @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1102),
              ),
              t1104,
            ),
            t1105,
          ),
          t1106,
        ),
        t1107,
      ),
      t1108,
    ),
    t1124,
  ])
  let t1094 = @simp.rewrite_tac(@list.List([@sets.union_of(), relative_to()]))
  let t1093 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1126 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
          t1093,
        ),
        t1094,
      ),
      @tactics.eq_tac,
    ),
    t1125,
  )
  countable_union_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(UNION_OF(COUNTABLE, P), u) == UNION_OF(COUNTABLE, relative_to(P, u))"),
      t1126,
    ),
  )
}

///|
let countable_union_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_UNION_OF_RELATIVE_TO",
)

///|
/// `COUNTABLE_UNION_OF_RELATIVE_TO`
pub fn countable_union_of_relative_to() -> @kernel.Thm {
  countable_union_of_relative_to_c.get()
}

///|
/// ARBITRARY_INTERSECTION_OF_RELATIVE_TO
fn step_172() -> Unit raise {
  let t1171 = @simp.asm_simp_tac(
    @list.List([@sets.arbitrary(), @sets.forall_in_image()]),
  )
  let t1170 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1169 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1168 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1167 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1166 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1163 = @simp.gen_rewrite_rule(
    fn(
      x1160 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1161 = @equal.binder_conv(x1160)
      fn(x1162 : @kernel.Term) -> @kernel.Thm raise { s1161(x1162) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1165 = @tactics.first_x_assum(fn(
    x1164 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1157 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1158 = @tactics.mp_tac(x1157)
      fn(
        x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1158(x1159)
      }
    })(t1163(x1164))
  })
  let t1156 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1155 = @tactics.conjuncts_then2(
    fn(
      x1148 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1149 = @tactics.mp_tac(x1148)
      fn(
        x1150 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1149(x1150)
      }
    },
    fn(
      x1154 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1151 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1152 = @tactics.subst1_tac(x1151)
        fn(
          x1153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1152(x1153)
        }
      })(@equal.sym(x1154))
    },
  )
  let t1172 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.disch_then(
                        @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(
                          t1155,
                        ),
                      ),
                      t1156,
                    ),
                    t1165,
                  ),
                  t1166,
                ),
                t1167,
              ),
              @tactics.strip_tac,
            ),
            t1168,
          ),
          @tactics.conj_tac,
        ),
        t1169,
      ),
      t1170,
    ),
    t1171,
  )
  let t1145 = @simp.rewrite_tac(
    @list.List([
      @sets.simple_image(),
      @sets.image_eq_empty(),
      @sets.inters_image(),
      @sets.forall_in_image(),
      @sets.set_rule(@term_syntax.parse_term("INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)")),
    ]),
  )
  let t1144 = @simp.once_rewrite_tac(@list.List([@sets.inter_inters()]))
  let t1146 = @tactics.then_tac(
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1144),
    t1145,
  )
  let t1143 = @meson.asm_meson_tac(@list.List([]))
  let t1142 = @simp.asm_simp_tac(
    @list.List([
      @sets.arbitrary(),
      @sets.simple_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t1147 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
        ),
        t1142,
      ),
      t1143,
    ),
    t1146,
  ])
  let t1141 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})"),
  )
  let t1140 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1139 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1139))
    }),
  )
  let t1138 = @tactics.conjuncts_then2(
    fn(
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
    },
    fn(
      x1137 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1134 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1135 = @tactics.subst1_tac(x1134)
        fn(
          x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1135(x1136)
        }
      })(@equal.sym(x1137))
    },
  )
  let t1173 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1138),
            ),
            t1140,
          ),
          t1141,
        ),
        @tactics.conj_tac,
      ),
      t1147,
    ),
    t1172,
  ])
  let t1130 = @simp.rewrite_tac(
    @list.List([@sets.intersection_of(), relative_to()]),
  )
  let t1129 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1128 = @simp.gen_rewrite_tac(
    fn(
      x1127 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1127
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1174 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1128),
          t1129,
        ),
        t1130,
      ),
      @tactics.eq_tac,
    ),
    t1173,
  )
  arbitrary_intersection_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(INTERSECTION_OF(ARBITRARY, P), u) == relative_to(INTERSECTION_OF(ARBITRARY, relative_to(P, u)), u)"),
      t1174,
    ),
  )
}

///|
let arbitrary_intersection_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ARBITRARY_INTERSECTION_OF_RELATIVE_TO",
)

///|
/// `ARBITRARY_INTERSECTION_OF_RELATIVE_TO`
pub fn arbitrary_intersection_of_relative_to() -> @kernel.Thm {
  arbitrary_intersection_of_relative_to_c.get()
}

///|
/// FINITE_INTERSECTION_OF_RELATIVE_TO
fn step_173() -> Unit raise {
  let t1219 = @simp.asm_simp_tac(
    @list.List([@sets.finite_image(), @sets.forall_in_image()]),
  )
  let t1218 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1217 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1216 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1215 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1214 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1211 = @simp.gen_rewrite_rule(
    fn(
      x1208 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1209 = @equal.binder_conv(x1208)
      fn(x1210 : @kernel.Term) -> @kernel.Thm raise { s1209(x1210) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1213 = @tactics.first_x_assum(fn(
    x1212 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1205 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1206 = @tactics.mp_tac(x1205)
      fn(
        x1207 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1206(x1207)
      }
    })(t1211(x1212))
  })
  let t1204 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1203 = @tactics.conjuncts_then2(
    fn(
      x1196 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1197 = @tactics.mp_tac(x1196)
      fn(
        x1198 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1197(x1198)
      }
    },
    fn(
      x1202 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1199 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1200 = @tactics.subst1_tac(x1199)
        fn(
          x1201 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1200(x1201)
        }
      })(@equal.sym(x1202))
    },
  )
  let t1220 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.disch_then(
                        @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(
                          t1203,
                        ),
                      ),
                      t1204,
                    ),
                    t1213,
                  ),
                  t1214,
                ),
                t1215,
              ),
              @tactics.strip_tac,
            ),
            t1216,
          ),
          @tactics.conj_tac,
        ),
        t1217,
      ),
      t1218,
    ),
    t1219,
  )
  let t1193 = @simp.rewrite_tac(
    @list.List([
      @sets.simple_image(),
      @sets.image_eq_empty(),
      @sets.inters_image(),
      @sets.forall_in_image(),
      @sets.set_rule(@term_syntax.parse_term("INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)")),
    ]),
  )
  let t1192 = @simp.once_rewrite_tac(@list.List([@sets.inter_inters()]))
  let t1194 = @tactics.then_tac(
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1192),
    t1193,
  )
  let t1191 = @meson.asm_meson_tac(@list.List([]))
  let t1190 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_image(),
      @sets.simple_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t1195 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
        ),
        t1190,
      ),
      t1191,
    ),
    t1194,
  ])
  let t1189 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})"),
  )
  let t1188 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1187 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1187))
    }),
  )
  let t1186 = @tactics.conjuncts_then2(
    fn(
      x1179 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1180 = @tactics.mp_tac(x1179)
      fn(
        x1181 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1180(x1181)
      }
    },
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
      (fn(
        x1182 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1183 = @tactics.subst1_tac(x1182)
        fn(
          x1184 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1183(x1184)
        }
      })(@equal.sym(x1185))
    },
  )
  let t1221 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1186),
            ),
            t1188,
          ),
          t1189,
        ),
        @tactics.conj_tac,
      ),
      t1195,
    ),
    t1220,
  ])
  let t1178 = @simp.rewrite_tac(
    @list.List([@sets.intersection_of(), relative_to()]),
  )
  let t1177 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1176 = @simp.gen_rewrite_tac(
    fn(
      x1175 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1175
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1222 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1176),
          t1177,
        ),
        t1178,
      ),
      @tactics.eq_tac,
    ),
    t1221,
  )
  finite_intersection_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(INTERSECTION_OF(FINITE, P), u) == relative_to(INTERSECTION_OF(FINITE, relative_to(P, u)), u)"),
      t1222,
    ),
  )
}

///|
let finite_intersection_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INTERSECTION_OF_RELATIVE_TO",
)

///|
/// `FINITE_INTERSECTION_OF_RELATIVE_TO`
pub fn finite_intersection_of_relative_to() -> @kernel.Thm {
  finite_intersection_of_relative_to_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_RELATIVE_TO
fn step_174() -> Unit raise {
  let t1267 = @simp.asm_simp_tac(
    @list.List([@card.countable_image(), @sets.forall_in_image()]),
  )
  let t1266 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))"),
  )
  let t1265 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t1264 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))"),
  )
  let t1263 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((A) -> Bool, A) -> Bool)"))
  let t1262 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1259 = @simp.gen_rewrite_rule(
    fn(
      x1256 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1257 = @equal.binder_conv(x1256)
      fn(x1258 : @kernel.Term) -> @kernel.Thm raise { s1257(x1258) }
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1261 = @tactics.first_x_assum(fn(
    x1260 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1253 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1254 = @tactics.mp_tac(x1253)
      fn(
        x1255 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1254(x1255)
      }
    })(t1259(x1260))
  })
  let t1252 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1251 = @tactics.conjuncts_then2(
    fn(
      x1244 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1245 = @tactics.mp_tac(x1244)
      fn(
        x1246 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1245(x1246)
      }
    },
    fn(
      x1250 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1247 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1248 = @tactics.subst1_tac(x1247)
        fn(
          x1249 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1248(x1249)
        }
      })(@equal.sym(x1250))
    },
  )
  let t1268 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.disch_then(
                        @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(
                          t1251,
                        ),
                      ),
                      t1252,
                    ),
                    t1261,
                  ),
                  t1262,
                ),
                t1263,
              ),
              @tactics.strip_tac,
            ),
            t1264,
          ),
          @tactics.conj_tac,
        ),
        t1265,
      ),
      t1266,
    ),
    t1267,
  )
  let t1241 = @simp.rewrite_tac(
    @list.List([
      @sets.simple_image(),
      @sets.image_eq_empty(),
      @sets.inters_image(),
      @sets.forall_in_image(),
      @sets.set_rule(@term_syntax.parse_term("INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)")),
    ]),
  )
  let t1240 = @simp.once_rewrite_tac(@list.List([@sets.inter_inters()]))
  let t1242 = @tactics.then_tac(
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1240),
    t1241,
  )
  let t1239 = @meson.asm_meson_tac(@list.List([]))
  let t1238 = @simp.asm_simp_tac(
    @list.List([
      @card.countable_image(),
      @sets.simple_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t1243 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("{INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}"),
        ),
        t1238,
      ),
      t1239,
    ),
    t1242,
  ])
  let t1237 = @tactics.exists_tac(
    @term_syntax.parse_term("INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})"),
  )
  let t1236 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"))(fn(
      x1235 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x1235))
    }),
  )
  let t1234 = @tactics.conjuncts_then2(
    fn(
      x1227 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1228 = @tactics.mp_tac(x1227)
      fn(
        x1229 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1228(x1229)
      }
    },
    fn(
      x1233 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1230 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1231 = @tactics.subst1_tac(x1230)
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
      })(@equal.sym(x1233))
    },
  )
  let t1269 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(t1234),
            ),
            t1236,
          ),
          t1237,
        ),
        @tactics.conj_tac,
      ),
      t1243,
    ),
    t1268,
  ])
  let t1226 = @simp.rewrite_tac(
    @list.List([@sets.intersection_of(), relative_to()]),
  )
  let t1225 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1224 = @simp.gen_rewrite_tac(
    fn(
      x1223 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1223
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1270 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1224),
          t1225,
        ),
        t1226,
      ),
      @tactics.eq_tac,
    ),
    t1269,
  )
  countable_intersection_of_relative_to_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, relative_to(INTERSECTION_OF(COUNTABLE, P), u) == relative_to(INTERSECTION_OF(COUNTABLE, relative_to(P, u)), u)"),
      t1270,
    ),
  )
}

///|
let countable_intersection_of_relative_to_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_RELATIVE_TO",
)

///|
/// `COUNTABLE_INTERSECTION_OF_RELATIVE_TO`
pub fn countable_intersection_of_relative_to() -> @kernel.Thm {
  countable_intersection_of_relative_to_c.get()
}

///|
/// FINITE_INTERSECTION_OF_RELATIVE_TO_ALT
fn step_175() -> Unit raise {
  let t1279 = @simp.asm_simp_tac(
    @list.List([@sets.finite_intersection_of_inc()]),
  )
  let t1278 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.forall_in_insert()]),
  )
  let t1277 = @tactics.match_mp_tac(@sets.finite_intersection_of_inters())
  let t1276 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1275 = @simp.rewrite_tac(
    @list.List([@sets.inter_subset(), @equal.gsym(@sets.inters_insert())]),
  )
  let t1274 = @simp.rewrite_tac(
    @list.List([forall_relative_to(), @sets.forall_intersection_of()]),
  )
  let t1272 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1273 = @tactics.spec_tac(@term_syntax.parse_term("(s : (A) -> Bool)"), t1272)
  let t1271 = @simp.simp_tac(@list.List([relative_to_subset_inc()]))
  let t1280 = @tactics.then_tac(
    @tactics.then_tac(
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
                  t1271,
                ),
                t1273,
              ),
              t1274,
            ),
            t1275,
          ),
          t1276,
        ),
        t1277,
      ),
      t1278,
    ),
    t1279,
  )
  finite_intersection_of_relative_to_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, ∀ s : (A) -> Bool, P(u) → relative_to(INTERSECTION_OF(FINITE, P), u, s) == (INTERSECTION_OF(FINITE, P, s) && SUBSET(s, u))"),
      t1280,
    ),
  )
}

///|
let finite_intersection_of_relative_to_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INTERSECTION_OF_RELATIVE_TO_ALT",
)

///|
/// `FINITE_INTERSECTION_OF_RELATIVE_TO_ALT`
pub fn finite_intersection_of_relative_to_alt() -> @kernel.Thm {
  finite_intersection_of_relative_to_alt_c.get()
}

///|
/// COUNTABLE_INTERSECTION_OF_RELATIVE_TO_ALT
fn step_176() -> Unit raise {
  let t1289 = @simp.asm_simp_tac(
    @list.List([@card.countable_intersection_of_inc()]),
  )
  let t1288 = @simp.asm_rewrite_tac(
    @list.List([@card.countable_insert(), @sets.forall_in_insert()]),
  )
  let t1287 = @tactics.match_mp_tac(@card.countable_intersection_of_inters())
  let t1286 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1285 = @simp.rewrite_tac(
    @list.List([@sets.inter_subset(), @equal.gsym(@sets.inters_insert())]),
  )
  let t1284 = @simp.rewrite_tac(
    @list.List([forall_relative_to(), @sets.forall_intersection_of()]),
  )
  let t1282 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1283 = @tactics.spec_tac(@term_syntax.parse_term("(s : (A) -> Bool)"), t1282)
  let t1281 = @simp.simp_tac(@list.List([relative_to_subset_inc()]))
  let t1290 = @tactics.then_tac(
    @tactics.then_tac(
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
                  t1281,
                ),
                t1283,
              ),
              t1284,
            ),
            t1285,
          ),
          t1286,
        ),
        t1287,
      ),
      t1288,
    ),
    t1289,
  )
  countable_intersection_of_relative_to_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ u : (A) -> Bool, ∀ s : (A) -> Bool, P(u) → relative_to(INTERSECTION_OF(COUNTABLE, P), u, s) == (INTERSECTION_OF(COUNTABLE, P, s) && SUBSET(s, u))"),
      t1290,
    ),
  )
}

///|
let countable_intersection_of_relative_to_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNTABLE_INTERSECTION_OF_RELATIVE_TO_ALT",
)

///|
/// `COUNTABLE_INTERSECTION_OF_RELATIVE_TO_ALT`
pub fn countable_intersection_of_relative_to_alt() -> @kernel.Thm {
  countable_intersection_of_relative_to_alt_c.get()
}

///|
/// ARBITRARY_UNION_OF_NONEMPTY_FINITE_INTERSECTION
fn step_177() -> Unit raise {
  let t1319 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1318 = @tactics.exists_tac(@term_syntax.parse_term("(t : ((A) -> Bool) -> Bool)"))
  let t1317 = @simp.rewrite_tac(
    @list.List([@sets.arbitrary(), @sets.intersection_of()]),
  )
  let t1320 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.union_of_inc()), t1317),
      t1318,
    ),
    t1319,
  )
  let t1316 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t1315 = @simp.rewrite_tac(
    @list.List([@sets.not_insert_empty(), @sets.finite_sing()]),
  )
  let t1314 = @tactics.match_mp_tac(@sets.intersection_of_inc())
  let t1313 = @simp.rewrite_tac(@list.List([@sets.arbitrary()]))
  let t1312 = @tactics.match_mp_tac(@sets.union_of_inc())
  let t1311 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (A) -> Bool)"))
  let t1310 = @tactics.match_mp_tac(@sets.arbitrary_union_of_unions())
  let t1321 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.asm_rewrite_tac(
                      @list.List([@sets.inters_0(), @sets.inter_univ()]),
                    ),
                    t1310,
                  ),
                  t1311,
                ),
                @tactics.disch_tac,
              ),
              t1312,
            ),
            t1313,
          ),
          t1314,
        ),
        t1315,
      ),
      t1316,
    ),
    t1320,
  ])
  let t1309 = @class.asm_cases_tac(@term_syntax.parse_term("(t : ((A) -> Bool) -> Bool) == {}"))
  let t1308 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : ((A) -> Bool) -> Bool)"))
  let t1307 = @simp.rewrite_tac(
    @list.List([forall_relative_to(), @sets.forall_intersection_of()]),
  )
  let t1306 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.union_of_mono(),
    ),
  )
  let t1322 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x1305 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x1299 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s1300 = @equal.rand_conv(x1299)
                    fn(x1301 : @kernel.Term) -> @kernel.Thm raise {
                      s1300(x1301)
                    }
                  })(
                    (fn(
                      x1302 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s1303 = @equal.rator_conv(x1302)
                      fn(x1304 : @kernel.Term) -> @kernel.Thm raise {
                        s1303(x1304)
                      }
                    })(x1305),
                  )
                },
                @list.List([@equal.gsym(@sets.arbitrary_union_of_idempot())]),
              ),
              t1306,
            ),
            t1307,
          ),
          t1308,
        ),
        @tactics.strip_tac,
      ),
      t1309,
    ),
    t1321,
  )
  let t1297 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1298 = @list.List([@meson.asm_meson_tac(@list.List([])), t1297])
  let t1296 = @tactics.exists_tac(@term_syntax.parse_term("INTERS((t : ((A) -> Bool) -> Bool))"))
  let t1295 = @simp.rewrite_tac(
    @list.List([@sets.intersection_of(), relative_to()]),
  )
  let t1294 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : ((A) -> Bool) -> Bool)"))
  let t1293 = @simp.rewrite_tac(@list.List([@sets.forall_intersection_of()]))
  let t1323 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(
                    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
                      @sets.union_of_mono(),
                    ),
                  ),
                  t1293,
                ),
                t1294,
              ),
              @tactics.strip_tac,
            ),
            t1295,
          ),
          t1296,
        ),
        @tactics.conj_tac,
      ),
      t1298,
    ),
    t1322,
  ])
  let t1292 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1291 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(@sets.subset())]),
  )
  let t1324 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.match_mp_tac(@sets.subset_antisym()),
          ),
          t1291,
        ),
        @tactics.conj_tac,
      ),
      t1292,
    ),
    t1323,
  )
  arbitrary_union_of_nonempty_finite_intersection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : ((A) -> Bool) -> Bool, UNION_OF(ARBITRARY, INTERSECTION_OF((s : ((A) -> Bool) -> Bool) => FINITE(s) && !(s == {}), u)) == UNION_OF(ARBITRARY, relative_to(INTERSECTION_OF(FINITE, u), UNIONS(u)))"),
      t1324,
    ),
  )
}

///|
let arbitrary_union_of_nonempty_finite_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ARBITRARY_UNION_OF_NONEMPTY_FINITE_INTERSECTION",
)

///|
/// `ARBITRARY_UNION_OF_NONEMPTY_FINITE_INTERSECTION`
pub fn arbitrary_union_of_nonempty_finite_intersection() -> @kernel.Thm {
  arbitrary_union_of_nonempty_finite_intersection_c.get()
}

///|
/// GENERAL_REDUCTION_THEOREM
fn step_178() -> Unit raise {
  let t1493 = @meson.meson_tac(@list.List([]))
  let t1492 = @simp.rewrite_tac(
    @list.List([@sets.in_diff(), @sets.unions_gspec(), @sets.in_elim_thm()]),
  )
  let t1491 = @simp.expand_tac("d")
  let t1490 = @simp.gen_rewrite_tac(
    fn(
      x1487 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1488 = @equal.rand_conv(x1487)
      fn(x1489 : @kernel.Term) -> @kernel.Thm raise { s1488(x1489) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t1486 = @tactics.exists_tac(@term_syntax.parse_term("(p : ((Num, Num)) -> Num)"))
  let t1485 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ p : ((Num, Num)) -> Num, (P : Bool) == (∃ n : Num, ∃ i : Num, ∃ j : Num, p((i, j)) == n && (Q : (Num, Num) -> Bool)(i, j)) → P == (∃ i : Num, ∃ j : Num, Q(i, j))"),
    ),
  )
  let t1484 = @simp.rewrite_tac(
    @list.List([@sets.unions_gspec(), @sets.in_elim_thm(), @sets.in_univ()]),
  )
  let t1483 = @tactics.first_assum(fn(
    x1470 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let t = x1470
    @simp.gen_rewrite_tac(
      fn(
        x1482 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1478 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x1472 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1473 = @equal.rand_conv(x1472)
            fn(x1474 : @kernel.Term) -> @kernel.Thm raise { s1473(x1474) }
          })(
            (fn(
              x1475 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1476 = @equal.binder_conv(x1475)
              fn(x1477 : @kernel.Term) -> @kernel.Thm raise { s1476(x1477) }
            })(x1478),
          )
        })(
          (fn(
            x1479 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1480 = @equal.rand_conv(x1479)
            fn(x1481 : @kernel.Term) -> @kernel.Thm raise { s1480(x1481) }
          })(x1482),
        )
      },
      @list.List([@equal.gsym(t)]),
    )
  })
  let t1468 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1467 = @simp.rewrite_tac(@list.List([]))
  let t1466 = @simp.expand_tac("d")
  let t1465 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) → (p && (q : Bool)) == q")),
  )
  let t1469 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(
              @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
            ),
            t1465,
          ),
          t1466,
        ),
        t1467,
      ),
      t1468,
    ),
    @tactics.all_tac,
  ])
  let t1463 = @term_syntax.parse_term("∃ i : Num, ∃ j : Num, IN((x : A), (d : (Num, Num, A) -> Bool)(i, j))")
  let t1464 = @tactics.trans_tac(@theorems.eq_trans())(t1463)
  let t1462 = @simp.rewrite_tac(
    @list.List([@theorems.left_exists_and_thm(), @equal.gsym(@arith.num_wop())]),
  )
  let t1461 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ n : _, ∃ i : _, ∃ j : _, (P : (_, _, _) -> Bool)(n, i, j)) == (∃ i : _, ∃ j : _, ∃ n : _, P(n, i, j))"),
      ),
    ]),
  )
  let t1460 = @simp.rewrite_tac(
    @list.List([@sets.unions_gspec(), @sets.in_univ(), @sets.in_elim_thm()]),
  )
  let t1459 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t1494 = @tactics.then_tac(
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
                                @simp.gen_rewrite_tac(
                                  fn(
                                    x1458 : (@kernel.Term) -> @kernel.Thm raise,
                                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                    x1458
                                  },
                                  @list.List([@sets.extension()]),
                                ),
                                t1459,
                              ),
                              t1460,
                            ),
                            t1461,
                          ),
                          t1462,
                        ),
                        t1464,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1469,
                  ),
                  t1483,
                ),
                t1484,
              ),
              t1485,
            ),
            t1486,
          ),
          t1490,
        ),
        t1491,
      ),
      t1492,
    ),
    t1493,
  )
  let t1455 = @sets.set_tac(@list.List([]))
  let t1456 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_diff(),
        @sets.in_inter(),
        @sets.unions_gspec(),
      ]),
    ),
    t1455,
  )
  let t1454 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1453 = @simp.asm_rewrite_tac(@list.List([@pair.pair_eq()]))
  let t1449 = @term_syntax.parse_term("(q : (Num) -> (Num, Num))")
  let t1452 = @tactics.disch_then(fn(
    x1451 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1446 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1447 = @tactics.mp_tac(x1446)
      fn(
        x1448 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1447(x1448)
      }
    })(((x1450 : @kernel.Thm) => @equal.ap_term(t1449, x1450))(x1451))
  })
  let t1457 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.arith_rule(
                @term_syntax.parse_term("((m : Num) < (n : Num) || n < m) == !(m == n)"),
              ),
            ]),
          ),
          t1452,
        ),
        t1453,
      ),
      t1454,
    ),
    t1456,
  ])
  let t1445 = @tactics.subgoal_then(
    @term_syntax.parse_term("(p : ((Num, Num)) -> Num)(((a : Num), (b : Num))) < p(((m : Num), (n : Num))) || p((m, n)) < p((a, b))"),
    fn(
      x1442 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1443 = @tactics.mp_tac(x1442)
      fn(
        x1444 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1443(x1444)
      }
    },
  )
  let t1441 = @simp.rewrite_tac(@list.List([]))
  let t1440 = @simp.expand_tac("d")
  let t1438 = @term_syntax.parse_term("(n : Num)")
  let t1439 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t1438]),
  )
  let t1436 = @term_syntax.parse_term("(b : Num)")
  let t1437 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : Num)"), t1436]),
  )
  let t1435 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1433 = @term_syntax.parse_term("(j : Num)")
  let t1434 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(i : Num)"), t1433]),
  )
  let t1432 = @simp.rewrite_tac(
    @list.List([@sets.empty_unions(), @sets.forall_in_gspec()]),
  )
  let t1430 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @sets.disjoint(), @sets.inter_unions()]),
  )
  let t1428 = @tactics.match_accept_tac(@sets.disjoint_sym())
  let t1429 = @list.List([@meson.meson_tac(@list.List([])), t1428])
  let t1427 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t1426 = @term_syntax.parse_term("(b : Num)")
  let t1431 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(a : Num)"), t1426]),
          ),
          t1427,
        ),
        @tactics.binop_tac,
      ),
      t1429,
    ),
    t1430,
  ])
  let t1425 = @simp.rewrite_tac(@list.List([]))
  let t1424 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t1495 = @tactics.thenl(
    @tactics.then_tac(
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
                                @simp.rewrite_tac(
                                  @list.List([@sets.pairwise()]),
                                ),
                                t1424,
                              ),
                              t1425,
                            ),
                            @tactics.conj_tac,
                          ),
                          t1431,
                        ),
                        t1432,
                      ),
                      t1434,
                    ),
                    t1435,
                  ),
                  t1437,
                ),
                @tactics.strip_tac,
              ),
              t1439,
            ),
            @tactics.strip_tac,
          ),
          t1440,
        ),
        t1441,
      ),
      t1445,
    ),
    t1457,
  )
  let t1496 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1419 = @simp.asm_rewrite_tac(@list.List([]))
  let t1417 = @term_syntax.parse_term("SND((q : (Num) -> (Num, Num))((c : Num)))")
  let t1418 = @tactics.map_every(
    fn(
      x1414 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1415 = @tactics.exists_tac(x1414)
      fn(
        x1416 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1415(x1416)
      }
    },
    @list.List([@term_syntax.parse_term("FST((q : (Num) -> (Num, Num))((c : Num)))"), t1417]),
  )
  let t1420 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(c : Num)")),
        @tactics.strip_tac,
      ),
      t1418,
    ),
    t1419,
  )
  let t1413 = @simp.asm_rewrite_tac(@list.List([]))
  let t1412 = @tactics.exists_tac(@term_syntax.parse_term("(p : ((Num, Num)) -> Num)(((a : Num), (b : Num)))"))
  let t1411 = @term_syntax.parse_term("(b : Num)")
  let t1421 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(a : Num)"), t1411]),
          ),
          @tactics.strip_tac,
        ),
        t1412,
      ),
      t1413,
    ),
    t1420,
  ])
  let t1410 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1409 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_image()]),
  )
  let t1408 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (A) -> Bool)"))
  let t1407 = @simp.gen_rewrite_tac(
    fn(
      x1406 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1406
    },
    @list.List([@sets.extension()]),
  )
  let t1405 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(c : (Num, Num, A) -> Bool)((k : Num), (l : Num)) | (p : ((Num, Num)) -> Num)((k, l)) < p(((i : Num), (j : Num)))} == IMAGE((r : Num) => c(FST((q : (Num) -> (Num, Num))(r)), SND(q(r))), {(r : Num) | r < p((i, j))})"),
    fn(
      x1403 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1403
      @simp.simp_tac(
        @list.List([th, @sets.finite_image(), @sets.finite_numseg_lt()]),
      )
    },
  )
  let t1402 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t1401 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1400 = @simp.asm_rewrite_tac(@list.List([]))
  let t1399 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1398 = @simp.expand_tac("d")
  let t1396 = @term_syntax.parse_term("(j : Num)")
  let t1397 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(i : Num)"), t1396]),
  )
  let t1422 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                                @list.List([@sets.forall_in_gspec()]),
                              ),
                              t1397,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1398,
                        ),
                        t1399,
                      ),
                      t1400,
                    ),
                    t1401,
                  ),
                  t1402,
                ),
                t1405,
              ),
              t1407,
            ),
            t1408,
          ),
          t1409,
        ),
        @tactics.eq_tac,
      ),
      t1410,
    ),
    t1421,
  )
  let t1395 = @sets.set_tac(@list.List([]))
  let t1394 = @simp.simp_tac(
    @list.List([
      @card.countable_product_dependent(),
      @card.countable_subset_num(),
    ]),
  )
  let t1393 = @tactics.exists_tac(
    @term_syntax.parse_term("{(d : (Num, Num, A) -> Bool)((i : Num), (j : Num)) | IN(i, UNIV) && IN(j, UNIV)}"),
  )
  let t1423 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@card.countable_subset()),
          t1393,
        ),
        t1394,
      ),
      t1395,
    ),
    t1422,
  ])
  let t1392 = @simp.rewrite_tac(@list.List([]))
  let t1391 = @tactics.exists_tac(
    @term_syntax.parse_term("{(d : (Num, Num, A) -> Bool)(i, j) | i : Num, j : Num | SUBSET(d(i, j), (s : (Num, A) -> Bool)((n : Num))) && (∀ m : Num, m < n → !SUBSET(d(i, j), s(m)))}"),
  )
  let t1497 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")),
            t1391,
          ),
          t1392,
        ),
        @tactics.conj_tac,
      ),
      t1423,
    ),
    t1496,
    t1495,
    t1494,
  ])
  let t1390 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1389 = @simp.rewrite_tac(@list.List([]))
  let t1388 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => UNIONS({(d : (Num, Num, A) -> Bool)(i, j) | i : Num, j : Num | SUBSET(d(i, j), (s : (Num, A) -> Bool)(n)) && (∀ m : Num, m < n → !SUBSET(d(i, j), s(m)))})"),
  )
  let t1387 = @simp.abbrev_tac(
    @term_syntax.parse_term("(d : (Num, Num, A) -> Bool) == ((m : Num) => (n : Num) => DIFF((c : (Num, Num, A) -> Bool)(m, n), UNIONS({c((i : Num), (j : Num)) | (p : ((Num, Num)) -> Num)((i, j)) < p((m, n))})))"),
  )
  let t1386 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t1385 = @simp.gen_rewrite_tac(
    fn(
      x1384 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1378 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1379 = @equal.land_conv(x1378)
        fn(x1380 : @kernel.Term) -> @kernel.Thm raise { s1379(x1380) }
      })(
        (fn(
          x1381 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1382 = @equal.once_depth_conv(x1381)
          fn(x1383 : @kernel.Term) -> @kernel.Thm raise { s1382(x1383) }
        })(x1384),
      )
    },
    @list.List([@sets.in_univ()]),
  )
  let t1376 = @term_syntax.parse_term("(q : (Num) -> (Num, Num))")
  let t1377 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : ((Num, Num)) -> Num)"), t1376]),
  )
  let t1375 = @simp.rewrite_tac(
    @list.List([@card.mul_c(), @sets.in_elim_pair_thm()]),
  )
  let t1374 = @simp.rewrite_tac(
    @list.List([
      @card.eq_c_bijections(),
      @theorems.left_imp_exists_thm(),
      @pair.forall_pair_thm(),
    ]),
  )
  let t1373 = @tactics.mp_tac(@card.card_square_num())
  let t1372 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : (Num, Num, A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1368 = @simp.gen_rewrite_rule(
    fn(
      x1367 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1367
    },
    @list.List([@class.skolem_thm()]),
  )
  let t1370 = @tactics.first_x_assum(fn(
    x1369 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      @tactics.all_tac
    })(t1368(x1369))
  })
  let t1365 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1364 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1363 = @simp.asm_rewrite_tac(@list.List([]))
  let t1362 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"),
      @card.countable_as_image(),
    ),
  )
  let t1360 = @sets.set_tac(@list.List([]))
  let t1359 = @simp.asm_rewrite_tac(@list.List([@sets.unions_gspec()]))
  let t1358 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ({} : (A) -> Bool)"))
  let t1357 = @tactics.disch_then(fn(
    x1356 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1355 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1354 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x1351 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1352 = @tactics.subst1_tac(x1351)
          fn(
            x1353 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1352(x1353)
          }
        })(@equal.sym(x1354))
      })(@lib.last(x1355))
    })(@bool.conjuncts_rule(x1356))
  })
  let t1361 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(@list.List([@sets.unions_0()])),
            t1357,
          ),
          t1358,
        ),
        t1359,
      ),
      t1360,
    ),
    @tactics.strip_tac,
  ])
  let t1350 = @class.asm_cases_tac(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool) == {}"))
  let t1349 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : ((A) -> Bool) -> Bool)"))(fn(
      x1346 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1347 = @tactics.mp_tac(x1346)
      fn(
        x1348 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1347(x1348)
      }
    }),
  )
  let t1342 = @term_syntax.parse_term("(n : Num)")
  let t1345 = @tactics.first_x_assum(fn(
    x1344 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1339 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1340 = @tactics.mp_tac(x1339)
      fn(
        x1341 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1340(x1341)
      }
    })(((x1343 : @kernel.Thm) => @bool.spec(t1342, x1343))(x1344))
  })
  let t1338 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1371 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([
                          @theorems.and_forall_thm(),
                          @equal.gsym(@class.skolem_thm()),
                        ]),
                      ),
                      t1338,
                    ),
                    t1345,
                  ),
                  t1349,
                ),
                t1350,
              ),
              t1361,
            ),
            t1362,
          ),
          t1363,
        ),
        t1364,
      ),
      t1365,
    ),
    t1370,
  ])
  let t1337 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ c : (Num, Num, A) -> Bool, (∀ n : Num, ∀ m : Num, (P : ((A) -> Bool) -> Bool)(c(n, m))) && (∀ n : Num, UNIONS({c(n, (m : Num)) | IN(m, UNIV)}) == (s : (Num, A) -> Bool)(n))"),
    fn(
      x1334 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1335 = @tactics.mp_tac(x1334)
      fn(
        x1336 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1335(x1336)
      }
    },
  )
  let t1332 = @simp.asm_simp_tac(
    @list.List([
      @sets.unions_0(),
      @sets.unions_insert(),
      @sets.forall_in_insert(),
    ]),
  )
  let t1331 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1333 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
        t1331,
      ),
      t1332,
    ),
    @tactics.all_tac,
  ])
  let t1330 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ k : ((A) -> Bool) -> Bool, FINITE(k) && (∀ i : (A) -> Bool, IN(i, k) → (P : ((A) -> Bool) -> Bool)(i)) → P(UNIONS(k))"),
    fn(
      x1327 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1328 = @tactics.assume_tac(x1327)
      fn(
        x1329 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1328(x1329)
      }
    },
  )
  let t1326 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1325 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1498 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                                            @sets.union_of(),
                                            @trivia.o_thm(),
                                          ]),
                                        ),
                                        t1325,
                                      ),
                                      t1326,
                                    ),
                                    t1330,
                                  ),
                                  t1333,
                                ),
                                t1337,
                              ),
                              t1371,
                            ),
                            t1372,
                          ),
                          t1373,
                        ),
                        t1374,
                      ),
                      t1375,
                    ),
                    t1377,
                  ),
                  t1385,
                ),
                t1386,
              ),
              @tactics.strip_tac,
            ),
            t1387,
          ),
          t1388,
        ),
        t1389,
      ),
      t1390,
    ),
    t1497,
  )
  general_reduction_theorem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, P({}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(UNION(s, t))) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(DIFF(s, t))) → (∀ s : (Num, A) -> Bool, (∀ n : Num, UNION_OF(COUNTABLE, P, s(n))) → (∃ t : (Num, A) -> Bool, (∀ n : Num, UNION_OF(COUNTABLE, P, t(n))) && (∀ n : Num, SUBSET(t(n), s(n))) && pairwise((m : Num) => (n : Num) => DISJOINT(t(m), t(n)), UNIV) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == UNIONS({s((n : Num)) | IN(n, UNIV)})))"),
      t1498,
    ),
  )
}

///|
let general_reduction_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GENERAL_REDUCTION_THEOREM",
)

///|
/// `GENERAL_REDUCTION_THEOREM`
pub fn general_reduction_theorem() -> @kernel.Thm {
  general_reduction_theorem_c.get()
}

///|
/// GENERAL_REDUCTION_THEOREM_2
fn step_179() -> Unit raise {
  let t1543 = @meson.asm_meson_tac(@list.List([]))
  let t1542 = @simp.asm_simp_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]),
  )
  let t1541 = @simp.rewrite_tac(
    @list.List([
      @sets.empty_unions(),
      @sets.forall_in_image(),
      @sets.in_univ(),
      @sets.in_diff(),
    ]),
  )
  let t1538 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("UNION((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == UNION((s' : (_) -> Bool), UNION((t' : (_) -> Bool), (u' : (_) -> Bool))) → u == {} && u' == {} → UNION(s, t) == UNION(s', t')"),
    ),
  )
  let t1540 = @tactics.disch_then(fn(
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
    (fn(
      x1535 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1536 = @tactics.mp_tac(x1535)
      fn(
        x1537 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1536(x1537)
      }
    })(t1538(x1539))
  })
  let t1534 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t1533 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1528 = @term_syntax.parse_term("1")
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
      x1530 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1525 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1526 = @tactics.mp_tac(x1525)
        fn(
          x1527 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1526(x1527)
        }
      })(((x1529 : @kernel.Thm) => @bool.spec(t1528, x1529))(x1530))
    })(@bool.conjunct1(x1531))
  })
  let t1524 = @simp.simp_tac(
    @list.List([
      @sets.simple_image(),
      @sets.image_clauses(),
      @sets.unions_insert(),
      @sets.pairwise_insert(),
    ]),
  )
  let t1523 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("UNIV == INSERT(0, INSERT(1, DIFF(UNIV, {0, 1})))"),
      ),
    ]),
  )
  let t1522 = @simp.simp_tac(@list.List([@sets.subset_empty()]))
  let t1521 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1520 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) == (P(0) && P(1) && (∀ n : Num, !(n == 0) && !(n == 1) → P(n)))"),
      ),
    ]),
  )
  let t1517 = @drule.match_mp(
    @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) → P(0) && P(1)")),
  )
  let t1519 = @tactics.disch_then(fn(
    x1518 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(t1517(x1518))
  })
  let t1516 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1515 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(v : (Num, A) -> Bool)"))(fn(
      x1512 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1513 = @tactics.mp_tac(x1512)
      fn(
        x1514 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1513(x1514)
      }
    }),
  )
  let t1510 = @simp.asm_simp_tac(@list.List([@card.countable_union_of_inc()]))
  let t1511 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.repeat_tac(
          @tactics.then_tac(
            @class.cond_cases_tac,
            @simp.asm_rewrite_tac(@list.List([])),
          ),
        ),
      ),
      t1510,
    ),
    @tactics.all_tac,
  ])
  let t1509 = @simp.rewrite_tac(@list.List([]))
  let t1506 = @drule.match_mp(general_reduction_theorem())
  let t1503 = @term_syntax.parse_term("(n : Num) => if n == 0 { (s : (A) -> Bool) } else { if n == 1 { (t : (A) -> Bool) } else { {} } }")
  let t1508 = @tactics.first_assum(fn(
    x1507 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      (fn(
        x1500 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1501 = @tactics.mp_tac(x1500)
        fn(
          x1502 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1501(x1502)
        }
      })(((x1504 : @kernel.Thm) => @bool.ispec(t1503, x1504))(x1505))
    })(t1506(x1507))
  })
  let t1499 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1544 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
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
                                                @tactics.gen_tac, @tactics.disch_tac,
                                              ),
                                              t1499,
                                            ),
                                            t1508,
                                          ),
                                          t1509,
                                        ),
                                        @tactics.ants_tac,
                                      ),
                                      t1511,
                                    ),
                                    t1515,
                                  ),
                                  t1516,
                                ),
                                t1519,
                              ),
                              t1520,
                            ),
                            t1521,
                          ),
                          t1522,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1523,
                    ),
                    t1524,
                  ),
                  t1532,
                ),
                t1533,
              ),
              t1534,
            ),
            @tactics.strip_tac,
          ),
          t1540,
        ),
        t1541,
      ),
      t1542,
    ),
    t1543,
  )
  general_reduction_theorem_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, P({}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(UNION(s, t))) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(DIFF(s, t))) → (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) → (∃ s' : (A) -> Bool, ∃ t' : (A) -> Bool, UNION_OF(COUNTABLE, P, s') && UNION_OF(COUNTABLE, P, t') && SUBSET(s', s) && SUBSET(t', t) && DISJOINT(s', t') && UNION(s', t') == UNION(s, t)))"),
      t1544,
    ),
  )
}

///|
let general_reduction_theorem_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GENERAL_REDUCTION_THEOREM_2",
)

///|
/// `GENERAL_REDUCTION_THEOREM_2`
pub fn general_reduction_theorem_2() -> @kernel.Thm {
  general_reduction_theorem_2_c.get()
}

///|
/// BACK_AND_FORTH_ALT
fn step_180() -> Unit raise {
  let t1648 = @sets.set_tac(@list.List([]))
  let t1647 = @simp.rewrite_tac(
    @list.List([
      @sets.in_image(),
      @pair.exists_pair_thm(),
      @theorems.unwind_thm1(),
      @theorems.right_exists_and_thm(),
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.in_cross(),
    ]),
  )
  let t1646 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1643 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1644 = @tactics.mp_tac(x1643)
      fn(
        x1645 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1644(x1645)
      }
    }),
  )
  let t1649 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @sets.unions_gspec(),
            @sets.in_univ(),
            @sets.in_elim_thm(),
          ]),
        ),
        t1646,
      ),
      t1647,
    ),
    t1648,
  )
  let t1642 = @sets.set_tac(@list.List([]))
  let t1641 = @simp.asm_rewrite_tac(@list.List([]))
  let t1640 = @tactics.match_mp_tac(@arith.transitive_stepwise_le())
  let t1639 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) → (Q : (_, _) -> Bool)(x, y)) → (∀ x : _, ∀ y : _, P(x, y) → Q(x, y) || (R : (_, _) -> Bool)(x, y))"),
    ),
  )
  let t1638 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t1637 = @tactics.match_mp_tac(@arith.wlog_le())
  let t1636 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t1635 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.forall_in_gspec(),
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
    ]),
  )
  let t1650 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.match_mp_tac(@sets.pairwise_chain_unions()),
                      t1635,
                    ),
                    t1636,
                  ),
                  t1637,
                ),
                @tactics.conj_tac,
              ),
              t1638,
            ),
            t1639,
          ),
          t1640,
        ),
        t1641,
      ),
      t1642,
    ),
    t1649,
  ])
  let t1634 = @simp.asm_rewrite_tac(
    @list.List([@sets.unions_subset(), @sets.forall_in_gspec()]),
  )
  let t1651 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("UNIONS({(R : (Num, (A, B)) -> Bool)((n : Num)) | IN(n, UNIV)})"),
        ),
        t1634,
      ),
      @tactics.conj_tac,
    ),
    t1650,
  )
  let t1631 = @sets.set_tac(@list.List([]))
  let t1630 = @simp.rewrite_tac(
    @list.List([@sets.image_clauses(), @sets.in_insert()]),
  )
  let t1629 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.insert_subset(), @sets.in_cross()]),
  )
  let t1628 = @tactics.exists_tac(
    @term_syntax.parse_term("INSERT(((w : A), (y : (Num) -> B)((n : Num))), (R : ((A, B)) -> Bool))"),
  )
  let t1627 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : A)"))
  let t1626 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t1621 = @term_syntax.parse_term("(y : (Num) -> B)((n : Num))")
  let t1625 = @tactics.disch_then(fn(
    x1624 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1623 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1618 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1619 = @tactics.mp_tac(x1618)
        fn(
          x1620 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1619(x1620)
        }
      })(((x1622 : @kernel.Thm) => @bool.spec(t1621, x1622))(x1623))
    })(@bool.conjunct2(x1624))
  })
  let t1617 = @list.List([
    @simp.asm_rewrite_tac(@list.List([])),
    @tactics.all_tac,
  ])
  let t1613 = @term_syntax.parse_term("(R : ((A, B)) -> Bool)")
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
      x1610 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1611 = @tactics.mp_tac(x1610)
      fn(
        x1612 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1611(x1612)
      }
    })(((x1614 : @kernel.Thm) => @bool.spec(t1613, x1614))(x1615))
  })
  let t1609 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@sets.subset_refl()])),
  ])
  let t1608 = @simp.asm_rewrite_tac(@list.List([]))
  let t1632 = @tactics.then_tac(
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
                            @class.asm_cases_tac(
                              @term_syntax.parse_term("IN((y : (Num) -> B)((n : Num)), (t : (B) -> Bool))"),
                            ),
                            t1608,
                          ),
                          t1609,
                        ),
                        t1616,
                      ),
                      @tactics.ants_tac,
                    ),
                    t1617,
                  ),
                  t1625,
                ),
                t1626,
              ),
              t1627,
            ),
            @tactics.strip_tac,
          ),
          t1628,
        ),
        t1629,
      ),
      t1630,
    ),
    t1631,
  )
  let t1605 = @sets.set_tac(@list.List([]))
  let t1604 = @simp.rewrite_tac(
    @list.List([@sets.image_clauses(), @sets.in_insert()]),
  )
  let t1603 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.insert_subset(), @sets.in_cross()]),
  )
  let t1606 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("INSERT(((x : (Num) -> A)((n : Num)), (z : B)), (R : ((A, B)) -> Bool))"),
        ),
        t1603,
      ),
      t1604,
    ),
    t1605,
  )
  let t1602 = @sets.set_tac(@list.List([]))
  let t1601 = @simp.rewrite_tac(
    @list.List([@sets.image_clauses(), @sets.in_insert()]),
  )
  let t1600 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.insert_subset(), @sets.in_cross()]),
  )
  let t1599 = @tactics.exists_tac(
    @term_syntax.parse_term("INSERT(((w : A), (y : (Num) -> B)((n : Num))), INSERT(((x : (Num) -> A)(n), (z : B)), (R : ((A, B)) -> Bool)))"),
  )
  let t1598 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : A)"))
  let t1597 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t1592 = @term_syntax.parse_term("(y : (Num) -> B)((n : Num))")
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
      x1594 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
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
        let s1590 = @tactics.mp_tac(x1589)
        fn(
          x1591 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1590(x1591)
        }
      })(((x1593 : @kernel.Thm) => @bool.spec(t1592, x1593))(x1594))
    })(@bool.conjunct2(x1595))
  })
  let t1588 = @simp.asm_rewrite_tac(@list.List([@sets.in_cross()]))
  let t1587 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.insert_subset()]),
  )
  let t1584 = @term_syntax.parse_term("INSERT(((x : (Num) -> A)((n : Num)), (z : B)), (R : ((A, B)) -> Bool))")
  let t1607 = @list.List([
    @tactics.then_tac(
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
                          x1586 : @kernel.Thm,
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
                            x1581 : @kernel.Thm,
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
                            let s1582 = @tactics.mp_tac(x1581)
                            fn(
                              x1583 : (
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
                              s1582(x1583)
                            }
                          })(
                            ((x1585 : @kernel.Thm) => @bool.spec(t1584, x1585))(
                              x1586,
                            ),
                          )
                        }),
                        t1587,
                      ),
                      t1588,
                    ),
                    t1596,
                  ),
                  t1597,
                ),
                t1598,
              ),
              @tactics.strip_tac,
            ),
            t1599,
          ),
          t1600,
        ),
        t1601,
      ),
      t1602,
    ),
    t1606,
  ])
  let t1580 = @simp.asm_rewrite_tac(@list.List([]))
  let t1579 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : (Num) -> B)((n : Num)), (t : (B) -> Bool))"))
  let t1578 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : B)"))
  let t1577 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t1572 = @term_syntax.parse_term("(x : (Num) -> A)((n : Num))")
  let t1576 = @tactics.disch_then(fn(
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
      x1574 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1569 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1570 = @tactics.mp_tac(x1569)
        fn(
          x1571 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1570(x1571)
        }
      })(((x1573 : @kernel.Thm) => @bool.spec(t1572, x1573))(x1574))
    })(@bool.conjunct1(x1575))
  })
  let t1568 = @list.List([
    @simp.asm_rewrite_tac(@list.List([])),
    @tactics.all_tac,
  ])
  let t1565 = @term_syntax.parse_term("(R : ((A, B)) -> Bool)")
  let t1633 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.first_assum(fn(
                        x1567 : @kernel.Thm,
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
                          x1562 : @kernel.Thm,
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
                          let s1563 = @tactics.mp_tac(x1562)
                          fn(
                            x1564 : (
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
                            s1563(x1564)
                          }
                        })(
                          ((x1566 : @kernel.Thm) => @bool.spec(t1565, x1566))(
                            x1567,
                          ),
                        )
                      }),
                      @tactics.ants_tac,
                    ),
                    t1568,
                  ),
                  t1576,
                ),
                t1577,
              ),
              t1578,
            ),
            @tactics.strip_tac,
          ),
          t1579,
        ),
        t1580,
      ),
      t1607,
    ),
    t1632,
  ])
  let t1561 = @simp.asm_rewrite_tac(@list.List([]))
  let t1560 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : (Num) -> A)((n : Num)), (s : (A) -> Bool))"))
  let t1557 = @term_syntax.parse_term("(R : ((A, B)) -> Bool)")
  let t1558 = @tactics.then_tac(
    @tactics.map_every(
      @tactics.x_gen_tac,
      @list.List([@term_syntax.parse_term("(n : Num)"), t1557]),
    ),
    @tactics.strip_tac,
  )
  let t1556 = @simp.rewrite_tac(
    @list.List([
      @sets.empty_subset(),
      @sets.pairwise_empty(),
      @sets.finite_rules(),
    ]),
  )
  let t1552 = @term_syntax.parse_term("({} : ((A, B)) -> Bool)")
  let t1553 = @list.List([@term_syntax.parse_term("0"), t1552])
  let t1559 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x1555 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
          let s1550 = @tactics.mp_tac(x1549)
          fn(
            x1551 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1550(x1551)
          }
        })(((x1554 : @kernel.Thm) => @bool.specl(t1553, x1554))(x1555))
      }),
      t1556,
    ),
    t1558,
  ])
  let t1548 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("((∀ n : Num, ∀ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x) → (∃ y : _, (B : (Num, _, _) -> Bool)(n, x, y))) → (X : Bool)) && (∀ n : Num, ∀ x : _, P(x) && Q(x) && R(x) → (∃ y : _, B(n, x, y))) → X && (∀ n : Num, ∀ x : _, P(x) && Q(x) && R(x) && (S : (Num, _) -> Bool)(n, x) → (∃ y : _, B(SUC(n), x, y)))"),
    ),
  )
  let t1652 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(@arith.dependent_choice()),
                t1548,
              ),
              @tactics.conj_tac,
            ),
            t1559,
          ),
          t1560,
        ),
        t1561,
      ),
      t1633,
    ),
    t1651,
  ])
  let t1547 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ R : (Num, (A, B)) -> Bool, (∀ n : Num, FINITE(R(n)) && SUBSET(R(n), CROSS((s : (A) -> Bool), (t : (B) -> Bool))) && pairwise((P : ((A, B), (A, B)) -> Bool), R(n)) && (IN((x : (Num) -> A)(n), s) → IN(x(n), IMAGE(FST, R(n)))) && (IN((y : (Num) -> B)(n), t) → IN(y(n), IMAGE(SND, R(n))))) && (∀ n : Num, SUBSET(R(n), R(SUC(n))))"),
    @tactics.strip_assume_tac,
  )
  let t1546 = @list.List([
    @meson.asm_meson_tac(@list.List([@card.countable_as_image_subset()])),
    @tactics.all_tac,
  ])
  let t1545 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : (Num) -> A, ∃ y : (Num) -> B, SUBSET((s : (A) -> Bool), IMAGE(x, UNIV)) && SUBSET((t : (B) -> Bool), IMAGE(y, UNIV))"),
    @tactics.strip_assume_tac,
  )
  let t1653 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1545),
        t1546,
      ),
      t1547,
    ),
    t1652,
  )
  back_and_forth_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B), (A, B)) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) && (∀ R : ((A, B)) -> Bool, FINITE(R) && SUBSET(R, CROSS(s, t)) && pairwise(P, R) → (∀ x : A, IN(x, s) → (∃ y : B, IN(y, t) && pairwise(P, INSERT((x, y), R)))) && (∀ y : B, IN(y, t) → (∃ x : A, IN(x, s) && pairwise(P, INSERT((x, y), R))))) → (∃ R : ((A, B)) -> Bool, SUBSET(R, CROSS(s, t)) && pairwise(P, R) && (∀ x : A, IN(x, s) → (∃ y : B, IN(y, t) && IN((x, y), R))) && (∀ y : B, IN(y, t) → (∃ x : A, IN(x, s) && IN((x, y), R))))"),
      t1653,
    ),
  )
}

///|
let back_and_forth_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BACK_AND_FORTH_ALT",
)

///|
/// `BACK_AND_FORTH_ALT`
pub fn back_and_forth_alt() -> @kernel.Thm {
  back_and_forth_alt_c.get()
}

///|
/// BACK_AND_FORTH
fn step_181() -> Unit raise {
  let t1763 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1764 = @tactics.then_tac(
    @tactics.match_mp_tac(@theorems.mono_exists()),
    t1763,
  )
  let t1760 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1761 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(x : A)")),
    t1760,
  )
  let t1762 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1761])
  let t1765 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("∃ x : A, IN(x, (s' : (A) -> Bool)) && (f : (A) -> B)(x) == (y : B)"),
        @tactics.strip_assume_tac,
      ),
      t1762,
    ),
    t1764,
  ])
  let t1759 = @simp.asm_rewrite_tac(@list.List([]))
  let t1758 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : B), (t' : (B) -> Bool))"))
  let t1757 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff()]))
  let t1756 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : B), (t : (B) -> Bool))"))
  let t1766 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)")),
            t1756,
          ),
          t1757,
        ),
        t1758,
      ),
      t1759,
    ),
    t1765,
  )
  let t1755 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1754 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1752 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1753 = @list.List([
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)((x : A))")),
      t1752,
    ),
    @tactics.all_tac,
  ])
  let t1751 = @simp.asm_rewrite_tac(@list.List([]))
  let t1750 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s' : (A) -> Bool))"))
  let t1749 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff()]))
  let t1748 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t1767 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")),
                  t1748,
                ),
                t1749,
              ),
              t1750,
            ),
            t1751,
          ),
          t1753,
        ),
        t1754,
      ),
      t1755,
    ),
    t1766,
  ])
  let t1747 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1746 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1744 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1743 = @simp.asm_rewrite_tac(@list.List([]))
  let t1742 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t1740 = @term_syntax.parse_term("(y : A)")
  let t1741 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t1740]),
  )
  let t1745 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.replicate_tac(
                2,
                @tactics.thenl(
                  @tactics.conj_tac,
                  @list.List([
                    @meson.asm_meson_tac(@list.List([@sets.finite_image()])),
                    @tactics.all_tac,
                  ]),
                ),
              ),
              @tactics.conj_tac,
            ),
            t1741,
          ),
          t1742,
        ),
        t1743,
      ),
      t1744,
    ),
    @tactics.all_tac,
  ])
  let t1738 = @simp.asm_rewrite_tac(@list.List([]))
  let t1737 = @meson.asm_meson_tac(@list.List([]))
  let t1736 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @trivia.o_thm()]),
  )
  let t1735 = @tactics.match_mp_tac(@sets.image_eq())
  let t1734 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t1739 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.map_every(
              fn(
                x1731 : String,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s1732 = @simp.expand_tac(x1731)
                fn(
                  x1733 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s1732(x1733)
                }
              },
              @list.List(["s'", "t'"]),
            ),
            t1734,
          ),
          t1735,
        ),
        t1736,
      ),
      t1737,
    ),
    t1738,
  ])
  let t1730 = @tactics.subgoal_then(
    @term_syntax.parse_term("IMAGE((f : (A) -> B), (s' : (A) -> Bool)) == (t' : (B) -> Bool)"),
    fn(
      x1727 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1728 = @tactics.assume_tac(x1727)
      fn(
        x1729 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1728(x1729)
      }
    },
  )
  let t1725 = @meson.asm_meson_tac(@list.List([]))
  let t1724 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.forall_in_image(),
    ]),
  )
  let t1726 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x1721 : String,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1722 = @simp.expand_tac(x1721)
            fn(
              x1723 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1722(x1723)
            }
          },
          @list.List(["s'", "t'"]),
        ),
        t1724,
      ),
      t1725,
    ),
    @tactics.all_tac,
  ])
  let t1720 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((s' : (A) -> Bool), (s : (A) -> Bool)) && SUBSET((t' : (B) -> Bool), (t : (B) -> Bool))"),
    @tactics.strip_assume_tac,
  )
  let t1718 = @simp.asm_rewrite_tac(@list.List([]))
  let t1717 = @meson.asm_meson_tac(@list.List([]))
  let t1716 = @simp.rewrite_tac(
    @list.List([@sets.in_image(), @pair.exists_pair_thm()]),
  )
  let t1719 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x1713 : String,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1714 = @simp.expand_tac(x1713)
            fn(
              x1715 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1714(x1715)
            }
          },
          @list.List(["f", "s'", "t'"]),
        ),
        t1716,
      ),
      t1717,
    ),
    t1718,
  ])
  let t1712 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : B, IN((x, y), (r : ((A, B)) -> Bool)) == (IN(x, (s' : (A) -> Bool)) && IN(y, (t' : (B) -> Bool)) && (f : (A) -> B)(x) == y)"),
    fn(
      x1709 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1710 = @tactics.assume_tac(x1709)
      fn(
        x1711 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1710(x1711)
      }
    },
  )
  let t1703 = @term_syntax.parse_term("(t' : (B) -> Bool)")
  let t1704 = @term_syntax.parse_term("(s' : (A) -> Bool)")
  let t1705 = @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1704, t1703])
  let t1708 = @tactics.first_x_assum(fn(
    x1707 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1701 = @tactics.mp_tac(x1700)
      fn(
        x1702 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1701(x1702)
      }
    })(((x1706 : @kernel.Thm) => @bool.specl(t1705, x1706))(x1707))
  })
  let t1697 = @term_syntax.parse_term("(f : (A) -> B) == ((x : A) => select((y : B) => IN((x, y), (r : ((A, B)) -> Bool))))")
  let t1698 = @term_syntax.parse_term("(t' : (B) -> Bool) == IMAGE(SND, (r : ((A, B)) -> Bool))")
  let t1699 = @tactics.map_every(
    @simp.abbrev_tac,
    @list.List([
      @term_syntax.parse_term("(s' : (A) -> Bool) == IMAGE(FST, (r : ((A, B)) -> Bool))"),
      t1698,
      t1697,
    ]),
  )
  let t1696 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @pair.pair_eq(),
      @theorems.left_imp_exists_thm(),
      @sets.in_cross(),
    ]),
  )
  let t1695 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.pairwise()]))
  let t1694 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : ((A, B)) -> Bool)"))
  let t1692 = @meson.asm_meson_tac(@list.List([]))
  let t1691 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t1684 = @term_syntax.parse_term("(f : (A) -> B)((y : A))")
  let t1685 = @term_syntax.parse_term("(y : A)")
  let t1686 = @term_syntax.parse_term("(f : (A) -> B)((x : A))")
  let t1687 = @list.List([@term_syntax.parse_term("(x : A)"), t1686, t1685, t1684])
  let t1690 = @tactics.first_x_assum(fn(
    x1689 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1682 = @tactics.mp_tac(x1681)
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
    })(((x1688 : @kernel.Thm) => @bool.specl(t1687, x1688))(x1689))
  })
  let t1679 = @term_syntax.parse_term("(y : A)")
  let t1680 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t1679]),
  )
  let t1678 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1676 = @meson.asm_meson_tac(@list.List([]))
  let t1677 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image()])),
      t1676,
    ),
    @tactics.all_tac,
  ])
  let t1674 = @meson.asm_meson_tac(@list.List([]))
  let t1673 = @simp.rewrite_tac(@list.List([]))
  let t1675 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t1673), t1674),
    @tactics.all_tac,
  ])
  let t1672 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : B, IN(x, (s : (A) -> Bool)) → ((f : (A) -> B)(x) == y) == IN((x, y), (r : ((A, B)) -> Bool))"),
    fn(
      x1669 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1670 = @tactics.assume_tac(x1669)
      fn(
        x1671 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1670(x1671)
      }
    },
  )
  let t1668 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t1667 = @simp.abbrev_tac(
    @term_syntax.parse_term("(f : (A) -> B) == ((x : A) => select((y : B) => IN((x, y), (r : ((A, B)) -> Bool))))"),
  )
  let t1666 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_cross()]),
  )
  let t1663 = @simp.gen_rewrite_rule(
    fn(
      x1662 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1662
    },
    @list.List([@sets.subset()]),
  )
  let t1665 = @tactics.first_x_assum(fn(
    x1664 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1659 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1660 = @tactics.mp_tac(x1659)
      fn(
        x1661 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1660(x1661)
      }
    })(t1663(x1664))
  })
  let t1658 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : ((A, B)) -> Bool)"))
  let t1693 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @simp.rewrite_tac(
                                          @list.List([
                                            @sets.pairwise(),
                                            @pair.forall_pair_thm(),
                                            @pair.pair_eq(),
                                            @theorems.left_imp_exists_thm(),
                                          ]),
                                        ),
                                        t1658,
                                      ),
                                      @tactics.strip_tac,
                                    ),
                                    t1665,
                                  ),
                                  t1666,
                                ),
                                @tactics.strip_tac,
                              ),
                              t1667,
                            ),
                            t1668,
                          ),
                          t1672,
                        ),
                        t1675,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1677,
                  ),
                  @tactics.conj_tac,
                ),
                t1678,
              ),
              t1680,
            ),
            @tactics.strip_tac,
          ),
          t1690,
        ),
        t1691,
      ),
      t1692,
    ),
  ])
  let t1657 = @simp.asm_simp_tac(
    @list.List([
      @sets.pairwise_insert(),
      @pair.forall_pair_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t1654 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1655 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1656 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("fn { (x, y) => fn { (x', y') => (x == x') == (y == y') && (R : (A, A, B, B) -> Bool)(x, x', y, y') } }"),
        t1655,
        t1654,
      ]),
      back_and_forth_alt(),
    ),
  )
  let t1768 = @tactics.thenl(
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
                                              t1656,
                                            ),
                                            t1657,
                                          ),
                                          @tactics.ants_tac,
                                        ),
                                        t1693,
                                      ),
                                      t1694,
                                    ),
                                    t1695,
                                  ),
                                  t1696,
                                ),
                                @tactics.strip_tac,
                              ),
                              t1699,
                            ),
                            t1708,
                          ),
                          t1712,
                        ),
                        t1719,
                      ),
                      t1720,
                    ),
                    t1726,
                  ),
                  t1730,
                ),
                t1739,
              ),
              @tactics.ants_tac,
            ),
            t1745,
          ),
          t1746,
        ),
        @tactics.conj_tac,
      ),
      t1747,
    ),
    t1767,
  )
  back_and_forth_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A, B, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ x : A, ∀ y : B, IN(x, s) && IN(y, t) → R(x, x, y, y)) && (∀ x : A, ∀ y : B, ∀ x' : A, ∀ y' : B, IN(x, s) && IN(x', s) && IN(y, t) && IN(y', t) && !(x == x') && !(y == y') && R(x, x', y, y') → R(x', x, y', y)) && COUNTABLE(s) && COUNTABLE(t) && (∀ f : (A) -> B, ∀ s' : (A) -> Bool, ∀ t' : (B) -> Bool, FINITE(s') && SUBSET(s', s) && FINITE(t') && SUBSET(t', t) && IMAGE(f, s') == t' && (∀ x : A, ∀ y : A, IN(x, s') && IN(y, s') → (f(x) == f(y)) == (x == y)) && (∀ x : A, ∀ y : A, IN(x, s') && IN(y, s') → R(x, y, f(x), f(y))) → (∀ x : A, IN(x, DIFF(s, s')) → (∃ y : B, IN(y, DIFF(t, t')) && (∀ z : A, IN(z, s') → R(x, z, y, f(z))))) && (∀ y : B, IN(y, DIFF(t, t')) → (∃ x : A, IN(x, DIFF(s, s')) && (∀ z : A, IN(z, s') → R(x, z, y, f(z)))))) → (∃ f : (A) -> B, IMAGE(f, s) == t && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → R(x, y, f(x), f(y))))"),
      t1768,
    ),
  )
}

///|
let back_and_forth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BACK_AND_FORTH")

///|
/// `BACK_AND_FORTH`
pub fn back_and_forth() -> @kernel.Thm {
  back_and_forth_c.get()
}

///|
/// BACK_AND_FORTH_2
fn step_182() -> Unit raise {
  let t1811 = @simp.asm_simp_tac(@list.List([]))
  let t1810 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_image(), @sets.forall_in_image_2()]),
  )
  let t1809 = @simp.expand_tac("t'")
  let t1808 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.asm_tac(@sets.set_tac)(@list.List([])),
        @tactics.all_tac,
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1807 = @simp.asm_rewrite_tac(@list.List([]))
  let t1800 = @term_syntax.parse_term("(y : B)")
  let t1801 = @term_syntax.parse_term("(s' : (A) -> Bool)")
  let t1802 = @term_syntax.parse_term("(t' : (B) -> Bool)")
  let t1803 = @list.List([@term_syntax.parse_term("(g : (B) -> A)"), t1802, t1801, t1800])
  let t1806 = @tactics.first_x_assum(fn(
    x1805 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1797 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1798 = @tactics.mp_tac(x1797)
      fn(
        x1799 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1798(x1799)
      }
    })(((x1804 : @kernel.Thm) => @bool.specl(t1803, x1804))(x1805))
  })
  let t1796 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)"))
  let t1793 = @term_syntax.parse_term("(g : (B) -> A)")
  let t1795 = @tactics.disch_then((x1794 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1793, x1794)
  })
  let t1792 = @simp.gen_rewrite_tac(
    fn(
      x1789 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1790 = @equal.land_conv(x1789)
      fn(x1791 : @kernel.Term) -> @kernel.Thm raise { s1790(x1791) }
    },
    @list.List([@sets.injective_on_left_inverse()]),
  )
  let t1786 = @simp.gen_rewrite_rule(
    fn(
      x1785 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1785
    },
    @list.List([@equal.gsym(@sets.injective_on_alt())]),
  )
  let t1788 = @tactics.first_assum(fn(
    x1787 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1782 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1783 = @tactics.mp_tac(x1782)
      fn(
        x1784 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1783(x1784)
      }
    })(t1786(x1787))
  })
  let t1777 = @term_syntax.parse_term("(f : (A) -> B)")
  let t1780 = @tactics.first_x_assum(fn(
    x1779 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1776 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x1778 : @kernel.Thm) => @bool.spec(t1777, x1778))(x1779))
  })
  let t1775 = @simp.asm_rewrite_tac(@list.List([]))
  let t1774 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1781 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")),
          @tactics.strip_tac,
        ),
        t1774,
      ),
      t1775,
    ),
    t1780,
  ])
  let t1771 = @term_syntax.parse_term("(t' : (B) -> Bool)")
  let t1772 = @term_syntax.parse_term("(s' : (A) -> Bool)")
  let t1773 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1772, t1771]),
  )
  let t1770 = @simp.asm_rewrite_tac(@list.List([]))
  let t1769 = @tactics.match_mp_tac(back_and_forth())
  let t1812 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.strip_tac),
                                      t1769,
                                    ),
                                    t1770,
                                  ),
                                  t1773,
                                ),
                                @tactics.strip_tac,
                              ),
                              @tactics.conj_tac,
                            ),
                            t1781,
                          ),
                          t1788,
                        ),
                        t1792,
                      ),
                      t1795,
                    ),
                    t1796,
                  ),
                  @tactics.disch_tac,
                ),
                t1806,
              ),
              t1807,
            ),
            @tactics.ants_tac,
          ),
          t1808,
        ),
        t1809,
      ),
      t1810,
    ),
    t1811,
  )
  back_and_forth_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A, B, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ x : A, ∀ y : B, IN(x, s) && IN(y, t) → R(x, x, y, y)) && (∀ x : A, ∀ y : B, ∀ x' : A, ∀ y' : B, IN(x, s) && IN(x', s) && IN(y, t) && IN(y', t) && !(x == x') && !(y == y') && R(x, x', y, y') → R(x', x, y', y)) && COUNTABLE(s) && COUNTABLE(t) && (∀ f : (A) -> B, ∀ s' : (A) -> Bool, ∀ t' : (B) -> Bool, ∀ x : A, FINITE(s') && SUBSET(s', s) && FINITE(t') && SUBSET(t', t) && IMAGE(f, s') == t' && (∀ x : A, ∀ y : A, IN(x, s') && IN(y, s') → (f(x) == f(y)) == (x == y)) && (∀ x : A, ∀ y : A, IN(x, s') && IN(y, s') → R(x, y, f(x), f(y))) && IN(x, DIFF(s, s')) → (∃ y : B, IN(y, DIFF(t, t')) && (∀ z : A, IN(z, s') → R(x, z, y, f(z))))) && (∀ f : (B) -> A, ∀ t' : (B) -> Bool, ∀ s' : (A) -> Bool, ∀ x : B, FINITE(t') && SUBSET(t', t) && FINITE(s') && SUBSET(s', s) && IMAGE(f, t') == s' && (∀ x : B, ∀ y : B, IN(x, t') && IN(y, t') → (f(x) == f(y)) == (x == y)) && (∀ x : B, ∀ y : B, IN(x, t') && IN(y, t') → R(f(x), f(y), x, y)) && IN(x, DIFF(t, t')) → (∃ y : A, IN(y, DIFF(s, s')) && (∀ z : B, IN(z, t') → R(y, f(z), x, z)))) → (∃ f : (A) -> B, IMAGE(f, s) == t && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → R(x, y, f(x), f(y))))"),
      t1812,
    ),
  )
}

///|
let back_and_forth_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BACK_AND_FORTH_2",
)

///|
/// `BACK_AND_FORTH_2`
pub fn back_and_forth_2() -> @kernel.Thm {
  back_and_forth_2_c.get()
}

///|
/// RECURSION_ON_DYADIC_FRACTIONS
fn step_183() -> Unit raise {
  let t1946 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1945 = @simp.asm_rewrite_tac(@list.List([]))
  let t1942 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Num, Num) -> A)((n : Num), (b : Num))"))
  let t1941 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1940 = @simp.asm_rewrite_tac(@list.List([]))
  let t1939 = @tactics.exists_tac(
    @term_syntax.parse_term("(g : (Num, Num) -> A)((n : Num), (a : Num) + 1)"),
  )
  let t1938 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1937 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1943 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) + 1 == (b : Num)")),
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
  )
  let t1936 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1935 = @simp.asm_rewrite_tac(@list.List([]))
  let t1934 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Num, Num) -> A)((n : Num), (b : Num))"))
  let t1933 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1932 = @simp.asm_rewrite_tac(@list.List([]))
  let t1944 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == (b : Num)")),
                t1932,
              ),
              t1933,
            ),
            t1934,
          ),
          t1935,
        ),
        t1936,
      ),
      @int.asm_arith_tac,
    ),
    t1943,
  ])
  let t1929 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1928 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1927 = @tactics.conv_tac(@class.select_conv)
  let t1930 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.expand_tac("z"), t1927),
          t1928,
        ),
        t1929,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1926 = @tactics.subgoal_then(
    @term_syntax.parse_term("(R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (b : Num)), (z : A)) && R(z, g(n, b + 1))"),
    @tactics.strip_assume_tac,
  )
  let t1931 = @tactics.thenl(
    @tactics.then_tac(
      @simp.abbrev_tac(
        @term_syntax.parse_term("(z : A) == select((z : A) => (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (b : Num)), z) && R(z, g(n, b + 1)))"),
      ),
      t1926,
    ),
    t1930,
  )
  let t1924 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1923 = @simp.asm_rewrite_tac(@list.List([]))
  let t1922 = @tactics.exists_tac(
    @term_syntax.parse_term("(g : (Num, Num) -> A)((n : Num), (a : Num) + 1)"),
  )
  let t1921 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1920 = @simp.asm_rewrite_tac(@list.List([]))
  let t1925 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == (a : Num) + 1")),
                t1920,
              ),
              t1921,
            ),
            t1922,
          ),
          t1923,
        ),
        t1924,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1917 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1916 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1915 = @tactics.conv_tac(@class.select_conv)
  let t1918 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.expand_tac("w"), t1915),
          t1916,
        ),
        t1917,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1914 = @tactics.subgoal_then(
    @term_syntax.parse_term("(R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (a : Num)), (w : A)) && R(w, g(n, a + 1))"),
    @tactics.strip_assume_tac,
  )
  let t1919 = @tactics.thenl(
    @tactics.then_tac(
      @simp.abbrev_tac(
        @term_syntax.parse_term("(w : A) == select((z : A) => (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (a : Num)), z) && R(z, g(n, a + 1)))"),
      ),
      t1914,
    ),
    t1918,
  )
  let t1913 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(@tactics.match_mp_tac),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
    @tactics.all_tac,
    @tactics.all_tac,
  ])
  let t1911 = @int.arith_rule(
    @term_syntax.parse_term("DIV(2 * (a : Num) + 1 + 1, 2) == a + 1"),
  )
  let t1912 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.add1(),
      @arith.add_sub(),
      @arith.even_add(),
      @arith.even_mult(),
      @calc_num.arith_even(),
      @int.arith_rule(@term_syntax.parse_term("DIV(2 * (a : Num), 2) == a")),
      t1911,
    ]),
  )
  let t1910 = @tactics.disch_then(fn(
    x1907 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1908 = @tactics.subst_all_tac(x1907)
    fn(
      x1909 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1908(x1909)
    }
  })
  let t1906 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t1905 = @tactics.disch_then(fn(
    x1902 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1903 = @tactics.subst_all_tac(x1902)
    fn(
      x1904 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1903(x1904)
    }
  })
  let t1901 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Num)"))
  let t1900 = @simp.rewrite_tac(
    @list.List([
      @arith.even_exists(),
      @arith.odd_exists(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1898 = @bool.spec(@term_syntax.parse_term("(k : Num)"), @arith.even_or_odd())
  let t1899 = @tactics.disj_cases_then(fn(
    x1895 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1896 = @tactics.mp_tac(x1895)
    fn(
      x1897 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1896(x1897)
    }
  })(t1898)
  let t1893 = @bool.spec(@term_syntax.parse_term("(j : Num)"), @arith.even_or_odd())
  let t1894 = @tactics.disj_cases_then(fn(
    x1890 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1891 = @tactics.mp_tac(x1890)
    fn(
      x1892 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1891(x1892)
    }
  })(t1893)
  let t1889 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t1888 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1885 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t1886 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")),
      @tactics.disch_tac,
    ),
    t1885,
  )
  let t1887 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @int.arith_rule(
          @term_syntax.parse_term("((j1 : Num) < (j2 : Num) && j2 <= EXP(2, 0)) == (j1 == 0 && j2 == 1)"),
        ),
        @calc_num.arith_eq(),
      ]),
    ),
    t1886,
  ])
  let t1884 = @tactics.match_mp_tac(@nums.num_induction())
  let t1878 = @simp.gen_rewrite_rule(
    fn(
      x1877 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1877
    },
    @list.List([@equal.gsym(@arith.not_lt())]),
  )
  let t1880 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
        x1876 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(t1878(x1879))
    }),
  )
  let t1875 = @simp.rewrite_tac(
    @list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]),
  )
  let t1874 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_of_num_pow(),
      @equal.gsym(@theorems.imp_conj_alt()),
    ]),
  )
  let t1873 = @simp.asm_rewrite_tac(@list.List([]))
  let t1869 = @term_syntax.parse_term("(n : Num)")
  let t1870 = @tactics.spec_tac(@term_syntax.parse_term("(n1 : Num) + (n2 : Num)"), t1869)
  let t1867 = @term_syntax.parse_term("(j1 : Num)")
  let t1868 = @tactics.spec_tac(@term_syntax.parse_term("EXP(2, (n2 : Num)) * (k1 : Num)"), t1867)
  let t1866 = @term_syntax.parse_term("(j2 : Num)")
  let t1871 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.spec_tac(@term_syntax.parse_term("EXP(2, (n1 : Num)) * (k2 : Num)"), t1866),
      t1868,
    ),
    t1870,
  )
  let t1865 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1872 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @calc_int.real_of_num_pow(),
          @realax.real_of_num_le(),
          @arith.exp_add(),
        ]),
      ),
      t1865,
    ),
    t1871,
  ])
  let t1864 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(EXP(2, (n1 : Num)) * (k2 : Num)) <= pow(real_of_num(2), n1 + (n2 : Num))"),
    fn(
      x1861 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1862 = @tactics.mp_tac(x1861)
      fn(
        x1863 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1862(x1863)
      }
    },
  )
  let t1860 = @simp.simp_tac(
    @list.List([
      @real.real_lt_div2_eq(),
      @real.real_lt_pow2(),
      @meson.meson(
        @list.List([@realax.real_of_num_mul(), @calc_int.real_of_num_pow()]),
        @term_syntax.parse_term("pow(real_of_num(2), (n : Num)) * real_of_num((k : Num)) == real_of_num(EXP(2, n) * k)"),
      ),
    ]),
  )
  let t1858 = @calc_rat.real_field(
    @term_syntax.parse_term("real_of_num((k1 : Num)) / pow(real_of_num(2), (n1 : Num)) == pow(real_of_num(2), (n2 : Num)) * real_of_num(k1) / pow(real_of_num(2), n1 + n2) && real_of_num((k2 : Num)) / pow(real_of_num(2), n2) == pow(real_of_num(2), n1) * real_of_num(k2) / pow(real_of_num(2), n1 + n2)"),
  )
  let t1859 = @tactics.conjuncts_then(fn(
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
    let s1856 = @tactics.subst1_tac(x1855)
    fn(
      x1857 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1856(x1857)
    }
  })(t1858)
  let t1853 = @term_syntax.parse_term("(n2 : Num)")
  let t1854 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k2 : Num)"), t1853]),
  )
  let t1851 = @term_syntax.parse_term("(n1 : Num)")
  let t1852 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k1 : Num)"), t1851]),
  )
  let t1881 = @tactics.then_tac(
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
                              @theorems.imp_conj(),
                              @theorems.right_forall_imp_thm(),
                              @sets.forall_in_gspec(),
                            ]),
                          ),
                          t1852,
                        ),
                        @tactics.disch_tac,
                      ),
                      t1854,
                    ),
                    @tactics.disch_tac,
                  ),
                  t1859,
                ),
                t1860,
              ),
              t1864,
            ),
            t1872,
          ),
          t1873,
        ),
        t1874,
      ),
      t1875,
    ),
    t1880,
  )
  let t1850 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1849 = @simp.asm_rewrite_tac(@list.List([]))
  let t1882 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.subst1_tac(
        @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) == real_of_num(1) / pow(real_of_num(2), 0)")),
      ),
      t1849,
    ),
    t1850,
  )
  let t1848 = @simp.asm_rewrite_tac(@list.List([]))
  let t1883 = @list.List([
    @tactics.then_tac(
      @tactics.subst1_tac(
        @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) == real_of_num(0) / pow(real_of_num(2), 0)")),
      ),
      t1848,
    ),
    t1882,
    t1881,
  ])
  let t1847 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1846 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Real) -> A)"))
  let t1844 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1843 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (n : Num), 2) == n"))]),
  )
  let t1842 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.even_mult(),
      @calc_num.arith_even(),
      @equal.gsym(@arith.mult_assoc()),
    ]),
  )
  let t1841 = @simp.simp_tac(
    @list.List([@arith.exp(), @arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t1840 = @simp.once_rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t1839 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ n : _, ∀ n' : _, ∀ d : _, n' == (f : (_, _) -> _)(d, n) → (∀ m : _, ∀ m' : _, (g : (_, _) -> _)(d, m) == m' → (P : (_, _, _, _) -> Bool)(m, m', n, d))) == (∀ d : _, ∀ m : _, ∀ n : _, P(m, g(d, m), n, d))"),
      ),
    ]),
  )
  let t1838 = @simp.simp_tac(
    @list.List([
      @arith.add_sub2(),
      @realax.real_of_num_mul(),
      @realax.real_of_num_eq(),
      @calc_int.real_of_num_pow(),
    ]),
  )
  let t1837 = @simp.simp_tac(
    @list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t1836 = @simp.simp_tac(
    @list.List([
      @calc_rat.real_field(
        @term_syntax.parse_term("!((y : Real) == real_of_num(0)) && !((y' : Real) == real_of_num(0)) → ((x : Real) / y == (x' : Real) / y') == (y' / y * x == x')"),
      ),
      @real.real_pow_eq_0(),
      @realax.real_of_num_eq(),
      @real.real_div_pow2(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1835 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t1834 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1833 = @tactics.match_mp_tac(@arith.wlog_le())
  let t1832 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ a : _, ∀ b : _, ∀ c : _, ∀ d : _, (P : (_, _, _, _) -> Bool)(a, b, c, d)) == (∀ b : _, ∀ d : _, ∀ a : _, ∀ c : _, P(a, b, c, d))"),
      ),
    ]),
  )
  let t1831 = @tactics.disch_then(fn(
    x1830 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1827 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1828 = @tactics.subst1_tac(x1827)
      fn(
        x1829 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1828(x1829)
      }
    })(@equal.sym(x1830))
  })
  let t1826 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @class.fun_eq_thm(), @trivia.o_thm()]),
  )
  let t1824 = @term_syntax.parse_term("GABS((f : ((Num, Num)) -> Real) => ∀ k : Num, ∀ n : Num, GEQ(f((k, n)), real_of_num(k) / pow(real_of_num(2), n)))")
  let t1825 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("GABS((f : ((Num, Num)) -> A) => ∀ k : Num, ∀ n : Num, GEQ(f((k, n)), (g : (Num, Num) -> A)(n, k)))"), t1824]),
      @sets.function_factors_left(),
    ),
  )
  let t1845 = @list.List([
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
                                    @simp.once_rewrite_tac(
                                      @list.List([@theorems.eq_sym_eq()]),
                                    ),
                                    t1825,
                                  ),
                                  t1826,
                                ),
                                t1831,
                              ),
                              t1832,
                            ),
                            t1833,
                          ),
                          t1834,
                        ),
                        t1835,
                      ),
                      t1836,
                    ),
                    t1837,
                  ),
                  t1838,
                ),
                t1839,
              ),
              t1840,
            ),
            @nums.induct_tac,
          ),
          t1841,
        ),
        t1842,
      ),
      t1843,
    ),
    t1844,
  ])
  let t1823 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : (Real) -> A, ∀ k : Num, ∀ n : Num, f(real_of_num(k) / pow(real_of_num(2), n)) == (g : (Num, Num) -> A)(n, k)"),
    fn(
      x1820 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1821 = @tactics.mp_tac(x1820)
      fn(
        x1822 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1821(x1822)
      }
    },
  )
  let t1819 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Num, Num) -> A)"))
  let t1818 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1817 = @list.List([
    @simp.rewrite_tac(@list.List([@nums.num_recursion()])),
    @tactics.all_tac,
  ])
  let t1816 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : (Num, Num) -> A, f(0) == ((k : Num) => if k == 0 { (a : A) } else { (b : A) }) && (∀ n : Num, f(SUC(n)) == ((k : Num) => if EVEN(k) { f(n, DIV(k, 2)) } else { select((z : A) => (R : (A, A) -> Bool)(f(n, DIV(k - 1, 2)), z) && R(z, f(n, DIV(k + 1, 2)))) }))"),
    fn(
      x1813 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1814 = @tactics.mp_tac(x1813)
      fn(
        x1815 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1814(x1815)
      }
    },
  )
  let t1947 = @tactics.then_tac(
    @tactics.then_tac(
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
                                                      @tactics.thenl(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.then_tac(
                                                              @tactics.then_tac(
                                                                @tactics.thenl(
                                                                  @tactics.then_tac(
                                                                    @tactics.repeat_tac(
                                                                      @tactics.strip_tac,
                                                                    ),
                                                                    t1816,
                                                                  ),
                                                                  t1817,
                                                                ),
                                                                t1818,
                                                              ),
                                                              t1819,
                                                            ),
                                                            @tactics.strip_tac,
                                                          ),
                                                          t1823,
                                                        ),
                                                        t1845,
                                                      ),
                                                      t1846,
                                                    ),
                                                    @tactics.strip_tac,
                                                  ),
                                                  t1847,
                                                ),
                                                t1883,
                                              ),
                                              t1884,
                                            ),
                                            @tactics.conj_tac,
                                          ),
                                          t1887,
                                        ),
                                        t1888,
                                      ),
                                      t1889,
                                    ),
                                    @tactics.strip_tac,
                                  ),
                                  t1894,
                                ),
                                t1899,
                              ),
                              t1900,
                            ),
                            t1901,
                          ),
                          t1905,
                        ),
                        t1906,
                      ),
                      t1910,
                    ),
                    t1912,
                  ),
                  t1913,
                ),
                t1919,
              ),
              t1925,
            ),
            t1931,
          ),
          t1944,
        ),
        t1945,
      ),
      t1946,
    ),
    @int.asm_arith_tac,
  )
  recursion_on_dyadic_fractions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ a : A, ∀ b : A, (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && R(a, b) && (∀ x : A, ∀ y : A, R(x, y) → (∃ z : A, R(x, z) && R(z, y))) → (∃ f : (Real) -> A, f(real_of_num(0)) == a && f(real_of_num(1)) == b && (∀ x : Real, ∀ y : Real, IN(x, {real_of_num((k : Num)) / pow(real_of_num(2), (n : Num)) | k <= EXP(2, n)}) && IN(y, {real_of_num((k : Num)) / pow(real_of_num(2), (n : Num)) | k <= EXP(2, n)}) && x < y → R(f(x), f(y))))"),
      t1947,
    ),
  )
}

///|
let recursion_on_dyadic_fractions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RECURSION_ON_DYADIC_FRACTIONS",
)

///|
/// `RECURSION_ON_DYADIC_FRACTIONS`
pub fn recursion_on_dyadic_fractions() -> @kernel.Thm {
  recursion_on_dyadic_fractions_c.get()
}

///|
/// suslin_operation
fn step_184() -> Unit raise {
  suslin_operation_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(suslin_operation : ((List[Num], A) -> Bool, A) -> Bool)((f : (List[Num], A) -> Bool)) == UNIONS({INTERS({f(list_of_seq((s : (Num) -> Num), (n : Num))) | 1 <= n}) | IN(s, UNIV)})"),
    ),
  )
}

///|
let suslin_operation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "suslin_operation",
)

///|
/// `suslin_operation`
pub fn suslin_operation() -> @kernel.Thm {
  suslin_operation_c.get()
}

///|
/// suslin
fn step_185() -> Unit raise {
  suslin_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(suslin : (((_) -> Bool) -> Bool, (_) -> Bool) -> Bool)((u : ((_) -> Bool) -> Bool)) == {suslin_operation((f : (List[Num], _) -> Bool)) | ∀ l : List[Num], !(l == NIL) → IN(f(l), u)}"),
    ),
  )
}

///|
let suslin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("suslin")

///|
/// `suslin`
pub fn suslin() -> @kernel.Thm {
  suslin_c.get()
}

///|
/// SUSLIN_INC
fn step_186() -> Unit raise {
  let t1956 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1955 = @tactics.mp_tac(@arith.le_refl())
  let t1954 = @simp.rewrite_tac(
    @list.List([@sets.inters_1(), @sets.unions_1()]),
  )
  let t1953 = @simp.rewrite_tac(
    @list.List([@sets.image_const(), @sets.univ_not_empty()]),
  )
  let t1952 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t1951 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t1950 = @simp.asm_rewrite_tac(@list.List([suslin_operation()]))
  let t1949 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : List[Num]) => (s : (A) -> Bool)"),
  )
  let t1948 = @simp.rewrite_tac(@list.List([suslin(), @sets.in_elim_thm()]))
  let t1957 = @tactics.then_tac(
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
                      t1948,
                    ),
                    t1949,
                  ),
                  t1950,
                ),
                t1951,
              ),
              t1952,
            ),
            t1953,
          ),
          @class.cond_cases_tac,
        ),
        t1954,
      ),
      t1955,
    ),
    t1956,
  )
  suslin_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, C(s) → suslin(C, s)"),
      t1957,
    ),
  )
}

///|
let suslin_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_INC")

///|
/// `SUSLIN_INC`
pub fn suslin_inc() -> @kernel.Thm {
  suslin_inc_c.get()
}

///|
/// SUSLIN_SUPERSET
fn step_187() -> Unit raise {
  let t1958 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_(), suslin_inc()]),
  )
  suslin_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : ((A) -> Bool) -> Bool, SUBSET(u, suslin(u))"),
      t1958,
    ),
  )
}

///|
let suslin_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUSLIN_SUPERSET",
)

///|
/// `SUSLIN_SUPERSET`
pub fn suslin_superset() -> @kernel.Thm {
  suslin_superset_c.get()
}

///|
/// SUSLIN_SUBSET
fn step_188() -> Unit raise {
  let t1959 = @sets.set_tac(@list.List([]))
  let t1960 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([suslin()])),
    t1959,
  )
  suslin_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ D : ((A) -> Bool) -> Bool, SUBSET(C, D) → SUBSET(suslin(C), suslin(D))"),
      t1960,
    ),
  )
}

///|
let suslin_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_SUBSET")

///|
/// `SUSLIN_SUBSET`
pub fn suslin_subset() -> @kernel.Thm {
  suslin_subset_c.get()
}

///|
/// SUSLIN_MONO
fn step_189() -> Unit raise {
  let t1961 = @sets.set_tac(@list.List([]))
  let t1962 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([suslin()])),
    t1961,
  )
  suslin_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ D : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, (∀ t : (A) -> Bool, C(t) → D(t)) && suslin(C, s) → suslin(D, s)"),
      t1962,
    ),
  )
}

///|
let suslin_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_MONO")

///|
/// `SUSLIN_MONO`
pub fn suslin_mono() -> @kernel.Thm {
  suslin_mono_c.get()
}

///|
/// SUSLIN_REGULAR
fn step_190() -> Unit raise {
  let t2008 = @meson.asm_meson_tac(
    @list.List([@arith.le_trans(), @arith.le_refl()]),
  )
  let t2007 = @meson.meson_tac(
    @list.List([@lists.el_list_of_seq(), @arith.lte_trans()]),
  )
  let t2009 = @list.List([
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @lists.list_eq(),
          @lists.length_list_of_seq(),
          @lists.el_list_of_seq(),
        ]),
      ),
      t2007,
    ),
    t2008,
  ])
  let t2006 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, 1 <= m && m <= n → list_of_seq((i : Num) => EL(i, list_of_seq((s : (Num) -> Num), n)), m) == list_of_seq(s, m)"),
    fn(
      x2004 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x2004
      @simp.simp_tac(@list.List([th]))
    },
  )
  let t2003 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @lists.length_list_of_seq()]),
  )
  let t2002 = @simp.rewrite_tac(
    @list.List([@sets.inters_gspec(), @sets.in_elim_thm()]),
  )
  let t2001 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t2000 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t1999 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> Num)"))
  let t1998 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, (f : (_) -> _)(x) == (g : (_) -> _)(x)) → IMAGE(f, UNIV) == IMAGE(g, UNIV)"),
    ),
  )
  let t1997 = @simp.once_rewrite_tac(@list.List([@sets.simple_image()]))
  let t2010 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([suslin_operation()])),
                      @tactics.ap_term_tac,
                    ),
                    t1997,
                  ),
                  t1998,
                ),
                t1999,
              ),
              t2000,
            ),
            t2001,
          ),
          t2002,
        ),
        t2003,
      ),
      t2006,
    ),
    t2009,
  )
  let t1996 = @meson.asm_meson_tac(
    @list.List([@lists.el_list_of_seq(), @arith.lt_trans(), @arith.lte_trans()]),
  )
  let t1995 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t1994 = @simp.simp_tac(
    @list.List([@lists.length_list_of_seq(), @lists.el_list_of_seq()]),
  )
  let t1993 = @simp.rewrite_tac(@list.List([@lists.list_eq()]))
  let t1992 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1988 = @term_syntax.parse_term("(p : Num)")
  let t1991 = @tactics.first_x_assum(fn(
    x1990 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1985 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1986 = @tactics.mp_tac(x1985)
      fn(
        x1987 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1986(x1987)
      }
    })(((x1989 : @kernel.Thm) => @bool.spec(t1988, x1989))(x1990))
  })
  let t1984 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1983 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t1980 = @term_syntax.parse_term("(n : Num)")
  let t1981 = @term_syntax.parse_term("(m : Num)")
  let t1982 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(s : (Num) -> Num)"), t1981, t1980]),
  )
  let t2011 = @tactics.then_tac(
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
                                    @simp.rewrite_tac(
                                      @list.List([
                                        @sets.in_inters(),
                                        @sets.forall_in_gspec(),
                                        @lists.length_list_of_seq(),
                                      ]),
                                    ),
                                    t1982,
                                  ),
                                  @tactics.disch_tac,
                                ),
                                t1983,
                              ),
                              @tactics.disch_tac,
                            ),
                            t1984,
                          ),
                          @tactics.disch_tac,
                        ),
                        t1991,
                      ),
                      @tactics.ants_tac,
                    ),
                    @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                  ),
                  t1992,
                ),
                @tactics.ap_term_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t1993,
          ),
          t1994,
        ),
        t1995,
      ),
      @tactics.disch_tac,
    ),
    t1996,
  )
  let t1979 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@lists.length_eq_nil()),
      @lists.length_list_of_seq(),
      @arith.le_1(),
    ]),
  )
  let t1978 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1977 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1976 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image(), @iterate.in_numseg()]),
  )
  let t1975 = @simp.asm_simp_tac(
    @list.List([
      @iterate.numseg_empty(),
      @arith.not_lt(),
      @lists.length_eq_nil(),
      @arith.le_1(),
    ]),
  )
  let t1974 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@iterate.numseg()),
      @iterate.finite_numseg(),
      @sets.finite_image(),
      @sets.image_eq_empty(),
    ]),
  )
  let t1973 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t1972 = @simp.rewrite_tac(@list.List([]))
  let t1971 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2012 = @list.List([
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
                      t1971,
                    ),
                    t1972,
                  ),
                  t1973,
                ),
                t1974,
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
    t2011,
    t2010,
  ])
  let t1970 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1969 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1968 = @tactics.exists_tac(
    @term_syntax.parse_term("(l : List[Num]) => INTERS({(f : (List[Num], A) -> Bool)(list_of_seq((i : Num) => EL(i, l), n)) | n : Num | 1 <= n && n <= LENGTH(l)})"),
  )
  let t1967 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1966 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (List[Num], A) -> Bool)"))
  let t1965 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_gspec()]),
  )
  let t1964 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t1963 = @simp.rewrite_tac(
    @list.List([suslin(), @equal.gsym(@sets.subset_antisym_eq())]),
  )
  let t2013 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t1963,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1964,
                  ),
                  t1965,
                ),
                t1966,
              ),
              @tactics.disch_tac,
            ),
            t1967,
          ),
          t1968,
        ),
        t1969,
      ),
      t1970,
    ),
    t2012,
  )
  suslin_regular_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : ((A) -> Bool) -> Bool, (∀ c : ((A) -> Bool) -> Bool, FINITE(c) && !(c == {}) && SUBSET(c, u) → IN(INTERS(c), u)) → suslin(u) == {suslin_operation((f : (List[Num], A) -> Bool)) | (∀ l : List[Num], !(l == NIL) → IN(f(l), u)) && (∀ s : (Num) -> Num, ∀ m : Num, ∀ n : Num, 1 <= m && m <= n → SUBSET(f(list_of_seq(s, n)), f(list_of_seq(s, m))))}"),
      t2013,
    ),
  )
}

///|
let suslin_regular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_REGULAR")

///|
/// `SUSLIN_REGULAR`
pub fn suslin_regular() -> @kernel.Thm {
  suslin_regular_c.get()
}

///|
/// SUSLIN_SUSLIN
fn step_191() -> Unit raise {
  let t2382 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2381 = @simp.rewrite_tac(
    @list.List([@sets.in_union(), @sets.in_elim_pair_thm()]),
  )
  let t2380 = @simp.expand_tac("J")
  let t2379 = @simp.asm_rewrite_tac(@list.List([]))
  let t2378 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2377 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @sets.subset(),
        @sets.in_elim_thm(),
        @sets.forall_in_image(),
        @theorems.right_imp_forall_thm(),
        @theorems.imp_imp(),
      ]),
    ),
  )
  let t2374 = @tactics.match_mp_tac(@lists.el_list_of_seq())
  let t2373 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2372 = @simp.simp_tac(
    @list.List([
      @lists.list_eq(),
      @lists.length_list_of_seq(),
      @lists.el_list_of_seq(),
    ]),
  )
  let t2371 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2370 = @simp.asm_simp_tac(
    @list.List([
      @lists.length_list_of_seq(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → 1 <= n && !(n <= 2)")),
    ]),
  )
  let t2366 = @term_syntax.parse_term("(n : Num)")
  let t2369 = @tactics.remove_then("*", fn(
    x2368 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s2364 = @tactics.mp_tac(x2363)
      fn(
        x2365 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2364(x2365)
      }
    })(((x2367 : @kernel.Thm) => @bool.spec(t2366, x2367))(x2368))
  })
  let t2362 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x2361 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
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
        let s2359 = @tactics.subst_all_tac(x2358)
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
      })(@equal.sym(x2361))
    }),
  )
  let t2356 = @tactics.conjuncts_then2(
    fn(
      x2350 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2351 = @tactics.assume_tac(x2350)
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
    fn(
      x2353 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2354 = @tactics.mp_tac(x2353)
      fn(
        x2355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2354(x2355)
      }
    },
  )
  let t2357 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(t2356),
  )
  let t2349 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_cross(),
      @sets.in_delete(),
      @sets.in_univ(),
      @arith.le_1(),
      @pair.pair_eq(),
      @sets.in_elim_thm(),
    ]),
  )
  let t2345 = @term_syntax.parse_term("((kk : Num), (mm : Num))")
  let t2348 = @tactics.disch_then(fn(
    x2347 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(((x2346 : @kernel.Thm) => @bool.spec(t2345, x2346))(x2347))
  })
  let t2339 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ y : _, IN(y, t) → (∃ x : _, IN(x, s) && f(x) == y))"),
    ),
  )
  let t2341 = @tactics.first_assum(fn(
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
  let t2334 = @term_syntax.parse_term("(mm : Num)")
  let t2335 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(kk : Num)"), t2334]),
  )
  let t2333 = @tactics.exists_tac(
    @term_syntax.parse_term("(j : Num) => (i : Num) => (t : (Num) -> Num)((q : ((Num, Num)) -> Num)((i, j)))"),
  )
  let t2332 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : Num) => (t : (Num) -> Num)((q : ((Num, Num)) -> Num)((i, 0)))"),
  )
  let t2331 = @tactics.disch_then(fn(
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
    let s2329 = ((x2327 : @kernel.Thm) => @tactics.label_tac("*", x2327))(x2328)
    fn(
      x2330 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2329(x2330)
    }
  })
  let t2375 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.x_gen_tac(
                                          @term_syntax.parse_term("(t : (Num) -> Num)"),
                                        ),
                                        t2331,
                                      ),
                                      t2332,
                                    ),
                                    t2333,
                                  ),
                                  t2335,
                                ),
                                @tactics.strip_tac,
                              ),
                              t2341,
                            ),
                            t2348,
                          ),
                          t2349,
                        ),
                        t2357,
                      ),
                      t2362,
                    ),
                    t2369,
                  ),
                  t2370,
                ),
                t2371,
              ),
              @tactics.ap_term_tac,
            ),
            @tactics.binop_tac,
          ),
          t2372,
        ),
        t2373,
      ),
      @tactics.disch_tac,
    ),
    t2374,
  )
  let t2326 = @tactics.disch_then(fn(
    x2325 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(@equal.gsym(x2325))
  })
  let t2324 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t2318 = @drule.part_match(
    fn(x2317 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x2317))
    },
    @lists.el_list_of_seq(),
  )
  let t2313 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2312 = @simp.simp_tac(
    @list.List([
      @lists.list_eq(),
      @lists.length_list_of_seq(),
      @lists.el_list_of_seq(),
    ]),
  )
  let t2311 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2310 = @tactics.disch_then(fn(
    x2302 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x2302
    let t2309 = @tactics.first_x_assum(fn(
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
      (fn(
        x2304 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2305 = @tactics.mp_tac(x2304)
        fn(
          x2306 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2305(x2306)
        }
      })(
        (fn(x2307 : @kernel.Thm) -> @kernel.Thm raise {
          @drule.match_mp(x2307)(th_1)
        })(x2308),
      )
    })
    @tactics.then_tac(@tactics.strip_assume_tac(th_1), t2309)
  })
  let t2301 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) == (1 <= n)"))]),
  )
  let t2300 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.in_cross(),
      @sets.in_delete(),
      @sets.in_univ(),
    ]),
  )
  let t2296 = @term_syntax.parse_term("(n : Num)")
  let t2299 = @tactics.disch_then(fn(
    x2298 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2293 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2294 = @tactics.mp_tac(x2293)
      fn(
        x2295 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2294(x2295)
      }
    })(((x2297 : @kernel.Thm) => @bool.spec(t2296, x2297))(x2298))
  })
  let t2290 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ x : _, IN(x, s) → IN(f(x), t))"),
    ),
  )
  let t2292 = @tactics.first_assum(fn(
    x2291 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(t2290(x2291))
  })
  let t2285 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) <= 2) == (3 <= n)"))]),
    ),
  )
  let t2284 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2283 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2286 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2283),
      t2284,
    ),
    t2285,
  ])
  let t2282 = @simp.simp_tac(
    @list.List([@arith.le_1(), @lists.el_list_of_seq()]),
  )
  let t2281 = @simp.rewrite_tac(@list.List([@lists.length_list_of_seq()]))
  let t2280 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2278 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Num) -> Num)"))
  let t2277 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t2276 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => if n == 0 { (p : Num) } else { (t : (Num) -> Num)(n) }"),
  )
  let t2275 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
      x2274 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x2271 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2272 = @tactics.subst1_tac(x2271)
        fn(
          x2273 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2272(x2273)
        }
      })(@equal.sym(x2274))
    }),
  )
  let t2270 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2269 = @simp.rewrite_tac(@list.List([@lists.list_of_seq_eq_nil()]))
  let t2264 = @term_syntax.parse_term("list_of_seq((s' : (Num, Num) -> Num)(1), 1)")
  let t2265 = @list.List([@term_syntax.parse_term("list_of_seq((s : (Num) -> Num), 1)"), t2264])
  let t2268 = @tactics.disch_then(fn(
    x2267 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2261 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2262 = @tactics.mp_tac(x2261)
      fn(
        x2263 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2262(x2263)
      }
    })(((x2266 : @kernel.Thm) => @bool.specl(t2265, x2266))(x2267))
  })
  let t2260 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t2257 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("(t : (_) -> Bool) == IMAGE((f : (_) -> _), UNIV) → (∀ y : _, IN(y, t) → (∃ x : _, f(x) == y))"),
    ),
  )
  let t2259 = @tactics.first_assum(fn(
    x2258 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s2255 = @tactics.mp_tac(x2254)
      fn(
        x2256 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2255(x2256)
      }
    })(t2257(x2258))
  })
  let t2250 = @term_syntax.parse_term("(t : (Num) -> Num)")
  let t2253 = @tactics.disch_then(fn(
    x2252 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    ((x2251 : @kernel.Thm) => @tactics.x_choose_tac(t2250, x2251))(
      @equal.gsym(x2252),
    )
  })
  let t2248 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm(), @trivia.o_thm()]),
  )
  let t2247 = @simp.simp_tac(@list.List([]))
  let t2246 = @simp.asm_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t2249 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@equal.gsym(@sets.function_factors_left())]),
        ),
        t2246,
      ),
      t2247,
    ),
    t2248,
  ])
  let t2279 = @list.List([
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
                          @term_syntax.parse_term("∃ t : (Num) -> Num, fn { (i, j) => if j == 0 { (s : (Num) -> Num)(i) } else { (s' : (Num, Num) -> Num)(j, i) } } == o(t, (q : ((Num, Num)) -> Num))"),
                          fn(
                            x2243 : @kernel.Thm,
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
                            let s2244 = @tactics.mp_tac(x2243)
                            fn(
                              x2245 : (
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
                              s2244(x2245)
                            }
                          },
                        ),
                        t2249,
                      ),
                      t2253,
                    ),
                    t2259,
                  ),
                  t2260,
                ),
                t2268,
              ),
              t2269,
            ),
            t2270,
          ),
          t2275,
        ),
        t2276,
      ),
      t2277,
    ),
    t2278,
  ])
  let t2242 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ t : (Num) -> Num, (h : (Num, A) -> Bool)(t(0)) == (g : (List[Num], List[Num], A) -> Bool)(list_of_seq((s : (Num) -> Num), 1), list_of_seq((s' : (Num, Num) -> Num)(1), 1)) && (∀ i : Num, t((q : ((Num, Num)) -> Num)((i, 0))) == s(i)) && (∀ i : Num, ∀ j : Num, 1 <= j → t(q((i, j))) == s'(j, i))"),
    @tactics.strip_assume_tac,
  )
  let t2241 = @term_syntax.parse_term("(s' : (Num, Num) -> Num)")
  let t2376 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
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
                                            @tactics.thenl(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.map_every(
                                                    @tactics.x_gen_tac,
                                                    @list.List([
                                                      @term_syntax.parse_term("(s : (Num) -> Num)"),
                                                      t2241,
                                                    ]),
                                                  ),
                                                  @tactics.strip_tac,
                                                ),
                                                t2242,
                                              ),
                                              t2279,
                                            ),
                                            t2280,
                                          ),
                                          t2281,
                                        ),
                                        t2282,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    @class.cond_cases_tac,
                                  ),
                                  t2286,
                                ),
                                t2292,
                              ),
                              t2299,
                            ),
                            t2300,
                          ),
                          t2301,
                        ),
                        t2310,
                      ),
                      t2311,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  @tactics.binop_tac,
                ),
                t2312,
              ),
              t2313,
            ),
            @tactics.disch_tac,
          ),
          fn(
            x2323 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x2322 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x2320 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x2319 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
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
                      s2315(x2316)
                    }
                  })(t2318(x2319))
                })(@kernel.rand(x2320))
              })(
                (fn(
                  x2321 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x2321.1
                })(x2322),
              )
            })(x2323)(x2323)
          },
        ),
        t2324,
      ),
      t2326,
    ),
    t2375,
  ])
  let t2240 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2239 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t2237 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2236 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.in_cross(),
      @sets.in_univ(),
      @sets.in_delete(),
    ]),
  )
  let t2232 = @term_syntax.parse_term("LENGTH((l : List[Num]))")
  let t2235 = @tactics.disch_then(fn(
    x2234 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2229 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2230 = @tactics.mp_tac(x2229)
      fn(
        x2231 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2230(x2231)
      }
    })(((x2233 : @kernel.Thm) => @bool.spec(t2232, x2233))(x2234))
  })
  let t2226 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ x : _, IN(x, s) → IN(f(x), t))"),
    ),
  )
  let t2228 = @tactics.first_assum(fn(
    x2227 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s2224 = @tactics.mp_tac(x2223)
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
    })(t2226(x2227))
  })
  let t2222 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@lists.length_eq_nil()),
      @lists.length_list_of_seq(),
    ]),
  )
  let t2220 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2221 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t2220])
  let t2238 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Num])")),
                      @tactics.disch_tac,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t2221,
                ),
                t2222,
              ),
              t2228,
            ),
            t2235,
          ),
          t2236,
        ),
        t2237,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2219 = @simp.rewrite_tac(@list.List([]))
  let t2218 = @simp.expand_tac("f")
  let t2217 = @tactics.exists_tac(@term_syntax.parse_term("(f : (List[Num], A) -> Bool)"))
  let t2216 = @simp.abbrev_tac(
    @term_syntax.parse_term("(f : (List[Num], A) -> Bool) == ((l : List[Num]) => if LENGTH(l) <= 2 { (h : (Num, A) -> Bool)(EL(0, l)) } else { (g : (List[Num], List[Num], A) -> Bool)(list_of_seq((i : Num) => EL((q : ((Num, Num)) -> Num)((i, 0)), l), (k : (Num) -> Num)(LENGTH(l))), list_of_seq((i : Num) => EL(q((i, k(LENGTH(l)))), l), (m : (Num) -> Num)(LENGTH(l)))) })"),
  )
  let t2209 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2208 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t2207 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | x == (a : _)} == {f(a)}"))]),
  )
  let t2206 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) < 1) == (i == 0)"))]),
  )
  let t2205 = @simp.rewrite_tac(@list.List([@sets.in_union()]))
  let t2204 = @simp.expand_tac("J")
  let t2203 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2202 = @simp.rewrite_tac(
    @list.List([@sets.in_cross(), @sets.in_univ(), @sets.in_delete()]),
  )
  let t2201 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image()]),
  )
  let t2210 = @tactics.then_tac(
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
                            t2201,
                          ),
                          @tactics.gen_tac,
                        ),
                        @class.cond_cases_tac,
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
            ),
            t2207,
          ),
          t2208,
        ),
        @tactics.strip_tac,
      ),
      t2209,
    ),
    @int.asm_arith_tac,
  )
  let t2211 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2200 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2199 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2198 = @simp.rewrite_tac(
    @list.List([@sets.in_cross(), @sets.in_univ(), @sets.in_delete()]),
  )
  let t2197 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2212 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@sets.subset(), @sets.forall_in_image()]),
              ),
              t2197,
            ),
            @class.cond_cases_tac,
          ),
          t2198,
        ),
        t2199,
      ),
      t2200,
    ),
    t2211,
    t2210,
  ])
  let t2196 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2195 = @simp.gen_rewrite_tac(
    fn(
      x2192 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2193 = @equal.land_conv(x2192)
      fn(x2194 : @kernel.Term) -> @kernel.Thm raise { s2193(x2194) }
    },
    @list.List([@equal.gsym(@sets.subset_antisym_eq())]),
  )
  let t2191 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(if (p : Bool) { (x : Num) } else { 1 }, if p { (y : Num) } else { 1 }) == (if p { (x, y) } else { (1, 1) })"),
      ),
    ]),
  )
  let t2190 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => if IN(n, IMAGE((r : ((Num, Num)) -> Num), CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)))) { SND((l : (Num) -> (Num, Num))(n)) } else { 1 }"),
  )
  let t2189 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => if IN(n, IMAGE((r : ((Num, Num)) -> Num), CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)))) { FST((l : (Num) -> (Num, Num))(n)) } else { 1 }"),
  )
  let t2186 = @term_syntax.parse_term("(l : (Num) -> (Num, Num))")
  let t2188 = @tactics.disch_then((x2187 : @kernel.Thm) => {
    @tactics.x_choose_tac(t2186, x2187)
  })
  let t2184 = @simp.gen_rewrite_rule(
    fn(
      x2183 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2183
    },
    @list.List([@sets.injective_on_left_inverse()]),
  )
  let t2213 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.first_x_assum(fn(
                  x2185 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x2180 : @kernel.Thm,
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
                    let s2181 = @tactics.mp_tac(x2180)
                    fn(
                      x2182 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s2181(x2182)
                    }
                  })(t2184(x2185))
                }),
                t2188,
              ),
              t2189,
            ),
            t2190,
          ),
          t2191,
        ),
        t2195,
      ),
      t2196,
    ),
    t2212,
  )
  let t2179 = @simp.asm_rewrite_tac(@list.List([@arith.lt_trans()]))
  let t2178 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t2177 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@arith.lt_refl()])),
  ])
  let t2176 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (t : (Num) -> Num)(m) < t(n)"),
    fn(
      x2173 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2174 = @tactics.mp_tac(x2173)
      fn(
        x2175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2174(x2175)
      }
    },
  )
  let t2172 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t2171 = @simp.rewrite_tac(@list.List([]))
  let t2170 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t2169 = @simp.asm_rewrite_tac(@list.List([@sets.in_univ()]))
  let t2168 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @sets.forall_in_image(),
    ]),
  )
  let t2167 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2166 = @tactics.subgoal_then(
    @term_syntax.parse_term("CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)) == IMAGE((p : (Num) -> (Num, Num)), UNIV)"),
    fn(
      x2163 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2164 = @tactics.subst1_tac(x2163)
      fn(
        x2165 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2164(x2165)
      }
    },
  )
  let t2162 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2161 = @simp.asm_rewrite_tac(
    @list.List([@trivia.o_thm(), @sets.in_elim_thm()]),
  )
  let t2160 = @tactics.exists_tac(
    @term_syntax.parse_term("o((t : (Num) -> Num), (p' : ((Num, Num)) -> Num))"),
  )
  let t2158 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@int.arith_rule(@term_syntax.parse_term("(2 < (n : Num)) == (3 <= n)"))]),
    ),
    @tactics.strip_tac,
  )
  let t2157 = @simp.simp_tac(
    @list.List([@sets.finite_numseg_lt(), @sets.finite_image()]),
  )
  let t2156 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t2155 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.finite_union()]),
  )
  let t2154 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, FINITE((f : (_, _) -> Bool)(x))) → FINITE(f((a : _)))"),
    ),
  )
  let t2153 = @simp.expand_tac("J")
  let t2152 = @tactics.match_mp_tac(@sets.finite_image())
  let t2151 = @simp.rewrite_tac(@list.List([@sets.finite_insert()]))
  let t2150 = @tactics.match_mp_tac(upper_bound_finite_set())
  let t2149 = @simp.rewrite_tac(
    @list.List([@arith.lt_suc_le(), @sets.subset(), @sets.in_elim_thm()]),
  )
  let t2148 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∃ a : Num, (P : (Num) -> Bool)(SUC(a))) → (∃ a : Num, P(a))"),
    ),
  )
  let t2147 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2146 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(SUBSET((s : (Num) -> Bool), {(a : Num) | a < (y : Num)}) && (x : Num) < y) == SUBSET(INSERT(x, s), {(a : Num) | a < y})"),
      ),
    ]),
  )
  let t2159 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.match_mp_tac(@arith.dependent_choice()),
                            t2146,
                          ),
                          t2147,
                        ),
                        t2148,
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
          ),
          t2155,
        ),
        t2156,
      ),
      t2157,
    ),
    t2158,
  ])
  let t2145 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ t : (Num) -> Num, (∀ n : Num, SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)((p : (Num) -> (Num, Num))(n))), {(a : Num) | a < t(n)}) && 2 < t(n)) && (∀ n : Num, t(n) < t(SUC(n)))"),
    fn(
      x2142 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2143 = @tactics.mp_tac(x2142)
      fn(
        x2144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2143(x2144)
      }
    },
  )
  let t2140 = @term_syntax.parse_term("(p : (Num) -> (Num, Num))")
  let t2141 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p' : ((Num, Num)) -> Num)"), t2140]),
  )
  let t2138 = @simp.rewrite_tac(
    @list.List([
      @card.eq_c_bijections(),
      @theorems.left_imp_exists_thm(),
      @sets.in_univ(),
    ]),
  )
  let t2137 = @simp.rewrite_tac(
    @list.List([
      @sets.num_infinite(),
      @equal.gsym(@card.finite_card_lt()),
      @sets.finite_sing(),
    ]),
  )
  let t2136 = @tactics.match_mp_tac(@card.card_diff_absorb())
  let t2135 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("DELETE((s : (_) -> Bool), (a : _)) == DIFF(s, {a})"))]),
  )
  let t2134 = @simp.rewrite_tac(@list.List([]))
  let t2133 = @tactics.match_mp_tac(@card.card_mul_cong())
  let t2132 = @simp.rewrite_tac(
    @list.List([
      @card.card_square_num(),
      @sets.cross(),
      @equal.gsym(@card.mul_c()),
    ]),
  )
  let t2131 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))")
  let t2139 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.trans_tac(@card.card_eq_trans())(t2131),
                t2132,
              ),
              t2133,
            ),
            t2134,
          ),
          t2135,
        ),
        t2136,
      ),
      t2137,
    ),
    t2138,
  ])
  let t2214 = @list.List([
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.thenl(
                                              @tactics.subgoal_then(
                                                @term_syntax.parse_term("(op_eq_us_c : (((Num, Num)) -> Bool, (Num) -> Bool) -> Bool)((CROSS : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((DELETE : ((Num) -> Bool, Num, Num) -> Bool)((UNIV : (Num) -> Bool), 0), (DELETE : ((Num) -> Bool, Num, Num) -> Bool)((UNIV : (Num) -> Bool), 0)), (UNIV : (Num) -> Bool))"),
                                                fn(
                                                  x2128 : @kernel.Thm,
                                                ) -> ((
                                                  (
                                                    @list.List[
                                                      (String, @kernel.Thm),
                                                    ],
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
                                                    @list.List[@kernel.Thm],
                                                  ) -> @kernel.Thm raise,
                                                ) raise) raise {
                                                  let s2129 = @tactics.mp_tac(
                                                    x2128,
                                                  )
                                                  fn(
                                                    x2130 : (
                                                      @list.List[
                                                        (String, @kernel.Thm),
                                                      ],
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
                                                      @list.List[@kernel.Thm],
                                                    ) -> @kernel.Thm raise,
                                                  ) raise {
                                                    s2129(x2130)
                                                  }
                                                },
                                              ),
                                              t2139,
                                            ),
                                            t2141,
                                          ),
                                          @tactics.strip_tac,
                                        ),
                                        t2145,
                                      ),
                                      t2159,
                                    ),
                                    t2160,
                                  ),
                                  t2161,
                                ),
                                @tactics.conj_tac,
                              ),
                              t2162,
                            ),
                            t2166,
                          ),
                          t2167,
                        ),
                        t2168,
                      ),
                      t2169,
                    ),
                    t2170,
                  ),
                  t2171,
                ),
                @tactics.conj_tac,
              ),
              t2172,
            ),
            t2176,
          ),
          t2177,
        ),
        t2178,
      ),
      t2179,
    ),
    t2213,
  ])
  let t2215 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("∃ r : ((Num, Num)) -> Num, (∀ a : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) → IN(r(a), {(n : Num) | 3 <= n})) && (∀ a : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) → SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)(a)), {(m : Num) | m < r(a)})) && (∀ a : (Num, Num), ∀ b : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) && IN(b, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) && r(a) == r(b) → a == b)"),
        @tactics.strip_assume_tac,
      ),
      t2214,
    ),
    @tactics.all_tac,
  ])
  let t2127 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ k : (Num) -> Num, ∃ m : (Num) -> Num, IMAGE((n : Num) => (k(n), m(n)), {(n : Num) | 3 <= n}) == CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)) && (∀ n : Num, 3 <= n → SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)((k(n), m(n)))), {(a : Num) | a < n}))"),
    @tactics.strip_assume_tac,
  )
  let t2126 = @simp.abbrev_tac(
    @term_syntax.parse_term("(J : ((Num, Num), (Num, Num)) -> Bool) == GABS((f : ((Num, Num), (Num, Num)) -> Bool) => ∀ k : Num, ∀ m : Num, GEQ(f((k, m)), UNION({((i : Num), 0) | i < k}, {((i : Num), k) | i < m})))"),
  )
  let t2122 = @meson.asm_meson_tac(@list.List([]))
  let t2121 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2120 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([])),
    ),
  )
  let t2119 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2118 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2117 = @simp.asm_rewrite_tac(
    @list.List([
      @pair.pair_eq(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
    ]),
  )
  let t2116 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (a, b) => if (a, b) == (0, 0) { 1 } else { if (a, b) == (0, 1) { 2 } else { (q : ((Num, Num)) -> Num)((a, b)) } } }"),
  )
  let t2114 = @meson.asm_meson_tac(@list.List([]))
  let t2113 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@pair.pair_eq())]))
  let t2112 = @tactics.first_x_assum(fn(
    x2107 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x2107
    let t2110 = @term_syntax.parse_term("(d : Num)")
    let t2111 = @tactics.mp_tac(
      @bool.specl(@list.List([@term_syntax.parse_term("(c : Num)"), t2110]), th),
    )
    let t2109 = @term_syntax.parse_term("(b : Num)")
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2109]), th),
      ),
      t2111,
    )
  })
  let t2106 = @tactics.repeat_tac(@tactics.disch_tac)
  let t2105 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) || (r : Bool)) == (p → !q → r)")),
    ]),
  )
  let t2102 = @term_syntax.parse_term("(d : Num)")
  let t2103 = @term_syntax.parse_term("(c : Num)")
  let t2104 = @term_syntax.parse_term("(b : Num)")
  let t2115 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.map_every(
                @tactics.x_gen_tac,
                @list.List([@term_syntax.parse_term("(a : Num)"), t2104, t2103, t2102]),
              ),
              t2105,
            ),
            t2106,
          ),
          t2112,
        ),
        t2113,
      ),
      t2114,
    ),
    @tactics.all_tac,
  ])
  let t2101 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ a' : Num, ∀ b' : Num, (q : ((Num, Num)) -> Num)((a, b)) == q((a', b')) → a == 0 && (b == 0 || b == 1) || a' == 0 && (b' == 0 || b' == 1) || a == a' && b == b'"),
    fn(
      x2098 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2099 = @tactics.assume_tac(x2098)
      fn(
        x2100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2099(x2100)
      }
    },
  )
  let t2097 = @simp.rewrite_tac(
    @list.List([@pair.pair_eq(), @sets.not_in_empty(), @class.de_morgan_thm()]),
  )
  let t2096 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @sets.in_diff(),
      @sets.in_univ(),
      @sets.in_insert(),
    ]),
  )
  let t2094 = @term_syntax.parse_term("(q' : (Num) -> (Num, Num))")
  let t2095 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q : ((Num, Num)) -> Num)"), t2094]),
  )
  let t2123 = @tactics.then_tac(
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
                              @simp.rewrite_tac(
                                @list.List([
                                  @card.eq_c_bijections(),
                                  @theorems.left_imp_exists_thm(),
                                ]),
                              ),
                              t2095,
                            ),
                            t2096,
                          ),
                          t2097,
                        ),
                        @tactics.strip_tac,
                      ),
                      t2101,
                    ),
                    t2115,
                  ),
                  t2116,
                ),
                t2117,
              ),
              t2118,
            ),
            @tactics.conj_tac,
          ),
          t2119,
        ),
        t2120,
      ),
      t2121,
    ),
    t2122,
  )
  let t2091 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@card.finite_card_lt()),
      @sets.finite_insert(),
      @sets.finite_empty(),
    ]),
  )
  let t2090 = @simp.rewrite_tac(@list.List([@sets.num_infinite()]))
  let t2089 = @tactics.match_mp_tac(@card.card_diff_absorb())
  let t2088 = @simp.once_rewrite_tac(@list.List([@card.card_eq_sym()]))
  let t2087 = @simp.rewrite_tac(@list.List([@card.card_square_num()]))
  let t2085 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t2086 = @tactics.trans_tac(@card.card_eq_trans())(t2085)
  let t2092 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@equal.gsym(@card.mul_c_univ())])),
              t2086,
            ),
            t2087,
          ),
          t2088,
        ),
        t2089,
      ),
      t2090,
    ),
    t2091,
  )
  let t2084 = @simp.rewrite_tac(
    @list.List([@card.card_square_num(), @equal.gsym(@card.mul_c_univ())]),
  )
  let t2083 = @simp.once_rewrite_tac(@list.List([@card.card_eq_sym()]))
  let t2082 = @tactics.match_mp_tac(@card.card_eq_imp_le())
  let t2081 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@card.finite_card_lt()),
      @sets.finite_insert(),
      @sets.finite_empty(),
    ]),
  )
  let t2079 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t2080 = @tactics.trans_tac(@card.card_lte_trans())(t2079)
  let t2078 = @simp.rewrite_tac(
    @list.List([@sets.infinite_univ_pair(), @sets.num_infinite()]),
  )
  let t2093 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(@card.card_diff_absorb()),
                t2078,
              ),
              t2080,
            ),
            t2081,
          ),
          t2082,
        ),
        t2083,
      ),
      t2084,
    ),
    t2092,
  ])
  let t2077 = @term_syntax.parse_term("(UNIV : ((Num, Num)) -> Bool)")
  let t2124 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.trans_tac(@card.card_eq_trans())(t2077),
        @tactics.conj_tac,
      ),
      t2093,
    ),
    t2123,
  ])
  let t2125 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("op_eq_us_c(DIFF(UNIV, {(0, 0), (0, 1)}), DIFF(UNIV, {0, 1, 2}))"),
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
          let s2075 = @tactics.mp_tac(x2074)
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
      ),
      t2124,
    ),
    @tactics.all_tac,
  ])
  let t2073 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ q : ((Num, Num)) -> Num, (∀ a : Num, ∀ b : Num, 1 <= q((a, b))) && q((0, 0)) == 1 && q((0, 1)) == 2 && (∀ a : Num, ∀ b : Num, ∀ a' : Num, ∀ b' : Num, (q((a, b)) == q((a', b'))) == (a == a' && b == b'))"),
    @tactics.strip_assume_tac,
  )
  let t2069 = @meson.meson_tac(@list.List([@lists.not_cons_nil()]))
  let t2070 = @tactics.then_tac(
    @tactics.match_mp_tac(
      @sets.set_rule(
        @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) → !({(f : (_, _) -> _)((x : _), (y : _)) | P(x) && P(y)} == {})"),
      ),
    ),
    t2069,
  )
  let t2068 = @simp.rewrite_tac(@list.List([@card.num_countable()]))
  let t2067 = @tactics.match_mp_tac(@card.countable_list())
  let t2066 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t2065 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (List[Num]) -> Bool)"))
  let t2064 = @tactics.match_mp_tac(@card.countable_subset())
  let t2063 = @simp.simp_tac(@list.List([]))
  let t2062 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")),
  )
  let t2061 = @tactics.match_mp_tac(@card.countable_product_dependent())
  let t2071 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.once_rewrite_tac(
                      @list.List([
                        @sets.set_rule(
                          @term_syntax.parse_term("!((x : List[_]) == NIL) == IN(x, {(l : List[_]) | !(l == NIL)})"),
                        ),
                      ]),
                    ),
                    t2061,
                  ),
                  t2062,
                ),
                t2063,
              ),
              t2064,
            ),
            t2065,
          ),
          t2066,
        ),
        t2067,
      ),
      t2068,
    ),
    t2070,
  ])
  let t2072 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.match_mp_tac(@card.countable_as_image()),
        @tactics.conj_tac,
      ),
      t2071,
    ),
    @tactics.all_tac,
  ])
  let t2060 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ h : (Num, A) -> Bool, {(g : (List[Num], List[Num], A) -> Bool)((l : List[Num]), (m : List[Num])) | !(l == NIL) && !(m == NIL)} == IMAGE(h, UNIV)"),
    @tactics.strip_assume_tac,
  )
  let t2059 = @simp.rewrite_tac(
    @list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]),
  )
  let t2058 = @simp.rewrite_tac(
    @list.List([@class.right_imp_exists_thm(), @class.skolem_thm()]),
  )
  let t2057 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.inters_gspec(),
      @sets.unions_gspec(),
      @sets.in_univ(),
    ]),
  )
  let t2056 = @simp.once_rewrite_tac(@list.List([@sets.extension()]))
  let t2055 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), suslin_operation()]),
  )
  let t2053 = @tactics.remove_then("*", fn(
    x2052 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t2051 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@lists.length_eq_nil()),
      @lists.length_list_of_seq(),
      @arith.le_1(),
    ]),
  )
  let t2050 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2049 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2048 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → (f : (_) -> _)(x) == (g : (_) -> _)(x)) → {f((x : _)) | P(x)} == {g((x : _)) | P(x)}"),
    ),
  )
  let t2047 = @simp.rewrite_tac(@list.List([]))
  let t2046 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> Num)"))
  let t2045 = @simp.gen_rewrite_tac(
    fn(
      x2044 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2044
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t2043 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t2054 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                                x2040 : (@kernel.Term) -> @kernel.Thm raise,
                              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                let s2041 = @equal.binop_conv(x2040)
                                fn(x2042 : @kernel.Term) -> @kernel.Thm raise {
                                  s2041(x2042)
                                }
                              },
                              @list.List([suslin_operation()]),
                            ),
                            t2043,
                          ),
                          @tactics.ap_term_tac,
                        ),
                        @tactics.ap_thm_tac,
                      ),
                      @tactics.ap_term_tac,
                    ),
                    t2045,
                  ),
                  t2046,
                ),
                t2047,
              ),
              @tactics.ap_term_tac,
            ),
            t2048,
          ),
          t2049,
        ),
        t2050,
      ),
      t2051,
    ),
    t2053,
  ])
  let t2039 = @tactics.subgoal_then(
    @term_syntax.parse_term("suslin_operation((f : (List[Num], A) -> Bool)) == suslin_operation((l : List[Num]) => suslin_operation((g : (List[Num], List[Num], A) -> Bool)(l)))"),
    fn(
      x2036 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2037 = @tactics.subst1_tac(x2036)
      fn(
        x2038 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2037(x2038)
      }
    },
  )
  let t2035 = @tactics.disch_then(
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
        let s2033 = ((x2031 : @kernel.Thm) => @tactics.label_tac("*", x2031))(
          x2032,
        )
        fn(
          x2034 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2033(x2034)
        }
      },
    ),
  )
  let t2027 = @simp.rewrite_tac(
    @list.List([
      @theorems.forall_and_thm(),
      @theorems.right_imp_forall_thm(),
      @theorems.imp_imp(),
    ]),
  )
  let t2026 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"),
      ),
    ]),
  )
  let t2025 = @tactics.x_gen_tac(
    @term_syntax.parse_term("(g : (List[Num], List[Num], A) -> Bool)"),
  )
  let t2024 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t2023 = @simp.gen_rewrite_tac(
    fn(
      x2022 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2016 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2017 = @equal.land_conv(x2016)
        fn(x2018 : @kernel.Term) -> @kernel.Thm raise { s2017(x2018) }
      })(
        (fn(
          x2019 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2020 = @equal.top_depth_conv(x2019)
          fn(x2021 : @kernel.Term) -> @kernel.Thm raise { s2020(x2021) }
        })(x2022),
      )
    },
    @list.List([@sets.in_elim_thm(), @class.right_imp_exists_thm()]),
  )
  let t2015 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (List[Num], A) -> Bool)"))
  let t2014 = @simp.rewrite_tac(
    @list.List([suslin(), @sets.subset(), @sets.forall_in_gspec()]),
  )
  let t2383 = @tactics.then_tac(
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
                                                                                @tactics.gen_tac,
                                                                                @simp.rewrite_tac(
                                                                                  @list.List([
                                                                                      @equal.gsym(
                                                                                        @sets.subset_antisym_eq(),
                                                                                      ),
                                                                                      suslin_superset(),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              t2014,
                                                                            ),
                                                                            t2015,
                                                                          ),
                                                                          t2023,
                                                                        ),
                                                                        t2024,
                                                                      ),
                                                                      t2025,
                                                                    ),
                                                                    t2026,
                                                                  ),
                                                                  t2027,
                                                                ),
                                                                t2035,
                                                              ),
                                                              t2039,
                                                            ),
                                                            t2054,
                                                          ),
                                                          t2055,
                                                        ),
                                                        t2056,
                                                      ),
                                                      t2057,
                                                    ),
                                                    t2058,
                                                  ),
                                                  t2059,
                                                ),
                                                t2060,
                                              ),
                                              t2072,
                                            ),
                                            t2073,
                                          ),
                                          t2125,
                                        ),
                                        t2126,
                                      ),
                                      t2127,
                                    ),
                                    t2215,
                                  ),
                                  t2216,
                                ),
                                t2217,
                              ),
                              t2218,
                            ),
                            t2219,
                          ),
                          @tactics.conj_tac,
                        ),
                        t2238,
                      ),
                      t2239,
                    ),
                    @tactics.eq_tac,
                  ),
                  t2240,
                ),
                t2376,
              ),
              t2377,
            ),
            t2378,
          ),
          t2379,
        ),
        t2380,
      ),
      t2381,
    ),
    t2382,
  )
  suslin_suslin_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : ((A) -> Bool) -> Bool, suslin(suslin(u)) == suslin(u)"),
      t2383,
    ),
  )
}

///|
let suslin_suslin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_SUSLIN")

///|
/// `SUSLIN_SUSLIN`
pub fn suslin_suslin() -> @kernel.Thm {
  suslin_suslin_c.get()
}

///|
/// SUSLIN_INTERS
fn step_192() -> Unit raise {
  let t2409 = @sets.set_tac(@list.List([]))
  let t2408 = @tactics.mp_tac(
    @int.arith_rule(@term_syntax.parse_term("∀ n : Num, 1 <= SUC(n) && SUC(n) - 1 == n")),
  )
  let t2407 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.ap_term_tac,
  ])
  let t2406 = @simp.rewrite_tac(
    @list.List([
      @sets.simple_image(),
      @sets.image_const(),
      @sets.univ_not_empty(),
      @sets.unions_1(),
    ]),
  )
  let t2405 = @simp.asm_rewrite_tac(
    @list.List([@trivia.o_thm(), @lists.length_list_of_seq()]),
  )
  let t2404 = @tactics.exists_tac(
    @term_syntax.parse_term("(o : ((Num, A) -> Bool, (List[Num]) -> Num, List[Num], A) -> Bool)((f : (Num, A) -> Bool), (o : ((Num) -> Num, (List[Num]) -> Num, List[Num]) -> Num)((n : Num) => n - 1, (LENGTH : (List[Num]) -> Num)))"),
  )
  let t2403 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), suslin_operation()]),
  )
  let t2402 = @simp.once_rewrite_tac(@list.List([suslin()]))
  let t2401 = @simp.once_rewrite_tac(@list.List([@equal.gsym(suslin_suslin())]))
  let t2400 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_image(), @sets.in_univ()]),
  )
  let t2399 = @tactics.pop_assum_list(fn(
    x2398 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t2397 = @tactics.disch_then(fn(
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
    let s2395 = @tactics.subst1_tac(x2394)
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
  })
  let t2393 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Num, A) -> Bool)"))
  let t2392 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t2391 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"),
      @card.countable_as_image(),
    ),
  )
  let t2390 = @tactics.replicate_tac(
    2,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x2384 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s2385 = @tactics.assume_tac(x2384)
          fn(
            x2386 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s2385(x2386)
          }
        },
        fn(
          x2387 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s2388 = @tactics.mp_tac(x2387)
          fn(
            x2389 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s2388(x2389)
          }
        },
      ),
    ),
  )
  let t2410 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t2390,
                                    ),
                                    t2391,
                                  ),
                                  t2392,
                                ),
                                t2393,
                              ),
                              t2397,
                            ),
                            t2399,
                          ),
                          t2400,
                        ),
                        @tactics.disch_tac,
                      ),
                      t2401,
                    ),
                    t2402,
                  ),
                  t2403,
                ),
                t2404,
              ),
              t2405,
            ),
            t2406,
          ),
          @tactics.conj_tac,
        ),
        t2407,
      ),
      t2408,
    ),
    t2409,
  )
  suslin_inters_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (∀ s : (A) -> Bool, IN(s, f) → suslin(C, s)) → suslin(C, INTERS(f))"),
      t2410,
    ),
  )
}

///|
let suslin_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_INTERS")

///|
/// `SUSLIN_INTERS`
pub fn suslin_inters() -> @kernel.Thm {
  suslin_inters_c.get()
}

///|
/// SUSLIN_INTER
fn step_193() -> Unit raise {
  let t2414 = @simp.asm_rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.not_in_empty()]),
  )
  let t2413 = @simp.rewrite_tac(
    @list.List([
      @card.countable_insert(),
      @card.countable_empty(),
      @sets.not_insert_empty(),
    ]),
  )
  let t2412 = @tactics.match_mp_tac(suslin_inters())
  let t2411 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_2())]))
  let t2415 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2411),
        t2412,
      ),
      t2413,
    ),
    t2414,
  )
  suslin_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, suslin(C, s) && suslin(C, t) → suslin(C, INTER(s, t))"),
      t2415,
    ),
  )
}

///|
let suslin_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_INTER")

///|
/// `SUSLIN_INTER`
pub fn suslin_inter() -> @kernel.Thm {
  suslin_inter_c.get()
}

///|
/// SUSLIN_UNIONS
fn step_194() -> Unit raise {
  let t2450 = @simp.rewrite_tac(@list.List([]))
  let t2449 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (n : Num)"))
  let t2448 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2447 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2446 = @simp.simp_tac(
    @list.List([@sets.fun_in_image(), @sets.in_univ(), @sets.forall_in_image()]),
  )
  let t2445 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@sets.subset_antisym_eq()),
      @sets.subset(),
      @sets.forall_in_gspec(),
    ]),
  )
  let t2451 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@sets.inters_1()])),
                @tactics.ap_term_tac,
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
    ),
    t2450,
  )
  let t2444 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t2443 = @simp.simp_tac(
    @list.List([@lists.el_list_of_seq(), @arith.le_1()]),
  )
  let t2442 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) && (∀ x : _, P(x) → (f : (_) -> _)(x) == (a : _)) → {f((x : _)) | P(x)} == {a}"),
    ),
  )
  let t2452 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2442),
        t2443,
      ),
      t2444,
    ),
    t2451,
  ])
  let t2441 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ f : (Num, A) -> Bool, ∀ s : (Num) -> Num, {f(EL(0, list_of_seq(s, (n : Num)))) | 1 <= n} == {f(s(0))}"),
    fn(
      x2439 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x2439
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t2438 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2437 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t2436 = @tactics.exists_tac(
    @term_syntax.parse_term("o((f : (Num, A) -> Bool), EL(0))"),
  )
  let t2435 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), suslin_operation()]),
  )
  let t2434 = @simp.once_rewrite_tac(@list.List([suslin()]))
  let t2433 = @simp.once_rewrite_tac(@list.List([@equal.gsym(suslin_suslin())]))
  let t2432 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_image(), @sets.in_univ()]),
  )
  let t2431 = @tactics.pop_assum_list(fn(
    x2430 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t2429 = @tactics.disch_then(fn(
    x2426 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2427 = @tactics.subst1_tac(x2426)
    fn(
      x2428 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2427(x2428)
    }
  })
  let t2425 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Num, A) -> Bool)"))
  let t2424 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t2423 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)"),
      @card.countable_as_image(),
    ),
  )
  let t2422 = @tactics.replicate_tac(
    2,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x2416 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s2417 = @tactics.assume_tac(x2416)
          fn(
            x2418 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s2417(x2418)
          }
        },
        fn(
          x2419 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s2420 = @tactics.mp_tac(x2419)
          fn(
            x2421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s2420(x2421)
          }
        },
      ),
    ),
  )
  let t2453 = @tactics.thenl(
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
                                    @tactics.repeat_tac(@tactics.gen_tac),
                                    t2422,
                                  ),
                                  t2423,
                                ),
                                t2424,
                              ),
                              t2425,
                            ),
                            t2429,
                          ),
                          t2431,
                        ),
                        t2432,
                      ),
                      @tactics.disch_tac,
                    ),
                    t2433,
                  ),
                  t2434,
                ),
                t2435,
              ),
              t2436,
            ),
            t2437,
          ),
          @tactics.conj_tac,
        ),
        t2438,
      ),
      t2441,
    ),
    t2452,
  )
  suslin_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (∀ s : (A) -> Bool, IN(s, f) → suslin(C, s)) → suslin(C, UNIONS(f))"),
      t2453,
    ),
  )
}

///|
let suslin_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_UNIONS")

///|
/// `SUSLIN_UNIONS`
pub fn suslin_unions() -> @kernel.Thm {
  suslin_unions_c.get()
}

///|
/// SUSLIN_UNION
fn step_195() -> Unit raise {
  let t2457 = @simp.asm_rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.not_in_empty()]),
  )
  let t2456 = @simp.rewrite_tac(
    @list.List([
      @card.countable_insert(),
      @card.countable_empty(),
      @sets.not_insert_empty(),
    ]),
  )
  let t2455 = @tactics.match_mp_tac(suslin_unions())
  let t2454 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_2())]))
  let t2458 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2454),
        t2455,
      ),
      t2456,
    ),
    t2457,
  )
  suslin_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, suslin(C, s) && suslin(C, t) → suslin(C, UNION(s, t))"),
      t2458,
    ),
  )
}

///|
let suslin_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUSLIN_UNION")

///|
/// `SUSLIN_UNION`
pub fn suslin_union() -> @kernel.Thm {
  suslin_union_c.get()
}

///|
/// CARD_SUSLIN_LE
fn step_196() -> Unit raise {
  let t2519 = @simp.rewrite_tac(@list.List([@card.card_square_num()]))
  let t2518 = @simp.once_rewrite_tac(@list.List([@card.card_eq_sym()]))
  let t2517 = @simp.rewrite_tac(@list.List([@card.card_eq_refl()]))
  let t2516 = @tactics.match_mp_tac(@card.card_exp_cong())
  let t2515 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@card.card_exp_univ())]),
  )
  let t2514 = @simp.rewrite_tac(@list.List([@card.card_eq_real()]))
  let t2513 = @simp.once_rewrite_tac(@list.List([@card.card_eq_sym()]))
  let t2511 = @term_syntax.parse_term("(UNIV : ((Num) -> Bool) -> Bool)")
  let t2512 = @tactics.trans_tac(@card.card_eq_trans())(t2511)
  let t2510 = @tactics.match_mp_tac(@card.card_eq_imp_le())
  let t2509 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @card.card_le_trans(),
    ),
  )
  let t2506 = @drule.match_mp(@card.card_eq_imp_le())
  let t2508 = @tactics.disch_then(fn(
    x2507 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2503 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2504 = @tactics.mp_tac(x2503)
      fn(
        x2505 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2504(x2505)
      }
    })(t2506(x2507))
  })
  let t2502 = @simp.once_rewrite_tac(@list.List([@card.card_eq_sym()]))
  let t2496 = @drule.part_match(@kernel.rand, @card.card_exp_mul())
  let t2492 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@card.card_exp_univ())]),
  )
  let t2490 = @simp.simp_tac(
    @list.List([
      @card.card_eq_real(),
      @card.card_eq_list(),
      @sets.num_infinite(),
    ]),
  )
  let t2489 = @tactics.match_mp_tac(@card.card_exp_cong())
  let t2491 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@card.card_eq_imp_le()), t2489),
      t2490,
    ),
    @tactics.all_tac,
  ])
  let t2487 = @term_syntax.parse_term("(op_caret_us_c : (((Num) -> Bool) -> Bool, (Num) -> Bool, (Num, Num) -> Bool) -> Bool)((UNIV : ((Num) -> Bool) -> Bool), (UNIV : (Num) -> Bool))")
  let t2488 = @tactics.trans_tac(@card.card_le_trans())(t2487)
  let t2486 = @simp.asm_simp_tac(@list.List([@card.card_le_exp_left()]))
  let t2484 = @term_syntax.parse_term("(op_caret_us_c : ((Real) -> Bool, (List[Num]) -> Bool, (List[Num]) -> Real) -> Bool)((UNIV : (Real) -> Bool), (UNIV : (List[Num]) -> Bool))")
  let t2485 = @tactics.trans_tac(@card.card_le_trans())(t2484)
  let t2483 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @card.card_le_trans(),
    ),
  )
  let t2477 = @drule.part_match(@equal.lhand, @card.card_le_image())
  let t2472 = @simp.asm_simp_tac(
    @list.List([@lists.list_of_seq_eq_nil(), @arith.le_1()]),
  )
  let t2470 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2471 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.ap_term_tac,
        @tactics.match_mp_tac(
          @sets.set_rule(
            @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → (f : (_) -> _)(x) == (g : (_) -> _)(x)) → {f((x : _)) | P(x)} == {g((x : _)) | P(x)}"),
          ),
        ),
      ),
      t2470,
    ),
  )
  let t2469 = @list.List([
    @meson.asm_meson_tac(@list.List([@lists.not_cons_nil()])),
    @tactics.all_tac,
  ])
  let t2468 = @simp.rewrite_tac(@list.List([suslin_operation()]))
  let t2467 = @tactics.exists_tac(
    @term_syntax.parse_term("(l : List[Num]) => if l == NIL { (f : (List[Num], A) -> Bool)([0]) } else { f(l) }"),
  )
  let t2466 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2465 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (List[Num], A) -> Bool)"))
  let t2464 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (∃ y : _, IN(y, (t : (_) -> Bool)) && (f : (_) -> _)(x) == f(y))) → SUBSET(IMAGE(f, s), IMAGE(f, t))"),
    ),
  )
  let t2463 = @simp.rewrite_tac(@list.List([@card.exp_c(), @sets.in_univ()]))
  let t2473 = @list.List([
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
                          @tactics.match_mp_tac(@card.card_le_subset()),
                          t2463,
                        ),
                        t2464,
                      ),
                      t2465,
                    ),
                    t2466,
                  ),
                  @tactics.strip_tac,
                ),
                t2467,
              ),
              t2468,
            ),
            @tactics.conj_tac,
          ),
          t2469,
        ),
        t2471,
      ),
      t2472,
    ),
    @tactics.all_tac,
  ])
  let t2461 = @term_syntax.parse_term("IMAGE(suslin_operation, op_caret_us_c((C : ((A) -> Bool) -> Bool), UNIV))")
  let t2462 = @tactics.trans_tac(@card.card_le_trans())(t2461)
  let t2460 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t2459 = @simp.rewrite_tac(@list.List([suslin()]))
  let t2520 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                                                      @tactics.repeat_tac(
                                                        @tactics.strip_tac,
                                                      ),
                                                      t2459,
                                                    ),
                                                    t2460,
                                                  ),
                                                  t2462,
                                                ),
                                                @tactics.conj_tac,
                                              ),
                                              t2473,
                                            ),
                                            fn(
                                              x2482 : (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
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
                                              (fn(
                                                x2481 : (
                                                  @list.List[
                                                    (String, @kernel.Thm),
                                                  ],
                                                  @kernel.Term,
                                                ),
                                              ) -> ((
                                                (
                                                  @list.List[
                                                    (String, @kernel.Thm),
                                                  ],
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
                                                  @list.List[@kernel.Thm],
                                                ) -> @kernel.Thm raise,
                                              ) raise) raise {
                                                (fn(
                                                  x2479 : @kernel.Term,
                                                ) -> ((
                                                  (
                                                    @list.List[
                                                      (String, @kernel.Thm),
                                                    ],
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
                                                    @list.List[@kernel.Thm],
                                                  ) -> @kernel.Thm raise,
                                                ) raise) raise {
                                                  (fn(
                                                    x2478 : @kernel.Term,
                                                  ) -> ((
                                                    (
                                                      @list.List[
                                                        (String, @kernel.Thm),
                                                      ],
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
                                                      @list.List[@kernel.Thm],
                                                    ) -> @kernel.Thm raise,
                                                  ) raise) raise {
                                                    (fn(
                                                      x2474 : @kernel.Thm,
                                                    ) -> ((
                                                      (
                                                        @list.List[
                                                          (String, @kernel.Thm),
                                                        ],
                                                        @kernel.Term,
                                                      ),
                                                    ) -> (
                                                      (
                                                        @list.List[@kernel.Term],
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
                                                        @list.List[@kernel.Thm],
                                                      ) -> @kernel.Thm raise,
                                                    ) raise) raise {
                                                      let s2475 = @tactics.mp_tac(
                                                        x2474,
                                                      )
                                                      fn(
                                                        x2476 : (
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
                                                        s2475(x2476)
                                                      }
                                                    })(t2477(x2478))
                                                  })(@equal.lhand(x2479))
                                                })(
                                                  (fn(
                                                    x2480 : (
                                                      @list.List[
                                                        (String, @kernel.Thm),
                                                      ],
                                                      @kernel.Term,
                                                    ),
                                                  ) -> @kernel.Term raise {
                                                    x2480.1
                                                  })(x2481),
                                                )
                                              })(x2482)(x2482)
                                            },
                                          ),
                                          t2483,
                                        ),
                                        t2485,
                                      ),
                                      t2486,
                                    ),
                                    t2488,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t2491,
                              ),
                              t2492,
                            ),
                            fn(
                              x2501 : (
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
                                x2500 : (
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
                                  x2498 : @kernel.Term,
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
                                    x2497 : @kernel.Term,
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
                                      x2493 : @kernel.Thm,
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
                                      let s2494 = @tactics.mp_tac(x2493)
                                      fn(
                                        x2495 : (
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
                                        s2494(x2495)
                                      }
                                    })(t2496(x2497))
                                  })(@equal.lhand(x2498))
                                })(
                                  (fn(
                                    x2499 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> @kernel.Term raise {
                                    x2499.1
                                  })(x2500),
                                )
                              })(x2501)(x2501)
                            },
                          ),
                          t2502,
                        ),
                        t2508,
                      ),
                      t2509,
                    ),
                    t2510,
                  ),
                  t2512,
                ),
                t2513,
              ),
              t2514,
            ),
            t2515,
          ),
          t2516,
        ),
        t2517,
      ),
      t2518,
    ),
    t2519,
  )
  card_suslin_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, (op_lt_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)(C, (UNIV : (Real) -> Bool)) → (op_lt_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)((suslin : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)(C), (UNIV : (Real) -> Bool))"),
      t2520,
    ),
  )
}

///|
let card_suslin_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUSLIN_LE")

///|
/// `CARD_SUSLIN_LE`
pub fn card_suslin_le() -> @kernel.Thm {
  card_suslin_le_c.get()
}

///|
/// CARD_SUSLIN_EQ
fn step_197() -> Unit raise {
  let t2525 = @simp.rewrite_tac(@list.List([suslin_superset()]))
  let t2524 = @tactics.match_mp_tac(@card.card_le_subset())
  let t2523 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @card.card_le_trans(),
    ),
  )
  let t2522 = @simp.rewrite_tac(@list.List([card_suslin_le()]))
  let t2521 = @tactics.match_mp_tac(@theorems.mono_and())
  let t2526 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.simp_tac(@list.List([@equal.gsym(@card.card_le_antisym())])),
            ),
            t2521,
          ),
          t2522,
        ),
        t2523,
      ),
      t2524,
    ),
    t2525,
  )
  card_suslin_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ C : ((A) -> Bool) -> Bool, (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)(C, (UNIV : (Real) -> Bool)) → (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)((suslin : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)(C), (UNIV : (Real) -> Bool))"),
      t2526,
    ),
  )
}

///|
let card_suslin_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUSLIN_EQ")

///|
/// `CARD_SUSLIN_EQ`
pub fn card_suslin_eq() -> @kernel.Thm {
  card_suslin_eq_c.get()
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
}
