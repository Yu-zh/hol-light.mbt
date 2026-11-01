// Translated from upstream Library/bitsize.ml; edit this file directly.

///|
/// bitsize
fn step_1() -> Unit raise {
  bitsize_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(bitsize : (Num) -> Num)((n : Num)) == minimal((i : Num) => n < EXP(2, i))"),
    ),
  )
}

///|
let bitsize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bitsize")

///|
/// `bitsize`
pub fn bitsize() -> @kernel.Thm {
  bitsize_c.get()
}

///|
/// BITSIZE_0
fn step_2() -> Unit raise {
  let t1 = @tactics.match_mp_tac(@arith.minimal_unique())
  let t2 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([bitsize()])), t1),
    @int.arith_tac,
  )
  bitsize_0_c.set(@tactics.prove(@term_syntax.parse_term("bitsize(0) == 0"), t2))
}

///|
let bitsize_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_0")

///|
/// `BITSIZE_0`
pub fn bitsize_0() -> @kernel.Thm {
  bitsize_0_c.get()
}

///|
/// BITSIZE_POW2
fn step_3() -> Unit raise {
  let t3 = @tactics.match_mp_tac(@arith.minimal_unique())
  let t4 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([bitsize(), @arith.lt_exp()])),
      ),
      t3,
    ),
    @int.arith_tac,
  )
  bitsize_pow2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ k : Num, bitsize(EXP(2, k)) == k + 1"), t4),
  )
}

///|
let bitsize_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_POW2")

///|
/// `BITSIZE_POW2`
pub fn bitsize_pow2() -> @kernel.Thm {
  bitsize_pow2_c.get()
}

///|
/// BITSIZE_1
fn step_4() -> Unit raise {
  let t5 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t6 = @tactics.then_tac(
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), bitsize_pow2())),
    t5,
  )
  bitsize_1_c.set(@tactics.prove(@term_syntax.parse_term("bitsize(1) == 1"), t6))
}

///|
let bitsize_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_1")

///|
/// `BITSIZE_1`
pub fn bitsize_1() -> @kernel.Thm {
  bitsize_1_c.get()
}

///|
/// BITSIZE_2
fn step_5() -> Unit raise {
  let t7 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t8 = @tactics.then_tac(
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), bitsize_pow2())),
    t7,
  )
  bitsize_2_c.set(@tactics.prove(@term_syntax.parse_term("bitsize(2) == 2"), t8))
}

///|
let bitsize_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_2")

///|
/// `BITSIZE_2`
pub fn bitsize_2() -> @kernel.Thm {
  bitsize_2_c.get()
}

///|
/// BITSIZE_LE
fn step_6() -> Unit raise {
  let t21 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_exp(), @calc_num.arith_eq()]),
  )
  let t20 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @arith.lte_trans(),
    ),
  )
  let t18 = @tactics.conjuncts_then2(
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
    fn(
      x15 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s16 = @tactics.mp_tac(x15)
      fn(
        x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s16(x17)
      }
    },
  )
  let t19 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(t18),
  )
  let t11 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@arith.le_refl()])),
  ])
  let t10 = @simp.simp_tac(
    @list.List([
      @arith.minimal_le(),
      @meson.meson(
        @list.List([@arith.lt_pow2_refl()]),
        @term_syntax.parse_term("∃ i : Num, (n : Num) < EXP(2, i)"),
      ),
    ]),
  )
  let t9 = @simp.rewrite_tac(@list.List([bitsize()]))
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t9),
              t10,
            ),
            @tactics.eq_tac,
          ),
          t11,
        ),
        t19,
      ),
      t20,
    ),
    t21,
  )
  bitsize_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (bitsize(n) <= k) == (n < EXP(2, k))"),
      t22,
    ),
  )
}

///|
let bitsize_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_LE")

///|
/// `BITSIZE_LE`
pub fn bitsize_le() -> @kernel.Thm {
  bitsize_le_c.get()
}

///|
/// BITSIZE
fn step_7() -> Unit raise {
  let t23 = @simp.rewrite_tac(
    @list.List([@equal.gsym(bitsize_le()), @arith.le_refl()]),
  )
  bitsize_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, n < EXP(2, bitsize(n))"), t23),
  )
}

///|
let bitsize_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE")

///|
/// `BITSIZE`
pub fn bitsize_v1() -> @kernel.Thm {
  bitsize_v1_c.get()
}

///|
/// BITSIZE_UNIQUE
fn step_8() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([@arith.lt_antisym(), @arith.lt_cases(), @arith.lt_trans()]),
  )
  let t24 = @equal.gsym(bitsize_le())
  let t26 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt()), t24])),
    t25,
  )
  bitsize_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (bitsize(n) == k) == (n < EXP(2, k) && (∀ j : Num, j < k → EXP(2, j) <= n))"),
      t26,
    ),
  )
}

///|
let bitsize_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_UNIQUE")

///|
/// `BITSIZE_UNIQUE`
pub fn bitsize_unique() -> @kernel.Thm {
  bitsize_unique_c.get()
}

///|
/// BITSIZE_UNIQUE_ALT
fn step_9() -> Unit raise {
  let t27 = @meson.meson_tac(
    @list.List([
      @arith.not_le(),
      @arith.le_exp(),
      @int.arith_rule(@term_syntax.parse_term("!(2 == 0)")),
      @arith.le_trans(),
      @arith.le_antisym(),
    ]),
  )
  let t28 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([bitsize_unique()])),
    t27,
  )
  bitsize_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (bitsize(n) == k) == (∀ j : Num, (n < EXP(2, j)) == (k <= j))"),
      t28,
    ),
  )
}

///|
let bitsize_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_UNIQUE_ALT",
)

///|
/// `BITSIZE_UNIQUE_ALT`
pub fn bitsize_unique_alt() -> @kernel.Thm {
  bitsize_unique_alt_c.get()
}

///|
/// BITSIZE_EQ_0
fn step_10() -> Unit raise {
  let t29 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([bitsize_unique(), @arith.lt()])),
    @int.arith_tac,
  )
  bitsize_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, (bitsize(n) == 0) == (n == 0)"), t29),
  )
}

///|
let bitsize_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_EQ_0")

///|
/// `BITSIZE_EQ_0`
pub fn bitsize_eq_0() -> @kernel.Thm {
  bitsize_eq_0_c.get()
}

///|
/// BITSIZE_MONO
fn step_11() -> Unit raise {
  let t33 = @simp.asm_rewrite_tac(@list.List([bitsize_v1()]))
  let t31 = @term_syntax.parse_term("(n : Num)")
  let t32 = @tactics.trans_tac(@arith.let_trans())(t31)
  let t30 = @simp.rewrite_tac(@list.List([bitsize_le()]))
  let t34 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t30),
      t32,
    ),
    t33,
  )
  bitsize_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → bitsize(m) <= bitsize(n)"),
      t34,
    ),
  )
}

///|
let bitsize_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_MONO")

///|
/// `BITSIZE_MONO`
pub fn bitsize_mono() -> @kernel.Thm {
  bitsize_mono_c.get()
}

///|
/// BITSIZE_MAX
fn step_12() -> Unit raise {
  let t36 = @int.arith_rule(@term_syntax.parse_term("(n : Num) <= (m : Num) → MAX(m, n) == m"))
  let t37 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → MAX(m, n) == n")),
      bitsize_mono(),
      t36,
    ]),
  )
  let t35 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) || n <= m")),
  )
  let t38 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t35),
    t37,
  )
  bitsize_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, bitsize(MAX(m, n)) == MAX(bitsize(m), bitsize(n))"),
      t38,
    ),
  )
}

///|
let bitsize_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_MAX")

///|
/// `BITSIZE_MAX`
pub fn bitsize_max() -> @kernel.Thm {
  bitsize_max_c.get()
}

///|
/// BITSIZE_MIN
fn step_13() -> Unit raise {
  let t40 = @int.arith_rule(@term_syntax.parse_term("(n : Num) <= (m : Num) → MIN(m, n) == n"))
  let t41 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → MIN(m, n) == m")),
      bitsize_mono(),
      t40,
    ]),
  )
  let t39 = @tactics.disj_cases_tac(
    @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) || n <= m")),
  )
  let t42 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t39),
    t41,
  )
  bitsize_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, bitsize(MIN(m, n)) == MIN(bitsize(m), bitsize(n))"),
      t42,
    ),
  )
}

///|
let bitsize_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_MIN")

///|
/// `BITSIZE_MIN`
pub fn bitsize_min() -> @kernel.Thm {
  bitsize_min_c.get()
}

///|
/// BITSIZE_MULT_LE
fn step_14() -> Unit raise {
  let t45 = @simp.rewrite_tac(@list.List([bitsize_v1()]))
  let t44 = @tactics.match_mp_tac(@arith.lt_mult2())
  let t43 = @simp.rewrite_tac(@list.List([bitsize_le(), @arith.exp_add()]))
  let t46 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t43),
      t44,
    ),
    t45,
  )
  bitsize_mult_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, bitsize(m * n) <= bitsize(m) + bitsize(n)"),
      t46,
    ),
  )
}

///|
let bitsize_mult_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_MULT_LE",
)

///|
/// `BITSIZE_MULT_LE`
pub fn bitsize_mult_le() -> @kernel.Thm {
  bitsize_mult_le_c.get()
}

///|
/// BITSIZE_REV_EQ
fn step_15() -> Unit raise {
  let t48 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)")),
      bitsize_eq_0(),
    ]),
  )
  let t47 = @equal.gsym(bitsize_le())
  let t49 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt()), t47])),
    t48,
  )
  bitsize_rev_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (EXP(2, bitsize(n) - 1) <= n) == !(n == 0)"),
      t49,
    ),
  )
}

///|
let bitsize_rev_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_REV_EQ")

///|
/// `BITSIZE_REV_EQ`
pub fn bitsize_rev_eq() -> @kernel.Thm {
  bitsize_rev_eq_c.get()
}

///|
/// BITSIZE_REV
fn step_16() -> Unit raise {
  let t50 = @simp.rewrite_tac(@list.List([bitsize_rev_eq()]))
  bitsize_rev_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → EXP(2, bitsize(n) - 1) <= n"),
      t50,
    ),
  )
}

///|
let bitsize_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_REV")

///|
/// `BITSIZE_REV`
pub fn bitsize_rev() -> @kernel.Thm {
  bitsize_rev_c.get()
}

///|
/// BITSIZE_REV_EQ_ALT
fn step_17() -> Unit raise {
  let t57 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) == SUC(n - 1)) == !(n == 0)")),
      bitsize_eq_0(),
    ]),
  )
  let t56 = @tactics.match_mp_tac(@arith.eq_imp_le())
  let t55 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]),
  )
  let t54 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_mult_lcancel(), bitsize_rev_eq()]),
  )
  let t52 = @term_syntax.parse_term("2 * EXP(2, bitsize((n : Num)) - 1)")
  let t53 = @tactics.trans_tac(@arith.le_trans())(t52)
  let t51 = @simp.asm_rewrite_tac(@list.List([bitsize_0(), @calc_num.arith()]))
  let t58 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
                ),
                t51,
              ),
              t53,
            ),
            t54,
          ),
          t55,
        ),
        t56,
      ),
      @tactics.ap_term_tac,
    ),
    t57,
  )
  bitsize_rev_eq_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (EXP(2, bitsize(n)) <= 2 * n) == !(n == 0)"),
      t58,
    ),
  )
}

///|
let bitsize_rev_eq_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_REV_EQ_ALT",
)

///|
/// `BITSIZE_REV_EQ_ALT`
pub fn bitsize_rev_eq_alt() -> @kernel.Thm {
  bitsize_rev_eq_alt_c.get()
}

///|
/// BITSIZE_REV_ALT
fn step_18() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([bitsize_rev_eq_alt()]))
  bitsize_rev_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → EXP(2, bitsize(n)) <= 2 * n"),
      t59,
    ),
  )
}

///|
let bitsize_rev_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_REV_ALT",
)

///|
/// `BITSIZE_REV_ALT`
pub fn bitsize_rev_alt() -> @kernel.Thm {
  bitsize_rev_alt_c.get()
}

///|
/// LE_BITSIZE
fn step_19() -> Unit raise {
  let t62 = @equal.gsym(bitsize_le())
  let t63 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt()), t62]))
  let t61 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_0(), @calc_num.arith()]),
  )
  let t60 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t60),
        t61,
      ),
      t63,
    ),
    @int.asm_arith_tac,
  )
  le_bitsize_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (k <= bitsize(n)) == (!(k == 0) → EXP(2, k - 1) <= n)"),
      t64,
    ),
  )
}

///|
let le_bitsize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_BITSIZE")

///|
/// `LE_BITSIZE`
pub fn le_bitsize() -> @kernel.Thm {
  le_bitsize_c.get()
}

///|
/// LE_BITSIZE_ALT
fn step_20() -> Unit raise {
  let t69 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]),
  )
  let t68 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("2 * (a : Num) == (b : Num) → (a <= (n : Num)) == (b <= 2 * n)")),
  )
  let t67 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t65 = @simp.rewrite_tac(@list.List([le_bitsize()]))
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t65),
              t66,
            ),
            t67,
          ),
          t68,
        ),
        t69,
      ),
      @tactics.ap_term_tac,
    ),
    @int.asm_arith_tac,
  )
  le_bitsize_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (k <= bitsize(n)) == (!(k == 0) → EXP(2, k) <= 2 * n)"),
      t70,
    ),
  )
}

///|
let le_bitsize_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_BITSIZE_ALT")

///|
/// `LE_BITSIZE_ALT`
pub fn le_bitsize_alt() -> @kernel.Thm {
  le_bitsize_alt_c.get()
}

///|
/// BITSIZE_UNIQUE_EQ
fn step_21() -> Unit raise {
  let t75 = @simp.rewrite_tac(@list.List([le_bitsize_alt(), @arith.exp_add()]))
  let t74 = @simp.gen_rewrite_tac(
    fn(
      x71 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s72 = @equal.land_conv(x71)
      fn(x73 : @kernel.Term) -> @kernel.Thm raise { s72(x73) }
    },
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) == (k : Num)) == (k <= n && !(k + 1 <= n))")),
    ]),
  )
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t74),
      t75,
    ),
    @int.arith_tac,
  )
  bitsize_unique_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (bitsize(n) == k) == (n < EXP(2, k) && (!(k == 0) → EXP(2, k) <= 2 * n))"),
      t76,
    ),
  )
}

///|
let bitsize_unique_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_UNIQUE_EQ",
)

///|
/// `BITSIZE_UNIQUE_EQ`
pub fn bitsize_unique_eq() -> @kernel.Thm {
  bitsize_unique_eq_c.get()
}

///|
/// BITSIZE_MULT
fn step_22() -> Unit raise {
  let t83 = @simp.asm_rewrite_tac(
    @list.List([
      bitsize_v1(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
      bitsize_rev_eq_alt(),
    ]),
  )
  let t82 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_add(),
      @arith.lt_mult_lcancel(),
      @arith.le_mult_lcancel(),
    ]),
  )
  let t81 = @simp.once_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 * ((a : Num) * (b : Num)) == a * (2 * b)"))]),
  )
  let t80 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.le_antisym()),
      le_bitsize_alt(),
      bitsize_le(),
    ]),
  )
  let t79 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), bitsize_0()]),
  )
  let t77 = @tactics.repeat_tac(@tactics.gen_tac)
  let t78 = @list.List([
    @simp.rewrite_tac(@list.List([@arith.mult_sym(), @arith.add_sym()])),
    t77,
  ])
  let t84 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.match_mp_tac(
                    @class.taut(
                      @term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q"),
                    ),
                  ),
                  @tactics.conj_tac,
                ),
                t78,
              ),
              @class.cond_cases_tac,
            ),
            t79,
          ),
          t80,
        ),
        t81,
      ),
      t82,
    ),
    t83,
  )
  bitsize_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ k : Num, ∀ n : Num, bitsize(EXP(2, k) * n) == (if n == 0 { 0 } else { k + bitsize(n) })) && (∀ k : Num, ∀ n : Num, bitsize(n * EXP(2, k)) == (if n == 0 { 0 } else { bitsize(n) + k }))"),
      t84,
    ),
  )
}

///|
let bitsize_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_MULT")

///|
/// `BITSIZE_MULT`
pub fn bitsize_mult() -> @kernel.Thm {
  bitsize_mult_c.get()
}

///|
/// BITSIZE_MULT_ADD
fn step_23() -> Unit raise {
  let t93 = @tactics.then_tac(
    @tactics.match_mp_tac(bitsize_mono()),
    @int.arith_tac,
  )
  let t94 = @list.List([
    @simp.asm_rewrite_tac(@list.List([bitsize_mult(), @arith.le_refl()])),
    t93,
  ])
  let t92 = @term_syntax.parse_term("bitsize(EXP(2, (k : Num)) * (m : Num))")
  let t95 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.trans_tac(@arith.le_trans())(t92),
      @tactics.conj_tac,
    ),
    t94,
  )
  let t91 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((m : Num) + 1 <= (r : Num)) == (m < r)")),
      bitsize_v1(),
    ]),
  )
  let t90 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_add(),
      @arith.le_mult_lcancel(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
    ]),
  )
  let t88 = @term_syntax.parse_term("EXP(2, (k : Num)) * ((m : Num) + 1)")
  let t89 = @tactics.trans_tac(@arith.lte_trans())(t88)
  let t96 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.rewrite_tac(@list.List([bitsize_le()])), t89),
          t90,
        ),
        t91,
      ),
      @int.asm_arith_tac,
    ),
    t95,
  ])
  let t87 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())]))
  let t85 = @tactics.repeat_tac(@tactics.strip_tac)
  let t86 = @list.List([
    @simp.rewrite_tac(
      @list.List([@arith.mult_sym(), @arith.add_sym(), @theorems.disj_sym()]),
    ),
    t85,
  ])
  let t97 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")),
            ),
            @tactics.conj_tac,
          ),
          t86,
        ),
        t87,
      ),
      @tactics.conj_tac,
    ),
    t96,
  )
  bitsize_mult_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ k : Num, ∀ m : Num, ∀ n : Num, !(m == 0) && n < EXP(2, k) → bitsize(EXP(2, k) * m + n) == k + bitsize(m)) && (∀ k : Num, ∀ m : Num, ∀ n : Num, !(m == 0) && n < EXP(2, k) → bitsize(m * EXP(2, k) + n) == k + bitsize(m)) && (∀ k : Num, ∀ m : Num, ∀ n : Num, !(m == 0) && n < EXP(2, k) → bitsize(n + EXP(2, k) * m) == k + bitsize(m)) && (∀ k : Num, ∀ m : Num, ∀ n : Num, !(m == 0) && n < EXP(2, k) → bitsize(n + m * EXP(2, k)) == k + bitsize(m))"),
      t97,
    ),
  )
}

///|
let bitsize_mult_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSIZE_MULT_ADD",
)

///|
/// `BITSIZE_MULT_ADD`
pub fn bitsize_mult_add() -> @kernel.Thm {
  bitsize_mult_add_c.get()
}

///|
/// BITSIZE_DIV
fn step_24() -> Unit raise {
  let t108 = @simp.rewrite_tac(
    @list.List([@arith.add_sub(), @arith.add_eq_0(), @calc_num.arith_eq()]),
  )
  let t107 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((a : Num) < (b : Num)) == (a + 1 <= b)")),
      le_bitsize(),
    ]),
  )
  let t106 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("!((n : Num) <= (k : Num)) → ((j : Num) < n - k) == (k + j < n)"),
      ),
    ]),
  )
  let t105 = @int.arith_rule(
    @term_syntax.parse_term("!((n : Num) <= (k : Num)) → k + (n - k) == n"),
  )
  let t109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([@equal.gsym(@arith.exp_add()), bitsize_v1(), t105]),
        ),
        t106,
      ),
      t107,
    ),
    t108,
  )
  let t104 = @simp.asm_rewrite_tac(@list.List([bitsize_v1(), @arith.le_exp()]))
  let t102 = @term_syntax.parse_term("EXP(2, bitsize((n : Num)))")
  let t103 = @tactics.trans_tac(@arith.lte_trans())(t102)
  let t101 = @simp.rewrite_tac(
    @list.List([
      @bool.conjunct1(@arith.lt()),
      @arith.mult_clauses(),
      @arith.exp(),
    ]),
  )
  let t110 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_simp_tac(
              @list.List([
                @int.arith_rule(@term_syntax.parse_term("(n : Num) <= (k : Num) → n - k == 0")),
              ]),
            ),
            t101,
          ),
          t103,
        ),
        t104,
      ),
      @int.asm_arith_tac,
    ),
    t109,
  ])
  let t100 = @class.asm_cases_tac(@term_syntax.parse_term("bitsize((n : Num)) <= (k : Num)"))
  let t99 = @simp.simp_tac(
    @list.List([
      @arith.rdiv_lt_eq(),
      @arith.le_rdiv_eq(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
    ]),
  )
  let t98 = @simp.rewrite_tac(@list.List([bitsize_unique()]))
  let t111 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t98),
        t99,
      ),
      t100,
    ),
    t110,
  )
  bitsize_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, bitsize(DIV(n, EXP(2, k))) == bitsize(n) - k"),
      t111,
    ),
  )
}

///|
let bitsize_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSIZE_DIV")

///|
/// `BITSIZE_DIV`
pub fn bitsize_div() -> @kernel.Thm {
  bitsize_div_c.get()
}

///|
/// BITSIZE_CONV
fn step_25() -> Unit raise {
  fn bitfun(x112 : Int64, x113 : @num.Num) -> Int64 raise {
    let k = x112
    let n = x113
    if @num.eq_num(n, @num.num_0) {
      k
    } else {
      let t114 = @num.quo_num(n, @num.num_2)
      bitfun(@lib.add63(k, 1L), t114)
    }
  }
  bitsize_conv_c.set(fn(x115 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x115
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("bitsize", _), ntm) if @nums.is_numeral(
          ntm,
        ) => {
        let ktm = @nums.mk_small_numeral(bitfun(0L, @basics.dest_numeral(ntm)))
        let th = @bool.specl(@list.List([ntm, ktm]), bitsize_unique_eq())
        @bool.eqt_elim(
          @equal.conv_rule(@equal.rand_conv(@calc_num.num_reduce_conv), th),
        )
      }
      _ => raise Failure("BITSIZE_CONV")
    }
  })
}

///|
let bitsize_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "BITSIZE_CONV",
)

///|
/// `BITSIZE_CONV`
pub fn bitsize_conv(x : @kernel.Term) -> @kernel.Thm raise {
  bitsize_conv_c.get()(x)
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
}
