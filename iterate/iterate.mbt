// Translated from upstream iterate.ml; edit this file directly.

///|
/// iterate.ml:10
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// iterate.ml:16
fn step_2() -> Unit raise {
  @printer.parse_as_infix("..", (15L, "right"))
}

///|
/// numseg
fn step_3() -> Unit raise {
  numseg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_dot_dot : (Num, Num, Num) -> Bool)((m : Num), (n : Num)) == {(x : Num) | m <= x && x <= n}"),
    ),
  )
}

///|
let numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("numseg")

///|
/// `numseg`
pub fn numseg() -> @kernel.Thm {
  numseg_c.get()
}

///|
/// FINITE_NUMSEG
fn step_4() -> Unit raise {
  let t4 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), numseg()]),
  )
  let t3 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_le()]))
  let t2 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Num) | x <= (n : Num)}"))
  let t1 = @tactics.match_mp_tac(@sets.finite_subset())
  let t5 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1),
        t2,
      ),
      t3,
    ),
    t4,
  )
  finite_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, FINITE(op_dot_dot(m, n))"), t5),
  )
}

///|
let finite_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_NUMSEG")

///|
/// `FINITE_NUMSEG`
pub fn finite_numseg() -> @kernel.Thm {
  finite_numseg_c.get()
}

///|
/// NUMSEG_COMBINE_R
fn step_5() -> Unit raise {
  let t6 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_union(),
        numseg(),
        @sets.in_elim_thm(),
      ]),
    ),
    @int.arith_tac,
  )
  numseg_combine_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ p : Num, ∀ n : Num, m <= p + 1 && p <= n → UNION(op_dot_dot(m, p), op_dot_dot(p + 1, n)) == op_dot_dot(m, n)"),
      t6,
    ),
  )
}

///|
let numseg_combine_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMSEG_COMBINE_R",
)

///|
/// `NUMSEG_COMBINE_R`
pub fn numseg_combine_r() -> @kernel.Thm {
  numseg_combine_r_c.get()
}

///|
/// NUMSEG_COMBINE_L
fn step_6() -> Unit raise {
  let t7 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_union(),
        numseg(),
        @sets.in_elim_thm(),
      ]),
    ),
    @int.arith_tac,
  )
  numseg_combine_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ p : Num, ∀ n : Num, m <= p && p <= n + 1 → UNION(op_dot_dot(m, p - 1), op_dot_dot(p, n)) == op_dot_dot(m, n)"),
      t7,
    ),
  )
}

///|
let numseg_combine_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMSEG_COMBINE_L",
)

///|
/// `NUMSEG_COMBINE_L`
pub fn numseg_combine_l() -> @kernel.Thm {
  numseg_combine_l_c.get()
}

///|
/// NUMSEG_LREC
fn step_7() -> Unit raise {
  let t8 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_insert(),
        numseg(),
        @sets.in_elim_thm(),
      ]),
    ),
    @int.arith_tac,
  )
  numseg_lrec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → INSERT(m, op_dot_dot(m + 1, n)) == op_dot_dot(m, n)"),
      t8,
    ),
  )
}

///|
let numseg_lrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_LREC")

///|
/// `NUMSEG_LREC`
pub fn numseg_lrec() -> @kernel.Thm {
  numseg_lrec_c.get()
}

///|
/// NUMSEG_RREC
fn step_8() -> Unit raise {
  let t9 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_insert(),
        numseg(),
        @sets.in_elim_thm(),
      ]),
    ),
    @int.arith_tac,
  )
  numseg_rrec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → INSERT(n, op_dot_dot(m, n - 1)) == op_dot_dot(m, n)"),
      t9,
    ),
  )
}

///|
let numseg_rrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_RREC")

///|
/// `NUMSEG_RREC`
pub fn numseg_rrec() -> @kernel.Thm {
  numseg_rrec_c.get()
}

///|
/// NUMSEG_REC
fn step_9() -> Unit raise {
  let t10 = @simp.simp_tac(
    @list.List([@equal.gsym(numseg_rrec()), @arith.suc_sub1()]),
  )
  numseg_rec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= SUC(n) → op_dot_dot(m, SUC(n)) == INSERT(SUC(n), op_dot_dot(m, n))"),
      t10,
    ),
  )
}

///|
let numseg_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_REC")

///|
/// `NUMSEG_REC`
pub fn numseg_rec() -> @kernel.Thm {
  numseg_rec_c.get()
}

///|
/// IN_NUMSEG
fn step_10() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([numseg(), @sets.in_elim_thm()]))
  in_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, IN(p, op_dot_dot(m, n)) == (m <= p && p <= n)"),
      t11,
    ),
  )
}

///|
let in_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_NUMSEG")

///|
/// `IN_NUMSEG`
pub fn in_numseg() -> @kernel.Thm {
  in_numseg_c.get()
}

///|
/// IN_NUMSEG_0
fn step_11() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([in_numseg(), @arith.le_0()]))
  in_numseg_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, IN(m, op_dot_dot(0, n)) == (m <= n)"), t12),
  )
}

///|
let in_numseg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_NUMSEG_0")

///|
/// `IN_NUMSEG_0`
pub fn in_numseg_0() -> @kernel.Thm {
  in_numseg_0_c.get()
}

///|
/// NUMSEG_SING
fn step_12() -> Unit raise {
  let t13 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_sing(), in_numseg()]),
    ),
    @int.arith_tac,
  )
  numseg_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_dot_dot(n, n) == {n}"), t13))
}

///|
let numseg_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_SING")

///|
/// `NUMSEG_SING`
pub fn numseg_sing() -> @kernel.Thm {
  numseg_sing_c.get()
}

///|
/// NUMSEG_EMPTY
fn step_13() -> Unit raise {
  let t14 = @meson.meson_tac(
    @list.List([@arith.not_le(), @arith.le_trans(), @arith.le_refl()]),
  )
  let t15 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.not_in_empty(), in_numseg()]),
    ),
    t14,
  )
  numseg_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (op_dot_dot(m, n) == {}) == (n < m)"), t15),
  )
}

///|
let numseg_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_EMPTY")

///|
/// `NUMSEG_EMPTY`
pub fn numseg_empty() -> @kernel.Thm {
  numseg_empty_c.get()
}

///|
/// EMPTY_NUMSEG
fn step_14() -> Unit raise {
  let t16 = @simp.rewrite_tac(@list.List([numseg_empty()]))
  empty_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n < m → op_dot_dot(m, n) == {}"), t16),
  )
}

///|
let empty_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EMPTY_NUMSEG")

///|
/// `EMPTY_NUMSEG`
pub fn empty_numseg() -> @kernel.Thm {
  empty_numseg_c.get()
}

///|
/// FINITE_SUBSET_NUMSEG
fn step_15() -> Unit raise {
  let t22 = @meson.meson_tac(
    @list.List([@sets.finite_subset(), finite_numseg()]),
  )
  let t21 = @meson.meson_tac(
    @list.List([@arith.le_cases(), @arith.le_refl(), @arith.le_trans()]),
  )
  let t20 = @simp.rewrite_tac(
    @list.List([@sets.in_insert(), @sets.not_in_empty()]),
  )
  let t19 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t17 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t18 = @tactics.spec_tac(@term_syntax.parse_term("(s : (Num) -> Bool)"), t17)
  let t23 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.subset(), in_numseg(), @arith.le_0()]),
            ),
            t18,
          ),
          t19,
        ),
        t20,
      ),
      t21,
    ),
    t22,
  ])
  let t24 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
    t23,
  )
  finite_subset_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) == (∃ n : Num, SUBSET(s, op_dot_dot(0, n)))"),
      t24,
    ),
  )
}

///|
let finite_subset_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_SUBSET_NUMSEG",
)

///|
/// `FINITE_SUBSET_NUMSEG`
pub fn finite_subset_numseg() -> @kernel.Thm {
  finite_subset_numseg_c.get()
}

///|
/// CARD_NUMSEG_LEMMA
fn step_16() -> Unit raise {
  let t25 = @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)"))
  let t26 = @simp.asm_simp_tac(
    @list.List([
      @arith.add_clauses(),
      numseg_rec(),
      numseg_sing(),
      @sets.finite_rules(),
      @int.arith_rule(@term_syntax.parse_term("(m : Num) <= SUC(m + (d : Num))")),
      @sets.card_clauses(),
      finite_numseg(),
      @sets.not_in_empty(),
      @calc_num.arith(),
      in_numseg(),
      t25,
    ]),
  )
  let t27 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t26,
  )
  card_numseg_lemma_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ d : Num, CARD(op_dot_dot(m, m + d)) == d + 1"), t27),
  )
}

///|
let card_numseg_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_NUMSEG_LEMMA",
)

///|
/// `CARD_NUMSEG_LEMMA`
pub fn card_numseg_lemma() -> @kernel.Thm {
  card_numseg_lemma_c.get()
}

///|
/// CARD_NUMSEG
fn step_17() -> Unit raise {
  let t33 = @tactics.repeat_tac(@tactics.strip_tac)
  let t34 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @arith.le_exists(),
          @theorems.left_imp_exists_thm(),
          card_numseg_lemma(),
        ]),
      ),
      t33,
    ),
    @int.arith_tac,
  )
  let t35 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        numseg_empty(),
        @sets.card_clauses(),
        @int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) → n + 1 - m == 0")),
      ]),
    ),
    t34,
  ])
  let t31 = @int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) || m <= n"))
  let t32 = @tactics.disj_cases_then(fn(
    x28 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s29 = @tactics.mp_tac(x28)
    fn(
      x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s29(x30)
    }
  })(t31)
  let t36 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t32),
    t35,
  )
  card_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, CARD(op_dot_dot(m, n)) == n + 1 - m"), t36),
  )
}

///|
let card_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NUMSEG")

///|
/// `CARD_NUMSEG`
pub fn card_numseg() -> @kernel.Thm {
  card_numseg_c.get()
}

///|
/// HAS_SIZE_NUMSEG
fn step_18() -> Unit raise {
  let t37 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), finite_numseg(), card_numseg()]),
  )
  has_size_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, HAS_SIZE(op_dot_dot(m, n), n + 1 - m)"),
      t37,
    ),
  )
}

///|
let has_size_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_NUMSEG",
)

///|
/// `HAS_SIZE_NUMSEG`
pub fn has_size_numseg() -> @kernel.Thm {
  has_size_numseg_c.get()
}

///|
/// CARD_NUMSEG_1
fn step_19() -> Unit raise {
  let t38 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([card_numseg()])),
    @int.arith_tac,
  )
  card_numseg_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, CARD(op_dot_dot(1, n)) == n"), t38),
  )
}

///|
let card_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NUMSEG_1")

///|
/// `CARD_NUMSEG_1`
pub fn card_numseg_1() -> @kernel.Thm {
  card_numseg_1_c.get()
}

///|
/// HAS_SIZE_NUMSEG_1
fn step_20() -> Unit raise {
  let t39 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([card_numseg(), @sets.has_size(), finite_numseg()]),
    ),
    @int.arith_tac,
  )
  has_size_numseg_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, HAS_SIZE(op_dot_dot(1, n), n)"), t39),
  )
}

///|
let has_size_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_NUMSEG_1",
)

///|
/// `HAS_SIZE_NUMSEG_1`
pub fn has_size_numseg_1() -> @kernel.Thm {
  has_size_numseg_1_c.get()
}

///|
/// NUMSEG_CLAUSES
fn step_21() -> Unit raise {
  let t46 = @tactics.pop_assum(fn(
    x43 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s44 = @tactics.mp_tac(x43)
    fn(
      x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s44(x45)
    }
  })
  let t42 = @simp.rewrite_tac(
    @list.List([in_numseg(), @sets.not_in_empty(), @sets.in_insert()]),
  )
  let t41 = @simp.gen_rewrite_tac(
    fn(
      x40 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x40
    },
    @list.List([@sets.extension()]),
  )
  let t47 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.strip_tac),
            @class.cond_cases_tac,
          ),
          t41,
        ),
        t42,
      ),
      t46,
    ),
    @int.arith_tac,
  )
  numseg_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, op_dot_dot(m, 0) == (if m == 0 { {0} } else { {} })) && (∀ m : Num, ∀ n : Num, op_dot_dot(m, SUC(n)) == (if m <= SUC(n) { INSERT(SUC(n), op_dot_dot(m, n)) } else { op_dot_dot(m, n) }))"),
      t47,
    ),
  )
}

///|
let numseg_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_CLAUSES")

///|
/// `NUMSEG_CLAUSES`
pub fn numseg_clauses() -> @kernel.Thm {
  numseg_clauses_c.get()
}

///|
/// FINITE_INDEX_NUMSEG
fn step_22() -> Unit raise {
  let t53 = @sets.set_tac(@list.List([]))
  let t52 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t51 = @simp.asm_rewrite_tac(
    @list.List([finite_numseg(), card_numseg_1()]),
  )
  let t49 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t50 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("op_dot_dot(1, CARD((s : (A) -> Bool)))"), t49]),
      @sets.card_eq_bijections(),
    ),
  )
  let t48 = @list.List([
    @tactics.disch_tac,
    @meson.meson_tac(@list.List([@sets.finite_image(), finite_numseg()])),
  ])
  let t54 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t48,
          ),
          t50,
        ),
        t51,
      ),
      t52,
    ),
    t53,
  )
  finite_index_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) == (∃ f : (Num) -> A, (∀ i : Num, ∀ j : Num, IN(i, op_dot_dot(1, CARD(s))) && IN(j, op_dot_dot(1, CARD(s))) && f(i) == f(j) → i == j) && s == IMAGE(f, op_dot_dot(1, CARD(s))))"),
      t54,
    ),
  )
}

///|
let finite_index_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_NUMSEG",
)

///|
/// `FINITE_INDEX_NUMSEG`
pub fn finite_index_numseg() -> @kernel.Thm {
  finite_index_numseg_c.get()
}

///|
/// FINITE_INDEX_NUMBERS
fn step_23() -> Unit raise {
  let t55 = @meson.meson_tac(
    @list.List([finite_index_numseg(), finite_numseg(), @sets.finite_image()]),
  )
  finite_index_numbers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) == (∃ k : (Num) -> Bool, ∃ f : (Num) -> A, (∀ i : Num, ∀ j : Num, IN(i, k) && IN(j, k) && f(i) == f(j) → i == j) && FINITE(k) && s == IMAGE(f, k))"),
      t55,
    ),
  )
}

///|
let finite_index_numbers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_NUMBERS",
)

///|
/// `FINITE_INDEX_NUMBERS`
pub fn finite_index_numbers() -> @kernel.Thm {
  finite_index_numbers_c.get()
}

///|
/// INTER_NUMSEG
fn step_24() -> Unit raise {
  let t56 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_inter(), in_numseg()]),
    ),
    @int.arith_tac,
  )
  inter_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, INTER(op_dot_dot(m, n), op_dot_dot(p, q)) == op_dot_dot(MAX(m, p), MIN(n, q))"),
      t56,
    ),
  )
}

///|
let inter_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTER_NUMSEG")

///|
/// `INTER_NUMSEG`
pub fn inter_numseg() -> @kernel.Thm {
  inter_numseg_c.get()
}

///|
/// DISJOINT_NUMSEG
fn step_25() -> Unit raise {
  let t57 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.disjoint(), numseg_empty(), inter_numseg()]),
    ),
    @int.arith_tac,
  )
  disjoint_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, DISJOINT(op_dot_dot(m, n), op_dot_dot(p, q)) == (n < p || q < m || n < m || q < p)"),
      t57,
    ),
  )
}

///|
let disjoint_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DISJOINT_NUMSEG",
)

///|
/// `DISJOINT_NUMSEG`
pub fn disjoint_numseg() -> @kernel.Thm {
  disjoint_numseg_c.get()
}

///|
/// NUMSEG_ADD_SPLIT
fn step_26() -> Unit raise {
  let t58 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_union(), in_numseg()]),
    ),
    @int.arith_tac,
  )
  numseg_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → op_dot_dot(m, n + p) == UNION(op_dot_dot(m, n), op_dot_dot(n + 1, n + p))"),
      t58,
    ),
  )
}

///|
let numseg_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMSEG_ADD_SPLIT",
)

///|
/// `NUMSEG_ADD_SPLIT`
pub fn numseg_add_split() -> @kernel.Thm {
  numseg_add_split_c.get()
}

///|
/// NUMSEG_OFFSET_IMAGE
fn step_27() -> Unit raise {
  let t63 = @list.List([
    @tactics.disch_then(fn(
      x60 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x60
      let t62 = @tactics.mp_tac(th)
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(x : Num) - (p : Num)")),
        t62,
      )
    }),
    @tactics.all_tac,
  ])
  let t59 = @tactics.repeat_tac(@tactics.gen_tac)
  let t64 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@sets.extension(), @sets.in_image(), in_numseg()]),
          ),
          t59,
        ),
        @tactics.eq_tac,
      ),
      t63,
    ),
    @int.arith_tac,
  )
  numseg_offset_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, op_dot_dot(m + p, n + p) == IMAGE((i : Num) => i + p, op_dot_dot(m, n))"),
      t64,
    ),
  )
}

///|
let numseg_offset_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMSEG_OFFSET_IMAGE",
)

///|
/// `NUMSEG_OFFSET_IMAGE`
pub fn numseg_offset_image() -> @kernel.Thm {
  numseg_offset_image_c.get()
}

///|
/// SUBSET_NUMSEG
fn step_28() -> Unit raise {
  let t66 = @list.List([
    @meson.meson_tac(
      @list.List([@arith.le_trans(), @arith.not_le(), @arith.le_refl()]),
    ),
    @int.arith_tac,
  ])
  let t65 = @simp.rewrite_tac(@list.List([@sets.subset(), in_numseg()]))
  let t67 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t65),
      @tactics.eq_tac,
    ),
    t66,
  )
  subset_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, SUBSET(op_dot_dot(m, n), op_dot_dot(p, q)) == (n < m || p <= m && n <= q)"),
      t67,
    ),
  )
}

///|
let subset_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_NUMSEG")

///|
/// `SUBSET_NUMSEG`
pub fn subset_numseg() -> @kernel.Thm {
  subset_numseg_c.get()
}

///|
/// NUMSEG_LE
fn step_29() -> Unit raise {
  let t68 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), in_numseg(), @sets.in_elim_thm()]),
    ),
    @int.arith_tac,
  )
  numseg_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, {(x : Num) | x <= n} == op_dot_dot(0, n)"), t68),
  )
}

///|
let numseg_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_LE")

///|
/// `NUMSEG_LE`
pub fn numseg_le() -> @kernel.Thm {
  numseg_le_c.get()
}

///|
/// NUMSEG_LT
fn step_30() -> Unit raise {
  let t69 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      in_numseg(),
      @sets.in_elim_thm(),
      @sets.not_in_empty(),
    ]),
  )
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
      t69,
    ),
    @int.asm_arith_tac,
  )
  numseg_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, {(x : Num) | x < n} == (if n == 0 { {} } else { op_dot_dot(0, n - 1) })"),
      t70,
    ),
  )
}

///|
let numseg_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_LT")

///|
/// `NUMSEG_LT`
pub fn numseg_lt() -> @kernel.Thm {
  numseg_lt_c.get()
}

///|
/// NUMSEG_CONV
fn step_31() -> Unit raise {
  let pth_0 = @meson.meson(
    @list.List([numseg_empty()]),
    @term_syntax.parse_term("(n : Num) < (m : Num) → op_dot_dot(m, n) == {}"),
  )
  let pth_1 = @meson.meson(
    @list.List([numseg_sing()]),
    @term_syntax.parse_term("op_dot_dot((m : Num), m) == {m}"),
  )
  let pth_2 = @meson.meson(
    @list.List([numseg_lrec(), @arith.add1()]),
    @term_syntax.parse_term("(m : Num) <= (n : Num) → op_dot_dot(m, n) == INSERT(m, op_dot_dot(SUC(m), n))"),
  )
  let ns_tm = @term_syntax.parse_term("op_dot_dot")
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  fn numseg_conv_1(x71 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x71
    let (nstm, nt) = @kernel.dest_comb(tm)
    let (nst, mt) = @kernel.dest_comb(nstm)
    if nst != ns_tm {
      raise Failure("NUMSEG_CONV")
    } else {
      let m = @basics.dest_numeral(mt)
      let n = @basics.dest_numeral(nt)
      if @num.lt_num(n, m) {
        @drule.mp_conv(
          @calc_num.num_lt_conv,
          @kernel.inst_rule(@list.List([(mt, m_tm), (nt, n_tm)]), pth_0),
        )
      } else if @num.eq_num(n, m) {
        @kernel.inst_rule(@list.List([(mt, m_tm)]), pth_1)
      } else {
        let th = @drule.mp_conv(
          @calc_num.num_le_conv,
          @kernel.inst_rule(@list.List([(mt, m_tm), (nt, n_tm)]), pth_2),
        )
        @equal.conv_rule(
          @lib.funpow(
            2,
            fn(
              x72 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s73 = @equal.rand_conv(x72)
              fn(x74 : @kernel.Term) -> @kernel.Thm raise { s73(x74) }
            },
            @equal.thenc(
              @equal.land_conv(@calc_num.num_suc_conv),
              numseg_conv_1,
            ),
          ),
          th,
        )
      }
    }
  }
  numseg_conv_c.set(numseg_conv_1)
}

///|
let numseg_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUMSEG_CONV")

///|
/// `NUMSEG_CONV`
pub fn numseg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  numseg_conv_c.get()(x)
}

///|
/// TOPOLOGICAL_SORT
fn step_32() -> Unit raise {
  let t165 = @simp.asm_rewrite_tac(@list.List([]))
  let t166 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @tactics.first_x_assum(@tactics.match_mp_tac),
      ),
      t165,
    ),
    @int.asm_arith_tac,
  )
  let t164 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t167 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @tactics.first_x_assum(@tactics.match_mp_tac),
      ),
      t164,
    ),
    @int.arith_tac,
    t166,
  ])
  let t163 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t161 = @term_syntax.parse_term("(k : Num) == 1")
  let t162 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(j : Num) == 1"), t161]),
  )
  let t160 = @term_syntax.parse_term("(k : Num)")
  let t168 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          @tactics.x_gen_tac,
          @list.List([@term_syntax.parse_term("(j : Num)"), t160]),
        ),
        t162,
      ),
      t163,
    ),
    t167,
  )
  let t159 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("1 <= (x : Num) → 1 < x + 1 && !(x + 1 == 1)"),
      ),
      @arith.add_sub(),
    ]),
  )
  let t158 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) + 1"))
  let t155 = @term_syntax.parse_term("(i : Num)")
  let t157 = @tactics.disch_then((x156 : @kernel.Thm) => {
    @tactics.x_choose_tac(t155, x156)
  })
  let t154 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t153 = @simp.asm_rewrite_tac(@list.List([@sets.in_image(), in_numseg()]))
  let t152 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t151 = @tactics.first_assum(fn(
    x149 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x149
    @simp.once_rewrite_tac(
      @list.List([
        @drule.match_mp(
          @sets.set_rule(
            @term_syntax.parse_term("!((b : _) == (a : _)) → IN(b, (s : (_) -> Bool)) == IN(b, DELETE(s, a))"),
          ),
        )(th_1),
      ]),
    )
  })
  let t148 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t147 = @class.asm_cases_tac(@term_syntax.parse_term("(b : A) == (a : A)"))
  let t169 = @list.List([
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
                        @tactics.x_gen_tac(@term_syntax.parse_term("(b : A)")),
                        t147,
                      ),
                      t148,
                    ),
                    t151,
                  ),
                  t152,
                ),
                t153,
              ),
              @tactics.eq_tac,
            ),
            t154,
          ),
          t157,
        ),
        t158,
      ),
      t159,
    ),
    t168,
  ])
  let t146 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([in_numseg()])),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t145 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, IN(i, op_dot_dot(1, SUC((n : Num)))) == (i == 1 || 1 < i && IN(i - 1, op_dot_dot(1, n)))"),
    fn(
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
      let th = x143
      @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), th]))
    },
  )
  let t142 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) → !(SUC(k) == 1)")),
      @arith.suc_sub1(),
    ]),
  )
  let t141 = @tactics.exists_tac(
    @term_syntax.parse_term("(k : Num) => if k == 1 { (a : A) } else { (f : (Num) -> A)(k - 1) }"),
  )
  let t140 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t139 = @simp.asm_simp_tac(@list.List([]))
  let t135 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (a : A))")
  let t138 = @tactics.first_x_assum(fn(
    x137 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x132 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s133 = @tactics.mp_tac(x132)
      fn(
        x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s133(x134)
      }
    })(((x136 : @kernel.Thm) => @bool.spec(t135, x136))(x137))
  })
  let t131 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(fn(
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
    }),
  )
  let t127 = @simp.asm_rewrite_tac(@list.List([@sets.has_size_suc()]))
  let t122 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t123 = @list.List([@term_syntax.parse_term("SUC((n : Num))"), t122])
  let t126 = @tactics.first_x_assum(fn(
    x125 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x119 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s120 = @tactics.mp_tac(x119)
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
        s120(x121)
      }
    })(((x124 : @kernel.Thm) => @bool.specl(t123, x124))(x125))
  })
  let t118 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t117 = @simp.rewrite_tac(@list.List([@sets.has_size_suc()]))
  let t116 = @list.List([
    @simp.simp_tac(
      @list.List([
        @sets.has_size_0(),
        numseg_clauses(),
        @calc_num.arith(),
        @sets.image_clauses(),
        @sets.not_in_empty(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t114 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t112 = @tactics.exists_tac(@term_syntax.parse_term("(b : A)"))
  let t113 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(a : A)")), t112])
  let t111 = @class.asm_cases_tac(@term_syntax.parse_term("(op_lt_lt : (A, A) -> Bool)((a : A), (b : A))"))
  let t110 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac),
  )
  let t108 = @sets.set_tac(@list.List([]))
  let t109 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : A)")), t108),
    @tactics.all_tac,
  ])
  let t107 = @simp.asm_rewrite_tac(@list.List([]))
  let t106 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {(a : A)}"))
  let t105 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) → (DELETE(s, a) == {}) == (s == {a})"),
      ),
    ]),
  )
  let t101 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (a : A))")
  let t104 = @tactics.first_x_assum(fn(
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
    (fn(
      x98 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s99 = @tactics.mp_tac(x98)
      fn(
        x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s99(x100)
      }
    })(((x102 : @kernel.Thm) => @bool.spec(t101, x102))(x103))
  })
  let t97 = @simp.asm_rewrite_tac(@list.List([]))
  let t93 = @term_syntax.parse_term("(a : A)")
  let t96 = @tactics.first_x_assum(fn(
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
    })(((x94 : @kernel.Thm) => @bool.spec(t93, x94))(x95))
  })
  let t87 = @term_syntax.parse_term("(a : A)")
  let t89 = @tactics.disch_then((x88 : @kernel.Thm) => {
    @tactics.x_choose_tac(t87, x88)
  })
  let t84 = @simp.gen_rewrite_rule(
    fn(
      x83 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x83
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t86 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s81 = @tactics.mp_tac(x80)
      fn(
        x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s81(x82)
      }
    })(t84(x85))
  })
  let t79 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t115 = @list.List([
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @nums.induct_tac,
                                      @simp.rewrite_tac(
                                        @list.List([
                                          @sets.has_size_0(),
                                          @sets.has_size_suc(),
                                          @class.taut(
                                            @term_syntax.parse_term("!((a : Bool) && !a)"),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    t79,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t86,
                              ),
                              t89,
                            ),
                            t96,
                          ),
                          t97,
                        ),
                        @tactics.disch_tac,
                      ),
                      t104,
                    ),
                    t105,
                  ),
                  t106,
                ),
                t107,
              ),
              t109,
            ),
            t110,
          ),
          t111,
        ),
        t113,
      ),
      t114,
    ),
    @tactics.all_tac,
  ])
  let t78 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∀ s : (A) -> Bool, HAS_SIZE(s, n) && !(s == {}) → (∃ a : A, IN(a, s) && (∀ b : A, IN(b, DELETE(s, a)) → !(op_lt_lt : (A, A) -> Bool)(b, a)))"),
    fn(
      x75 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s76 = @tactics.assume_tac(x75)
      fn(
        x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s76(x77)
      }
    },
  )
  let t170 = @tactics.thenl(
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
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.gen_tac, @tactics.disch_tac,
                                          ),
                                          t78,
                                        ),
                                        t115,
                                      ),
                                      @nums.induct_tac,
                                    ),
                                    t116,
                                  ),
                                  t117,
                                ),
                                t118,
                              ),
                              @tactics.strip_tac,
                            ),
                            t126,
                          ),
                          t127,
                        ),
                        t131,
                      ),
                      @tactics.strip_tac,
                    ),
                    t138,
                  ),
                  t139,
                ),
                t140,
              ),
              t141,
            ),
            t142,
          ),
          t145,
        ),
        t146,
      ),
      @tactics.conj_tac,
    ),
    t169,
  )
  topological_sort_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, (∀ x : A, ∀ y : A, `<<`(x, y) && `<<`(y, x) → x == y) && (∀ x : A, ∀ y : A, ∀ z : A, `<<`(x, y) && `<<`(y, z) → `<<`(x, z)) → (∀ n : Num, ∀ s : (A) -> Bool, HAS_SIZE(s, n) → (∃ f : (Num) -> A, s == IMAGE(f, op_dot_dot(1, n)) && (∀ j : Num, ∀ k : Num, IN(j, op_dot_dot(1, n)) && IN(k, op_dot_dot(1, n)) && j < k → !`<<`(f(k), f(j)))))"),
      t170,
    ),
  )
}

///|
let topological_sort_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TOPOLOGICAL_SORT",
)

///|
/// `TOPOLOGICAL_SORT`
pub fn topological_sort() -> @kernel.Thm {
  topological_sort_c.get()
}

///|
/// FINITE_INT_SEG
fn step_33() -> Unit raise {
  let t188 = @simp.asm_simp_tac(
    @list.List([@int.int_of_num_of_int(), @int.int_sub_le()]),
  )
  let t187 = @tactics.exists_tac(@term_syntax.parse_term("num_of_int((x : Int) - (l : Int))"))
  let t186 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Int)"))
  let t185 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_le()), in_numseg()]),
  )
  let t184 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()]),
  )
  let t183 = @simp.asm_simp_tac(
    @list.List([@sets.finite_image(), finite_numseg()]),
  )
  let t182 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((n : Num) => (l : Int) + int_of_num(n), op_dot_dot(0, num_of_int((r : Int) - l)))"),
  )
  let t181 = @tactics.match_mp_tac(@sets.finite_subset())
  let t180 = @simp.asm_simp_tac(
    @list.List([@sets.empty_gspec(), @sets.finite_empty()]),
  )
  let t179 = @simp.asm_simp_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("!(int_of_num(0) <= (r : Int) - (l : Int)) → !(l <= (x : Int) && x <= r)"),
      ),
    ]),
  )
  let t178 = @class.asm_cases_tac(@term_syntax.parse_term("int_of_num(0) <= (r : Int) - (l : Int)"))
  let t189 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                            t178,
                          ),
                          t179,
                        ),
                        t180,
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
          ),
          @tactics.strip_tac,
        ),
        t187,
      ),
      t188,
    ),
    @int.asm_int_arith_tac,
  )
  let t177 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t176 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.finite_subset(),
    ),
  )
  let t175 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t174 = @tactics.pop_assum(fn(
    x171 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s172 = @tactics.mp_tac(x171)
    fn(
      x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s172(x173)
    }
  })
  let t190 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_tac,
                @tactics.repeat_tac(@tactics.conj_tac),
              ),
              t174,
            ),
            t175,
          ),
          t176,
        ),
        t177,
      ),
      @int.int_arith_tac,
    ),
    t189,
  ])
  let t191 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")),
      ),
      @tactics.conj_tac,
    ),
    t190,
  )
  finite_int_seg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ l : Int, ∀ r : Int, FINITE({(x : Int) | l <= x && x <= r})) && (∀ l : Int, ∀ r : Int, FINITE({(x : Int) | l <= x && x < r})) && (∀ l : Int, ∀ r : Int, FINITE({(x : Int) | l < x && x <= r})) && (∀ l : Int, ∀ r : Int, FINITE({(x : Int) | l < x && x < r}))"),
      t191,
    ),
  )
}

///|
let finite_int_seg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INT_SEG")

///|
/// `FINITE_INT_SEG`
pub fn finite_int_seg() -> @kernel.Thm {
  finite_int_seg_c.get()
}

///|
/// neutral
fn step_34() -> Unit raise {
  neutral_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(neutral : ((A, A) -> A) -> A)((op : (A, A) -> A)) == select((x : A) => ∀ y : A, op(x, y) == y && op(y, x) == y)"),
    ),
  )
}

///|
let neutral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("neutral")

///|
/// `neutral`
pub fn neutral() -> @kernel.Thm {
  neutral_c.get()
}

///|
/// monoidal
fn step_35() -> Unit raise {
  monoidal_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(monoidal : ((A, A) -> A) -> Bool)((op : (A, A) -> A)) == ((∀ x : A, ∀ y : A, op(x, y) == op(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, op(x, op(y, z)) == op(op(x, y), z)) && (∀ x : A, op(neutral(op), x) == x))"),
    ),
  )
}

///|
let monoidal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("monoidal")

///|
/// `monoidal`
pub fn monoidal() -> @kernel.Thm {
  monoidal_c.get()
}

///|
/// MONOIDAL_AC
fn step_36() -> Unit raise {
  let t192 = @meson.meson_tac(@list.List([]))
  let t193 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal()])),
    t192,
  )
  monoidal_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → (∀ a : A, op(neutral(op), a) == a) && (∀ a : A, op(a, neutral(op)) == a) && (∀ a : A, ∀ b : A, op(a, b) == op(b, a)) && (∀ a : A, ∀ b : A, ∀ c : A, op(op(a, b), c) == op(a, op(b, c))) && (∀ a : A, ∀ b : A, ∀ c : A, op(a, op(b, c)) == op(b, op(a, c)))"),
      t193,
    ),
  )
}

///|
let monoidal_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_AC")

///|
/// `MONOIDAL_AC`
pub fn monoidal_ac() -> @kernel.Thm {
  monoidal_ac_c.get()
}

///|
/// support
fn step_37() -> Unit raise {
  support_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(support : ((B, B) -> B, (A) -> B, (A) -> Bool, A) -> Bool)((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool)) == {(x : A) | IN(x, s) && !(f(x) == neutral(op))}"),
    ),
  )
}

///|
let support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("support")

///|
/// `support`
pub fn support() -> @kernel.Thm {
  support_c.get()
}

///|
/// iterate
fn step_38() -> Unit raise {
  iterate_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(iterate : ((B, B) -> B, (A) -> Bool, (A) -> B) -> B)((op : (B, B) -> B), (s : (A) -> Bool), (f : (A) -> B)) == (if FINITE(support(op, f, s)) { ITSET((x : A) => (a : B) => op(f(x), a), support(op, f, s), neutral(op)) } else { neutral(op) })"),
    ),
  )
}

///|
let iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iterate")

///|
/// `iterate`
pub fn iterate() -> @kernel.Thm {
  iterate_c.get()
}

///|
/// IN_SUPPORT
fn step_39() -> Unit raise {
  let t194 = @simp.rewrite_tac(@list.List([support(), @sets.in_elim_thm()]))
  in_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ x : A, ∀ s : (A) -> Bool, IN(x, support(op, f, s)) == (IN(x, s) && !(f(x) == neutral(op)))"),
      t194,
    ),
  )
}

///|
let in_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SUPPORT")

///|
/// `IN_SUPPORT`
pub fn in_support() -> @kernel.Thm {
  in_support_c.get()
}

///|
/// SUPPORT_SUPPORT
fn step_40() -> Unit raise {
  let t195 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t196 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([support(), @sets.in_elim_thm(), @sets.extension()]),
    ),
    t195,
  )
  support_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, support(op, f, support(op, f, s)) == support(op, f, s)"),
      t196,
    ),
  )
}

///|
let support_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPPORT_SUPPORT",
)

///|
/// `SUPPORT_SUPPORT`
pub fn support_support() -> @kernel.Thm {
  support_support_c.get()
}

///|
/// SUPPORT_EMPTY
fn step_41() -> Unit raise {
  let t197 = @meson.meson_tac(@list.List([]))
  let t198 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        in_support(),
        @sets.extension(),
        @sets.in_elim_thm(),
        @sets.not_in_empty(),
      ]),
    ),
    t197,
  )
  support_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == neutral(op)) == (support(op, f, s) == {})"),
      t198,
    ),
  )
}

///|
let support_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_EMPTY")

///|
/// `SUPPORT_EMPTY`
pub fn support_empty() -> @kernel.Thm {
  support_empty_c.get()
}

///|
/// SUPPORT_SUBSET
fn step_42() -> Unit raise {
  let t199 = @simp.simp_tac(@list.List([@sets.subset(), in_support()]))
  support_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, SUBSET(support(op, f, s), s)"),
      t199,
    ),
  )
}

///|
let support_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_SUBSET")

///|
/// `SUPPORT_SUBSET`
pub fn support_subset() -> @kernel.Thm {
  support_subset_c.get()
}

///|
/// FINITE_SUPPORT
fn step_43() -> Unit raise {
  let t200 = @meson.meson_tac(
    @list.List([support_subset(), @sets.finite_subset()]),
  )
  finite_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) → FINITE(support(op, f, s))"),
      t200,
    ),
  )
}

///|
let finite_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT")

///|
/// `FINITE_SUPPORT`
pub fn finite_support() -> @kernel.Thm {
  finite_support_c.get()
}

///|
/// SUPPORT_CLAUSES
fn step_44() -> Unit raise {
  let t203 = @meson.asm_meson_tac(@list.List([]))
  let t202 = @tactics.try_tac(@class.cond_cases_tac)
  let t201 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            support(),
            @sets.extension(),
            @sets.in_elim_thm(),
            @sets.in_insert(),
            @sets.in_delete(),
            @trivia.o_thm(),
            @sets.in_image(),
            @sets.not_in_empty(),
            @sets.in_union(),
            @sets.in_inter(),
            @sets.in_diff(),
            @class.cond_rand(),
          ]),
        ),
        t201,
      ),
      t202,
    ),
    t203,
  )
  support_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> C, support((op : (C, C) -> C), f, {}) == {}) && (∀ f : (A) -> C, ∀ x : A, ∀ s : (A) -> Bool, support(op, f, INSERT(x, s)) == (if f(x) == neutral(op) { support(op, f, s) } else { INSERT(x, support(op, f, s)) })) && (∀ f : (A) -> C, ∀ x : A, ∀ s : (A) -> Bool, support(op, f, DELETE(s, x)) == DELETE(support(op, f, s), x)) && (∀ f : (A) -> C, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, support(op, f, UNION(s, t)) == UNION(support(op, f, s), support(op, f, t))) && (∀ f : (A) -> C, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, support(op, f, INTER(s, t)) == INTER(support(op, f, s), support(op, f, t))) && (∀ f : (A) -> C, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, support(op, f, DIFF(s, t)) == DIFF(support(op, f, s), support(op, f, t))) && (∀ f : (A) -> B, ∀ g : (B) -> C, ∀ s : (A) -> Bool, support(op, g, IMAGE(f, s)) == IMAGE(f, support(op, o(g, f), s)))"),
      t204,
    ),
  )
}

///|
let support_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPPORT_CLAUSES",
)

///|
/// `SUPPORT_CLAUSES`
pub fn support_clauses() -> @kernel.Thm {
  support_clauses_c.get()
}

///|
/// SUPPORT_DELTA
fn step_45() -> Unit raise {
  let t207 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.not_in_empty()]),
  )
  let t206 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t205 = @tactics.repeat_tac(@tactics.gen_tac)
  let t208 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @sets.extension(),
            support(),
            @sets.in_elim_thm(),
            @sets.in_sing(),
          ]),
        ),
        t205,
      ),
      t206,
    ),
    t207,
  )
  support_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ s : (A) -> Bool, ∀ f : (A) -> B, ∀ a : A, support(op, (x : A) => if x == a { f(x) } else { neutral(op) }, s) == (if IN(a, s) { support(op, f, {a}) } else { {} })"),
      t208,
    ),
  )
}

///|
let support_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_DELTA")

///|
/// `SUPPORT_DELTA`
pub fn support_delta() -> @kernel.Thm {
  support_delta_c.get()
}

///|
/// FINITE_SUPPORT_DELTA
fn step_46() -> Unit raise {
  let t210 = @simp.simp_tac(
    @list.List([@sets.finite_rules(), finite_support()]),
  )
  let t209 = @tactics.repeat_tac(@tactics.gen_tac)
  let t211 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([support_delta()])), t209),
      @class.cond_cases_tac,
    ),
    t210,
  )
  finite_support_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ a : A, FINITE(support(op, (x : A) => if x == a { f(x) } else { neutral(op) }, (s : (A) -> Bool)))"),
      t211,
    ),
  )
}

///|
let finite_support_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_SUPPORT_DELTA",
)

///|
/// `FINITE_SUPPORT_DELTA`
pub fn finite_support_delta() -> @kernel.Thm {
  finite_support_delta_c.get()
}

///|
/// ITERATE_SUPPORT
fn step_47() -> Unit raise {
  let t212 = @simp.simp_tac(@list.List([iterate(), support_support()]))
  iterate_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, iterate(op, support(op, f, s), f) == iterate(op, s, f)"),
      t212,
    ),
  )
}

///|
let iterate_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_SUPPORT",
)

///|
/// `ITERATE_SUPPORT`
pub fn iterate_support() -> @kernel.Thm {
  iterate_support_c.get()
}

///|
/// ITERATE_EXPAND_CASES
fn step_48() -> Unit raise {
  let t213 = @simp.simp_tac(@list.List([iterate(), support_support()]))
  iterate_expand_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, ∀ f : (A) -> B, ∀ s : (A) -> Bool, iterate(op, s, f) == (if FINITE(support(op, f, s)) { iterate(op, support(op, f, s), f) } else { neutral(op) })"),
      t213,
    ),
  )
}

///|
let iterate_expand_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_EXPAND_CASES",
)

///|
/// `ITERATE_EXPAND_CASES`
pub fn iterate_expand_cases() -> @kernel.Thm {
  iterate_expand_cases_c.get()
}

///|
/// ITERATE_CLAUSES_GEN
fn step_49() -> Unit raise {
  let t235 = @meson.asm_meson_tac(@list.List([monoidal()]))
  let t234 = @simp.asm_simp_tac(@list.List([in_support()]))
  let t233 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (A) -> B)((x : A)) == neutral((op : (B, B) -> B))"))
  let t232 = @simp.asm_rewrite_tac(
    @list.List([support_clauses(), @sets.finite_insert(), @class.cond_id()]),
  )
  let t231 = @simp.gen_rewrite_tac(
    fn(
      x230 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x226 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x220 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s221 = @equal.land_conv(x220)
          fn(x222 : @kernel.Term) -> @kernel.Thm raise { s221(x222) }
        })(
          (fn(
            x223 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s224 = @equal.rator_conv(x223)
            fn(x225 : @kernel.Term) -> @kernel.Thm raise { s224(x225) }
          })(x226),
        )
      })(
        (fn(
          x227 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s228 = @equal.land_conv(x227)
          fn(x229 : @kernel.Term) -> @kernel.Thm raise { s228(x229) }
        })(x230),
      )
    },
    @list.List([@class.cond_rand()]),
  )
  let t219 = @simp.asm_rewrite_tac(
    @list.List([iterate(), support_clauses(), @sets.finite_rules()]),
  )
  let t218 = @tactics.repeat_tac(@tactics.strip_tac)
  let t217 = @list.List([
    @meson.asm_meson_tac(@list.List([monoidal()])),
    @tactics.all_tac,
  ])
  let t215 = @term_syntax.parse_term("neutral((op : (B, B) -> B))")
  let t216 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : A) => (a : B) => (op : (B, B) -> B)((f : (A) -> B)(x), a)"),
        t215,
      ]),
      @sets.finite_recursion(),
    ),
  )
  let t214 = @simp.once_rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t236 = @tactics.then_tac(
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
                              @tactics.gen_tac, @tactics.strip_tac,
                            ),
                            t214,
                          ),
                          @tactics.gen_tac,
                        ),
                        t216,
                      ),
                      @tactics.ants_tac,
                    ),
                    t217,
                  ),
                  t218,
                ),
                t219,
              ),
              t231,
            ),
            t232,
          ),
          t233,
        ),
        t234,
      ),
      @class.cond_cases_tac,
    ),
    t235,
  )
  iterate_clauses_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, iterate(op, {}, f) == neutral(op)) && (∀ f : (A) -> B, ∀ x : A, ∀ s : (A) -> Bool, FINITE(support(op, f, s)) → iterate(op, INSERT(x, s), f) == (if IN(x, s) { iterate(op, s, f) } else { op(f(x), iterate(op, s, f)) }))"),
      t236,
    ),
  )
}

///|
let iterate_clauses_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLAUSES_GEN",
)

///|
/// `ITERATE_CLAUSES_GEN`
pub fn iterate_clauses_gen() -> @kernel.Thm {
  iterate_clauses_gen_c.get()
}

///|
/// ITERATE_CLAUSES
fn step_50() -> Unit raise {
  let t237 = @simp.simp_tac(
    @list.List([iterate_clauses_gen(), finite_support()]),
  )
  iterate_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ f : (A) -> C, iterate(op, {}, f) == neutral(op)) && (∀ f : (B) -> C, ∀ x : B, ∀ s : (B) -> Bool, FINITE(s) → iterate(op, INSERT(x, s), f) == (if IN(x, s) { iterate(op, s, f) } else { op(f(x), iterate(op, s, f)) }))"),
      t237,
    ),
  )
}

///|
let iterate_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLAUSES",
)

///|
/// `ITERATE_CLAUSES`
pub fn iterate_clauses() -> @kernel.Thm {
  iterate_clauses_c.get()
}

///|
/// ITERATE_UNION
fn step_51() -> Unit raise {
  let t238 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("UNION((s : (_) -> Bool), INSERT((x : _), (t : (_) -> Bool))) == INSERT(x, UNION(s, t)) && DISJOINT(s, INSERT(x, t)) == (!IN(x, s) && DISJOINT(s, t))"),
    t238,
  )
  let t243 = @meson.asm_meson_tac(@list.List([monoidal()]))
  let t242 = @simp.asm_simp_tac(
    @list.List([
      iterate_clauses(),
      @sets.in_union(),
      @sets.union_empty(),
      @calc_int.real_add_rid(),
      lemma,
      @sets.finite_union(),
    ]),
  )
  let t241 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t240 = @tactics.repeat_tac(@tactics.disch_tac)
  let t239 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
  )
  let t244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                @tactics.gen_tac,
              ),
              @tactics.gen_tac,
            ),
            t239,
          ),
          t240,
        ),
        t241,
      ),
      t242,
    ),
    t243,
  )
  iterate_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))"),
      t244,
    ),
  )
}

///|
let iterate_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_UNION")

///|
/// `ITERATE_UNION`
pub fn iterate_union() -> @kernel.Thm {
  iterate_union_c.get()
}

///|
/// ITERATE_UNION_GEN
fn step_52() -> Unit raise {
  let t245 = @simp.simp_tac(@list.List([support_clauses(), iterate_union()]))
  let t246 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@equal.gsym(iterate_support())])),
    t245,
  )
  iterate_union_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(support(op, f, s)) && FINITE(support(op, f, t)) && DISJOINT(support(op, f, s), support(op, f, t)) → iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))"),
      t246,
    ),
  )
}

///|
let iterate_union_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_UNION_GEN",
)

///|
/// `ITERATE_UNION_GEN`
pub fn iterate_union_gen() -> @kernel.Thm {
  iterate_union_gen_c.get()
}

///|
/// ITERATE_DIFF
fn step_53() -> Unit raise {
  let t247 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) → s == UNION(DIFF(s, t), t) && DISJOINT(DIFF(s, t), t)"),
    t247,
  )
  let t248 = @meson.meson_tac(
    @list.List([
      lemma,
      iterate_union(),
      @sets.finite_union(),
      @sets.finite_subset(),
      @sets.subset_diff(),
    ]),
  )
  iterate_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) → op(iterate(op, DIFF(s, t), f), iterate(op, t, f)) == iterate(op, s, f))"),
      t248,
    ),
  )
}

///|
let iterate_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_DIFF")

///|
/// `ITERATE_DIFF`
pub fn iterate_diff() -> @kernel.Thm {
  iterate_diff_c.get()
}

///|
/// ITERATE_DIFF_GEN
fn step_54() -> Unit raise {
  let t249 = @simp.simp_tac(@list.List([support_clauses(), iterate_diff()]))
  let t250 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@equal.gsym(iterate_support())])),
    t249,
  )
  iterate_diff_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(support(op, f, s)) && SUBSET(support(op, f, t), support(op, f, s)) → op(iterate(op, DIFF(s, t), f), iterate(op, t, f)) == iterate(op, s, f))"),
      t250,
    ),
  )
}

///|
let iterate_diff_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_DIFF_GEN",
)

///|
/// `ITERATE_DIFF_GEN`
pub fn iterate_diff_gen() -> @kernel.Thm {
  iterate_diff_gen_c.get()
}

///|
/// ITERATE_INCL_EXCL
fn step_55() -> Unit raise {
  let t282 = @tactics.first_x_assum(fn(
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
    let th = x280
    @simp.rewrite_tac(@list.List([@drule.match_mp(monoidal_ac())(th)]))
  })
  let t276 = @sets.set_rule(
    @term_syntax.parse_term("DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), INTER(s, s'))"),
  )
  let t277 = @sets.set_rule(
    @term_syntax.parse_term("DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), INTER(s', s))"),
  )
  let t278 = @sets.set_rule(
    @term_syntax.parse_term("DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), DIFF(s', s))"),
  )
  let t279 = @simp.asm_simp_tac(
    @list.List([
      iterate_union(),
      @sets.finite_union(),
      @sets.finite_diff(),
      @sets.finite_inter(),
      @sets.set_rule(
        @term_syntax.parse_term("DISJOINT(UNION(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), DIFF(s', s)), INTER(s, s'))"),
      ),
      t278,
      t277,
      t276,
    ]),
  )
  let t275 = @simp.gen_rewrite_tac(
    fn(
      x274 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x270 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x264 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s265 = @equal.land_conv(x264)
          fn(x266 : @kernel.Term) -> @kernel.Thm raise { s265(x266) }
        })(
          (fn(
            x267 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s268 = @equal.rand_conv(x267)
            fn(x269 : @kernel.Term) -> @kernel.Thm raise { s268(x269) }
          })(x270),
        )
      })(
        (fn(
          x271 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s272 = @equal.once_depth_conv(x271)
          fn(x273 : @kernel.Term) -> @kernel.Thm raise { s272(x273) }
        })(x274),
      )
    },
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("(t : (A) -> Bool) == UNION(DIFF(t, (s : (A) -> Bool)), INTER(s, t))")),
    ]),
  )
  let t263 = @simp.gen_rewrite_tac(
    fn(
      x262 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x258 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x252 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s253 = @equal.land_conv(x252)
          fn(x254 : @kernel.Term) -> @kernel.Thm raise { s253(x254) }
        })(
          (fn(
            x255 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s256 = @equal.land_conv(x255)
            fn(x257 : @kernel.Term) -> @kernel.Thm raise { s256(x257) }
          })(x258),
        )
      })(
        (fn(
          x259 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s260 = @equal.once_depth_conv(x259)
          fn(x261 : @kernel.Term) -> @kernel.Thm raise { s260(x261) }
        })(x262),
      )
    },
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("(s : (A) -> Bool) == UNION(DIFF(s, (t : (A) -> Bool)), INTER(s, t))")),
    ]),
  )
  let t251 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("UNION((a : (_) -> Bool), (b : (_) -> Bool)) == UNION(UNION(DIFF(a, b), DIFF(b, a)), INTER(a, b))"),
      ),
    ]),
  )
  let t283 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t251),
          t263,
        ),
        t275,
      ),
      t279,
    ),
    t282,
  )
  iterate_incl_excl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> B, FINITE(s) && FINITE(t) → op(iterate(op, s, f), iterate(op, t, f)) == op(iterate(op, UNION(s, t), f), iterate(op, INTER(s, t), f)))"),
      t283,
    ),
  )
}

///|
let iterate_incl_excl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_INCL_EXCL",
)

///|
/// `ITERATE_INCL_EXCL`
pub fn iterate_incl_excl() -> @kernel.Thm {
  iterate_incl_excl_c.get()
}

///|
/// ITERATE_CLOSED
fn step_56() -> Unit raise {
  let t298 = @simp.asm_simp_tac(
    @list.List([iterate_clauses(), @sets.finite_insert(), @sets.in_insert()]),
  )
  let t297 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t295 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t296 = @tactics.spec_tac(
    @term_syntax.parse_term("support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))"),
    t295,
  )
  let t294 = @tactics.pop_assum(fn(
    x291 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s292 = @tactics.mp_tac(x291)
    fn(
      x293 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s292(x293)
    }
  })
  let t290 = @simp.asm_simp_tac(@list.List([]))
  let t289 = @simp.rewrite_tac(@list.List([@equal.gsym(in_support())]))
  let t288 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x285 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s286 = @tactics.mp_tac(x285)
      fn(
        x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s286(x287)
      }
    }),
  )
  let t284 = @simp.once_rewrite_tac(@list.List([iterate_expand_cases()]))
  let t299 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t284,
                  ),
                  t288,
                ),
                t289,
              ),
              @class.cond_cases_tac,
            ),
            t290,
          ),
          t294,
        ),
        t296,
      ),
      t297,
    ),
    t298,
  )
  iterate_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ P : (B) -> Bool, P(neutral(op)) && (∀ x : B, ∀ y : B, P(x) && P(y) → P(op(x, y))) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) && !(f(x) == neutral(op)) → P(f(x))) → P(iterate(op, s, f))))"),
      t299,
    ),
  )
}

///|
let iterate_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_CLOSED")

///|
/// `ITERATE_CLOSED`
pub fn iterate_closed() -> @kernel.Thm {
  iterate_closed_c.get()
}

///|
/// ITERATE_RELATED
fn step_57() -> Unit raise {
  let t302 = @simp.asm_simp_tac(
    @list.List([iterate_clauses(), @sets.finite_insert(), @sets.in_insert()]),
  )
  let t301 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t300 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t303 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                @tactics.gen_tac,
              ),
              @tactics.strip_tac,
            ),
            @tactics.gen_tac,
          ),
          @tactics.gen_tac,
        ),
        t300,
      ),
      t301,
    ),
    t302,
  )
  iterate_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ R : (B, B) -> Bool, R(neutral(op), neutral(op)) && (∀ x1 : B, ∀ y1 : B, ∀ x2 : B, ∀ y2 : B, R(x1, x2) && R(y1, y2) → R(op(x1, y1), op(x2, y2))) → (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(iterate(op, s, f), iterate(op, s, g))))"),
      t303,
    ),
  )
}

///|
let iterate_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_RELATED",
)

///|
/// `ITERATE_RELATED`
pub fn iterate_related() -> @kernel.Thm {
  iterate_related_c.get()
}

///|
/// ITERATE_EQ_NEUTRAL
fn step_58() -> Unit raise {
  let t308 = @meson.asm_meson_tac(
    @list.List([iterate_clauses(), @sets.finite_rules(), iterate_support()]),
  )
  let t309 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@sets.extension(), @sets.not_in_empty(), in_support()]),
    ),
    t308,
  ])
  let t307 = @tactics.subgoal_then(
    @term_syntax.parse_term("support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool)) == {}"),
    fn(
      x304 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s305 = @tactics.assume_tac(x304)
      fn(
        x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s305(x306)
      }
    },
  )
  let t310 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t307),
    t309,
  )
  iterate_eq_neutral_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == neutral(op)) → iterate(op, s, f) == neutral(op))"),
      t310,
    ),
  )
}

///|
let iterate_eq_neutral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_EQ_NEUTRAL",
)

///|
/// `ITERATE_EQ_NEUTRAL`
pub fn iterate_eq_neutral() -> @kernel.Thm {
  iterate_eq_neutral_c.get()
}

///|
/// ITERATE_SING
fn step_59() -> Unit raise {
  let t311 = @meson.meson_tac(@list.List([monoidal()]))
  let t312 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([iterate_clauses(), @sets.finite_rules(), @sets.not_in_empty()]),
    ),
    t311,
  )
  iterate_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ x : A, iterate(op, {x}, f) == f(x))"),
      t312,
    ),
  )
}

///|
let iterate_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_SING")

///|
/// `ITERATE_SING`
pub fn iterate_sing() -> @kernel.Thm {
  iterate_sing_c.get()
}

///|
/// ITERATE_CLOSED_NONEMPTY
fn step_60() -> Unit raise {
  let t320 = @simp.asm_simp_tac(@list.List([iterate_clauses()]))
  let t319 = @simp.asm_simp_tac(@list.List([iterate_sing()]))
  let t318 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (A) -> Bool) == {}"))
  let t316 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t317 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t316]),
  )
  let t315 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_insert(),
      @sets.not_in_empty(),
      @sets.not_insert_empty(),
    ]),
  )
  let t314 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t313 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t321 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                      @tactics.gen_tac,
                    ),
                    @tactics.disch_tac,
                  ),
                  @tactics.gen_tac,
                ),
                t313,
              ),
              t314,
            ),
            t315,
          ),
          t317,
        ),
        t318,
      ),
      t319,
    ),
    t320,
  )
  iterate_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ P : (B) -> Bool, (∀ x : B, ∀ y : B, P(x) && P(y) → P(op(x, y))) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → P(f(x))) → P(iterate(op, s, f))))"),
      t321,
    ),
  )
}

///|
let iterate_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLOSED_NONEMPTY",
)

///|
/// `ITERATE_CLOSED_NONEMPTY`
pub fn iterate_closed_nonempty() -> @kernel.Thm {
  iterate_closed_nonempty_c.get()
}

///|
/// ITERATE_RELATED_NONEMPTY
fn step_61() -> Unit raise {
  let t329 = @simp.asm_simp_tac(@list.List([iterate_clauses()]))
  let t328 = @simp.asm_simp_tac(@list.List([iterate_sing()]))
  let t327 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (A) -> Bool) == {}"))
  let t325 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t326 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t325]),
  )
  let t324 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_insert(),
      @sets.not_in_empty(),
      @sets.not_insert_empty(),
    ]),
  )
  let t323 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t322 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t330 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                        @tactics.gen_tac,
                      ),
                      @tactics.disch_tac,
                    ),
                    @tactics.gen_tac,
                  ),
                  @tactics.gen_tac,
                ),
                t322,
              ),
              t323,
            ),
            t324,
          ),
          t326,
        ),
        t327,
      ),
      t328,
    ),
    t329,
  )
  iterate_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ R : (B, B) -> Bool, (∀ x1 : B, ∀ y1 : B, ∀ x2 : B, ∀ y2 : B, R(x1, x2) && R(y1, y2) → R(op(x1, y1), op(x2, y2))) → (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(iterate(op, s, f), iterate(op, s, g))))"),
      t330,
    ),
  )
}

///|
let iterate_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_RELATED_NONEMPTY",
)

///|
/// `ITERATE_RELATED_NONEMPTY`
pub fn iterate_related_nonempty() -> @kernel.Thm {
  iterate_related_nonempty_c.get()
}

///|
/// ITERATE_DELETE
fn step_62() -> Unit raise {
  let t331 = @meson.meson_tac(
    @list.List([
      iterate_clauses(),
      @sets.finite_delete(),
      @sets.in_delete(),
      @sets.insert_delete(),
    ]),
  )
  iterate_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → op(f(a), iterate(op, DELETE(s, a), f)) == iterate(op, s, f))"),
      t331,
    ),
  )
}

///|
let iterate_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_DELETE")

///|
/// `ITERATE_DELETE`
pub fn iterate_delete() -> @kernel.Thm {
  iterate_delete_c.get()
}

///|
/// ITERATE_DELTA
fn step_63() -> Unit raise {
  let t337 = @simp.asm_simp_tac(@list.List([iterate_clauses(), iterate_sing()]))
  let t336 = @simp.rewrite_tac(@list.List([support_clauses()]))
  let t335 = @simp.asm_simp_tac(@list.List([iterate_clauses()]))
  let t334 = @tactics.repeat_tac(@tactics.gen_tac)
  let t333 = @simp.rewrite_tac(@list.List([support_delta()]))
  let t332 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(iterate_support())]),
  )
  let t338 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                  t332,
                ),
                t333,
              ),
              t334,
            ),
            @class.cond_cases_tac,
          ),
          t335,
        ),
        t336,
      ),
      @class.cond_cases_tac,
    ),
    t337,
  )
  iterate_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ a : A, ∀ s : (A) -> Bool, iterate(op, s, (x : A) => if x == a { f(x) } else { neutral(op) }) == (if IN(a, s) { f(a) } else { neutral(op) }))"),
      t338,
    ),
  )
}

///|
let iterate_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_DELTA")

///|
/// `ITERATE_DELTA`
pub fn iterate_delta() -> @kernel.Thm {
  iterate_delta_c.get()
}

///|
/// ITERATE_IMAGE
fn step_64() -> Unit raise {
  let t353 = @meson.asm_meson_tac(@list.List([in_support()]))
  let t354 = @tactics.then_tac(
    @tactics.first_x_assum(@tactics.match_mp_tac),
    t353,
  )
  let t352 = @meson.asm_meson_tac(@list.List([in_support()]))
  let t355 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image_inj_eq()), t352),
    t354,
  ])
  let t351 = @tactics.repeat_tac(@tactics.strip_tac)
  let t350 = @simp.rewrite_tac(@list.List([support_clauses()]))
  let t349 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(a : Bool) == (a' : Bool) && (a' → (b : _) == (b' : _)) → (if a { b } else { (c : _) }) == (if a' { b' } else { c })"),
    ),
  )
  let t348 = @tactics.repeat_tac(@tactics.strip_tac)
  let t347 = @simp.once_rewrite_tac(@list.List([iterate_expand_cases()]))
  let t356 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
              t347,
            ),
            t348,
          ),
          t349,
        ),
        t350,
      ),
      t351,
    ),
    t355,
  )
  let t346 = @meson.asm_meson_tac(@list.List([@sets.in_image()]))
  let t345 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @sets.in_insert()]))
  let t344 = @simp.asm_simp_tac(
    @list.List([iterate_clauses(), @sets.image_clauses(), @sets.finite_image()]),
  )
  let t343 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t357 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
            t343,
          ),
          t344,
        ),
        t345,
      ),
      t346,
    ),
    t356,
  ])
  let t342 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && (f : (A) -> B)(x) == f(y) → x == y) → iterate((op : (C, C) -> C), IMAGE(f, s), (g : (B) -> C)) == iterate(op, s, o(g, f))"),
    fn(
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
      let s340 = @tactics.assume_tac(x339)
      fn(
        x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s340(x341)
      }
    },
  )
  let t358 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
          @tactics.gen_tac,
        ),
        @tactics.gen_tac,
      ),
      t342,
    ),
    t357,
  )
  iterate_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ f : (A) -> B, ∀ g : (B) -> C, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → iterate(op, IMAGE(f, s), g) == iterate(op, s, o(g, f)))"),
      t358,
    ),
  )
}

///|
let iterate_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_IMAGE")

///|
/// `ITERATE_IMAGE`
pub fn iterate_image() -> @kernel.Thm {
  iterate_image_c.get()
}

///|
/// ITERATE_BIJECTION
fn step_65() -> Unit raise {
  let t366 = @meson.asm_meson_tac(@list.List([]))
  let t362 = @drule.match_mp(
    @kernel.inst_type(@list.List([(@kernel.aty, @basics.bty)]), iterate_image()),
  )
  let t364 = @tactics.first_x_assum(fn(
    x363 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t362(x363))
  })
  let t361 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_image()]),
  )
  let t365 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac),
      t361,
    ),
    t364,
  ])
  let t360 = @tactics.exists_tac(
    @term_syntax.parse_term("iterate((op : (B, B) -> B), IMAGE((p : (A) -> A), (s : (A) -> Bool)), (f : (A) -> B))"),
  )
  let t359 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t367 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t359),
          t360,
        ),
        @tactics.conj_tac,
      ),
      t365,
    ),
    t366,
  )
  iterate_bijection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ p : (A) -> A, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ y : A, IN(y, s) → existsunique((x : A) => IN(x, s) && p(x) == y)) → iterate(op, s, f) == iterate(op, s, o(f, p)))"),
      t367,
    ),
  )
}

///|
let iterate_bijection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_BIJECTION",
)

///|
/// `ITERATE_BIJECTION`
pub fn iterate_bijection() -> @kernel.Thm {
  iterate_bijection_c.get()
}

///|
/// ITERATE_ITERATE_PRODUCT
fn step_66() -> Unit raise {
  let t414 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t413 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t412 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t415 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
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
          let s410 = @tactics.subst1_tac(x409)
          fn(
            x411 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s410(x411)
          }
        }),
        t412,
      ),
      t413,
    ),
    t414,
  )
  let t408 = @simp.asm_simp_tac(@list.List([@pair.pair_eq()]))
  let t407 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t416 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(@list.List([@pair.forall_pair_thm()])),
        t407,
      ),
      t408,
    ),
    t415,
  ])
  let t406 = @tactics.first_assum(fn(
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
    let th_1 = x394
    let t400 = @drule.part_match(
      fn(x399 : @kernel.Term) -> @kernel.Term raise {
        @equal.lhand(@kernel.rand(x399))
      },
      @drule.match_mp(iterate_image())(th_1),
    )
    fn(
      x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x404 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x402 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x401 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
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
              let s397 = @tactics.mp_tac(x396)
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
            })(t400(x401))
          })(@kernel.rand(x402))
        })(
          (fn(
            x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x403.1
          })(x404),
        )
      })(x405)(x405)
    }
  })
  let t393 = @tactics.disch_then(fn(
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
    let s391 = @tactics.subst1_tac(x390)
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
  })
  let t388 = @meson.asm_meson_tac(@list.List([]))
  let t387 = @simp.rewrite_tac(
    @list.List([
      @sets.disjoint(),
      @sets.extension(),
      @sets.in_image(),
      @sets.in_inter(),
      @sets.not_in_empty(),
      @sets.in_elim_thm(),
      @pair.exists_pair_thm(),
      @pair.forall_pair_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t389 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            @sets.finite_image(),
            @sets.finite_product_dependent(),
            @sets.in_insert(),
          ]),
        ),
        t387,
      ),
      t388,
    ),
    @tactics.all_tac,
  ])
  let t386 = @tactics.first_assum(fn(
    x374 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x374
    let t380 = @drule.part_match(
      fn(x379 : @kernel.Term) -> @kernel.Term raise {
        @equal.lhand(@kernel.rand(x379))
      },
      @drule.match_mp(iterate_union())(th),
    )
    fn(
      x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x382 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x381 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x376 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s377 = @tactics.mp_tac(x376)
              fn(
                x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s377(x378)
              }
            })(t380(x381))
          })(@kernel.rand(x382))
        })(
          (fn(
            x383 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x383.1
          })(x384),
        )
      })(x385)(x385)
    }
  })
  let t373 = @tactics.repeat_tac(@tactics.strip_tac)
  let t372 = @simp.asm_simp_tac(
    @list.List([@sets.finite_insert(), iterate_clauses(), @sets.in_insert()]),
  )
  let t371 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{((i : _), (j : _)) | IN(i, INSERT((a : _), (s : (_) -> Bool))) && IN(j, (t : (_, _) -> Bool)(i))} == UNION(IMAGE((j : _) => (a, j), t(a)), {((i : _), (j : _)) | IN(i, s) && IN(j, t(i))})"),
      ),
    ]),
  )
  let t370 = @simp.asm_simp_tac(
    @list.List([
      @sets.not_in_empty(),
      @sets.set_rule(@term_syntax.parse_term("{((a : _), (b : _)) | false} == {}")),
      iterate_clauses(),
    ]),
  )
  let t369 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t368 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
  )
  let t417 = @tactics.thenl(
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
                                  @tactics.gen_tac, @tactics.disch_tac,
                                ),
                                t368,
                              ),
                              t369,
                            ),
                            t370,
                          ),
                          t371,
                        ),
                        t372,
                      ),
                      t373,
                    ),
                    t386,
                  ),
                  @tactics.ants_tac,
                ),
                t389,
              ),
              t393,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t406,
      ),
      @tactics.ants_tac,
    ),
    t416,
  )
  iterate_iterate_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, ∀ x : (A, B) -> C, FINITE(s) && (∀ i : A, IN(i, s) → FINITE(t(i))) → iterate(op, s, (i : A) => iterate(op, t(i), x(i))) == iterate(op, {((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) }))"),
      t417,
    ),
  )
}

///|
let iterate_iterate_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_ITERATE_PRODUCT",
)

///|
/// `ITERATE_ITERATE_PRODUCT`
pub fn iterate_iterate_product() -> @kernel.Thm {
  iterate_iterate_product_c.get()
}

///|
/// ITERATE_EQ
fn step_67() -> Unit raise {
  let t436 = @meson.meson_tac(@list.List([@sets.in_insert()]))
  let t435 = @simp.asm_simp_tac(@list.List([iterate_clauses()]))
  let t434 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t432 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t433 = @tactics.spec_tac(
    @term_syntax.parse_term("support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))"),
    t432,
  )
  let t430 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t431 = @list.List([@meson.asm_meson_tac(@list.List([in_support()])), t430])
  let t429 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE(support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))) && (∀ x : A, IN(x, support(op, f, s)) → f(x) == (g : (A) -> B)(x))"),
    fn(
      x426 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s427 = @tactics.mp_tac(x426)
      fn(
        x428 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s427(x428)
      }
    },
  )
  let t425 = @simp.asm_rewrite_tac(@list.List([]))
  let t423 = @meson.asm_meson_tac(@list.List([]))
  let t424 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.extension(), in_support()])),
      t423,
    ),
    @tactics.all_tac,
  ])
  let t422 = @tactics.subgoal_then(
    @term_syntax.parse_term("support((op : (B, B) -> B), (g : (A) -> B), (s : (A) -> Bool)) == support(op, (f : (A) -> B), s)"),
    fn(
      x419 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s420 = @tactics.subst1_tac(x419)
      fn(
        x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s420(x421)
      }
    },
  )
  let t418 = @simp.once_rewrite_tac(@list.List([iterate_expand_cases()]))
  let t437 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t418,
                      ),
                      t422,
                    ),
                    t424,
                  ),
                  @class.cond_cases_tac,
                ),
                t425,
              ),
              t429,
            ),
            t431,
          ),
          t433,
        ),
        t434,
      ),
      t435,
    ),
    t436,
  )
  iterate_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → iterate(op, s, f) == iterate(op, s, g))"),
      t437,
    ),
  )
}

///|
let iterate_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_EQ")

///|
/// `ITERATE_EQ`
pub fn iterate_eq() -> @kernel.Thm {
  iterate_eq_c.get()
}

///|
/// ITERATE_RESTRICT_SET
fn step_68() -> Unit raise {
  let t445 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t442 = @drule.match_mp(iterate_eq())
  let t444 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t442(x443))
  })
  let t440 = @equal.gsym(@theorems.conj_assoc())
  let t441 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!((if (P : (_) -> Bool)((x : _)) { (f : (_) -> _)(x) } else { (a : _) }) == a) == (P(x) && !(f(x) == a))"),
      ),
      t440,
    ]),
  )
  let t439 = @simp.rewrite_tac(@list.List([support(), @sets.in_elim_thm()]))
  let t438 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(iterate_support())]),
  )
  let t446 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t438),
          t439,
        ),
        t441,
      ),
      t444,
    ),
    t445,
  )
  iterate_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> B, iterate(op, {(x : A) | IN(x, s) && P(x)}, f) == iterate(op, s, (x : A) => if P(x) { f(x) } else { neutral(op) }))"),
      t446,
    ),
  )
}

///|
let iterate_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_RESTRICT_SET",
)

///|
/// `ITERATE_RESTRICT_SET`
pub fn iterate_restrict_set() -> @kernel.Thm {
  iterate_restrict_set_c.get()
}

///|
/// ITERATE_EQ_GENERAL
fn step_69() -> Unit raise {
  let t458 = @meson.asm_meson_tac(@list.List([]))
  let t455 = @drule.match_mp(iterate_image())
  let t457 = @tactics.first_x_assum(fn(
    x456 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t455(x456))
  })
  let t459 = @tactics.then_tac(
    @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t457),
    t458,
  )
  let t460 = @list.List([
    @meson.asm_meson_tac(@list.List([iterate_eq(), @trivia.o_thm()])),
    t459,
  ])
  let t454 = @tactics.exists_tac(
    @term_syntax.parse_term("iterate((op : (C, C) -> C), (s : (A) -> Bool), o((g : (B) -> C), (h : (A) -> B)))"),
  )
  let t453 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t451 = @meson.asm_meson_tac(@list.List([]))
  let t452 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image()])),
      t451,
    ),
    @tactics.all_tac,
  ])
  let t450 = @tactics.subgoal_then(@term_syntax.parse_term("(t : (B) -> Bool) == IMAGE((h : (A) -> B), (s : (A) -> Bool))"), fn(
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
    let s448 = @tactics.subst1_tac(x447)
    fn(
      x449 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s448(x449)
    }
  })
  let t461 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t450),
            t452,
          ),
          t453,
        ),
        t454,
      ),
      @tactics.conj_tac,
    ),
    t460,
  )
  iterate_eq_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> C, ∀ g : (B) -> C, ∀ h : (A) -> B, (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && h(x) == y)) && (∀ x : A, IN(x, s) → IN(h(x), t) && g(h(x)) == f(x)) → iterate(op, s, f) == iterate(op, t, g))"),
      t461,
    ),
  )
}

///|
let iterate_eq_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_EQ_GENERAL",
)

///|
/// `ITERATE_EQ_GENERAL`
pub fn iterate_eq_general() -> @kernel.Thm {
  iterate_eq_general_c.get()
}

///|
/// ITERATE_EQ_GENERAL_INVERSES
fn step_70() -> Unit raise {
  let t466 = @meson.asm_meson_tac(@list.List([]))
  let t465 = @tactics.exists_tac(@term_syntax.parse_term("(h : (A) -> B)"))
  let t462 = @drule.match_mp(iterate_eq_general())
  let t464 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t462(x463))
  })
  let t467 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t464),
      t465,
    ),
    t466,
  )
  iterate_eq_general_inverses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> C, ∀ g : (B) -> C, ∀ h : (A) -> B, ∀ k : (B) -> A, (∀ y : B, IN(y, t) → IN(k(y), s) && h(k(y)) == y) && (∀ x : A, IN(x, s) → IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) → iterate(op, s, f) == iterate(op, t, g))"),
      t467,
    ),
  )
}

///|
let iterate_eq_general_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_EQ_GENERAL_INVERSES",
)

///|
/// `ITERATE_EQ_GENERAL_INVERSES`
pub fn iterate_eq_general_inverses() -> @kernel.Thm {
  iterate_eq_general_inverses_c.get()
}

///|
/// ITERATE_INJECTION
fn step_71() -> Unit raise {
  let t475 = @meson.asm_meson_tac(@list.List([]))
  let t474 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @sets.in_image()]),
  )
  let t472 = @term_syntax.parse_term("(p : (A) -> A)")
  let t473 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t472]),
      @sets.surjective_iff_injective(),
    ),
  )
  let t469 = @drule.match_mp(iterate_bijection())
  let t471 = @tactics.first_x_assum(fn(
    x470 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t469(x470))
  })
  let t468 = @tactics.conv_tac(@equal.sym_conv)
  let t476 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t468),
          t471,
        ),
        t473,
      ),
      t474,
    ),
    t475,
  )
  iterate_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ p : (A) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → iterate(op, s, o(f, p)) == iterate(op, s, f))"),
      t476,
    ),
  )
}

///|
let iterate_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_INJECTION",
)

///|
/// `ITERATE_INJECTION`
pub fn iterate_injection() -> @kernel.Thm {
  iterate_injection_c.get()
}

///|
/// ITERATE_UNION_NONZERO
fn step_72() -> Unit raise {
  let t483 = @meson.asm_meson_tac(
    @list.List([@sets.in_inter(), @sets.not_in_empty()]),
  )
  let t482 = @simp.asm_simp_tac(
    @list.List([
      finite_support(),
      @sets.disjoint(),
      @sets.in_inter(),
      in_support(),
      @sets.extension(),
    ]),
  )
  let t479 = @drule.match_mp(iterate_union())
  let t481 = @tactics.first_assum(fn(
    x480 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t479(x480))
  })
  let t478 = @simp.rewrite_tac(@list.List([support_clauses()]))
  let t477 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(iterate_support())]),
  )
  let t484 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t477),
          t478,
        ),
        t481,
      ),
      t482,
    ),
    t483,
  )
  iterate_union_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, INTER(s, t)) → f(x) == neutral(op)) → iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))"),
      t484,
    ),
  )
}

///|
let iterate_union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_UNION_NONZERO",
)

///|
/// `ITERATE_UNION_NONZERO`
pub fn iterate_union_nonzero() -> @kernel.Thm {
  iterate_union_nonzero_c.get()
}

///|
/// ITERATE_OP
fn step_73() -> Unit raise {
  let t486 = @simp.asm_simp_tac(@list.List([iterate_clauses(), monoidal_ac()]))
  let t485 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t487 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
          @tactics.gen_tac,
        ),
        @tactics.gen_tac,
      ),
      t485,
    ),
    t486,
  )
  iterate_op_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) → iterate(op, s, (x : A) => op(f(x), g(x))) == op(iterate(op, s, f), iterate(op, s, g)))"),
      t487,
    ),
  )
}

///|
let iterate_op_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_OP")

///|
/// `ITERATE_OP`
pub fn iterate_op() -> @kernel.Thm {
  iterate_op_c.get()
}

///|
/// ITERATE_SUPERSET
fn step_74() -> Unit raise {
  let t490 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t489 = @simp.rewrite_tac(
    @list.List([support(), @sets.extension(), @sets.in_elim_thm()]),
  )
  let t488 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(iterate_support())]),
  )
  let t491 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t488),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t489,
    ),
    t490,
  )
  iterate_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == neutral(op)) → iterate(op, v, f) == iterate(op, u, f))"),
      t491,
    ),
  )
}

///|
let iterate_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_SUPERSET",
)

///|
/// `ITERATE_SUPERSET`
pub fn iterate_superset() -> @kernel.Thm {
  iterate_superset_c.get()
}

///|
/// ITERATE_UNIV
fn step_75() -> Unit raise {
  let t497 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t494 = @drule.match_mp(iterate_superset())
  let t496 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t494(x495))
  })
  let t493 = @tactics.conv_tac(@equal.sym_conv)
  let t492 = @tactics.repeat_tac(@tactics.strip_tac)
  let t498 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([support(), @sets.subset(), @sets.in_elim_thm()]),
          ),
          t492,
        ),
        t493,
      ),
      t496,
    ),
    t497,
  )
  iterate_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ s : (A) -> Bool, SUBSET(support(op, f, UNIV), s) → iterate(op, s, f) == iterate(op, UNIV, f))"),
      t498,
    ),
  )
}

///|
let iterate_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_UNIV")

///|
/// `ITERATE_UNIV`
pub fn iterate_univ() -> @kernel.Thm {
  iterate_univ_c.get()
}

///|
/// ITERATE_SWAP
fn step_76() -> Unit raise {
  let t502 = @simp.asm_simp_tac(
    @list.List([iterate_eq_neutral(), @equal.gsym(iterate_op())]),
  )
  let t501 = @simp.asm_simp_tac(@list.List([iterate_clauses()]))
  let t500 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t499 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
  )
  let t503 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
            @tactics.gen_tac,
          ),
          t499,
        ),
        t500,
      ),
      t501,
    ),
    t502,
  )
  iterate_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ f : (A, B) -> C, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → iterate(op, s, (i : A) => iterate(op, t, f(i))) == iterate(op, t, (j : B) => iterate(op, s, (i : A) => f(i, j))))"),
      t503,
    ),
  )
}

///|
let iterate_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_SWAP")

///|
/// `ITERATE_SWAP`
pub fn iterate_swap() -> @kernel.Thm {
  iterate_swap_c.get()
}

///|
/// ITERATE_IMAGE_NONZERO
fn step_77() -> Unit raise {
  let t522 = @meson.asm_meson_tac(@list.List([monoidal_ac()]))
  let t521 = @tactics.subgoal_then(
    @term_syntax.parse_term("(g : (B) -> C)((f : (A) -> B)((a : A))) == neutral((op : (C, C) -> C))"),
    fn(
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
      let s519 = @tactics.subst1_tac(x518)
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
    },
  )
  let t517 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t516 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t515 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t514 = @tactics.subgoal_then(
    @term_syntax.parse_term("iterate((op : (C, C) -> C), (s : (A) -> Bool), o((g : (B) -> C), (f : (A) -> B))) == iterate(op, IMAGE(f, s), g)"),
    fn(
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
    },
  )
  let t510 = @tactics.repeat_tac(@tactics.strip_tac)
  let t509 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t507 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t508 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t507]),
  )
  let t506 = @simp.asm_simp_tac(
    @list.List([@sets.image_clauses(), iterate_clauses(), @sets.finite_image()]),
  )
  let t505 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t504 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t523 = @tactics.then_tac(
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
                                  @tactics.gen_tac, @tactics.disch_tac,
                                ),
                                @tactics.gen_tac,
                              ),
                              @tactics.gen_tac,
                            ),
                            t504,
                          ),
                          t505,
                        ),
                        t506,
                      ),
                      t508,
                    ),
                    t509,
                  ),
                  t510,
                ),
                t514,
              ),
              t515,
            ),
            t516,
          ),
          @class.cond_cases_tac,
        ),
        t517,
      ),
      t521,
    ),
    t522,
  )
  iterate_image_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ g : (B) -> C, ∀ f : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) && f(x) == f(y) → g(f(x)) == neutral(op)) → iterate(op, IMAGE(f, s), g) == iterate(op, s, o(g, f)))"),
      t523,
    ),
  )
}

///|
let iterate_image_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_IMAGE_NONZERO",
)

///|
/// `ITERATE_IMAGE_NONZERO`
pub fn iterate_image_nonzero() -> @kernel.Thm {
  iterate_image_nonzero_c.get()
}

///|
/// ITERATE_IMAGE_GEN
fn step_78() -> Unit raise {
  let t549 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t548 = @tactics.first_assum(fn(
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
    let th = x536
    let t542 = @drule.part_match(
      fn(x541 : @kernel.Term) -> @kernel.Term raise {
        @equal.lhand(@kernel.rand(x541))
      },
      @drule.match_mp(iterate_swap())(th),
    )
    fn(
      x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x546 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x544 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x543 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x538 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s539 = @tactics.mp_tac(x538)
              fn(
                x540 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s539(x540)
              }
            })(t542(x543))
          })(@equal.lhand(x544))
        })(
          (fn(
            x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x545.1
          })(x546),
        )
      })(x547)(x547)
    }
  })
  let t550 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([iterate_restrict_set()])),
      t548,
    ),
    t549,
  )
  let t534 = @simp.asm_simp_tac(@list.List([iterate_sing()]))
  let t535 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t534])
  let t533 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(y : B) | IN(y, IMAGE((f : (A) -> B), (s : (A) -> Bool))) && f((x : A)) == y} == {f(x)}"),
    fn(
      x530 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s531 = @tactics.subst1_tac(x530)
      fn(
        x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s531(x532)
      }
    },
  )
  let t529 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t528 = @simp.asm_rewrite_tac(@list.List([]))
  let t526 = @drule.match_mp(iterate_eq())
  let t551 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.first_assum(fn(
                x527 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                @tactics.match_mp_tac(t526(x527))
              }),
              t528,
            ),
            t529,
          ),
          @tactics.disch_tac,
        ),
        t533,
      ),
      t535,
    ),
    t550,
  ])
  let t525 = @tactics.exists_tac(
    @term_syntax.parse_term("iterate((op : (C, C) -> C), (s : (A) -> Bool), (x : A) => iterate(op, {(y : B) | IN(y, IMAGE((f : (A) -> B), s)) && f(x) == y}, (y : B) => (g : (A) -> C)(x)))"),
  )
  let t524 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t552 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t524),
        t525,
      ),
      @tactics.conj_tac,
    ),
    t551,
  )
  iterate_image_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (C, C) -> C, monoidal(op) → (∀ f : (A) -> B, ∀ g : (A) -> C, ∀ s : (A) -> Bool, FINITE(s) → iterate(op, s, g) == iterate(op, IMAGE(f, s), (y : B) => iterate(op, {(x : A) | IN(x, s) && f(x) == y}, g)))"),
      t552,
    ),
  )
}

///|
let iterate_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_IMAGE_GEN",
)

///|
/// `ITERATE_IMAGE_GEN`
pub fn iterate_image_gen() -> @kernel.Thm {
  iterate_image_gen_c.get()
}

///|
/// ITERATE_CASES
fn step_79() -> Unit raise {
  let t561 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t559 = @drule.match_mp(iterate_eq())
  let t562 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.binop_tac,
      @tactics.first_assum(fn(
        x560 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.match_mp_tac(t559(x560))
      }),
    ),
    t561,
  )
  let t558 = @sets.set_tac(@list.List([]))
  let t563 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_assum(fn(
            x555 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let th = x555
            let t557 = @sets.set_rule(
              @term_syntax.parse_term("DISJOINT({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && !P(x)})"),
            )
            @simp.asm_simp_tac(
              @list.List([
                @equal.gsym(@drule.match_mp(iterate_union())(th)),
                @sets.finite_restrict(),
                t557,
              ]),
            )
          }),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t558,
    ),
    t562,
  ])
  let t554 = @tactics.exists_tac(
    @term_syntax.parse_term("(op : (B, B) -> B)(iterate(op, {(x : A) | IN(x, (s : (A) -> Bool)) && (P : (A) -> Bool)(x)}, (x : A) => if P(x) { (f : (A) -> B)(x) } else { (g : (A) -> B)(x) }), iterate(op, {(x : A) | IN(x, s) && !P(x)}, (x : A) => if P(x) { f(x) } else { g(x) }))"),
  )
  let t553 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t564 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t553),
        t554,
      ),
      @tactics.conj_tac,
    ),
    t563,
  )
  iterate_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ s : (A) -> Bool, ∀ P : (A) -> Bool, ∀ f : (A) -> B, ∀ g : (A) -> B, FINITE(s) → iterate(op, s, (x : A) => if P(x) { f(x) } else { g(x) }) == op(iterate(op, {(x : A) | IN(x, s) && P(x)}, f), iterate(op, {(x : A) | IN(x, s) && !P(x)}, g)))"),
      t564,
    ),
  )
}

///|
let iterate_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_CASES")

///|
/// `ITERATE_CASES`
pub fn iterate_cases() -> @kernel.Thm {
  iterate_cases_c.get()
}

///|
/// ITERATE_OP_GEN
fn step_80() -> Unit raise {
  let t574 = @meson.asm_meson_tac(@list.List([monoidal()]))
  let t573 = @simp.rewrite_tac(
    @list.List([
      support(),
      @sets.in_elim_thm(),
      @sets.subset(),
      @sets.in_union(),
    ]),
  )
  let t570 = @drule.match_mp(iterate_superset())
  let t572 = @tactics.first_assum(fn(
    x571 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t570(x571))
  })
  let t568 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([iterate_op(), @sets.finite_union()])),
    @tactics.binop_tac,
  )
  let t569 = @list.List([@tactics.conv_tac(@equal.sym_conv), t568])
  let t567 = @tactics.exists_tac(
    @term_syntax.parse_term("iterate((op : (B, B) -> B), UNION(support(op, (f : (A) -> B), (s : (A) -> Bool)), support(op, (g : (A) -> B), s)), (x : A) => op(f(x), g(x)))"),
  )
  let t566 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t565 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(iterate_support())]),
  )
  let t575 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t565),
                t566,
              ),
              t567,
            ),
            @tactics.conj_tac,
          ),
          t569,
        ),
        t572,
      ),
      t573,
    ),
    t574,
  )
  iterate_op_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (B, B) -> B, monoidal(op) → (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, FINITE(support(op, f, s)) && FINITE(support(op, g, s)) → iterate(op, s, (x : A) => op(f(x), g(x))) == op(iterate(op, s, f), iterate(op, s, g)))"),
      t575,
    ),
  )
}

///|
let iterate_op_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_OP_GEN")

///|
/// `ITERATE_OP_GEN`
pub fn iterate_op_gen() -> @kernel.Thm {
  iterate_op_gen_c.get()
}

///|
/// ITERATE_CLAUSES_NUMSEG
fn step_81() -> Unit raise {
  let t579 = @meson.asm_meson_tac(@list.List([monoidal()]))
  let t578 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
      @sets.not_in_empty(),
    ]),
  )
  let t577 = @simp.asm_simp_tac(
    @list.List([
      iterate_clauses(),
      finite_numseg(),
      in_numseg(),
      @sets.finite_empty(),
    ]),
  )
  let t576 = @tactics.repeat_tac(@tactics.strip_tac)
  let t580 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([numseg_clauses()])),
            t576,
          ),
          @class.cond_cases_tac,
        ),
        t577,
      ),
      t578,
    ),
    t579,
  )
  iterate_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → (∀ m : Num, iterate(op, op_dot_dot(m, 0), (f : (Num) -> A)) == (if m == 0 { f(0) } else { neutral(op) })) && (∀ m : Num, ∀ n : Num, iterate(op, op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { op(iterate(op, op_dot_dot(m, n), f), f(SUC(n))) } else { iterate(op, op_dot_dot(m, n), f) }))"),
      t580,
    ),
  )
}

///|
let iterate_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLAUSES_NUMSEG",
)

///|
/// `ITERATE_CLAUSES_NUMSEG`
pub fn iterate_clauses_numseg() -> @kernel.Thm {
  iterate_clauses_numseg_c.get()
}

///|
/// ITERATE_CLAUSES_NUMSEG_LT
fn step_82() -> Unit raise {
  let t582 = @meson.meson_tac(@list.List([]))
  let t581 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @arith.lt_refl(), monoidal()]),
  )
  let t583 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @sets.numseg_clauses_lt(),
          iterate_clauses(),
          @sets.finite_numseg_lt(),
        ]),
      ),
      t581,
    ),
    t582,
  )
  iterate_clauses_numseg_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → iterate(op, {(i : Num) | i < 0}, (f : (Num) -> A)) == neutral(op) && (∀ k : Num, iterate(op, {(i : Num) | i < SUC(k)}, f) == op(iterate(op, {(i : Num) | i < k}, f), f(k)))"),
      t583,
    ),
  )
}

///|
let iterate_clauses_numseg_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLAUSES_NUMSEG_LT",
)

///|
/// `ITERATE_CLAUSES_NUMSEG_LT`
pub fn iterate_clauses_numseg_lt() -> @kernel.Thm {
  iterate_clauses_numseg_lt_c.get()
}

///|
/// ITERATE_CLAUSES_NUMSEG_LE
fn step_83() -> Unit raise {
  let t585 = @meson.meson_tac(@list.List([]))
  let t584 = @simp.rewrite_tac(
    @list.List([
      monoidal(),
      @sets.in_elim_thm(),
      @int.arith_rule(@term_syntax.parse_term("!(SUC((k : Num)) <= k)")),
    ]),
  )
  let t586 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @sets.numseg_clauses_le(),
          iterate_clauses(),
          @sets.finite_numseg_le(),
          iterate_sing(),
        ]),
      ),
      t584,
    ),
    t585,
  )
  iterate_clauses_numseg_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → iterate(op, {(i : Num) | i <= 0}, (f : (Num) -> A)) == f(0) && (∀ k : Num, iterate(op, {(i : Num) | i <= SUC(k)}, f) == op(iterate(op, {(i : Num) | i <= k}, f), f(SUC(k))))"),
      t586,
    ),
  )
}

///|
let iterate_clauses_numseg_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_CLAUSES_NUMSEG_LE",
)

///|
/// `ITERATE_CLAUSES_NUMSEG_LE`
pub fn iterate_clauses_numseg_le() -> @kernel.Thm {
  iterate_clauses_numseg_le_c.get()
}

///|
/// ITERATE_PAIR
fn step_84() -> Unit raise {
  let t596 = @meson.asm_meson_tac(@list.List([monoidal()]))
  let t594 = @int.arith_rule(
    @term_syntax.parse_term("2 * SUC((n : Num)) + 1 == SUC(SUC(2 * n + 1))"),
  )
  let t595 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("2 * SUC((n : Num)) == SUC(2 * n + 1)")),
      t594,
    ]),
  )
  let t593 = @simp.asm_rewrite_tac(@list.List([]))
  let t591 = @int.arith_rule(
    @term_syntax.parse_term("(2 * (m : Num) <= SUC(2 * (n : Num) + 1)) == (m <= SUC(n))"),
  )
  let t592 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(2 * (m : Num) <= SUC(SUC(2 * (n : Num) + 1))) == (m <= SUC(n))"),
      ),
      t591,
    ]),
  )
  let t590 = @simp.asm_simp_tac(@list.List([iterate_clauses_numseg()]))
  let t597 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([
                  @int.arith_rule(
                    @term_syntax.parse_term("2 * SUC((n : Num)) + 1 == SUC(SUC(2 * n + 1))"),
                  ),
                ]),
              ),
              t590,
            ),
            t592,
          ),
          @class.cond_cases_tac,
        ),
        t593,
      ),
      t595,
    ),
    t596,
  )
  let t589 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_0(), @calc_num.arith()]),
  )
  let t588 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(2 * (m : Num) <= SUC(0)) == (m == 0)"))]),
  )
  let t598 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_simp_tac(
            @list.List([
              @calc_num.num_conv(@term_syntax.parse_term("1")),
              iterate_clauses_numseg(),
            ]),
          ),
          t588,
        ),
        @class.cond_cases_tac,
      ),
      t589,
    ),
    t597,
  ])
  let t587 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t599 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
            @tactics.gen_tac,
          ),
          @tactics.gen_tac,
        ),
        @nums.induct_tac,
      ),
      t587,
    ),
    t598,
  )
  iterate_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → (∀ f : (Num) -> A, ∀ m : Num, ∀ n : Num, iterate(op, op_dot_dot(2 * m, 2 * n + 1), f) == iterate(op, op_dot_dot(m, n), (i : Num) => op(f(2 * i), f(2 * i + 1))))"),
      t599,
    ),
  )
}

///|
let iterate_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATE_PAIR")

///|
/// `ITERATE_PAIR`
pub fn iterate_pair() -> @kernel.Thm {
  iterate_pair_c.get()
}

///|
/// ITERATE_REFLECT
fn step_85() -> Unit raise {
  let t622 = @simp.rewrite_tac(
    @list.List([
      @theorems.unwind_thm2(),
      @int.arith_rule(
        @term_syntax.parse_term("((x : Num) == (n : Num) - (y : Num) && 0 <= y && y <= n - (m : Num)) == (y == n - x && x <= n && y <= n - m)"),
      ),
    ]),
  )
  let t621 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_image(), in_numseg()]),
  )
  let t620 = @list.List([
    @int.arith_tac,
    @tactics.disch_then(fn(
      x619 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x616 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s617 = @tactics.subst1_tac(x616)
        fn(
          x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s617(x618)
        }
      })(@equal.sym(x619))
    }),
  ])
  let t615 = @simp.rewrite_tac(@list.List([@trivia.o_def(), in_numseg()]))
  let t611 = @term_syntax.parse_type("A")
  let t612 = @drule.match_mp(
    @kernel.inst_type(
      @list.List([(@term_syntax.parse_type("X"), t611)]),
      iterate_image(),
    ),
  )
  let t606 = @term_syntax.parse_term("op_dot_dot(0, (n : Num) - (m : Num))")
  let t607 = @term_syntax.parse_term("(x : (Num) -> A)")
  let t608 = @list.List([@term_syntax.parse_term("(i : Num) => (n : Num) - i"), t607, t606])
  let t614 = @tactics.first_assum(fn(
    x613 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
        x603 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s604 = @tactics.mp_tac(x603)
        fn(
          x605 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s604(x605)
        }
      })(((x609 : @kernel.Thm) => @bool.ispecl(t608, x609))(x610))
    })(t612(x613))
  })
  let t601 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([numseg_empty(), @arith.not_lt()])),
  )
  let t602 = @list.List([
    @meson.asm_meson_tac(@list.List([iterate_clauses()])),
    t601,
  ])
  let t600 = @tactics.repeat_tac(@tactics.strip_tac)
  let t623 = @tactics.then_tac(
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
                          @simp.rewrite_tac(
                            @list.List([@equal.gsym(numseg_empty())]),
                          ),
                          t600,
                        ),
                        @class.cond_cases_tac,
                      ),
                      t602,
                    ),
                    t614,
                  ),
                  t615,
                ),
                @tactics.ants_tac,
              ),
              t620,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t621,
      ),
      t622,
    ),
    @int.asm_arith_tac,
  )
  iterate_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, monoidal(op) → (∀ x : (Num) -> A, ∀ m : Num, ∀ n : Num, iterate(op, op_dot_dot(m, n), x) == (if n < m { neutral(op) } else { iterate(op, op_dot_dot(0, n - m), (i : Num) => x(n - i)) }))"),
      t623,
    ),
  )
}

///|
let iterate_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_REFLECT",
)

///|
/// `ITERATE_REFLECT`
pub fn iterate_reflect() -> @kernel.Thm {
  iterate_reflect_c.get()
}

///|
/// iterato
fn step_86() -> Unit raise {
  let t657 = @meson.asm_meson_tac(@list.List([]))
  let t656 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_delete()]),
  )
  let t652 = @simp.rewrite_rule(
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t655 = @tactics.first_x_assum(fn(
    x654 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x653 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x649 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s650 = @tactics.mp_tac(x649)
        fn(
          x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s650(x651)
        }
      })(t652(x653))
    })(@bool.conjunct2(x654))
  })
  let t648 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t647 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("((p : Bool) && (q : Bool) && !(p && !(r : Bool) && q)) == (r && p && q)"),
      ),
    ]),
  )
  let t646 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.in_delete(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t645 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t644 = @simp.rewrite_tac(@list.List([@sets.psubset_alt()]))
  let t643 = @simp.asm_rewrite_tac(@list.List([]))
  let t642 = @tactics.match_mp_tac(@sets.card_psubset())
  let t641 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(i : _) | IN(i, DIFF((k : (_) -> Bool), {(a : _)})) && (P : (_) -> Bool)(i)} == DELETE({(i : _) | IN(i, k) && P(i)}, a)"),
      ),
    ]),
  )
  let t640 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t639 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t637 = @tactics.repeat_tac(@tactics.strip_tac)
  let t636 = @simp.rewrite_tac(@list.List([@wf.measure()]))
  let t634 = @bool.ispec(
    @term_syntax.parse_term("(k : (K) -> Bool) => CARD({(i : K) | IN(i, k) && IN((f : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))})"),
    @wf.wf_measure(),
  )
  let t635 = @tactics.match_mp_tac(@drule.match_mp(@wf.wf_rec())(t634))
  let t633 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.skolem_thm())]),
  )
  let t632 = @simp.gen_rewrite_tac(
    fn(
      x629 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s630 = @equal.binder_conv(x629)
      fn(x631 : @kernel.Term) -> @kernel.Thm raise { s630(x631) }
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t628 = @simp.rewrite_tac(@list.List([]))
  let t627 = @simp.gen_rewrite_tac(
    fn(
      x626 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x626
    },
    @list.List([@pair.exists_swap_fun_thm()]),
  )
  let t625 = @tactics.repeat_tac(@tactics.gen_tac)
  let t658 = @tactics.then_tac(
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
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.replicate_tac(
                                                          4,
                                                          @simp.once_rewrite_tac(
                                                            @list.List([
                                                              @equal.gsym(
                                                                @class.skolem_thm(),
                                                              ),
                                                            ]),
                                                          ),
                                                        ),
                                                        t625,
                                                      ),
                                                      t627,
                                                    ),
                                                    t628,
                                                  ),
                                                  t632,
                                                ),
                                                t633,
                                              ),
                                              @tactics.gen_tac,
                                            ),
                                            t635,
                                          ),
                                          t636,
                                        ),
                                        t637,
                                      ),
                                      @class.cond_cases_tac,
                                    ),
                                    t638,
                                  ),
                                  @pair.let_tac,
                                ),
                                t639,
                              ),
                              @tactics.ap_term_tac,
                            ),
                            t640,
                          ),
                          t641,
                        ),
                        t642,
                      ),
                      t643,
                    ),
                    t644,
                  ),
                  @tactics.conj_tac,
                ),
                t645,
              ),
              t646,
            ),
            t647,
          ),
          t648,
        ),
        t655,
      ),
      t656,
    ),
    t657,
  )
  let t659 = (
    @term_syntax.parse_term("∃ itty : ((A) -> Bool, A, (A, A) -> A, (K, K) -> Bool, (K) -> Bool, (K) -> A) -> A, ∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, itty(dom, neut, op, `<<=`, k, f) == (if FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && !({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))} == {}) { LET((i : K) => LET_END(op(f(i), itty(dom, neut, op, `<<=`, {(j : K) | IN(j, DELETE(k, i)) && IN(f(j), DIFF(dom, {neut}))}, f))), if (∃ i : K, IN(i, k) && IN(f(i), DIFF(dom, {neut})) && (∀ j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) → j == i)) { select((i : K) => IN(i, k) && IN(f(i), DIFF(dom, {neut})) && (∀ j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) → j == i)) } else { select((i : K) => IN(i, k) && IN(f(i), DIFF(dom, {neut}))) }) } else { neut })"),
    t658,
  )
  let t660 = @nums.new_specification(@list.List(["iterato"]))
  iterato_c.set(
    t660(
      (fn(
        x624 : (
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
        @tactics.prove(x624.0, x624.1)
      })(t659),
    ),
  )
}

///|
let iterato_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iterato")

///|
/// `iterato`
pub fn iterato() -> @kernel.Thm {
  iterato_c.get()
}

///|
/// ITERATO_SUPPORT
fn step_87() -> Unit raise {
  let t666 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t665 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t664 = @simp.asm_rewrite_tac(@list.List([]))
  let t663 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t662 = @simp.rewrite_tac(
    @list.List([
      @theorems.conj_assoc(),
      @sets.set_rule(
        @term_syntax.parse_term("(IN((y : _), {(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}) && P(y)) == IN(y, {(x : _) | IN(x, s) && P(x)})"),
      ),
    ]),
  )
  let t661 = @simp.once_rewrite_tac(@list.List([iterato()]))
  let t667 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t661,
                      ),
                      t662,
                    ),
                    t663,
                  ),
                  @class.cond_cases_tac,
                ),
                t664,
              ),
              @pair.let_tac,
            ),
            t665,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t666,
  )
  iterato_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, iterato(dom, neut, op, `<<=`, {(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}, f) == iterato(dom, neut, op, `<<=`, k, f)"),
      t667,
    ),
  )
}

///|
let iterato_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_SUPPORT",
)

///|
/// `ITERATO_SUPPORT`
pub fn iterato_support() -> @kernel.Thm {
  iterato_support_c.get()
}

///|
/// ITERATO_EXPAND_CASES
fn step_88() -> Unit raise {
  let t671 = @simp.asm_rewrite_tac(@list.List([]))
  let t672 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x668 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s669 = @equal.land_conv(x668)
        fn(x670 : @kernel.Term) -> @kernel.Thm raise { s669(x670) }
      },
      @list.List([iterato()]),
    ),
    t671,
  )
  let t673 = @list.List([
    @simp.rewrite_tac(@list.List([iterato_support()])),
    t672,
  ])
  let t674 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.repeat_tac(@tactics.gen_tac),
      @class.cond_cases_tac,
    ),
    t673,
  )
  iterato_expand_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, iterato(dom, neut, op, `<<=`, k, f) == (if FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) { iterato(dom, neut, op, `<<=`, {(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}, f) } else { neut })"),
      t674,
    ),
  )
}

///|
let iterato_expand_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_EXPAND_CASES",
)

///|
/// `ITERATO_EXPAND_CASES`
pub fn iterato_expand_cases() -> @kernel.Thm {
  iterato_expand_cases_c.get()
}

///|
/// ITERATO_CLAUSES_GEN
fn step_89() -> Unit raise {
  let t737 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t736 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert()]))
  let t735 = @class.asm_cases_tac(@term_syntax.parse_term("(j : K) == (i : K)"))
  let t734 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t733 = @simp.simp_tac(@list.List([]))
  let t732 = @simp.rewrite_tac(@list.List([]))
  let t731 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : K)"))
  let t730 = @tactics.match_mp_tac(@class.select_unique())
  let t728 = @simp.rewrite_tac(@list.List([iterato_support()]))
  let t727 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((i : _), (k : (_) -> Bool)) → DELETE(INSERT(i, k), i) == k"),
      ),
    ]),
  )
  let t729 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv)),
        t727,
      ),
      t728,
    ),
  ])
  let t726 = @tactics.subgoal_then(
    @term_syntax.parse_term("select((i' : K) => IN(i', INSERT((i : K), (k : (K) -> Bool))) && IN((f : (K) -> A)(i'), DIFF((dom : (A) -> Bool), {(neut : A)})) && (∀ j : K, (op_lt_lt_eq : (K, K) -> Bool)(j, i') && IN(j, INSERT(i, k)) && IN(f(j), DIFF(dom, {neut})) → j == i')) == i"),
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
      let s724 = @tactics.subst1_tac(x723)
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
  )
  let t720 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t718 = @simp.rewrite_rule(@list.List([@class.not_exists_thm()]))
  let t715 = @term_syntax.parse_term("(i : K)")
  let t721 = @tactics.then_tac(
    @tactics.first_x_assum(fn(
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
      (fn(
        x717 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x712 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s713 = @tactics.mp_tac(x712)
          fn(
            x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s713(x714)
          }
        })(((x716 : @kernel.Thm) => @bool.spec(t715, x716))(x717))
      })(t718(x719))
    }),
    t720,
  )
  let t722 = @list.List([
    @tactics.first_x_assum(fn(
      x711 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x706 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(
        ((x710 : @kernel.Thm) => {
          @lib.check(
            fn(x709 : @kernel.Thm) -> Bool raise {
              (fn(x707 : @kernel.Term) -> Bool raise { @basics.is_exists(x707) })(
                (fn(x708 : @kernel.Thm) -> @kernel.Term raise {
                  @kernel.concl(x708)
                })(x709),
              )
            },
            x710,
          )
        })(x711),
      )
    }),
    t721,
  ])
  let t703 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t702 = @simp.asm_rewrite_tac(@list.List([@sets.finite_insert()]))
  let t701 = @tactics.exists_tac(
    @term_syntax.parse_term("INSERT((i : K), {(j : K) | IN(j, (k : (K) -> Bool)) && IN((f : (K) -> A)(j), DIFF((dom : (A) -> Bool), {(neut : A)}))})"),
  )
  let t704 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t701),
      t702,
    ),
    t703,
  )
  let t705 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    t704,
    @tactics.all_tac,
  ])
  let t700 = @tactics.repeat_tac(@tactics.conj_tac)
  let t699 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(q : Bool) && (p : Bool) && (x : _) == (z : _) → (if p && q { x } else { (y : _) }) == z"),
    ),
  )
  let t696 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t697 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@equal.gsym(iterato_support())])),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t696,
  )
  let t695 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t692 = @simp.gen_rewrite_rule(
    fn(
      x691 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x691
    },
    @list.List([@sets.in_diff()]),
  )
  let t694 = @tactics.first_x_assum(fn(
    x693 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x688 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s689 = @tactics.mp_tac(x688)
      fn(
        x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s689(x690)
      }
    })(t692(x693))
  })
  let t698 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x685 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s686 = @equal.land_conv(x685)
              fn(x687 : @kernel.Term) -> @kernel.Thm raise { s686(x687) }
            },
            @list.List([iterato()]),
          ),
          t694,
        ),
        t695,
      ),
      @tactics.strip_tac,
    ),
    t697,
  ])
  let t684 = @simp.rewrite_tac(@list.List([@class.cond_swap()]))
  let t683 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(IN((x : _), (dom : (_) -> Bool)) → x == (a : _)) == !IN(x, DIFF(dom, {a}))"),
      ),
    ]),
  )
  let t682 = @simp.asm_simp_tac(
    @list.List([
      @class.cond_swap(),
      @sets.set_rule(@term_syntax.parse_term("IN((i : _), (k : (_) -> Bool)) → INSERT(i, k) == k")),
    ]),
  )
  let t681 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : K), (k : (K) -> Bool))"))
  let t679 = @tactics.then_tac(
    @tactics.repeat_tac(@tactics.gen_tac),
    @tactics.strip_tac,
  )
  let t678 = @simp.asm_rewrite_tac(
    @list.List([@sets.not_in_empty(), @sets.empty_gspec()]),
  )
  let t680 = @list.List([
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x675 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s676 = @equal.land_conv(x675)
          fn(x677 : @kernel.Term) -> @kernel.Thm raise { s676(x677) }
        },
        @list.List([iterato()]),
      ),
      t678,
    ),
    t679,
  ])
  let t738 = @tactics.then_tac(
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
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.thenl(
                                                @tactics.then_tac(
                                                  @tactics.repeat_tac(
                                                    @tactics.gen_tac,
                                                  ),
                                                  @tactics.conj_tac,
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
                                      @class.cond_cases_tac,
                                    ),
                                    t698,
                                  ),
                                  t699,
                                ),
                                t700,
                              ),
                              t705,
                            ),
                            @class.cond_cases_tac,
                          ),
                          t722,
                        ),
                        t726,
                      ),
                      t729,
                    ),
                    t730,
                  ),
                  t731,
                ),
                t732,
              ),
              @tactics.eq_tac,
            ),
            t733,
          ),
          t734,
        ),
        t735,
      ),
      t736,
    ),
    t737,
  )
  iterato_clauses_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (∀ i : K, ∀ k : (K) -> Bool, FINITE({(j : K) | IN(j, k) && IN(f(j), DIFF(dom, {neut}))}) && (∀ j : K, IN(j, k) → i == j || `<<=`(i, j) || `<<=`(j, i)) && (∀ j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) → j == i) → iterato(dom, neut, op, `<<=`, INSERT(i, k), f) == (if IN(f(i), dom) → f(i) == neut || IN(i, k) { iterato(dom, neut, op, `<<=`, k, f) } else { op(f(i), iterato(dom, neut, op, `<<=`, k, f)) }))"),
      t738,
    ),
  )
}

///|
let iterato_clauses_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_CLAUSES_GEN",
)

///|
/// `ITERATO_CLAUSES_GEN`
pub fn iterato_clauses_gen() -> @kernel.Thm {
  iterato_clauses_gen_c.get()
}

///|
/// ITERATO_CLAUSES
fn step_90() -> Unit raise {
  let t741 = @meson.asm_meson_tac(@list.List([]))
  let t740 = @tactics.match_mp_tac(
    @bool.conjunct2(@bool.spec_all(iterato_clauses_gen())),
  )
  let t739 = @simp.rewrite_tac(@list.List([iterato_clauses_gen()]))
  let t742 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t739),
      t740,
    ),
    t741,
  )
  iterato_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (∀ i : K, ∀ k : (K) -> Bool, FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && (∀ j : K, IN(j, k) → `<<=`(i, j) && !`<<=`(j, i)) → iterato(dom, neut, op, `<<=`, INSERT(i, k), f) == (if IN(f(i), dom) → f(i) == neut || IN(i, k) { iterato(dom, neut, op, `<<=`, k, f) } else { op(f(i), iterato(dom, neut, op, `<<=`, k, f)) }))"),
      t742,
    ),
  )
}

///|
let iterato_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_CLAUSES",
)

///|
/// `ITERATO_CLAUSES`
pub fn iterato_clauses() -> @kernel.Thm {
  iterato_clauses_c.get()
}

///|
/// ITERATO_CLAUSES_EXISTS
fn step_91() -> Unit raise {
  let t786 = @simp.simp_tac(@list.List([]))
  let t785 = @simp.asm_rewrite_tac(@list.List([]))
  let t784 = @tactics.first_x_assum(fn(
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
    (fn(
      x780 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s781 = @tactics.mp_tac(x780)
      fn(
        x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s781(x782)
      }
    })(@class.select_rule(x783))
  })
  let t779 = @list.List([
    @tactics.disch_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t778 = @simp.rewrite_tac(@list.List([]))
  let t775 = @drule.match_mp(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(t : _) == (i : _) → (t == i → (P : (_) -> Bool)(i)) → (∃ j : _, P(j))"),
    ),
  )
  let t777 = @tactics.first_x_assum(fn(
    x776 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t775(x776))
  })
  let t774 = @simp.gen_rewrite_tac(
    fn(
      x773 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x766 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s767 = @equal.binder_conv(x766)
        fn(x768 : @kernel.Term) -> @kernel.Thm raise { s767(x768) }
      })(
        ((x772 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            4,
            fn(
              x769 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s770 = @equal.rand_conv(x769)
              fn(x771 : @kernel.Term) -> @kernel.Thm raise { s770(x771) }
            },
            x772,
          )
        })(x773),
      )
    },
    @list.List([@equal.gsym(iterato_support())]),
  )
  let t765 = @simp.asm_rewrite_tac(@list.List([]))
  let t764 = @simp.gen_rewrite_tac(
    fn(
      x763 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x759 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x755 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x749 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s750 = @equal.binder_conv(x749)
            fn(x751 : @kernel.Term) -> @kernel.Thm raise { s750(x751) }
          })(
            (fn(
              x752 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s753 = @equal.rand_conv(x752)
              fn(x754 : @kernel.Term) -> @kernel.Thm raise { s753(x754) }
            })(x755),
          )
        })(
          (fn(
            x756 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s757 = @equal.rand_conv(x756)
            fn(x758 : @kernel.Term) -> @kernel.Thm raise { s757(x758) }
          })(x759),
        )
      })(
        (fn(
          x760 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s761 = @equal.land_conv(x760)
          fn(x762 : @kernel.Term) -> @kernel.Thm raise { s761(x762) }
        })(x763),
      )
    },
    @list.List([iterato()]),
  )
  let t747 = @tactics.then_tac(
    @tactics.repeat_tac(@tactics.gen_tac),
    @tactics.strip_tac,
  )
  let t746 = @simp.asm_rewrite_tac(
    @list.List([@sets.not_in_empty(), @sets.empty_gspec()]),
  )
  let t748 = @list.List([
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x743 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s744 = @equal.land_conv(x743)
          fn(x745 : @kernel.Term) -> @kernel.Thm raise { s744(x745) }
        },
        @list.List([iterato()]),
      ),
      t746,
    ),
    t747,
  ])
  let t787 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            @tactics.conj_tac,
                          ),
                          t748,
                        ),
                        t764,
                      ),
                      t765,
                    ),
                    @pair.let_tac,
                  ),
                  t774,
                ),
                t777,
              ),
              t778,
            ),
            @class.cond_cases_tac,
          ),
          t779,
        ),
        t784,
      ),
      t785,
    ),
    t786,
  )
  iterato_clauses_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (∀ k : (K) -> Bool, FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && !({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))} == {}) → (∃ i : K, IN(i, k) && IN(f(i), DIFF(dom, {neut})) && iterato(dom, neut, op, `<<=`, k, f) == op(f(i), iterato(dom, neut, op, `<<=`, DELETE(k, i), f))))"),
      t787,
    ),
  )
}

///|
let iterato_clauses_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_CLAUSES_EXISTS",
)

///|
/// `ITERATO_CLAUSES_EXISTS`
pub fn iterato_clauses_exists() -> @kernel.Thm {
  iterato_clauses_exists_c.get()
}

///|
/// ITERATO_EQ
fn step_92() -> Unit raise {
  let t844 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t843 = @tactics.match_mp_tac(@sets.card_psubset())
  let t842 = @tactics.first_x_assum(fn(
    x837 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x837
    @simp.gen_rewrite_tac(
      fn(
        x839 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s840 = @equal.rand_conv(x839)
        fn(x841 : @kernel.Term) -> @kernel.Thm raise { s840(x841) }
      },
      @list.List([@equal.sym(th)]),
    )
  })
  let t836 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(
        @theorems.unwind_thm1(),
      ),
    ]),
  )
  let t835 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_delete(),
      @sets.finite_restrict(),
      @sets.in_delete(),
      @sets.in_elim_thm(),
    ]),
  )
  let t834 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t833 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(j : _) | IN(j, DELETE((s : (_) -> Bool), (i : _))) && (P : (_) -> Bool)(j)} == DELETE({(j : _) | IN(j, s) && P(j)}, i)"),
      ),
    ]),
  )
  let t832 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t830 = @meson.meson_tac(@list.List([]))
  let t829 = @tactics.first_x_assum(fn(
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
    (fn(
      x825 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s826 = @tactics.mp_tac(x825)
      fn(
        x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s826(x827)
      }
    })(@bool.conjunct2(x828))
  })
  let t824 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()]),
    ),
  )
  let t831 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("i"), t824), t829),
      t830,
    ),
    @tactics.all_tac,
  ])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("IN((i : K), (k : (K) -> Bool))"), fn(
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
    let s821 = @tactics.assume_tac(x820)
    fn(
      x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s821(x822)
    }
  })
  let t819 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t818 = @simp.asm_rewrite_tac(@list.List([]))
  let t817 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@theorems.conj_assoc())]),
  )
  let t815 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t816 = @list.List([@meson.asm_meson_tac(@list.List([])), t815])
  let t814 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ i : K, (IN(i, (k : (K) -> Bool)) && IN((f : (K) -> A)(i), s)) == (IN(i, k) && IN((g : (K) -> A)(i), s))"),
    fn(
      x811 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s812 = @tactics.assume_tac(x811)
      fn(
        x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s812(x813)
      }
    },
  )
  let t810 = @simp.once_rewrite_tac(@list.List([iterato()]))
  let t809 = @simp.asm_rewrite_tac(@list.List([iterato_clauses_exists()]))
  let t808 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (K) -> Bool) == {}"))
  let t807 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @theorems.imp_imp(),
        @theorems.right_imp_forall_thm(),
        @equal.gsym(@theorems.conj_assoc()),
      ]),
    ),
  )
  let t806 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (K) -> Bool)"))
  let t805 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t804 = @tactics.match_mp_tac(@arith.num_wf())
  let t803 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t802 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ n : Num, ∀ k : (_) -> Bool, FINITE(k) && CARD(k) == n → (P : ((_) -> Bool) -> Bool)(k)) → (∀ k : (_) -> Bool, FINITE(k) → P(k))"),
    ),
  )
  let t801 = @tactics.pop_assum_list(fn(
    x800 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t798 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t799 = @tactics.spec_tac(
    @term_syntax.parse_term("{(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}"),
    t798,
  )
  let t797 = @tactics.undisch_tac(
    @term_syntax.parse_term("FINITE({(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))})"),
  )
  let t796 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t795 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : K, IN(i, {(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}) → (f : (K) -> A)(i) == g(i)"),
    fn(
      x792 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s793 = @tactics.mp_tac(x792)
      fn(
        x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s793(x794)
      }
    },
  )
  let t791 = @simp.asm_rewrite_tac(@list.List([]))
  let t790 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t789 = @simp.asm_simp_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == !(p → !q)"))]),
  )
  let t788 = @simp.once_rewrite_tac(@list.List([iterato_expand_cases()]))
  let t845 = @tactics.then_tac(
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
                                                                  @tactics.thenl(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.then_tac(
                                                                          @tactics.then_tac(
                                                                            @tactics.then_tac(
                                                                              @tactics.then_tac(
                                                                                @tactics.repeat_tac(
                                                                                  @tactics.strip_tac,
                                                                                ),
                                                                                t788,
                                                                              ),
                                                                              t789,
                                                                            ),
                                                                            t790,
                                                                          ),
                                                                          @class.cond_cases_tac,
                                                                        ),
                                                                        t791,
                                                                      ),
                                                                      t795,
                                                                    ),
                                                                    t796,
                                                                  ),
                                                                  t797,
                                                                ),
                                                                t799,
                                                              ),
                                                              t801,
                                                            ),
                                                            t802,
                                                          ),
                                                          t803,
                                                        ),
                                                        t804,
                                                      ),
                                                      t805,
                                                    ),
                                                    @tactics.disch_tac,
                                                  ),
                                                  t806,
                                                ),
                                                @tactics.strip_tac,
                                              ),
                                              t807,
                                            ),
                                            t808,
                                          ),
                                          t809,
                                        ),
                                        t810,
                                      ),
                                      t814,
                                    ),
                                    t816,
                                  ),
                                  t817,
                                ),
                                @class.cond_cases_tac,
                              ),
                              t818,
                            ),
                            @pair.let_tac,
                          ),
                          t819,
                        ),
                        t823,
                      ),
                      t831,
                    ),
                    @tactics.binop_tac,
                  ),
                  t832,
                ),
                t833,
              ),
              t834,
            ),
            t835,
          ),
          t836,
        ),
        t842,
      ),
      t843,
    ),
    t844,
  )
  iterato_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, ∀ g : (K) -> A, (∀ i : K, IN(i, k) → f(i) == g(i)) → iterato(dom, neut, op, `<<=`, k, f) == iterato(dom, neut, op, `<<=`, k, g)"),
      t845,
    ),
  )
}

///|
let iterato_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATO_EQ")

///|
/// `ITERATO_EQ`
pub fn iterato_eq() -> @kernel.Thm {
  iterato_eq_c.get()
}

///|
/// ITERATO_INDUCT
fn step_93() -> Unit raise {
  let t894 = @meson.asm_meson_tac(@list.List([@sets.card_eq_0()]))
  let t893 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)"))]),
  )
  let t892 = @simp.asm_simp_tac(
    @list.List([@sets.card_delete(), @sets.finite_delete(), @sets.in_delete()]),
  )
  let t891 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - 1"))
  let t890 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t889 = @simp.asm_rewrite_tac(@list.List([]))
  let t888 = @tactics.first_assum(@tactics.match_mp_tac)
  let t887 = @tactics.first_x_assum(fn(
    x884 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s885 = @tactics.subst1_tac(x884)
    fn(
      x886 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s885(x886)
    }
  })
  let t883 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t881 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(i : K)"))(fn(
      x878 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s879 = @tactics.mp_tac(x878)
      fn(
        x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s879(x880)
      }
    }),
  )
  let t877 = @simp.asm_rewrite_tac(@list.List([iterato_clauses_exists()]))
  let t876 = @simp.simp_tac(@list.List([]))
  let t882 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@equal.gsym(iterato_support())])),
        t876,
      ),
      t877,
    ),
    t881,
  ])
  let t875 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (r : Bool)) && ((q : Bool) → r) → (!p → q) → r"),
    ),
  )
  let t874 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t869 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t873 = @tactics.disch_then(fn(
    x872 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x871 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x866 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s867 = @tactics.mp_tac(x866)
        fn(
          x868 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s867(x868)
        }
      })(((x870 : @kernel.Thm) => @bool.spec(t869, x870))(x871))
    })(@bool.conjunct2(x872))
  })
  let t861 = @term_syntax.parse_term("(f : (K) -> A)")
  let t862 = @term_syntax.parse_term("(op_lt_lt_eq : (K, K) -> Bool)")
  let t863 = @term_syntax.parse_term("(op : (A, A) -> A)")
  let t864 = @term_syntax.parse_term("(neut : A)")
  let t865 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(dom : (A) -> Bool)"), t864, t863, t862, t861]),
      iterato_clauses_exists(),
    ),
  )
  let t860 = @simp.asm_rewrite_tac(@list.List([iterato_clauses_exists()]))
  let t859 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (K) -> Bool) == {}"))
  let t858 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @theorems.imp_imp(),
        @theorems.right_imp_forall_thm(),
        @equal.gsym(@theorems.conj_assoc()),
      ]),
    ),
  )
  let t857 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (K) -> Bool)"))
  let t856 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t855 = @tactics.match_mp_tac(@arith.num_wf())
  let t854 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t853 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ n : Num, ∀ k : (_) -> Bool, FINITE(k) && CARD(k) == n → (P : ((_) -> Bool) -> Bool)(k)) → (∀ k : (_) -> Bool, FINITE(k) → P(k))"),
    ),
  )
  let t851 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t852 = @tactics.spec_tac(
    @term_syntax.parse_term("{(i : K) | IN(i, (k : (K) -> Bool)) && IN((f : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}"),
    t851,
  )
  let t850 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) && (p : Bool) → (if (q : Bool) { (r : Bool) } else { true })) == (a → q → p → r)"),
      ),
    ]),
  )
  let t849 = @simp.simp_tac(@list.List([]))
  let t848 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t847 = @simp.once_rewrite_tac(@list.List([iterato_expand_cases()]))
  let t846 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(IN((i : _), (k : (_) -> Bool)) && IN((f : (_) -> _)(i), (s : (_) -> Bool)) && !(f(i) == (z : _)) && (Q : Bool)) == (IN(i, {(j : _) | IN(j, k) && IN(f(j), DIFF(s, {z}))}) && Q)"),
      ),
    ]),
  )
  let t895 = @tactics.then_tac(
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
                                                                    t846,
                                                                  ),
                                                                  t847,
                                                                ),
                                                                t848,
                                                              ),
                                                              t849,
                                                            ),
                                                            t850,
                                                          ),
                                                          @tactics.strip_tac,
                                                        ),
                                                        t852,
                                                      ),
                                                      t853,
                                                    ),
                                                    t854,
                                                  ),
                                                  t855,
                                                ),
                                                t856,
                                              ),
                                              @tactics.disch_tac,
                                            ),
                                            t857,
                                          ),
                                          @tactics.strip_tac,
                                        ),
                                        t858,
                                      ),
                                      t859,
                                    ),
                                    t860,
                                  ),
                                  t865,
                                ),
                                t873,
                              ),
                              t874,
                            ),
                            t875,
                          ),
                          @tactics.conj_tac,
                        ),
                        t882,
                      ),
                      t883,
                    ),
                    @tactics.strip_tac,
                  ),
                  t887,
                ),
                t888,
              ),
              t889,
            ),
            t890,
          ),
          t891,
        ),
        t892,
      ),
      t893,
    ),
    t894,
  )
  iterato_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, ∀ P : (A) -> Bool, P(neut) && (∀ i : K, ∀ x : A, IN(i, k) && IN(f(i), dom) && !(f(i) == neut) && P(x) → P(op(f(i), x))) → P(iterato(dom, neut, op, `<<=`, k, f))"),
      t895,
    ),
  )
}

///|
let iterato_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATO_INDUCT")

///|
/// `ITERATO_INDUCT`
pub fn iterato_induct() -> @kernel.Thm {
  iterato_induct_c.get()
}

///|
/// ITERATO_CLOSED
fn step_94() -> Unit raise {
  let t897 = @simp.asm_simp_tac(@list.List([]))
  let t896 = @tactics.match_mp_tac(iterato_induct())
  let t898 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t896),
    t897,
  )
  iterato_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, ∀ k : (K) -> Bool, ∀ f : (K) -> A, ∀ P : (A) -> Bool, P(neut) && (∀ x : A, ∀ y : A, P(x) && P(y) → P(op(x, y))) && (∀ i : K, IN(i, k) && IN(f(i), dom) && !(f(i) == neut) → P(f(i))) → P(iterato(dom, neut, op, `<<=`, k, f))"),
      t898,
    ),
  )
}

///|
let iterato_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITERATO_CLOSED")

///|
/// `ITERATO_CLOSED`
pub fn iterato_closed() -> @kernel.Thm {
  iterato_closed_c.get()
}

///|
/// ITERATO_ITERATE
fn step_95() -> Unit raise {
  let t971 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("IN((i : _), (k : (_) -> Bool)) → INSERT(i, DELETE(k, i)) == k")),
    ]),
  )
  let t970 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_delete(), @sets.in_delete()]),
  )
  let t967 = @drule.match_mp(iterate_clauses())
  let t961 = @term_syntax.parse_term("DELETE((k : (K) -> Bool), (i : K))")
  let t962 = @term_syntax.parse_term("(i : K)")
  let t963 = @list.List([@term_syntax.parse_term("(f : (K) -> A)"), t962, t961])
  let t969 = @tactics.first_x_assum(fn(
    x968 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x966 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x965 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x958 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s959 = @tactics.mp_tac(x958)
          fn(
            x960 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s959(x960)
          }
        })(((x964 : @kernel.Thm) => @bool.ispecl(t963, x964))(x965))
      })(@bool.conjunct2(x966))
    })(t967(x968))
  })
  let t956 = @tactics.disch_then(fn(
    x953 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s954 = @tactics.subst1_tac(x953)
    fn(
      x955 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s954(x955)
    }
  })
  let t957 = @list.List([
    @meson.asm_meson_tac(@list.List([@sets.card_eq_0()])),
    t956,
  ])
  let t952 = @simp.asm_simp_tac(
    @list.List([@sets.finite_delete(), @sets.card_delete()]),
  )
  let t951 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)"))]),
  )
  let t946 = @term_syntax.parse_term("DELETE((k : (K) -> Bool), (i : K))")
  let t947 = @list.List([@term_syntax.parse_term("(n : Num) - 1"), t946])
  let t950 = @tactics.first_x_assum(fn(
    x949 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x943 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s944 = @tactics.mp_tac(x943)
      fn(
        x945 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s944(x945)
      }
    })(((x948 : @kernel.Thm) => @bool.specl(t947, x948))(x949))
  })
  let t942 = @tactics.first_x_assum(fn(
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
    let s940 = @tactics.subst1_tac(x939)
    fn(
      x941 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s940(x941)
    }
  })
  let t938 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t936 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(i : K)"))(fn(
      x933 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s934 = @tactics.mp_tac(x933)
      fn(
        x935 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s934(x935)
      }
    }),
  )
  let t932 = @simp.asm_simp_tac(
    @list.List([iterate_clauses(), iterato_clauses_exists()]),
  )
  let t931 = @simp.rewrite_tac(
    @list.List([support(), @sets.in_univ(), @sets.in_diff(), @sets.in_sing()]),
  )
  let t930 = @equal.gsym(iterate_support())
  let t937 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(
          @list.List([@equal.gsym(iterato_support()), t930]),
        ),
        t931,
      ),
      t932,
    ),
    t936,
  ])
  let t929 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (r : Bool)) && ((q : Bool) → r) → (!p → q) → r"),
    ),
  )
  let t928 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t923 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t927 = @tactics.disch_then(fn(
    x926 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x925 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x920 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s921 = @tactics.mp_tac(x920)
        fn(
          x922 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s921(x922)
        }
      })(((x924 : @kernel.Thm) => @bool.spec(t923, x924))(x925))
    })(@bool.conjunct2(x926))
  })
  let t915 = @term_syntax.parse_term("(f : (K) -> A)")
  let t916 = @term_syntax.parse_term("(op_lt_lt_eq : (K, K) -> Bool)")
  let t917 = @term_syntax.parse_term("(op : (A, A) -> A)")
  let t918 = @term_syntax.parse_term("neutral((op : (A, A) -> A))")
  let t919 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(UNIV : (A) -> Bool)"), t918, t917, t916, t915]),
      iterato_clauses_exists(),
    ),
  )
  let t914 = @simp.asm_simp_tac(
    @list.List([iterate_clauses(), iterato_clauses_exists()]),
  )
  let t913 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (K) -> Bool) == {}"))
  let t912 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @theorems.imp_imp(),
        @theorems.right_imp_forall_thm(),
        @equal.gsym(@theorems.conj_assoc()),
      ]),
    ),
  )
  let t911 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (K) -> Bool)"))
  let t910 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t909 = @tactics.match_mp_tac(@arith.num_wf())
  let t908 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t907 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ n : Num, ∀ k : (_) -> Bool, FINITE(k) && CARD(k) == n → (P : ((_) -> Bool) -> Bool)(k)) → (∀ k : (_) -> Bool, FINITE(k) → P(k))"),
    ),
  )
  let t905 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t906 = @tactics.spec_tac(
    @term_syntax.parse_term("{(i : K) | IN(i, (k : (K) -> Bool)) && !((f : (K) -> A)(i) == neutral((op : (A, A) -> A)))}"),
    t905,
  )
  let t904 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("((p : Bool) → (x : _) == (y : _)) → (if p { x } else { (z : _) }) == (if p { y } else { z })"),
    ),
  )
  let t903 = @simp.rewrite_tac(
    @list.List([support(), @sets.in_univ(), @sets.in_diff(), @sets.in_sing()]),
  )
  let t902 = @simp.once_rewrite_tac(
    @list.List([iterate_expand_cases(), iterato_expand_cases()]),
  )
  let t900 = @term_syntax.parse_term("(f : (K) -> A)")
  let t901 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k : (K) -> Bool)"), t900]),
  )
  let t899 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t972 = @tactics.then_tac(
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
                                                                    t899,
                                                                  ),
                                                                  t901,
                                                                ),
                                                                t902,
                                                              ),
                                                              t903,
                                                            ),
                                                            t904,
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
                                                @tactics.disch_tac,
                                              ),
                                              t911,
                                            ),
                                            @tactics.strip_tac,
                                          ),
                                          t912,
                                        ),
                                        t913,
                                      ),
                                      t914,
                                    ),
                                    t919,
                                  ),
                                  t927,
                                ),
                                t928,
                              ),
                              t929,
                            ),
                            @tactics.conj_tac,
                          ),
                          t937,
                        ),
                        t938,
                      ),
                      @tactics.strip_tac,
                    ),
                    t942,
                  ),
                  t950,
                ),
                t951,
              ),
              t952,
            ),
            @tactics.ants_tac,
          ),
          t957,
        ),
        t969,
      ),
      t970,
    ),
    t971,
  )
  iterato_iterate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (A, A) -> A, ∀ `<<=` : (K, K) -> Bool, monoidal(op) → iterato(UNIV, neutral(op), op, `<<=`) == iterate(op)"),
      t972,
    ),
  )
}

///|
let iterato_iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_ITERATE",
)

///|
/// `ITERATO_ITERATE`
pub fn iterato_iterate() -> @kernel.Thm {
  iterato_iterate_c.get()
}

///|
/// ITERATO_CLAUSES_NUMSEG_LEFT
fn step_96() -> Unit raise {
  let t997 = @simp.rewrite_tac(
    @list.List([
      in_numseg(),
      @int.arith_rule(@term_syntax.parse_term("!((m : Num) + 1 <= m)")),
    ]),
  )
  let t998 = @list.List([
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([@sets.finite_restrict(), finite_numseg(), in_numseg()]),
      ),
      @int.arith_tac,
    ),
    t997,
  ])
  let t991 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, (n : Num))")
  let t992 = @list.List([@term_syntax.parse_term("(m : Num)"), t991])
  let t996 = @tactics.disch_then(fn(
    x995 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x994 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x988 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s989 = @tactics.mp_tac(x988)
        fn(
          x990 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s989(x990)
        }
      })(((x993 : @kernel.Thm) => @bool.specl(t992, x993))(x994))
    })(@bool.conjunct2(x995))
  })
  let t985 = @meson.asm_meson_tac(@list.List([numseg_empty(), @arith.not_le()]))
  let t986 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x984 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x981 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s982 = @tactics.mp_tac(x981)
        fn(
          x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s982(x983)
        }
      })(@bool.conjunct1(x984))
    }),
    t985,
  )
  let t987 = @list.List([
    @tactics.disch_then(fn(
      x978 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x978
      let t980 = @tactics.mp_tac(th)
      @tactics.then_tac(
        @simp.asm_simp_tac(@list.List([@equal.gsym(numseg_lrec())])),
        t980,
      )
    }),
    t986,
  ])
  let t973 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t974 = @term_syntax.parse_term("op_lt_eq")
  let t975 = @term_syntax.parse_term("(op : (A, A) -> A)")
  let t976 = @term_syntax.parse_term("(neut : A)")
  let t977 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(dom : (A) -> Bool)"), t976, t975, t974, t973]),
      iterato_clauses_gen(),
    ),
  )
  let t999 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t977),
            @class.cond_cases_tac,
          ),
          t987,
        ),
        t996,
      ),
      @tactics.ants_tac,
    ),
    t998,
  )
  iterato_clauses_numseg_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ dom : (A) -> Bool, ∀ neut : A, ∀ op : (A, A) -> A, ∀ f : (Num) -> A, ∀ m : Num, ∀ n : Num, iterato(dom, neut, op, op_lt_eq, op_dot_dot(m, n), f) == (if m <= n { if IN(f(m), dom) → f(m) == neut { iterato(dom, neut, op, op_lt_eq, op_dot_dot(m + 1, n), f) } else { op(f(m), iterato(dom, neut, op, op_lt_eq, op_dot_dot(m + 1, n), f)) } } else { neut })"),
      t999,
    ),
  )
}

///|
let iterato_clauses_numseg_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATO_CLAUSES_NUMSEG_LEFT",
)

///|
/// `ITERATO_CLAUSES_NUMSEG_LEFT`
pub fn iterato_clauses_numseg_left() -> @kernel.Thm {
  iterato_clauses_numseg_left_c.get()
}

///|
/// nproduct
fn step_97() -> Unit raise {
  nproduct_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nproduct : ((A) -> Bool, (A) -> Num) -> Num) == iterate(op_star)"),
    ),
  )
}

///|
let nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nproduct")

///|
/// `nproduct`
pub fn nproduct() -> @kernel.Thm {
  nproduct_c.get()
}

///|
/// NEUTRAL_MUL
fn step_98() -> Unit raise {
  let t1001 = @meson.meson_tac(
    @list.List([@arith.mult_clauses(), @arith.mult_eq_1()]),
  )
  let t1000 = @tactics.match_mp_tac(@class.select_unique())
  let t1002 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1000),
    t1001,
  )
  neutral_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("neutral(op_star) == 1"),
      t1002,
    ),
  )
}

///|
let neutral_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_MUL")

///|
/// `NEUTRAL_MUL`
pub fn neutral_mul() -> @kernel.Thm {
  neutral_mul_c.get()
}

///|
/// MONOIDAL_MUL
fn step_99() -> Unit raise {
  let t1003 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_mul()])),
    @int.arith_tac,
  )
  monoidal_mul_c.set(
    @tactics.prove(@term_syntax.parse_term("monoidal(op_star)"), t1003),
  )
}

///|
let monoidal_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_MUL")

///|
/// `MONOIDAL_MUL`
pub fn monoidal_mul() -> @kernel.Thm {
  monoidal_mul_c.get()
}

///|
/// NPRODUCT_CLAUSES
fn step_100() -> Unit raise {
  let t1006 = @simp.rewrite_tac(@list.List([monoidal_mul()]))
  let t1005 = @tactics.match_mp_tac(iterate_clauses())
  let t1004 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1007 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([nproduct(), @equal.gsym(neutral_mul())])),
        t1004,
      ),
      t1005,
    ),
    t1006,
  )
  nproduct_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Num, nproduct({}, f) == 1) && (∀ x : B, ∀ f : (B) -> Num, ∀ s : (B) -> Bool, FINITE(s) → nproduct(INSERT(x, s), f) == (if IN(x, s) { nproduct(s, f) } else { f(x) * nproduct(s, f) }))"),
      t1007,
    ),
  )
}

///|
let nproduct_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLAUSES",
)

///|
/// `NPRODUCT_CLAUSES`
pub fn nproduct_clauses() -> @kernel.Thm {
  nproduct_clauses_c.get()
}

///|
/// iproduct
fn step_101() -> Unit raise {
  iproduct_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(iproduct : ((A) -> Bool, (A) -> Int) -> Int) == iterate(op_star)"),
    ),
  )
}

///|
let iproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iproduct")

///|
/// `iproduct`
pub fn iproduct() -> @kernel.Thm {
  iproduct_c.get()
}

///|
/// NEUTRAL_INT_MUL
fn step_102() -> Unit raise {
  let t1009 = @meson.meson_tac(
    @list.List([@int.int_mul_lid(), @int.int_mul_rid()]),
  )
  let t1008 = @tactics.match_mp_tac(@class.select_unique())
  let t1010 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1008),
    t1009,
  )
  neutral_int_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("neutral(op_star) == int_of_num(1)"),
      t1010,
    ),
  )
}

///|
let neutral_int_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NEUTRAL_INT_MUL",
)

///|
/// `NEUTRAL_INT_MUL`
pub fn neutral_int_mul() -> @kernel.Thm {
  neutral_int_mul_c.get()
}

///|
/// MONOIDAL_INT_MUL
fn step_103() -> Unit raise {
  let t1011 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_int_mul()])),
    @int.int_arith_tac,
  )
  monoidal_int_mul_c.set(
    @tactics.prove(@term_syntax.parse_term("(monoidal : ((Int, Int) -> Int) -> Bool)(op_star)"), t1011),
  )
}

///|
let monoidal_int_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_INT_MUL",
)

///|
/// `MONOIDAL_INT_MUL`
pub fn monoidal_int_mul() -> @kernel.Thm {
  monoidal_int_mul_c.get()
}

///|
/// IPRODUCT_CLAUSES
fn step_104() -> Unit raise {
  let t1014 = @simp.rewrite_tac(@list.List([monoidal_int_mul()]))
  let t1013 = @tactics.match_mp_tac(iterate_clauses())
  let t1012 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1015 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([iproduct(), @equal.gsym(neutral_int_mul())]),
        ),
        t1012,
      ),
      t1013,
    ),
    t1014,
  )
  iproduct_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Int, iproduct({}, f) == int_of_num(1)) && (∀ x : B, ∀ f : (B) -> Int, ∀ s : (B) -> Bool, FINITE(s) → iproduct(INSERT(x, s), f) == (if IN(x, s) { iproduct(s, f) } else { f(x) * iproduct(s, f) }))"),
      t1015,
    ),
  )
}

///|
let iproduct_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLAUSES",
)

///|
/// `IPRODUCT_CLAUSES`
pub fn iproduct_clauses() -> @kernel.Thm {
  iproduct_clauses_c.get()
}

///|
/// product
fn step_105() -> Unit raise {
  product_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(product : ((A) -> Bool, (A) -> Real) -> Real) == iterate(op_star)"),
    ),
  )
}

///|
let product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("product")

///|
/// `product`
pub fn product() -> @kernel.Thm {
  product_c.get()
}

///|
/// NEUTRAL_REAL_MUL
fn step_106() -> Unit raise {
  let t1017 = @meson.meson_tac(
    @list.List([@realax.real_mul_lid(), @realarith.real_mul_rid()]),
  )
  let t1016 = @tactics.match_mp_tac(@class.select_unique())
  let t1018 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1016),
    t1017,
  )
  neutral_real_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("neutral(op_star) == real_of_num(1)"),
      t1018,
    ),
  )
}

///|
let neutral_real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NEUTRAL_REAL_MUL",
)

///|
/// `NEUTRAL_REAL_MUL`
pub fn neutral_real_mul() -> @kernel.Thm {
  neutral_real_mul_c.get()
}

///|
/// MONOIDAL_REAL_MUL
fn step_107() -> Unit raise {
  let t1019 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_real_mul()])),
    @calc_rat.real_arith_tac,
  )
  monoidal_real_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(monoidal : ((Real, Real) -> Real) -> Bool)(op_star)"),
      t1019,
    ),
  )
}

///|
let monoidal_real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_REAL_MUL",
)

///|
/// `MONOIDAL_REAL_MUL`
pub fn monoidal_real_mul() -> @kernel.Thm {
  monoidal_real_mul_c.get()
}

///|
/// PRODUCT_CLAUSES
fn step_108() -> Unit raise {
  let t1022 = @simp.rewrite_tac(@list.List([monoidal_real_mul()]))
  let t1021 = @tactics.match_mp_tac(iterate_clauses())
  let t1020 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1023 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([product(), @equal.gsym(neutral_real_mul())]),
        ),
        t1020,
      ),
      t1021,
    ),
    t1022,
  )
  product_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Real, product({}, f) == real_of_num(1)) && (∀ x : B, ∀ f : (B) -> Real, ∀ s : (B) -> Bool, FINITE(s) → product(INSERT(x, s), f) == (if IN(x, s) { product(s, f) } else { f(x) * product(s, f) }))"),
      t1023,
    ),
  )
}

///|
let product_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CLAUSES",
)

///|
/// `PRODUCT_CLAUSES`
pub fn product_clauses() -> @kernel.Thm {
  product_clauses_c.get()
}

///|
/// isum
fn step_109() -> Unit raise {
  isum_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(isum : ((A) -> Bool, (A) -> Int) -> Int) == iterate(op_plus)"),
    ),
  )
}

///|
let isum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isum")

///|
/// `isum`
pub fn isum() -> @kernel.Thm {
  isum_c.get()
}

///|
/// NEUTRAL_INT_ADD
fn step_110() -> Unit raise {
  let t1025 = @meson.meson_tac(
    @list.List([@int.int_add_lid(), @int.int_add_rid()]),
  )
  let t1024 = @tactics.match_mp_tac(@class.select_unique())
  let t1026 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1024),
    t1025,
  )
  neutral_int_add_c.set(
    @tactics.prove(@term_syntax.parse_term("neutral(op_plus) == int_of_num(0)"), t1026),
  )
}

///|
let neutral_int_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NEUTRAL_INT_ADD",
)

///|
/// `NEUTRAL_INT_ADD`
pub fn neutral_int_add() -> @kernel.Thm {
  neutral_int_add_c.get()
}

///|
/// MONOIDAL_INT_ADD
fn step_111() -> Unit raise {
  let t1027 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_int_add()])),
    @int.int_arith_tac,
  )
  monoidal_int_add_c.set(
    @tactics.prove(@term_syntax.parse_term("(monoidal : ((Int, Int) -> Int) -> Bool)(op_plus)"), t1027),
  )
}

///|
let monoidal_int_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_INT_ADD",
)

///|
/// `MONOIDAL_INT_ADD`
pub fn monoidal_int_add() -> @kernel.Thm {
  monoidal_int_add_c.get()
}

///|
/// ISUM_CLAUSES
fn step_112() -> Unit raise {
  let t1030 = @simp.rewrite_tac(@list.List([monoidal_int_add()]))
  let t1029 = @tactics.match_mp_tac(iterate_clauses())
  let t1028 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1031 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([isum(), @equal.gsym(neutral_int_add())])),
        t1028,
      ),
      t1029,
    ),
    t1030,
  )
  isum_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Int, isum({}, f) == int_of_num(0)) && (∀ x : B, ∀ f : (B) -> Int, ∀ s : (B) -> Bool, FINITE(s) → isum(INSERT(x, s), f) == (if IN(x, s) { isum(s, f) } else { f(x) + isum(s, f) }))"),
      t1031,
    ),
  )
}

///|
let isum_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_CLAUSES")

///|
/// `ISUM_CLAUSES`
pub fn isum_clauses() -> @kernel.Thm {
  isum_clauses_c.get()
}

///|
/// iterate.ml:1286
fn step_113() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// nsum
fn step_114() -> Unit raise {
  nsum_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nsum : ((A) -> Bool, (A) -> Num) -> Num) == iterate(op_plus)"),
    ),
  )
}

///|
let nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nsum")

///|
/// `nsum`
pub fn nsum() -> @kernel.Thm {
  nsum_c.get()
}

///|
/// NEUTRAL_ADD
fn step_115() -> Unit raise {
  let t1033 = @meson.meson_tac(@list.List([@arith.add_clauses()]))
  let t1032 = @tactics.match_mp_tac(@class.select_unique())
  let t1034 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1032),
    t1033,
  )
  neutral_add_c.set(
    @tactics.prove(@term_syntax.parse_term("neutral(op_plus) == 0"), t1034),
  )
}

///|
let neutral_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_ADD")

///|
/// `NEUTRAL_ADD`
pub fn neutral_add() -> @kernel.Thm {
  neutral_add_c.get()
}

///|
/// MONOIDAL_ADD
fn step_116() -> Unit raise {
  let t1035 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_add()])),
    @int.arith_tac,
  )
  monoidal_add_c.set(
    @tactics.prove(@term_syntax.parse_term("monoidal(op_plus)"), t1035),
  )
}

///|
let monoidal_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_ADD")

///|
/// `MONOIDAL_ADD`
pub fn monoidal_add() -> @kernel.Thm {
  monoidal_add_c.get()
}

///|
/// NSUM_DEGENERATE
fn step_117() -> Unit raise {
  let t1037 = @simp.simp_tac(@list.List([iterate(), support(), neutral_add()]))
  let t1036 = @simp.rewrite_tac(@list.List([nsum()]))
  let t1038 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1036),
    t1037,
  )
  nsum_degenerate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, !FINITE({(x : A) | IN(x, s) && !(f(x) == 0)}) → nsum(s, f) == 0"),
      t1038,
    ),
  )
}

///|
let nsum_degenerate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_DEGENERATE",
)

///|
/// `NSUM_DEGENERATE`
pub fn nsum_degenerate() -> @kernel.Thm {
  nsum_degenerate_c.get()
}

///|
/// NSUM_CLAUSES
fn step_118() -> Unit raise {
  let t1041 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1040 = @tactics.match_mp_tac(iterate_clauses())
  let t1039 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1042 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
        t1039,
      ),
      t1040,
    ),
    t1041,
  )
  nsum_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Num, nsum({}, f) == 0) && (∀ x : B, ∀ f : (B) -> Num, ∀ s : (B) -> Bool, FINITE(s) → nsum(INSERT(x, s), f) == (if IN(x, s) { nsum(s, f) } else { f(x) + nsum(s, f) }))"),
      t1042,
    ),
  )
}

///|
let nsum_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_CLAUSES")

///|
/// `NSUM_CLAUSES`
pub fn nsum_clauses() -> @kernel.Thm {
  nsum_clauses_c.get()
}

///|
/// NSUM_UNION
fn step_119() -> Unit raise {
  let t1043 = @simp.simp_tac(
    @list.List([nsum(), iterate_union(), monoidal_add()]),
  )
  nsum_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → nsum(UNION(s, t), f) == nsum(s, f) + nsum(t, f)"),
      t1043,
    ),
  )
}

///|
let nsum_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_UNION")

///|
/// `NSUM_UNION`
pub fn nsum_union() -> @kernel.Thm {
  nsum_union_c.get()
}

///|
/// NSUM_DIFF
fn step_120() -> Unit raise {
  let t1045 = @simp.asm_simp_tac(
    @list.List([nsum(), iterate_diff(), monoidal_add()]),
  )
  let t1044 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(x : Num) + (z : Num) == (y : Num) → x == y - z")),
  )
  let t1046 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1044),
    t1045,
  )
  nsum_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) → nsum(DIFF(s, t), f) == nsum(s, f) - nsum(t, f)"),
      t1046,
    ),
  )
}

///|
let nsum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_DIFF")

///|
/// `NSUM_DIFF`
pub fn nsum_diff() -> @kernel.Thm {
  nsum_diff_c.get()
}

///|
/// NSUM_INCL_EXCL
fn step_121() -> Unit raise {
  let t1048 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1047 = @tactics.match_mp_tac(iterate_incl_excl())
  let t1049 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
      t1047,
    ),
    t1048,
  )
  nsum_incl_excl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> Num, FINITE(s) && FINITE(t) → nsum(s, f) + nsum(t, f) == nsum(UNION(s, t), f) + nsum(INTER(s, t), f)"),
      t1049,
    ),
  )
}

///|
let nsum_incl_excl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_INCL_EXCL")

///|
/// `NSUM_INCL_EXCL`
pub fn nsum_incl_excl() -> @kernel.Thm {
  nsum_incl_excl_c.get()
}

///|
/// NSUM_SUPPORT
fn step_122() -> Unit raise {
  let t1050 = @simp.simp_tac(@list.List([nsum(), iterate(), support_support()]))
  nsum_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, nsum(support(op_plus, f, s), f) == nsum(s, f)"),
      t1050,
    ),
  )
}

///|
let nsum_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_SUPPORT")

///|
/// `NSUM_SUPPORT`
pub fn nsum_support() -> @kernel.Thm {
  nsum_support_c.get()
}

///|
/// NSUM_ADD
fn step_123() -> Unit raise {
  let t1051 = @simp.simp_tac(@list.List([nsum(), iterate_op(), monoidal_add()]))
  nsum_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → nsum(s, (x : A) => f(x) + g(x)) == nsum(s, f) + nsum(s, g)"),
      t1051,
    ),
  )
}

///|
let nsum_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_ADD")

///|
/// `NSUM_ADD`
pub fn nsum_add() -> @kernel.Thm {
  nsum_add_c.get()
}

///|
/// NSUM_ADD_GEN
fn step_124() -> Unit raise {
  let t1054 = @tactics.accept_tac(monoidal_add())
  let t1053 = @tactics.match_mp_tac(iterate_op_gen())
  let t1052 = @equal.gsym(support())
  let t1055 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(neutral_add()), t1052, nsum()])),
      t1053,
    ),
    t1054,
  )
  nsum_add_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE({(x : A) | IN(x, s) && !(f(x) == 0)}) && FINITE({(x : A) | IN(x, s) && !(g(x) == 0)}) → nsum(s, (x : A) => f(x) + g(x)) == nsum(s, f) + nsum(s, g)"),
      t1055,
    ),
  )
}

///|
let nsum_add_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_ADD_GEN")

///|
/// `NSUM_ADD_GEN`
pub fn nsum_add_gen() -> @kernel.Thm {
  nsum_add_gen_c.get()
}

///|
/// NSUM_EQ_0
fn step_125() -> Unit raise {
  let t1056 = @simp.simp_tac(@list.List([iterate_eq_neutral(), monoidal_add()]))
  let t1057 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
    t1056,
  )
  nsum_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == 0) → nsum(s, f) == 0"),
      t1057,
    ),
  )
}

///|
let nsum_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_EQ_0")

///|
/// `NSUM_EQ_0`
pub fn nsum_eq_0() -> @kernel.Thm {
  nsum_eq_0_c.get()
}

///|
/// NSUM_0
fn step_126() -> Unit raise {
  let t1058 = @simp.simp_tac(@list.List([nsum_eq_0()]))
  nsum_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, nsum(s, (n : A) => 0) == 0"), t1058),
  )
}

///|
let nsum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_0")

///|
/// `NSUM_0`
pub fn nsum_0() -> @kernel.Thm {
  nsum_0_c.get()
}

///|
/// NSUM_LMUL
fn step_127() -> Unit raise {
  let t1074 = @simp.simp_tac(
    @list.List([
      nsum_clauses(),
      @arith.mult_clauses(),
      @arith.left_add_distrib(),
    ]),
  )
  let t1073 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1072 = @simp.rewrite_tac(@list.List([@equal.gsym(nsum())]))
  let t1070 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1071 = @tactics.spec_tac(
    @term_syntax.parse_term("support(op_plus, (f : (A) -> Num), (s : (A) -> Bool))"),
    t1070,
  )
  let t1069 = @tactics.undisch_tac(
    @term_syntax.parse_term("FINITE(support(op_plus, (f : (A) -> Num), (s : (A) -> Bool)))"),
  )
  let t1068 = @simp.rewrite_tac(
    @list.List([neutral_add(), @arith.mult_clauses()]),
  )
  let t1067 = @list.List([
    @simp.asm_simp_tac(
      @list.List([support(), @arith.mult_eq_0(), neutral_add()]),
    ),
    @tactics.all_tac,
  ])
  let t1066 = @tactics.subgoal_then(
    @term_syntax.parse_term("support(op_plus, (x : A) => (c : Num) * (f : (A) -> Num)(x), (s : (A) -> Bool)) == support(op_plus, f, s)"),
    fn(
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
      let s1064 = @tactics.subst1_tac(x1063)
      fn(
        x1065 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1064(x1065)
      }
    },
  )
  let t1062 = @simp.once_rewrite_tac(@list.List([iterate_expand_cases()]))
  let t1061 = @simp.rewrite_tac(@list.List([nsum()]))
  let t1060 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), nsum_0()]),
  )
  let t1059 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Num) == 0"))
  let t1075 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t1059,
                          ),
                          t1060,
                        ),
                        t1061,
                      ),
                      t1062,
                    ),
                    t1066,
                  ),
                  t1067,
                ),
                @class.cond_cases_tac,
              ),
              t1068,
            ),
            t1069,
          ),
          t1071,
        ),
        t1072,
      ),
      t1073,
    ),
    t1074,
  )
  nsum_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ c : Num, ∀ s : (A) -> Bool, nsum(s, (x : A) => c * f(x)) == c * nsum(s, f)"),
      t1075,
    ),
  )
}

///|
let nsum_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LMUL")

///|
/// `NSUM_LMUL`
pub fn nsum_lmul() -> @kernel.Thm {
  nsum_lmul_c.get()
}

///|
/// NSUM_RMUL
fn step_128() -> Unit raise {
  let t1076 = @simp.rewrite_tac(@list.List([nsum_lmul()]))
  let t1077 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
    t1076,
  )
  nsum_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ c : Num, ∀ s : (A) -> Bool, nsum(s, (x : A) => f(x) * c) == nsum(s, f) * c"),
      t1077,
    ),
  )
}

///|
let nsum_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_RMUL")

///|
/// `NSUM_RMUL`
pub fn nsum_rmul() -> @kernel.Thm {
  nsum_rmul_c.get()
}

///|
/// NSUM_LE
fn step_129() -> Unit raise {
  let t1079 = @simp.simp_tac(
    @list.List([
      nsum_clauses(),
      @arith.le_refl(),
      @arith.le_add2(),
      @sets.in_insert(),
    ]),
  )
  let t1078 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1080 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()])),
          @tactics.gen_tac,
        ),
        @tactics.gen_tac,
      ),
      t1078,
    ),
    t1079,
  )
  nsum_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= g(x)) → nsum(s, f) <= nsum(s, g)"),
      t1080,
    ),
  )
}

///|
let nsum_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LE")

///|
/// `NSUM_LE`
pub fn nsum_le() -> @kernel.Thm {
  nsum_le_c.get()
}

///|
/// NSUM_LT
fn step_130() -> Unit raise {
  let t1096 = @simp.asm_simp_tac(
    @list.List([
      @arith.lte_add2(),
      nsum_le(),
      @sets.in_delete(),
      @sets.finite_delete(),
    ]),
  )
  let t1095 = @simp.asm_simp_tac(
    @list.List([nsum_clauses(), @sets.finite_delete(), @sets.in_delete()]),
  )
  let t1093 = @sets.set_tac(@list.List([]))
  let t1094 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("IN((a : A), (s : (A) -> Bool))")),
      t1093,
    ),
    @tactics.all_tac,
  ])
  let t1092 = @tactics.subgoal_then(
    @term_syntax.parse_term("(s : (A) -> Bool) == INSERT((a : A), DELETE(s, a))"),
    fn(
      x1089 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1090 = @tactics.subst1_tac(x1089)
      fn(
        x1091 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1090(x1091)
      }
    },
  )
  let t1088 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac),
  )
  let t1087 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x1081 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1082 = @tactics.assume_tac(x1081)
          fn(
            x1083 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        },
        fn(
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1085 = @tactics.mp_tac(x1084)
          fn(
            x1086 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1085(x1086)
          }
        },
      ),
    ),
  )
  let t1097 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1087),
            t1088,
          ),
          t1092,
        ),
        t1094,
      ),
      t1095,
    ),
    t1096,
  )
  nsum_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= g(x)) && (∃ x : A, IN(x, s) && f(x) < g(x)) → nsum(s, f) < nsum(s, g)"),
      t1097,
    ),
  )
}

///|
let nsum_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LT")

///|
/// `NSUM_LT`
pub fn nsum_lt() -> @kernel.Thm {
  nsum_lt_c.get()
}

///|
/// NSUM_LT_ALL
fn step_131() -> Unit raise {
  let t1098 = @meson.meson_tac(
    @list.List([@sets.member_not_empty(), @arith.lt_imp_le(), nsum_lt()]),
  )
  nsum_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < g(x)) → nsum(s, f) < nsum(s, g)"),
      t1098,
    ),
  )
}

///|
let nsum_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LT_ALL")

///|
/// `NSUM_LT_ALL`
pub fn nsum_lt_all() -> @kernel.Thm {
  nsum_lt_all_c.get()
}

///|
/// NSUM_EQ
fn step_132() -> Unit raise {
  let t1100 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1099 = @tactics.match_mp_tac(iterate_eq())
  let t1101 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1099),
    t1100,
  )
  nsum_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → nsum(s, f) == nsum(s, g)"),
      t1101,
    ),
  )
}

///|
let nsum_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_EQ")

///|
/// `NSUM_EQ`
pub fn nsum_eq() -> @kernel.Thm {
  nsum_eq_c.get()
}

///|
/// NSUM_CONST
fn step_133() -> Unit raise {
  let t1103 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1102 = @simp.simp_tac(@list.List([nsum_clauses(), @sets.card_clauses()]))
  let t1104 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.match_mp_tac(@sets.finite_induct_strong()),
        ),
        t1102,
      ),
      t1103,
    ),
    @int.arith_tac,
  )
  nsum_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ s : (A) -> Bool, FINITE(s) → nsum(s, (n : A) => c) == CARD(s) * c"),
      t1104,
    ),
  )
}

///|
let nsum_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_CONST")

///|
/// `NSUM_CONST`
pub fn nsum_const() -> @kernel.Thm {
  nsum_const_c.get()
}

///|
/// NSUM_POS_BOUND
fn step_134() -> Unit raise {
  let t1108 = @meson.meson_tac(
    @list.List([
      @arith.le_0(),
      @int.arith_rule(
        @term_syntax.parse_term("0 <= (x : Num) && 0 <= (y : Num) && x + y <= (b : Num) → x <= b && y <= b"),
      ),
    ]),
  )
  let t1107 = @simp.simp_tac(
    @list.List([nsum_clauses(), @sets.not_in_empty(), @sets.in_insert()]),
  )
  let t1106 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1105 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          t1105,
        ),
        t1106,
      ),
      t1107,
    ),
    t1108,
  )
  nsum_pos_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ b : Num, ∀ s : (A) -> Bool, FINITE(s) && nsum(s, f) <= b → (∀ x : A, IN(x, s) → f(x) <= b)"),
      t1109,
    ),
  )
}

///|
let nsum_pos_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_POS_BOUND")

///|
/// `NSUM_POS_BOUND`
pub fn nsum_pos_bound() -> @kernel.Thm {
  nsum_pos_bound_c.get()
}

///|
/// NSUM_EQ_0_IFF
fn step_135() -> Unit raise {
  let t1111 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) == 0) == (n <= 0)")),
      nsum_pos_bound(),
    ]),
  )
  let t1110 = @simp.asm_simp_tac(@list.List([nsum_eq_0()]))
  let t1112 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @tactics.eq_tac,
      ),
      t1110,
    ),
    t1111,
  )
  nsum_eq_0_iff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → (nsum(s, (f : (A) -> Num)) == 0) == (∀ x : A, IN(x, s) → f(x) == 0)"),
      t1112,
    ),
  )
}

///|
let nsum_eq_0_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_EQ_0_IFF")

///|
/// `NSUM_EQ_0_IFF`
pub fn nsum_eq_0_iff() -> @kernel.Thm {
  nsum_eq_0_iff_c.get()
}

///|
/// NSUM_POS_LT
fn step_136() -> Unit raise {
  let t1113 = @meson.meson_tac(@list.List([]))
  let t1114 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == !(n == 0)")),
        nsum_eq_0_iff(),
      ]),
    ),
    t1113,
  )
  nsum_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && (∃ x : A, IN(x, s) && 0 < f(x)) → 0 < nsum(s, f)"),
      t1114,
    ),
  )
}

///|
let nsum_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_POS_LT")

///|
/// `NSUM_POS_LT`
pub fn nsum_pos_lt() -> @kernel.Thm {
  nsum_pos_lt_c.get()
}

///|
/// NSUM_POS_LT_ALL
fn step_137() -> Unit raise {
  let t1116 = @meson.asm_meson_tac(
    @list.List([@sets.member_not_empty(), @realarith.real_lt_imp_le()]),
  )
  let t1115 = @tactics.match_mp_tac(nsum_pos_lt())
  let t1117 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1115),
    t1116,
  )
  nsum_pos_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, FINITE(s) && !(s == {}) && (∀ i : A, IN(i, s) → 0 < f(i)) → 0 < nsum(s, f)"),
      t1117,
    ),
  )
}

///|
let nsum_pos_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_POS_LT_ALL",
)

///|
/// `NSUM_POS_LT_ALL`
pub fn nsum_pos_lt_all() -> @kernel.Thm {
  nsum_pos_lt_all_c.get()
}

///|
/// NSUM_DELETE
fn step_138() -> Unit raise {
  let t1118 = @simp.simp_tac(
    @list.List([nsum(), iterate_delete(), monoidal_add()]),
  )
  nsum_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → f(a) + nsum(DELETE(s, a), f) == nsum(s, f)"),
      t1118,
    ),
  )
}

///|
let nsum_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_DELETE")

///|
/// `NSUM_DELETE`
pub fn nsum_delete() -> @kernel.Thm {
  nsum_delete_c.get()
}

///|
/// NSUM_SING
fn step_139() -> Unit raise {
  let t1119 = @simp.simp_tac(
    @list.List([
      nsum_clauses(),
      @sets.finite_rules(),
      @sets.not_in_empty(),
      @arith.add_clauses(),
    ]),
  )
  nsum_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Num, ∀ x : A, nsum({x}, f) == f(x)"), t1119),
  )
}

///|
let nsum_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_SING")

///|
/// `NSUM_SING`
pub fn nsum_sing() -> @kernel.Thm {
  nsum_sing_c.get()
}

///|
/// NSUM_DELTA
fn step_140() -> Unit raise {
  let t1120 = @simp.simp_tac(@list.List([iterate_delta(), monoidal_add()]))
  let t1121 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
    t1120,
  )
  nsum_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, nsum(s, (x : A) => if x == a { (b : Num) } else { 0 }) == (if IN(a, s) { b } else { 0 })"),
      t1121,
    ),
  )
}

///|
let nsum_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_DELTA")

///|
/// `NSUM_DELTA`
pub fn nsum_delta() -> @kernel.Thm {
  nsum_delta_c.get()
}

///|
/// NSUM_SWAP
fn step_141() -> Unit raise {
  let t1123 = @simp.simp_tac(
    @list.List([nsum_clauses(), nsum_0(), nsum_add(), @class.eta_ax()]),
  )
  let t1122 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1124 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
        ),
      ),
      t1122,
    ),
    t1123,
  )
  nsum_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> Num, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → nsum(s, (i : A) => nsum(t, f(i))) == nsum(t, (j : B) => nsum(s, (i : A) => f(i, j)))"),
      t1124,
    ),
  )
}

///|
let nsum_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_SWAP")

///|
/// `NSUM_SWAP`
pub fn nsum_swap() -> @kernel.Thm {
  nsum_swap_c.get()
}

///|
/// NSUM_IMAGE
fn step_142() -> Unit raise {
  let t1126 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1125 = @tactics.match_mp_tac(iterate_image())
  let t1127 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
      t1125,
    ),
    t1126,
  )
  nsum_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> Num, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → nsum(IMAGE(f, s), g) == nsum(s, o(g, f))"),
      t1127,
    ),
  )
}

///|
let nsum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_IMAGE")

///|
/// `NSUM_IMAGE`
pub fn nsum_image() -> @kernel.Thm {
  nsum_image_c.get()
}

///|
/// NSUM_SUPERSET
fn step_143() -> Unit raise {
  let t1128 = @simp.simp_tac(
    @list.List([
      nsum(),
      @equal.gsym(neutral_add()),
      iterate_superset(),
      monoidal_add(),
    ]),
  )
  nsum_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == 0) → nsum(v, f) == nsum(u, f)"),
      t1128,
    ),
  )
}

///|
let nsum_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_SUPERSET")

///|
/// `NSUM_SUPERSET`
pub fn nsum_superset() -> @kernel.Thm {
  nsum_superset_c.get()
}

///|
/// NSUM_UNIV
fn step_144() -> Unit raise {
  let t1130 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1129 = @tactics.match_mp_tac(iterate_univ())
  let t1131 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1129),
    t1130,
  )
  nsum_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) → nsum(s, f) == nsum(UNIV, f)"),
      t1131,
    ),
  )
}

///|
let nsum_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_UNIV")

///|
/// `NSUM_UNIV`
pub fn nsum_univ() -> @kernel.Thm {
  nsum_univ_c.get()
}

///|
/// NSUM_UNION_RZERO
fn step_145() -> Unit raise {
  let t1132 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("UNION((u : (_) -> Bool), (v : (_) -> Bool)) == UNION(u, DIFF(v, u))"),
    t1132,
  )
  let t1135 = @meson.asm_meson_tac(
    @list.List([@sets.in_union(), @sets.in_diff(), @sets.subset()]),
  )
  let t1134 = @tactics.match_mp_tac(nsum_superset())
  let t1133 = @simp.once_rewrite_tac(@list.List([lemma]))
  let t1136 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1133),
      t1134,
    ),
    t1135,
  )
  nsum_union_rzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, FINITE(u) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == 0) → nsum(UNION(u, v), f) == nsum(u, f)"),
      t1136,
    ),
  )
}

///|
let nsum_union_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_UNION_RZERO",
)

///|
/// `NSUM_UNION_RZERO`
pub fn nsum_union_rzero() -> @kernel.Thm {
  nsum_union_rzero_c.get()
}

///|
/// NSUM_UNION_LZERO
fn step_146() -> Unit raise {
  let t1137 = @meson.meson_tac(
    @list.List([nsum_union_rzero(), @sets.union_comm()]),
  )
  nsum_union_lzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, FINITE(v) && (∀ x : A, IN(x, u) && !IN(x, v) → f(x) == 0) → nsum(UNION(u, v), f) == nsum(v, f)"),
      t1137,
    ),
  )
}

///|
let nsum_union_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_UNION_LZERO",
)

///|
/// `NSUM_UNION_LZERO`
pub fn nsum_union_lzero() -> @kernel.Thm {
  nsum_union_lzero_c.get()
}

///|
/// NSUM_RESTRICT
fn step_147() -> Unit raise {
  let t1139 = @simp.asm_simp_tac(@list.List([]))
  let t1138 = @tactics.match_mp_tac(nsum_eq())
  let t1140 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1138),
    t1139,
  )
  nsum_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → nsum(s, (x : A) => if IN(x, s) { f(x) } else { 0 }) == nsum(s, f)"),
      t1140,
    ),
  )
}

///|
let nsum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_RESTRICT")

///|
/// `NSUM_RESTRICT`
pub fn nsum_restrict() -> @kernel.Thm {
  nsum_restrict_c.get()
}

///|
/// NSUM_BOUND
fn step_148() -> Unit raise {
  let t1141 = @simp.simp_tac(@list.List([@equal.gsym(nsum_const()), nsum_le()]))
  nsum_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ b : Num, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= b) → nsum(s, f) <= CARD(s) * b"),
      t1141,
    ),
  )
}

///|
let nsum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_BOUND")

///|
/// `NSUM_BOUND`
pub fn nsum_bound() -> @kernel.Thm {
  nsum_bound_c.get()
}

///|
/// NSUM_BOUND_GEN
fn step_149() -> Unit raise {
  let t1147 = @simp.asm_simp_tac(
    @list.List([nsum_lmul(), @arith.le_mult_lcancel(), @sets.card_eq_0()]),
  )
  let t1148 = @list.List([@simp.asm_simp_tac(@list.List([nsum_bound()])), t1147])
  let t1146 = @tactics.subgoal_then(
    @term_syntax.parse_term("nsum((s : (A) -> Bool), (x : A) => CARD(s) * (f : (A) -> Num)(x)) <= CARD(s) * (b : Num)"),
    fn(
      x1143 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1144 = @tactics.mp_tac(x1143)
      fn(
        x1145 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1144(x1145)
      }
    },
  )
  let t1142 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1149 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @theorems.imp_conj(),
            @sets.card_eq_0(),
            @arith.le_rdiv_eq(),
          ]),
        ),
        t1142,
      ),
      t1146,
    ),
    t1148,
  )
  nsum_bound_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ b : Num, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) <= DIV(b, CARD(s))) → nsum(s, f) <= b"),
      t1149,
    ),
  )
}

///|
let nsum_bound_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_BOUND_GEN")

///|
/// `NSUM_BOUND_GEN`
pub fn nsum_bound_gen() -> @kernel.Thm {
  nsum_bound_gen_c.get()
}

///|
/// NSUM_BOUND_LT
fn step_150() -> Unit raise {
  let t1154 = @simp.asm_simp_tac(@list.List([nsum_const(), @arith.le_refl()]))
  let t1153 = @meson.asm_meson_tac(@list.List([]))
  let t1152 = @simp.asm_rewrite_tac(@list.List([]))
  let t1155 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(nsum_lt()), t1152),
      t1153,
    ),
    t1154,
  ])
  let t1151 = @tactics.exists_tac(@term_syntax.parse_term("nsum((s : (A) -> Bool), (x : A) => (b : Num))"))
  let t1150 = @tactics.match_mp_tac(@arith.lte_trans())
  let t1156 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1150),
        t1151,
      ),
      @tactics.conj_tac,
    ),
    t1155,
  )
  nsum_bound_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ b : Num, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= b) && (∃ x : A, IN(x, s) && f(x) < b) → nsum(s, f) < CARD(s) * b"),
      t1156,
    ),
  )
}

///|
let nsum_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_BOUND_LT")

///|
/// `NSUM_BOUND_LT`
pub fn nsum_bound_lt() -> @kernel.Thm {
  nsum_bound_lt_c.get()
}

///|
/// NSUM_BOUND_LT_ALL
fn step_151() -> Unit raise {
  let t1157 = @meson.meson_tac(
    @list.List([@sets.member_not_empty(), @arith.lt_imp_le(), nsum_bound_lt()]),
  )
  nsum_bound_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ b : Num, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < b) → nsum(s, f) < CARD(s) * b"),
      t1157,
    ),
  )
}

///|
let nsum_bound_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_BOUND_LT_ALL",
)

///|
/// `NSUM_BOUND_LT_ALL`
pub fn nsum_bound_lt_all() -> @kernel.Thm {
  nsum_bound_lt_all_c.get()
}

///|
/// NSUM_BOUND_LT_GEN
fn step_152() -> Unit raise {
  let t1161 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) + 1 <= (b : Num)) == (a < b)"))]),
  )
  let t1162 = @tactics.then_tac(@tactics.match_mp_tac(nsum_bound_gen()), t1161)
  let t1160 = @simp.asm_simp_tac(@list.List([]))
  let t1163 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(nsum_lt_all()), t1160),
      @int.arith_tac,
    ),
    t1162,
  ])
  let t1159 = @tactics.exists_tac(
    @term_syntax.parse_term("nsum((s : (A) -> Bool), (a : A) => (f : (A) -> Num)(a) + 1)"),
  )
  let t1158 = @tactics.match_mp_tac(@arith.lte_trans())
  let t1164 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1158),
        t1159,
      ),
      @tactics.conj_tac,
    ),
    t1163,
  )
  nsum_bound_lt_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ b : Num, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < DIV(b, CARD(s))) → nsum(s, f) < b"),
      t1164,
    ),
  )
}

///|
let nsum_bound_lt_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_BOUND_LT_GEN",
)

///|
/// `NSUM_BOUND_LT_GEN`
pub fn nsum_bound_lt_gen() -> @kernel.Thm {
  nsum_bound_lt_gen_c.get()
}

///|
/// NSUM_UNION_EQ
fn step_153() -> Unit raise {
  let t1165 = @meson.meson_tac(
    @list.List([
      nsum_union(),
      @sets.disjoint(),
      @sets.finite_subset(),
      @sets.subset_union(),
    ]),
  )
  nsum_union_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ u : (A) -> Bool, FINITE(u) && INTER(s, t) == {} && UNION(s, t) == u → nsum(s, (f : (A) -> Num)) + nsum(t, f) == nsum(u, f)"),
      t1165,
    ),
  )
}

///|
let nsum_union_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_UNION_EQ")

///|
/// `NSUM_UNION_EQ`
pub fn nsum_union_eq() -> @kernel.Thm {
  nsum_union_eq_c.get()
}

///|
/// NSUM_EQ_SUPERSET
fn step_154() -> Unit raise {
  let t1166 = @meson.meson_tac(@list.List([nsum_superset(), nsum_eq()]))
  nsum_eq_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ x : A, IN(x, t) → f(x) == (g : (A) -> Num)(x)) && (∀ x : A, IN(x, s) && !IN(x, t) → f(x) == 0) → nsum(s, f) == nsum(t, g)"),
      t1166,
    ),
  )
}

///|
let nsum_eq_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_EQ_SUPERSET",
)

///|
/// `NSUM_EQ_SUPERSET`
pub fn nsum_eq_superset() -> @kernel.Thm {
  nsum_eq_superset_c.get()
}

///|
/// NSUM_RESTRICT_SET
fn step_155() -> Unit raise {
  let t1168 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1167 = @tactics.match_mp_tac(iterate_restrict_set())
  let t1169 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
      t1167,
    ),
    t1168,
  )
  nsum_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Num, nsum({(x : A) | IN(x, s) && P(x)}, f) == nsum(s, (x : A) => if P(x) { f(x) } else { 0 })"),
      t1169,
    ),
  )
}

///|
let nsum_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_RESTRICT_SET",
)

///|
/// `NSUM_RESTRICT_SET`
pub fn nsum_restrict_set() -> @kernel.Thm {
  nsum_restrict_set_c.get()
}

///|
/// NSUM_NSUM_RESTRICT
fn step_156() -> Unit raise {
  let t1173 = @tactics.disch_then(fn(
    x1171 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1171
    @simp.rewrite_tac(@list.List([@drule.match_mp(nsum_swap())(th)]))
  })
  let t1170 = @simp.simp_tac(@list.List([nsum_restrict_set()]))
  let t1174 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1170),
    t1173,
  )
  nsum_nsum_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ f : (A, B) -> Num, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → nsum(s, (x : A) => nsum({(y : B) | IN(y, t) && R(x, y)}, (y : B) => f(x, y))) == nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && R(x, y)}, (x : A) => f(x, y)))"),
      t1174,
    ),
  )
}

///|
let nsum_nsum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_NSUM_RESTRICT",
)

///|
/// `NSUM_NSUM_RESTRICT`
pub fn nsum_nsum_restrict() -> @kernel.Thm {
  nsum_nsum_restrict_c.get()
}

///|
/// CARD_EQ_NSUM
fn step_157() -> Unit raise {
  let t1175 = @simp.simp_tac(@list.List([nsum_const(), @arith.mult_clauses()]))
  card_eq_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → CARD(s) == nsum(s, (x : A) => 1)"),
      t1175,
    ),
  )
}

///|
let card_eq_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_NSUM")

///|
/// `CARD_EQ_NSUM`
pub fn card_eq_nsum() -> @kernel.Thm {
  card_eq_nsum_c.get()
}

///|
/// NSUM_MULTICOUNT_GEN
fn step_158() -> Unit raise {
  let t1190 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1189 = @simp.asm_simp_tac(
    @list.List([nsum_const(), @sets.finite_restrict()]),
  )
  let t1188 = @tactics.match_mp_tac(nsum_eq())
  let t1191 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
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
          let t = x1186
          @simp.once_rewrite_tac(
            @list.List([@drule.match_mp(nsum_nsum_restrict())(t)]),
          )
        }),
        t1188,
      ),
      t1189,
    ),
    t1190,
  )
  let t1185 = @simp.asm_simp_tac(
    @list.List([card_eq_nsum(), @sets.finite_restrict()]),
  )
  let t1184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1183 = @simp.asm_rewrite_tac(@list.List([]))
  let t1192 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(nsum_eq()), t1183),
        t1184,
      ),
      t1185,
    ),
    t1191,
  ])
  let t1182 = @tactics.exists_tac(
    @term_syntax.parse_term("nsum((s : (A) -> Bool), (i : A) => nsum({(j : B) | IN(j, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(i, j)}, (j : B) => 1))"),
  )
  let t1181 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1180 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x1177 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1178 = @tactics.assume_tac(x1177)
      fn(
        x1179 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1178(x1179)
      }
    }),
  )
  let t1176 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1193 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1176),
            t1180,
          ),
          t1181,
        ),
        t1182,
      ),
      @tactics.conj_tac,
    ),
    t1192,
  )
  nsum_multicount_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (B) -> Num, FINITE(s) && FINITE(t) && (∀ j : B, IN(j, t) → CARD({(i : A) | IN(i, s) && R(i, j)}) == k(j)) → nsum(s, (i : A) => CARD({(j : B) | IN(j, t) && R(i, j)})) == nsum(t, (i : B) => k(i))"),
      t1193,
    ),
  )
}

///|
let nsum_multicount_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_MULTICOUNT_GEN",
)

///|
/// `NSUM_MULTICOUNT_GEN`
pub fn nsum_multicount_gen() -> @kernel.Thm {
  nsum_multicount_gen_c.get()
}

///|
/// NSUM_MULTICOUNT
fn step_159() -> Unit raise {
  let t1197 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1198 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([nsum_const()])),
    t1197,
  )
  let t1196 = @simp.asm_rewrite_tac(@list.List([]))
  let t1199 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(nsum_multicount_gen()), t1196),
    t1198,
  ])
  let t1195 = @tactics.exists_tac(@term_syntax.parse_term("nsum((t : (B) -> Bool), (i : B) => (k : Num))"))
  let t1194 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1200 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1194),
        t1195,
      ),
      @tactics.conj_tac,
    ),
    t1199,
  )
  nsum_multicount_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : Num, FINITE(s) && FINITE(t) && (∀ j : B, IN(j, t) → CARD({(i : A) | IN(i, s) && R(i, j)}) == k) → nsum(s, (i : A) => CARD({(j : B) | IN(j, t) && R(i, j)})) == k * CARD(t)"),
      t1200,
    ),
  )
}

///|
let nsum_multicount_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_MULTICOUNT",
)

///|
/// `NSUM_MULTICOUNT`
pub fn nsum_multicount() -> @kernel.Thm {
  nsum_multicount_c.get()
}

///|
/// NSUM_IMAGE_GEN
fn step_160() -> Unit raise {
  let t1202 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1201 = @tactics.match_mp_tac(iterate_image_gen())
  let t1203 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1201),
    t1202,
  )
  nsum_image_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → nsum(s, g) == nsum(IMAGE(f, s), (y : B) => nsum({(x : A) | IN(x, s) && f(x) == y}, g))"),
      t1203,
    ),
  )
}

///|
let nsum_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_IMAGE_GEN")

///|
/// `NSUM_IMAGE_GEN`
pub fn nsum_image_gen() -> @kernel.Thm {
  nsum_image_gen_c.get()
}

///|
/// NSUM_GROUP
fn step_161() -> Unit raise {
  let t1216 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1215 = @tactics.match_mp_tac(nsum_eq_0())
  let t1214 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1213 = @simp.asm_rewrite_tac(@list.List([]))
  let t1212 = @tactics.match_mp_tac(nsum_superset())
  let t1211 = @tactics.disch_then(fn(
    x1208 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1209 = @tactics.subst1_tac(x1208)
    fn(
      x1210 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1209(x1210)
    }
  })
  let t1207 = @simp.asm_rewrite_tac(@list.List([]))
  let t1204 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1205 = @term_syntax.parse_term("(g : (A) -> Num)")
  let t1206 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1205, t1204]),
      nsum_image_gen(),
    ),
  )
  let t1217 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1206,
                ),
                t1207,
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
    t1216,
  )
  nsum_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && SUBSET(IMAGE(f, s), t) → nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && f(x) == y}, g)) == nsum(s, g)"),
      t1217,
    ),
  )
}

///|
let nsum_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_GROUP")

///|
/// `NSUM_GROUP`
pub fn nsum_group() -> @kernel.Thm {
  nsum_group_c.get()
}

///|
/// NSUM_GROUP_RELATION
fn step_162() -> Unit raise {
  let t1232 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1231 = @simp.rewrite_tac(@list.List([]))
  let t1230 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1229 = @tactics.match_mp_tac(nsum_eq())
  let t1227 = @tactics.disch_then(fn(
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
    (fn(
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
      let s1224 = @tactics.subst1_tac(x1223)
      fn(
        x1225 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1224(x1225)
      }
    })(@equal.sym(x1226))
  })
  let t1228 = @list.List([@meson.asm_meson_tac(@list.List([])), t1227])
  let t1222 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image()]),
  )
  let t1218 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1219 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1220 = @term_syntax.parse_term("(g : (A) -> Num)")
  let t1221 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : A) => select((y : B) => IN(y, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(x, y))"),
        t1220,
        t1219,
        t1218,
      ]),
      nsum_group(),
    ),
  )
  let t1233 = @tactics.then_tac(
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
                      t1221,
                    ),
                    t1222,
                  ),
                  @tactics.ants_tac,
                ),
                t1228,
              ),
              t1229,
            ),
            t1230,
          ),
          t1231,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t1232,
  )
  nsum_group_relation_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → existsunique((y : B) => IN(y, t) && R(x, y))) → nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && R(x, y)}, g)) == nsum(s, g)"),
      t1233,
    ),
  )
}

///|
let nsum_group_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_GROUP_RELATION",
)

///|
/// `NSUM_GROUP_RELATION`
pub fn nsum_group_relation() -> @kernel.Thm {
  nsum_group_relation_c.get()
}

///|
/// NSUM_SUBSET
fn step_163() -> Unit raise {
  let t1248 = @simp.asm_simp_tac(@list.List([nsum_eq_0()]))
  let t1246 = @tactics.disch_then(fn(
    x1243 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1244 = @tactics.subst1_tac(x1243)
    fn(
      x1245 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1244(x1245)
    }
  })
  let t1247 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.ants_tac,
      @list.List([@sets.set_tac(@list.List([])), t1246]),
    ),
  )
  let t1242 = @simp.asm_simp_tac(
    @list.List([@sets.finite_diff(), @sets.finite_inter()]),
  )
  let t1240 = @sets.set_rule(
    @term_syntax.parse_term("UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(v, u)) == v"),
  )
  let t1241 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(u, v)) == u")),
      t1240,
    ]),
  )
  let t1239 = @tactics.disch_then(fn(
    x1236 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1236
    let t1238 = @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("DIFF((u : (A) -> Bool), (v : (A) -> Bool))"), th),
    )
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("DIFF((v : (A) -> Bool), (u : (A) -> Bool))"), th)),
      t1238,
    )
  })
  let t1234 = @term_syntax.parse_term("INTER((u : (A) -> Bool), (v : (A) -> Bool))")
  let t1235 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (A) -> Num)"), t1234]),
      nsum_union(),
    ),
  )
  let t1249 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1235),
              t1239,
            ),
            t1241,
          ),
          t1242,
        ),
        t1247,
      ),
      t1248,
    ),
    @int.arith_tac,
  )
  nsum_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, ∀ v : (A) -> Bool, ∀ f : (A) -> Num, FINITE(u) && FINITE(v) && (∀ x : A, IN(x, DIFF(u, v)) → f(x) == 0) → nsum(u, f) <= nsum(v, f)"),
      t1249,
    ),
  )
}

///|
let nsum_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_SUBSET")

///|
/// `NSUM_SUBSET`
pub fn nsum_subset() -> @kernel.Thm {
  nsum_subset_c.get()
}

///|
/// NSUM_SUBSET_SIMPLE
fn step_164() -> Unit raise {
  let t1251 = @meson.asm_meson_tac(
    @list.List([@sets.in_diff(), @sets.subset(), @sets.finite_subset()]),
  )
  let t1250 = @tactics.match_mp_tac(nsum_subset())
  let t1252 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1250),
    t1251,
  )
  nsum_subset_simple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, ∀ v : (A) -> Bool, ∀ f : (A) -> Num, FINITE(v) && SUBSET(u, v) → nsum(u, f) <= nsum(v, f)"),
      t1252,
    ),
  )
}

///|
let nsum_subset_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_SUBSET_SIMPLE",
)

///|
/// `NSUM_SUBSET_SIMPLE`
pub fn nsum_subset_simple() -> @kernel.Thm {
  nsum_subset_simple_c.get()
}

///|
/// NSUM_LE_GEN
fn step_165() -> Unit raise {
  let t1264 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t1265 = @tactics.then_tac(@tactics.match_mp_tac(nsum_le()), t1264)
  let t1263 = @meson.asm_meson_tac(@list.List([@arith.le()]))
  let t1262 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t1259 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      @sets.finite_subset(),
    ),
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
    @tactics.match_mp_tac(t1259(x1260))
  })
  let t1258 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@arith.le()])),
  ])
  let t1257 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_diff()]),
  )
  let t1266 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.match_mp_tac(nsum_subset()), t1257),
              @tactics.conj_tac,
            ),
            t1258,
          ),
          t1261,
        ),
        t1262,
      ),
      t1263,
    ),
    t1265,
  ])
  let t1255 = @term_syntax.parse_term("nsum({(x : A) | IN(x, (s : (A) -> Bool)) && !((g : (A) -> Num)(x) == 0)}, (f : (A) -> Num))")
  let t1256 = @tactics.trans_tac(@arith.le_trans())(t1255)
  let t1254 = @simp.rewrite_tac(@list.List([support(), neutral_add()]))
  let t1253 = @simp.once_rewrite_tac(@list.List([@equal.gsym(nsum_support())]))
  let t1267 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1253),
          t1254,
        ),
        t1256,
      ),
      @tactics.conj_tac,
    ),
    t1266,
  )
  nsum_le_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) <= g(x)) && FINITE({(x : A) | IN(x, s) && !(g(x) == 0)}) → nsum(s, f) <= nsum(s, g)"),
      t1267,
    ),
  )
}

///|
let nsum_le_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LE_GEN")

///|
/// `NSUM_LE_GEN`
pub fn nsum_le_gen() -> @kernel.Thm {
  nsum_le_gen_c.get()
}

///|
/// NSUM_MUL_BOUND
fn step_166() -> Unit raise {
  let t1278 = @simp.asm_simp_tac(
    @list.List([@sets.sing_subset(), @sets.in_diff()]),
  )
  let t1277 = @tactics.match_mp_tac(nsum_subset_simple())
  let t1276 = @simp.gen_rewrite_tac(
    fn(
      x1273 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1274 = @equal.land_conv(x1273)
      fn(x1275 : @kernel.Term) -> @kernel.Thm raise { s1274(x1275) }
    },
    @list.List([@equal.gsym(nsum_sing())]),
  )
  let t1272 = @simp.asm_simp_tac(@list.List([]))
  let t1271 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : A)"))
  let t1270 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1269 = @tactics.match_mp_tac(nsum_le())
  let t1268 = @simp.rewrite_tac(@list.List([@equal.gsym(nsum_lmul())]))
  let t1279 = @tactics.then_tac(
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
                      t1268,
                    ),
                    t1269,
                  ),
                  t1270,
                ),
                t1271,
              ),
              @tactics.disch_tac,
            ),
            @tactics.disj1_tac,
          ),
          t1272,
        ),
        t1276,
      ),
      t1277,
    ),
    t1278,
  )
  nsum_mul_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : (A) -> Num, ∀ b : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → nsum(s, (i : A) => a(i) * b(i)) <= nsum(s, a) * nsum(s, b)"),
      t1279,
    ),
  )
}

///|
let nsum_mul_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_MUL_BOUND")

///|
/// `NSUM_MUL_BOUND`
pub fn nsum_mul_bound() -> @kernel.Thm {
  nsum_mul_bound_c.get()
}

///|
/// NSUM_IMAGE_NONZERO
fn step_167() -> Unit raise {
  let t1281 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1280 = @tactics.match_mp_tac(iterate_image_nonzero())
  let t1282 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(neutral_add()), nsum()])),
      t1280,
    ),
    t1281,
  )
  nsum_image_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : (B) -> Num, ∀ i : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) && i(x) == i(y) → d(i(x)) == 0) → nsum(IMAGE(i, s), d) == nsum(s, o(d, i))"),
      t1282,
    ),
  )
}

///|
let nsum_image_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_IMAGE_NONZERO",
)

///|
/// `NSUM_IMAGE_NONZERO`
pub fn nsum_image_nonzero() -> @kernel.Thm {
  nsum_image_nonzero_c.get()
}

///|
/// NSUM_BIJECTION
fn step_168() -> Unit raise {
  let t1284 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1283 = @tactics.match_mp_tac(iterate_bijection())
  let t1285 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1283),
    t1284,
  )
  nsum_bijection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ p : (A) -> A, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ y : A, IN(y, s) → existsunique((x : A) => IN(x, s) && p(x) == y)) → nsum(s, f) == nsum(s, o(f, p))"),
      t1285,
    ),
  )
}

///|
let nsum_bijection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_BIJECTION")

///|
/// `NSUM_BIJECTION`
pub fn nsum_bijection() -> @kernel.Thm {
  nsum_bijection_c.get()
}

///|
/// NSUM_NSUM_PRODUCT
fn step_169() -> Unit raise {
  let t1287 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1286 = @tactics.match_mp_tac(iterate_iterate_product())
  let t1288 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1286),
    t1287,
  )
  nsum_nsum_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, ∀ x : (A, B) -> Num, FINITE(s) && (∀ i : A, IN(i, s) → FINITE(t(i))) → nsum(s, (i : A) => nsum(t(i), x(i))) == nsum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) })"),
      t1288,
    ),
  )
}

///|
let nsum_nsum_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_NSUM_PRODUCT",
)

///|
/// `NSUM_NSUM_PRODUCT`
pub fn nsum_nsum_product() -> @kernel.Thm {
  nsum_nsum_product_c.get()
}

///|
/// NSUM_EQ_GENERAL
fn step_170() -> Unit raise {
  let t1290 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1289 = @tactics.match_mp_tac(iterate_eq_general())
  let t1291 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1289),
    t1290,
  )
  nsum_eq_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Num, ∀ g : (B) -> Num, ∀ h : (A) -> B, (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && h(x) == y)) && (∀ x : A, IN(x, s) → IN(h(x), t) && g(h(x)) == f(x)) → nsum(s, f) == nsum(t, g)"),
      t1291,
    ),
  )
}

///|
let nsum_eq_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_EQ_GENERAL",
)

///|
/// `NSUM_EQ_GENERAL`
pub fn nsum_eq_general() -> @kernel.Thm {
  nsum_eq_general_c.get()
}

///|
/// NSUM_EQ_GENERAL_INVERSES
fn step_171() -> Unit raise {
  let t1293 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1292 = @tactics.match_mp_tac(iterate_eq_general_inverses())
  let t1294 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1292),
    t1293,
  )
  nsum_eq_general_inverses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Num, ∀ g : (B) -> Num, ∀ h : (A) -> B, ∀ k : (B) -> A, (∀ y : B, IN(y, t) → IN(k(y), s) && h(k(y)) == y) && (∀ x : A, IN(x, s) → IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) → nsum(s, f) == nsum(t, g)"),
      t1294,
    ),
  )
}

///|
let nsum_eq_general_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_EQ_GENERAL_INVERSES",
)

///|
/// `NSUM_EQ_GENERAL_INVERSES`
pub fn nsum_eq_general_inverses() -> @kernel.Thm {
  nsum_eq_general_inverses_c.get()
}

///|
/// NSUM_INJECTION
fn step_172() -> Unit raise {
  let t1296 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1295 = @tactics.match_mp_tac(iterate_injection())
  let t1297 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([nsum()])), t1295),
    t1296,
  )
  nsum_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ p : (A) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → nsum(s, o(f, p)) == nsum(s, f)"),
      t1297,
    ),
  )
}

///|
let nsum_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_INJECTION")

///|
/// `NSUM_INJECTION`
pub fn nsum_injection() -> @kernel.Thm {
  nsum_injection_c.get()
}

///|
/// NSUM_UNION_NONZERO
fn step_173() -> Unit raise {
  let t1299 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1298 = @tactics.match_mp_tac(iterate_union_nonzero())
  let t1300 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
      t1298,
    ),
    t1299,
  )
  nsum_union_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, INTER(s, t)) → f(x) == 0) → nsum(UNION(s, t), f) == nsum(s, f) + nsum(t, f)"),
      t1300,
    ),
  )
}

///|
let nsum_union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_UNION_NONZERO",
)

///|
/// `NSUM_UNION_NONZERO`
pub fn nsum_union_nonzero() -> @kernel.Thm {
  nsum_union_nonzero_c.get()
}

///|
/// NSUM_UNIONS_NONZERO
fn step_174() -> Unit raise {
  let t1318 = @meson.asm_meson_tac(@list.List([]))
  let t1317 = @simp.asm_simp_tac(
    @list.List([@sets.finite_unions(), @sets.in_inter(), @sets.in_unions()]),
  )
  let t1316 = @tactics.match_mp_tac(nsum_union_nonzero())
  let t1314 = @tactics.disch_then(fn(
    x1313 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1310 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1311 = @tactics.subst_all_tac(x1310)
      fn(
        x1312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1311(x1312)
      }
    })(@equal.sym(x1313))
  })
  let t1315 = @list.List([@meson.asm_meson_tac(@list.List([])), t1314])
  let t1309 = @simp.asm_simp_tac(@list.List([nsum_clauses()]))
  let t1308 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1307 = @tactics.disch_then(fn(
    x1305 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1305
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t1303 = @term_syntax.parse_term("(s : ((A) -> Bool) -> Bool)")
  let t1304 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t1303]),
  )
  let t1302 = @simp.rewrite_tac(
    @list.List([
      @sets.unions_0(),
      @sets.unions_insert(),
      nsum_clauses(),
      @sets.in_insert(),
    ]),
  )
  let t1301 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1319 = @tactics.then_tac(
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
                            @simp.once_rewrite_tac(
                              @list.List([@theorems.imp_conj()]),
                            ),
                          ),
                          t1301,
                        ),
                        t1302,
                      ),
                      t1304,
                    ),
                    t1307,
                  ),
                  t1308,
                ),
                t1309,
              ),
              @tactics.ants_tac,
            ),
            t1315,
          ),
          @tactics.strip_tac,
        ),
        t1316,
      ),
      t1317,
    ),
    t1318,
  )
  nsum_unions_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ t : (A) -> Bool, IN(t, s) → FINITE(t)) && (∀ t1 : (A) -> Bool, ∀ t2 : (A) -> Bool, ∀ x : A, IN(t1, s) && IN(t2, s) && !(t1 == t2) && IN(x, t1) && IN(x, t2) → f(x) == 0) → nsum(UNIONS(s), f) == nsum(s, (t : (A) -> Bool) => nsum(t, f))"),
      t1319,
    ),
  )
}

///|
let nsum_unions_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_UNIONS_NONZERO",
)

///|
/// `NSUM_UNIONS_NONZERO`
pub fn nsum_unions_nonzero() -> @kernel.Thm {
  nsum_unions_nonzero_c.get()
}

///|
/// NSUM_CASES
fn step_175() -> Unit raise {
  let t1321 = @simp.rewrite_tac(@list.List([monoidal_add()]))
  let t1320 = @tactics.match_mp_tac(iterate_cases())
  let t1322 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([nsum(), @equal.gsym(neutral_add())])),
      t1320,
    ),
    t1321,
  )
  nsum_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ P : (A) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, FINITE(s) → nsum(s, (x : A) => if P(x) { f(x) } else { g(x) }) == nsum({(x : A) | IN(x, s) && P(x)}, f) + nsum({(x : A) | IN(x, s) && !P(x)}, g)"),
      t1322,
    ),
  )
}

///|
let nsum_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_CASES")

///|
/// `NSUM_CASES`
pub fn nsum_cases() -> @kernel.Thm {
  nsum_cases_c.get()
}

///|
/// NSUM_CLOSED
fn step_176() -> Unit raise {
  let t1331 = @simp.asm_simp_tac(
    @list.List([neutral_add(), @equal.gsym(nsum())]),
  )
  let t1327 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t1330 = @tactics.disch_then(fn(
    x1329 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1324 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1325 = @tactics.mp_tac(x1324)
      fn(
        x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1325(x1326)
      }
    })(((x1328 : @kernel.Thm) => @bool.spec(t1327, x1328))(x1329))
  })
  let t1323 = @tactics.mp_tac(@drule.match_mp(iterate_closed())(monoidal_add()))
  let t1332 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1323),
      t1330,
    ),
    t1331,
  )
  nsum_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ f : (A) -> Num, ∀ s : (A) -> Bool, P(0) && (∀ x : Num, ∀ y : Num, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(nsum(s, f))"),
      t1332,
    ),
  )
}

///|
let nsum_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_CLOSED")

///|
/// `NSUM_CLOSED`
pub fn nsum_closed() -> @kernel.Thm {
  nsum_closed_c.get()
}

///|
/// NSUM_RELATED
fn step_177() -> Unit raise {
  let t1337 = @meson.asm_meson_tac(@list.List([]))
  let t1336 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(nsum()), neutral_add()]),
  )
  let t1334 = @drule.match_mp(iterate_related())(monoidal_add())
  let t1335 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Num, Num) -> Bool)"), t1334),
  )
  let t1333 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1338 = @tactics.then_tac(
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
          t1333,
        ),
        t1335,
      ),
      t1336,
    ),
    t1337,
  )
  nsum_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, R(0, 0) && (∀ m : Num, ∀ n : Num, ∀ m' : Num, ∀ n' : Num, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(nsum(s, f), nsum(s, g))"),
      t1338,
    ),
  )
}

///|
let nsum_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_RELATED")

///|
/// `NSUM_RELATED`
pub fn nsum_related() -> @kernel.Thm {
  nsum_related_c.get()
}

///|
/// NSUM_CLOSED_NONEMPTY
fn step_178() -> Unit raise {
  let t1347 = @simp.asm_simp_tac(
    @list.List([neutral_add(), @equal.gsym(nsum())]),
  )
  let t1343 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t1346 = @tactics.disch_then(fn(
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
    (fn(
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
      let s1341 = @tactics.mp_tac(x1340)
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
    })(((x1344 : @kernel.Thm) => @bool.spec(t1343, x1344))(x1345))
  })
  let t1339 = @tactics.mp_tac(
    @drule.match_mp(iterate_closed_nonempty())(monoidal_add()),
  )
  let t1348 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1339),
      t1346,
    ),
    t1347,
  )
  nsum_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Num, ∀ y : Num, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(nsum(s, f))"),
      t1348,
    ),
  )
}

///|
let nsum_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLOSED_NONEMPTY",
)

///|
/// `NSUM_CLOSED_NONEMPTY`
pub fn nsum_closed_nonempty() -> @kernel.Thm {
  nsum_closed_nonempty_c.get()
}

///|
/// NSUM_RELATED_NONEMPTY
fn step_179() -> Unit raise {
  let t1353 = @meson.asm_meson_tac(@list.List([]))
  let t1352 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(nsum()), neutral_add()]),
  )
  let t1350 = @drule.match_mp(iterate_related_nonempty())(monoidal_add())
  let t1351 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Num, Num) -> Bool)"), t1350),
  )
  let t1349 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1354 = @tactics.then_tac(
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
          t1349,
        ),
        t1351,
      ),
      t1352,
    ),
    t1353,
  )
  nsum_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, (∀ m : Num, ∀ n : Num, ∀ m' : Num, ∀ n' : Num, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(nsum(s, f), nsum(s, g))"),
      t1354,
    ),
  )
}

///|
let nsum_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_RELATED_NONEMPTY",
)

///|
/// `NSUM_RELATED_NONEMPTY`
pub fn nsum_related_nonempty() -> @kernel.Thm {
  nsum_related_nonempty_c.get()
}

///|
/// NSUM_ADD_NUMSEG
fn step_180() -> Unit raise {
  let t1355 = @simp.simp_tac(@list.List([nsum_add(), finite_numseg()]))
  nsum_add_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ m : Num, ∀ n : Num, nsum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == nsum(op_dot_dot(m, n), f) + nsum(op_dot_dot(m, n), g)"),
      t1355,
    ),
  )
}

///|
let nsum_add_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_ADD_NUMSEG",
)

///|
/// `NSUM_ADD_NUMSEG`
pub fn nsum_add_numseg() -> @kernel.Thm {
  nsum_add_numseg_c.get()
}

///|
/// NSUM_LE_NUMSEG
fn step_181() -> Unit raise {
  let t1356 = @simp.simp_tac(
    @list.List([nsum_le(), finite_numseg(), in_numseg()]),
  )
  nsum_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) <= g(i)) → nsum(op_dot_dot(m, n), f) <= nsum(op_dot_dot(m, n), g)"),
      t1356,
    ),
  )
}

///|
let nsum_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_LE_NUMSEG")

///|
/// `NSUM_LE_NUMSEG`
pub fn nsum_le_numseg() -> @kernel.Thm {
  nsum_le_numseg_c.get()
}

///|
/// NSUM_EQ_NUMSEG
fn step_182() -> Unit raise {
  let t1357 = @meson.meson_tac(
    @list.List([nsum_eq(), finite_numseg(), in_numseg()]),
  )
  nsum_eq_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(m, n), g)"),
      t1357,
    ),
  )
}

///|
let nsum_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_EQ_NUMSEG")

///|
/// `NSUM_EQ_NUMSEG`
pub fn nsum_eq_numseg() -> @kernel.Thm {
  nsum_eq_numseg_c.get()
}

///|
/// NSUM_CONST_NUMSEG
fn step_183() -> Unit raise {
  let t1358 = @simp.simp_tac(
    @list.List([nsum_const(), finite_numseg(), card_numseg()]),
  )
  nsum_const_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ m : Num, ∀ n : Num, nsum(op_dot_dot(m, n), (n : Num) => c) == (n + 1 - m) * c"),
      t1358,
    ),
  )
}

///|
let nsum_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CONST_NUMSEG",
)

///|
/// `NSUM_CONST_NUMSEG`
pub fn nsum_const_numseg() -> @kernel.Thm {
  nsum_const_numseg_c.get()
}

///|
/// NSUM_EQ_0_NUMSEG
fn step_184() -> Unit raise {
  let t1359 = @simp.simp_tac(@list.List([nsum_eq_0(), in_numseg()]))
  nsum_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == 0) → nsum(op_dot_dot(m, n), f) == 0"),
      t1359,
    ),
  )
}

///|
let nsum_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_EQ_0_NUMSEG",
)

///|
/// `NSUM_EQ_0_NUMSEG`
pub fn nsum_eq_0_numseg() -> @kernel.Thm {
  nsum_eq_0_numseg_c.get()
}

///|
/// NSUM_EQ_0_IFF_NUMSEG
fn step_185() -> Unit raise {
  let t1360 = @simp.simp_tac(
    @list.List([nsum_eq_0_iff(), finite_numseg(), in_numseg()]),
  )
  nsum_eq_0_iff_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (nsum(op_dot_dot(m, n), f) == 0) == (∀ i : Num, m <= i && i <= n → f(i) == 0)"),
      t1360,
    ),
  )
}

///|
let nsum_eq_0_iff_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_EQ_0_IFF_NUMSEG",
)

///|
/// `NSUM_EQ_0_IFF_NUMSEG`
pub fn nsum_eq_0_iff_numseg() -> @kernel.Thm {
  nsum_eq_0_iff_numseg_c.get()
}

///|
/// NSUM_TRIV_NUMSEG
fn step_186() -> Unit raise {
  let t1361 = @meson.meson_tac(
    @list.List([nsum_eq_0_numseg(), @arith.le_trans(), @arith.not_lt()]),
  )
  nsum_triv_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, n < m → nsum(op_dot_dot(m, n), f) == 0"),
      t1361,
    ),
  )
}

///|
let nsum_triv_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_TRIV_NUMSEG",
)

///|
/// `NSUM_TRIV_NUMSEG`
pub fn nsum_triv_numseg() -> @kernel.Thm {
  nsum_triv_numseg_c.get()
}

///|
/// NSUM_SING_NUMSEG
fn step_187() -> Unit raise {
  let t1362 = @simp.simp_tac(@list.List([nsum_sing(), numseg_sing()]))
  nsum_sing_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Num, ∀ n : Num, nsum(op_dot_dot(n, n), f) == f(n)"), t1362),
  )
}

///|
let nsum_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_SING_NUMSEG",
)

///|
/// `NSUM_SING_NUMSEG`
pub fn nsum_sing_numseg() -> @kernel.Thm {
  nsum_sing_numseg_c.get()
}

///|
/// NSUM_CLAUSES_NUMSEG
fn step_188() -> Unit raise {
  let t1363 = @simp.rewrite_tac(@list.List([neutral_add(), nsum()]))
  let t1364 = @tactics.then_tac(
    @tactics.mp_tac(@drule.match_mp(iterate_clauses_numseg())(monoidal_add())),
    t1363,
  )
  nsum_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, nsum(op_dot_dot(m, 0), (f : (Num) -> Num)) == (if m == 0 { f(0) } else { 0 })) && (∀ m : Num, ∀ n : Num, nsum(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { nsum(op_dot_dot(m, n), f) + f(SUC(n)) } else { nsum(op_dot_dot(m, n), f) }))"),
      t1364,
    ),
  )
}

///|
let nsum_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLAUSES_NUMSEG",
)

///|
/// `NSUM_CLAUSES_NUMSEG`
pub fn nsum_clauses_numseg() -> @kernel.Thm {
  nsum_clauses_numseg_c.get()
}

///|
/// NSUM_CLAUSES_NUMSEG_LT
fn step_189() -> Unit raise {
  let t1365 = @simp.rewrite_tac(@list.List([neutral_add(), nsum()]))
  let t1366 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(iterate_clauses_numseg_lt())(monoidal_add()),
    ),
    t1365,
  )
  nsum_clauses_numseg_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("nsum({(i : Num) | i < 0}, (f : (Num) -> Num)) == 0 && (∀ k : Num, nsum({(i : Num) | i < SUC(k)}, f) == nsum({(i : Num) | i < k}, f) + f(k))"),
      t1366,
    ),
  )
}

///|
let nsum_clauses_numseg_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLAUSES_NUMSEG_LT",
)

///|
/// `NSUM_CLAUSES_NUMSEG_LT`
pub fn nsum_clauses_numseg_lt() -> @kernel.Thm {
  nsum_clauses_numseg_lt_c.get()
}

///|
/// NSUM_CLAUSES_NUMSEG_LE
fn step_190() -> Unit raise {
  let t1367 = @simp.rewrite_tac(@list.List([neutral_add(), nsum()]))
  let t1368 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(iterate_clauses_numseg_le())(monoidal_add()),
    ),
    t1367,
  )
  nsum_clauses_numseg_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("nsum({(i : Num) | i <= 0}, (f : (Num) -> Num)) == f(0) && (∀ k : Num, nsum({(i : Num) | i <= SUC(k)}, f) == nsum({(i : Num) | i <= k}, f) + f(SUC(k)))"),
      t1368,
    ),
  )
}

///|
let nsum_clauses_numseg_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLAUSES_NUMSEG_LE",
)

///|
/// `NSUM_CLAUSES_NUMSEG_LE`
pub fn nsum_clauses_numseg_le() -> @kernel.Thm {
  nsum_clauses_numseg_le_c.get()
}

///|
/// NSUM_SWAP_NUMSEG
fn step_191() -> Unit raise {
  let t1370 = @simp.rewrite_tac(@list.List([finite_numseg()]))
  let t1369 = @tactics.match_mp_tac(nsum_swap())
  let t1371 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1369),
    t1370,
  )
  nsum_swap_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, ∀ f : (Num, Num) -> Num, nsum(op_dot_dot(a, b), (i : Num) => nsum(op_dot_dot(c, d), f(i))) == nsum(op_dot_dot(c, d), (j : Num) => nsum(op_dot_dot(a, b), (i : Num) => f(i, j)))"),
      t1371,
    ),
  )
}

///|
let nsum_swap_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_SWAP_NUMSEG",
)

///|
/// `NSUM_SWAP_NUMSEG`
pub fn nsum_swap_numseg() -> @kernel.Thm {
  nsum_swap_numseg_c.get()
}

///|
/// NSUM_ADD_SPLIT
fn step_192() -> Unit raise {
  let t1372 = @simp.simp_tac(
    @list.List([
      numseg_add_split(),
      nsum_union(),
      disjoint_numseg(),
      finite_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < x + 1")),
    ]),
  )
  nsum_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → nsum(op_dot_dot(m, n + p), f) == nsum(op_dot_dot(m, n), f) + nsum(op_dot_dot(n + 1, n + p), f)"),
      t1372,
    ),
  )
}

///|
let nsum_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_ADD_SPLIT")

///|
/// `NSUM_ADD_SPLIT`
pub fn nsum_add_split() -> @kernel.Thm {
  nsum_add_split_c.get()
}

///|
/// NSUM_OFFSET
fn step_193() -> Unit raise {
  let t1373 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1374 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        numseg_offset_image(),
        nsum_image(),
        @arith.eq_add_rcancel(),
        finite_numseg(),
      ]),
    ),
    t1373,
  )
  nsum_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, nsum(op_dot_dot(m + p, n + p), f) == nsum(op_dot_dot(m, n), (i : Num) => f(i + p))"),
      t1374,
    ),
  )
}

///|
let nsum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_OFFSET")

///|
/// `NSUM_OFFSET`
pub fn nsum_offset() -> @kernel.Thm {
  nsum_offset_c.get()
}

///|
/// NSUM_OFFSET_0
fn step_194() -> Unit raise {
  let t1375 = @simp.simp_tac(
    @list.List([
      @equal.gsym(nsum_offset()),
      @arith.add_clauses(),
      @arith.sub_add(),
    ]),
  )
  nsum_offset_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, m <= n → nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(0, n - m), (i : Num) => f(i + m))"),
      t1375,
    ),
  )
}

///|
let nsum_offset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_OFFSET_0")

///|
/// `NSUM_OFFSET_0`
pub fn nsum_offset_0() -> @kernel.Thm {
  nsum_offset_0_c.get()
}

///|
/// NSUM_CLAUSES_LEFT
fn step_195() -> Unit raise {
  let t1376 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @equal.gsym(numseg_lrec()),
        nsum_clauses(),
        finite_numseg(),
        in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  nsum_clauses_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, m <= n → nsum(op_dot_dot(m, n), f) == f(m) + nsum(op_dot_dot(m + 1, n), f)"),
      t1376,
    ),
  )
}

///|
let nsum_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLAUSES_LEFT",
)

///|
/// `NSUM_CLAUSES_LEFT`
pub fn nsum_clauses_left() -> @kernel.Thm {
  nsum_clauses_left_c.get()
}

///|
/// NSUM_CLAUSES_RIGHT
fn step_196() -> Unit raise {
  let t1377 = @simp.simp_tac(
    @list.List([@arith.lt_refl(), nsum_clauses_numseg(), @arith.suc_sub1()]),
  )
  let t1378 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t1377,
  )
  nsum_clauses_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, 0 < n && m <= n → nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(m, n - 1), f) + f(n)"),
      t1378,
    ),
  )
}

///|
let nsum_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_CLAUSES_RIGHT",
)

///|
/// `NSUM_CLAUSES_RIGHT`
pub fn nsum_clauses_right() -> @kernel.Thm {
  nsum_clauses_right_c.get()
}

///|
/// NSUM_PAIR
fn step_197() -> Unit raise {
  let t1379 = @simp.rewrite_tac(@list.List([nsum(), neutral_add()]))
  let t1380 = @tactics.then_tac(
    @tactics.mp_tac(@drule.match_mp(iterate_pair())(monoidal_add())),
    t1379,
  )
  nsum_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, nsum(op_dot_dot(2 * m, 2 * n + 1), f) == nsum(op_dot_dot(m, n), (i : Num) => f(2 * i) + f(2 * i + 1))"),
      t1380,
    ),
  )
}

///|
let nsum_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_PAIR")

///|
/// `NSUM_PAIR`
pub fn nsum_pair() -> @kernel.Thm {
  nsum_pair_c.get()
}

///|
/// NSUM_REFLECT
fn step_198() -> Unit raise {
  let t1386 = @simp.rewrite_tac(@list.List([neutral_add()]))
  let t1385 = @simp.gen_rewrite_tac(
    fn(
      x1382 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1383 = @equal.land_conv(x1382)
      fn(x1384 : @kernel.Term) -> @kernel.Thm raise { s1383(x1384) }
    },
    @list.List([@drule.match_mp(iterate_reflect())(monoidal_add())]),
  )
  let t1381 = @simp.rewrite_tac(@list.List([nsum()]))
  let t1387 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1381),
      t1385,
    ),
    t1386,
  )
  nsum_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Num, ∀ m : Num, ∀ n : Num, nsum(op_dot_dot(m, n), x) == (if n < m { 0 } else { nsum(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"),
      t1387,
    ),
  )
}

///|
let nsum_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_REFLECT")

///|
/// `NSUM_REFLECT`
pub fn nsum_reflect() -> @kernel.Thm {
  nsum_reflect_c.get()
}

///|
/// MOD_NSUM_MOD
fn step_199() -> Unit raise {
  let t1399 = @simp.rewrite_tac(@list.List([@arith.mod_mod_refl()]))
  let t1398 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@arith.mod_add_mod())]),
  )
  let t1397 = @simp.asm_rewrite_tac(@list.List([]))
  let t1396 = @simp.gen_rewrite_tac(
    fn(
      x1393 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1394 = @equal.land_conv(x1393)
      fn(x1395 : @kernel.Term) -> @kernel.Thm raise { s1394(x1395) }
    },
    @list.List([@equal.gsym(@arith.mod_add_mod())]),
  )
  let t1392 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1391 = @simp.simp_tac(@list.List([nsum_clauses()]))
  let t1390 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1389 = @simp.asm_rewrite_tac(
    @list.List([@arith.mod_zero(), @class.eta_ax()]),
  )
  let t1388 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1400 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                    t1388,
                  ),
                  t1389,
                ),
                t1390,
              ),
              t1391,
            ),
            t1392,
          ),
          t1396,
        ),
        t1397,
      ),
      t1398,
    ),
    t1399,
  )
  mod_nsum_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ n : Num, ∀ s : (A) -> Bool, FINITE(s) → MOD(nsum(s, f), n) == MOD(nsum(s, (i : A) => MOD(f(i), n)), n)"),
      t1400,
    ),
  )
}

///|
let mod_nsum_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_NSUM_MOD")

///|
/// `MOD_NSUM_MOD`
pub fn mod_nsum_mod() -> @kernel.Thm {
  mod_nsum_mod_c.get()
}

///|
/// MOD_NSUM_MOD_NUMSEG
fn step_200() -> Unit raise {
  let t1401 = @meson.meson_tac(@list.List([mod_nsum_mod(), finite_numseg()]))
  mod_nsum_mod_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ a : Num, ∀ b : Num, ∀ n : Num, MOD(nsum(op_dot_dot(a, b), f), n) == MOD(nsum(op_dot_dot(a, b), (i : Num) => MOD(f(i), n)), n)"),
      t1401,
    ),
  )
}

///|
let mod_nsum_mod_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MOD_NSUM_MOD_NUMSEG",
)

///|
/// `MOD_NSUM_MOD_NUMSEG`
pub fn mod_nsum_mod_numseg() -> @kernel.Thm {
  mod_nsum_mod_numseg_c.get()
}

///|
/// CONG_NSUM
fn step_201() -> Unit raise {
  let t1408 = @tactics.conv_tac(@int.number_rule)
  let t1407 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1406 = @simp.asm_rewrite_tac(@list.List([]))
  let t1402 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1403 = @term_syntax.parse_term("(g : (A) -> Num)")
  let t1404 = @term_syntax.parse_term("(f : (A) -> Num)")
  let t1405 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : Num) => (y : Num) => op_eq_eq(x, y, mod((n : Num)))"),
        t1404,
        t1403,
        t1402,
      ]),
      nsum_related(),
    ),
  )
  let t1409 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1405),
        t1406,
      ),
      t1407,
    ),
    t1408,
  )
  cong_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → op_eq_eq(f(x), g(x), mod(n))) → op_eq_eq(nsum(s, f), nsum(s, g), mod(n))"),
      t1409,
    ),
  )
}

///|
let cong_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_NSUM")

///|
/// `CONG_NSUM`
pub fn cong_nsum() -> @kernel.Thm {
  cong_nsum_c.get()
}

///|
/// iterate.ml:1907
fn step_202() -> Unit raise {
  let t1411 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), in_numseg()]))
  let t1410 = @tactics.match_mp_tac(nsum_eq())
  let t1412 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1410),
    t1411,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → nsum(s, (i : A) => f(i)) == nsum(s, g)) && (∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → nsum(op_dot_dot(a, b), (i : Num) => f(i)) == nsum(op_dot_dot(a, b), g)) && (∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → nsum({(y : _) | p(y)}, (i : _) => f(i)) == nsum({(y : _) | p(y)}, g))"),
    t1412,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
}

///|
/// CARD_UNIONS_IMAGE
fn step_203() -> Unit raise {
  let t1430 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1429 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_image(),
      @sets.finite_unions(),
      @sets.finite_union(),
      @sets.inter_unions(),
    ]),
  )
  let t1428 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t1427 = @tactics.conv_tac(@equal.sym_conv)
  let t1426 = @tactics.disch_then(
    @tactics.conjuncts_then2(
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
        (fn(
          x1422 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1423 = @tactics.subst1_tac(x1422)
          fn(
            x1424 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1423(x1424)
          }
        })(@equal.sym(x1425))
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t1421 = @simp.asm_simp_tac(@list.List([nsum_clauses()]))
  let t1420 = @tactics.disch_then(fn(
    x1418 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1418
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t1417 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1416 = @simp.rewrite_tac(
    @list.List([@sets.card_clauses(), nsum_clauses()]),
  )
  let t1415 = @simp.rewrite_tac(
    @list.List([
      @sets.unions_0(),
      @sets.unions_insert(),
      @sets.not_in_empty(),
      @sets.in_insert(),
    ]),
  )
  let t1414 = @simp.rewrite_tac(@list.List([@sets.image_clauses()]))
  let t1413 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1431 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                            @simp.once_rewrite_tac(
                              @list.List([@theorems.imp_conj()]),
                            ),
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
                ),
                t1420,
              ),
              t1421,
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
  )
  card_unions_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K, A) -> Bool, ∀ s : (K) -> Bool, FINITE(s) && (∀ t : K, IN(t, s) → FINITE(f(t))) && (∀ t : K, ∀ u : K, IN(t, s) && IN(u, s) && !(t == u) → INTER(f(t), f(u)) == {}) → CARD(UNIONS(IMAGE(f, s))) == nsum(s, (i : K) => CARD(f(i)))"),
      t1431,
    ),
  )
}

///|
let card_unions_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_UNIONS_IMAGE",
)

///|
/// `CARD_UNIONS_IMAGE`
pub fn card_unions_image() -> @kernel.Thm {
  card_unions_image_c.get()
}

///|
/// CARD_UNIONS
fn step_204() -> Unit raise {
  let t1432 = @simp.rewrite_tac(@list.List([@sets.image_id(), @class.eta_ax()]))
  let t1433 = @tactics.then_tac(
    @tactics.mp_tac(
      @bool.ispec(@term_syntax.parse_term("(x : (A) -> Bool) => x"), card_unions_image()),
    ),
    t1432,
  )
  card_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ t : (A) -> Bool, IN(t, s) → FINITE(t)) && (∀ t : (A) -> Bool, ∀ u : (A) -> Bool, IN(t, s) && IN(u, s) && !(t == u) → INTER(t, u) == {}) → CARD(UNIONS(s)) == nsum(s, CARD)"),
      t1433,
    ),
  )
}

///|
let card_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_UNIONS")

///|
/// `CARD_UNIONS`
pub fn card_unions() -> @kernel.Thm {
  card_unions_c.get()
}

///|
/// EXPAND_NSUM_CONV
fn step_205() -> Unit raise {
  let t1435 = @simp.rewrite_tac(
    @list.List([nsum_clauses_left(), nsum_sing_numseg(), nsum_triv_numseg()]),
  )
  let t1436 = (
    @term_syntax.parse_term("((n : Num) < (m : Num) → nsum(op_dot_dot(m, n), (f : (Num) -> Num)) == 0) && nsum(op_dot_dot(m, m), f) == f(m) && (m <= n → nsum(op_dot_dot(m, n), f) == f(m) + nsum(op_dot_dot(m + 1, n), f))"),
    t1435,
  )
  expand_nsum_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x1434 : (
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
          @tactics.prove(x1434.0, x1434.1)
        })(t1436),
      ) {
      More(pth_0, tail=More(pth_1, tail=More(pth_2, tail=Empty))) => {
        let ns_tm = @term_syntax.parse_term("op_dot_dot")
        let f_tm = @term_syntax.parse_term("(f : (Num) -> Num)")
        let m_tm = @term_syntax.parse_term("(m : Num)")
        let n_tm = @term_syntax.parse_term("(n : Num)")
        fn conv(x1437 : @kernel.Term) -> @kernel.Thm raise {
          let tm = x1437
          let (smn, ftm) = @kernel.dest_comb(tm)
          let (s, mn) = @kernel.dest_comb(smn)
          if !(@kernel.is_const(s) && @kernel.dest_const(s).0 == "nsum") {
            raise Failure("EXPAND_NSUM_CONV")
          } else {
            let (mtm, ntm) = @basics.dest_binop(ns_tm, mn)
            let m = @basics.dest_numeral(mtm)
            let n = @basics.dest_numeral(ntm)
            if @num.lt_num(n, m) {
              let th1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_0,
              )
              @bool.mp(
                th1,
                @bool.eqt_elim(
                  @calc_num.num_lt_conv(@equal.lhand(@kernel.concl(th1))),
                ),
              )
            } else if @num.eq_num(n, m) {
              let t1438 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm)]),
                pth_1,
              )
              @equal.conv_rule(
                @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                t1438,
              )
            } else {
              let th1_1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_2,
              )
              let th2 = @bool.mp(
                th1_1,
                @bool.eqt_elim(
                  @calc_num.num_le_conv(@equal.lhand(@kernel.concl(th1_1))),
                ),
              )
              let t1439 = @equal.thenc(
                @equal.land_conv(@equal.land_conv(@calc_num.num_add_conv)),
                conv,
              )
              @equal.conv_rule(
                @equal.rand_conv(
                  @equal.comb2_conv(
                    @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                    t1439,
                  ),
                ),
                th2,
              )
            }
          }
        }
        conv
      }
      _ => raise @lib.MatchFailure("tscript.ml:1952")
    },
  )
}

///|
let expand_nsum_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "EXPAND_NSUM_CONV",
)

///|
/// `EXPAND_NSUM_CONV`
pub fn expand_nsum_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_nsum_conv_c.get()(x)
}

///|
/// iterate.ml:1982
fn step_206() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// sum
fn step_207() -> Unit raise {
  sum_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(sum : ((A) -> Bool, (A) -> Real) -> Real) == iterate(op_plus)"),
    ),
  )
}

///|
let sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum")

///|
/// `sum`
pub fn sum() -> @kernel.Thm {
  sum_c.get()
}

///|
/// NEUTRAL_REAL_ADD
fn step_208() -> Unit raise {
  let t1441 = @meson.meson_tac(
    @list.List([@realax.real_add_lid(), @calc_int.real_add_rid()]),
  )
  let t1440 = @tactics.match_mp_tac(@class.select_unique())
  let t1442 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([neutral()])), t1440),
    t1441,
  )
  neutral_real_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("neutral(op_plus) == real_of_num(0)"),
      t1442,
    ),
  )
}

///|
let neutral_real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NEUTRAL_REAL_ADD",
)

///|
/// `NEUTRAL_REAL_ADD`
pub fn neutral_real_add() -> @kernel.Thm {
  neutral_real_add_c.get()
}

///|
/// MONOIDAL_REAL_ADD
fn step_209() -> Unit raise {
  let t1443 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([monoidal(), neutral_real_add()])),
    @calc_rat.real_arith_tac,
  )
  monoidal_real_add_c.set(
    @tactics.prove(@term_syntax.parse_term("(monoidal : ((Real, Real) -> Real) -> Bool)(op_plus)"), t1443),
  )
}

///|
let monoidal_real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_REAL_ADD",
)

///|
/// `MONOIDAL_REAL_ADD`
pub fn monoidal_real_add() -> @kernel.Thm {
  monoidal_real_add_c.get()
}

///|
/// SUM_DEGENERATE
fn step_210() -> Unit raise {
  let t1445 = @simp.simp_tac(
    @list.List([iterate(), support(), neutral_real_add()]),
  )
  let t1444 = @simp.rewrite_tac(@list.List([sum()]))
  let t1446 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1444),
    t1445,
  )
  sum_degenerate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, !FINITE({(x : A) | IN(x, s) && !(f(x) == real_of_num(0))}) → sum(s, f) == real_of_num(0)"),
      t1446,
    ),
  )
}

///|
let sum_degenerate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DEGENERATE")

///|
/// `SUM_DEGENERATE`
pub fn sum_degenerate() -> @kernel.Thm {
  sum_degenerate_c.get()
}

///|
/// SUM_CLAUSES
fn step_211() -> Unit raise {
  let t1449 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1448 = @tactics.match_mp_tac(iterate_clauses())
  let t1447 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1450 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
        t1447,
      ),
      t1448,
    ),
    t1449,
  )
  sum_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Real, sum({}, f) == real_of_num(0)) && (∀ x : B, ∀ f : (B) -> Real, ∀ s : (B) -> Bool, FINITE(s) → sum(INSERT(x, s), f) == (if IN(x, s) { sum(s, f) } else { f(x) + sum(s, f) }))"),
      t1450,
    ),
  )
}

///|
let sum_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_CLAUSES")

///|
/// `SUM_CLAUSES`
pub fn sum_clauses() -> @kernel.Thm {
  sum_clauses_c.get()
}

///|
/// SUM_UNION
fn step_212() -> Unit raise {
  let t1451 = @simp.simp_tac(
    @list.List([sum(), iterate_union(), monoidal_real_add()]),
  )
  sum_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → sum(UNION(s, t), f) == sum(s, f) + sum(t, f)"),
      t1451,
    ),
  )
}

///|
let sum_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_UNION")

///|
/// `SUM_UNION`
pub fn sum_union() -> @kernel.Thm {
  sum_union_c.get()
}

///|
/// SUM_DIFF
fn step_213() -> Unit raise {
  let t1452 = @simp.simp_tac(
    @list.List([
      @real.real_eq_sub_ladd(),
      sum(),
      iterate_diff(),
      monoidal_real_add(),
    ]),
  )
  sum_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) → sum(DIFF(s, t), f) == sum(s, f) - sum(t, f)"),
      t1452,
    ),
  )
}

///|
let sum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DIFF")

///|
/// `SUM_DIFF`
pub fn sum_diff() -> @kernel.Thm {
  sum_diff_c.get()
}

///|
/// SUM_INCL_EXCL
fn step_214() -> Unit raise {
  let t1454 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1453 = @tactics.match_mp_tac(iterate_incl_excl())
  let t1455 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
      t1453,
    ),
    t1454,
  )
  sum_incl_excl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> Real, FINITE(s) && FINITE(t) → sum(s, f) + sum(t, f) == sum(UNION(s, t), f) + sum(INTER(s, t), f)"),
      t1455,
    ),
  )
}

///|
let sum_incl_excl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INCL_EXCL")

///|
/// `SUM_INCL_EXCL`
pub fn sum_incl_excl() -> @kernel.Thm {
  sum_incl_excl_c.get()
}

///|
/// SUM_SUPPORT
fn step_215() -> Unit raise {
  let t1456 = @simp.simp_tac(@list.List([sum(), iterate(), support_support()]))
  sum_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, sum(support(op_plus, f, s), f) == sum(s, f)"),
      t1456,
    ),
  )
}

///|
let sum_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SUPPORT")

///|
/// `SUM_SUPPORT`
pub fn sum_support() -> @kernel.Thm {
  sum_support_c.get()
}

///|
/// SUM_ADD
fn step_216() -> Unit raise {
  let t1457 = @simp.simp_tac(
    @list.List([sum(), iterate_op(), monoidal_real_add()]),
  )
  sum_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → sum(s, (x : A) => f(x) + g(x)) == sum(s, f) + sum(s, g)"),
      t1457,
    ),
  )
}

///|
let sum_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ADD")

///|
/// `SUM_ADD`
pub fn sum_add() -> @kernel.Thm {
  sum_add_c.get()
}

///|
/// SUM_ADD_GEN
fn step_217() -> Unit raise {
  let t1460 = @tactics.accept_tac(monoidal_real_add())
  let t1459 = @tactics.match_mp_tac(iterate_op_gen())
  let t1458 = @equal.gsym(support())
  let t1461 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.gsym(neutral_real_add()), t1458, sum()]),
      ),
      t1459,
    ),
    t1460,
  )
  sum_add_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE({(x : A) | IN(x, s) && !(f(x) == real_of_num(0))}) && FINITE({(x : A) | IN(x, s) && !(g(x) == real_of_num(0))}) → sum(s, (x : A) => f(x) + g(x)) == sum(s, f) + sum(s, g)"),
      t1461,
    ),
  )
}

///|
let sum_add_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ADD_GEN")

///|
/// `SUM_ADD_GEN`
pub fn sum_add_gen() -> @kernel.Thm {
  sum_add_gen_c.get()
}

///|
/// SUM_EQ_0
fn step_218() -> Unit raise {
  let t1462 = @simp.simp_tac(
    @list.List([iterate_eq_neutral(), monoidal_real_add()]),
  )
  let t1463 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
    t1462,
  )
  sum_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == real_of_num(0)) → sum(s, f) == real_of_num(0)"),
      t1463,
    ),
  )
}

///|
let sum_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_EQ_0")

///|
/// `SUM_EQ_0`
pub fn sum_eq_0() -> @kernel.Thm {
  sum_eq_0_c.get()
}

///|
/// SUM_0
fn step_219() -> Unit raise {
  let t1464 = @simp.simp_tac(@list.List([sum_eq_0()]))
  sum_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, sum(s, (n : A) => real_of_num(0)) == real_of_num(0)"),
      t1464,
    ),
  )
}

///|
let sum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_0")

///|
/// `SUM_0`
pub fn sum_0() -> @kernel.Thm {
  sum_0_c.get()
}

///|
/// SUM_LMUL
fn step_220() -> Unit raise {
  let t1480 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      @calc_int.real_mul_rzero(),
      @calc_int.real_mul_lzero(),
      @realax.real_add_ldistrib(),
    ]),
  )
  let t1479 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1478 = @simp.rewrite_tac(@list.List([@equal.gsym(sum())]))
  let t1476 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1477 = @tactics.spec_tac(
    @term_syntax.parse_term("support(op_plus, (f : (A) -> Real), (s : (A) -> Bool))"),
    t1476,
  )
  let t1475 = @tactics.undisch_tac(
    @term_syntax.parse_term("FINITE(support(op_plus, (f : (A) -> Real), (s : (A) -> Bool)))"),
  )
  let t1474 = @simp.rewrite_tac(
    @list.List([neutral_real_add(), @calc_int.real_mul_rzero()]),
  )
  let t1473 = @list.List([
    @simp.asm_simp_tac(
      @list.List([support(), @realarith.real_entire(), neutral_real_add()]),
    ),
    @tactics.all_tac,
  ])
  let t1472 = @tactics.subgoal_then(
    @term_syntax.parse_term("support(op_plus, (x : A) => (c : Real) * (f : (A) -> Real)(x), (s : (A) -> Bool)) == support(op_plus, f, s)"),
    fn(
      x1469 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1470 = @tactics.subst1_tac(x1469)
      fn(
        x1471 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1470(x1471)
      }
    },
  )
  let t1468 = @simp.once_rewrite_tac(@list.List([iterate_expand_cases()]))
  let t1467 = @simp.rewrite_tac(@list.List([sum()]))
  let t1466 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_mul_lzero(), sum_0()]),
  )
  let t1465 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Real) == real_of_num(0)"))
  let t1481 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t1465,
                          ),
                          t1466,
                        ),
                        t1467,
                      ),
                      t1468,
                    ),
                    t1472,
                  ),
                  t1473,
                ),
                @class.cond_cases_tac,
              ),
              t1474,
            ),
            t1475,
          ),
          t1477,
        ),
        t1478,
      ),
      t1479,
    ),
    t1480,
  )
  sum_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ c : Real, ∀ s : (A) -> Bool, sum(s, (x : A) => c * f(x)) == c * sum(s, f)"),
      t1481,
    ),
  )
}

///|
let sum_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LMUL")

///|
/// `SUM_LMUL`
pub fn sum_lmul() -> @kernel.Thm {
  sum_lmul_c.get()
}

///|
/// SUM_RMUL
fn step_221() -> Unit raise {
  let t1482 = @simp.rewrite_tac(@list.List([sum_lmul()]))
  let t1483 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t1482,
  )
  sum_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ c : Real, ∀ s : (A) -> Bool, sum(s, (x : A) => f(x) * c) == sum(s, f) * c"),
      t1483,
    ),
  )
}

///|
let sum_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_RMUL")

///|
/// `SUM_RMUL`
pub fn sum_rmul() -> @kernel.Thm {
  sum_rmul_c.get()
}

///|
/// SUM_NEG
fn step_222() -> Unit raise {
  let t1484 = @simp.simp_tac(@list.List([sum_lmul()]))
  let t1485 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) == -real_of_num(1) * x"))]),
    ),
    t1484,
  )
  sum_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, sum(s, (x : A) => -f(x)) == -sum(s, f)"),
      t1485,
    ),
  )
}

///|
let sum_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_NEG")

///|
/// `SUM_NEG`
pub fn sum_neg() -> @kernel.Thm {
  sum_neg_c.get()
}

///|
/// SUM_SUB
fn step_223() -> Unit raise {
  let t1486 = @simp.simp_tac(@list.List([sum_neg(), sum_add()]))
  let t1487 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_sub()])),
    t1486,
  )
  sum_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → sum(s, (x : A) => f(x) - g(x)) == sum(s, f) - sum(s, g)"),
      t1487,
    ),
  )
}

///|
let sum_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SUB")

///|
/// `SUM_SUB`
pub fn sum_sub() -> @kernel.Thm {
  sum_sub_c.get()
}

///|
/// SUM_LE
fn step_224() -> Unit raise {
  let t1489 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      @realax.real_le_refl(),
      @real.real_le_add2(),
      @sets.in_insert(),
    ]),
  )
  let t1488 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1490 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()])),
          @tactics.gen_tac,
        ),
        @tactics.gen_tac,
      ),
      t1488,
    ),
    t1489,
  )
  sum_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= g(x)) → sum(s, f) <= sum(s, g)"),
      t1490,
    ),
  )
}

///|
let sum_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LE")

///|
/// `SUM_LE`
pub fn sum_le() -> @kernel.Thm {
  sum_le_c.get()
}

///|
/// SUM_LT
fn step_225() -> Unit raise {
  let t1506 = @simp.asm_simp_tac(
    @list.List([
      @real.real_lte_add2(),
      sum_le(),
      @sets.in_delete(),
      @sets.finite_delete(),
    ]),
  )
  let t1505 = @simp.asm_simp_tac(
    @list.List([sum_clauses(), @sets.finite_delete(), @sets.in_delete()]),
  )
  let t1503 = @sets.set_tac(@list.List([]))
  let t1504 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("IN((a : A), (s : (A) -> Bool))")),
      t1503,
    ),
    @tactics.all_tac,
  ])
  let t1502 = @tactics.subgoal_then(
    @term_syntax.parse_term("(s : (A) -> Bool) == INSERT((a : A), DELETE(s, a))"),
    fn(
      x1499 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1500 = @tactics.subst1_tac(x1499)
      fn(
        x1501 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1500(x1501)
      }
    },
  )
  let t1498 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac),
  )
  let t1497 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s1492 = @tactics.assume_tac(x1491)
          fn(
            x1493 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1492(x1493)
          }
        },
        fn(
          x1494 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1495 = @tactics.mp_tac(x1494)
          fn(
            x1496 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1495(x1496)
          }
        },
      ),
    ),
  )
  let t1507 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1497),
            t1498,
          ),
          t1502,
        ),
        t1504,
      ),
      t1505,
    ),
    t1506,
  )
  sum_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= g(x)) && (∃ x : A, IN(x, s) && f(x) < g(x)) → sum(s, f) < sum(s, g)"),
      t1507,
    ),
  )
}

///|
let sum_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LT")

///|
/// `SUM_LT`
pub fn sum_lt() -> @kernel.Thm {
  sum_lt_c.get()
}

///|
/// SUM_LT_ALL
fn step_226() -> Unit raise {
  let t1508 = @meson.meson_tac(
    @list.List([@sets.member_not_empty(), @realarith.real_lt_imp_le(), sum_lt()]),
  )
  sum_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < g(x)) → sum(s, f) < sum(s, g)"),
      t1508,
    ),
  )
}

///|
let sum_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LT_ALL")

///|
/// `SUM_LT_ALL`
pub fn sum_lt_all() -> @kernel.Thm {
  sum_lt_all_c.get()
}

///|
/// SUM_POS_LT
fn step_227() -> Unit raise {
  let t1513 = @meson.asm_meson_tac(@list.List([]))
  let t1511 = @tactics.match_mp_tac(sum_lt())
  let t1512 = @list.List([
    @simp.rewrite_tac(@list.List([sum_0(), @realax.real_le_refl()])),
    t1511,
  ])
  let t1510 = @tactics.exists_tac(
    @term_syntax.parse_term("sum((s : (A) -> Bool), (i : A) => real_of_num(0))"),
  )
  let t1509 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1514 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1509),
          t1510,
        ),
        @tactics.conj_tac,
      ),
      t1512,
    ),
    t1513,
  )
  sum_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → real_of_num(0) <= f(x)) && (∃ x : A, IN(x, s) && real_of_num(0) < f(x)) → real_of_num(0) < sum(s, f)"),
      t1514,
    ),
  )
}

///|
let sum_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_POS_LT")

///|
/// `SUM_POS_LT`
pub fn sum_pos_lt() -> @kernel.Thm {
  sum_pos_lt_c.get()
}

///|
/// SUM_POS_LT_ALL
fn step_228() -> Unit raise {
  let t1516 = @meson.asm_meson_tac(
    @list.List([@sets.member_not_empty(), @realarith.real_lt_imp_le()]),
  )
  let t1515 = @tactics.match_mp_tac(sum_pos_lt())
  let t1517 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1515),
    t1516,
  )
  sum_pos_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, FINITE(s) && !(s == {}) && (∀ i : A, IN(i, s) → real_of_num(0) < f(i)) → real_of_num(0) < sum(s, f)"),
      t1517,
    ),
  )
}

///|
let sum_pos_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_POS_LT_ALL")

///|
/// `SUM_POS_LT_ALL`
pub fn sum_pos_lt_all() -> @kernel.Thm {
  sum_pos_lt_all_c.get()
}

///|
/// SUM_EQ
fn step_229() -> Unit raise {
  let t1519 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1518 = @tactics.match_mp_tac(iterate_eq())
  let t1520 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1518),
    t1519,
  )
  sum_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → sum(s, f) == sum(s, g)"),
      t1520,
    ),
  )
}

///|
let sum_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_EQ")

///|
/// `SUM_EQ`
pub fn sum_eq() -> @kernel.Thm {
  sum_eq_c.get()
}

///|
/// SUM_ABS
fn step_230() -> Unit raise {
  let t1521 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      @calc_int.real_abs_num(),
      @realax.real_le_refl(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("abs((a : Real)) <= (b : Real) → abs((x : Real) + a) <= abs(x) + b"),
      ),
    ]),
  )
  let t1522 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t1521,
  )
  sum_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → abs(sum(s, f)) <= sum(s, (x : A) => abs(f(x)))"),
      t1522,
    ),
  )
}

///|
let sum_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ABS")

///|
/// `SUM_ABS`
pub fn sum_abs() -> @kernel.Thm {
  sum_abs_c.get()
}

///|
/// SUM_ABS_LE
fn step_231() -> Unit raise {
  let t1527 = @simp.asm_rewrite_tac(@list.List([]))
  let t1526 = @tactics.match_mp_tac(sum_le())
  let t1525 = @simp.asm_simp_tac(@list.List([sum_abs()]))
  let t1524 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => abs((f : (A) -> Real)(x)))"))
  let t1523 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1528 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1523),
          t1524,
        ),
        t1525,
      ),
      t1526,
    ),
    t1527,
  )
  sum_abs_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → abs(f(x)) <= g(x)) → abs(sum(s, f)) <= sum(s, g)"),
      t1528,
    ),
  )
}

///|
let sum_abs_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ABS_LE")

///|
/// `SUM_ABS_LE`
pub fn sum_abs_le() -> @kernel.Thm {
  sum_abs_le_c.get()
}

///|
/// SUM_CONST
fn step_232() -> Unit raise {
  let t1530 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1529 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      @sets.card_clauses(),
      @equal.gsym(@real.real_of_num_suc()),
    ]),
  )
  let t1531 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.match_mp_tac(@sets.finite_induct_strong()),
        ),
        t1529,
      ),
      t1530,
    ),
    @calc_rat.real_arith_tac,
  )
  sum_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ s : (A) -> Bool, FINITE(s) → sum(s, (n : A) => c) == real_of_num(CARD(s)) * c"),
      t1531,
    ),
  )
}

///|
let sum_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_CONST")

///|
/// `SUM_CONST`
pub fn sum_const() -> @kernel.Thm {
  sum_const_c.get()
}

///|
/// SUM_POS_LE
fn step_233() -> Unit raise {
  let t1539 = @simp.asm_simp_tac(@list.List([sum_0(), @sets.in_elim_thm()]))
  let t1536 = @term_syntax.parse_term("{(x : A) | IN(x, (s : (A) -> Bool)) && !((f : (A) -> Real)(x) == real_of_num(0))}")
  let t1537 = @term_syntax.parse_term("(f : (A) -> Real)")
  let t1538 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : A) => real_of_num(0)"), t1537, t1536]),
      sum_le(),
    ),
  )
  let t1535 = @simp.rewrite_tac(@list.List([support(), neutral_real_add()]))
  let t1534 = @simp.once_rewrite_tac(@list.List([@equal.gsym(sum_support())]))
  let t1533 = @simp.asm_simp_tac(
    @list.List([sum_degenerate(), @realax.real_le_refl()]),
  )
  let t1532 = @class.asm_cases_tac(
    @term_syntax.parse_term("FINITE({(x : A) | IN(x, (s : (A) -> Bool)) && !((f : (A) -> Real)(x) == real_of_num(0))})"),
  )
  let t1540 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1532),
            t1533,
          ),
          t1534,
        ),
        t1535,
      ),
      t1538,
    ),
    t1539,
  )
  sum_pos_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → real_of_num(0) <= (f : (A) -> Real)(x)) → real_of_num(0) <= sum(s, f)"),
      t1540,
    ),
  )
}

///|
let sum_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_POS_LE")

///|
/// `SUM_POS_LE`
pub fn sum_pos_le() -> @kernel.Thm {
  sum_pos_le_c.get()
}

///|
/// SUM_POS_BOUND
fn step_234() -> Unit raise {
  let t1544 = @meson.meson_tac(
    @list.List([
      sum_pos_le(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && x + y <= (b : Real) → x <= b && y <= b"),
      ),
    ]),
  )
  let t1543 = @simp.simp_tac(
    @list.List([sum_clauses(), @sets.not_in_empty(), @sets.in_insert()]),
  )
  let t1542 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1541 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1545 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          t1541,
        ),
        t1542,
      ),
      t1543,
    ),
    t1544,
  )
  sum_pos_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ b : Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → real_of_num(0) <= f(x)) && sum(s, f) <= b → (∀ x : A, IN(x, s) → f(x) <= b)"),
      t1545,
    ),
  )
}

///|
let sum_pos_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_POS_BOUND")

///|
/// `SUM_POS_BOUND`
pub fn sum_pos_bound() -> @kernel.Thm {
  sum_pos_bound_c.get()
}

///|
/// SUM_POS_EQ_0
fn step_235() -> Unit raise {
  let t1546 = @meson.meson_tac(@list.List([sum_pos_bound(), sum_pos_le()]))
  let t1547 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())])),
    t1546,
  )
  sum_pos_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → real_of_num(0) <= f(x)) && sum(s, f) == real_of_num(0) → (∀ x : A, IN(x, s) → f(x) == real_of_num(0))"),
      t1547,
    ),
  )
}

///|
let sum_pos_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_POS_EQ_0")

///|
/// `SUM_POS_EQ_0`
pub fn sum_pos_eq_0() -> @kernel.Thm {
  sum_pos_eq_0_c.get()
}

///|
/// SUM_ZERO_EXISTS
fn step_236() -> Unit raise {
  let t1557 = @simp.asm_rewrite_tac(
    @list.List([sum_neg(), @calc_int.real_neg_0()]),
  )
  let t1556 = @tactics.match_mp_tac(sum_pos_eq_0())
  let t1555 = @list.List([
    @tactics.all_tac,
    @simp.once_rewrite_tac(
      @list.List([
        @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == real_of_num(0)) == (-x == real_of_num(0))")),
      ]),
    ),
  ])
  let t1554 = @simp.asm_rewrite_tac(@list.List([]))
  let t1551 = @term_syntax.parse_term("(∃ j : A, ∃ k : A, IN(j, (s : (A) -> Bool)) && (u : (A) -> Real)(j) < real_of_num(0) && IN(k, s) && u(k) > real_of_num(0)) || (∀ i : A, IN(i, s) → real_of_num(0) <= u(i)) || (∀ i : A, IN(i, s) → real_of_num(0) <= -u(i))")
  let t1552 = @meson.meson(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("(real_of_num(0) <= -(u : Real)) == !(u > real_of_num(0)) && (real_of_num(0) <= u) == !(u < real_of_num(0))"),
      ),
    ]),
    t1551,
  )
  let t1553 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
    x1548 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1549 = @tactics.assume_tac(x1548)
    fn(
      x1550 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1549(x1550)
    }
  })(t1552)
  let t1558 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1553),
            t1554,
          ),
          @tactics.disj1_tac,
        ),
        t1555,
      ),
      t1556,
    ),
    t1557,
  )
  sum_zero_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && sum(s, u) == real_of_num(0) → (∀ i : A, IN(i, s) → u(i) == real_of_num(0)) || (∃ j : A, ∃ k : A, IN(j, s) && u(j) < real_of_num(0) && IN(k, s) && u(k) > real_of_num(0))"),
      t1558,
    ),
  )
}

///|
let sum_zero_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_ZERO_EXISTS",
)

///|
/// `SUM_ZERO_EXISTS`
pub fn sum_zero_exists() -> @kernel.Thm {
  sum_zero_exists_c.get()
}

///|
/// SUM_DELETE
fn step_237() -> Unit raise {
  let t1559 = @simp.simp_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((y : Real) == (z : Real) - (x : Real)) == (x + y == z)")),
      sum(),
      iterate_delete(),
      monoidal_real_add(),
    ]),
  )
  sum_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → sum(DELETE(s, a), f) == sum(s, f) - f(a)"),
      t1559,
    ),
  )
}

///|
let sum_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DELETE")

///|
/// `SUM_DELETE`
pub fn sum_delete() -> @kernel.Thm {
  sum_delete_c.get()
}

///|
/// SUM_DELETE_CASES
fn step_238() -> Unit raise {
  let t1560 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) → DELETE(s, a) == s")),
      sum_delete(),
    ]),
  )
  let t1561 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.repeat_tac(@tactics.strip_tac),
      @class.cond_cases_tac,
    ),
    t1560,
  )
  sum_delete_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ a : A, FINITE(s) → sum(DELETE(s, a), f) == (if IN(a, s) { sum(s, f) - f(a) } else { sum(s, f) })"),
      t1561,
    ),
  )
}

///|
let sum_delete_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_DELETE_CASES",
)

///|
/// `SUM_DELETE_CASES`
pub fn sum_delete_cases() -> @kernel.Thm {
  sum_delete_cases_c.get()
}

///|
/// SUM_SING
fn step_239() -> Unit raise {
  let t1562 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      @sets.finite_rules(),
      @sets.not_in_empty(),
      @calc_int.real_add_rid(),
    ]),
  )
  sum_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ x : A, sum({x}, f) == f(x)"), t1562),
  )
}

///|
let sum_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SING")

///|
/// `SUM_SING`
pub fn sum_sing() -> @kernel.Thm {
  sum_sing_c.get()
}

///|
/// SUM_DELTA
fn step_240() -> Unit raise {
  let t1563 = @simp.simp_tac(@list.List([iterate_delta(), monoidal_real_add()]))
  let t1564 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
    t1563,
  )
  sum_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, sum(s, (x : A) => if x == a { (b : Real) } else { real_of_num(0) }) == (if IN(a, s) { b } else { real_of_num(0) })"),
      t1564,
    ),
  )
}

///|
let sum_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DELTA")

///|
/// `SUM_DELTA`
pub fn sum_delta() -> @kernel.Thm {
  sum_delta_c.get()
}

///|
/// SUM_SWAP
fn step_241() -> Unit raise {
  let t1566 = @simp.simp_tac(
    @list.List([sum_clauses(), sum_0(), sum_add(), @class.eta_ax()]),
  )
  let t1565 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1567 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
        ),
      ),
      t1565,
    ),
    t1566,
  )
  sum_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> Real, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → sum(s, (i : A) => sum(t, f(i))) == sum(t, (j : B) => sum(s, (i : A) => f(i, j)))"),
      t1567,
    ),
  )
}

///|
let sum_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SWAP")

///|
/// `SUM_SWAP`
pub fn sum_swap() -> @kernel.Thm {
  sum_swap_c.get()
}

///|
/// SUM_IMAGE
fn step_242() -> Unit raise {
  let t1569 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1568 = @tactics.match_mp_tac(iterate_image())
  let t1570 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
      t1568,
    ),
    t1569,
  )
  sum_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> Real, ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → sum(IMAGE(f, s), g) == sum(s, o(g, f))"),
      t1570,
    ),
  )
}

///|
let sum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_IMAGE")

///|
/// `SUM_IMAGE`
pub fn sum_image() -> @kernel.Thm {
  sum_image_c.get()
}

///|
/// SUM_SUPERSET
fn step_243() -> Unit raise {
  let t1571 = @simp.simp_tac(
    @list.List([
      sum(),
      @equal.gsym(neutral_real_add()),
      iterate_superset(),
      monoidal_real_add(),
    ]),
  )
  sum_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == real_of_num(0)) → sum(v, f) == sum(u, f)"),
      t1571,
    ),
  )
}

///|
let sum_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SUPERSET")

///|
/// `SUM_SUPERSET`
pub fn sum_superset() -> @kernel.Thm {
  sum_superset_c.get()
}

///|
/// SUM_UNIV
fn step_244() -> Unit raise {
  let t1573 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1572 = @tactics.match_mp_tac(iterate_univ())
  let t1574 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1572),
    t1573,
  )
  sum_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) → sum(s, f) == sum(UNIV, f)"),
      t1574,
    ),
  )
}

///|
let sum_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_UNIV")

///|
/// `SUM_UNIV`
pub fn sum_univ() -> @kernel.Thm {
  sum_univ_c.get()
}

///|
/// SUM_UNION_RZERO
fn step_245() -> Unit raise {
  let t1575 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("UNION((u : (_) -> Bool), (v : (_) -> Bool)) == UNION(u, DIFF(v, u))"),
    t1575,
  )
  let t1578 = @meson.asm_meson_tac(
    @list.List([@sets.in_union(), @sets.in_diff(), @sets.subset()]),
  )
  let t1577 = @tactics.match_mp_tac(sum_superset())
  let t1576 = @simp.once_rewrite_tac(@list.List([lemma]))
  let t1579 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1576),
      t1577,
    ),
    t1578,
  )
  sum_union_rzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, FINITE(u) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == real_of_num(0)) → sum(UNION(u, v), f) == sum(u, f)"),
      t1579,
    ),
  )
}

///|
let sum_union_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_UNION_RZERO",
)

///|
/// `SUM_UNION_RZERO`
pub fn sum_union_rzero() -> @kernel.Thm {
  sum_union_rzero_c.get()
}

///|
/// SUM_UNION_LZERO
fn step_246() -> Unit raise {
  let t1580 = @meson.meson_tac(
    @list.List([sum_union_rzero(), @sets.union_comm()]),
  )
  sum_union_lzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, FINITE(v) && (∀ x : A, IN(x, u) && !IN(x, v) → f(x) == real_of_num(0)) → sum(UNION(u, v), f) == sum(v, f)"),
      t1580,
    ),
  )
}

///|
let sum_union_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_UNION_LZERO",
)

///|
/// `SUM_UNION_LZERO`
pub fn sum_union_lzero() -> @kernel.Thm {
  sum_union_lzero_c.get()
}

///|
/// SUM_RESTRICT
fn step_247() -> Unit raise {
  let t1582 = @simp.asm_simp_tac(@list.List([]))
  let t1581 = @tactics.match_mp_tac(sum_eq())
  let t1583 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1581),
    t1582,
  )
  sum_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → sum(s, (x : A) => if IN(x, s) { f(x) } else { real_of_num(0) }) == sum(s, f)"),
      t1583,
    ),
  )
}

///|
let sum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_RESTRICT")

///|
/// `SUM_RESTRICT`
pub fn sum_restrict() -> @kernel.Thm {
  sum_restrict_c.get()
}

///|
/// SUM_BOUND
fn step_248() -> Unit raise {
  let t1584 = @simp.simp_tac(@list.List([@equal.gsym(sum_const()), sum_le()]))
  sum_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= b) → sum(s, f) <= real_of_num(CARD(s)) * b"),
      t1584,
    ),
  )
}

///|
let sum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BOUND")

///|
/// `SUM_BOUND`
pub fn sum_bound() -> @kernel.Thm {
  sum_bound_c.get()
}

///|
/// SUM_BOUND_GEN
fn step_249() -> Unit raise {
  let t1585 = @meson.meson_tac(
    @list.List([
      sum_bound(),
      @real.real_div_lmul(),
      @realax.real_of_num_eq(),
      @sets.has_size_0(),
      @sets.has_size(),
    ]),
  )
  sum_bound_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) <= b / real_of_num(CARD(s))) → sum(s, f) <= b"),
      t1585,
    ),
  )
}

///|
let sum_bound_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BOUND_GEN")

///|
/// `SUM_BOUND_GEN`
pub fn sum_bound_gen() -> @kernel.Thm {
  sum_bound_gen_c.get()
}

///|
/// SUM_ABS_BOUND
fn step_250() -> Unit raise {
  let t1588 = @simp.asm_simp_tac(@list.List([sum_bound(), sum_abs()]))
  let t1587 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => abs((f : (A) -> Real)(x)))"))
  let t1586 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1589 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1586),
      t1587,
    ),
    t1588,
  )
  sum_abs_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && (∀ x : A, IN(x, s) → abs(f(x)) <= b) → abs(sum(s, f)) <= real_of_num(CARD(s)) * b"),
      t1589,
    ),
  )
}

///|
let sum_abs_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ABS_BOUND")

///|
/// `SUM_ABS_BOUND`
pub fn sum_abs_bound() -> @kernel.Thm {
  sum_abs_bound_c.get()
}

///|
/// SUM_BOUND_LT
fn step_251() -> Unit raise {
  let t1594 = @simp.asm_simp_tac(
    @list.List([sum_const(), @realax.real_le_refl()]),
  )
  let t1593 = @meson.asm_meson_tac(@list.List([]))
  let t1592 = @simp.asm_rewrite_tac(@list.List([]))
  let t1595 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(sum_lt()), t1592),
      t1593,
    ),
    t1594,
  ])
  let t1591 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => (b : Real))"))
  let t1590 = @tactics.match_mp_tac(@realarith.real_lte_trans())
  let t1596 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1590),
        t1591,
      ),
      @tactics.conj_tac,
    ),
    t1595,
  )
  sum_bound_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= b) && (∃ x : A, IN(x, s) && f(x) < b) → sum(s, f) < real_of_num(CARD(s)) * b"),
      t1596,
    ),
  )
}

///|
let sum_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BOUND_LT")

///|
/// `SUM_BOUND_LT`
pub fn sum_bound_lt() -> @kernel.Thm {
  sum_bound_lt_c.get()
}

///|
/// SUM_BOUND_LT_ALL
fn step_252() -> Unit raise {
  let t1597 = @meson.meson_tac(
    @list.List([
      @sets.member_not_empty(),
      @realarith.real_lt_imp_le(),
      sum_bound_lt(),
    ]),
  )
  sum_bound_lt_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < b) → sum(s, f) < real_of_num(CARD(s)) * b"),
      t1597,
    ),
  )
}

///|
let sum_bound_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_BOUND_LT_ALL",
)

///|
/// `SUM_BOUND_LT_ALL`
pub fn sum_bound_lt_all() -> @kernel.Thm {
  sum_bound_lt_all_c.get()
}

///|
/// SUM_BOUND_LT_GEN
fn step_253() -> Unit raise {
  let t1598 = @meson.meson_tac(
    @list.List([
      sum_bound_lt_all(),
      @real.real_div_lmul(),
      @realax.real_of_num_eq(),
      @sets.has_size_0(),
      @sets.has_size(),
    ]),
  )
  sum_bound_lt_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Real, ∀ b : Real, FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → f(x) < b / real_of_num(CARD(s))) → sum(s, f) < b"),
      t1598,
    ),
  )
}

///|
let sum_bound_lt_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_BOUND_LT_GEN",
)

///|
/// `SUM_BOUND_LT_GEN`
pub fn sum_bound_lt_gen() -> @kernel.Thm {
  sum_bound_lt_gen_c.get()
}

///|
/// SUM_UNION_EQ
fn step_254() -> Unit raise {
  let t1599 = @meson.meson_tac(
    @list.List([
      sum_union(),
      @sets.disjoint(),
      @sets.finite_subset(),
      @sets.subset_union(),
    ]),
  )
  sum_union_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ u : (A) -> Bool, FINITE(u) && INTER(s, t) == {} && UNION(s, t) == u → sum(s, (f : (A) -> Real)) + sum(t, f) == sum(u, f)"),
      t1599,
    ),
  )
}

///|
let sum_union_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_UNION_EQ")

///|
/// `SUM_UNION_EQ`
pub fn sum_union_eq() -> @kernel.Thm {
  sum_union_eq_c.get()
}

///|
/// SUM_EQ_SUPERSET
fn step_255() -> Unit raise {
  let t1600 = @meson.meson_tac(@list.List([sum_superset(), sum_eq()]))
  sum_eq_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ x : A, IN(x, t) → f(x) == (g : (A) -> Real)(x)) && (∀ x : A, IN(x, s) && !IN(x, t) → f(x) == real_of_num(0)) → sum(s, f) == sum(t, g)"),
      t1600,
    ),
  )
}

///|
let sum_eq_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_EQ_SUPERSET",
)

///|
/// `SUM_EQ_SUPERSET`
pub fn sum_eq_superset() -> @kernel.Thm {
  sum_eq_superset_c.get()
}

///|
/// SUM_RESTRICT_SET
fn step_256() -> Unit raise {
  let t1602 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1601 = @tactics.match_mp_tac(iterate_restrict_set())
  let t1603 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
      t1601,
    ),
    t1602,
  )
  sum_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Real, sum({(x : A) | IN(x, s) && P(x)}, f) == sum(s, (x : A) => if P(x) { f(x) } else { real_of_num(0) })"),
      t1603,
    ),
  )
}

///|
let sum_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_RESTRICT_SET",
)

///|
/// `SUM_RESTRICT_SET`
pub fn sum_restrict_set() -> @kernel.Thm {
  sum_restrict_set_c.get()
}

///|
/// SUM_SUM_RESTRICT
fn step_257() -> Unit raise {
  let t1607 = @tactics.disch_then(fn(
    x1605 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1605
    @simp.rewrite_tac(@list.List([@drule.match_mp(sum_swap())(th)]))
  })
  let t1604 = @simp.simp_tac(@list.List([sum_restrict_set()]))
  let t1608 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1604),
    t1607,
  )
  sum_sum_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ f : (A, B) -> Real, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → sum(s, (x : A) => sum({(y : B) | IN(y, t) && R(x, y)}, (y : B) => f(x, y))) == sum(t, (y : B) => sum({(x : A) | IN(x, s) && R(x, y)}, (x : A) => f(x, y)))"),
      t1608,
    ),
  )
}

///|
let sum_sum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_SUM_RESTRICT",
)

///|
/// `SUM_SUM_RESTRICT`
pub fn sum_sum_restrict() -> @kernel.Thm {
  sum_sum_restrict_c.get()
}

///|
/// CARD_EQ_SUM
fn step_258() -> Unit raise {
  let t1609 = @simp.simp_tac(
    @list.List([sum_const(), @realarith.real_mul_rid()]),
  )
  card_eq_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → real_of_num(CARD(s)) == sum(s, (x : A) => real_of_num(1))"),
      t1609,
    ),
  )
}

///|
let card_eq_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_SUM")

///|
/// `CARD_EQ_SUM`
pub fn card_eq_sum() -> @kernel.Thm {
  card_eq_sum_c.get()
}

///|
/// SUM_MULTICOUNT_GEN
fn step_259() -> Unit raise {
  let t1624 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t1623 = @simp.asm_simp_tac(
    @list.List([sum_const(), @sets.finite_restrict()]),
  )
  let t1622 = @tactics.match_mp_tac(sum_eq())
  let t1625 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x1620 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th = x1620
          @simp.once_rewrite_tac(
            @list.List([@drule.match_mp(sum_sum_restrict())(th)]),
          )
        }),
        t1622,
      ),
      t1623,
    ),
    t1624,
  )
  let t1619 = @simp.asm_simp_tac(
    @list.List([card_eq_sum(), @sets.finite_restrict()]),
  )
  let t1618 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1617 = @simp.asm_rewrite_tac(@list.List([]))
  let t1626 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(sum_eq()), t1617),
        t1618,
      ),
      t1619,
    ),
    t1625,
  ])
  let t1616 = @tactics.exists_tac(
    @term_syntax.parse_term("sum((s : (A) -> Bool), (i : A) => sum({(j : B) | IN(j, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(i, j)}, (j : B) => real_of_num(1)))"),
  )
  let t1615 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1614 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
      let s1612 = @tactics.assume_tac(x1611)
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
    }),
  )
  let t1610 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1627 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1610),
            t1614,
          ),
          t1615,
        ),
        t1616,
      ),
      @tactics.conj_tac,
    ),
    t1626,
  )
  sum_multicount_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : (B) -> Num, FINITE(s) && FINITE(t) && (∀ j : B, IN(j, t) → CARD({(i : A) | IN(i, s) && R(i, j)}) == k(j)) → sum(s, (i : A) => real_of_num(CARD({(j : B) | IN(j, t) && R(i, j)}))) == sum(t, (i : B) => real_of_num(k(i)))"),
      t1627,
    ),
  )
}

///|
let sum_multicount_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_MULTICOUNT_GEN",
)

///|
/// `SUM_MULTICOUNT_GEN`
pub fn sum_multicount_gen() -> @kernel.Thm {
  sum_multicount_gen_c.get()
}

///|
/// SUM_MULTICOUNT
fn step_260() -> Unit raise {
  let t1631 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1632 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([sum_const(), @realax.real_of_num_mul()])),
    t1631,
  )
  let t1630 = @simp.asm_rewrite_tac(@list.List([]))
  let t1633 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(sum_multicount_gen()), t1630),
    t1632,
  ])
  let t1629 = @tactics.exists_tac(@term_syntax.parse_term("sum((t : (B) -> Bool), (i : B) => real_of_num((k : Num)))"))
  let t1628 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1634 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1628),
        t1629,
      ),
      @tactics.conj_tac,
    ),
    t1633,
  )
  sum_multicount_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ k : Num, FINITE(s) && FINITE(t) && (∀ j : B, IN(j, t) → CARD({(i : A) | IN(i, s) && R(i, j)}) == k) → sum(s, (i : A) => real_of_num(CARD({(j : B) | IN(j, t) && R(i, j)}))) == real_of_num(k * CARD(t))"),
      t1634,
    ),
  )
}

///|
let sum_multicount_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_MULTICOUNT")

///|
/// `SUM_MULTICOUNT`
pub fn sum_multicount() -> @kernel.Thm {
  sum_multicount_c.get()
}

///|
/// SUM_IMAGE_GEN
fn step_261() -> Unit raise {
  let t1636 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1635 = @tactics.match_mp_tac(iterate_image_gen())
  let t1637 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1635),
    t1636,
  )
  sum_image_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → sum(s, g) == sum(IMAGE(f, s), (y : B) => sum({(x : A) | IN(x, s) && f(x) == y}, g))"),
      t1637,
    ),
  )
}

///|
let sum_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_IMAGE_GEN")

///|
/// `SUM_IMAGE_GEN`
pub fn sum_image_gen() -> @kernel.Thm {
  sum_image_gen_c.get()
}

///|
/// SUM_GROUP
fn step_262() -> Unit raise {
  let t1650 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1649 = @tactics.match_mp_tac(sum_eq_0())
  let t1648 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1647 = @simp.asm_rewrite_tac(@list.List([]))
  let t1646 = @tactics.match_mp_tac(sum_superset())
  let t1645 = @tactics.disch_then(fn(
    x1642 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1643 = @tactics.subst1_tac(x1642)
    fn(
      x1644 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1643(x1644)
    }
  })
  let t1641 = @simp.asm_rewrite_tac(@list.List([]))
  let t1638 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1639 = @term_syntax.parse_term("(g : (A) -> Real)")
  let t1640 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (A) -> B)"), t1639, t1638]),
      sum_image_gen(),
    ),
  )
  let t1651 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1640,
                ),
                t1641,
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
  )
  sum_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && SUBSET(IMAGE(f, s), t) → sum(t, (y : B) => sum({(x : A) | IN(x, s) && f(x) == y}, g)) == sum(s, g)"),
      t1651,
    ),
  )
}

///|
let sum_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GROUP")

///|
/// `SUM_GROUP`
pub fn sum_group() -> @kernel.Thm {
  sum_group_c.get()
}

///|
/// SUM_GROUP_RELATION
fn step_263() -> Unit raise {
  let t1666 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1665 = @simp.rewrite_tac(@list.List([]))
  let t1664 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1663 = @tactics.match_mp_tac(sum_eq())
  let t1661 = @tactics.disch_then(fn(
    x1660 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1657 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1658 = @tactics.subst1_tac(x1657)
      fn(
        x1659 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1658(x1659)
      }
    })(@equal.sym(x1660))
  })
  let t1662 = @list.List([@meson.asm_meson_tac(@list.List([])), t1661])
  let t1656 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image()]),
  )
  let t1652 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1653 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1654 = @term_syntax.parse_term("(g : (A) -> Real)")
  let t1655 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : A) => select((y : B) => IN(y, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(x, y))"),
        t1654,
        t1653,
        t1652,
      ]),
      sum_group(),
    ),
  )
  let t1667 = @tactics.then_tac(
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
                      t1655,
                    ),
                    t1656,
                  ),
                  @tactics.ants_tac,
                ),
                t1662,
              ),
              t1663,
            ),
            t1664,
          ),
          t1665,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t1666,
  )
  sum_group_relation_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → existsunique((y : B) => IN(y, t) && R(x, y))) → sum(t, (y : B) => sum({(x : A) | IN(x, s) && R(x, y)}, g)) == sum(s, g)"),
      t1667,
    ),
  )
}

///|
let sum_group_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_GROUP_RELATION",
)

///|
/// `SUM_GROUP_RELATION`
pub fn sum_group_relation() -> @kernel.Thm {
  sum_group_relation_c.get()
}

///|
/// REAL_OF_NUM_SUM
fn step_264() -> Unit raise {
  let t1668 = @simp.simp_tac(
    @list.List([
      sum_clauses(),
      nsum_clauses(),
      @equal.gsym(@realax.real_of_num_add()),
    ]),
  )
  let t1669 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t1668,
  )
  real_of_num_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → real_of_num(nsum(s, f)) == sum(s, (x : A) => real_of_num(f(x)))"),
      t1669,
    ),
  )
}

///|
let real_of_num_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUM",
)

///|
/// `REAL_OF_NUM_SUM`
pub fn real_of_num_sum() -> @kernel.Thm {
  real_of_num_sum_c.get()
}

///|
/// SUM_SUBSET
fn step_265() -> Unit raise {
  let t1687 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_diff(),
      @calc_int.real_le_rneg(),
      @realax.real_add_lid(),
    ]),
  )
  let t1686 = @tactics.match_mp_tac(sum_pos_le())
  let t1685 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(sum_neg()), @sets.finite_diff()]),
  )
  let t1684 = @tactics.match_mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("real_of_num(0) <= -(x : Real) && real_of_num(0) <= (y : Real) → (a : Real) + x <= a + y"),
    ),
  )
  let t1682 = @tactics.disch_then(fn(
    x1679 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1680 = @tactics.subst1_tac(x1679)
    fn(
      x1681 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1680(x1681)
    }
  })
  let t1683 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.ants_tac,
      @list.List([@sets.set_tac(@list.List([])), t1682]),
    ),
  )
  let t1678 = @simp.asm_simp_tac(
    @list.List([@sets.finite_diff(), @sets.finite_inter()]),
  )
  let t1676 = @sets.set_rule(
    @term_syntax.parse_term("UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(v, u)) == v"),
  )
  let t1677 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(u, v)) == u")),
      t1676,
    ]),
  )
  let t1675 = @tactics.disch_then(fn(
    x1672 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1672
    let t1674 = @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("DIFF((u : (A) -> Bool), (v : (A) -> Bool))"), th),
    )
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("DIFF((v : (A) -> Bool), (u : (A) -> Bool))"), th)),
      t1674,
    )
  })
  let t1670 = @term_syntax.parse_term("INTER((u : (A) -> Bool), (v : (A) -> Bool))")
  let t1671 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (A) -> Real)"), t1670]),
      sum_union(),
    ),
  )
  let t1688 = @tactics.then_tac(
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
                      t1671,
                    ),
                    t1675,
                  ),
                  t1677,
                ),
                t1678,
              ),
              t1683,
            ),
            t1684,
          ),
          t1685,
        ),
        @tactics.conj_tac,
      ),
      t1686,
    ),
    t1687,
  )
  sum_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, ∀ v : (A) -> Bool, ∀ f : (A) -> Real, FINITE(u) && FINITE(v) && (∀ x : A, IN(x, DIFF(u, v)) → f(x) <= real_of_num(0)) && (∀ x : A, IN(x, DIFF(v, u)) → real_of_num(0) <= f(x)) → sum(u, f) <= sum(v, f)"),
      t1688,
    ),
  )
}

///|
let sum_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SUBSET")

///|
/// `SUM_SUBSET`
pub fn sum_subset() -> @kernel.Thm {
  sum_subset_c.get()
}

///|
/// SUM_SUBSET_SIMPLE
fn step_266() -> Unit raise {
  let t1690 = @meson.asm_meson_tac(
    @list.List([@sets.in_diff(), @sets.subset(), @sets.finite_subset()]),
  )
  let t1689 = @tactics.match_mp_tac(sum_subset())
  let t1691 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1689),
    t1690,
  )
  sum_subset_simple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : (A) -> Bool, ∀ v : (A) -> Bool, ∀ f : (A) -> Real, FINITE(v) && SUBSET(u, v) && (∀ x : A, IN(x, DIFF(v, u)) → real_of_num(0) <= f(x)) → sum(u, f) <= sum(v, f)"),
      t1691,
    ),
  )
}

///|
let sum_subset_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_SUBSET_SIMPLE",
)

///|
/// `SUM_SUBSET_SIMPLE`
pub fn sum_subset_simple() -> @kernel.Thm {
  sum_subset_simple_c.get()
}

///|
/// SUM_MUL_BOUND
fn step_267() -> Unit raise {
  let t1703 = @simp.asm_simp_tac(
    @list.List([@sets.sing_subset(), @sets.in_diff()]),
  )
  let t1702 = @tactics.match_mp_tac(sum_subset_simple())
  let t1701 = @simp.gen_rewrite_tac(
    fn(
      x1698 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1699 = @equal.land_conv(x1698)
      fn(x1700 : @kernel.Term) -> @kernel.Thm raise { s1699(x1700) }
    },
    @list.List([@equal.gsym(sum_sing())]),
  )
  let t1697 = @simp.asm_simp_tac(@list.List([]))
  let t1696 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1695 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : A)"))
  let t1694 = @simp.asm_rewrite_tac(@list.List([]))
  let t1693 = @tactics.match_mp_tac(sum_le())
  let t1692 = @simp.rewrite_tac(@list.List([@equal.gsym(sum_lmul())]))
  let t1704 = @tactics.then_tac(
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
                      t1692,
                    ),
                    t1693,
                  ),
                  t1694,
                ),
                t1695,
              ),
              @tactics.disch_tac,
            ),
            t1696,
          ),
          t1697,
        ),
        t1701,
      ),
      t1702,
    ),
    t1703,
  )
  sum_mul_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : (A) -> Real, ∀ b : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ i : A, IN(i, s) → real_of_num(0) <= a(i) && real_of_num(0) <= b(i)) → sum(s, (i : A) => a(i) * b(i)) <= sum(s, a) * sum(s, b)"),
      t1704,
    ),
  )
}

///|
let sum_mul_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_MUL_BOUND")

///|
/// `SUM_MUL_BOUND`
pub fn sum_mul_bound() -> @kernel.Thm {
  sum_mul_bound_c.get()
}

///|
/// SUM_IMAGE_NONZERO
fn step_268() -> Unit raise {
  let t1706 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1705 = @tactics.match_mp_tac(iterate_image_nonzero())
  let t1707 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(neutral_real_add()), sum()])),
      t1705,
    ),
    t1706,
  )
  sum_image_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : (B) -> Real, ∀ i : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) && i(x) == i(y) → d(i(x)) == real_of_num(0)) → sum(IMAGE(i, s), d) == sum(s, o(d, i))"),
      t1707,
    ),
  )
}

///|
let sum_image_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_IMAGE_NONZERO",
)

///|
/// `SUM_IMAGE_NONZERO`
pub fn sum_image_nonzero() -> @kernel.Thm {
  sum_image_nonzero_c.get()
}

///|
/// SUM_BIJECTION
fn step_269() -> Unit raise {
  let t1709 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1708 = @tactics.match_mp_tac(iterate_bijection())
  let t1710 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1708),
    t1709,
  )
  sum_bijection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ p : (A) -> A, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ y : A, IN(y, s) → existsunique((x : A) => IN(x, s) && p(x) == y)) → sum(s, f) == sum(s, o(f, p))"),
      t1710,
    ),
  )
}

///|
let sum_bijection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BIJECTION")

///|
/// `SUM_BIJECTION`
pub fn sum_bijection() -> @kernel.Thm {
  sum_bijection_c.get()
}

///|
/// SUM_SUM_PRODUCT
fn step_270() -> Unit raise {
  let t1712 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1711 = @tactics.match_mp_tac(iterate_iterate_product())
  let t1713 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1711),
    t1712,
  )
  sum_sum_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, ∀ x : (A, B) -> Real, FINITE(s) && (∀ i : A, IN(i, s) → FINITE(t(i))) → sum(s, (i : A) => sum(t(i), x(i))) == sum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) })"),
      t1713,
    ),
  )
}

///|
let sum_sum_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_SUM_PRODUCT",
)

///|
/// `SUM_SUM_PRODUCT`
pub fn sum_sum_product() -> @kernel.Thm {
  sum_sum_product_c.get()
}

///|
/// SUM_EQ_GENERAL
fn step_271() -> Unit raise {
  let t1715 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1714 = @tactics.match_mp_tac(iterate_eq_general())
  let t1716 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1714),
    t1715,
  )
  sum_eq_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Real, ∀ g : (B) -> Real, ∀ h : (A) -> B, (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && h(x) == y)) && (∀ x : A, IN(x, s) → IN(h(x), t) && g(h(x)) == f(x)) → sum(s, f) == sum(t, g)"),
      t1716,
    ),
  )
}

///|
let sum_eq_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_EQ_GENERAL")

///|
/// `SUM_EQ_GENERAL`
pub fn sum_eq_general() -> @kernel.Thm {
  sum_eq_general_c.get()
}

///|
/// SUM_EQ_GENERAL_INVERSES
fn step_272() -> Unit raise {
  let t1718 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1717 = @tactics.match_mp_tac(iterate_eq_general_inverses())
  let t1719 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1717),
    t1718,
  )
  sum_eq_general_inverses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Real, ∀ g : (B) -> Real, ∀ h : (A) -> B, ∀ k : (B) -> A, (∀ y : B, IN(y, t) → IN(k(y), s) && h(k(y)) == y) && (∀ x : A, IN(x, s) → IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) → sum(s, f) == sum(t, g)"),
      t1719,
    ),
  )
}

///|
let sum_eq_general_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_EQ_GENERAL_INVERSES",
)

///|
/// `SUM_EQ_GENERAL_INVERSES`
pub fn sum_eq_general_inverses() -> @kernel.Thm {
  sum_eq_general_inverses_c.get()
}

///|
/// SUM_INJECTION
fn step_273() -> Unit raise {
  let t1721 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1720 = @tactics.match_mp_tac(iterate_injection())
  let t1722 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sum()])), t1720),
    t1721,
  )
  sum_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ p : (A) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → sum(s, o(f, p)) == sum(s, f)"),
      t1722,
    ),
  )
}

///|
let sum_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INJECTION")

///|
/// `SUM_INJECTION`
pub fn sum_injection() -> @kernel.Thm {
  sum_injection_c.get()
}

///|
/// SUM_UNION_NONZERO
fn step_274() -> Unit raise {
  let t1724 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1723 = @tactics.match_mp_tac(iterate_union_nonzero())
  let t1725 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
      t1723,
    ),
    t1724,
  )
  sum_union_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, INTER(s, t)) → f(x) == real_of_num(0)) → sum(UNION(s, t), f) == sum(s, f) + sum(t, f)"),
      t1725,
    ),
  )
}

///|
let sum_union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_UNION_NONZERO",
)

///|
/// `SUM_UNION_NONZERO`
pub fn sum_union_nonzero() -> @kernel.Thm {
  sum_union_nonzero_c.get()
}

///|
/// SUM_UNIONS_NONZERO
fn step_275() -> Unit raise {
  let t1743 = @meson.asm_meson_tac(@list.List([]))
  let t1742 = @simp.asm_simp_tac(
    @list.List([@sets.finite_unions(), @sets.in_inter(), @sets.in_unions()]),
  )
  let t1741 = @tactics.match_mp_tac(sum_union_nonzero())
  let t1739 = @tactics.disch_then(fn(
    x1738 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1736 = @tactics.subst_all_tac(x1735)
      fn(
        x1737 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1736(x1737)
      }
    })(@equal.sym(x1738))
  })
  let t1740 = @list.List([@meson.asm_meson_tac(@list.List([])), t1739])
  let t1734 = @simp.asm_simp_tac(@list.List([sum_clauses()]))
  let t1733 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1732 = @tactics.disch_then(fn(
    x1730 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1730
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t1728 = @term_syntax.parse_term("(s : ((A) -> Bool) -> Bool)")
  let t1729 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t1728]),
  )
  let t1727 = @simp.rewrite_tac(
    @list.List([
      @sets.unions_0(),
      @sets.unions_insert(),
      sum_clauses(),
      @sets.in_insert(),
    ]),
  )
  let t1726 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1744 = @tactics.then_tac(
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
                            @simp.once_rewrite_tac(
                              @list.List([@theorems.imp_conj()]),
                            ),
                          ),
                          t1726,
                        ),
                        t1727,
                      ),
                      t1729,
                    ),
                    t1732,
                  ),
                  t1733,
                ),
                t1734,
              ),
              @tactics.ants_tac,
            ),
            t1740,
          ),
          @tactics.strip_tac,
        ),
        t1741,
      ),
      t1742,
    ),
    t1743,
  )
  sum_unions_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ t : (A) -> Bool, IN(t, s) → FINITE(t)) && (∀ t1 : (A) -> Bool, ∀ t2 : (A) -> Bool, ∀ x : A, IN(t1, s) && IN(t2, s) && !(t1 == t2) && IN(x, t1) && IN(x, t2) → f(x) == real_of_num(0)) → sum(UNIONS(s), f) == sum(s, (t : (A) -> Bool) => sum(t, f))"),
      t1744,
    ),
  )
}

///|
let sum_unions_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_UNIONS_NONZERO",
)

///|
/// `SUM_UNIONS_NONZERO`
pub fn sum_unions_nonzero() -> @kernel.Thm {
  sum_unions_nonzero_c.get()
}

///|
/// SUM_CASES
fn step_276() -> Unit raise {
  let t1746 = @simp.rewrite_tac(@list.List([monoidal_real_add()]))
  let t1745 = @tactics.match_mp_tac(iterate_cases())
  let t1747 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([sum(), @equal.gsym(neutral_real_add())])),
      t1745,
    ),
    t1746,
  )
  sum_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ P : (A) -> Bool, ∀ f : (A) -> Real, ∀ g : (A) -> Real, FINITE(s) → sum(s, (x : A) => if P(x) { f(x) } else { g(x) }) == sum({(x : A) | IN(x, s) && P(x)}, f) + sum({(x : A) | IN(x, s) && !P(x)}, g)"),
      t1747,
    ),
  )
}

///|
let sum_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_CASES")

///|
/// `SUM_CASES`
pub fn sum_cases() -> @kernel.Thm {
  sum_cases_c.get()
}

///|
/// SUM_CASES_1
fn step_277() -> Unit raise {
  let t1751 = @simp.rewrite_tac(@list.List([sum_sing()]))
  let t1750 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) → {(x : _) | IN(x, s) && x == a} == {a}"),
      ),
    ]),
  )
  let t1749 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@sets.delete()), sum_delete()]),
  )
  let t1748 = @simp.asm_simp_tac(@list.List([sum_cases()]))
  let t1752 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1748),
          t1749,
        ),
        t1750,
      ),
      t1751,
    ),
    @calc_rat.real_arith_tac,
  )
  sum_cases_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → sum(s, (x : A) => if x == a { (y : Real) } else { (f : (A) -> Real)(x) }) == sum(s, f) + (y - f(a))"),
      t1752,
    ),
  )
}

///|
let sum_cases_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_CASES_1")

///|
/// `SUM_CASES_1`
pub fn sum_cases_1() -> @kernel.Thm {
  sum_cases_1_c.get()
}

///|
/// SUM_LE_INCLUDED
fn step_278() -> Unit raise {
  let t1778 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1777 = @simp.asm_simp_tac(
    @list.List([sum_pos_le(), @sets.finite_restrict(), @sets.in_elim_thm()]),
  )
  let t1776 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t1775 = @tactics.match_mp_tac(sum_subset_simple())
  let t1773 = @list.List([
    @simp.asm_rewrite_tac(@list.List([sum_sing()])),
    @tactics.all_tac,
  ])
  let t1772 = @tactics.exists_tac(@term_syntax.parse_term("sum({(y : B)}, (g : (B) -> Real))"))
  let t1771 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1770 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)"))
  let t1769 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t1765 = @term_syntax.parse_term("(x : A)")
  let t1768 = @tactics.first_x_assum(fn(
    x1767 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1762 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1763 = @tactics.mp_tac(x1762)
      fn(
        x1764 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1763(x1764)
      }
    })(((x1766 : @kernel.Thm) => @bool.spec(t1765, x1766))(x1767))
  })
  let t1761 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t1760 = @simp.asm_rewrite_tac(@list.List([]))
  let t1774 = @list.List([
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
                          @tactics.match_mp_tac(sum_le()),
                          t1760,
                        ),
                        t1761,
                      ),
                      @tactics.disch_tac,
                    ),
                    t1768,
                  ),
                  t1769,
                ),
                t1770,
              ),
              @tactics.strip_tac,
            ),
            t1771,
          ),
          t1772,
        ),
        @tactics.conj_tac,
      ),
      t1773,
    ),
    @tactics.all_tac,
  ])
  let t1759 = @tactics.exists_tac(
    @term_syntax.parse_term("sum((s : (A) -> Bool), (y : A) => sum({(x : B) | IN(x, (t : (B) -> Bool)) && (i : (B) -> A)(x) == y}, (g : (B) -> Real)))"),
  )
  let t1758 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1756 = @simp.asm_rewrite_tac(@list.List([]))
  let t1755 = @tactics.match_mp_tac(@equal.gsym(sum_image_gen()))
  let t1757 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), t1755),
      t1756,
    ),
  ])
  let t1754 = @tactics.exists_tac(
    @term_syntax.parse_term("sum(IMAGE((i : (B) -> A), (t : (B) -> Bool)), (y : A) => sum({(x : B) | IN(x, t) && i(x) == y}, (g : (B) -> Real)))"),
  )
  let t1753 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1779 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t1753,
                        ),
                        t1754,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1757,
                  ),
                  t1758,
                ),
                t1759,
              ),
              @tactics.conj_tac,
            ),
            t1774,
          ),
          t1775,
        ),
        t1776,
      ),
      t1777,
    ),
    t1778,
  )
  sum_le_included_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (B) -> Real, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ i : (B) -> A, FINITE(s) && FINITE(t) && (∀ y : B, IN(y, t) → real_of_num(0) <= g(y)) && (∀ x : A, IN(x, s) → (∃ y : B, IN(y, t) && i(y) == x && f(x) <= g(y))) → sum(s, f) <= sum(t, g)"),
      t1779,
    ),
  )
}

///|
let sum_le_included_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_LE_INCLUDED",
)

///|
/// `SUM_LE_INCLUDED`
pub fn sum_le_included() -> @kernel.Thm {
  sum_le_included_c.get()
}

///|
/// SUM_IMAGE_LE
fn step_279() -> Unit raise {
  let t1784 = @meson.meson_tac(@list.List([@realax.real_le_refl()]))
  let t1783 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t1782 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1781 = @simp.asm_simp_tac(
    @list.List([@sets.finite_image(), @sets.forall_in_image()]),
  )
  let t1780 = @tactics.match_mp_tac(sum_le_included())
  let t1785 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1780),
          t1781,
        ),
        t1782,
      ),
      t1783,
    ),
    t1784,
  )
  sum_image_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> Real, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → real_of_num(0) <= g(f(x))) → sum(IMAGE(f, s), g) <= sum(s, o(g, f))"),
      t1785,
    ),
  )
}

///|
let sum_image_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_IMAGE_LE")

///|
/// `SUM_IMAGE_LE`
pub fn sum_image_le() -> @kernel.Thm {
  sum_image_le_c.get()
}

///|
/// SUM_CLOSED
fn step_280() -> Unit raise {
  let t1794 = @simp.asm_simp_tac(
    @list.List([neutral_real_add(), @equal.gsym(sum())]),
  )
  let t1790 = @term_syntax.parse_term("(P : (Real) -> Bool)")
  let t1793 = @tactics.disch_then(fn(
    x1792 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1788 = @tactics.mp_tac(x1787)
      fn(
        x1789 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1788(x1789)
      }
    })(((x1791 : @kernel.Thm) => @bool.spec(t1790, x1791))(x1792))
  })
  let t1786 = @tactics.mp_tac(
    @drule.match_mp(iterate_closed())(monoidal_real_add()),
  )
  let t1795 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1786),
      t1793,
    ),
    t1794,
  )
  sum_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (A) -> Real, ∀ s : (A) -> Bool, P(real_of_num(0)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(sum(s, f))"),
      t1795,
    ),
  )
}

///|
let sum_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_CLOSED")

///|
/// `SUM_CLOSED`
pub fn sum_closed() -> @kernel.Thm {
  sum_closed_c.get()
}

///|
/// SUM_RELATED
fn step_281() -> Unit raise {
  let t1800 = @meson.asm_meson_tac(@list.List([]))
  let t1799 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(sum()), neutral_real_add()]),
  )
  let t1797 = @drule.match_mp(iterate_related())(monoidal_real_add())
  let t1798 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Real, Real) -> Bool)"), t1797),
  )
  let t1796 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1801 = @tactics.then_tac(
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
          t1796,
        ),
        t1798,
      ),
      t1799,
    ),
    t1800,
  )
  sum_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Real, Real) -> Bool, ∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, R(real_of_num(0), real_of_num(0)) && (∀ m : Real, ∀ n : Real, ∀ m' : Real, ∀ n' : Real, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(sum(s, f), sum(s, g))"),
      t1801,
    ),
  )
}

///|
let sum_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_RELATED")

///|
/// `SUM_RELATED`
pub fn sum_related() -> @kernel.Thm {
  sum_related_c.get()
}

///|
/// SUM_CLOSED_NONEMPTY
fn step_282() -> Unit raise {
  let t1810 = @simp.asm_simp_tac(
    @list.List([neutral_real_add(), @equal.gsym(sum())]),
  )
  let t1806 = @term_syntax.parse_term("(P : (Real) -> Bool)")
  let t1809 = @tactics.disch_then(fn(
    x1808 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1803 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1804 = @tactics.mp_tac(x1803)
      fn(
        x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1804(x1805)
      }
    })(((x1807 : @kernel.Thm) => @bool.spec(t1806, x1807))(x1808))
  })
  let t1802 = @tactics.mp_tac(
    @drule.match_mp(iterate_closed_nonempty())(monoidal_real_add()),
  )
  let t1811 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1802),
      t1809,
    ),
    t1810,
  )
  sum_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(sum(s, f))"),
      t1811,
    ),
  )
}

///|
let sum_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLOSED_NONEMPTY",
)

///|
/// `SUM_CLOSED_NONEMPTY`
pub fn sum_closed_nonempty() -> @kernel.Thm {
  sum_closed_nonempty_c.get()
}

///|
/// SUM_RELATED_NONEMPTY
fn step_283() -> Unit raise {
  let t1816 = @meson.asm_meson_tac(@list.List([]))
  let t1815 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(sum()), neutral_real_add()]),
  )
  let t1813 = @drule.match_mp(iterate_related_nonempty())(monoidal_real_add())
  let t1814 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Real, Real) -> Bool)"), t1813),
  )
  let t1812 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1817 = @tactics.then_tac(
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
          t1812,
        ),
        t1814,
      ),
      t1815,
    ),
    t1816,
  )
  sum_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Real, Real) -> Bool, ∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, (∀ m : Real, ∀ n : Real, ∀ m' : Real, ∀ n' : Real, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(sum(s, f), sum(s, g))"),
      t1817,
    ),
  )
}

///|
let sum_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_RELATED_NONEMPTY",
)

///|
/// `SUM_RELATED_NONEMPTY`
pub fn sum_related_nonempty() -> @kernel.Thm {
  sum_related_nonempty_c.get()
}

///|
/// REAL_OF_NUM_SUM_GEN
fn step_284() -> Unit raise {
  let t1821 = @simp.asm_simp_tac(@list.List([real_of_num_sum()]))
  let t1820 = @simp.rewrite_tac(
    @list.List([
      support(),
      neutral_add(),
      neutral_real_add(),
      @realax.real_of_num_eq(),
    ]),
  )
  let t1818 = @equal.gsym(nsum_support())
  let t1819 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(sum_support()), t1818]),
  )
  let t1822 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1819),
      t1820,
    ),
    t1821,
  )
  real_of_num_sum_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE({(i : A) | IN(i, s) && !(f(i) == 0)}) → real_of_num(nsum(s, f)) == sum(s, (x : A) => real_of_num(f(x)))"),
      t1822,
    ),
  )
}

///|
let real_of_num_sum_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUM_GEN",
)

///|
/// `REAL_OF_NUM_SUM_GEN`
pub fn real_of_num_sum_gen() -> @kernel.Thm {
  real_of_num_sum_gen_c.get()
}

///|
/// SUM_ADD_NUMSEG
fn step_285() -> Unit raise {
  let t1823 = @simp.simp_tac(@list.List([sum_add(), finite_numseg()]))
  sum_add_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == sum(op_dot_dot(m, n), f) + sum(op_dot_dot(m, n), g)"),
      t1823,
    ),
  )
}

///|
let sum_add_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ADD_NUMSEG")

///|
/// `SUM_ADD_NUMSEG`
pub fn sum_add_numseg() -> @kernel.Thm {
  sum_add_numseg_c.get()
}

///|
/// SUM_SUB_NUMSEG
fn step_286() -> Unit raise {
  let t1824 = @simp.simp_tac(@list.List([sum_sub(), finite_numseg()]))
  sum_sub_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (i : Num) => f(i) - g(i)) == sum(op_dot_dot(m, n), f) - sum(op_dot_dot(m, n), g)"),
      t1824,
    ),
  )
}

///|
let sum_sub_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SUB_NUMSEG")

///|
/// `SUM_SUB_NUMSEG`
pub fn sum_sub_numseg() -> @kernel.Thm {
  sum_sub_numseg_c.get()
}

///|
/// SUM_LE_NUMSEG
fn step_287() -> Unit raise {
  let t1825 = @simp.simp_tac(
    @list.List([sum_le(), finite_numseg(), in_numseg()]),
  )
  sum_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) <= g(i)) → sum(op_dot_dot(m, n), f) <= sum(op_dot_dot(m, n), g)"),
      t1825,
    ),
  )
}

///|
let sum_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LE_NUMSEG")

///|
/// `SUM_LE_NUMSEG`
pub fn sum_le_numseg() -> @kernel.Thm {
  sum_le_numseg_c.get()
}

///|
/// SUM_EQ_NUMSEG
fn step_288() -> Unit raise {
  let t1826 = @meson.meson_tac(
    @list.List([sum_eq(), finite_numseg(), in_numseg()]),
  )
  sum_eq_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → sum(op_dot_dot(m, n), f) == sum(op_dot_dot(m, n), g)"),
      t1826,
    ),
  )
}

///|
let sum_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_EQ_NUMSEG")

///|
/// `SUM_EQ_NUMSEG`
pub fn sum_eq_numseg() -> @kernel.Thm {
  sum_eq_numseg_c.get()
}

///|
/// SUM_ABS_NUMSEG
fn step_289() -> Unit raise {
  let t1827 = @simp.simp_tac(@list.List([sum_abs(), finite_numseg()]))
  sum_abs_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, abs(sum(op_dot_dot(m, n), f)) <= sum(op_dot_dot(m, n), (i : Num) => abs(f(i)))"),
      t1827,
    ),
  )
}

///|
let sum_abs_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ABS_NUMSEG")

///|
/// `SUM_ABS_NUMSEG`
pub fn sum_abs_numseg() -> @kernel.Thm {
  sum_abs_numseg_c.get()
}

///|
/// SUM_CONST_NUMSEG
fn step_290() -> Unit raise {
  let t1828 = @simp.simp_tac(
    @list.List([sum_const(), finite_numseg(), card_numseg()]),
  )
  sum_const_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (n : Num) => c) == real_of_num(n + 1 - m) * c"),
      t1828,
    ),
  )
}

///|
let sum_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CONST_NUMSEG",
)

///|
/// `SUM_CONST_NUMSEG`
pub fn sum_const_numseg() -> @kernel.Thm {
  sum_const_numseg_c.get()
}

///|
/// SUM_EQ_0_NUMSEG
fn step_291() -> Unit raise {
  let t1829 = @simp.simp_tac(@list.List([sum_eq_0(), in_numseg()]))
  sum_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == real_of_num(0)) → sum(op_dot_dot(m, n), f) == real_of_num(0)"),
      t1829,
    ),
  )
}

///|
let sum_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_EQ_0_NUMSEG",
)

///|
/// `SUM_EQ_0_NUMSEG`
pub fn sum_eq_0_numseg() -> @kernel.Thm {
  sum_eq_0_numseg_c.get()
}

///|
/// SUM_TRIV_NUMSEG
fn step_292() -> Unit raise {
  let t1830 = @meson.meson_tac(
    @list.List([sum_eq_0_numseg(), @arith.le_trans(), @arith.not_lt()]),
  )
  sum_triv_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, n < m → sum(op_dot_dot(m, n), f) == real_of_num(0)"),
      t1830,
    ),
  )
}

///|
let sum_triv_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_TRIV_NUMSEG",
)

///|
/// `SUM_TRIV_NUMSEG`
pub fn sum_triv_numseg() -> @kernel.Thm {
  sum_triv_numseg_c.get()
}

///|
/// SUM_POS_LE_NUMSEG
fn step_293() -> Unit raise {
  let t1831 = @simp.simp_tac(
    @list.List([sum_pos_le(), finite_numseg(), in_numseg()]),
  )
  sum_pos_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ f : (Num) -> Real, (∀ p : Num, m <= p && p <= n → real_of_num(0) <= f(p)) → real_of_num(0) <= sum(op_dot_dot(m, n), f)"),
      t1831,
    ),
  )
}

///|
let sum_pos_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_POS_LE_NUMSEG",
)

///|
/// `SUM_POS_LE_NUMSEG`
pub fn sum_pos_le_numseg() -> @kernel.Thm {
  sum_pos_le_numseg_c.get()
}

///|
/// SUM_POS_EQ_0_NUMSEG
fn step_294() -> Unit raise {
  let t1832 = @meson.meson_tac(
    @list.List([sum_pos_eq_0(), finite_numseg(), in_numseg()]),
  )
  sum_pos_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ p : Num, m <= p && p <= n → real_of_num(0) <= f(p)) && sum(op_dot_dot(m, n), f) == real_of_num(0) → (∀ p : Num, m <= p && p <= n → f(p) == real_of_num(0))"),
      t1832,
    ),
  )
}

///|
let sum_pos_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_POS_EQ_0_NUMSEG",
)

///|
/// `SUM_POS_EQ_0_NUMSEG`
pub fn sum_pos_eq_0_numseg() -> @kernel.Thm {
  sum_pos_eq_0_numseg_c.get()
}

///|
/// SUM_SING_NUMSEG
fn step_295() -> Unit raise {
  let t1833 = @simp.simp_tac(@list.List([sum_sing(), numseg_sing()]))
  sum_sing_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ n : Num, sum(op_dot_dot(n, n), f) == f(n)"), t1833),
  )
}

///|
let sum_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_SING_NUMSEG",
)

///|
/// `SUM_SING_NUMSEG`
pub fn sum_sing_numseg() -> @kernel.Thm {
  sum_sing_numseg_c.get()
}

///|
/// SUM_CLAUSES_NUMSEG
fn step_296() -> Unit raise {
  let t1834 = @simp.rewrite_tac(@list.List([neutral_real_add(), sum()]))
  let t1835 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(iterate_clauses_numseg())(monoidal_real_add()),
    ),
    t1834,
  )
  sum_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, sum(op_dot_dot(m, 0), (f : (Num) -> Real)) == (if m == 0 { f(0) } else { real_of_num(0) })) && (∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { sum(op_dot_dot(m, n), f) + f(SUC(n)) } else { sum(op_dot_dot(m, n), f) }))"),
      t1835,
    ),
  )
}

///|
let sum_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLAUSES_NUMSEG",
)

///|
/// `SUM_CLAUSES_NUMSEG`
pub fn sum_clauses_numseg() -> @kernel.Thm {
  sum_clauses_numseg_c.get()
}

///|
/// SUM_CLAUSES_NUMSEG_LT
fn step_297() -> Unit raise {
  let t1836 = @simp.rewrite_tac(@list.List([neutral_real_add(), sum()]))
  let t1837 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(iterate_clauses_numseg_lt())(monoidal_real_add()),
    ),
    t1836,
  )
  sum_clauses_numseg_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("sum({(i : Num) | i < 0}, (f : (Num) -> Real)) == real_of_num(0) && (∀ k : Num, sum({(i : Num) | i < SUC(k)}, f) == sum({(i : Num) | i < k}, f) + f(k))"),
      t1837,
    ),
  )
}

///|
let sum_clauses_numseg_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLAUSES_NUMSEG_LT",
)

///|
/// `SUM_CLAUSES_NUMSEG_LT`
pub fn sum_clauses_numseg_lt() -> @kernel.Thm {
  sum_clauses_numseg_lt_c.get()
}

///|
/// SUM_CLAUSES_NUMSEG_LE
fn step_298() -> Unit raise {
  let t1838 = @simp.rewrite_tac(@list.List([neutral_real_add(), sum()]))
  let t1839 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(iterate_clauses_numseg_le())(monoidal_real_add()),
    ),
    t1838,
  )
  sum_clauses_numseg_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("sum({(i : Num) | i <= 0}, (f : (Num) -> Real)) == f(0) && (∀ k : Num, sum({(i : Num) | i <= SUC(k)}, f) == sum({(i : Num) | i <= k}, f) + f(SUC(k)))"),
      t1839,
    ),
  )
}

///|
let sum_clauses_numseg_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLAUSES_NUMSEG_LE",
)

///|
/// `SUM_CLAUSES_NUMSEG_LE`
pub fn sum_clauses_numseg_le() -> @kernel.Thm {
  sum_clauses_numseg_le_c.get()
}

///|
/// SUM_SWAP_NUMSEG
fn step_299() -> Unit raise {
  let t1841 = @simp.rewrite_tac(@list.List([finite_numseg()]))
  let t1840 = @tactics.match_mp_tac(sum_swap())
  let t1842 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1840),
    t1841,
  )
  sum_swap_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, ∀ f : (Num, Num) -> Real, sum(op_dot_dot(a, b), (i : Num) => sum(op_dot_dot(c, d), f(i))) == sum(op_dot_dot(c, d), (j : Num) => sum(op_dot_dot(a, b), (i : Num) => f(i, j)))"),
      t1842,
    ),
  )
}

///|
let sum_swap_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_SWAP_NUMSEG",
)

///|
/// `SUM_SWAP_NUMSEG`
pub fn sum_swap_numseg() -> @kernel.Thm {
  sum_swap_numseg_c.get()
}

///|
/// SUM_ADD_SPLIT
fn step_300() -> Unit raise {
  let t1843 = @simp.simp_tac(
    @list.List([
      numseg_add_split(),
      sum_union(),
      disjoint_numseg(),
      finite_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < x + 1")),
    ]),
  )
  sum_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → sum(op_dot_dot(m, n + p), f) == sum(op_dot_dot(m, n), f) + sum(op_dot_dot(n + 1, n + p), f)"),
      t1843,
    ),
  )
}

///|
let sum_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ADD_SPLIT")

///|
/// `SUM_ADD_SPLIT`
pub fn sum_add_split() -> @kernel.Thm {
  sum_add_split_c.get()
}

///|
/// SUM_OFFSET
fn step_301() -> Unit raise {
  let t1844 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1845 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        numseg_offset_image(),
        sum_image(),
        @arith.eq_add_rcancel(),
        finite_numseg(),
      ]),
    ),
    t1844,
  )
  sum_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m + p, n + p), f) == sum(op_dot_dot(m, n), (i : Num) => f(i + p))"),
      t1845,
    ),
  )
}

///|
let sum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_OFFSET")

///|
/// `SUM_OFFSET`
pub fn sum_offset() -> @kernel.Thm {
  sum_offset_c.get()
}

///|
/// SUM_OFFSET_0
fn step_302() -> Unit raise {
  let t1846 = @simp.simp_tac(
    @list.List([
      @equal.gsym(sum_offset()),
      @arith.add_clauses(),
      @arith.sub_add(),
    ]),
  )
  sum_offset_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n → sum(op_dot_dot(m, n), f) == sum(op_dot_dot(0, n - m), (i : Num) => f(i + m))"),
      t1846,
    ),
  )
}

///|
let sum_offset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_OFFSET_0")

///|
/// `SUM_OFFSET_0`
pub fn sum_offset_0() -> @kernel.Thm {
  sum_offset_0_c.get()
}

///|
/// SUM_CLAUSES_LEFT
fn step_303() -> Unit raise {
  let t1847 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @equal.gsym(numseg_lrec()),
        sum_clauses(),
        finite_numseg(),
        in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  sum_clauses_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n → sum(op_dot_dot(m, n), f) == f(m) + sum(op_dot_dot(m + 1, n), f)"),
      t1847,
    ),
  )
}

///|
let sum_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLAUSES_LEFT",
)

///|
/// `SUM_CLAUSES_LEFT`
pub fn sum_clauses_left() -> @kernel.Thm {
  sum_clauses_left_c.get()
}

///|
/// SUM_CLAUSES_RIGHT
fn step_304() -> Unit raise {
  let t1848 = @simp.simp_tac(
    @list.List([@arith.lt_refl(), sum_clauses_numseg(), @arith.suc_sub1()]),
  )
  let t1849 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t1848,
  )
  sum_clauses_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, 0 < n && m <= n → sum(op_dot_dot(m, n), f) == sum(op_dot_dot(m, n - 1), f) + f(n)"),
      t1849,
    ),
  )
}

///|
let sum_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_CLAUSES_RIGHT",
)

///|
/// `SUM_CLAUSES_RIGHT`
pub fn sum_clauses_right() -> @kernel.Thm {
  sum_clauses_right_c.get()
}

///|
/// SUM_PAIR
fn step_305() -> Unit raise {
  let t1850 = @simp.rewrite_tac(@list.List([sum(), neutral_real_add()]))
  let t1851 = @tactics.then_tac(
    @tactics.mp_tac(@drule.match_mp(iterate_pair())(monoidal_real_add())),
    t1850,
  )
  sum_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(2 * m, 2 * n + 1), f) == sum(op_dot_dot(m, n), (i : Num) => f(2 * i) + f(2 * i + 1))"),
      t1851,
    ),
  )
}

///|
let sum_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_PAIR")

///|
/// `SUM_PAIR`
pub fn sum_pair() -> @kernel.Thm {
  sum_pair_c.get()
}

///|
/// SUM_REFLECT
fn step_306() -> Unit raise {
  let t1857 = @simp.rewrite_tac(@list.List([neutral_real_add()]))
  let t1856 = @simp.gen_rewrite_tac(
    fn(
      x1853 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1854 = @equal.land_conv(x1853)
      fn(x1855 : @kernel.Term) -> @kernel.Thm raise { s1854(x1855) }
    },
    @list.List([@drule.match_mp(iterate_reflect())(monoidal_real_add())]),
  )
  let t1852 = @simp.rewrite_tac(@list.List([sum()]))
  let t1858 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1852),
      t1856,
    ),
    t1857,
  )
  sum_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), x) == (if n < m { real_of_num(0) } else { sum(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"),
      t1858,
    ),
  )
}

///|
let sum_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_REFLECT")

///|
/// `SUM_REFLECT`
pub fn sum_reflect() -> @kernel.Thm {
  sum_reflect_c.get()
}

///|
/// REAL_OF_NUM_SUM_NUMSEG
fn step_307() -> Unit raise {
  let t1859 = @simp.simp_tac(@list.List([real_of_num_sum(), finite_numseg()]))
  real_of_num_sum_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, real_of_num(nsum(op_dot_dot(m, n), f)) == sum(op_dot_dot(m, n), (i : Num) => real_of_num(f(i)))"),
      t1859,
    ),
  )
}

///|
let real_of_num_sum_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUM_NUMSEG",
)

///|
/// `REAL_OF_NUM_SUM_NUMSEG`
pub fn real_of_num_sum_numseg() -> @kernel.Thm {
  real_of_num_sum_numseg_c.get()
}

///|
/// SUM_PARTIAL_SUC
fn step_308() -> Unit raise {
  let t1879 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.add1()), @arith.add_clauses()]),
  )
  let t1877 = @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)"))
  let t1878 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.not_lt()), sum_triv_numseg(), t1877]),
  )
  let t1876 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
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
        let s1871 = @tactics.subst_all_tac(x1870)
        fn(
          x1872 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1871(x1872)
        }
      },
      fn(
        x1873 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1874 = @tactics.assume_tac(x1873)
        fn(
          x1875 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1874(x1875)
        }
      },
    ),
  )
  let t1867 = @simp.gen_rewrite_rule(
    fn(
      x1866 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1866
    },
    @list.List([@arith.le()]),
  )
  let t1869 = @tactics.first_x_assum(fn(
    x1868 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1864 = @tactics.mp_tac(x1863)
      fn(
        x1865 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1864(x1865)
      }
    })(t1867(x1868))
  })
  let t1862 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @class.cond_cases_tac,
        @simp.asm_simp_tac(@list.List([])),
      ),
      @list.List([@calc_rat.real_arith_tac, @int.asm_arith_tac]),
    ),
    @tactics.all_tac,
  ])
  let t1861 = @simp.asm_rewrite_tac(@list.List([sum_clauses_numseg()]))
  let t1860 = @simp.asm_simp_tac(
    @list.List([sum_triv_numseg(), @equal.gsym(@arith.not_le())]),
  )
  let t1880 = @tactics.then_tac(
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
                        @tactics.gen_tac,
                      ),
                      @nums.induct_tac,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t1860,
                ),
                t1861,
              ),
              t1862,
            ),
            t1869,
          ),
          t1876,
        ),
        t1878,
      ),
      t1879,
    ),
    @calc_rat.real_arith_tac,
  )
  sum_partial_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (k : Num) => f(k) * (g(k + 1) - g(k))) == (if m <= n { f(n + 1) * g(n + 1) - f(m) * g(m) - sum(op_dot_dot(m, n), (k : Num) => g(k + 1) * (f(k + 1) - f(k))) } else { real_of_num(0) })"),
      t1880,
    ),
  )
}

///|
let sum_partial_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PARTIAL_SUC",
)

///|
/// `SUM_PARTIAL_SUC`
pub fn sum_partial_suc() -> @kernel.Thm {
  sum_partial_suc_c.get()
}

///|
/// SUM_PARTIAL_PRE
fn step_309() -> Unit raise {
  let t1890 = @simp.rewrite_tac(@list.List([]))
  let t1889 = @tactics.disch_then(fn(
    x1886 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1887 = @tactics.subst1_tac(x1886)
    fn(
      x1888 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1887(x1888)
    }
  })
  let t1885 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t1881 = @term_syntax.parse_term("(n : Num)")
  let t1882 = @term_syntax.parse_term("(m : Num)")
  let t1883 = @term_syntax.parse_term("(k : Num) => (g : (Num) -> Real)(k - 1)")
  let t1884 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t1883, t1882, t1881]),
      sum_partial_suc(),
    ),
  )
  let t1891 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1884),
          t1885,
        ),
        t1889,
      ),
      @class.cond_cases_tac,
    ),
    t1890,
  )
  sum_partial_pre_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (k : Num) => f(k) * (g(k) - g(k - 1))) == (if m <= n { f(n + 1) * g(n) - f(m) * g(m - 1) - sum(op_dot_dot(m, n), (k : Num) => g(k) * (f(k + 1) - f(k))) } else { real_of_num(0) })"),
      t1891,
    ),
  )
}

///|
let sum_partial_pre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PARTIAL_PRE",
)

///|
/// `SUM_PARTIAL_PRE`
pub fn sum_partial_pre() -> @kernel.Thm {
  sum_partial_pre_c.get()
}

///|
/// SUM_DIFFS
fn step_310() -> Unit raise {
  let t1893 = @simp.rewrite_tac(
    @list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero(), sum_0()]),
  )
  let t1892 = @simp.once_rewrite_tac(@list.List([sum_partial_suc()]))
  let t1894 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(
          @list.List([
            @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) == -real_of_num(1) * (b - a)")),
          ]),
        ),
        t1892,
      ),
      t1893,
    ),
    @calc_rat.real_arith_tac,
  )
  sum_diffs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Real)(k) - f(k + 1)) == (if m <= n { f(m) - f(n + 1) } else { real_of_num(0) })"),
      t1894,
    ),
  )
}

///|
let sum_diffs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DIFFS")

///|
/// `SUM_DIFFS`
pub fn sum_diffs() -> @kernel.Thm {
  sum_diffs_c.get()
}

///|
/// SUM_DIFFS_ALT
fn step_311() -> Unit raise {
  let t1897 = @simp.asm_rewrite_tac(
    @list.List([@realarith.real_neg_sub(), @calc_int.real_neg_0()]),
  )
  let t1896 = @simp.simp_tac(@list.List([sum_neg(), sum_diffs()]))
  let t1895 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_neg_sub())]),
  )
  let t1898 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1895),
        t1896,
      ),
      @class.cond_cases_tac,
    ),
    t1897,
  )
  sum_diffs_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, sum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Real)(k + 1) - f(k)) == (if m <= n { f(n + 1) - f(m) } else { real_of_num(0) })"),
      t1898,
    ),
  )
}

///|
let sum_diffs_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DIFFS_ALT")

///|
/// `SUM_DIFFS_ALT`
pub fn sum_diffs_alt() -> @kernel.Thm {
  sum_diffs_alt_c.get()
}

///|
/// SUM_COMBINE_R
fn step_312() -> Unit raise {
  let t1900 = @simp.rewrite_tac(
    @list.List([
      finite_numseg(),
      @sets.extension(),
      @sets.in_inter(),
      @sets.in_union(),
      @sets.not_in_empty(),
      in_numseg(),
    ]),
  )
  let t1899 = @tactics.match_mp_tac(sum_union_eq())
  let t1901 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1899),
      t1900,
    ),
    @int.asm_arith_tac,
  )
  sum_combine_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 && n <= p → sum(op_dot_dot(m, n), f) + sum(op_dot_dot(n + 1, p), f) == sum(op_dot_dot(m, p), f)"),
      t1901,
    ),
  )
}

///|
let sum_combine_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_COMBINE_R")

///|
/// `SUM_COMBINE_R`
pub fn sum_combine_r() -> @kernel.Thm {
  sum_combine_r_c.get()
}

///|
/// SUM_COMBINE_L
fn step_313() -> Unit raise {
  let t1903 = @simp.rewrite_tac(
    @list.List([
      finite_numseg(),
      @sets.extension(),
      @sets.in_inter(),
      @sets.in_union(),
      @sets.not_in_empty(),
      in_numseg(),
    ]),
  )
  let t1902 = @tactics.match_mp_tac(sum_union_eq())
  let t1904 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1902),
      t1903,
    ),
    @int.asm_arith_tac,
  )
  sum_combine_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ p : Num, 0 < n && m <= n && n <= p + 1 → sum(op_dot_dot(m, n - 1), f) + sum(op_dot_dot(n, p), f) == sum(op_dot_dot(m, p), f)"),
      t1904,
    ),
  )
}

///|
let sum_combine_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_COMBINE_L")

///|
/// `SUM_COMBINE_L`
pub fn sum_combine_l() -> @kernel.Thm {
  sum_combine_l_c.get()
}

///|
/// iterate.ml:2783
fn step_314() -> Unit raise {
  let t1906 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), in_numseg()]))
  let t1905 = @tactics.match_mp_tac(sum_eq())
  let t1907 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1905),
    t1906,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → sum(s, (i : A) => f(i)) == sum(s, g)) && (∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → sum(op_dot_dot(a, b), (i : Num) => f(i)) == sum(op_dot_dot(a, b), g)) && (∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → sum({(y : _) | p(y)}, (i : _) => f(i)) == sum({(y : _) | p(y)}, g))"),
    t1907,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
}

///|
/// EXPAND_SUM_CONV
fn step_315() -> Unit raise {
  let t1909 = @simp.rewrite_tac(
    @list.List([sum_clauses_left(), sum_sing_numseg(), sum_triv_numseg()]),
  )
  let t1910 = (
    @term_syntax.parse_term("((n : Num) < (m : Num) → sum(op_dot_dot(m, n), (f : (Num) -> Real)) == real_of_num(0)) && sum(op_dot_dot(m, m), f) == f(m) && (m <= n → sum(op_dot_dot(m, n), f) == f(m) + sum(op_dot_dot(m + 1, n), f))"),
    t1909,
  )
  expand_sum_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x1908 : (
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
          @tactics.prove(x1908.0, x1908.1)
        })(t1910),
      ) {
      More(pth_0, tail=More(pth_1, tail=More(pth_2, tail=Empty))) => {
        let ns_tm = @term_syntax.parse_term("op_dot_dot")
        let f_tm = @term_syntax.parse_term("(f : (Num) -> Real)")
        let m_tm = @term_syntax.parse_term("(m : Num)")
        let n_tm = @term_syntax.parse_term("(n : Num)")
        fn conv(x1911 : @kernel.Term) -> @kernel.Thm raise {
          let tm = x1911
          let (smn, ftm) = @kernel.dest_comb(tm)
          let (s, mn) = @kernel.dest_comb(smn)
          if !(@kernel.is_const(s) && @kernel.dest_const(s).0 == "sum") {
            raise Failure("EXPAND_SUM_CONV")
          } else {
            let (mtm, ntm) = @basics.dest_binop(ns_tm, mn)
            let m = @basics.dest_numeral(mtm)
            let n = @basics.dest_numeral(ntm)
            if @num.lt_num(n, m) {
              let th1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_0,
              )
              @bool.mp(
                th1,
                @bool.eqt_elim(
                  @calc_num.num_lt_conv(@equal.lhand(@kernel.concl(th1))),
                ),
              )
            } else if @num.eq_num(n, m) {
              let t1912 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm)]),
                pth_1,
              )
              @equal.conv_rule(
                @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                t1912,
              )
            } else {
              let th1_1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_2,
              )
              let th2 = @bool.mp(
                th1_1,
                @bool.eqt_elim(
                  @calc_num.num_le_conv(@equal.lhand(@kernel.concl(th1_1))),
                ),
              )
              let t1913 = @equal.thenc(
                @equal.land_conv(@equal.land_conv(@calc_num.num_add_conv)),
                conv,
              )
              @equal.conv_rule(
                @equal.rand_conv(
                  @equal.comb2_conv(
                    @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                    t1913,
                  ),
                ),
                th2,
              )
            }
          }
        }
        conv
      }
      _ => raise @lib.MatchFailure("tscript.ml:2800")
    },
  )
}

///|
let expand_sum_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "EXPAND_SUM_CONV",
)

///|
/// `EXPAND_SUM_CONV`
pub fn expand_sum_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_sum_conv_c.get()(x)
}

///|
/// REAL_SUB_POW
fn step_316() -> Unit raise {
  let t1918 = @simp.simp_tac(
    @list.List([
      @arith.sub_0(),
      @arith.sub_add(),
      @arith.sub_refl(),
      @realax.real_pow(),
      @realax.real_mul_lid(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t1917 = @simp.rewrite_tac(@list.List([sum_diffs_alt(), @arith.le_0()]))
  let t1915 = @int.arith_rule(
    @term_syntax.parse_term("1 <= (n : Num) && (x : Num) <= n - 1 → n - 1 - x == n - (x + 1) && SUC(n - 1 - x) == n - x"),
  )
  let t1916 = @simp.simp_tac(
    @list.List([@equal.gsym(@realax.real_pow()), @arith.add1(), t1915]),
  )
  let t1914 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) - (y : Real)) * ((a : Real) * (b : Real)) == x * a * b - a * (y * b)"),
      ),
    ]),
  )
  let t1919 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@equal.gsym(sum_lmul())])),
          t1914,
        ),
        t1916,
      ),
      t1917,
    ),
    t1918,
  )
  real_sub_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ n : Num, 1 <= n → pow(x, n) - pow(y, n) == (x - y) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i) * pow(y, n - 1 - i))"),
      t1919,
    ),
  )
}

///|
let real_sub_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_POW")

///|
/// `REAL_SUB_POW`
pub fn real_sub_pow() -> @kernel.Thm {
  real_sub_pow_c.get()
}

///|
/// REAL_SUB_POW_R1
fn step_317() -> Unit raise {
  let t1930 = @simp.rewrite_tac(
    @list.List([@real.real_pow_one(), @realarith.real_mul_rid()]),
  )
  let t1927 = @drule.match_mp(real_sub_pow())
  let t1923 = @term_syntax.parse_term("real_of_num(1)")
  let t1924 = @list.List([@term_syntax.parse_term("(x : Real)"), t1923])
  let t1929 = @tactics.disch_then(fn(
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
    (fn(
      x1926 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1920 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1921 = @tactics.mp_tac(x1920)
        fn(
          x1922 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1921(x1922)
        }
      })(((x1925 : @kernel.Thm) => @bool.specl(t1924, x1925))(x1926))
    })(t1927(x1928))
  })
  let t1931 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1929),
    t1930,
  )
  real_sub_pow_r1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, 1 <= n → pow(x, n) - real_of_num(1) == (x - real_of_num(1)) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))"),
      t1931,
    ),
  )
}

///|
let real_sub_pow_r1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_POW_R1",
)

///|
/// `REAL_SUB_POW_R1`
pub fn real_sub_pow_r1() -> @kernel.Thm {
  real_sub_pow_r1_c.get()
}

///|
/// REAL_SUB_POW_L1
fn step_318() -> Unit raise {
  let t1933 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg()]))
  let t1932 = @simp.simp_tac(@list.List([real_sub_pow_r1()]))
  let t1934 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([@equal.gsym(@realarith.real_neg_sub())]),
      ),
      t1932,
    ),
    t1933,
  )
  real_sub_pow_l1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, 1 <= n → real_of_num(1) - pow(x, n) == (real_of_num(1) - x) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))"),
      t1934,
    ),
  )
}

///|
let real_sub_pow_l1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_POW_L1",
)

///|
/// `REAL_SUB_POW_L1`
pub fn real_sub_pow_l1() -> @kernel.Thm {
  real_sub_pow_l1_c.get()
}

///|
/// REAL_SUB_POLYFUN
fn step_319() -> Unit raise {
  let t1952 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t1951 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(a : Num) - (b : Num) - (c : Num) == a - (b + c)")),
      @arith.add_sym(),
    ]),
  )
  let t1950 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @sets.in_elim_pair_thm(), in_numseg()]),
  )
  let t1949 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x)))")),
  )
  let t1948 = @tactics.match_mp_tac(sum_eq_general_inverses())
  let t1946 = @equal.gsym(sum_rmul())
  let t1947 = @simp.simp_tac(
    @list.List([
      @equal.gsym(sum_lmul()),
      t1946,
      sum_sum_product(),
      finite_numseg(),
    ]),
  )
  let t1945 = @simp.rewrite_tac(@list.List([sum_lmul()]))
  let t1944 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((x : Real) * (s : Real)) == x * (a * s)")),
    ]),
  )
  let t1943 = @simp.simp_tac(@list.List([real_sub_pow(), @arith.add_clauses()]))
  let t1942 = @simp.rewrite_tac(
    @list.List([
      @real.real_sub_refl(),
      @realax.real_pow(),
      @calc_int.real_mul_rzero(),
      @realax.real_add_lid(),
    ]),
  )
  let t1940 = @bool.spec_all(@arith.le_0())
  let t1941 = @simp.gen_rewrite_tac(
    fn(
      x1937 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1938 = @equal.land_conv(x1937)
      fn(x1939 : @kernel.Term) -> @kernel.Thm raise { s1938(x1939) }
    },
    @list.List([@drule.match_mp(sum_clauses_left())(t1940)]),
  )
  let t1935 = @equal.gsym(@real.real_sub_ldistrib())
  let t1936 = @simp.rewrite_tac(
    @list.List([@equal.gsym(sum_sub_numseg()), t1935]),
  )
  let t1953 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                              t1936,
                            ),
                            t1941,
                          ),
                          t1942,
                        ),
                        t1943,
                      ),
                      t1944,
                    ),
                    t1945,
                  ),
                  @tactics.ap_term_tac,
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
      t1952,
    ),
    @int.arith_tac,
  )
  real_sub_polyfun_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : (Num) -> Real, ∀ x : Real, ∀ y : Real, ∀ n : Num, 1 <= n → sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)) - sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(y, i)) == (x - y) * sum(op_dot_dot(0, n - 1), (j : Num) => sum(op_dot_dot(j + 1, n), (i : Num) => a(i) * pow(y, i - j - 1)) * pow(x, j))"),
      t1953,
    ),
  )
}

///|
let real_sub_polyfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_POLYFUN",
)

///|
/// `REAL_SUB_POLYFUN`
pub fn real_sub_polyfun() -> @kernel.Thm {
  real_sub_polyfun_c.get()
}

///|
/// REAL_SUB_POLYFUN_ALT
fn step_320() -> Unit raise {
  let t1967 = @tactics.try_tac(
    @tactics.then_tac(@tactics.binop_tac, @tactics.ap_term_tac),
  )
  let t1966 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1965 = @simp.rewrite_tac(@list.List([in_numseg()]))
  let t1963 = @term_syntax.parse_term("(k : Num) => (j : Num) + (k + 1)")
  let t1964 = @tactics.map_every(
    fn(
      x1960 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1961 = @tactics.exists_tac(x1960)
      fn(
        x1962 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1961(x1962)
      }
    },
    @list.List([@term_syntax.parse_term("(i : Num) => i - ((j : Num) + 1)"), t1963]),
  )
  let t1959 = @tactics.match_mp_tac(sum_eq_general_inverses())
  let t1958 = @simp.rewrite_tac(@list.List([]))
  let t1957 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1956 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t1955 = @tactics.match_mp_tac(sum_eq_numseg())
  let t1954 = @simp.asm_simp_tac(@list.List([real_sub_polyfun()]))
  let t1968 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                              t1954,
                            ),
                            @tactics.ap_term_tac,
                          ),
                          t1955,
                        ),
                        t1956,
                      ),
                      t1957,
                    ),
                    t1958,
                  ),
                  @tactics.ap_thm_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t1959,
            ),
            t1964,
          ),
          t1965,
        ),
        t1966,
      ),
      t1967,
    ),
    @int.asm_arith_tac,
  )
  real_sub_polyfun_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : (Num) -> Real, ∀ x : Real, ∀ y : Real, ∀ n : Num, 1 <= n → sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)) - sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(y, i)) == (x - y) * sum(op_dot_dot(0, n - 1), (j : Num) => sum(op_dot_dot(0, n - j - 1), (k : Num) => a(j + (k + 1)) * pow(y, k)) * pow(x, j))"),
      t1968,
    ),
  )
}

///|
let real_sub_polyfun_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_POLYFUN_ALT",
)

///|
/// `REAL_SUB_POLYFUN_ALT`
pub fn real_sub_polyfun_alt() -> @kernel.Thm {
  real_sub_polyfun_alt_c.get()
}

///|
/// REAL_POLYFUN_ROOTBOUND
fn step_321() -> Unit raise {
  let t2002 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add1()),
      @realax.real_pow(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t2001 = @simp.rewrite_tac(
    @list.List([
      sum_sing_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 - n - 1 == 0")),
    ]),
  )
  let t2000 = @simp.rewrite_tac(
    @list.List([in_numseg(), @arith.add1(), @arith.le_refl(), @arith.le_0()]),
  )
  let t1999 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1998 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1997 = @simp.rewrite_tac(@list.List([@arith.suc_sub1()]))
  let t1995 = @term_syntax.parse_term("FINITE((s : (_) -> Bool)) && CARD(s) <= (n : Num) → FINITE(INSERT((r : _), s)) && CARD(INSERT(r, s)) <= SUC(n)")
  let t1996 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([
        @sets.finite_insert(),
        @sets.card_clauses(),
        @int.arith_rule(
          @term_syntax.parse_term("(x : Num) <= (n : Num) → SUC(x) <= SUC(n) && x <= SUC(n)"),
        ),
      ]),
      t1995,
    ),
  )
  let t1994 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | x == (c : _) || (P : (_) -> Bool)(x)} == INSERT(c, {(x : _) | P(x)})"),
      ),
    ]),
  )
  let t1993 = @tactics.disch_then(fn(
    x1991 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1991
    @simp.rewrite_tac(
      @list.List([th, @realarith.real_entire(), @realarith.real_sub_0()]),
    )
  })
  let t1990 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      @real.real_sub_rzero(),
    ]),
  )
  let t1985 = @term_syntax.parse_term("SUC((n : Num))")
  let t1986 = @term_syntax.parse_term("(r : Real)")
  let t1987 = @term_syntax.parse_term("(x : Real)")
  let t1988 = @bool.ispecl(
    @list.List([@term_syntax.parse_term("(c : (Num) -> Real)"), t1987, t1986, t1985]),
    real_sub_polyfun(),
  )
  let t1989 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(x : Real)"), t1988))
  let t1984 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Real)"))
  let t1983 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1980 = @simp.gen_rewrite_rule(
    fn(
      x1979 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1979
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t1982 = @tactics.first_x_assum(fn(
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
    (fn(
      x1976 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1977 = @tactics.mp_tac(x1976)
      fn(
        x1978 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1977(x1978)
      }
    })(t1980(x1981))
  })
  let t1975 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_rules(), @sets.card_clauses(), @arith.le_0()]),
  )
  let t2003 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @class.asm_cases_tac(
                                    @term_syntax.parse_term("{(x : Real) | sum(op_dot_dot(0, SUC((n : Num))), (i : Num) => (c : (Num) -> Real)(i) * pow(x, i)) == real_of_num(0)} == {}"),
                                  ),
                                  t1975,
                                ),
                                t1982,
                              ),
                              t1983,
                            ),
                            t1984,
                          ),
                          @tactics.disch_tac,
                        ),
                        t1989,
                      ),
                      t1990,
                    ),
                    t1993,
                  ),
                  t1994,
                ),
                t1996,
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
  )
  let t1974 = @meson.asm_meson_tac(@list.List([in_numseg(), @arith.le()]))
  let t1973 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1972 = @simp.rewrite_tac(
    @list.List([@arith.le(), @theorems.left_or_distrib()]),
  )
  let t2004 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_simp_tac(
              @list.List([
                sum_clauses_numseg(),
                @arith.le_0(),
                @calc_int.real_mul_lzero(),
                @calc_int.real_add_rid(),
              ]),
            ),
            t1972,
          ),
          @tactics.disj2_tac,
        ),
        t1973,
      ),
      t1974,
    ),
    t2003,
  ])
  let t1971 = @class.asm_cases_tac(
    @term_syntax.parse_term("(c : (Num) -> Real)(SUC((n : Num))) == real_of_num(0)"),
  )
  let t1970 = @simp.rewrite_tac(@list.List([in_numseg()]))
  let t2005 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Real)")),
          t1970,
        ),
        @tactics.disch_tac,
      ),
      t1971,
    ),
    t2004,
  )
  let t1969 = @simp.simp_tac(
    @list.List([
      @realax.real_pow(),
      @realarith.real_mul_rid(),
      @sets.empty_gspec(),
      @sets.card_clauses(),
      @sets.finite_empty(),
      @arith.le_refl(),
    ]),
  )
  let t2006 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          numseg_sing(),
          @sets.in_sing(),
          @theorems.unwind_thm2(),
          sum_clauses_numseg(),
        ]),
      ),
      t1969,
    ),
    t2005,
  ])
  let t2007 = @tactics.thenl(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp()])),
      @nums.induct_tac,
    ),
    t2006,
  )
  real_polyfun_rootbound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Real, !(∀ i : Num, IN(i, op_dot_dot(0, n)) → c(i) == real_of_num(0)) → FINITE({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) && CARD({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) <= n"),
      t2007,
    ),
  )
}

///|
let real_polyfun_rootbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLYFUN_ROOTBOUND",
)

///|
/// `REAL_POLYFUN_ROOTBOUND`
pub fn real_polyfun_rootbound() -> @kernel.Thm {
  real_polyfun_rootbound_c.get()
}

///|
/// REAL_POLYFUN_FINITE_ROOTS
fn step_322() -> Unit raise {
  let t2013 = @equal.gsym(@sets.infinite())
  let t2014 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(x : Real) | true} == UNIV")),
      @sets.real_infinite(),
      t2013,
    ]),
  )
  let t2012 = @simp.simp_tac(@list.List([@calc_int.real_mul_lzero(), sum_0()]))
  let t2011 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2010 = @simp.simp_tac(@list.List([real_polyfun_rootbound()]))
  let t2009 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.not_forall_thm())]),
  )
  let t2008 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && !(b : Bool)) == !(a → b)"))]),
  )
  let t2015 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2008),
              t2009,
            ),
            @tactics.eq_tac,
          ),
          t2010,
        ),
        t2011,
      ),
      t2012,
    ),
    t2014,
  )
  real_polyfun_finite_roots_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Real, FINITE({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) == (∃ i : Num, IN(i, op_dot_dot(0, n)) && !(c(i) == real_of_num(0)))"),
      t2015,
    ),
  )
}

///|
let real_polyfun_finite_roots_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLYFUN_FINITE_ROOTS",
)

///|
/// `REAL_POLYFUN_FINITE_ROOTS`
pub fn real_polyfun_finite_roots() -> @kernel.Thm {
  real_polyfun_finite_roots_c.get()
}

///|
/// REAL_POLYFUN_EQ_0
fn step_323() -> Unit raise {
  let t2025 = @simp.asm_simp_tac(
    @list.List([in_numseg(), @arith.le_0(), @calc_int.real_mul_lzero(), sum_0()]),
  )
  let t2023 = @sets.set_rule(@term_syntax.parse_term("{(x : Real) | true} == UNIV"))
  let t2024 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.real_infinite(),
      @equal.gsym(@sets.infinite()),
      @class.de_morgan_thm(),
      t2023,
    ]),
  )
  let t2020 = @drule.match_mp(real_polyfun_rootbound())
  let t2022 = @tactics.disch_then(fn(
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
    (fn(
      x2017 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2018 = @tactics.mp_tac(x2017)
      fn(
        x2019 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2018(x2019)
      }
    })(t2020(x2021))
  })
  let t2026 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.gen_rewrite_tac(
          fn(
            x2016 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x2016
          },
          @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == !!p"))]),
        ),
        t2022,
      ),
      t2024,
    ),
    t2025,
  ])
  let t2027 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t2026,
  )
  real_polyfun_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Real, (∀ x : Real, sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)) == (∀ i : Num, IN(i, op_dot_dot(0, n)) → c(i) == real_of_num(0))"),
      t2027,
    ),
  )
}

///|
let real_polyfun_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLYFUN_EQ_0",
)

///|
/// `REAL_POLYFUN_EQ_0`
pub fn real_polyfun_eq_0() -> @kernel.Thm {
  real_polyfun_eq_0_c.get()
}

///|
/// REAL_POLYFUN_EQ_CONST
fn step_324() -> Unit raise {
  let t2039 = @meson.meson_tac(@list.List([@arith.le_1()]))
  let t2038 = @simp.simp_tac(
    @list.List([@arith.le_0(), @realarith.real_sub_0()]),
  )
  let t2037 = @simp.gen_rewrite_tac(
    fn(
      x2034 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2035 = @equal.land_conv(x2034)
      fn(x2036 : @kernel.Term) -> @kernel.Thm raise { s2035(x2036) }
    },
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (∀ n : Num, !(n == 0) → P(n)))"),
      ),
    ]),
  )
  let t2040 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([real_polyfun_eq_0(), in_numseg(), @arith.le_0()]),
        ),
        t2037,
      ),
      t2038,
    ),
    t2039,
  )
  let t2033 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t2032 = @simp.rewrite_tac(@list.List([in_numseg()]))
  let t2031 = @tactics.match_mp_tac(sum_eq())
  let t2030 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((c : Real) - (k : Real) + (s : Real) == real_of_num(0)) == (c + s == k)")),
    ]),
  )
  let t2041 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
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
                              sum_clauses_left(),
                              @arith.le_0(),
                              @realax.real_pow(),
                              @realarith.real_mul_rid(),
                            ]),
                          ),
                          t2030,
                        ),
                        @tactics.ap_term_tac,
                      ),
                      @tactics.abs_tac,
                    ),
                    @tactics.ap_thm_tac,
                  ),
                  @tactics.ap_term_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t2031,
            ),
            @tactics.gen_tac,
          ),
          t2032,
        ),
        @class.cond_cases_tac,
      ),
      t2033,
    ),
    t2040,
  ])
  let t2029 = @tactics.exists_tac(
    @term_syntax.parse_term("∀ x : Real, sum(op_dot_dot(0, (n : Num)), (i : Num) => (if i == 0 { (c : (Num) -> Real)(0) - (k : Real) } else { c(i) }) * pow(x, i)) == real_of_num(0)"),
  )
  let t2028 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2042 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2028),
        t2029,
      ),
      @tactics.conj_tac,
    ),
    t2041,
  )
  real_polyfun_eq_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ c : (Num) -> Real, ∀ k : Real, (∀ x : Real, sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == k) == (c(0) == k && (∀ i : Num, IN(i, op_dot_dot(1, n)) → c(i) == real_of_num(0)))"),
      t2042,
    ),
  )
}

///|
let real_polyfun_eq_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLYFUN_EQ_CONST",
)

///|
/// `REAL_POLYFUN_EQ_CONST`
pub fn real_polyfun_eq_const() -> @kernel.Thm {
  real_polyfun_eq_const_c.get()
}

///|
/// polynomial_function
fn step_325() -> Unit raise {
  polynomial_function_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(polynomial_function : ((Real) -> Real) -> Bool)((p : (Real) -> Real)) == (∃ m : Num, ∃ c : (Num) -> Real, ∀ x : Real, p(x) == sum(op_dot_dot(0, m), (i : Num) => c(i) * pow(x, i)))"),
    ),
  )
}

///|
let polynomial_function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "polynomial_function",
)

///|
/// `polynomial_function`
pub fn polynomial_function() -> @kernel.Thm {
  polynomial_function_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_CONST
fn step_326() -> Unit raise {
  let t2048 = @simp.rewrite_tac(
    @list.List([
      sum_sing_numseg(),
      @realax.real_pow(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t2046 = @term_syntax.parse_term("(i : Num) => (c : Real)")
  let t2047 = @tactics.map_every(
    fn(
      x2043 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2044 = @tactics.exists_tac(x2043)
      fn(
        x2045 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2044(x2045)
      }
    },
    @list.List([@term_syntax.parse_term("0"), t2046]),
  )
  let t2049 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([polynomial_function()])),
      ),
      t2047,
    ),
    t2048,
  )
  polynomial_function_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, polynomial_function((x : Real) => c)"),
      t2049,
    ),
  )
}

///|
let polynomial_function_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_CONST",
)

///|
/// `POLYNOMIAL_FUNCTION_CONST`
pub fn polynomial_function_const() -> @kernel.Thm {
  polynomial_function_const_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_ID
fn step_327() -> Unit raise {
  let t2055 = @simp.rewrite_tac(
    @list.List([sum_clauses_numseg(), @arith.le_0(), @calc_num.arith()]),
  )
  let t2053 = @term_syntax.parse_term("(i : Num) => if i == 1 { real_of_num(1) } else { real_of_num(0) }")
  let t2054 = @tactics.map_every(
    fn(
      x2050 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2051 = @tactics.exists_tac(x2050)
      fn(
        x2052 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2051(x2052)
      }
    },
    @list.List([@term_syntax.parse_term("SUC(0)"), t2053]),
  )
  let t2056 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([polynomial_function()])),
        t2054,
      ),
      t2055,
    ),
    @calc_rat.real_arith_tac,
  )
  polynomial_function_id_c.set(
    @tactics.prove(@term_syntax.parse_term("polynomial_function((x : Real) => x)"), t2056),
  )
}

///|
let polynomial_function_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_ID",
)

///|
/// `POLYNOMIAL_FUNCTION_ID`
pub fn polynomial_function_id() -> @kernel.Thm {
  polynomial_function_id_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_I
fn step_328() -> Unit raise {
  let t2057 = @simp.rewrite_tac(
    @list.List([@trivia.i_def(), polynomial_function_id()]),
  )
  polynomial_function_i_c.set(
    @tactics.prove(@term_syntax.parse_term("polynomial_function(I)"), t2057),
  )
}

///|
let polynomial_function_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_I",
)

///|
/// `POLYNOMIAL_FUNCTION_I`
pub fn polynomial_function_i() -> @kernel.Thm {
  polynomial_function_i_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_ADD
fn step_329() -> Unit raise {
  let t2070 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), in_numseg()]),
  )
  let t2069 = @simp.rewrite_tac(@list.List([]))
  let t2068 = @simp.rewrite_tac(@list.List([@equal.gsym(sum_restrict_set())]))
  let t2067 = @simp.rewrite_tac(
    @list.List([
      @class.cond_rand(),
      @class.cond_rator(),
      @calc_int.real_mul_lzero(),
    ]),
  )
  let t2066 = @simp.rewrite_tac(
    @list.List([@real.real_add_rdistrib(), sum_add_numseg()]),
  )
  let t2065 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : Num) => (if i <= (m : Num) { (a : (Num) -> Real)(i) } else { real_of_num(0) }) + (if i <= (n : Num) { (b : (Num) -> Real)(i) } else { real_of_num(0) })"),
  )
  let t2064 = @tactics.exists_tac(@term_syntax.parse_term("MAX((m : Num), (n : Num))"))
  let t2063 = @simp.asm_rewrite_tac(@list.List([]))
  let t2061 = @term_syntax.parse_term("(b : (Num) -> Real)")
  let t2062 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t2061]),
  )
  let t2059 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t2060 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t2059]),
  )
  let t2058 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      polynomial_function(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t2071 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
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
                                    t2058,
                                  ),
                                  t2060,
                                ),
                                @tactics.strip_tac,
                              ),
                              t2062,
                            ),
                            @tactics.strip_tac,
                          ),
                          t2063,
                        ),
                        t2064,
                      ),
                      t2065,
                    ),
                    @tactics.gen_tac,
                  ),
                  t2066,
                ),
                t2067,
              ),
              t2068,
            ),
            @tactics.binop_tac,
          ),
          @tactics.binop_tac,
        ),
        t2069,
      ),
      t2070,
    ),
    @int.arith_tac,
  )
  polynomial_function_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) → polynomial_function((x : Real) => p(x) + q(x))"),
      t2071,
    ),
  )
}

///|
let polynomial_function_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_ADD",
)

///|
/// `POLYNOMIAL_FUNCTION_ADD`
pub fn polynomial_function_add() -> @kernel.Thm {
  polynomial_function_add_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_LMUL
fn step_330() -> Unit raise {
  let t2080 = @simp.asm_rewrite_tac(
    @list.List([sum_lmul(), @equal.gsym(@realax.real_mul_assoc())]),
  )
  let t2078 = @term_syntax.parse_term("(i : Num) => (c : Real) * (a : (Num) -> Real)(i)")
  let t2079 = @tactics.map_every(
    fn(
      x2075 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2076 = @tactics.exists_tac(x2075)
      fn(
        x2077 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2076(x2077)
      }
    },
    @list.List([@term_syntax.parse_term("(n : Num)"), t2078]),
  )
  let t2073 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t2074 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t2073]),
  )
  let t2072 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      polynomial_function(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t2081 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2072),
          t2074,
        ),
        @tactics.strip_tac,
      ),
      t2079,
    ),
    t2080,
  )
  polynomial_function_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ c : Real, polynomial_function(p) → polynomial_function((x : Real) => c * p(x))"),
      t2081,
    ),
  )
}

///|
let polynomial_function_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_LMUL",
)

///|
/// `POLYNOMIAL_FUNCTION_LMUL`
pub fn polynomial_function_lmul() -> @kernel.Thm {
  polynomial_function_lmul_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_RMUL
fn step_331() -> Unit raise {
  let t2082 = @simp.rewrite_tac(@list.List([polynomial_function_lmul()]))
  let t2083 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t2082,
  )
  polynomial_function_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ c : Real, polynomial_function(p) → polynomial_function((x : Real) => p(x) * c)"),
      t2083,
    ),
  )
}

///|
let polynomial_function_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_RMUL",
)

///|
/// `POLYNOMIAL_FUNCTION_RMUL`
pub fn polynomial_function_rmul() -> @kernel.Thm {
  polynomial_function_rmul_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_NEG
fn step_332() -> Unit raise {
  let t2093 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @realax.real_mul_lid(),
      @class.eta_ax(),
      @calc_int.real_neg_neg(),
    ]),
  )
  let t2090 = @drule.match_mp(polynomial_function_lmul())
  let t2087 = @term_syntax.parse_term("-real_of_num(1)")
  let t2092 = @tactics.disch_then(fn(
    x2091 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2089 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
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
        let s2085 = @tactics.mp_tac(x2084)
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
      })(((x2088 : @kernel.Thm) => @bool.spec(t2087, x2088))(x2089))
    })(t2090(x2091))
  })
  let t2094 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      t2092,
    ),
    t2093,
  )
  polynomial_function_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, polynomial_function((x : Real) => -p(x)) == polynomial_function(p)"),
      t2094,
    ),
  )
}

///|
let polynomial_function_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_NEG",
)

///|
/// `POLYNOMIAL_FUNCTION_NEG`
pub fn polynomial_function_neg() -> @kernel.Thm {
  polynomial_function_neg_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_SUB
fn step_333() -> Unit raise {
  let t2095 = @simp.simp_tac(
    @list.List([
      @realax.real_sub(),
      polynomial_function_neg(),
      polynomial_function_add(),
    ]),
  )
  polynomial_function_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) → polynomial_function((x : Real) => p(x) - q(x))"),
      t2095,
    ),
  )
}

///|
let polynomial_function_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_SUB",
)

///|
/// `POLYNOMIAL_FUNCTION_SUB`
pub fn polynomial_function_sub() -> @kernel.Thm {
  polynomial_function_sub_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_MUL
fn step_334() -> Unit raise {
  let t2133 = @simp.rewrite_tac(
    @list.List([@real.real_pow_add(), @realax.real_mul_assoc(), sum_rmul()]),
  )
  let t2132 = @simp.asm_rewrite_tac(
    @list.List([
      @bool.spec(@term_syntax.parse_term("1"), sum_offset()),
      @arith.add_eq_0(),
      @calc_num.arith_eq(),
      @arith.add_sub(),
    ]),
  )
  let t2131 = @simp.simp_tac(@list.List([sum_clauses_left(), @arith.le_0()]))
  let t2130 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : Num) => if i == 0 { real_of_num(0) } else { (a : (Num) -> Real)(i - 1) }"),
  )
  let t2129 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t2127 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t2128 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t2127]),
  )
  let t2126 = @simp.rewrite_tac(
    @list.List([polynomial_function(), @theorems.left_imp_exists_thm()]),
  )
  let t2125 = @simp.asm_rewrite_tac(@list.List([]))
  let t2124 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.fun_eq_thm()])),
  )
  let t2123 = @simp.abbrev_tac(
    @term_syntax.parse_term("(q : (Real) -> Real) == ((x : Real) => (p : (Real) -> Real)(x) * sum(op_dot_dot(0, (m : Num)), (i : Num) => (c : (Num) -> Real)(i + 1) * pow(x, i)))"),
  )
  let t2119 = @term_syntax.parse_term("(i : Num) => (c : (Num) -> Real)(i + 1)")
  let t2122 = @tactics.first_x_assum(fn(
    x2121 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s2117 = @tactics.mp_tac(x2116)
      fn(
        x2118 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2117(x2118)
      }
    })(((x2120 : @kernel.Thm) => @bool.spec(t2119, x2120))(x2121))
  })
  let t2115 = @simp.rewrite_tac(
    @list.List([
      @real.real_pow_add(),
      @real.real_pow_1(),
      @realax.real_mul_assoc(),
      sum_rmul(),
    ]),
  )
  let t2114 = @simp.rewrite_tac(
    @list.List([@bool.spec(@term_syntax.parse_term("1"), sum_offset())]),
  )
  let t2113 = @simp.asm_simp_tac(@list.List([polynomial_function_rmul()]))
  let t2112 = @tactics.match_mp_tac(polynomial_function_add())
  let t2111 = @simp.rewrite_tac(
    @list.List([@realax.real_add_ldistrib(), @realax.real_pow()]),
  )
  let t2110 = @simp.simp_tac(
    @list.List([sum_clauses_left(), @arith.le_0(), @arith.add1()]),
  )
  let t2109 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Real)"))
  let t2108 = @simp.asm_simp_tac(
    @list.List([
      sum_sing_numseg(),
      @realax.real_pow(),
      polynomial_function_rmul(),
    ]),
  )
  let t2107 = @simp.rewrite_tac(
    @list.List([@theorems.left_forall_imp_thm(), @theorems.exists_refl()]),
  )
  let t2106 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.fun_eq_thm())]),
  )
  let t2105 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ q : _, ∀ m : _, ∀ c : _, (P : (_, _, _) -> Bool)(q, m, c)) == (∀ m : _, ∀ c : _, ∀ q : _, P(q, m, c))"),
      ),
    ]),
  )
  let t2104 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2103 = @simp.gen_rewrite_tac(
    fn(
      x2102 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2096 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2097 = @equal.binder_conv(x2096)
        fn(x2098 : @kernel.Term) -> @kernel.Thm raise { s2097(x2098) }
      })(
        (fn(
          x2099 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2100 = @equal.land_conv(x2099)
          fn(x2101 : @kernel.Term) -> @kernel.Thm raise { s2100(x2101) }
        })(x2102),
      )
    },
    @list.List([polynomial_function()]),
  )
  let t2134 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
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
                                                        t2103,
                                                      ),
                                                      t2104,
                                                    ),
                                                    t2105,
                                                  ),
                                                  t2106,
                                                ),
                                                t2107,
                                              ),
                                              @nums.induct_tac,
                                            ),
                                            t2108,
                                          ),
                                          t2109,
                                        ),
                                        t2110,
                                      ),
                                      t2111,
                                    ),
                                    t2112,
                                  ),
                                  t2113,
                                ),
                                t2114,
                              ),
                              t2115,
                            ),
                            t2122,
                          ),
                          t2123,
                        ),
                        t2124,
                      ),
                      t2125,
                    ),
                    t2126,
                  ),
                  t2128,
                ),
                @tactics.strip_tac,
              ),
              t2129,
            ),
            t2130,
          ),
          t2131,
        ),
        t2132,
      ),
      t2133,
    ),
    @calc_rat.real_arith_tac,
  )
  polynomial_function_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) → polynomial_function((x : Real) => p(x) * q(x))"),
      t2134,
    ),
  )
}

///|
let polynomial_function_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_MUL",
)

///|
/// `POLYNOMIAL_FUNCTION_MUL`
pub fn polynomial_function_mul() -> @kernel.Thm {
  polynomial_function_mul_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_SUM
fn step_335() -> Unit raise {
  let t2137 = @simp.simp_tac(
    @list.List([@sets.forall_in_insert(), polynomial_function_add()]),
  )
  let t2136 = @simp.simp_tac(
    @list.List([sum_clauses(), polynomial_function_const()]),
  )
  let t2135 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2138 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
        ),
        t2135,
      ),
      t2136,
    ),
    t2137,
  )
  polynomial_function_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (Real, A) -> Real, FINITE(s) && (∀ i : A, IN(i, s) → polynomial_function((x : Real) => p(x, i))) → polynomial_function((x : Real) => sum(s, p(x)))"),
      t2138,
    ),
  )
}

///|
let polynomial_function_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_SUM",
)

///|
/// `POLYNOMIAL_FUNCTION_SUM`
pub fn polynomial_function_sum() -> @kernel.Thm {
  polynomial_function_sum_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_POW
fn step_336() -> Unit raise {
  let t2139 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_pow(),
      polynomial_function_const(),
      polynomial_function_mul(),
    ]),
  )
  let t2140 = @tactics.then_tac(
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
    t2139,
  )
  polynomial_function_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ n : Num, polynomial_function(p) → polynomial_function((x : Real) => pow(p(x), n))"),
      t2140,
    ),
  )
}

///|
let polynomial_function_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_POW",
)

///|
/// `POLYNOMIAL_FUNCTION_POW`
pub fn polynomial_function_pow() -> @kernel.Thm {
  polynomial_function_pow_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_INDUCT
fn step_337() -> Unit raise {
  let t2151 = @simp.asm_simp_tac(@list.List([]))
  let t2150 = @simp.rewrite_tac(
    @list.List([
      @real.real_pow_add(),
      @real.real_pow_1(),
      @realax.real_mul_assoc(),
      sum_rmul(),
    ]),
  )
  let t2149 = @simp.rewrite_tac(
    @list.List([@bool.spec(@term_syntax.parse_term("1"), sum_offset())]),
  )
  let t2148 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t2147 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2146 = @simp.simp_tac(
    @list.List([sum_clauses_left(), @arith.add1(), @arith.le_0()]),
  )
  let t2145 = @simp.asm_rewrite_tac(
    @list.List([sum_sing_numseg(), @realax.real_pow()]),
  )
  let t2144 = @simp.simp_tac(
    @list.List([@theorems.left_forall_imp_thm(), @theorems.exists_refl()]),
  )
  let t2143 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.fun_eq_thm())]),
  )
  let t2142 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ q : _, ∀ m : _, ∀ c : _, (P : (_, _, _) -> Bool)(q, m, c)) == (∀ m : _, ∀ c : _, ∀ q : _, P(q, m, c))"),
      ),
    ]),
  )
  let t2141 = @simp.rewrite_tac(
    @list.List([polynomial_function(), @theorems.left_imp_exists_thm()]),
  )
  let t2152 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.gen_tac, @tactics.strip_tac,
                            ),
                            t2141,
                          ),
                          t2142,
                        ),
                        t2143,
                      ),
                      t2144,
                    ),
                    @nums.induct_tac,
                  ),
                  t2145,
                ),
                @tactics.gen_tac,
              ),
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
  )
  polynomial_function_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((Real) -> Real) -> Bool, P((x : Real) => x) && (∀ c : Real, P((x : Real) => c)) && (∀ p : (Real) -> Real, ∀ q : (Real) -> Real, P(p) && P(q) → P((x : Real) => p(x) + q(x))) && (∀ p : (Real) -> Real, ∀ q : (Real) -> Real, P(p) && P(q) → P((x : Real) => p(x) * q(x))) → (∀ p : (Real) -> Real, polynomial_function(p) → P(p))"),
      t2152,
    ),
  )
}

///|
let polynomial_function_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_INDUCT",
)

///|
/// `POLYNOMIAL_FUNCTION_INDUCT`
pub fn polynomial_function_induct() -> @kernel.Thm {
  polynomial_function_induct_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_o
fn step_338() -> Unit raise {
  let t2156 = @simp.asm_rewrite_tac(
    @list.List([@class.eta_ax(), polynomial_function_const()]),
  )
  let t2155 = @simp.simp_tac(
    @list.List([
      @trivia.o_def(),
      polynomial_function_add(),
      polynomial_function_mul(),
    ]),
  )
  let t2154 = @tactics.match_mp_tac(polynomial_function_induct())
  let t2153 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj_alt(), @theorems.right_forall_imp_thm()]),
  )
  let t2157 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])),
              t2153,
            ),
            @tactics.gen_tac,
          ),
          @tactics.disch_tac,
        ),
        t2154,
      ),
      t2155,
    ),
    t2156,
  )
  polynomial_function_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) → polynomial_function(o(p, q))"),
      t2157,
    ),
  )
}

///|
let polynomial_function_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_o",
)

///|
/// `POLYNOMIAL_FUNCTION_o`
pub fn polynomial_function_o() -> @kernel.Thm {
  polynomial_function_o_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_FINITE_ROOTS
fn step_339() -> Unit raise {
  let t2164 = @simp.rewrite_tac(
    @list.List([@calc_int.real_mul_lzero(), sum_0()]),
  )
  let t2163 = @simp.simp_tac(
    @list.List([
      @class.not_exists_thm(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && !(q : Bool)) == (p → q)")),
    ]),
  )
  let t2165 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([real_polyfun_finite_roots()])),
      t2163,
    ),
    t2164,
  )
  let t2166 = @list.List([
    @simp.simp_tac(
      @list.List([
        @sets.univ_gspec(),
        @equal.gsym(@sets.infinite()),
        @sets.real_infinite(),
      ]),
    ),
    t2165,
  ])
  let t2162 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2161 = @simp.rewrite_tac(@list.List([polynomial_function()]))
  let t2160 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ p : (Real) -> Real, polynomial_function(p) → FINITE({(x : Real) | p(x) == real_of_num(0)}) == !(∀ x : Real, p(x) == real_of_num(0))"),
    fn(
      x2158 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x2158
      @simp.simp_tac(
        @list.List([th, polynomial_function_sub(), polynomial_function_const()]),
      )
    },
  )
  let t2167 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.once_rewrite_tac(
                  @list.List([@equal.gsym(@realarith.real_sub_0())]),
                ),
                t2160,
              ),
              @tactics.gen_tac,
            ),
            t2161,
          ),
          @tactics.strip_tac,
        ),
        @tactics.eq_tac,
      ),
      t2162,
    ),
    t2166,
  )
  polynomial_function_finite_roots_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Real) -> Real, ∀ a : Real, polynomial_function(p) → FINITE({(x : Real) | p(x) == a}) == !(∀ x : Real, p(x) == a)"),
      t2167,
    ),
  )
}

///|
let polynomial_function_finite_roots_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_FINITE_ROOTS",
)

///|
/// `POLYNOMIAL_FUNCTION_FINITE_ROOTS`
pub fn polynomial_function_finite_roots() -> @kernel.Thm {
  polynomial_function_finite_roots_c.get()
}

///|
/// iterate.ml:3112
fn step_340() -> Unit raise {
  @realax.prioritize_num(())
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
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
  step_298()
  step_299()
  step_300()
  step_301()
  step_302()
  step_303()
  step_304()
  step_305()
  step_306()
  step_307()
  step_308()
  step_309()
  step_310()
  step_311()
  step_312()
  step_313()
  step_314()
  step_315()
  step_316()
  step_317()
  step_318()
  step_319()
  step_320()
  step_321()
  step_322()
  step_323()
  step_324()
  step_325()
  step_326()
  step_327()
  step_328()
  step_329()
  step_330()
  step_331()
  step_332()
  step_333()
  step_334()
  step_335()
  step_336()
  step_337()
  step_338()
  step_339()
  step_340()
}
