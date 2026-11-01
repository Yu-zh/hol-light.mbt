// Translated from upstream Library/binary.ml; edit this file directly.

///|
/// BOUNDED_FINITE
fn step_1() -> Unit raise {
  let t3 = @simp.asm_simp_tac(
    @list.List([
      @sets.subset(),
      @iterate.in_numseg(),
      @iterate.finite_numseg(),
      @arith.le_0(),
    ]),
  )
  let t2 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t1 = @tactics.match_mp_tac(@sets.finite_subset())
  let t4 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1),
      t2,
    ),
    t3,
  )
  bounded_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, (∀ x : Num, IN(x, s) → x <= (n : Num)) → FINITE(s)"),
      t4,
    ),
  )
}

///|
let bounded_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_FINITE")

///|
/// `BOUNDED_FINITE`
pub fn bounded_finite() -> @kernel.Thm {
  bounded_finite_c.get()
}

///|
/// EVEN_NSUM
fn step_2() -> Unit raise {
  let t6 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @calc_num.arith(),
      @arith.even_add(),
      @sets.in_insert(),
    ]),
  )
  let t5 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t7 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj()])), t5),
    t6,
  )
  even_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) && (∀ i : _, IN(i, s) → EVEN((f : (_) -> Num)(i))) → EVEN(nsum(s, f))"),
      t7,
    ),
  )
}

///|
let even_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_NSUM")

///|
/// `EVEN_NSUM`
pub fn even_nsum() -> @kernel.Thm {
  even_nsum_c.get()
}

///|
/// bitset
fn step_3() -> Unit raise {
  bitset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(bitset : (Num, Num) -> Bool)((n : Num)) == {(i : Num) | ODD(DIV(n, EXP(2, i)))}"),
    ),
  )
}

///|
let bitset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bitset")

///|
/// `bitset`
pub fn bitset() -> @kernel.Thm {
  bitset_c.get()
}

///|
/// binarysum
fn step_4() -> Unit raise {
  binarysum_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(binarysum : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == nsum(s, (i : Num) => EXP(2, i))"),
    ),
  )
}

///|
let binarysum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("binarysum")

///|
/// `binarysum`
pub fn binarysum() -> @kernel.Thm {
  binarysum_c.get()
}

///|
/// BITSET_BOUND_LEMMA
fn step_5() -> Unit raise {
  let t8 = @meson.meson_tac(
    @list.List([@arith.div_lt(), @arith.odd(), @arith.not_le()]),
  )
  let t9 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([bitset(), @sets.in_elim_thm()])),
    t8,
  )
  bitset_bound_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ i : Num, IN(i, bitset(n)) → EXP(2, i) <= n"),
      t9,
    ),
  )
}

///|
let bitset_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSET_BOUND_LEMMA",
)

///|
/// `BITSET_BOUND_LEMMA`
pub fn bitset_bound_lemma() -> @kernel.Thm {
  bitset_bound_lemma_c.get()
}

///|
/// BITSET_BOUND_WEAK
fn step_6() -> Unit raise {
  let t10 = @meson.meson_tac(
    @list.List([bitset_bound_lemma(), @arith.lt_pow2_refl(), @arith.lte_trans()]),
  )
  bitset_bound_weak_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ i : Num, IN(i, bitset(n)) → i < n"), t10),
  )
}

///|
let bitset_bound_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSET_BOUND_WEAK",
)

///|
/// `BITSET_BOUND_WEAK`
pub fn bitset_bound_weak() -> @kernel.Thm {
  bitset_bound_weak_c.get()
}

///|
/// FINITE_BITSET
fn step_7() -> Unit raise {
  let t13 = @meson.meson_tac(
    @list.List([@arith.lt_imp_le(), bitset_bound_weak()]),
  )
  let t12 = @simp.rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
      @arith.le_0(),
      @sets.subset(),
    ]),
  )
  let t11 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t14 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.match_mp_tac(@sets.finite_subset()),
        ),
        t11,
      ),
      t12,
    ),
    t13,
  )
  finite_bitset_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, FINITE(bitset(n))"), t14),
  )
}

///|
let finite_bitset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_BITSET")

///|
/// `FINITE_BITSET`
pub fn finite_bitset() -> @kernel.Thm {
  finite_bitset_c.get()
}

///|
/// BITSET_0
fn step_8() -> Unit raise {
  let t15 = @simp.simp_tac(
    @list.List([@arith.div_0(), @arith.exp_eq_0(), @calc_num.arith()]),
  )
  let t16 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        bitset(),
        @sets.extension(),
        @sets.not_in_empty(),
        @sets.in_elim_thm(),
      ]),
    ),
    t15,
  )
  bitset_0_c.set(@tactics.prove(@term_syntax.parse_term("bitset(0) == {}"), t16))
}

///|
let bitset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSET_0")

///|
/// `BITSET_0`
pub fn bitset_0() -> @kernel.Thm {
  bitset_0_c.get()
}

///|
/// BITSET_STEP
fn step_9() -> Unit raise {
  let t27 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("DIV(2 * (n : Num) + 1, 2) == n && DIV(2 * n, 2) == n"),
      ),
    ]),
  )
  let t26 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@arith.div_div()),
      @arith.mult_eq_0(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
    ]),
  )
  let t25 = @simp.rewrite_tac(
    @list.List([@nums.suc_inj(), @theorems.unwind_thm1(), @arith.exp()]),
  )
  let t24 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t22 = @simp.rewrite_tac(
    @list.List([
      @calc_num.arith(),
      @arith.odd_mult(),
      @arith.div_1(),
      @nums.not_suc(),
      @arith.odd_add(),
    ]),
  )
  let t21 = @tactics.match_mp_tac(@nums.num_induction())
  let t20 = @simp.rewrite_tac(
    @list.List([
      bitset(),
      @sets.extension(),
      @sets.in_insert(),
      @sets.in_elim_thm(),
      @sets.in_image(),
    ]),
  )
  let t19 = @list.List([
    @tactics.all_tac,
    @tactics.disch_then(fn(
      x17 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x17
      @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
    }),
  ])
  let t28 = @tactics.then_tac(
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
                        @tactics.match_mp_tac(
                          @class.taut(
                            @term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b"),
                          ),
                        ),
                        @tactics.conj_tac,
                      ),
                      t19,
                    ),
                    t20,
                  ),
                  @tactics.gen_tac,
                ),
                t21,
              ),
              t22,
            ),
            @tactics.gen_tac,
          ),
          t24,
        ),
        t25,
      ),
      t26,
    ),
    t27,
  )
  bitset_step_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, bitset(2 * n) == IMAGE(SUC, bitset(n))) && (∀ n : Num, bitset(2 * n + 1) == INSERT(0, IMAGE(SUC, bitset(n))))"),
      t28,
    ),
  )
}

///|
let bitset_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSET_STEP")

///|
/// `BITSET_STEP`
pub fn bitset_step() -> @kernel.Thm {
  bitset_step_c.get()
}

///|
/// BINARYSUM_BITSET
fn step_10() -> Unit raise {
  let t34 = @int.arith_rule(@term_syntax.parse_term("(m : Num) < SUC(2 * m)"))
  let t35 = @meson.asm_meson_tac(
    @list.List([
      @arith.add_sym(),
      @int.arith_rule(@term_syntax.parse_term("!(2 * (m : Num) == 0) → m < 2 * m")),
      t34,
    ]),
  )
  let t33 = @simp.rewrite_tac(
    @list.List([@trivia.o_def(), @arith.exp(), @iterate.nsum_lmul()]),
  )
  let t32 = @simp.simp_tac(
    @list.List([
      bitset_step(),
      @iterate.nsum_image(),
      @nums.suc_inj(),
      @arith.add1(),
      finite_bitset(),
      @calc_num.arith(),
      @iterate.nsum_clauses(),
      @sets.finite_image(),
      @sets.in_image(),
      @int.arith_rule(@term_syntax.parse_term("!(0 == (x : Num) + 1)")),
    ]),
  )
  let t31 = @simp.rewrite_tac(@list.List([bitset_0(), @iterate.nsum_clauses()]))
  let t30 = @tactics.match_mp_tac(@int.binary_induct())
  let t29 = @simp.rewrite_tac(@list.List([binarysum()]))
  let t36 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv)),
              t29,
            ),
            t30,
          ),
          t31,
        ),
        t32,
      ),
      t33,
    ),
    t35,
  )
  binarysum_bitset_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, binarysum(bitset(n)) == n"), t36),
  )
}

///|
let binarysum_bitset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINARYSUM_BITSET",
)

///|
/// `BINARYSUM_BITSET`
pub fn binarysum_bitset() -> @kernel.Thm {
  binarysum_bitset_c.get()
}

///|
/// BITSET_EQ
fn step_11() -> Unit raise {
  let t37 = @meson.meson_tac(@list.List([binarysum_bitset()]))
  bitset_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (bitset(m) == bitset(n)) == (m == n)"),
      t37,
    ),
  )
}

///|
let bitset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSET_EQ")

///|
/// `BITSET_EQ`
pub fn bitset_eq() -> @kernel.Thm {
  bitset_eq_c.get()
}

///|
/// BITSET_EQ_EMPTY
fn step_12() -> Unit raise {
  let t38 = @meson.meson_tac(@list.List([bitset_eq(), bitset_0()]))
  bitset_eq_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, (bitset(n) == {}) == (n == 0)"), t38),
  )
}

///|
let bitset_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSET_EQ_EMPTY",
)

///|
/// `BITSET_EQ_EMPTY`
pub fn bitset_eq_empty() -> @kernel.Thm {
  bitset_eq_empty_c.get()
}

///|
/// BINARYSUM_BOUND_LEMMA
fn step_13() -> Unit raise {
  let t52 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t49 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t48 = @simp.rewrite_tac(
    @list.List([
      @arith.exp(),
      @int.arith_rule(@term_syntax.parse_term("((a : Num) + (b : Num) < 2 * a) == (b < a)")),
    ]),
  )
  let t50 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @iterate.nsum_clauses(),
          @sets.finite_delete(),
          @sets.in_delete(),
        ]),
      ),
      t48,
    ),
    t49,
  )
  let t47 = @simp.simp_tac(
    @list.List([@sets.finite_insert(), @sets.finite_delete()]),
  )
  let t51 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@iterate.nsum_subset()), t47),
    t50,
  ])
  let t46 = @tactics.exists_tac(
    @term_syntax.parse_term("nsum(INSERT((k : Num), DELETE((s : (Num) -> Bool), k)), (i : Num) => EXP(2, i))"),
  )
  let t45 = @tactics.match_mp_tac(@arith.let_trans())
  let t44 = @list.List([
    @meson.asm_meson_tac(@list.List([bounded_finite(), @arith.le_lt()])),
    @tactics.all_tac,
  ])
  let t43 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((s : (Num) -> Bool))"), fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s41 = @tactics.assume_tac(x40)
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  })
  let t39 = @tactics.repeat_tac(@tactics.strip_tac)
  let t53 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @nums.induct_tac,
                    @simp.simp_tac(
                      @list.List([
                        @arith.lt(),
                        @equal.gsym(@class.not_exists_thm()),
                        @sets.member_not_empty(),
                        @iterate.nsum_clauses(),
                        @calc_num.arith(),
                      ]),
                    ),
                  ),
                  t39,
                ),
                t43,
              ),
              t44,
            ),
            t45,
          ),
          t46,
        ),
        @tactics.conj_tac,
      ),
      t51,
    ),
    t52,
  )
  binarysum_bound_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ s : (Num) -> Bool, (∀ i : Num, IN(i, s) → i < k) → nsum(s, (i : Num) => EXP(2, i)) < EXP(2, k)"),
      t53,
    ),
  )
}

///|
let binarysum_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINARYSUM_BOUND_LEMMA",
)

///|
/// `BINARYSUM_BOUND_LEMMA`
pub fn binarysum_bound_lemma() -> @kernel.Thm {
  binarysum_bound_lemma_c.get()
}

///|
/// BINARYSUM_DIV_DIVISIBLE
fn step_14() -> Unit raise {
  let t57 = @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (k : Num) → i + (k - i) == k"))
  let t58 = @simp.simp_tac(@list.List([@equal.gsym(@arith.exp_add()), t57]))
  let t56 = @simp.simp_tac(
    @list.List([
      @sets.in_insert(),
      @arith.add_assoc(),
      @arith.eq_add_rcancel(),
      @arith.left_add_distrib(),
    ]),
  )
  let t55 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @arith.div_0(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
      @arith.mult_clauses(),
    ]),
  )
  let t54 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t59 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
          ),
          t54,
        ),
        t55,
      ),
      t56,
    ),
    t58,
  )
  binarysum_div_divisible_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ k : Num, FINITE(s) && (∀ i : Num, IN(i, s) → k <= i) → nsum(s, (i : Num) => EXP(2, i)) == EXP(2, k) * nsum(s, (i : Num) => EXP(2, i - k))"),
      t59,
    ),
  )
}

///|
let binarysum_div_divisible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINARYSUM_DIV_DIVISIBLE",
)

///|
/// `BINARYSUM_DIV_DIVISIBLE`
pub fn binarysum_div_divisible() -> @kernel.Thm {
  binarysum_div_divisible_c.get()
}

///|
/// BINARYSUM_DIV
fn step_15() -> Unit raise {
  let t90 = @simp.simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @int.arith_rule(@term_syntax.parse_term("(k : Num) <= (j : Num) → !(j < k)")),
    ]),
  )
  let t89 = @tactics.match_mp_tac(@iterate.nsum_eq())
  let t88 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_eq_0(),
      @calc_num.arith(),
      @arith.not_lt(),
      @theorems.conj_aci(),
    ]),
  )
  let t87 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((if (p : Bool) { 0 } else { (q : Num) }) == 0) == (!p → q == 0)"),
      ),
    ]),
  )
  let t86 = @simp.rewrite_tac(
    @list.List([
      @iterate.support(),
      @iterate.neutral_add(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
      @sets.in_elim_thm(),
    ]),
  )
  let t85 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@iterate.nsum_support())]),
  )
  let t84 = @simp.rewrite_tac(
    @list.List([
      @arith.eq_mult_lcancel(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
    ]),
  )
  let t83 = @simp.gen_rewrite_tac(
    fn(
      x80 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s81 = @equal.rand_conv(x80)
      fn(x82 : @kernel.Term) -> @kernel.Thm raise { s81(x82) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t78 = @simp.asm_simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t77 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> Bool)"))
  let t76 = @tactics.match_mp_tac(@sets.finite_subset())
  let t75 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t79 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(binarysum_div_divisible()),
            t75,
          ),
          t76,
        ),
        t77,
      ),
      t78,
    ),
    @tactics.all_tac,
  ])
  let t74 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP(2, (k : Num)) * nsum({(i : Num) | k <= i && IN(i, (s : (Num) -> Bool))}, (i : Num) => EXP(2, i - k))"),
  )
  let t73 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t72 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((a : Num) + (x : Num) == (y : Num) + a) == (x == y)")),
    ]),
  )
  let t71 = @simp.simp_tac(
    @list.List([binarysum_bound_lemma(), @sets.in_elim_thm()]),
  )
  let t70 = @tactics.exists_tac(
    @term_syntax.parse_term("nsum({(i : Num) | i < (k : Num) && IN(i, (s : (Num) -> Bool))}, (j : Num) => EXP(2, j))"),
  )
  let t69 = @tactics.match_mp_tac(@arith.div_uniq())
  let t67 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (s : (Num) -> Bool))"))
  let t65 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t64 = @simp.asm_simp_tac(
    @list.List([
      @sets.extension(),
      @sets.in_inter(),
      @sets.in_union(),
      @sets.in_elim_thm(),
      @sets.not_in_empty(),
    ]),
  )
  let t63 = @tactics.match_mp_tac(@iterate.nsum_union_eq())
  let t62 = @tactics.conv_tac(@equal.sym_conv)
  let t68 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac),
                    t62,
                  ),
                  t63,
                ),
                t64,
              ),
              @tactics.conj_tac,
            ),
            t65,
          ),
          t66,
        ),
        t67,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t61 = @tactics.exists_tac(
    @term_syntax.parse_term("DIV(nsum({(i : Num) | i < (k : Num) && IN(i, (s : (Num) -> Bool))}, (j : Num) => EXP(2, j)) + nsum({(i : Num) | k <= i && IN(i, s)}, (j : Num) => EXP(2, j)), EXP(2, k))"),
  )
  let t60 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t91 = @tactics.then_tac(
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
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.repeat_tac(
                                            @tactics.strip_tac,
                                          ),
                                          t60,
                                        ),
                                        t61,
                                      ),
                                      @tactics.conj_tac,
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
                        t74,
                      ),
                      @tactics.conj_tac,
                    ),
                    t79,
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
      t89,
    ),
    t90,
  )
  binarysum_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ s : (Num) -> Bool, FINITE(s) → DIV(nsum(s, (j : Num) => EXP(2, j)), EXP(2, k)) == nsum(s, (j : Num) => if j < k { 0 } else { EXP(2, j - k) })"),
      t91,
    ),
  )
}

///|
let binarysum_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARYSUM_DIV")

///|
/// `BINARYSUM_DIV`
pub fn binarysum_div() -> @kernel.Thm {
  binarysum_div_c.get()
}

///|
/// BITSET_BINARYSUM
fn step_16() -> Unit raise {
  let t111 = @meson.asm_meson_tac(@list.List([@arith.le_lt()]))
  let t110 = @tactics.repeat_tac(@tactics.strip_tac)
  let t109 = @simp.simp_tac(
    @list.List([@calc_num.arith(), @arith.even_exp(), @arith.sub_eq_0()]),
  )
  let t108 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t107 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_delete(), @sets.in_delete()]),
  )
  let t106 = @tactics.match_mp_tac(even_nsum())
  let t105 = @simp.rewrite_tac(@list.List([@arith.not_odd()]))
  let t103 = @simp.rewrite_tac(
    @list.List([
      @arith.lt_refl(),
      @arith.sub_refl(),
      @calc_num.arith(),
      @arith.odd_add(),
    ]),
  )
  let t102 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @sets.finite_delete(),
      @sets.in_delete(),
    ]),
  )
  let t100 = @drule.match_mp(
    @sets.set_rule(@term_syntax.parse_term("IN((i : _), (s : (_) -> Bool)) → s == INSERT(i, DELETE(s, i))")),
  )
  let t104 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x101 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x97 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s98 = @tactics.subst1_tac(x97)
            fn(
              x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s98(x99)
            }
          })(t100(x101))
        }),
        t102,
      ),
      t103,
    ),
    @tactics.all_tac,
  ])
  let t96 = @simp.asm_rewrite_tac(@list.List([]))
  let t95 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (s : (Num) -> Bool))"))
  let t94 = @simp.asm_simp_tac(@list.List([binarysum_div()]))
  let t93 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t92 = @simp.rewrite_tac(
    @list.List([bitset(), binarysum(), @sets.extension(), @sets.in_elim_thm()]),
  )
  let t112 = @tactics.then_tac(
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
                                @tactics.gen_tac, @tactics.disch_tac,
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
                    t104,
                  ),
                  t105,
                ),
                t106,
              ),
              t107,
            ),
            t108,
          ),
          t109,
        ),
        t110,
      ),
      @class.cond_cases_tac,
    ),
    t111,
  )
  bitset_binarysum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → bitset(binarysum(s)) == s"),
      t112,
    ),
  )
}

///|
let bitset_binarysum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSET_BINARYSUM",
)

///|
/// `BITSET_BINARYSUM`
pub fn bitset_binarysum() -> @kernel.Thm {
  bitset_binarysum_c.get()
}

///|
/// BINARYSUM_BOUND
fn step_17() -> Unit raise {
  let t113 = @simp.rewrite_tac(
    @list.List([binarysum_bound_lemma(), binarysum()]),
  )
  binarysum_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ s : (Num) -> Bool, (∀ i : Num, IN(i, s) → i < k) → binarysum(s) < EXP(2, k)"),
      t113,
    ),
  )
}

///|
let binarysum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINARYSUM_BOUND",
)

///|
/// `BINARYSUM_BOUND`
pub fn binarysum_bound() -> @kernel.Thm {
  binarysum_bound_c.get()
}

///|
/// BITSET_BOUND
fn step_18() -> Unit raise {
  let t118 = @simp.rewrite_tac(@list.List([@arith.lt_exp(), @calc_num.arith()]))
  let t119 = @list.List([
    @meson.asm_meson_tac(@list.List([bitset_bound_lemma(), @arith.let_trans()])),
    t118,
  ])
  let t117 = @tactics.subgoal_then(@term_syntax.parse_term("EXP(2, (i : Num)) < EXP(2, (k : Num))"), fn(
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
    let s115 = @tactics.mp_tac(x114)
    fn(
      x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s115(x116)
    }
  })
  let t120 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t117),
    t119,
  )
  bitset_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ i : Num, ∀ k : Num, n < EXP(2, k) && IN(i, bitset(n)) → i < k"),
      t120,
    ),
  )
}

///|
let bitset_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BITSET_BOUND")

///|
/// `BITSET_BOUND`
pub fn bitset_bound() -> @kernel.Thm {
  bitset_bound_c.get()
}

///|
/// BITSET_BOUND_EQ
fn step_19() -> Unit raise {
  let t121 = @meson.meson_tac(
    @list.List([binarysum_bound(), bitset_bound(), binarysum_bitset()]),
  )
  bitset_bound_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, (n < EXP(2, k)) == (∀ i : Num, IN(i, bitset(n)) → i < k)"),
      t121,
    ),
  )
}

///|
let bitset_bound_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BITSET_BOUND_EQ",
)

///|
/// `BITSET_BOUND_EQ`
pub fn bitset_bound_eq() -> @kernel.Thm {
  bitset_bound_eq_c.get()
}

///|
/// BINARYSUM_BOUND_EQ
fn step_20() -> Unit raise {
  let t122 = @meson.meson_tac(
    @list.List([binarysum_bound(), bitset_bound(), bitset_binarysum()]),
  )
  binarysum_bound_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ k : Num, FINITE(s) → (binarysum(s) < EXP(2, k)) == (∀ i : Num, IN(i, s) → i < k)"),
      t122,
    ),
  )
}

///|
let binarysum_bound_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BINARYSUM_BOUND_EQ",
)

///|
/// `BINARYSUM_BOUND_EQ`
pub fn binarysum_bound_eq() -> @kernel.Thm {
  binarysum_bound_eq_c.get()
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
}
